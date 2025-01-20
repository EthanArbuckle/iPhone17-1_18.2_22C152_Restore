@interface _DKSyncErrors
+ (id)couldNotSaveForSync;
+ (id)disabled;
+ (id)domain;
+ (id)failedToApplyRemoteChanges;
+ (id)failedToFetchChanges;
+ (id)internalFailure;
+ (id)invalidData;
+ (id)invalidRequest;
+ (id)invalidResponse;
+ (id)missingHighWaterMark;
+ (id)temporaryFailure;
+ (id)unavailableForCurrentUser;
@end

@implementation _DKSyncErrors

+ (id)domain
{
  return @"com.apple.coreduet.sync";
}

+ (id)internalFailure
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Internal failure";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:-1 userInfo:v4];

  return v5;
}

+ (id)disabled
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Syncing is disabled";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:1 userInfo:v4];

  return v5;
}

+ (id)unavailableForCurrentUser
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Syncing is not available for the current user";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:2 userInfo:v4];

  return v5;
}

+ (id)couldNotSaveForSync
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Could not save changes for sync";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:3 userInfo:v4];

  return v5;
}

+ (id)failedToApplyRemoteChanges
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Failed to apply remote changes";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:4 userInfo:v4];

  return v5;
}

+ (id)failedToFetchChanges
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Failed to fetch changes for sync";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:5 userInfo:v4];

  return v5;
}

+ (id)invalidData
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Invalid data encountered";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:6 userInfo:v4];

  return v5;
}

+ (id)invalidRequest
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Invalid request";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:7 userInfo:v4];

  return v5;
}

+ (id)invalidResponse
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Invalid response";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:8 userInfo:v4];

  return v5;
}

+ (id)missingHighWaterMark
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Missing high water mark";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:9 userInfo:v4];

  return v5;
}

+ (id)temporaryFailure
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = [a1 domain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Temporary failure";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:10 userInfo:v4];

  return v5;
}

@end