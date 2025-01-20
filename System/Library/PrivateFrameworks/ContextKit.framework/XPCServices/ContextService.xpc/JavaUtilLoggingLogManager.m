@interface JavaUtilLoggingLogManager
+ (const)__metadata;
+ (id)checkConfiguration;
+ (id)getInstanceByClassWithNSString:(id)a3;
+ (id)getLogManager;
+ (id)getLoggingMXBean;
+ (void)initialize;
- (BOOL)addLoggerWithJavaUtilLoggingLogger:(id)a3;
- (JavaUtilLoggingLogManager)init;
- (id)getLoggerNames;
- (id)getLoggerWithNSString:(id)a3;
- (id)getOrCreateWithNSString:(id)a3 withNSString:(id)a4;
- (id)getPropertyWithNSString:(id)a3;
- (void)addPropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3;
- (void)addToFamilyTreeWithJavaUtilLoggingLogger:(id)a3 withNSString:(id)a4;
- (void)dealloc;
- (void)readConfiguration;
- (void)readConfigurationImplWithJavaIoInputStream:(id)a3;
- (void)readConfigurationWithJavaIoInputStream:(id)a3;
- (void)removePropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3;
- (void)reset;
- (void)setLevelRecursivelyWithJavaUtilLoggingLogger:(id)a3 withJavaUtilLoggingLevel:(id)a4;
- (void)setParentWithJavaUtilLoggingLogger:(id)a3 withJavaUtilLoggingLogger:(id)a4;
@end

@implementation JavaUtilLoggingLogManager

+ (id)getLoggingMXBean
{
}

- (JavaUtilLoggingLogManager)init
{
  return self;
}

- (BOOL)addLoggerWithJavaUtilLoggingLogger:(id)a3
{
  objc_sync_enter(self);
  if (!a3 || (id v5 = [a3 getName], (loggers = self->loggers_) == 0)) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilHashtable *)loggers getWithId:v5];
  if (!v7)
  {
    sub_1001AD9C4(self, (uint64_t)a3, v5);
    [(JavaUtilHashtable *)self->loggers_ putWithId:v5 withId:a3];
    [a3 setManagerWithJavaUtilLoggingLogManager:self];
  }
  objc_sync_exit(self);
  return v7 == 0;
}

- (void)addToFamilyTreeWithJavaUtilLoggingLogger:(id)a3 withNSString:(id)a4
{
}

- (id)getLoggerWithNSString:(id)a3
{
  objc_sync_enter(self);
  loggers = self->loggers_;
  if (!loggers) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilHashtable *)loggers getWithId:a3];
  objc_sync_exit(self);
  return v6;
}

- (id)getLoggerNames
{
  objc_sync_enter(self);
  loggers = self->loggers_;
  if (!loggers) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilHashtable *)loggers keys];
  objc_sync_exit(self);
  return v4;
}

+ (id)getLogManager
{
  if ((atomic_load_explicit(JavaUtilLoggingLogManager__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilLoggingLogManager_manager_;
}

- (id)getPropertyWithNSString:(id)a3
{
  props = self->props_;
  if (!props) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilProperties *)props getPropertyWithNSString:a3];
}

- (void)readConfiguration
{
  id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"java.util.logging.config.class");
  if (!PropertyWithNSString
    || !JavaUtilLoggingLogManager_getInstanceByClassWithNSString_((uint64_t)PropertyWithNSString))
  {
    id v4 = JavaLangSystem_getPropertyWithNSString_(@"java.util.logging.config.file");
    if (!v4)
    {
      id v12 = JavaLangSystem_getPropertyWithNSString_(@"java.home");
      if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      id v4 = (void *)JreStrcat("$$$$$", v5, v6, v7, v8, v9, v10, v11, v12);
    }
    if ([new_JavaIoFile_initWithNSString_(v4) exists])
    {
      v13 = new_JavaIoFileInputStream_initWithNSString_(v4);
    }
    else
    {
      id v14 = [(id)JavaUtilLoggingLogManager_class_() getResourceAsStream:@"logging.properties"];
      if (v14)
      {
LABEL_15:
        [(JavaUtilLoggingLogManager *)self readConfigurationWithJavaIoInputStream:new_JavaIoBufferedInputStream_initWithJavaIoInputStream_(v14)];
        LibcoreIoIoUtils_closeQuietlyWithJavaLangAutoCloseable_(v14);
        return;
      }
      if (!JavaUtilLoggingIOSLogHandler_IOS_LOG_MANAGER_DEFAULTS_) {
        JreThrowNullPointerException();
      }
      v13 = new_JavaIoByteArrayInputStream_initWithByteArray_([JavaUtilLoggingIOSLogHandler_IOS_LOG_MANAGER_DEFAULTS_ getBytes]);
    }
    id v14 = v13;
    goto LABEL_15;
  }
}

+ (id)getInstanceByClassWithNSString:(id)a3
{
  return JavaUtilLoggingLogManager_getInstanceByClassWithNSString_((uint64_t)a3);
}

- (void)readConfigurationImplWithJavaIoInputStream:(id)a3
{
}

- (void)readConfigurationWithJavaIoInputStream:(id)a3
{
  [(JavaUtilLoggingLogManager *)self checkAccess];
  sub_1001AE0E4((uint64_t)self, (uint64_t)a3);
}

- (void)reset
{
  objc_sync_enter(self);
  [(JavaUtilLoggingLogManager *)self checkAccess];
  v3 = new_JavaUtilProperties_init();
  JreStrongAssignAndConsume((id *)&self->props_, v3);
  id v4 = [(JavaUtilLoggingLogManager *)self getLoggerNames];
  if (!v4) {
    JreThrowNullPointerException();
  }
  while ([v4 hasMoreElements])
  {
    id v5 = -[JavaUtilLoggingLogManager getLoggerWithNSString:](self, "getLoggerWithNSString:", [v4 nextElement]);
    if (v5) {
      [v5 reset];
    }
  }
  loggers = self->loggers_;
  if (!loggers) {
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilHashtable *)loggers getWithId:&stru_10048C1F8];
  if (v7)
  {
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v7 setLevelWithJavaUtilLoggingLevel:JavaUtilLoggingLevel_INFO_];
  }
  objc_sync_exit(self);
}

- (void)addPropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = new_JavaLangNullPointerException_initWithNSString_(@"l == null");
    objc_exception_throw(v6);
  }
  [(JavaUtilLoggingLogManager *)self checkAccess];
  listeners = self->listeners_;
  if (!listeners) {
    JreThrowNullPointerException();
  }
  [(JavaBeansPropertyChangeSupport *)listeners addPropertyChangeListenerWithJavaBeansPropertyChangeListener:a3];
}

- (void)removePropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3
{
  [(JavaUtilLoggingLogManager *)self checkAccess];
  listeners = self->listeners_;
  if (!listeners) {
    JreThrowNullPointerException();
  }
  [(JavaBeansPropertyChangeSupport *)listeners removePropertyChangeListenerWithJavaBeansPropertyChangeListener:a3];
}

- (id)getOrCreateWithNSString:(id)a3 withNSString:(id)a4
{
  objc_sync_enter(self);
  id v7 = [(JavaUtilLoggingLogManager *)self getLoggerWithNSString:a3];
  if (!v7)
  {
    id v7 = new_JavaUtilLoggingLogger_initWithNSString_withNSString_(a3, (__CFString *)a4);
    [(JavaUtilLoggingLogManager *)self addLoggerWithJavaUtilLoggingLogger:v7];
  }
  objc_sync_exit(self);
  return v7;
}

- (void)setParentWithJavaUtilLoggingLogger:(id)a3 withJavaUtilLoggingLogger:(id)a4
{
  objc_sync_enter(self);
  if (!a3) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)a3 + 1, a4);
  if (!atomic_load((unint64_t *)a3 + 2)) {
    [(JavaUtilLoggingLogManager *)self setLevelRecursivelyWithJavaUtilLoggingLogger:a3 withJavaUtilLoggingLevel:0];
  }
  if (!a4 || (uint64_t v8 = (void *)*((void *)a4 + 4)) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  [v8 addWithId:a3];
  objc_sync_exit(self);
}

- (void)setLevelRecursivelyWithJavaUtilLoggingLogger:(id)a3 withJavaUtilLoggingLevel:(id)a4
{
  objc_sync_enter(self);
  if (!a3) {
    goto LABEL_24;
  }
  unsigned int v7 = atomic_load((unsigned int *)a3 + 6);
  JreVolatileStrongAssign((atomic_ullong *)a3 + 2, a4);
  if (a4)
  {
    unsigned int v8 = [a4 intValue];
    goto LABEL_10;
  }
  if (objc_loadWeak((id *)a3 + 1))
  {
    unsigned int v8 = atomic_load((unsigned int *)objc_loadWeak((id *)a3 + 1) + 6);
    goto LABEL_10;
  }
  if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!JavaUtilLoggingLevel_INFO_) {
LABEL_24:
  }
    JreThrowNullPointerException();
  unsigned int v8 = [(id)JavaUtilLoggingLevel_INFO_ intValue];
LABEL_10:
  atomic_store(v8, (unsigned int *)a3 + 6);
  unsigned int v9 = atomic_load((unsigned int *)a3 + 6);
  if (v7 != v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = (void *)*((void *)a3 + 4);
    if (!v10) {
LABEL_23:
    }
      JreThrowNullPointerException();
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (!v14) {
            goto LABEL_23;
          }
          if (!atomic_load((unint64_t *)(v14 + 16))) {
            -[JavaUtilLoggingLogManager setLevelRecursivelyWithJavaUtilLoggingLogger:withJavaUtilLoggingLevel:](self, "setLevelRecursivelyWithJavaUtilLoggingLogger:withJavaUtilLoggingLevel:", (void)v16);
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLoggingLogManager;
  [(JavaUtilLoggingLogManager *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilLoggingLoggingPermission_initWithNSString_withNSString_();
    JreStrongAssignAndConsume(&qword_100560AA8, v2);
    id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"java.util.logging.manager");
    if (PropertyWithNSString)
    {
      id InstanceByClassWithNSString = JavaUtilLoggingLogManager_getInstanceByClassWithNSString_((uint64_t)PropertyWithNSString);
      objc_opt_class();
      if (InstanceByClassWithNSString && (objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      JreStrongAssign((id *)&JavaUtilLoggingLogManager_manager_, InstanceByClassWithNSString);
    }
    if (!JavaUtilLoggingLogManager_manager_)
    {
      id v5 = [JavaUtilLoggingLogManager alloc];
      JavaUtilLoggingLogManager_init((id *)&v5->super.isa);
      JreStrongAssignAndConsume((id *)&JavaUtilLoggingLogManager_manager_, v5);
    }
    +[JavaUtilLoggingLogManager checkConfiguration]_0();
    uint64_t v6 = new_JavaUtilLoggingLogger_initWithNSString_withNSString_(&stru_10048C1F8, 0);
    if ((atomic_load_explicit(JavaUtilLoggingLevel__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(JavaUtilLoggingLogger *)v6 setLevelWithJavaUtilLoggingLevel:JavaUtilLoggingLevel_INFO_];
    if ((atomic_load_explicit(JavaUtilLoggingLogger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (!JavaUtilLoggingLogger_global_
      || ([(id)JavaUtilLoggingLogger_global_ setParentWithJavaUtilLoggingLogger:v6],
          !JavaUtilLoggingLogManager_manager_))
    {
      JreThrowNullPointerException();
    }
    [(id)JavaUtilLoggingLogManager_manager_ addLoggerWithJavaUtilLoggingLogger:v6];
    unsigned int v7 = (void *)JavaUtilLoggingLogManager_manager_;
    if ((atomic_load_explicit(JavaUtilLoggingLogger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [v7 addLoggerWithJavaUtilLoggingLogger:JavaUtilLoggingLogger_global_];
    atomic_store(1u, (unsigned __int8 *)JavaUtilLoggingLogManager__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100418200;
}

+ (id)checkConfiguration
{
  if ((atomic_load_explicit(JavaUtilLoggingLogManager__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [(id)JavaUtilLoggingLogManager_manager_ readConfiguration];
}

@end