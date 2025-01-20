@interface VNFgBgInstanceSegmenterError
+ (id)allocationErrorIOSurface;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)genericErrorConfigDescription;
+ (id)genericErrorEspressoContextDescription;
+ (id)genericErrorEspressoPlanDescription;
+ (id)genericErrorIOSurface;
+ (id)genericErrorImageDescription;
+ (id)genericErrorInvalidSourceDescription;
+ (id)genericErrorModelDescription;
@end

@implementation VNFgBgInstanceSegmenterError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VNFgBgInstanceSegmenterErrorCodeDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)allocationErrorIOSurface
{
  return @"IOSurface Allocation Failed!";
}

+ (id)genericErrorIOSurface
{
  return @"IOSurface Failed!";
}

+ (id)genericErrorEspressoPlanDescription
{
  return @"Espresso plan is not valid!";
}

+ (id)genericErrorEspressoContextDescription
{
  return @"Espresso context is not valid!";
}

+ (id)genericErrorConfigDescription
{
  return @"Config is not valid!";
}

+ (id)genericErrorModelDescription
{
  return @"Model cannot be loaded!";
}

+ (id)genericErrorImageDescription
{
  return @"Image not found!";
}

+ (id)genericErrorInvalidSourceDescription
{
  return @"Data source is not valid!";
}

@end