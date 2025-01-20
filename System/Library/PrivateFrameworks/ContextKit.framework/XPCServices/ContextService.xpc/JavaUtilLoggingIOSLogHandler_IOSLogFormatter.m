@interface JavaUtilLoggingIOSLogHandler_IOSLogFormatter
+ (const)__metadata;
- (JavaUtilLoggingIOSLogHandler_IOSLogFormatter)init;
- (id)formatWithJavaUtilLoggingLogRecord:(id)a3;
@end

@implementation JavaUtilLoggingIOSLogHandler_IOSLogFormatter

- (id)formatWithJavaUtilLoggingLogRecord:(id)a3
{
  return [(JavaUtilLoggingFormatter *)self formatMessageWithJavaUtilLoggingLogRecord:a3];
}

- (JavaUtilLoggingIOSLogHandler_IOSLogFormatter)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100407A28;
}

@end