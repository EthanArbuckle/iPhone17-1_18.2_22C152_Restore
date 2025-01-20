@interface APSRadarComponentEntry
+ (id)componentEntryWithName:(id)a3 version:(id)a4 ID:(id)a5;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
@end

@implementation APSRadarComponentEntry

- (NSString)componentID
{
  return self->componentID;
}

- (NSString)componentVersion
{
  return self->componentVersion;
}

- (NSString)componentName
{
  return self->componentName;
}

+ (id)componentEntryWithName:(id)a3 version:(id)a4 ID:(id)a5
{
  v8 = objc_alloc_init(APSRadarComponentEntry);
  if (v8)
  {
    v8->componentName = (NSString *)[a3 copy];
    v8->componentVersion = (NSString *)[a4 copy];
    v8->componentID = (NSString *)[a5 copy];
  }
  return v8;
}

@end