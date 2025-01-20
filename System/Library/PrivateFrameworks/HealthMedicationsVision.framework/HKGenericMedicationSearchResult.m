@interface HKGenericMedicationSearchResult
- (BOOL)isEqual:(id)a3;
- (HKGenericMedicationSearchResult)initWithGenericMedicationId:(id)a3 genericMedicationName:(id)a4 brandName:(id)a5 ingredients:(id)a6;
- (NSArray)ingredients;
- (NSString)brandName;
- (NSString)genericMedicationId;
- (NSString)genericMedicationName;
- (id)copyByReplacingWithIngredients:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation HKGenericMedicationSearchResult

- (HKGenericMedicationSearchResult)initWithGenericMedicationId:(id)a3 genericMedicationName:(id)a4 brandName:(id)a5 ingredients:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HKMedicationsSearchResult.m" lineNumber:55 description:@"genericMedicationId cannot be nil"];
  }
  v20.receiver = self;
  v20.super_class = (Class)HKGenericMedicationSearchResult;
  v16 = [(HKGenericMedicationSearchResult *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_genericMedicationId, a3);
    objc_storeStrong((id *)&v17->_genericMedicationName, a4);
    objc_storeStrong((id *)&v17->_brandName, a5);
    objc_storeStrong((id *)&v17->_ingredients, a6);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 genericMedicationId];
    v6 = [(HKGenericMedicationSearchResult *)self genericMedicationId];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HKGenericMedicationSearchResult *)self genericMedicationId];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyByReplacingWithIngredients:(id)a3
{
  id v4 = a3;
  v5 = [HKGenericMedicationSearchResult alloc];
  v6 = [(HKGenericMedicationSearchResult *)self genericMedicationId];
  char v7 = [(HKGenericMedicationSearchResult *)self genericMedicationName];
  v8 = [(HKGenericMedicationSearchResult *)self brandName];
  v9 = [(HKGenericMedicationSearchResult *)v5 initWithGenericMedicationId:v6 genericMedicationName:v7 brandName:v8 ingredients:v4];

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(HKGenericMedicationSearchResult *)self ingredients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }

  v25[0] = @"genericMedicationId";
  uint64_t v10 = [(HKGenericMedicationSearchResult *)self genericMedicationId];
  v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"(null)";
  }
  v26[0] = v12;
  v25[1] = @"genericMedicationName";
  uint64_t v13 = [(HKGenericMedicationSearchResult *)self genericMedicationName];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = @"(null)";
  }
  v26[1] = v15;
  v25[2] = @"brandName";
  uint64_t v16 = [(HKGenericMedicationSearchResult *)self brandName];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"(null)";
  }
  v25[3] = @"ingredients";
  v26[2] = v18;
  v26[3] = v3;
  v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v19;
}

- (NSString)genericMedicationId
{
  return self->_genericMedicationId;
}

- (NSString)genericMedicationName
{
  return self->_genericMedicationName;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (NSArray)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_genericMedicationName, 0);
  objc_storeStrong((id *)&self->_genericMedicationId, 0);
}

@end