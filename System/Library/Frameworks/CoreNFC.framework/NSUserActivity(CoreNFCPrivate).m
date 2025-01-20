@interface NSUserActivity(CoreNFCPrivate)
- (void)setNdefMessagePayload:()CoreNFCPrivate;
@end

@implementation NSUserActivity(CoreNFCPrivate)

- (void)setNdefMessagePayload:()CoreNFCPrivate
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = 0;
    v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v29];
    v7 = v29;
    if (v7)
    {
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v12 = 45;
        if (isMetaClass) {
          uint64_t v12 = 43;
        }
        v9(3, "%c[%{public}s %{public}s]:%i Archive error: %@", v12, ClassName, Name, 56, v7);
      }
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = object_getClass(a1);
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        v16 = object_getClassName(a1);
        v17 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v31 = v15;
        __int16 v32 = 2082;
        v33 = v16;
        __int16 v34 = 2082;
        v35 = v17;
        __int16 v36 = 1024;
        int v37 = 56;
        __int16 v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_2214B8000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Archive error: %@", buf, 0x2Cu);
      }
    }
    else
    {
      [a1 _setPayload:v6 object:0 identifier:@"com.apple.corenfc.useractivity.ndefmessagepayload" dirty:0];
    }
  }
  else
  {
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(a1);
      BOOL v21 = class_isMetaClass(v20);
      v22 = object_getClassName(a1);
      v28 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Unexpected class type for the message", v23, v22, v28, 47);
    }
    v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v31 = v25;
      __int16 v32 = 2082;
      v33 = object_getClassName(a1);
      __int16 v34 = 2082;
      v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 47;
      _os_log_impl(&dword_2214B8000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected class type for the message", buf, 0x22u);
    }
  }
}

@end