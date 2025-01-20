@interface NSError(ChronoServices)
+ (id)badResponseForFunction:()ChronoServices;
+ (id)badResponseFromServer;
+ (id)chs_initWithErrorCode:()ChronoServices;
+ (id)decodingError:()ChronoServices;
+ (id)encodingError:()ChronoServices;
+ (id)invalidControlDefinition;
+ (id)serverUnavailable;
@end

@implementation NSError(ChronoServices)

+ (id)chs_initWithErrorCode:()ChronoServices
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 alloc];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  if ((unint64_t)(a3 - 1) > 7) {
    v5 = &stru_1EE0A1408;
  }
  else {
    v5 = off_1E56C97C8[a3 - 1];
  }
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v4 initWithDomain:@"CHSErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (id)encodingError:()ChronoServices
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = [NSString stringWithFormat:@"Error encoding: %@", v3, *MEMORY[0x1E4F28568]];
  v9[1] = *MEMORY[0x1E4F28228];
  v10[0] = v5;
  v10[1] = @"Server Unavailable";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v4 errorWithDomain:@"CHSErrorDomain" code:9 userInfo:v6];

  return v7;
}

+ (id)decodingError:()ChronoServices
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = [NSString stringWithFormat:@"Error decoding: %@", v3, *MEMORY[0x1E4F28568]];
  v9[1] = *MEMORY[0x1E4F28228];
  v10[0] = v5;
  v10[1] = @"Server Unavailable";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v4 errorWithDomain:@"CHSErrorDomain" code:9 userInfo:v6];

  return v7;
}

+ (id)serverUnavailable
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v1 = *MEMORY[0x1E4F28228];
  v5[0] = *MEMORY[0x1E4F28568];
  v5[1] = v1;
  v6[0] = @"Unable to obtain the remote target";
  v6[1] = @"Server Unavailable";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v3 = [v0 errorWithDomain:@"CHSErrorDomain" code:1 userInfo:v2];

  return v3;
}

+ (id)invalidControlDefinition
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v1 = *MEMORY[0x1E4F28228];
  v5[0] = *MEMORY[0x1E4F28568];
  v5[1] = v1;
  v6[0] = @"Invalid control definition (missing intent).";
  v6[1] = @"Invalid control definition";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v3 = [v0 errorWithDomain:@"CHSErrorDomain" code:7 userInfo:v2];

  return v3;
}

+ (id)badResponseFromServer
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28C58];
  v5[0] = *MEMORY[0x1E4F28568];
  uint64_t v1 = [NSString stringWithFormat:@"Bad response from server"];
  v5[1] = *MEMORY[0x1E4F28228];
  v6[0] = v1;
  v6[1] = @"Bad response";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v3 = [v0 errorWithDomain:@"CHSErrorDomain" code:8 userInfo:v2];

  return v3;
}

+ (id)badResponseForFunction:()ChronoServices
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = [NSString stringWithFormat:@"Bad response from server: %@", v3, *MEMORY[0x1E4F28568]];
  v9[1] = *MEMORY[0x1E4F28228];
  v10[0] = v5;
  v10[1] = @"Bad response";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v4 errorWithDomain:@"CHSErrorDomain" code:8 userInfo:v6];

  return v7;
}

@end