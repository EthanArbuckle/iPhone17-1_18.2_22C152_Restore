@interface ASDTIOA2ServiceManager
+ (id)ioServiceClassName;
+ (id)ioServiceIDProperty;
- (BOOL)ioServiceCanBeAdded:(id)a3;
@end

@implementation ASDTIOA2ServiceManager

+ (id)ioServiceClassName
{
  return @"IOAudio2Device";
}

+ (id)ioServiceIDProperty
{
  return @"device UID";
}

- (BOOL)ioServiceCanBeAdded:(id)a3
{
  v3 = [a3 objectForKey:@"is private"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end