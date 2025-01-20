@interface JavaUtilLoggingFormatter
+ (const)__metadata;
- (id)formatMessageWithJavaUtilLoggingLogRecord:(id)a3;
- (id)formatWithJavaUtilLoggingLogRecord:(id)a3;
- (id)getHeadWithJavaUtilLoggingHandler:(id)a3;
- (id)getTailWithJavaUtilLoggingHandler:(id)a3;
@end

@implementation JavaUtilLoggingFormatter

- (id)formatWithJavaUtilLoggingLogRecord:(id)a3
{
  return 0;
}

- (id)formatMessageWithJavaUtilLoggingLogRecord:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 getMessage];
  id v5 = [a3 getResourceBundle];
  if (v5) {
    id v4 = [v5 getStringWithNSString:v4];
  }
  if (v4)
  {
    v6 = (int *)[a3 getParameters];
    if (([v4 indexOfString:@"{0"] & 0x80000000) == 0 && v6 && v6[2] >= 1) {
      return JavaTextMessageFormat_formatWithNSString_withNSObjectArray_((uint64_t)v4, (uint64_t)v6);
    }
  }
  return v4;
}

- (id)getHeadWithJavaUtilLoggingHandler:(id)a3
{
  return &stru_10048C1F8;
}

- (id)getTailWithJavaUtilLoggingHandler:(id)a3
{
  return &stru_10048C1F8;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042E270;
}

@end