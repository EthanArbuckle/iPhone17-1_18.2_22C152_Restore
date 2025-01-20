@interface _COClusterRealmActivityGroup
+ (id)realmForCurrent;
@end

@implementation _COClusterRealmActivityGroup

+ (id)realmForCurrent
{
  v21[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F54738] predicateForCurrentDevice];
  v3 = [MEMORY[0x263F08A98] predicateWithValue:0];
  v4 = [MEMORY[0x263F08A98] predicateWithValue:1];
  v18 = [MEMORY[0x263F54720] predicateForCurrentDevice];
  v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_MEDIA_SYSTEM == nil)"];
  v5 = [MEMORY[0x263F546D8] predicateForCurrentDevice];
  v6 = (void *)MEMORY[0x263F08730];
  v21[0] = v4;
  v21[1] = v18;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v8 = [v6 andPredicateWithSubpredicates:v7];

  v9 = (void *)MEMORY[0x263F08730];
  v20[0] = v4;
  v20[1] = v17;
  v20[2] = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  v11 = [v9 andPredicateWithSubpredicates:v10];

  v12 = (void *)MEMORY[0x263F08730];
  v19[0] = v2;
  v19[1] = v3;
  v19[2] = v8;
  v19[3] = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  v14 = [v12 orPredicateWithSubpredicates:v13];

  id v15 = [[_COClusterRealmActivityGroup alloc] _initWithPredicate:v14];

  return v15;
}

@end