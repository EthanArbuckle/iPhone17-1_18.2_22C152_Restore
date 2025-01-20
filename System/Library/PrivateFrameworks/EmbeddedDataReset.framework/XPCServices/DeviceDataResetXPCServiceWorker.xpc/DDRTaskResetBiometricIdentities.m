@interface DDRTaskResetBiometricIdentities
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)_resetIdentities;
- (void)run;
@end

@implementation DDRTaskResetBiometricIdentities

- (void)run
{
}

- (void)_resetIdentities
{
  v2 = [NSClassFromString(@"BiometricKit") manager];
  v3 = [v2 identities:0];
  id v4 = [v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 67109120;
    long long v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = objc_msgSend(v2, "removeIdentity:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v10), v14, (void)v15);
        if (v11)
        {
          unsigned int v12 = v11;
          v13 = DDRLogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            unsigned int v20 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error %d removing identity", buf, 8u);
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.15;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetBiometricIdentities";
}

@end