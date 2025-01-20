@interface NSString(HAPAdditions)
- (id)hap_validatedAndNormalizedUUIDString;
@end

@implementation NSString(HAPAdditions)

- (id)hap_validatedAndNormalizedUUIDString
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a1];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-1000-8000-0026BB765291"];
    int v4 = [v2 isEqual:v3];

    if (v4)
    {
      v5 = (void *)MEMORY[0x1D944E080]();
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = a1;
        v8 = "%{public}@### UUID type %@ is using the HAP Base UUID";
LABEL_8:
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v9 = [v2 UUIDString];
  }
  else
  {
    if ([a1 characterAtIndex:0] == 48)
    {
      v5 = (void *)MEMORY[0x1D944E080]();
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = a1;
        v8 = "%{public}@### UUID type %@ starts with a '0'";
        goto LABEL_8;
      }
LABEL_9:

LABEL_10:
      v9 = 0;
      goto LABEL_12;
    }
    memset(v32, 0, sizeof(v32));
    id v11 = a1;
    [v11 UTF8String];
    int v12 = NormalizeUUIDString();
    if (v12)
    {
      int v13 = v12;
      int v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      memset(buf, 0, sizeof(buf));
      uint64_t ErrorString = DebugGetErrorString();
      v5 = (void *)MEMORY[0x1D944E080](ErrorString);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v18 = 138544130;
        v19 = v16;
        __int16 v20 = 1024;
        int v21 = v13;
        __int16 v22 = 2080;
        v23 = buf;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@### Error: %d(%s) creating UUID string from type: %@.", (uint8_t *)&v18, 0x26u);
      }
      goto LABEL_10;
    }
    v17 = [NSString stringWithUTF8String:v32];
    v9 = [v17 uppercaseString];
  }
LABEL_12:

  return v9;
}

@end