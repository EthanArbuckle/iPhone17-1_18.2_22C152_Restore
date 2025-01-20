@interface NSURL(FMAdditions)
- (id)fm_preferencesPathURLForDomain:()FMAdditions;
@end

@implementation NSURL(FMAdditions)

- (id)fm_preferencesPathURLForDomain:()FMAdditions
{
  id v4 = a3;
  v5 = [a1 URLByAppendingPathComponent:@"Library" isDirectory:1];
  v6 = [v5 URLByAppendingPathComponent:@"Preferences" isDirectory:1];

  v7 = [NSString stringWithFormat:@"%@.plist", v4];

  v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

  return v8;
}

@end