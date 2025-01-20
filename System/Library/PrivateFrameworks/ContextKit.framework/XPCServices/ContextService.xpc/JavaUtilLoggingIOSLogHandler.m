@interface JavaUtilLoggingIOSLogHandler
+ (const)__metadata;
- (JavaUtilLoggingIOSLogHandler)init;
- (void)logWithNSString:(id)a3 withInt:(unsigned __int8)a4;
- (void)publishWithJavaUtilLoggingLogRecord:(id)a3;
@end

@implementation JavaUtilLoggingIOSLogHandler

- (JavaUtilLoggingIOSLogHandler)init
{
  return self;
}

- (void)publishWithJavaUtilLoggingLogRecord:(id)a3
{
  if (!-[JavaUtilLoggingHandler isLoggableWithJavaUtilLoggingLogRecord:](self, "isLoggableWithJavaUtilLoggingLogRecord:"))return; {
  if (!a3)
  }
    goto LABEL_21;
  id v5 = [a3 getLevel];
  if (!v5) {
    goto LABEL_21;
  }
  int v6 = [v5 intValue];
  if (v6 > 899)
  {
    if (v6 == 1000)
    {
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
    if (v6 == 900)
    {
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_13;
    }
  }
  else if (v6 == 700 || v6 == 800)
  {
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    goto LABEL_13;
  }
  os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    return;
  }
LABEL_13:
  id v8 = [(JavaUtilLoggingHandler *)self getFormatter];
  if (!v8) {
    goto LABEL_21;
  }
  v9 = new_JavaLangStringBuilder_initWithNSString_([v8 formatWithJavaUtilLoggingLogRecord:a3]);
  if ([a3 getThrown])
  {
    [(JavaLangStringBuilder *)v9 appendWithChar:10];
    v10 = new_JavaIoStringWriter_init();
    id v11 = [a3 getThrown];
    if (v11)
    {
      [v11 printStackTraceWithJavaIoPrintWriter:new_JavaIoPrintWriter_initWithJavaIoWriter_(v10)];
      [(JavaLangStringBuilder *)v9 appendWithNSString:[(JavaIoStringWriter *)v10 description]];
      goto LABEL_17;
    }
LABEL_21:
    JreThrowNullPointerException();
  }
LABEL_17:
  v12 = [(JavaLangStringBuilder *)v9 description];
  sub_100180C90((uint64_t)v12, v7);
}

- (void)logWithNSString:(id)a3 withInt:(unsigned __int8)a4
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100407958;
}

@end