@interface JavaUtilLoggingHandler
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isLoggableWithJavaUtilLoggingLogRecord:(id)a3;
- (JavaUtilLoggingHandler)init;
- (id)getCustomizeInstanceWithNSString:(id)a3;
- (id)getDefaultInstanceWithNSString:(id)a3;
- (id)getEncoding;
- (id)getErrorManager;
- (id)getFilter;
- (id)getFormatter;
- (id)getLevel;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)initPropertiesWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6;
- (void)internalSetEncodingWithNSString:(id)a3;
- (void)internalSetFormatterWithJavaUtilLoggingFormatter:(id)a3;
- (void)printInvalidPropMessageWithNSString:(id)a3 withNSString:(id)a4 withJavaLangException:(id)a5;
- (void)publishWithJavaUtilLoggingLogRecord:(id)a3;
- (void)reportErrorWithNSString:(id)a3 withJavaLangException:(id)a4 withInt:(int)a5;
- (void)setEncodingWithNSString:(id)a3;
- (void)setErrorManagerWithJavaUtilLoggingErrorManager:(id)a3;
- (void)setFilterWithJavaUtilLoggingFilter:(id)a3;
- (void)setFormatterWithJavaUtilLoggingFormatter:(id)a3;
- (void)setLevelWithJavaUtilLoggingLevel:(id)a3;
@end

@implementation JavaUtilLoggingHandler

- (JavaUtilLoggingHandler)init
{
  return self;
}

- (id)getDefaultInstanceWithNSString:(id)a3
{
  return sub_10028D1A0(a3);
}

- (id)getCustomizeInstanceWithNSString:(id)a3
{
  return sub_10028D1F0((uint64_t)a3);
}

- (void)printInvalidPropMessageWithNSString:(id)a3 withNSString:(id)a4 withJavaLangException:(id)a5
{
  CFStringRef v10 = JreStrcat("$$C$C$", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7, @"Invalid property value for ");
  errorMan = self->errorMan_;
  if (!errorMan) {
    JreThrowNullPointerException();
  }
  [(JavaUtilLoggingErrorManager *)errorMan errorWithNSString:v10 withJavaLangException:a5 withInt:0];
}

- (void)initPropertiesWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  v18 = LogManager;
  id v19 = objc_msgSend(LogManager, "getPropertyWithNSString:", JreStrcat("$$", v11, v12, v13, v14, v15, v16, v17, self->prefix_));
  if (v19)
  {
    id v20 = sub_10028D1F0((uint64_t)v19);
    v21 = (void *)JavaUtilLoggingFilter_class_();
    if (v20 && ([v21 isInstance:v20] & 1) == 0) {
      JreThrowClassCastException();
    }
    JreStrongAssign((id *)&self->filter_, v20);
  }
  else
  {
    id v29 = sub_10028D1A0(a4);
    v30 = (void *)JavaUtilLoggingFilter_class_();
    if (v29 && ([v30 isInstance:v29] & 1) == 0) {
      goto LABEL_21;
    }
    JreStrongAssign((id *)&self->filter_, v29);
  }
  id v31 = objc_msgSend(v18, "getPropertyWithNSString:", JreStrcat("$$", v22, v23, v24, v25, v26, v27, v28, self->prefix_));
  if (v31) {
    v32 = JavaUtilLoggingLevel_parseWithNSString_(v31);
  }
  else {
    v32 = JavaUtilLoggingLevel_parseWithNSString_(a3);
  }
  JreStrongAssign((id *)&self->level_, v32);
  id v40 = objc_msgSend(v18, "getPropertyWithNSString:", JreStrcat("$$", v33, v34, v35, v36, v37, v38, v39, self->prefix_));
  if (!v40)
  {
    id v49 = sub_10028D1A0(a5);
    objc_opt_class();
    if (!v49 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      JreStrongAssign((id *)&self->formatter_, v49);
      goto LABEL_19;
    }
LABEL_21:
    JreThrowClassCastException();
  }
  id v41 = sub_10028D1F0((uint64_t)v40);
  objc_opt_class();
  if (v41 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->formatter_, v41);
LABEL_19:
  -[JavaUtilLoggingHandler internalSetEncodingWithNSString:](self, "internalSetEncodingWithNSString:", objc_msgSend(v18, "getPropertyWithNSString:", JreStrcat("$$", v42, v43, v44, v45, v46, v47, v48, self->prefix_)));
}

- (void)close
{
}

- (void)flush
{
}

- (void)publishWithJavaUtilLoggingLogRecord:(id)a3
{
}

- (id)getEncoding
{
  return self->encoding_;
}

- (id)getErrorManager
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  return self->errorMan_;
}

- (id)getFilter
{
  return self->filter_;
}

- (id)getFormatter
{
  return self->formatter_;
}

- (id)getLevel
{
  return self->level_;
}

- (BOOL)isLoggableWithJavaUtilLoggingLogRecord:(id)a3
{
  if (!a3)
  {
    uint64_t v11 = new_JavaLangNullPointerException_initWithNSString_(@"record == null");
    objc_exception_throw(v11);
  }
  level = self->level_;
  if (!level) {
    goto LABEL_15;
  }
  unsigned int v6 = [(JavaUtilLoggingLevel *)level intValue];
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!JavaUtilLoggingLevel_OFF_) {
    goto LABEL_15;
  }
  if (v6 == [(id)JavaUtilLoggingLevel_OFF_ intValue]) {
    return 0;
  }
  id v7 = [a3 getLevel];
  if (!v7) {
LABEL_15:
  }
    JreThrowNullPointerException();
  int v8 = [v7 intValue];
  if (v8 < [(JavaUtilLoggingLevel *)self->level_ intValue]) {
    return 0;
  }
  filter = self->filter_;
  if (!filter) {
    return 1;
  }
  return [(JavaUtilLoggingFilter *)filter isLoggableWithJavaUtilLoggingLogRecord:a3];
}

- (void)reportErrorWithNSString:(id)a3 withJavaLangException:(id)a4 withInt:(int)a5
{
  errorMan = self->errorMan_;
  if (!errorMan) {
    JreThrowNullPointerException();
  }
  [(JavaUtilLoggingErrorManager *)errorMan errorWithNSString:a3 withJavaLangException:a4 withInt:*(void *)&a5];
}

- (void)internalSetEncodingWithNSString:(id)a3
{
  if (a3)
  {
    if (!JavaNioCharsetCharset_isSupportedWithNSString_((__CFString *)a3))
    {
      id v7 = new_JavaIoUnsupportedEncodingException_initWithNSString_((uint64_t)a3);
      objc_exception_throw(v7);
    }
    p_encoding = &self->encoding_;
    id v6 = a3;
  }
  else
  {
    p_encoding = &self->encoding_;
    id v6 = 0;
  }
  JreStrongAssign((id *)p_encoding, v6);
}

- (void)setEncodingWithNSString:(id)a3
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  [(JavaUtilLoggingHandler *)self internalSetEncodingWithNSString:a3];
}

- (void)setErrorManagerWithJavaUtilLoggingErrorManager:(id)a3
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  if (!a3)
  {
    id v6 = new_JavaLangNullPointerException_initWithNSString_(@"newErrorManager == null");
    objc_exception_throw(v6);
  }
  JreStrongAssign((id *)&self->errorMan_, a3);
}

- (void)setFilterWithJavaUtilLoggingFilter:(id)a3
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  JreStrongAssign((id *)&self->filter_, a3);
}

- (void)internalSetFormatterWithJavaUtilLoggingFormatter:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = new_JavaLangNullPointerException_initWithNSString_(@"newFormatter == null");
    objc_exception_throw(v5);
  }
  p_formatter = &self->formatter_;
  JreStrongAssign((id *)p_formatter, a3);
}

- (void)setFormatterWithJavaUtilLoggingFormatter:(id)a3
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  [(JavaUtilLoggingHandler *)self internalSetFormatterWithJavaUtilLoggingFormatter:a3];
}

- (void)setLevelWithJavaUtilLoggingLevel:(id)a3
{
  if (!a3)
  {
    id v6 = new_JavaLangNullPointerException_initWithNSString_(@"newLevel == null");
    objc_exception_throw(v6);
  }
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  [LogManager checkAccess];
  JreStrongAssign((id *)&self->level_, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingHandler;
  [(JavaUtilLoggingHandler *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign((id *)&qword_100562E98, (void *)JavaUtilLoggingLevel_ALL_);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilLoggingHandler__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100481500;
}

@end