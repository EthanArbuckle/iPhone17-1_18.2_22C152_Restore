@interface _ANEErrors
+ (id)baseModelIdentifierNotFoundForNewInstanceMethod:(id)a3;
+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4;
+ (id)entitlementErrorForMethod:(id)a3;
+ (id)fileAccessErrorForMethod:(id)a3;
+ (id)fileNotFoundErrorForMethod:(id)a3;
+ (id)hostTooOld:(id)a3;
+ (id)invalidModelErrorForMethod:(id)a3;
+ (id)invalidModelInstanceErrorForMethod:(id)a3;
+ (id)invalidModelKeyErrorForMethod:(id)a3;
+ (id)missingCodeSigningErrorForMethod:(id)a3;
+ (id)modelIdentifierNotFoundForMethod:(id)a3;
+ (id)modelNewInstanceCacheIdentifierNotNilMethod:(id)a3;
+ (id)priorityErrorForMethod:(id)a3;
+ (id)programChainingPrepareErrorForMethod:(id)a3;
+ (id)programCreationErrorForMethod:(id)a3;
+ (id)programIOSurfacesMapErrorForMethod:(id)a3 code:(int64_t)a4;
+ (id)programIOSurfacesUnmapErrorForMethod:(id)a3 code:(int64_t)a4;
+ (id)programInferenceOtherErrorForMethod:(id)a3;
+ (id)programInferenceOverflowErrorForMethod:(id)a3;
+ (id)programInferenceProgramNotFoundForMethod:(id)a3;
+ (id)programLoadErrorForMethod:(id)a3;
+ (id)programLoadErrorForMethod:(id)a3 code:(int64_t)a4;
+ (id)programLoadNewInstanceErrorForMethod:(id)a3;
+ (id)programLoadNewInstanceErrorForMethod:(id)a3 code:(int64_t)a4;
+ (id)systemModelPurgeNotAllowedForMethod:(id)a3;
+ (id)timeoutErrorForMethod:(id)a3;
@end

@implementation _ANEErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = +[_ANEStrings errorDomainGeneric];
  uint64_t v16 = *MEMORY[0x1E4F28568];
  v17[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v9 = [v6 errorWithDomain:v7 code:a3 userInfo:v8];

  v10 = +[_ANELog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DB8AB000, v10, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

+ (id)entitlementErrorForMethod:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = +[_ANEStrings restrictedAccessEntitlement];
  v7 = [v4 stringWithFormat:@"%@: requires restricted access connection and (%@) entitlement", v5, v6];

  v8 = [a1 createErrorWithCode:1 description:v7];

  return v8;
}

+ (id)priorityErrorForMethod:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = +[_ANEStrings restrictedAccessEntitlement];
  v7 = [v4 stringWithFormat:@"%@: Realtime priority requires restricted access connection and (%@) entitlement", v5, v6];

  v8 = [a1 createErrorWithCode:2 description:v7];

  return v8;
}

+ (id)timeoutErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: timed out", a3];
  id v5 = [a1 createErrorWithCode:3 description:v4];

  return v5;
}

+ (id)programCreationErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program creation failure", a3];
  id v5 = [a1 createErrorWithCode:4 description:v4];

  return v5;
}

+ (id)programInferenceOverflowErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program Inference overflow", a3];
  id v5 = [a1 createErrorWithCode:5 description:v4];

  return v5;
}

+ (id)programInferenceOtherErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program Inference error", a3];
  id v5 = [a1 createErrorWithCode:8 description:v4];

  return v5;
}

+ (id)programLoadErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program load failure", a3];
  id v5 = [a1 createErrorWithCode:6 description:v4];

  return v5;
}

+ (id)programLoadErrorForMethod:(id)a3 code:(int64_t)a4
{
  id v5 = [NSString stringWithFormat:@"%@: Program load failure (0x%X)", a3, a4];
  v6 = [a1 createErrorWithCode:6 description:v5];

  return v6;
}

+ (id)programIOSurfacesMapErrorForMethod:(id)a3 code:(int64_t)a4
{
  id v5 = [NSString stringWithFormat:@"%@: Program IOSurfaces map failure (0x%X)", a3, a4];
  v6 = [a1 createErrorWithCode:13 description:v5];

  return v6;
}

+ (id)programIOSurfacesUnmapErrorForMethod:(id)a3 code:(int64_t)a4
{
  id v5 = [NSString stringWithFormat:@"%@: Program IOSurfaces unmap failure (0x%X)", a3, a4];
  v6 = [a1 createErrorWithCode:14 description:v5];

  return v6;
}

+ (id)missingCodeSigningErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Missing code signing identity", a3];
  id v5 = [a1 createErrorWithCode:7 description:v4];

  return v5;
}

+ (id)fileAccessErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: file access failure", a3];
  id v5 = [a1 createErrorWithCode:9 description:v4];

  return v5;
}

+ (id)invalidModelErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: invalid model", a3];
  id v5 = [a1 createErrorWithCode:10 description:v4];

  return v5;
}

+ (id)invalidModelKeyErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: invalid model key", a3];
  id v5 = [a1 createErrorWithCode:11 description:v4];

  return v5;
}

+ (id)systemModelPurgeNotAllowedForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: system model purge not allowed", a3];
  id v5 = [a1 createErrorWithCode:12 description:v4];

  return v5;
}

+ (id)programChainingPrepareErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program chaining prepare error", a3];
  id v5 = [a1 createErrorWithCode:15 description:v4];

  return v5;
}

+ (id)fileNotFoundErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: file not found", a3];
  id v5 = [a1 createErrorWithCode:16 description:v4];

  return v5;
}

+ (id)modelIdentifierNotFoundForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: model identifier not found", a3];
  id v5 = [a1 createErrorWithCode:17 description:v4];

  return v5;
}

+ (id)baseModelIdentifierNotFoundForNewInstanceMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: base model identifier not found for new instance", a3];
  id v5 = [a1 createErrorWithCode:18 description:v4];

  return v5;
}

+ (id)modelNewInstanceCacheIdentifierNotNilMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: model cacheURLIdentifier for new instance should be nil", a3];
  id v5 = [a1 createErrorWithCode:19 description:v4];

  return v5;
}

+ (id)invalidModelInstanceErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: invalid model instance", a3];
  id v5 = [a1 createErrorWithCode:20 description:v4];

  return v5;
}

+ (id)programLoadNewInstanceErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program load new instance failure", a3];
  id v5 = [a1 createErrorWithCode:21 description:v4];

  return v5;
}

+ (id)programLoadNewInstanceErrorForMethod:(id)a3 code:(int64_t)a4
{
  id v5 = [NSString stringWithFormat:@"%@: Program load new instance failure (0x%X)", a3, a4];
  v6 = [a1 createErrorWithCode:21 description:v5];

  return v6;
}

+ (id)hostTooOld:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Host too old, ANE hardware not available", a3];
  id v5 = [a1 createErrorWithCode:22 description:v4];

  return v5;
}

+ (id)programInferenceProgramNotFoundForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Program Inference error", a3];
  id v5 = [a1 createErrorWithCode:23 description:v4];

  return v5;
}

@end