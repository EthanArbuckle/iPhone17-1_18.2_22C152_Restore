@interface MGHome
+ (id)predicateForCurrentDevice;
+ (id)predicateForType;
+ (id)type;
- (MGHome)initWithClientService:(id)a3 home:(id)a4;
- (MGHome)initWithConnectionProvider:(id)a3 home:(id)a4;
- (id)HomeKitHomeIdentifier;
- (id)HomeKitHomeWithHomeManager:(id)a3;
@end

@implementation MGHome

- (MGHome)initWithClientService:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = MGGroupIdentifierForHomeInHome(v6, v6);
  v9 = [(id)objc_opt_class() type];
  v10 = [v6 name];
  v11 = MGMemberIdentifiersForHome(v6);

  v12 = [(MGGroup *)self initWithClientService:v7 type:v9 identifier:v8 name:v10 properties:0 memberIdentifiers:v11];
  return v12;
}

- (MGHome)initWithConnectionProvider:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v7];

  v9 = [(MGHome *)self initWithClientService:v8 home:v6];
  return v9;
}

+ (id)type
{
  return @"com.apple.media-group.home";
}

- (id)HomeKitHomeIdentifier
{
  v2 = [(MGGroup *)self identifier];
  v3 = MGHomeIdentifierForGroupIdentifier(v2);

  return v3;
}

- (id)HomeKitHomeWithHomeManager:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self identifier];
  id v6 = MGHomeFromHomeManagerForGroupIdentifier(v4, v5);

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
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_HOME != nil) && (SELF.identifier == $CURRENT_HOME.identifier)"];
}

@end