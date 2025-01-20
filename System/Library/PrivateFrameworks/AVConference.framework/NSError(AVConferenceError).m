@interface NSError(AVConferenceError)
+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailCode:description:;
+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:filePath:description:reason:;
+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:returnCode:filePath:description:reason:;
@end

@implementation NSError(AVConferenceError)

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:filePath:description:reason:
{
  return [a1 AVConferenceServiceError:a3 detailedCode:a4 returnCode:0 filePath:a5 description:a6 reason:a7];
}

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailedCode:returnCode:filePath:description:reason:
{
  v13 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v14 = [NSNumber numberWithInteger:a4];
  uint64_t v15 = [NSNumber numberWithInteger:a5];
  v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"NSErrorUserInfoDetailedError", v15, @"NSErrorUserInfoReturnCode", a7, *MEMORY[0x1E4F28568], a8, *MEMORY[0x1E4F28588], 0);
  if (VRTraceIsInternalOSInstalled())
  {
    if (a6) {
      v17 = a6;
    }
    else {
      v17 = @"...";
    }
    [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  }
  v18 = (void *)MEMORY[0x1E4F28C58];

  return [v18 errorWithDomain:@"GKVoiceChatServiceErrorDomain" code:a3 userInfo:v16];
}

+ (uint64_t)AVConferenceServiceError:()AVConferenceError detailCode:description:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28C58];
  v10[0] = @"NSErrorUserInfoDetailedError";
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  v10[1] = *MEMORY[0x1E4F28588];
  v11[0] = v8;
  v11[1] = a5;
  return objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"GKVoiceChatServiceErrorDomain", a3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
}

@end