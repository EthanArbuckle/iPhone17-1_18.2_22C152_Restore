@interface APSHashingAppIDManager
- (id)loadAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5;
- (id)loadOrCreateAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5;
@end

@implementation APSHashingAppIDManager

- (id)loadAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5
{
  unsigned __int16 v8 = 0;
  v5 = sub_10007E9FC(a5);
  [v5 getBytes:&v8 length:2];
  v6 = +[NSNumber numberWithUnsignedShort:v8];

  return v6;
}

- (id)loadOrCreateAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5
{
  unsigned __int16 v8 = 0;
  v5 = sub_10007E9FC(a5);
  [v5 getBytes:&v8 length:2];
  v6 = +[NSNumber numberWithUnsignedShort:v8];

  return v6;
}

@end