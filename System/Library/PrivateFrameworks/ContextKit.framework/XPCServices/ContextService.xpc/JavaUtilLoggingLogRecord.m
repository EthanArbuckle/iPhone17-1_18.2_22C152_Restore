@interface JavaUtilLoggingLogRecord
+ (const)__metadata;
+ (void)initialize;
- (JavaUtilLoggingLogRecord)initWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4;
- (id)getLevel;
- (id)getLoggerName;
- (id)getMessage;
- (id)getParameters;
- (id)getResourceBundle;
- (id)getResourceBundleName;
- (id)getSourceClassName;
- (id)getSourceMethodName;
- (id)getThrown;
- (id)initSource;
- (int)getThreadID;
- (int64_t)getMillis;
- (int64_t)getSequenceNumber;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setLevelWithJavaUtilLoggingLevel:(id)a3;
- (void)setLoggerNameWithNSString:(id)a3;
- (void)setMessageWithNSString:(id)a3;
- (void)setMillisWithLong:(int64_t)a3;
- (void)setParametersWithNSObjectArray:(id)a3;
- (void)setResourceBundleNameWithNSString:(id)a3;
- (void)setResourceBundleWithJavaUtilResourceBundle:(id)a3;
- (void)setSequenceNumberWithLong:(int64_t)a3;
- (void)setSourceClassNameWithNSString:(id)a3;
- (void)setSourceMethodNameWithNSString:(id)a3;
- (void)setThreadIDWithInt:(int)a3;
- (void)setThrownWithJavaLangThrowable:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilLoggingLogRecord

- (JavaUtilLoggingLogRecord)initWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)getLevel
{
  return self->level_;
}

- (void)setLevelWithJavaUtilLoggingLevel:(id)a3
{
  if (!a3)
  {
    v5 = new_JavaLangNullPointerException_initWithNSString_(@"level == null");
    objc_exception_throw(v5);
  }
  p_level = &self->level_;
  JreStrongAssign((id *)p_level, a3);
}

- (id)getLoggerName
{
  return self->loggerName_;
}

- (void)setLoggerNameWithNSString:(id)a3
{
}

- (id)getMessage
{
  return self->message_;
}

- (void)setMessageWithNSString:(id)a3
{
}

- (int64_t)getMillis
{
  return self->millis_;
}

- (void)setMillisWithLong:(int64_t)a3
{
  self->millis_ = a3;
}

- (id)getParameters
{
  return self->parameters_;
}

- (void)setParametersWithNSObjectArray:(id)a3
{
}

- (id)getResourceBundle
{
  return self->resourceBundle_;
}

- (void)setResourceBundleWithJavaUtilResourceBundle:(id)a3
{
}

- (id)getResourceBundleName
{
  return self->resourceBundleName_;
}

- (void)setResourceBundleNameWithNSString:(id)a3
{
}

- (int64_t)getSequenceNumber
{
  return self->sequenceNumber_;
}

- (void)setSequenceNumberWithLong:(int64_t)a3
{
  self->sequenceNumber_ = a3;
}

- (id)getSourceClassName
{
  return self->sourceClassName_;
}

- (id)initSource
{
  if (!*((unsigned char *)result + 104))
  {
    v1 = result;
    result = [new_JavaLangThrowable_init() getStackTrace];
    if (!result) {
LABEL_12:
    }
      JreThrowNullPointerException();
    unsigned int v2 = 0;
    uint64_t v3 = result + 3;
    unint64_t v4 = (unint64_t)&result[*((int *)result + 2) + 3];
    while ((unint64_t)v3 < v4)
    {
      v6 = *v3++;
      v5 = v6;
      if (!v6) {
        goto LABEL_12;
      }
      unsigned int v7 = v2;
      id v8 = [v5 getClassName];
      if (!v8) {
        goto LABEL_12;
      }
      result = (id *)objc_msgSend(v8, "hasPrefix:", objc_msgSend((id)JavaUtilLoggingLogger_class_(), "getName"));
      unsigned int v2 = result | v7;
      if ((result & 1) == 0 && ((v7 ^ 1) & 1) == 0)
      {
        JreStrongAssign(v1 + 3, [v5 getClassName]);
        result = (id *)JreStrongAssign(v1 + 4, [v5 getMethodName]);
        break;
      }
    }
    *((unsigned char *)v1 + 104) = 1;
  }
  return result;
}

- (void)setSourceClassNameWithNSString:(id)a3
{
  self->sourceInitialized_ = 1;
  JreStrongAssign((id *)&self->sourceClassName_, a3);
}

- (id)getSourceMethodName
{
  return self->sourceMethodName_;
}

- (void)setSourceMethodNameWithNSString:(id)a3
{
  self->sourceInitialized_ = 1;
  JreStrongAssign((id *)&self->sourceMethodName_, a3);
}

- (int)getThreadID
{
  return self->threadID_;
}

- (void)setThreadIDWithInt:(int)a3
{
  self->threadID_ = a3;
}

- (id)getThrown
{
  return self->thrown_;
}

- (void)setThrownWithJavaLangThrowable:(id)a3
{
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
  [a3 writeByteWithInt:1];
  [a3 writeByteWithInt:4];
  parameters = self->parameters_;
  if (parameters)
  {
    [a3 writeIntWithInt:parameters->super.size_];
    v6 = self->parameters_;
    p_elementType = &v6->elementType_;
    unint64_t v8 = (unint64_t)&(&v6->elementType_)[v6->super.size_];
    while ((unint64_t)p_elementType < v8)
    {
      v10 = *p_elementType++;
      v9 = v10;
      if (v10) {
        id v11 = [v9 description];
      }
      else {
        id v11 = 0;
      }
      [a3 writeObjectWithId:v11];
    }
  }
  else
  {
    [a3 writeIntWithInt:0xFFFFFFFFLL];
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  int v5 = [a3 readByte];
  unsigned int v6 = [a3 readByte];
  if (v5 != 1)
  {
    int v14 = v6;
    JavaLangByte_valueOfWithByte_(v5);
    JavaLangByte_valueOfWithByte_(v14);
    CFStringRef v22 = JreStrcat("$@C@", v15, v16, v17, v18, v19, v20, v21, @"Different version ");
    v23 = new_JavaIoIOException_initWithNSString_((uint64_t)v22);
    objc_exception_throw(v23);
  }
  unsigned int v7 = [a3 readInt];
  if ((v7 & 0x80000000) == 0)
  {
    p_parameters = &self->parameters_;
    id v9 = +[IOSObjectArray newArrayWithLength:v7 type:NSObject_class_()];
    JreStrongAssignAndConsume((id *)&self->parameters_, v9);
    parameters = self->parameters_;
    if (parameters->super.size_ >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        IOSObjectArray_Set((uint64_t)parameters, v11++, [a3 readObject]);
        parameters = *p_parameters;
      }
      while (v11 < (*p_parameters)->super.size_);
    }
  }
  resourceBundleName = (__CFString *)self->resourceBundleName_;
  if (resourceBundleName)
  {
    ResourceBundleWithNSString = JavaUtilLoggingLogger_loadResourceBundleWithNSString_(resourceBundleName);
    JreStrongAssign((id *)&self->resourceBundle_, ResourceBundleWithNSString);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingLogRecord;
  [(JavaUtilLoggingLogRecord *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    unsigned int v2 = new_JavaLangThreadLocal_init();
    JreStrongAssignAndConsume((id *)&qword_1005607F8, v2);
    atomic_store(1u, (unsigned __int8 *)JavaUtilLoggingLogRecord__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FAE48;
}

@end