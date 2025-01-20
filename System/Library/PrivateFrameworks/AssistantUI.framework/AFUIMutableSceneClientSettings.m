@interface AFUIMutableSceneClientSettings
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)clientWindowContextID;
- (void)setClientWindowContextID:(unsigned int)a3;
@end

@implementation AFUIMutableSceneClientSettings

- (void)setClientWindowContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:2000];
}

- (unsigned)clientWindowContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:2000];
  unsigned int v4 = [v3 intValue];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = [AFUISceneClientSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

@end