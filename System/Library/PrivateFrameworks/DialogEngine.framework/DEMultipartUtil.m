@interface DEMultipartUtil
+ (id)getBoundary;
+ (id)getBoundaryData;
+ (id)getMessageEnd;
+ (id)getMessageEndData;
+ (id)getPartEndData;
@end

@implementation DEMultipartUtil

+ (id)getMessageEndData
{
  v2 = +[DEMultipartUtil getMessageEnd];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

+ (id)getMessageEnd
{
  return (id)[NSString stringWithFormat:@"%@%@%@", @"--975D9D6D-0ADA-49B8-9005-D58E1A618FCD", @"--", @"\r\n"];
}

+ (id)getPartEndData
{
  return (id)[@"\r\n" dataUsingEncoding:4];
}

+ (id)getBoundaryData
{
  v2 = +[DEMultipartUtil getBoundary];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

+ (id)getBoundary
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@", @"--975D9D6D-0ADA-49B8-9005-D58E1A618FCD", @"\r\n", @"Content-Type: application/octet-stream", @"\r\n", @"\r\n"];
}

@end