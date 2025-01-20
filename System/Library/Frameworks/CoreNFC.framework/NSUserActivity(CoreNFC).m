@interface NSUserActivity(CoreNFC)
- (NFCNDEFMessage)ndefMessagePayload;
@end

@implementation NSUserActivity(CoreNFC)

- (NFCNDEFMessage)ndefMessagePayload
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = [a1 _payloadForIdentifier:@"com.apple.corenfc.useractivity.ndefmessagepayload"];
  id v22 = 0;
  v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v22];
  id v6 = v22;
  if (v6)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Unarchive error: %@", v11, ClassName, Name, 29, v6);
    }
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      v15 = object_getClassName(a1);
      v16 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v24 = v14;
      __int16 v25 = 2082;
      v26 = v15;
      __int16 v27 = 2082;
      v28 = v16;
      __int16 v29 = 1024;
      int v30 = 29;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unarchive error: %@", buf, 0x2Cu);
    }

    v17 = [[NFCNDEFMessage alloc] initWithEmptyNdefMessage];
  }
  else
  {
    v17 = v5;
  }
  v18 = v17;

  return v18;
}

@end