@interface CADNonRecurringEventsPredicate
- (CADNonRecurringEventsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 calendarIDs:(id)a5;
- (id)defaultPropertiesToLoad;
- (id)relatedObjectPropertiesToLoad;
@end

@implementation CADNonRecurringEventsPredicate

- (CADNonRecurringEventsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 calendarIDs:(id)a5
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CADPropertyFilter alloc] initWithProperty:5 comparison:5 dateValue:v10];

  v12 = [[CADPropertyFilter alloc] initWithProperty:6 comparison:2 dateValue:v9];
  v13 = [[CADPropertyFilter alloc] initWithProperty:10 comparison:0 integerValue:0];
  v14 = [[CADPropertyFilter alloc] initWithProperty:11 comparison:0 integerValue:0];
  v19[0] = v11;
  v19[1] = v12;
  v19[2] = v13;
  v19[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v18.receiver = self;
  v18.super_class = (Class)CADNonRecurringEventsPredicate;
  v16 = [(CADPropertySearchPredicate *)&v18 initWithEntityType:2 filters:v15 calendars:v8];

  return v16;
}

- (id)defaultPropertiesToLoad
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CADNonRecurringEventsPredicate;
  v2 = [(CADPropertySearchPredicate *)&v7 defaultPropertiesToLoad];
  uint64_t v3 = *MEMORY[0x1E4F56C60];
  v8[0] = *MEMORY[0x1E4F56BA8];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E4F57030];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)relatedObjectPropertiesToLoad
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16[0] = &unk_1F151D878;
  uint64_t v2 = *MEMORY[0x1E4F570A8];
  v15[0] = *MEMORY[0x1E4F570A0];
  v15[1] = v2;
  v15[2] = *MEMORY[0x1E4F570C0];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v17[0] = v3;
  v16[1] = &unk_1F151D890;
  uint64_t v4 = *MEMORY[0x1E4F57180];
  v14[0] = *MEMORY[0x1E4F57150];
  v14[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F571A0];
  v14[2] = *MEMORY[0x1E4F56B78];
  v14[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F57198];
  v14[4] = *MEMORY[0x1E4F571C0];
  v14[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4F571B8];
  v14[6] = *MEMORY[0x1E4F571A8];
  v14[7] = v7;
  uint64_t v8 = *MEMORY[0x1E4F56B68];
  v14[8] = *MEMORY[0x1E4F56B50];
  v14[9] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];
  v17[1] = v9;
  v16[2] = &unk_1F151D8A8;
  uint64_t v13 = *MEMORY[0x1E4F57170];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v17[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

@end