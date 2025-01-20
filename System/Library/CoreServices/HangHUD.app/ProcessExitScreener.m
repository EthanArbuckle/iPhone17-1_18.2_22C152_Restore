@interface ProcessExitScreener
+ (id)sharedInstance;
- (BOOL)allowedExitReasonsMatchRecordReasons:(id)a3;
- (BOOL)isProcessExitRecordAllowed:(id)a3;
- (HTProcessExitFilteringConfiguration)filteringConfiguration;
- (NSArray)knownCriticalProcesses;
- (ProcessExitScreener)init;
- (void)setFilteringConfiguration:(id)a3;
- (void)setKnownCriticalProcesses:(id)a3;
@end

@implementation ProcessExitScreener

+ (id)sharedInstance
{
  if (qword_10003E9A8 != -1) {
    dispatch_once(&qword_10003E9A8, &stru_100030C48);
  }
  v2 = (void *)qword_10003E9A0;

  return v2;
}

- (ProcessExitScreener)init
{
  v6.receiver = self;
  v6.super_class = (Class)ProcessExitScreener;
  v2 = [(ProcessExitScreener *)&v6 init];
  v3 = v2;
  if (v2)
  {
    knownCriticalProcesses = v2->_knownCriticalProcesses;
    v2->_knownCriticalProcesses = (NSArray *)&off_100035CE8;
  }
  return v3;
}

- (BOOL)isProcessExitRecordAllowed:(id)a3
{
  id v4 = a3;
  v5 = [v4 processName];
  if (!self->_filteringConfiguration)
  {
    v8 = sub_10000E760();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001C8D8();
    }
    goto LABEL_11;
  }
  if (![v4 exitReasonNamespace])
  {
    v8 = sub_10000E760();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001C940();
    }
    goto LABEL_11;
  }
  if (![(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowsAllProcesses])
  {
    if ([(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowsCriticalProcesses]&& [(NSArray *)self->_knownCriticalProcesses containsObject:v5])
    {
      objc_super v6 = sub_10000E760();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_10001CA10();
      }
      goto LABEL_6;
    }
    v10 = [(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowedProcessNames];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowedProcessNames];
      unsigned int v13 = [v12 containsObject:v5];

      objc_super v6 = sub_10000E760();
      BOOL v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v14) {
          sub_10001CAE0();
        }
        goto LABEL_6;
      }
      if (v14) {
        sub_10001CB48();
      }

LABEL_12:
      BOOL v7 = 0;
      goto LABEL_13;
    }
    v8 = sub_10000E760();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001CA78();
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_super v6 = sub_10000E760();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001C9A8();
  }
LABEL_6:

  BOOL v7 = [(ProcessExitScreener *)self allowedExitReasonsMatchRecordReasons:v4];
LABEL_13:

  return v7;
}

- (BOOL)allowedExitReasonsMatchRecordReasons:(id)a3
{
  id v4 = a3;
  v5 = [v4 processName];
  uint64_t v6 = 1 << (char)[v4 exitReasonNamespace];
  if ((id)[(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowedReasons] == (id)1
    || ([(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowedReasons] & v6) != 0)
  {
    BOOL v7 = sub_100013AAC((const mach_header_64 *)v6);
    id v8 = [v7 count];

    if (v8)
    {
      v9 = [(HTProcessExitFilteringConfiguration *)self->_filteringConfiguration allowedSubReasons];
      v10 = +[NSNumber numberWithUnsignedLongLong:v6];
      id v11 = [v9 objectForKeyedSubscript:v10];

      if (v11)
      {
        unint64_t v12 = (unint64_t)[v11 unsignedLongLongValue];
        uint64_t v13 = sub_100013A9C(v6);
        unsigned __int8 v14 = [v4 exitReasonCode];
        if (v12 != 1 && ((v13 << v14) & v12) == 0)
        {
          v15 = sub_10000E760();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_10001CD48((uint64_t)v5, v4);
          }
          BOOL v16 = 0;
          goto LABEL_15;
        }
        v15 = sub_10000E760();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_10001CCB0((uint64_t)v5, v4);
        }
      }
      else
      {
        v15 = sub_10000E760();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_10001CC30((uint64_t)v5, v4);
        }
      }
      BOOL v16 = 1;
LABEL_15:

      goto LABEL_19;
    }
    id v11 = sub_10000E760();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10001CBB0((uint64_t)v5, v4);
    }
    BOOL v16 = 1;
  }
  else
  {
    id v11 = sub_10000E760();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10001CDE0((uint64_t)v5, v4);
    }
    BOOL v16 = 0;
  }
LABEL_19:

  return v16;
}

- (void)setFilteringConfiguration:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_filteringConfiguration, a3);
  uint64_t v6 = sub_10000E760();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Process Terminations: applied filtering configuration:\n%@", (uint8_t *)&v7, 0xCu);
  }
}

- (HTProcessExitFilteringConfiguration)filteringConfiguration
{
  return self->_filteringConfiguration;
}

- (NSArray)knownCriticalProcesses
{
  return self->_knownCriticalProcesses;
}

- (void)setKnownCriticalProcesses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownCriticalProcesses, 0);

  objc_storeStrong((id *)&self->_filteringConfiguration, 0);
}

@end