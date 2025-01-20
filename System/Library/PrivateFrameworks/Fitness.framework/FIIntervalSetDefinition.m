@interface FIIntervalSetDefinition
+ (id)definitionFromDictionary:(id)a3 error:(id *)a4;
- (FIIntervalSetDefinition)initWithIntervalDefinitions:(id)a3 repeatCount:(int64_t)a4 setType:(int64_t)a5;
- (NSArray)intervalDefinitions;
- (id)byAddingIntervalDefinition:(id)a3;
- (id)byChangingRepeatCount:(int64_t)a3;
- (id)byChangingSetType:(int64_t)a3;
- (id)byInsertingIntervalDefinition:(id)a3 atIndex:(unint64_t)a4;
- (id)byRemovingIntervalDefinitionAtIndex:(unint64_t)a3;
- (id)byReplacingIntervalDefinitionAtIndex:(unint64_t)a3 withIntervalDefinition:(id)a4;
- (id)dictionaryRepresentation;
- (id)intervalAtIndex:(unint64_t)a3;
- (int64_t)repeatCount;
- (int64_t)setType;
- (unint64_t)intervalCount;
@end

@implementation FIIntervalSetDefinition

- (FIIntervalSetDefinition)initWithIntervalDefinitions:(id)a3 repeatCount:(int64_t)a4 setType:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FIIntervalSetDefinition;
  v10 = [(FIIntervalSetDefinition *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_intervalDefinitions, a3);
    v11->_repeatCount = a4;
    v11->_setType = a5;
  }

  return v11;
}

- (unint64_t)intervalCount
{
  NSUInteger v3 = [(NSArray *)self->_intervalDefinitions count];
  return v3 + v3 * self->_repeatCount;
}

- (id)intervalAtIndex:(unint64_t)a3
{
  intervalDefinitions = self->_intervalDefinitions;
  unint64_t v4 = a3 % [(NSArray *)intervalDefinitions count];
  return [(NSArray *)intervalDefinitions objectAtIndexedSubscript:v4];
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  v38[8] = *MEMORY[0x263EF8340];
  id v31 = a3;
  unint64_t v4 = +[FIValidation validationWithName:@"Key 'intervalDefinitions' exists" test:&__block_literal_global_59];
  v38[0] = v4;
  v5 = +[FIValidation validationWithName:@"Key 'repeatCount' exists" test:&__block_literal_global_64];
  v38[1] = v5;
  v6 = +[FIValidation validationWithName:@"Key 'setType' exists" test:&__block_literal_global_69];
  v38[2] = v6;
  v7 = +[FIValidation validationWithName:@"'setType' is number" test:&__block_literal_global_74];
  v38[3] = v7;
  v8 = +[FIValidation validationWithName:@"'repeatCount' is number" test:&__block_literal_global_79];
  v38[4] = v8;
  id v9 = +[FIValidation validationWithName:@"'intervalDefinitions' is an array" test:&__block_literal_global_84];
  v38[5] = v9;
  v10 = +[FIValidation validationWithName:@"'setType' is a valid identifier" test:&__block_literal_global_90];
  v38[6] = v10;
  v11 = +[FIValidation validationWithName:@"'intervalDefinitions' contains dictionaries only" test:&__block_literal_global_95];
  v38[7] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:8];

  objc_super v13 = v31;
  LODWORD(v4) = +[FIValidation performValidations:v12 withObject:v31 error:a4];

  if (!v4)
  {
    v25 = 0;
    goto LABEL_19;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v14 = [v31 objectForKeyedSubscript:@"intervalDefinitions"];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v15)
  {

    v19 = (void *)MEMORY[0x263EFFA68];
LABEL_17:
    v26 = [FIIntervalSetDefinition alloc];
    id v17 = [v13 objectForKeyedSubscript:@"repeatCount"];
    uint64_t v27 = [v17 unsignedIntegerValue];
    v28 = [v13 objectForKeyedSubscript:@"setType"];
    v25 = -[FIIntervalSetDefinition initWithIntervalDefinitions:repeatCount:setType:](v26, "initWithIntervalDefinitions:repeatCount:setType:", v19, v27, [v28 integerValue]);

    goto LABEL_18;
  }
  uint64_t v16 = v15;
  id v17 = 0;
  uint64_t v18 = *(void *)v34;
  v19 = (void *)MEMORY[0x263EFFA68];
  while (2)
  {
    uint64_t v20 = 0;
    v21 = v19;
    v22 = v17;
    do
    {
      if (*(void *)v34 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * v20);
      id v32 = v22;
      v24 = +[FIIntervalDefinition definitionFromDictionary:v23 error:&v32];
      id v17 = v32;

      if (!v24)
      {
        v19 = v21;
        goto LABEL_13;
      }
      v19 = [v21 arrayByAddingObject:v24];

      ++v20;
      v21 = v19;
      v22 = v17;
    }
    while (v16 != v20);
    uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_13:

  if (!v17)
  {
    objc_super v13 = v31;
    goto LABEL_17;
  }
  FISetOutErrorIfNotNull(a4, v17);
  v25 = 0;
  objc_super v13 = v31;
LABEL_18:

LABEL_19:
  return v25;
}

- (id)dictionaryRepresentation
{
  v10[3] = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  unint64_t v4 = objc_msgSend(v3, "fi_mapUsingBlock:", &__block_literal_global_9);

  v10[0] = v4;
  v9[0] = @"intervalDefinitions";
  v9[1] = @"repeatCount";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIIntervalSetDefinition repeatCount](self, "repeatCount"));
  v10[1] = v5;
  v9[2] = @"setType";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIIntervalSetDefinition setType](self, "setType"));
  v10[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

uint64_t __51__FIIntervalSetDefinition_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)byChangingRepeatCount:(int64_t)a3
{
  v5 = [FIIntervalSetDefinition alloc];
  v6 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  v7 = [(FIIntervalSetDefinition *)v5 initWithIntervalDefinitions:v6 repeatCount:a3 setType:[(FIIntervalSetDefinition *)self setType]];

  return v7;
}

- (id)byChangingSetType:(int64_t)a3
{
  v5 = [FIIntervalSetDefinition alloc];
  v6 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  v7 = [(FIIntervalSetDefinition *)v5 initWithIntervalDefinitions:v6 repeatCount:[(FIIntervalSetDefinition *)self repeatCount] setType:a3];

  return v7;
}

- (id)byAddingIntervalDefinition:(id)a3
{
  id v4 = a3;
  v5 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  v6 = [v5 arrayByAddingObject:v4];

  v7 = [[FIIntervalSetDefinition alloc] initWithIntervalDefinitions:v6 repeatCount:[(FIIntervalSetDefinition *)self repeatCount] setType:[(FIIntervalSetDefinition *)self setType]];
  return v7;
}

- (id)byInsertingIntervalDefinition:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  v8 = (void *)[v7 mutableCopy];

  [v8 insertObject:v6 atIndex:a4];
  id v9 = [FIIntervalSetDefinition alloc];
  v10 = (void *)[v8 copy];
  v11 = [(FIIntervalSetDefinition *)v9 initWithIntervalDefinitions:v10 repeatCount:[(FIIntervalSetDefinition *)self repeatCount] setType:[(FIIntervalSetDefinition *)self setType]];

  return v11;
}

- (id)byReplacingIntervalDefinitionAtIndex:(unint64_t)a3 withIntervalDefinition:(id)a4
{
  id v6 = a4;
  v7 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  v8 = (void *)[v7 mutableCopy];

  [v8 replaceObjectAtIndex:a3 withObject:v6];
  id v9 = [FIIntervalSetDefinition alloc];
  v10 = (void *)[v8 copy];
  v11 = [(FIIntervalSetDefinition *)v9 initWithIntervalDefinitions:v10 repeatCount:[(FIIntervalSetDefinition *)self repeatCount] setType:[(FIIntervalSetDefinition *)self setType]];

  return v11;
}

- (id)byRemovingIntervalDefinitionAtIndex:(unint64_t)a3
{
  v5 = [(FIIntervalSetDefinition *)self intervalDefinitions];
  id v6 = (void *)[v5 mutableCopy];

  [v6 removeObjectAtIndex:a3];
  v7 = [FIIntervalSetDefinition alloc];
  v8 = (void *)[v6 copy];
  id v9 = [(FIIntervalSetDefinition *)v7 initWithIntervalDefinitions:v8 repeatCount:[(FIIntervalSetDefinition *)self repeatCount] setType:[(FIIntervalSetDefinition *)self setType]];

  return v9;
}

- (NSArray)intervalDefinitions
{
  return self->_intervalDefinitions;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (int64_t)setType
{
  return self->_setType;
}

- (void).cxx_destruct
{
}

@end