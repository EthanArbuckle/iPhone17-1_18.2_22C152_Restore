@interface NSURLProtectionSpace(SafariServicesExtras)
- (BOOL)_sf_canAuthenticate;
- (id)_sf_highLevelDomainAndPort;
- (id)_sf_identities;
- (void)_sf_canAuthenticate;
@end

@implementation NSURLProtectionSpace(SafariServicesExtras)

- (id)_sf_highLevelDomainAndPort
{
  v2 = [a1 host];
  v3 = NSString;
  uint64_t v4 = objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = v2;
  }
  v7 = [v3 stringWithFormat:@"%@:%ld", v6, objc_msgSend(a1, "port")];

  return v7;
}

- (id)_sf_identities
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFTypeRef result = 0;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setValue:*MEMORY[0x1E4F3B990] forKey:*MEMORY[0x1E4F3B978]];
    [v2 setValue:*MEMORY[0x1E4F3BB88] forKey:*MEMORY[0x1E4F3BB80]];
    [v2 setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3BC80]];
    [v2 setValue:@"com.apple.identities" forKey:*MEMORY[0x1E4F3B550]];
    if (SecItemCopyMatching((CFDictionaryRef)v2, &result))
    {
      id v3 = 0;
    }
    else
    {
      uint64_t v4 = (void *)result;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = [a1 distinguishedNames];
        v6 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          uint64_t v8 = [v4 count];
          uint64_t v9 = [v5 count];
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Unfiltered identities count: %lu, distinguished names count: %lu", buf, 0x16u);
        }
        if (v5)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          uint64_t v29 = 0;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          v18 = __60__NSURLProtectionSpace_SafariServicesExtras___sf_identities__block_invoke;
          v19 = &unk_1E5C786C0;
          CFAbsoluteTime v22 = Current;
          id v20 = v5;
          v21 = buf;
          v11 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &v16);
          v12 = (id)WBS_LOG_CHANNEL_PREFIXClientAuthentication();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = objc_msgSend(v11, "count", v16, v17, v18, v19);
            uint64_t v14 = *(void *)(*(void *)&buf[8] + 24);
            *(_DWORD *)v24 = 134218240;
            uint64_t v25 = v13;
            __int16 v26 = 2048;
            uint64_t v27 = v14;
            _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "Filtered identities count: %lu, expired count: %lu", v24, 0x16u);
          }

          if ([v11 count]) {
            id v3 = v11;
          }
          else {
            id v3 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v3 = v4;
        }
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_sf_canAuthenticate
{
  id v2 = [a1 authenticationMethod];
  if (([v2 isEqualToString:*MEMORY[0x1E4F18C80]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F18C90]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F18C98]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F18C88]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4F18CA0]] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F18C78]])
  {
    v5 = objc_msgSend(a1, "_sf_identities");
    BOOL v3 = [v5 count] != 0;
  }
  else
  {
    if (([v2 isEqualToString:*MEMORY[0x1E4F18CB0]] & 1) == 0)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(NSURLProtectionSpace(SafariServicesExtras) *)(uint64_t)v2 _sf_canAuthenticate];
      }
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_sf_canAuthenticate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Tried to authenticate with unsupported authentication method: %@", (uint8_t *)&v2, 0xCu);
}

@end