@interface NSError
- (id)_hd_cloudKitErrorRequiringUserActionFromCKErrorDomain;
@end

@implementation NSError

- (id)_hd_cloudKitErrorRequiringUserActionFromCKErrorDomain
{
  if (a1)
  {
    if ([a1 code] == 110)
    {
      v2 = (void *)MEMORY[0x1E4F28C58];
      v3 = [a1 userInfo];
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v5 = @"Manatee container is unavailable, device is in CFU state";
      v6 = v2;
      uint64_t v7 = 706;
LABEL_8:
      v9 = objc_msgSend(v6, "hk_error:description:underlyingError:", v7, v5, v4);

      goto LABEL_9;
    }
    if ([a1 code] == 4 || objc_msgSend(a1, "code") == 3 || objc_msgSend(a1, "code") == 34)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      v3 = [a1 userInfo];
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v5 = @"Network failure during Cloud Sync Operation";
      v6 = v8;
      uint64_t v7 = 704;
      goto LABEL_8;
    }
    if ([a1 code] == 25)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      v3 = [a1 userInfo];
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v5 = @"iCloud Quota Exceeded during Cloud Sync Operation";
      v6 = v11;
      uint64_t v7 = 705;
      goto LABEL_8;
    }
    if ([a1 code] == 33)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v3 = [a1 userInfo];
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v5 = @"The participant may need HSA2 verification";
      v6 = v12;
      uint64_t v7 = 731;
      goto LABEL_8;
    }
    if ([a1 code] == 9)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      v3 = [a1 userInfo];
      v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v5 = @"The user needs to login again into iCloud or accept new user terms and conditions.";
      v6 = v13;
      uint64_t v7 = 735;
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __73__NSError_HealthDaemon__hd_errorStrippingExpectedCloudKitPartialFailures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4)
  {
    uint64_t v5 = [v2 code];
    BOOL v6 = v5 == 112;
    if (v5 == 22) {
      BOOL v6 = 1;
    }
    uint64_t v7 = v5 == 11 || v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __45__NSError_HealthDaemon__hd_errorForAnalytics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4F29B68]] ^ 1;
}

@end