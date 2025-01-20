@interface FBKParticipant
+ (NSArray)sortDescriptors;
+ (id)currentParticipantForContext:(id)a3;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingFullName;
- (NSString)fullName;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKParticipant

+ (id)entityName
{
  return @"Participant";
}

+ (id)currentParticipantForContext:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = +[FBKData sharedInstance];
    v6 = [v5 currentUser];
    v7 = [v6 ID];

    v8 = [a1 entityName];
    v9 = [v4 findFeedbackObjectWithEntityName:v8 remoteID:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)keyPathsForValuesAffectingFullName
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"givenName", @"familyName", 0);
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"first_name"];
  v6 = FBKNilIfNSNull(v5);
  [(FBKParticipant *)self setGivenName:v6];

  v7 = [v4 objectForKeyedSubscript:@"last_name"];
  v8 = FBKNilIfNSNull(v7);
  [(FBKParticipant *)self setFamilyName:v8];

  id v10 = [v4 objectForKeyedSubscript:@"email_address"];

  v9 = FBKNilIfNSNull(v10);
  [(FBKParticipant *)self setEmailAddress:v9];
}

- (NSString)fullName
{
  if (fullName_onceToken != -1) {
    dispatch_once(&fullName_onceToken, &__block_literal_global_30);
  }
  id v3 = objc_alloc_init(MEMORY[0x263F08A68]);
  id v4 = [(FBKParticipant *)self givenName];
  [v3 setGivenName:v4];

  v5 = [(FBKParticipant *)self familyName];
  [v3 setFamilyName:v5];

  v6 = [(id)fullName_formatter stringFromPersonNameComponents:v3];

  return (NSString *)v6;
}

uint64_t __26__FBKParticipant_fullName__block_invoke()
{
  fullName_formatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A78]);

  return MEMORY[0x270F9A758]();
}

+ (NSArray)sortDescriptors
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFEA78] sharedDefaults];
  uint64_t v3 = [v2 sortOrder];

  if (v3 == 2)
  {
    id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"givenName" ascending:1];
    v10[0] = v4;
    v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"familyName" ascending:1];
    v10[1] = v5;
    v6 = v10;
  }
  else
  {
    id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"familyName" ascending:1];
    v9[0] = v4;
    v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"givenName" ascending:1];
    v9[1] = v5;
    v6 = v9;
  }
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return (NSArray *)v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Participant"];
}

@end