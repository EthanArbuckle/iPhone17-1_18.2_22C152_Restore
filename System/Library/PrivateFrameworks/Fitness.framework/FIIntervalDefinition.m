@interface FIIntervalDefinition
+ (id)definitionFromDictionary:(id)a3 error:(id *)a4;
+ (id)intervalDefinitionWithTypeIdentifier:(int64_t)a3 quantity:(id)a4;
- (FIIntervalDefinition)initWithTypeIdentifier:(int64_t)a3 quantity:(id)a4;
- (HKQuantity)quantity;
- (id)byChangingType:(int64_t)a3 quantity:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)type;
@end

@implementation FIIntervalDefinition

- (FIIntervalDefinition)initWithTypeIdentifier:(int64_t)a3 quantity:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FIIntervalDefinition;
  v8 = [(FIIntervalDefinition *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_quantity, a4);
  }

  return v9;
}

+ (id)intervalDefinitionWithTypeIdentifier:(int64_t)a3 quantity:(id)a4
{
  id v5 = a4;
  v6 = [(id)objc_opt_class() intervalDefinitionWithTypeIdentifier:a3 quantity:v5];

  return v6;
}

+ (id)definitionFromDictionary:(id)a3 error:(id *)a4
{
  v22[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[FIValidation validationWithName:@"Key 'type' exists" test:&__block_literal_global_2];
  id v7 = +[FIValidation validationWithName:@"Key 'quantity' exists", &__block_literal_global_43, v6 test];
  v22[1] = v7;
  v8 = +[FIValidation validationWithName:@"'quantity' is number" test:&__block_literal_global_48];
  v22[2] = v8;
  v9 = +[FIValidation validationWithName:@"'type' is number" test:&__block_literal_global_53];
  v22[3] = v9;
  v10 = +[FIValidation validationWithName:@"'type' is a valid identifier" test:&__block_literal_global_58];
  v22[4] = v10;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];

  LODWORD(a4) = +[FIValidation performValidations:v11 withObject:v5 error:a4];
  if (a4)
  {
    v12 = [v5 objectForKeyedSubscript:@"type"];
    uint64_t v13 = [v12 integerValue];

    v14 = (void *)MEMORY[0x263F0A630];
    v15 = FICanonicalQuantityUnitForIntervalType(v13);
    v16 = [v5 objectForKeyedSubscript:@"quantity"];
    [v16 doubleValue];
    v17 = objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);

    v18 = [FIIntervalDefinition alloc];
    v19 = [v5 objectForKeyedSubscript:@"type"];
    v20 = -[FIIntervalDefinition initWithTypeIdentifier:quantity:](v18, "initWithTypeIdentifier:quantity:", [v19 integerValue], v17);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = [(FIIntervalDefinition *)self quantity];
  v4 = FICanonicalQuantityUnitForIntervalType([(FIIntervalDefinition *)self type]);
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  v11[0] = @"type";
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIIntervalDefinition type](self, "type"));
  v11[1] = @"quantity";
  v12[0] = v7;
  v8 = [NSNumber numberWithDouble:v6];
  v12[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)byChangingType:(int64_t)a3 quantity:(id)a4
{
  id v5 = a4;
  double v6 = [[FIIntervalDefinition alloc] initWithTypeIdentifier:a3 quantity:v5];

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void).cxx_destruct
{
}

@end