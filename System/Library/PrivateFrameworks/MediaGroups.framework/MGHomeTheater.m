@interface MGHomeTheater
+ (id)predicateForCurrentDevice;
+ (id)predicateForType;
+ (id)type;
- (id)audioEntityRouteID;
@end

@implementation MGHomeTheater

- (id)audioEntityRouteID
{
  v2 = [(MGGroup *)self properties];
  v3 = [v2 objectForKey:@"audioDestinationIdentifier"];

  return v3;
}

+ (id)type
{
  return @"com.apple.media-group.home-theater";
}

+ (id)predicateForType
{
  v2 = (void *)MEMORY[0x263F08A98];
  v3 = [a1 type];
  v4 = [v2 predicateWithFormat:@"SELF.type = %@", v3];

  return v4;
}

+ (id)predicateForCurrentDevice
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08730];
  v3 = [a1 predicateForType];
  v10[0] = v3;
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_SOLO_GROUP != nil)"];
  v10[1] = v4;
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"$CONTAINMENT_MAP[$CURRENT_SOLO_GROUP.identifier] != nil"];
  v10[2] = v5;
  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY($CONTAINMENT_MAP[$CURRENT_SOLO_GROUP.identifier], $container, SELF.identifier in $container)[SIZE] > 0"];
  v10[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  v8 = [v2 andPredicateWithSubpredicates:v7];

  return v8;
}

@end