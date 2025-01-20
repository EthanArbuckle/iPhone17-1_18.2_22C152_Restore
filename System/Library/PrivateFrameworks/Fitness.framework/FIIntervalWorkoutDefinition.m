@interface FIIntervalWorkoutDefinition
+ (id)definitionFromDictionary:(id)a3 error:(id *)a4;
+ (id)intervalWorkoutDefinition;
- (FIIntervalWorkoutDefinition)initWithName:(id)a3 identifier:(id)a4 sets:(id)a5;
- (NSArray)sets;
- (NSString)name;
- (NSUUID)identifier;
- (id)byAddingIntervalDefinition:(id)a3 toSetIndex:(unint64_t)a4;
- (id)byAddingSetDefinition:(id)a3;
- (id)byChangingName:(id)a3;
- (id)byInsertingIntervalDefinition:(id)a3 atIndexPath:(id)a4;
- (id)byInsertingSetDefinition:(id)a3 atIndex:(unint64_t)a4;
- (id)byRemovingIntervalDefinitionAtIndexPath:(id)a3;
- (id)byRemovingSetDefinitionAtIndex:(unint64_t)a3;
- (id)byReplacingIntervalDefinitionAtIndexPath:(id)a3 withIntervalDefinition:(id)a4;
- (id)byReplacingSetDefinitionAtIndex:(unint64_t)a3 withSetDefinition:(id)a4;
- (id)dictionaryRepresentation;
- (id)intervalDefinitionForIntervalAtIndex:(int64_t)a3;
- (unint64_t)intervalCount;
@end

@implementation FIIntervalWorkoutDefinition

- (FIIntervalWorkoutDefinition)initWithName:(id)a3 identifier:(id)a4 sets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FIIntervalWorkoutDefinition;
  v12 = [(FIIntervalWorkoutDefinition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_sets, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (unint64_t)intervalCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_sets;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "intervalCount", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)intervalDefinitionForIntervalAtIndex:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_sets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "intervalCount", (void)v13) + v7 > (unint64_t)a3)
        {
          long long v11 = [v10 intervalAtIndex:a3 - v7];
          goto LABEL_11;
        }
        v7 += [v10 intervalCount];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  v36[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[FIValidation validationWithName:@"Key 'name' exists" test:&__block_literal_global_68];
  v36[0] = v6;
  uint64_t v7 = +[FIValidation validationWithName:@"Key 'identifier' exists" test:&__block_literal_global_73];
  v36[1] = v7;
  uint64_t v8 = +[FIValidation validationWithName:@"Key 'sets' exists" test:&__block_literal_global_78];
  v36[2] = v8;
  long long v9 = +[FIValidation validationWithName:@"Sets is an arary" test:&__block_literal_global_83];
  v36[3] = v9;
  long long v10 = +[FIValidation validationWithName:@"'sets' contains dictionaries only" test:&__block_literal_global_88];
  v36[4] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];

  LODWORD(v6) = +[FIValidation performValidations:v11 withObject:v5 error:a4];
  if (!v6)
  {
    v23 = 0;
    goto LABEL_18;
  }
  [v5 objectForKeyedSubscript:@"sets"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v13)
  {

    v17 = (void *)MEMORY[0x263EFFA68];
LABEL_16:
    v24 = [FIIntervalWorkoutDefinition alloc];
    id v15 = [v5 objectForKeyedSubscript:@"name"];
    id v25 = objc_alloc(MEMORY[0x263F08C38]);
    v26 = [v5 objectForKeyedSubscript:@"identifier"];
    v27 = (void *)[v25 initWithUUIDString:v26];
    v23 = [(FIIntervalWorkoutDefinition *)v24 initWithName:v15 identifier:v27 sets:v17];

    goto LABEL_17;
  }
  uint64_t v14 = v13;
  v29 = a4;
  id v15 = 0;
  uint64_t v16 = *(void *)v32;
  v17 = (void *)MEMORY[0x263EFFA68];
  while (2)
  {
    uint64_t v18 = 0;
    v19 = v17;
    v20 = v15;
    do
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
      id v30 = v20;
      v22 = +[FIIntervalSetDefinition definitionFromDictionary:v21 error:&v30];
      id v15 = v30;

      if (!v22)
      {
        v17 = v19;
        goto LABEL_13;
      }
      v17 = [v19 arrayByAddingObject:v22];

      ++v18;
      v19 = v17;
      v20 = v15;
    }
    while (v14 != v18);
    uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_13:

  if (!v15) {
    goto LABEL_16;
  }
  FISetOutErrorIfNotNull(v29, v15);
  v23 = 0;
LABEL_17:

LABEL_18:
  return v23;
}

- (id)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FIIntervalWorkoutDefinition *)self sets];
  uint64_t v4 = objc_msgSend(v3, "fi_mapUsingBlock:", &__block_literal_global_7);

  v10[0] = @"name";
  id v5 = [(FIIntervalWorkoutDefinition *)self name];
  v11[0] = v5;
  v10[1] = @"identifier";
  uint64_t v6 = [(FIIntervalWorkoutDefinition *)self identifier];
  uint64_t v7 = [v6 UUIDString];
  v10[2] = @"sets";
  v11[1] = v7;
  v11[2] = v4;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

uint64_t __55__FIIntervalWorkoutDefinition_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

+ (id)intervalWorkoutDefinition
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [FIIntervalSetDefinition alloc];
  uint64_t v3 = [(FIIntervalSetDefinition *)v2 initWithIntervalDefinitions:MEMORY[0x263EFFA68] repeatCount:0 setType:2];
  uint64_t v4 = [FIIntervalWorkoutDefinition alloc];
  id v5 = [MEMORY[0x263F08C38] UUID];
  v9[0] = v3;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)v4 initWithName:&stru_26CD0B5F8 identifier:v5 sets:v6];

  return v7;
}

- (id)byChangingName:(id)a3
{
  id v4 = a3;
  id v5 = [FIIntervalWorkoutDefinition alloc];
  uint64_t v6 = [(FIIntervalWorkoutDefinition *)self identifier];
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)self sets];
  uint64_t v8 = [(FIIntervalWorkoutDefinition *)v5 initWithName:v4 identifier:v6 sets:v7];

  return v8;
}

- (id)byAddingSetDefinition:(id)a3
{
  id v4 = a3;
  id v5 = [FIIntervalWorkoutDefinition alloc];
  uint64_t v6 = [(FIIntervalWorkoutDefinition *)self name];
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)self identifier];
  uint64_t v8 = [(FIIntervalWorkoutDefinition *)self sets];
  long long v9 = [v8 arrayByAddingObject:v4];

  long long v10 = [(FIIntervalWorkoutDefinition *)v5 initWithName:v6 identifier:v7 sets:v9];
  return v10;
}

- (id)byInsertingSetDefinition:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)self sets];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 insertObject:v6 atIndex:a4];
  long long v9 = [FIIntervalWorkoutDefinition alloc];
  long long v10 = [(FIIntervalWorkoutDefinition *)self name];
  long long v11 = [(FIIntervalWorkoutDefinition *)self identifier];
  id v12 = (void *)[v8 copy];
  uint64_t v13 = [(FIIntervalWorkoutDefinition *)v9 initWithName:v10 identifier:v11 sets:v12];

  return v13;
}

- (id)byReplacingSetDefinitionAtIndex:(unint64_t)a3 withSetDefinition:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)self sets];
  uint64_t v8 = (void *)[v7 mutableCopy];

  [v8 replaceObjectAtIndex:a3 withObject:v6];
  long long v9 = [FIIntervalWorkoutDefinition alloc];
  long long v10 = [(FIIntervalWorkoutDefinition *)self name];
  long long v11 = [(FIIntervalWorkoutDefinition *)self identifier];
  id v12 = (void *)[v8 copy];
  uint64_t v13 = [(FIIntervalWorkoutDefinition *)v9 initWithName:v10 identifier:v11 sets:v12];

  return v13;
}

- (id)byRemovingSetDefinitionAtIndex:(unint64_t)a3
{
  id v5 = [(FIIntervalWorkoutDefinition *)self sets];
  id v6 = (void *)[v5 mutableCopy];

  [v6 removeObjectAtIndex:a3];
  uint64_t v7 = [FIIntervalWorkoutDefinition alloc];
  uint64_t v8 = [(FIIntervalWorkoutDefinition *)self name];
  long long v9 = [(FIIntervalWorkoutDefinition *)self identifier];
  long long v10 = (void *)[v6 copy];
  long long v11 = [(FIIntervalWorkoutDefinition *)v7 initWithName:v8 identifier:v9 sets:v10];

  return v11;
}

- (id)byAddingIntervalDefinition:(id)a3 toSetIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FIIntervalWorkoutDefinition *)self sets];
  uint64_t v8 = [v7 objectAtIndex:a4];

  long long v9 = [v8 byAddingIntervalDefinition:v6];

  long long v10 = [(FIIntervalWorkoutDefinition *)self byReplacingSetDefinitionAtIndex:a4 withSetDefinition:v9];

  return v10;
}

- (id)byInsertingIntervalDefinition:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FIIntervalWorkoutDefinition *)self sets];
  long long v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  long long v10 = objc_msgSend(v9, "byInsertingIntervalDefinition:atIndex:", v7, objc_msgSend(v6, "row"));

  uint64_t v11 = [v6 section];
  id v12 = [(FIIntervalWorkoutDefinition *)self byReplacingSetDefinitionAtIndex:v11 withSetDefinition:v10];

  return v12;
}

- (id)byReplacingIntervalDefinitionAtIndexPath:(id)a3 withIntervalDefinition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FIIntervalWorkoutDefinition *)self sets];
  long long v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));

  long long v10 = objc_msgSend(v9, "byReplacingIntervalDefinitionAtIndex:withIntervalDefinition:", objc_msgSend(v7, "row"), v6);

  uint64_t v11 = [v7 section];
  id v12 = [(FIIntervalWorkoutDefinition *)self byReplacingSetDefinitionAtIndex:v11 withSetDefinition:v10];

  return v12;
}

- (id)byRemovingIntervalDefinitionAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FIIntervalWorkoutDefinition *)self sets];
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));

  id v7 = objc_msgSend(v6, "byRemovingIntervalDefinitionAtIndex:", objc_msgSend(v4, "row"));
  uint64_t v8 = [v4 section];

  long long v9 = [(FIIntervalWorkoutDefinition *)self byReplacingSetDefinitionAtIndex:v8 withSetDefinition:v7];

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)sets
{
  return self->_sets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end