@interface NSError
- (NSError)initWithOctaneSimulatedError:(int64_t)a3;
- (NSNumber)lib_coordinatorOwnerID;
- (NSString)lib_sanitizedDescription;
- (NSString)lib_serverDialogID;
- (NSString)lib_shortDescription;
- (id)lib_addRecoveryOptions:(id)a3;
- (id)lib_addUserInfoValue:(id)a3 forKey:(id)a4;
- (id)toASDErrorWithMetadata:(id)a3;
- (void)lib_walkUnderlyingErrorsUsingBlock:(id)a3;
@end

@implementation NSError

- (NSNumber)lib_coordinatorOwnerID
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"coordinatorOwnerID"];

  return (NSNumber *)v3;
}

- (NSString)lib_sanitizedDescription
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009F894;
  v6[3] = &unk_10035AA20;
  id v7 = (id)objc_opt_new();
  id v3 = v7;
  [(NSError *)self lib_walkUnderlyingErrorsUsingBlock:v6];
  v4 = [v3 componentsJoinedByString:@":"];

  return (NSString *)v4;
}

- (NSString)lib_shortDescription
{
  id v3 = [(NSError *)self domain];
  v4 = +[NSString stringWithFormat:@"%@/%ld", v3, [(NSError *)self code]];

  return (NSString *)v4;
}

- (NSString)lib_serverDialogID
{
  id v3 = [(NSError *)self userInfo];
  v4 = [v3 objectForKeyedSubscript:@"dialogID"];

  if (!v4)
  {
    v5 = [(NSError *)self userInfo];
    v4 = objc_msgSend(v5, "tcr_stringForKeyPath:", @"AMSServerPayload.metrics.dialogId");
  }

  return (NSString *)v4;
}

- (id)lib_addRecoveryOptions:(id)a3
{
  id v4 = a3;
  v5 = [(NSError *)self localizedRecoveryOptions];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = self;
  }
  else
  {
    v8 = [(NSError *)self userInfo];
    v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

    [v9 setObject:v4 forKey:NSLocalizedRecoveryOptionsErrorKey];
    v10 = [(NSError *)self domain];
    NSInteger v11 = [(NSError *)self code];
    v12 = +[NSDictionary dictionaryWithDictionary:v9];
    id v7 = +[NSError errorWithDomain:v10 code:v11 userInfo:v12];
  }

  return v7;
}

- (id)lib_addUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSError *)self userInfo];
  id v9 = [v8 mutableCopy];

  if (!v9) {
    id v9 = (id)objc_opt_new();
  }
  [v9 setObject:v6 forKeyedSubscript:v7];
  v10 = [(NSError *)self domain];
  NSInteger v11 = [(NSError *)self code];
  v12 = +[NSDictionary dictionaryWithDictionary:v9];
  v13 = +[NSError errorWithDomain:v10 code:v11 userInfo:v12];

  return v13;
}

- (void)lib_walkUnderlyingErrorsUsingBlock:(id)a3
{
  id v4 = self;
  while (1)
  {
    v8 = v4;
    if (!(*((unsigned int (**)(id))a3 + 2))(a3)) {
      break;
    }
    v5 = [(NSError *)v8 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v4 = (NSError *)v6;
    if (!v6)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  id v7 = v8;
LABEL_6:
}

- (NSError)initWithOctaneSimulatedError:(int64_t)a3
{
  return (NSError *)sub_1000F0570(a3);
}

- (id)toASDErrorWithMetadata:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10011CD88((char *)a3);

  id v7 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();

  return v7;
}

@end