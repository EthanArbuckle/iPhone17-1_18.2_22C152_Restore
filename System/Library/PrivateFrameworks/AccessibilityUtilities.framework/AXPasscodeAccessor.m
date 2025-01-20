@interface AXPasscodeAccessor
- (AXPasscodeAccessor)initWithServiceName:(id)a3 accountName:(id)a4 groupName:(id)a5 logFacility:(id)a6;
- (BOOL)attemptToSetPasscode:(id)a3;
- (NSString)accountName;
- (NSString)groupName;
- (NSString)passcode;
- (NSString)serviceName;
- (OS_os_log)logFacility;
- (__CFDictionary)_newQuery;
@end

@implementation AXPasscodeAccessor

- (AXPasscodeAccessor)initWithServiceName:(id)a3 accountName:(id)a4 groupName:(id)a5 logFacility:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AXPasscodeAccessor;
  v15 = [(AXPasscodeAccessor *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceName, a3);
    objc_storeStrong((id *)&v16->_accountName, a4);
    objc_storeStrong((id *)&v16->_groupName, a5);
    objc_storeStrong((id *)&v16->_logFacility, a6);
  }

  return v16;
}

- (NSString)passcode
{
  v2 = [(AXPasscodeAccessor *)self _newQuery];
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFDictionaryAddValue(v2, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    v4 = &stru_1EDC3DEF8;
    if (!SecItemCopyMatching(v3, &result) && result)
    {
      id v5 = [NSString alloc];
      v4 = (__CFString *)[v5 initWithData:result encoding:4];
      CFRelease(result);
    }
    CFRelease(v3);
  }
  else
  {
    v4 = &stru_1EDC3DEF8;
  }

  return (NSString *)v4;
}

- (BOOL)attemptToSetPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(AXPasscodeAccessor *)self _newQuery];
  if (v5)
  {
    if ([v4 length]
      && ([v4 dataUsingEncoding:4], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      v8 = [(AXPasscodeAccessor *)self passcode];
      if ([v8 length])
      {
        if (([v8 isEqualToString:v4] & 1) != 0
          || (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0)) == 0)
        {
          OSStatus v11 = 0;
        }
        else
        {
          CFDictionaryRef v10 = Mutable;
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v7);
          OSStatus v11 = SecItemUpdate(v5, v10);
          CFRelease(v10);
        }
      }
      else
      {
        CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E4F3BD38], v7);
        OSStatus v11 = SecItemAdd(v5, 0);
      }

      char v12 = 0;
    }
    else
    {
      OSStatus v11 = SecItemDelete(v5);
      char v12 = 1;
    }
    CFRelease(v5);
    if (v11 == -25300) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    if (v11) {
      LOBYTE(v5) = v13;
    }
    else {
      LOBYTE(v5) = 1;
    }
    if ((v5 & 1) == 0)
    {
      id v14 = [(AXPasscodeAccessor *)self logFacility];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        [(AXPasscodeAccessor *)v12 attemptToSetPasscode:v14];
      }

      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (__CFDictionary)_newQuery
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  id v4 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B580]);
    id v5 = (const void *)*MEMORY[0x1E4F3B850];
    uint64_t v6 = [(AXPasscodeAccessor *)self serviceName];
    CFDictionaryAddValue(v4, v5, v6);

    v7 = (const void *)*MEMORY[0x1E4F3B5C0];
    v8 = [(AXPasscodeAccessor *)self accountName];
    CFDictionaryAddValue(v4, v7, v8);

    v9 = (const void *)*MEMORY[0x1E4F3B550];
    CFDictionaryRef v10 = [(AXPasscodeAccessor *)self groupName];
    CFDictionaryAddValue(v4, v9, v10);
  }
  return v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (OS_os_log)logFacility
{
  return self->_logFacility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFacility, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_accountName, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)attemptToSetPasscode:(os_log_t)log .cold.1(char a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = @"save";
  if (a1) {
    CFDictionaryRef v3 = @"delete";
  }
  int v4 = 138543618;
  id v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "Could not %{public}@ passcode. Error code: %ld", (uint8_t *)&v4, 0x16u);
}

@end