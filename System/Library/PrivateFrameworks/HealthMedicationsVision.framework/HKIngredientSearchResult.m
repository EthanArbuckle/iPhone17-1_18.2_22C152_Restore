@interface HKIngredientSearchResult
- (HKIngredientSearchResult)initWithIngredientId:(id)a3 ingredientName:(id)a4 strengthQuantity:(id)a5 strengthUnit:(id)a6;
- (NSString)ingredientId;
- (NSString)ingredientName;
- (NSString)strengthQuantity;
- (NSString)strengthUnit;
- (id)dictionaryRepresentation;
@end

@implementation HKIngredientSearchResult

- (HKIngredientSearchResult)initWithIngredientId:(id)a3 ingredientName:(id)a4 strengthQuantity:(id)a5 strengthUnit:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HKMedicationsSearchResult.m" lineNumber:24 description:@"ingredientId cannot be nil"];
  }
  v20.receiver = self;
  v20.super_class = (Class)HKIngredientSearchResult;
  v16 = [(HKIngredientSearchResult *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ingredientId, a3);
    objc_storeStrong((id *)&v17->_ingredientName, a4);
    objc_storeStrong((id *)&v17->_strengthQuantity, a5);
    objc_storeStrong((id *)&v17->_strengthUnit, a6);
  }

  return v17;
}

- (id)dictionaryRepresentation
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = @"ingredientId";
  uint64_t v3 = [(HKIngredientSearchResult *)self ingredientId];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"(null)";
  }
  v18[0] = v5;
  v17[1] = @"ingredientName";
  uint64_t v6 = [(HKIngredientSearchResult *)self ingredientName];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"(null)";
  }
  v18[1] = v8;
  v17[2] = @"strengthQuantity";
  uint64_t v9 = [(HKIngredientSearchResult *)self strengthQuantity];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"(null)";
  }
  v18[2] = v11;
  v17[3] = @"strengthUnit";
  uint64_t v12 = [(HKIngredientSearchResult *)self strengthUnit];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"(null)";
  }
  v18[3] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSString)ingredientId
{
  return self->_ingredientId;
}

- (NSString)ingredientName
{
  return self->_ingredientName;
}

- (NSString)strengthQuantity
{
  return self->_strengthQuantity;
}

- (NSString)strengthUnit
{
  return self->_strengthUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strengthUnit, 0);
  objc_storeStrong((id *)&self->_strengthQuantity, 0);
  objc_storeStrong((id *)&self->_ingredientName, 0);
  objc_storeStrong((id *)&self->_ingredientId, 0);
}

@end