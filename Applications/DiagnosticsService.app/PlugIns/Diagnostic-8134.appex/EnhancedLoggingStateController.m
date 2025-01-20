@interface EnhancedLoggingStateController
- (EnhancedLoggingStateInputs)inputs;
- (id)aggregateMetadata;
- (id)createQueueEntryInputDictionary:(id)a3;
- (id)formatNewQueueEntries:(BOOL *)a3;
- (void)addAppleAccount:(id)a3;
- (void)addDeviceSerialNumber:(id)a3;
- (void)addDeviceType:(id)a3;
- (void)addEnrollmentTicketNumber:(id)a3;
- (void)addPayload:(id)a3;
- (void)addServerSuppliedMetadata:(id)a3;
- (void)enrollWithFlush:(BOOL)a3 commit:(BOOL)a4;
- (void)finishWithStatusCode:(id)a3 metadata:(id)a4;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)unenroll;
- (void)updateEnhancedLoggingStateWithNewQueueEntries:(id)a3 commit:(BOOL)a4;
@end

@implementation EnhancedLoggingStateController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  v3 = +[ELSManager sharedManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004CAC;
  v4[3] = &unk_1000082A0;
  v4[4] = self;
  [v3 refreshWithCompletion:v4];
}

- (void)finishWithStatusCode:(id)a3 metadata:(id)a4
{
  id v15 = a3;
  if (a4)
  {
    id v6 = a4;
    v7 = [(EnhancedLoggingStateController *)self result];
    v8 = [v7 data];
    if (v8)
    {
      v9 = [(EnhancedLoggingStateController *)self result];
      v10 = [v9 data];
      id v11 = [v10 mutableCopy];
    }
    else
    {
      id v11 = +[NSMutableDictionary dictionary];
    }

    [v11 setObject:v6 forKeyedSubscript:ELSDefaultMetadata];
    v12 = +[NSDictionary dictionaryWithDictionary:v11];
    v13 = [(EnhancedLoggingStateController *)self result];
    [v13 setData:v12];
  }
  v14 = [(EnhancedLoggingStateController *)self result];
  [v14 setStatusCode:v15];

  [(EnhancedLoggingStateController *)self setFinished:1];
}

- (void)enrollWithFlush:(BOOL)a3 commit:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = +[ELSManager sharedManager];
  v8 = [v7 snapshot];
  id v9 = [v8 status];

  BOOL v13 = (unint64_t)v9 < 2;
  if ((unint64_t)v9 >= 2)
  {
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100005F80();
    }

    [(EnhancedLoggingStateController *)self finishWithStatusCode:&off_100008498 metadata:0];
    id v11 = 0;
  }
  else
  {
    if (v5)
    {
      v10 = +[ELSManager sharedManager];
      [v10 flush];
    }
    id v11 = [(EnhancedLoggingStateController *)self formatNewQueueEntries:&v13];
    if (v13) {
      [(EnhancedLoggingStateController *)self updateEnhancedLoggingStateWithNewQueueEntries:v11 commit:v4];
    }
  }
}

- (void)unenroll
{
  v3 = +[ELSManager sharedManager];
  BOOL v4 = [v3 snapshot];
  id v5 = [v4 status];

  if (v5)
  {
    id v6 = +[ELSManager sharedManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005144;
    v8[3] = &unk_100008308;
    v8[4] = self;
    [v6 transactionWithBlock:&stru_1000082E0 completion:v8];
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005FB4();
    }

    [(EnhancedLoggingStateController *)self finishWithStatusCode:&off_1000084C8 metadata:0];
  }
}

- (id)formatNewQueueEntries:(BOOL *)a3
{
  id v5 = +[ELSManager sharedManager];
  id v6 = [v5 snapshot];
  v7 = [v6 queue];

  v8 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [(EnhancedLoggingStateController *)self inputs];
  v10 = [v9 queue];

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(EnhancedLoggingStateController *)self createQueueEntryInputDictionary:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        if ([v7 containsObject:v15])
        {
          v16 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100005FE8(v15, v16);
          }

          [(EnhancedLoggingStateController *)self finishWithStatusCode:&off_1000084E0 metadata:0];
          *a3 = 0;
LABEL_14:

          goto LABEL_15;
        }
        if (!*a3) {
          goto LABEL_14;
        }
        [v8 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  v17 = +[NSArray arrayWithArray:v8];

  return v17;
}

- (id)createQueueEntryInputDictionary:(id)a3
{
  uint64_t v4 = ELSSubDefaultQueueEntryType;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  v7 = [v5 objectForKeyedSubscript:ELSParameterPayload];
  v8 = [v5 objectForKeyedSubscript:ELSSubDefaultQueueEntryExecuteAfterDuration];
  id v9 = [v5 objectForKeyedSubscript:ELSSubDefaultQueueEntryRetry];
  v33 = [v5 objectForKeyedSubscript:ELSSubDefaultQueueEntryPlatform];

  v10 = +[ELSWhitelist findEntryForParameterName:v6];
  id v11 = [v10 bundleIdentifier];
  id v12 = +[NSMutableDictionary dictionary];
  if (v7)
  {
    v32 = v8;
    uint64_t v13 = v7;
    v14 = [(EnhancedLoggingStateController *)self inputs];
    id v15 = [v14 parameterPayloads];

    if (v15)
    {
      v16 = [(EnhancedLoggingStateController *)self inputs];
      v17 = [v16 parameterPayloads];
      v18 = [v17 objectForKeyedSubscript:v13];

      if (v18) {
        [v12 addEntriesFromDictionary:v18];
      }
    }
    long long v19 = [(EnhancedLoggingStateController *)self inputs];
    long long v20 = [v19 specificationPayloads];

    v7 = v13;
    v8 = v32;
    if (v20)
    {
      long long v21 = [(EnhancedLoggingStateController *)self inputs];
      long long v22 = [v21 specificationPayloads];
      v23 = [v22 objectForKeyedSubscript:v7];

      if (v23) {
        [v12 addEntriesFromDictionary:v23];
      }
    }
  }
  if (v8)
  {
    [v8 doubleValue];
    double v25 = v24;
    if (v9)
    {
LABEL_12:
      id v26 = [v9 BOOLValue];
      goto LABEL_15;
    }
  }
  else
  {
    double v25 = 0.0;
    if (v9) {
      goto LABEL_12;
    }
  }
  id v26 = [v10 retry];
LABEL_15:
  id v27 = v26;
  id v28 = objc_alloc((Class)ELSQueueEntry);
  v29 = +[NSDictionary dictionaryWithDictionary:v12];
  id v30 = [v28 initWithType:v11 typeName:v6 parameters:v29 executeAfterDuration:v27 retry:v33 platform:v25];

  return v30;
}

- (void)updateEnhancedLoggingStateWithNewQueueEntries:(id)a3 commit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  v7 = +[ELSManager sharedManager];
  v8 = [v7 snapshot];
  id v9 = [v8 queue];
  if ([v9 count])
  {

LABEL_5:
    id v11 = +[ELSManager sharedManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005800;
    v14[3] = &unk_100008330;
    BOOL v17 = v4;
    id v15 = v6;
    v16 = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000598C;
    v13[3] = &unk_100008308;
    v13[4] = self;
    [v11 transactionWithBlock:v14 completion:v13];

    goto LABEL_6;
  }
  id v10 = [v6 count];

  if (v10) {
    goto LABEL_5;
  }
  id v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100006080();
  }

  [(EnhancedLoggingStateController *)self finishWithStatusCode:&off_1000084F8 metadata:0];
LABEL_6:
}

- (id)aggregateMetadata
{
  v3 = +[NSMutableDictionary dictionary];
  [(EnhancedLoggingStateController *)self addDeviceSerialNumber:v3];
  [(EnhancedLoggingStateController *)self addDeviceType:v3];
  [(EnhancedLoggingStateController *)self addEnrollmentTicketNumber:v3];
  [(EnhancedLoggingStateController *)self addAppleAccount:v3];
  [(EnhancedLoggingStateController *)self addServerSuppliedMetadata:v3];
  [(EnhancedLoggingStateController *)self addPayload:v3];
  BOOL v4 = +[NSDictionary dictionaryWithDictionary:v3];

  return v4;
}

- (void)addDeviceSerialNumber:(id)a3
{
  id v4 = a3;
  v3 = (void *)MGCopyAnswer();
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:ELSMetadataDeviceSerialNumber];
  }
}

- (void)addDeviceType:(id)a3
{
  id v4 = a3;
  v3 = (void *)MGCopyAnswer();
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:ELSMetadataDeviceType];
  }
}

- (void)addEnrollmentTicketNumber:(id)a3
{
  id v6 = a3;
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Diagnostics"];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:@"currentTicketNumber"];
    if (v5) {
      [v6 setObject:v5 forKeyedSubscript:ELSMetadataEnrollmentTicketNumber];
    }
  }
}

- (void)addAppleAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)ACAccountStore);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 aa_primaryAppleAccount];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 username];

      if (v8)
      {
        id v9 = [v7 username];
        [v3 setObject:v9 forKeyedSubscript:ELSMetadataUserAppleID];
      }
      else
      {
        id v9 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000611C();
        }
      }
    }
    else
    {
      id v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000060E8();
      }
    }
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000060B4();
    }
  }
}

- (void)addServerSuppliedMetadata:(id)a3
{
  id v8 = a3;
  id v4 = [(EnhancedLoggingStateController *)self inputs];
  id v5 = [v4 metadata];

  if (v5)
  {
    id v6 = [(EnhancedLoggingStateController *)self inputs];
    v7 = [v6 metadata];
    [v8 addEntriesFromDictionary:v7];
  }
}

- (void)addPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(EnhancedLoggingStateController *)self inputs];
  uint64_t v6 = [v5 queue];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(EnhancedLoggingStateController *)self inputs];
    id v9 = [v8 queue];
    id v10 = [v9 count];

    if (v10)
    {
      id v11 = [(EnhancedLoggingStateController *)self inputs];
      id v12 = [v11 rawParameters];
      uint64_t v16 = 0;
      uint64_t v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:1 error:&v16];
      uint64_t v14 = v16;

      if (!v14 && v13)
      {
        id v15 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
        [v4 setObject:v15 forKeyedSubscript:ELSMetadataPayload];
      }
    }
  }
  else
  {
  }
}

- (EnhancedLoggingStateInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end