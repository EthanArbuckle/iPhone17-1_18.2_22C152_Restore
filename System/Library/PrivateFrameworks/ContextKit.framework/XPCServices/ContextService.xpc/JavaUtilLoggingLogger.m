@interface JavaUtilLoggingLogger
+ (const)__metadata;
+ (id)__annotations_global_;
+ (id)getAnonymousLoggerWithNSString:(id)a3;
+ (id)getGlobal;
+ (id)getLoggerWithNSString:(id)a3;
+ (id)getLoggerWithNSString:(id)a3 withNSString:(id)a4;
+ (id)loadResourceBundleWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)getUseParentHandlers;
- (BOOL)internalIsLoggableWithJavaUtilLoggingLevel:(id)a3;
- (BOOL)isLoggableWithJavaUtilLoggingLevel:(id)a3;
- (JavaUtilLoggingLogger)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getFilter;
- (id)getHandlers;
- (id)getLevel;
- (id)getName;
- (id)getParent;
- (id)getResourceBundle;
- (id)getResourceBundleName;
- (void)__javaClone;
- (void)addHandlerWithJavaUtilLoggingHandler:(id)a3;
- (void)configWithNSString:(id)a3;
- (void)dealloc;
- (void)enteringWithNSString:(id)a3 withNSString:(id)a4;
- (void)enteringWithNSString:(id)a3 withNSString:(id)a4 withId:(id)a5;
- (void)enteringWithNSString:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (void)exitingWithNSString:(id)a3 withNSString:(id)a4;
- (void)exitingWithNSString:(id)a3 withNSString:(id)a4 withId:(id)a5;
- (void)fineWithNSString:(id)a3;
- (void)finerWithNSString:(id)a3;
- (void)finestWithNSString:(id)a3;
- (void)infoWithNSString:(id)a3;
- (void)initResourceBundleWithNSString:(id)a3;
- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4;
- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withId:(id)a5;
- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5;
- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (void)logWithJavaUtilLoggingLogRecord:(id)a3;
- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6;
- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withId:(id)a7;
- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withJavaLangThrowable:(id)a7;
- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSObjectArray:(id)a7;
- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withId:(id)a8;
- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withJavaLangThrowable:(id)a8;
- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSObjectArray:(id)a8;
- (void)removeHandlerWithJavaUtilLoggingHandler:(id)a3;
- (void)reset;
- (void)setFilterWithJavaUtilLoggingFilter:(id)a3;
- (void)setLevelWithJavaUtilLoggingLevel:(id)a3;
- (void)setManagerWithJavaUtilLoggingLogManager:(id)a3;
- (void)setParentWithJavaUtilLoggingLogger:(id)a3;
- (void)setResourceBundleWithJavaUtilLoggingLogRecord:(id)a3;
- (void)setUseParentHandlersWithBoolean:(BOOL)a3;
- (void)severeWithNSString:(id)a3;
- (void)throwingWithNSString:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5;
- (void)warningWithNSString:(id)a3;
@end

@implementation JavaUtilLoggingLogger

- (JavaUtilLoggingLogger)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

+ (id)loadResourceBundleWithNSString:(id)a3
{
  return JavaUtilLoggingLogger_loadResourceBundleWithNSString_((__CFString *)a3);
}

+ (id)getAnonymousLoggerWithNSString:(id)a3
{
  return JavaUtilLoggingLogger_getAnonymousLoggerWithNSString_((__CFString *)a3);
}

- (void)initResourceBundleWithNSString:(id)a3
{
}

+ (id)getLoggerWithNSString:(id)a3
{
  return JavaUtilLoggingLogger_getLoggerWithNSString_((uint64_t)a3);
}

+ (id)getLoggerWithNSString:(id)a3 withNSString:(id)a4
{
  return JavaUtilLoggingLogger_getLoggerWithNSString_withNSString_((uint64_t)a3, (__CFString *)a4);
}

+ (id)getGlobal
{
  if ((atomic_load_explicit(JavaUtilLoggingLogger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilLoggingLogger_global_;
}

- (void)addHandlerWithJavaUtilLoggingHandler:(id)a3
{
  if (!a3)
  {
    v7 = new_JavaLangNullPointerException_initWithNSString_(@"handler == null");
    objc_exception_throw(v7);
  }
  if (self->isNamed_)
  {
    LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
    if (!LogManager) {
      goto LABEL_9;
    }
    [LogManager checkAccess];
  }
  handlers = self->handlers_;
  if (!handlers) {
LABEL_9:
  }
    JreThrowNullPointerException();
  [(JavaUtilList *)handlers addWithId:a3];
}

- (void)setManagerWithJavaUtilLoggingLogManager:(id)a3
{
  if (!a3) {
    goto LABEL_25;
  }
  p_name = (unint64_t *)&self->name_;
  v11 = (void *)atomic_load((unint64_t *)&self->name_);
  id v12 = objc_msgSend(a3, "getPropertyWithNSString:", JreStrcat("$$", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v11));
  if (v12) {
    [a3 setLevelRecursivelyWithJavaUtilLoggingLogger:self withJavaUtilLoggingLevel:JavaUtilLoggingLevel_parseWithNSString_(v12)];
  }
  v13 = (void *)atomic_load(p_name);
  if (!v13) {
    goto LABEL_25;
  }
  if ([v13 isEmpty])
  {
    CFStringRef v21 = @"handlers";
  }
  else
  {
    v22 = (void *)atomic_load((unint64_t *)&self->name_);
    CFStringRef v21 = JreStrcat("$$", v14, v15, v16, v17, v18, v19, v20, v22);
  }
  id v23 = [a3 getPropertyWithNSString:v21];
  if (v23)
  {
    v24 = (char *)[v23 split:@",|\\s"];
    if (!v24) {
      goto LABEL_25;
    }
    v25 = (void **)(v24 + 24);
    unint64_t v26 = (unint64_t)&v24[8 * *((int *)v24 + 2) + 24];
    if ((unint64_t)(v24 + 24) < v26)
    {
      while (1)
      {
        v28 = *v25++;
        v27 = v28;
        if (!v28) {
          break;
        }
        if (([v27 isEmpty] & 1) == 0)
        {
          id InstanceByClassWithNSString = JavaUtilLoggingLogManager_getInstanceByClassWithNSString_((uint64_t)v27);
          uint64_t v30 = objc_opt_class();
          if (InstanceByClassWithNSString && (objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          id v37 = objc_msgSend(a3, "getPropertyWithNSString:", JreStrcat("$$", v30, v31, v32, v33, v34, v35, v36, v27));
          if (v37)
          {
            if (!InstanceByClassWithNSString) {
              JreThrowNullPointerException();
            }
            [InstanceByClassWithNSString setLevelWithJavaUtilLoggingLevel:JavaUtilLoggingLevel_parseWithNSString_(v37)];
          }
          handlers = self->handlers_;
          if (!handlers) {
            break;
          }
          [(JavaUtilList *)handlers addWithId:InstanceByClassWithNSString];
        }
        if ((unint64_t)v25 >= v26) {
          return;
        }
      }
LABEL_25:
      JreThrowNullPointerException();
    }
  }
}

- (id)getHandlers
{
  handlers = self->handlers_;
  if (!handlers) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = qword_100561140;
  return [(JavaUtilList *)handlers toArrayWithNSObjectArray:v3];
}

- (void)removeHandlerWithJavaUtilLoggingHandler:(id)a3
{
  if (self->isNamed_)
  {
    LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
    if (!LogManager) {
      goto LABEL_10;
    }
    [LogManager checkAccess];
  }
  if (!a3) {
    return;
  }
  handlers = self->handlers_;
  if (!handlers) {
LABEL_10:
  }
    JreThrowNullPointerException();
  [(JavaUtilList *)handlers removeWithId:a3];
}

- (id)getFilter
{
  return self->filter_;
}

- (void)setFilterWithJavaUtilLoggingFilter:(id)a3
{
  if (self->isNamed_)
  {
    LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
    if (!LogManager) {
      JreThrowNullPointerException();
    }
    [LogManager checkAccess];
  }
  JreStrongAssign((id *)&self->filter_, a3);
}

- (id)getLevel
{
  return (id)atomic_load((unint64_t *)&self->levelObjVal_);
}

- (void)setLevelWithJavaUtilLoggingLevel:(id)a3
{
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  uint64_t v6 = LogManager;
  if (self->isNamed_)
  {
    if (LogManager)
    {
      [LogManager checkAccess];
      goto LABEL_5;
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  if (!LogManager) {
    goto LABEL_8;
  }
LABEL_5:
  [v6 setLevelRecursivelyWithJavaUtilLoggingLogger:self withJavaUtilLoggingLevel:a3];
}

- (BOOL)getUseParentHandlers
{
  return self->notifyParentHandlers_;
}

- (void)setUseParentHandlersWithBoolean:(BOOL)a3
{
  if (self->isNamed_)
  {
    LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
    if (!LogManager) {
      JreThrowNullPointerException();
    }
    [LogManager checkAccess];
  }
  self->notifyParentHandlers_ = a3;
}

- (id)getParent
{
  return objc_loadWeak((id *)&self->parent_);
}

- (void)setParentWithJavaUtilLoggingLogger:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = new_JavaLangNullPointerException_initWithNSString_(@"parent == null");
    objc_exception_throw(v7);
  }
  LogManager = (void *)JavaUtilLoggingLogManager_getLogManager();
  if (!LogManager) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = LogManager;
  [LogManager checkAccess];
  [v6 setParentWithJavaUtilLoggingLogger:self withJavaUtilLoggingLogger:a3];
}

- (id)getName
{
  return (id)atomic_load((unint64_t *)&self->name_);
}

- (id)getResourceBundle
{
  return (id)atomic_load((unint64_t *)&self->resourceBundle_);
}

- (id)getResourceBundleName
{
  return (id)atomic_load((unint64_t *)&self->resourceBundleName_);
}

- (BOOL)internalIsLoggableWithJavaUtilLoggingLevel:(id)a3
{
  return sub_10023D4B4((uint64_t)self, a3);
}

- (BOOL)isLoggableWithJavaUtilLoggingLevel:(id)a3
{
  return sub_10023D4B4((uint64_t)self, a3);
}

- (void)setResourceBundleWithJavaUtilLoggingLogRecord:(id)a3
{
}

- (void)enteringWithNSString:(id)a3 withNSString:(id)a4
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v7 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, @"ENTRY");
    unint64_t v8 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v7 setLoggerNameWithNSString:v8];
    [(JavaUtilLoggingLogRecord *)v7 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v7 setSourceMethodNameWithNSString:a4];
    sub_10023D548(self, v7);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v7];
  }
}

- (void)enteringWithNSString:(id)a3 withNSString:(id)a4 withId:(id)a5
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, @"ENTRY {0}");
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    [(JavaUtilLoggingLogRecord *)v9 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v9 setSourceMethodNameWithNSString:a4];
    id v12 = a5;
    v11 = +[IOSObjectArray arrayWithObjects:&v12 count:1 type:NSObject_class_()];
    -[JavaUtilLoggingLogRecord setParametersWithNSObjectArray:](v9, "setParametersWithNSObjectArray:", v11, v12);
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)enteringWithNSString:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if (a5)
    {
      v9 = new_JavaLangStringBuilder_initWithNSString_(@"ENTRY");
      if (*((int *)a5 + 2) >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          id v11 = [(JavaLangStringBuilder *)v9 appendWithNSString:@" {"];
          if (!v11 || (id v12 = [v11 appendWithInt:v10]) == 0) {
            JreThrowNullPointerException();
          }
          [v12 appendWithNSString:@"}"];
          uint64_t v10 = (v10 + 1);
        }
        while ((int)v10 < *((_DWORD *)a5 + 2));
      }
      v13 = [(JavaLangStringBuilder *)v9 description];
    }
    else
    {
      v13 = @"ENTRY";
    }
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v14 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, v13);
    unint64_t v15 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v14 setLoggerNameWithNSString:v15];
    [(JavaUtilLoggingLogRecord *)v14 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v14 setSourceMethodNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v14 setParametersWithNSObjectArray:a5];
    sub_10023D548(self, v14);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v14];
  }
}

- (void)exitingWithNSString:(id)a3 withNSString:(id)a4
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v7 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, @"RETURN");
    unint64_t v8 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v7 setLoggerNameWithNSString:v8];
    [(JavaUtilLoggingLogRecord *)v7 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v7 setSourceMethodNameWithNSString:a4];
    sub_10023D548(self, v7);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v7];
  }
}

- (void)exitingWithNSString:(id)a3 withNSString:(id)a4 withId:(id)a5
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, @"RETURN {0}");
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    [(JavaUtilLoggingLogRecord *)v9 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v9 setSourceMethodNameWithNSString:a4];
    id v12 = a5;
    id v11 = +[IOSObjectArray arrayWithObjects:&v12 count:1 type:NSObject_class_()];
    -[JavaUtilLoggingLogRecord setParametersWithNSObjectArray:](v9, "setParametersWithNSObjectArray:", v11, v12);
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)throwingWithNSString:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (sub_10023D4B4((uint64_t)self, (void *)JavaUtilLoggingLevel_FINER_))
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_((void *)JavaUtilLoggingLevel_FINER_, @"THROW");
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    [(JavaUtilLoggingLogRecord *)v9 setSourceClassNameWithNSString:a3];
    [(JavaUtilLoggingLogRecord *)v9 setSourceMethodNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v9 setThrownWithJavaLangThrowable:a5];
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)severeWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_SEVERE_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)warningWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_WARNING_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)infoWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_INFO_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)configWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_CONFIG_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)fineWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_FINE_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)finerWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_FINER_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)finestWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaUtilLoggingLevel_FINEST_;
  [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLevel:v5 withNSString:a3];
}

- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    uint64_t v7 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a4);
    unint64_t v8 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v7 setLoggerNameWithNSString:v8];
    sub_10023D548(self, v7);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v7];
  }
}

- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withId:(id)a5
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a4);
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    id v12 = a5;
    id v11 = +[IOSObjectArray arrayWithObjects:&v12 count:1 type:NSObject_class_()];
    -[JavaUtilLoggingLogRecord setParametersWithNSObjectArray:](v9, "setParametersWithNSObjectArray:", v11, v12);
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a4);
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    [(JavaUtilLoggingLogRecord *)v9 setParametersWithNSObjectArray:a5];
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)logWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    v9 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a4);
    unint64_t v10 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v9 setLoggerNameWithNSString:v10];
    [(JavaUtilLoggingLogRecord *)v9 setThrownWithJavaLangThrowable:a5];
    sub_10023D548(self, v9);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v9];
  }
}

- (void)logWithJavaUtilLoggingLogRecord:(id)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  uint64_t v4 = self;
  if (!sub_10023D4B4((uint64_t)self, [a3 getLevel])) {
    return;
  }
  filter = v4->filter_;
  if (filter)
  {
    if (![(JavaUtilLoggingFilter *)filter isLoggableWithJavaUtilLoggingLogRecord:a3])return; {
  }
    }
  uint64_t v6 = [(JavaUtilLoggingLogger *)v4 getHandlers];
  if (!v6) {
LABEL_18:
  }
    JreThrowNullPointerException();
  uint64_t v7 = v6 + 3;
  unint64_t v8 = (unint64_t)&v6[*((int *)v6 + 2) + 3];
  while ((unint64_t)v7 < v8)
  {
    v9 = *v7;
    if (!*v7) {
      goto LABEL_18;
    }
    ++v7;
    [v9 publishWithJavaUtilLoggingLogRecord:a3];
  }
  while (1)
  {
    Weak = (JavaUtilLoggingLogger *)objc_loadWeak((id *)&v4->parent_);
    if (!Weak) {
      break;
    }
    unint64_t v10 = v4;
    uint64_t v4 = Weak;
    if (![(JavaUtilLoggingLogger *)v10 getUseParentHandlers]) {
      break;
    }
    id v11 = [(JavaUtilLoggingLogger *)v4 getHandlers];
    if (!v11) {
      goto LABEL_18;
    }
    id v12 = v11 + 3;
    unint64_t v13 = (unint64_t)&v11[*((int *)v11 + 2) + 3];
    while ((unint64_t)v12 < v13)
    {
      uint64_t v14 = *v12;
      if (!*v12) {
        goto LABEL_18;
      }
      ++v12;
      [v14 publishWithJavaUtilLoggingLogRecord:a3];
    }
  }
}

- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    id v11 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a6);
    unint64_t v12 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v11 setLoggerNameWithNSString:v12];
    [(JavaUtilLoggingLogRecord *)v11 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v11 setSourceMethodNameWithNSString:a5];
    sub_10023D548(self, v11);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v11];
  }
}

- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withId:(id)a7
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v13 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a6);
    unint64_t v14 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v13 setLoggerNameWithNSString:v14];
    [(JavaUtilLoggingLogRecord *)v13 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v13 setSourceMethodNameWithNSString:a5];
    id v16 = a7;
    unint64_t v15 = +[IOSObjectArray arrayWithObjects:&v16 count:1 type:NSObject_class_()];
    -[JavaUtilLoggingLogRecord setParametersWithNSObjectArray:](v13, "setParametersWithNSObjectArray:", v15, v16);
    sub_10023D548(self, v13);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v13];
  }
}

- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSObjectArray:(id)a7
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v13 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a6);
    unint64_t v14 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v13 setLoggerNameWithNSString:v14];
    [(JavaUtilLoggingLogRecord *)v13 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v13 setSourceMethodNameWithNSString:a5];
    [(JavaUtilLoggingLogRecord *)v13 setParametersWithNSObjectArray:a7];
    sub_10023D548(self, v13);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v13];
  }
}

- (void)logpWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withJavaLangThrowable:(id)a7
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v13 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a6);
    unint64_t v14 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v13 setLoggerNameWithNSString:v14];
    [(JavaUtilLoggingLogRecord *)v13 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v13 setSourceMethodNameWithNSString:a5];
    [(JavaUtilLoggingLogRecord *)v13 setThrownWithJavaLangThrowable:a7];
    sub_10023D548(self, v13);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v13];
  }
}

- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v13 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a7);
    if (a6)
    {
      [(JavaUtilLoggingLogRecord *)v13 setResourceBundleWithJavaUtilResourceBundle:JavaUtilLoggingLogger_loadResourceBundleWithNSString_((__CFString *)a6)];
      [(JavaUtilLoggingLogRecord *)v13 setResourceBundleNameWithNSString:a6];
    }
    unint64_t v14 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v13 setLoggerNameWithNSString:v14];
    [(JavaUtilLoggingLogRecord *)v13 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v13 setSourceMethodNameWithNSString:a5];
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v13];
  }
}

- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withId:(id)a8
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v15 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a7);
    if (a6)
    {
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleWithJavaUtilResourceBundle:JavaUtilLoggingLogger_loadResourceBundleWithNSString_((__CFString *)a6)];
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleNameWithNSString:a6];
    }
    unint64_t v16 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v15 setLoggerNameWithNSString:v16];
    [(JavaUtilLoggingLogRecord *)v15 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v15 setSourceMethodNameWithNSString:a5];
    id v18 = a8;
    uint64_t v17 = +[IOSObjectArray arrayWithObjects:&v18 count:1 type:NSObject_class_()];
    -[JavaUtilLoggingLogRecord setParametersWithNSObjectArray:](v15, "setParametersWithNSObjectArray:", v17, v18);
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v15];
  }
}

- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withNSObjectArray:(id)a8
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v15 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a7);
    if (a6)
    {
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleWithJavaUtilResourceBundle:JavaUtilLoggingLogger_loadResourceBundleWithNSString_((__CFString *)a6)];
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleNameWithNSString:a6];
    }
    unint64_t v16 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v15 setLoggerNameWithNSString:v16];
    [(JavaUtilLoggingLogRecord *)v15 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v15 setSourceMethodNameWithNSString:a5];
    [(JavaUtilLoggingLogRecord *)v15 setParametersWithNSObjectArray:a8];
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v15];
  }
}

- (void)logrbWithJavaUtilLoggingLevel:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7 withJavaLangThrowable:(id)a8
{
  if (sub_10023D4B4((uint64_t)self, a3))
  {
    unint64_t v15 = new_JavaUtilLoggingLogRecord_initWithJavaUtilLoggingLevel_withNSString_(a3, a7);
    if (a6)
    {
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleWithJavaUtilResourceBundle:JavaUtilLoggingLogger_loadResourceBundleWithNSString_((__CFString *)a6)];
      [(JavaUtilLoggingLogRecord *)v15 setResourceBundleNameWithNSString:a6];
    }
    unint64_t v16 = atomic_load((unint64_t *)&self->name_);
    [(JavaUtilLoggingLogRecord *)v15 setLoggerNameWithNSString:v16];
    [(JavaUtilLoggingLogRecord *)v15 setSourceClassNameWithNSString:a4];
    [(JavaUtilLoggingLogRecord *)v15 setSourceMethodNameWithNSString:a5];
    [(JavaUtilLoggingLogRecord *)v15 setThrownWithJavaLangThrowable:a8];
    [(JavaUtilLoggingLogger *)self logWithJavaUtilLoggingLogRecord:v15];
  }
}

- (void)reset
{
  JreVolatileStrongAssign((atomic_ullong *)&self->levelObjVal_, 0);
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!JavaUtilLoggingLevel_INFO_
    || (atomic_store([(id)JavaUtilLoggingLevel_INFO_ intValue], (unsigned int *)&self->levelIntVal_), v11 = 0u, long long v12 = 0u, v9 = 0u, v10 = 0u, (handlers = self->handlers_) == 0))
  {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilList *)self->handlers_ countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(handlers);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        if (-[JavaUtilList removeWithId:](self->handlers_, "removeWithId:", v7, (void)v9))
        {
          if (!v7) {
            JreThrowNullPointerException();
          }
          [v7 close];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v8 = [(JavaUtilList *)handlers countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v4 = v8;
    }
    while (v8);
  }
}

- (void)dealloc
{
  JreReleaseVolatile(&self->name_);
  JreReleaseVolatile(&self->levelObjVal_);

  JreReleaseVolatile(&self->resourceBundleName_);
  JreReleaseVolatile(&self->resourceBundle_);

  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingLogger;
  [(JavaUtilLoggingLogger *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingLogger;
  [(JavaUtilLoggingLogger *)&v3 __javaClone];
  JreRetainVolatile(&self->name_);

  JreRetainVolatile(&self->levelObjVal_);
  JreRetainVolatile(&self->resourceBundleName_);
  JreRetainVolatile(&self->resourceBundle_);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)JavaUtilLoggingLogger_GLOBAL_LOGGER_NAME_;
    objc_super v3 = [JavaUtilLoggingLogger alloc];
    JavaUtilLoggingLogger_initWithNSString_withNSString_((uint64_t)v3, v2, 0);
    JreStrongAssignAndConsume((id *)&JavaUtilLoggingLogger_global_, v3);
    id v4 = +[IOSObjectArray newArrayWithLength:0 type:JavaUtilLoggingHandler_class_()];
    JreStrongAssignAndConsume((id *)&qword_100561140, v4);
    atomic_store(1u, (unsigned __int8 *)JavaUtilLoggingLogger__initialized);
  }
}

+ (id)__annotations_global_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045C088;
}

- (void).cxx_destruct
{
}

@end