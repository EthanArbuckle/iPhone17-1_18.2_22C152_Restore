@interface ContextManager
+ (id)sharedInstance;
- (ContextManager)init;
- (id)_pathForModule:(int64_t)a3 error:(id *)a4;
- (id)_proxiesForContext:(id)a3;
- (id)contextForUUID:(id)a3;
- (id)dumpStatus;
- (id)findContextForExternalizedContext:(id)a3;
- (id)loadModule:(int64_t)a3 error:(id *)a4;
- (void)_logClass:(Class)a3 tag:(id)a4;
- (void)_logClass:(Class)a3 tag:(id)a4 level:(int)a5;
- (void)addContext:(id)a3;
- (void)addContextProxy:(id)a3;
- (void)registerExternalizedContext:(id)a3 forContext:(id)a4;
@end

@implementation ContextManager

- (void)addContext:(id)a3
{
  contextMap = self->_contextMap;
  id v4 = a3;
  id v5 = [v4 uuid];
  [(NSMapTable *)contextMap setObject:v4 forKey:v5];
}

- (void)addContextProxy:(id)a3
{
  contextProxyMap = self->_contextProxyMap;
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(NSMapTable *)contextProxyMap setObject:v4 forKey:v5];
}

- (id)loadModule:(int64_t)a3 error:(id *)a4
{
  v7 = LALogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Loading module:%d", buf, 8u);
  }

  modules = self->_modules;
  v9 = +[NSNumber numberWithInteger:a3];
  id v10 = [(NSMutableDictionary *)modules objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v24 = 0;
  v13 = [(ContextManager *)self _pathForModule:a3 error:&v24];
  id v11 = v24;
  if (!v13)
  {
    v15 = 0;
    id v10 = 0;
    goto LABEL_27;
  }
  v14 = +[NSBundle bundleWithPath:v13];
  v15 = v14;
  if (!v14)
  {
    v18 = +[NSString stringWithFormat:@"Failed to load plugin: %@", v13];
    id v17 = +[LAErrorHelper internalErrorWithMessage:v18];

    id v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v23 = v11;
  unsigned int v16 = [v14 loadAndReturnError:&v23];
  id v17 = v23;

  if (v16)
  {
    id v10 = [v15 principalClass];
    if (v10)
    {
      if ([v10 isSubclassOfClass:objc_opt_class()])
      {
        id v10 = (id)objc_opt_new();
      }
      else
      {
        v20 = LALogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100027C88((uint64_t)v15, (uint64_t)v13, v20);
        }

        [(ContextManager *)self _logClass:v10 tag:@"cls"];
        -[ContextManager _logClass:tag:](self, "_logClass:tag:", [v15 principalClass], @"bundle.principalClass");
        [(ContextManager *)self _logClass:objc_opt_class() tag:@"Module.class"];
        id v10 = (id)objc_opt_new();
        v21 = LALogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100027C10((uint64_t)v10, v21);
        }
      }
      v22 = self->_modules;
      v18 = +[NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v22 setObject:v10 forKey:v18];
    }
    else
    {
      v18 = +[NSString stringWithFormat:@"No principal class in bundle: %@", v15];
      uint64_t v19 = +[LAErrorHelper internalErrorWithMessage:v18];

      id v17 = (id)v19;
    }
    goto LABEL_25;
  }
  id v10 = 0;
LABEL_26:
  id v11 = v17;
LABEL_27:

  if (a4) {
LABEL_5:
  }
    *a4 = v11;
LABEL_6:

  return v10;
}

- (void)registerExternalizedContext:(id)a3 forContext:(id)a4
{
}

+ (id)sharedInstance
{
  if (qword_100046EB0 != -1) {
    dispatch_once(&qword_100046EB0, &stru_100039288);
  }
  v2 = (void *)qword_100046EA8;

  return v2;
}

- (ContextManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)ContextManager;
  v2 = [(ContextManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    contextMap = v2->_contextMap;
    v2->_contextMap = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable strongToWeakObjectsMapTable];
    contextProxyMap = v2->_contextProxyMap;
    v2->_contextProxyMap = (NSMapTable *)v5;

    uint64_t v7 = +[NSMapTable strongToWeakObjectsMapTable];
    contextByExternalizedContextMap = v2->_contextByExternalizedContextMap;
    v2->_contextByExternalizedContextMap = (NSMapTable *)v7;

    uint64_t v9 = objc_opt_new();
    modules = v2->_modules;
    v2->_modules = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (id)contextForUUID:(id)a3
{
  return [(NSMapTable *)self->_contextMap objectForKey:a3];
}

- (id)findContextForExternalizedContext:(id)a3
{
  return [(NSMapTable *)self->_contextByExternalizedContextMap objectForKey:a3];
}

- (id)_pathForModule:(int64_t)a3 error:(id *)a4
{
  if (a3 != 1)
  {
    uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    v8 = +[NSString stringWithFormat:@"Unknown module: %@", v7];
    v6 = +[LAErrorHelper internalErrorWithMessage:v8];

    uint64_t v5 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v5 = +[NSString stringWithFormat:@"/System/Library/Frameworks/LocalAuthentication.framework/Support/ModulePlugins/%@.bundle", @"ModuleACM"];
  v6 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v6;
LABEL_6:

  return v5;
}

- (void)_logClass:(Class)a3 tag:(id)a4
{
  id v10 = a4;
  -[ContextManager _logClass:tag:level:](self, "_logClass:tag:level:", a3);
  Class Superclass = class_getSuperclass(a3);
  if (Superclass)
  {
    uint64_t v7 = Superclass;
    int v8 = 1;
    do
    {
      int v9 = v8 + 1;
      -[ContextManager _logClass:tag:level:](self, "_logClass:tag:level:", v7, v10);
      uint64_t v7 = class_getSuperclass(v7);
      int v8 = v9;
    }
    while (v7);
  }
}

- (void)_logClass:(Class)a3 tag:(id)a4 level:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  int v8 = LALogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    if (v5)
    {
      v15 = +[NSString stringWithFormat:@"superclass[%d]", v5];
    }
    else
    {
      v15 = @"class";
    }
    *(_DWORD *)buf = 138544642;
    *(void *)v18 = v7;
    *(_WORD *)&v18[8] = 2114;
    *(void *)&v18[10] = v15;
    __int16 v19 = 2114;
    Class v20 = a3;
    __int16 v21 = 2048;
    Class v22 = a3;
    __int16 v23 = 1024;
    int Version = class_getVersion(a3);
    __int16 v25 = 2082;
    ImageName = class_getImageName(a3);
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] %{public}@ (%p), version: %d, image: %{public}s", buf, 0x3Au);
    if (v5) {
  }
    }
  if (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) == 0)
  {
    unsigned int outCount = 0;
    int v9 = class_copyMethodList(a3, &outCount);
    if (v9)
    {
      id v10 = v9;
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          objc_super v12 = LALogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            Name = method_getName(v10[i]);
            v14 = sel_getName(Name);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v18 = i;
            *(_WORD *)&v18[4] = 2082;
            *(void *)&v18[6] = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "    method[%d]: %{public}s", buf, 0x12u);
          }
        }
      }
      free(v10);
    }
  }
}

- (id)dumpStatus
{
  id v20 = (id)objc_opt_new();
  __int16 v19 = objc_opt_new();
  [v19 setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  id obj = [(NSMapTable *)self->_contextMap objectEnumerator];
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v25[0] = @"object";
        int v8 = [v7 description];
        v26[0] = v8;
        v25[1] = @"created";
        int v9 = [v7 plugin];
        id v10 = [v9 creationTime];
        id v11 = [v19 stringFromDate:v10];
        v26[1] = v11;
        v25[2] = @"proxies";
        objc_super v12 = [(ContextManager *)v18 _proxiesForContext:v7];
        v26[2] = v12;
        v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

        v14 = [v7 uuid];
        v15 = [v14 UUIDString];
        [v20 setObject:v13 forKey:v15];
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }

  return v20;
}

- (id)_proxiesForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(NSMapTable *)self->_contextProxyMap objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 managedContext];

        if (v12 == v4)
        {
          uint64_t v13 = +[Caller pathFromPid:](Caller, "pathFromPid:", [v11 processId]);
          v14 = (void *)v13;
          if (v13) {
            CFStringRef v15 = (const __CFString *)v13;
          }
          else {
            CFStringRef v15 = @"PID";
          }
          unsigned int v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ held by %@[%d]", v11, v15, [v11 processId]);

          [v5 addObject:v16];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_contextByExternalizedContextMap, 0);
  objc_storeStrong((id *)&self->_contextProxyMap, 0);

  objc_storeStrong((id *)&self->_contextMap, 0);
}

@end