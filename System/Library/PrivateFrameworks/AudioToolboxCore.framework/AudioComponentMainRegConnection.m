@interface AudioComponentMainRegConnection
- (AudioComponentMainRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4;
- (id).cxx_construct;
- (void)canRegisterComponent:(id)a3 reply:(id)a4;
- (void)getComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 includeExtensions:(BOOL)a5 forceWaitForExtensions:(BOOL)a6 reply:(id)a7;
@end

@implementation AudioComponentMainRegConnection

- (AudioComponentMainRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AudioComponentMainRegConnection;
  v7 = [(AudioComponentMainRegConnection *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->mImpl = a3;
    objc_storeWeak((id *)&v7->mConnInfo.mConnection, v6);
  }

  return v8;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = -1;
  *((unsigned char *)self + 28) = 0;
  return self;
}

- (void)getComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 includeExtensions:(BOOL)a5 forceWaitForExtensions:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = self->mImpl;
  id v12 = a3;
  id v13 = a7;
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v14 = *(id *)gAudioComponentLogCategory;
  id canUseExtensions = (id)os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (canUseExtensions)
  {
    *(_DWORD *)v26 = 136315906;
    *(void *)&v26[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 329;
    *(_WORD *)&v26[18] = 1024;
    *(_DWORD *)&v26[20] = v9;
    LOWORD(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 2) = v8;
    _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getComponentList includeExtensions: %d waitForExtensions: %d", v26, 0x1Eu);
  }
  uint64_t v16 = *((void *)mImpl + 31);
  if (v16)
  {
    id canUseExtensions = *(id *)(*(void *)v16 + 96);
    v17 = canUseExtensions;
  }
  else
  {
    v17 = 0;
  }
  int mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    id canUseExtensions = (id)ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    int mExtUsePermission = (int)canUseExtensions;
    self->mConnInfo.int mExtUsePermission = (int)canUseExtensions;
  }
  if (!v9) {
    goto LABEL_20;
  }
  if (*(unsigned char *)mImpl) {
    goto LABEL_20;
  }
  unsigned __int8 v19 = atomic_load((unsigned __int8 *)mImpl + 2);
  if (v19 & 1) != 0 || (PlatformUtilities_iOS::_eaJyFmO((PlatformUtilities_iOS *)canUseExtensions)) {
    goto LABEL_20;
  }
  uint64_t v20 = *((void *)mImpl + 9);
  if (!v20) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v20 + 48))(v20))
  {
LABEL_20:
    if (mExtUsePermission == 1)
    {
      unsigned __int8 v24 = atomic_load((unsigned __int8 *)mImpl + 2);
      int v25 = v24 & 1;
    }
    else
    {
      int v25 = 0;
    }
    AudioComponentRegistrarImpl::replyWithComponentList((uint64_t)mImpl, v25, v12, v17, v13);
  }
  else
  {
    *(void *)v26 = MEMORY[0x1E4F143A8];
    *(void *)&v26[8] = 3221225472;
    *(void *)&v26[16] = ___ZN27AudioComponentRegistrarImpl16getComponentListER14ConnectionInfoP8NSStringbbU13block_pointerFvP6NSDatabS5_P7NSArrayE_block_invoke;
    v27 = &unk_1E5688B58;
    v31 = mImpl;
    BOOL v32 = mExtUsePermission == 1;
    id v28 = v12;
    id v29 = v17;
    id v30 = v13;
    v21 = v26;
    if (!*((void *)mImpl + 32)) {
      operator new();
    }
    v22 = *((void *)mImpl + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN27AudioComponentRegistrarImpl21_initialExtensionScanEU13block_pointerFvvE_block_invoke;
    block[3] = &unk_1E5688B30;
    id v34 = v21;
    v35 = mImpl;
    v23 = v21;
    dispatch_async(v22, block);
  }
}

- (void).cxx_destruct
{
}

- (void)canRegisterComponent:(id)a3 reply:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v37 = (void (**)(id, BOOL))a4;
  memset(&v44, 0, sizeof(v44));
  unsigned int v43 = 0;
  dictionaryToComponentDescription((NSDictionary *)a3, &v44, &v43);
  CAFormatter::CAFormatter((CAFormatter *)&v42, &v44);
  {
    *(void *)&long long v56 = @"sandboxing-required";
    *((void *)&v56 + 1) = @"entitlements-required";
    *(void *)buf = MEMORY[0x1E4F1CC28];
    *(void *)&buf[8] = &unk_1EDFB2E78;
    AudioComponentRegistrarImpl::componentRequirements(AudioComponentDescription const&)::audibleAudioFileEntitlements = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v56 count:2];
  }
  if (v44.componentType == 1633969507)
  {
    OSType componentSubType = v44.componentSubType;
    if (v44.componentSubType == 1633771875)
    {
LABEL_8:
      id v8 = (id)AudioComponentRegistrarImpl::componentRequirements(AudioComponentDescription const&)::audibleAudioFileEntitlements;
      goto LABEL_10;
    }
    int v7 = 1096107074;
  }
  else
  {
    if (v44.componentType != 1634101612) {
      goto LABEL_9;
    }
    OSType componentSubType = v44.componentSubType;
    int v7 = 1635083362;
  }
  if (componentSubType == v7) {
    goto LABEL_8;
  }
LABEL_9:
  id v8 = 0;
LABEL_10:
  v35 = v8;
  uint64_t v36 = [v8 valueForKey:@"entitlements-required"];
  if ([v36 count])
  {
    BOOL v9 = [v8 valueForKey:@"sandboxing-required"];
    int v10 = [v9 BOOLValue];

    if (!v10) {
      goto LABEL_22;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->mConnInfo.mConnection);
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained auditToken];
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
    }
    *(_OWORD *)buf = v40;
    *(_OWORD *)&buf[16] = v41;
    BOOL v15 = sandbox_check_by_audit_token() == 0;

    if (v15)
    {
      if (!gAudioComponentLogCategory) {
        operator new();
      }
      v33 = *(id *)gAudioComponentLogCategory;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "AudioComponentRegistrar.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 491;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v42;
        _os_log_impl(&dword_18FEC0000, v33, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent %s: NO, for a non-sandboxed process attempting to register a component that requires sandboxing", buf, 0x1Cu);
      }
    }
    else
    {
LABEL_22:
      id v16 = objc_loadWeakRetained((id *)&self->mConnInfo.mConnection);
      v17 = v16;
      if (v16) {
        [v16 auditToken];
      }
      else {
        memset(&token, 0, sizeof(token));
      }
      task = SecTaskCreateWithAuditToken(0, &token);

      if (task)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v18 = v36;
        uint64_t v19 = 0;
        uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:buf count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v57 != v21) {
                objc_enumerationMutation(v18);
              }
              CFStringRef v23 = *(const __CFString **)(*((void *)&v56 + 1) + 8 * i);
              unsigned __int8 v24 = (const char *)[v18 objectForKey:v23];
              CFTypeRef v25 = SecTaskCopyValueForEntitlement(task, v23, 0);
              if (!gAudioComponentLogCategory) {
                operator new();
              }
              v26 = *(id *)gAudioComponentLogCategory;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v45 = 136316162;
                v46 = "AudioComponentRegistrar.mm";
                __int16 v47 = 1024;
                int v48 = 503;
                __int16 v49 = 2112;
                v50 = (void *)v23;
                __int16 v51 = 2112;
                v52 = v24;
                __int16 v53 = 2112;
                CFTypeRef v54 = v25;
                _os_log_impl(&dword_18FEC0000, v26, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent: entitlement \"%@\" requires value %@, prospective registrant has value %@", v45, 0x30u);
              }
              if (v25)
              {
                if (CFEqual(v24, v25)) {
                  ++v19;
                }
                CFRelease(v25);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:buf count:16];
          }
          while (v20);
        }

        uint64_t v28 = [v18 count];
        BOOL v29 = v19 == v28;
        if (!gAudioComponentLogCategory) {
          operator new();
        }
        id v30 = *(id *)gAudioComponentLogCategory;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          BOOL v32 = "NO";
          *(_DWORD *)v45 = 136315906;
          if (v19 == v28) {
            BOOL v32 = "YES, possessing all required entitlements";
          }
          v46 = "AudioComponentRegistrar.mm";
          __int16 v47 = 1024;
          int v48 = 512;
          __int16 v49 = 2080;
          v50 = v42;
          __int16 v51 = 2080;
          v52 = v32;
          _os_log_impl(&dword_18FEC0000, v30, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent %s: %s", v45, 0x26u);
        }
        CFRelease(task);
        goto LABEL_56;
      }
    }
    BOOL v29 = 0;
LABEL_56:
    v37[2](v37, v29);
    goto LABEL_57;
  }
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  id v13 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 481;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v42;
    _os_log_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d canRegisterComponent %s: YES, requiring no entitlements", buf, 0x1Cu);
  }
  v37[2](v37, 1);
LABEL_57:

  if (v42) {
    free(v42);
  }
}

@end