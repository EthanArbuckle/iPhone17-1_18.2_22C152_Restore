@interface CMSServiceError
+ (id)_supportedDomains;
+ (id)serviceError:(int64_t)a3 withUnderlyingIssue:(id)a4;
+ (id)serviceErrorFromCause:(id)a3;
@end

@implementation CMSServiceError

+ (id)serviceErrorFromCause:(id)a3
{
  id v3 = a3;
  v4 = +[CMSServiceError _supportedDomains];
  v5 = [v3 domain];
  int v6 = [v4 containsObject:v5];

  if (v6
    && ([v3 domain],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"com.apple.cloudmediaservices.errorDomain"],
        v7,
        v8)
    && (uint64_t v9 = [v3 code], (unint64_t)(v9 - 1004) <= 5))
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sirikitcloudmedia.errorDomain" code:qword_22B119BB0[v9 - 1004] userInfo:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)serviceError:(int64_t)a3 withUnderlyingIssue:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F08608];
  v11[0] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sirikitcloudmedia.errorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)_supportedDomains
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"com.apple.cloudmediaservices.errorDomain";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

@end