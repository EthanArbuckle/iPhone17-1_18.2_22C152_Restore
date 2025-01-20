@interface AAAttribution
+ (NSString)attributionTokenWithError:(NSError *)error;
+ (id)setupXPCConnection;
@end

@implementation AAAttribution

+ (NSString)attributionTokenWithError:(NSError *)error
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v4 = sub_235F71790();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235F70000, v4, OS_LOG_TYPE_INFO, "Attribution Token request", buf, 2u);
  }

  v10 = objc_msgSend_now(MEMORY[0x263EFF910], v5, v6, v7, v8, v9);
  v11 = [AAAttributionRequester alloc];
  v17 = objc_msgSend_setupXPCConnection(AAAttribution, v12, v13, v14, v15, v16);
  char isMainThread = objc_msgSend_isMainThread(MEMORY[0x263F08B88], v18, v19, v20, v21, v22);
  v24 = sub_235F718B0((id *)&v11->super.isa, v17, isMainThread, v10);

  id v36 = 0;
  v25 = sub_235F71A44(v24, &v36);
  id v26 = v36;
  v27 = sub_235F71790();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v25 || !v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      _os_log_impl(&dword_235F70000, v27, OS_LOG_TYPE_INFO, "Returning token to caller: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v28)
    {
      v34 = objc_msgSend_localizedDescription(v26, v29, v30, v31, v32, v33);
      *(_DWORD *)buf = 138543362;
      v38 = v34;
      _os_log_impl(&dword_235F70000, v27, OS_LOG_TYPE_INFO, "Returning error to caller: %{public}@", buf, 0xCu);
    }
    if (error) {
      *error = (NSError *)v26;
    }
  }

  return (NSString *)v25;
}

+ (id)setupXPCConnection
{
  id v2 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v6 = objc_msgSend_initWithMachServiceName_options_(v2, v3, @"com.apple.ap.promotedcontent.attributionservice", 4096, v4, v5);
  v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v7, (uint64_t)&unk_26E951EE8, v8, v9, v10);
  objc_msgSend_setRemoteObjectInterface_(v6, v12, (uint64_t)v11, v13, v14, v15);

  objc_msgSend_resume(v6, v16, v17, v18, v19, v20);

  return v6;
}

@end