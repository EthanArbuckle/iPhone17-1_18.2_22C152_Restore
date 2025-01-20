@interface BMResourceSyncPolicy
- (BMResourceSyncPolicy)initWithPolicyDictionary:(id)a3;
- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5;
- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5 fromPlatform:(int64_t)a6;
- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4;
- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4 fromPlatform:(int64_t)a5;
- (NSDictionary)platformPolicies;
- (int64_t)currentPlatform;
- (unint64_t)directionsSupportedForTransport:(unint64_t)a3;
- (unint64_t)directionsSupportedForTransport:(unint64_t)a3 fromPlatform:(int64_t)a4;
@end

@implementation BMResourceSyncPolicy

- (void).cxx_destruct
{
}

- (BMResourceSyncPolicy)initWithPolicyDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMResourceSyncPolicy;
  v5 = [(BMResourceSyncPolicy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    platformPolicies = v5->_platformPolicies;
    v5->_platformPolicies = (NSDictionary *)v6;

    v5->_currentPlatform = +[BMDeviceMetadataUtils platform];
  }

  return v5;
}

- (unint64_t)directionsSupportedForTransport:(unint64_t)a3
{
  return [(BMResourceSyncPolicy *)self directionsSupportedForTransport:a3 fromPlatform:self->_currentPlatform];
}

- (unint64_t)directionsSupportedForTransport:(unint64_t)a3 fromPlatform:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0;
  }
  platformPolicies = self->_platformPolicies;
  if ((unint64_t)(a4 - 1) > 7) {
    uint64_t v6 = @"Unknown";
  }
  else {
    uint64_t v6 = off_1E60232B8[a4 - 1];
  }
  v8 = [(NSDictionary *)platformPolicies objectForKeyedSubscript:v6];
  objc_super v9 = v8;
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "transportType", (void)v17) == a3)
          {
            unint64_t v7 = [v15 direction];
            goto LABEL_17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    unint64_t v7 = 0;
LABEL_17:
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4
{
  return [(BMResourceSyncPolicy *)self supportsTransport:a3 direction:a4 fromPlatform:self->_currentPlatform];
}

- (BOOL)supportsTransport:(unint64_t)a3 direction:(unint64_t)a4 fromPlatform:(int64_t)a5
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0;
  }
  unint64_t v6 = -[BMResourceSyncPolicy directionsSupportedForTransport:fromPlatform:](self, "directionsSupportedForTransport:fromPlatform:");
  BOOL v7 = (v6 & 3) != 0;
  if (a4 != 3) {
    BOOL v7 = 0;
  }
  if (a4 - 1 >= 2) {
    return v7;
  }
  else {
    return (a4 & ~v6) == 0;
  }
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5
{
  return [(BMResourceSyncPolicy *)self supportsSyncingWithPlatform:a3 overTransport:a4 inDirection:a5 fromPlatform:self->_currentPlatform];
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5 fromPlatform:(int64_t)a6
{
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || a5 == 0)
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    unint64_t v12 = [(BMResourceSyncPolicy *)self directionsSupportedForTransport:a4 fromPlatform:a6];
    BOOL v13 = [(BMResourceSyncPolicy *)self supportsTransport:a4 direction:a5 fromPlatform:a6];
    if (v13)
    {
      if (a4 == 3)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        if (a5 == 1)
        {
          uint64_t v14 = 2;
        }
        else if (a5 == 2)
        {
          uint64_t v14 = 1;
        }
        else if (a5 == 3 && v12 - 1 < 3)
        {
          uint64_t v14 = qword_1B30D3770[v12 - 1];
        }
        else
        {
          uint64_t v14 = 0;
        }
        LOBYTE(v13) = [(BMResourceSyncPolicy *)self supportsTransport:a4 direction:v14 fromPlatform:a3];
      }
    }
  }
  return v13;
}

- (int64_t)currentPlatform
{
  return self->_currentPlatform;
}

- (NSDictionary)platformPolicies
{
  return self->_platformPolicies;
}

@end