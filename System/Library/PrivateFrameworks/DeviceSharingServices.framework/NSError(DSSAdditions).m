@interface NSError(DSSAdditions)
+ (id)dss_errorWithCode:()DSSAdditions userInfo:retryable:;
+ (uint64_t)dss_errorWithCode:()DSSAdditions;
- (id)dss_copyRetryable:()DSSAdditions;
- (uint64_t)dss_isRetryable;
@end

@implementation NSError(DSSAdditions)

+ (uint64_t)dss_errorWithCode:()DSSAdditions
{
  return objc_msgSend(MEMORY[0x263F087E8], "dss_errorWithCode:userInfo:retryable:", a3, 0, 0);
}

+ (id)dss_errorWithCode:()DSSAdditions userInfo:retryable:
{
  v7 = (void *)[a4 mutableCopy];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  v11 = [NSNumber numberWithBool:a5];
  [v10 setObject:v11 forKey:DSSDeviceSharingErrorRetryable];

  v12 = @"Generic";
  if (a3 > 109)
  {
    v13 = @"No Device found";
    v22 = @"Remote Unlock Declined";
    v23 = @"Peer connection invalidated";
    if (a3 != 200) {
      v23 = @"Generic";
    }
    if (a3 != 190) {
      v22 = v23;
    }
    if (a3 != 180) {
      v13 = v22;
    }
    v24 = @"Unknown Request";
    v25 = @"Duplicate Request";
    if (a3 != 170) {
      v25 = @"Generic";
    }
    if (a3 != 160) {
      v24 = v25;
    }
    if (a3 <= 179) {
      v13 = v24;
    }
    v26 = @"Not Supported";
    v27 = @"Cancelled";
    v28 = @"Max Retries Exceeded";
    if (a3 != 150) {
      v28 = @"Generic";
    }
    if (a3 != 140) {
      v27 = v28;
    }
    if (a3 != 130) {
      v26 = v27;
    }
    if (a3 == 120) {
      v12 = @"Request Timeout Error";
    }
    if (a3 == 110) {
      v12 = @"Unable To Lock Device";
    }
    if (a3 > 129) {
      v12 = v26;
    }
    BOOL v21 = a3 <= 159;
  }
  else
  {
    v13 = @"Unknown Profile Type";
    v14 = @"Guest Does Not Exist";
    v15 = @"Invalid State Transition";
    if (a3 != 100) {
      v15 = @"Generic";
    }
    if (a3 != 90) {
      v14 = v15;
    }
    if (a3 != 80) {
      v13 = v14;
    }
    v16 = @"Could Not Read From File";
    v17 = @"Prescription Configuration Does Not Match";
    if (a3 != 70) {
      v17 = @"Generic";
    }
    if (a3 != 60) {
      v16 = v17;
    }
    if (a3 <= 79) {
      v13 = v16;
    }
    v18 = @"Low Disk Space";
    v19 = @"Guest User Mode Already Active";
    v20 = @"Could Not Write To File";
    if (a3 != 50) {
      v20 = @"Generic";
    }
    if (a3 != 40) {
      v19 = v20;
    }
    if (a3 != 30) {
      v18 = v19;
    }
    if (a3 == 20) {
      v12 = @"Unknown Core RX State";
    }
    if (a3 == 10) {
      v12 = @"Missing Property";
    }
    if (a3 > 29) {
      v12 = v18;
    }
    BOOL v21 = a3 <= 59;
  }
  if (v21) {
    v29 = v12;
  }
  else {
    v29 = v13;
  }
  [v10 setObject:v29 forKey:*MEMORY[0x263F08320]];
  v30 = (void *)MEMORY[0x263F087E8];
  v31 = (void *)[v10 copy];
  v32 = [v30 errorWithDomain:@"DSDeviceSharingErrorDomain" code:a3 userInfo:v31];

  return v32;
}

- (uint64_t)dss_isRetryable
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:DSSDeviceSharingErrorRetryable];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)dss_copyRetryable:()DSSAdditions
{
  v5 = [a1 userInfo];
  v6 = (void *)[v5 mutableCopy];

  if (a3)
  {
    v7 = [NSNumber numberWithBool:1];
    [v6 setObject:v7 forKey:DSSDeviceSharingErrorRetryable];
  }
  else
  {
    [v6 removeObjectForKey:DSSDeviceSharingErrorRetryable];
  }
  id v8 = objc_alloc(MEMORY[0x263F087E8]);
  id v9 = [a1 domain];
  v10 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, objc_msgSend(a1, "code"), v6);

  return v10;
}

@end