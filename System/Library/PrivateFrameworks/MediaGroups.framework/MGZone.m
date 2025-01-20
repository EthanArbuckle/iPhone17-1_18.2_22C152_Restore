@interface MGZone
+ (id)predicateForCurrentDevice;
+ (id)predicateForType;
+ (id)type;
- (MGZone)initWithClientService:(id)a3 zone:(id)a4 home:(id)a5;
- (MGZone)initWithConnectionProvider:(id)a3 zone:(id)a4 home:(id)a5;
- (id)HomeKitZoneIdentifier;
- (id)HomeKitZoneWithHomeManager:(id)a3;
@end

@implementation MGZone

- (MGZone)initWithClientService:(id)a3 zone:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = MGGroupIdentifierForZoneInHome(v9, v8);
  v12 = [(id)objc_opt_class() type];
  v13 = [v9 name];
  v14 = MGMemberIdentifiersForZoneInHome(v9, v8);

  v15 = [(MGGroup *)self initWithClientService:v10 type:v12 identifier:v11 name:v13 properties:0 memberIdentifiers:v14];
  return v15;
}

- (MGZone)initWithConnectionProvider:(id)a3 zone:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v10];

  v12 = [(MGZone *)self initWithClientService:v11 zone:v9 home:v8];
  return v12;
}

+ (id)type
{
  return @"com.apple.media-group.zone";
}

- (id)HomeKitZoneIdentifier
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGZoneIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)HomeKitZoneWithHomeManager:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self identifier];
  v6 = MGZoneFromHomeManagerForGroupIdentifier(v4, v5);

  return v6;
}

+ (id)predicateForType
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [a1 type];
  id v4 = [v2 predicateWithFormat:@"SELF.type = %@", v3];

  return v4;
}

+ (id)predicateForCurrentDevice
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_ZONE != nil) && (SELF.identifier == $CURRENT_ZONE.identifier)"];
}

@end