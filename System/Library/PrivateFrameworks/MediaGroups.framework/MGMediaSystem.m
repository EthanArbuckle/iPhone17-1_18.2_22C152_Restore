@interface MGMediaSystem
+ (id)predicateForCurrentDevice;
+ (id)predicateForType;
+ (id)type;
- (MGMediaSystem)initWithClientService:(id)a3 mediaSystem:(id)a4 home:(id)a5;
- (MGMediaSystem)initWithConnectionProvider:(id)a3 mediaSystem:(id)a4 home:(id)a5;
- (id)HomeKitMediaSystemIdentifier;
- (id)HomeKitMediaSystemWithHomeManager:(id)a3;
- (id)audioEntityRouteID;
- (id)syncUUID;
@end

@implementation MGMediaSystem

- (MGMediaSystem)initWithClientService:(id)a3 mediaSystem:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = MGGroupIdentifierForMediaSystemInHome(v9, v8);
  v12 = [(id)objc_opt_class() type];
  v13 = [v9 name];
  v14 = MGMemberIdentifiersForMediaSystem(v9, v8);

  v15 = [(MGGroup *)self initWithClientService:v10 type:v12 identifier:v11 name:v13 properties:0 memberIdentifiers:v14];
  return v15;
}

- (MGMediaSystem)initWithConnectionProvider:(id)a3 mediaSystem:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v10];

  v12 = [(MGMediaSystem *)self initWithClientService:v11 mediaSystem:v9 home:v8];
  return v12;
}

- (id)syncUUID
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGMediaSystemIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)audioEntityRouteID
{
  v2 = [(MGMediaSystem *)self syncUUID];
  v3 = [v2 UUIDString];

  return v3;
}

+ (id)type
{
  return @"com.apple.media-group.media-system";
}

- (id)HomeKitMediaSystemIdentifier
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGMediaSystemIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)HomeKitMediaSystemWithHomeManager:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self identifier];
  v6 = MGMediaSystemFromHomeManagerForGroupIdentifier(v4, v5);

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
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_MEDIA_SYSTEM != nil) && (SELF.identifier == $CURRENT_MEDIA_SYSTEM.identifier)"];
}

@end