@interface HKFullMedicationSearchResult
- (HKFullMedicationSearchResult)initWithProductId:(id)a3 packagingName:(id)a4 packagingNDC:(id)a5 productBrandName:(id)a6 productGenericName:(id)a7 route:(id)a8 doseForm:(id)a9;
- (NSArray)ingredients;
- (NSString)doseForm;
- (NSString)packagingNDC;
- (NSString)packagingName;
- (NSString)productBrandName;
- (NSString)productGenericName;
- (NSString)productId;
- (NSString)route;
- (id)dictionaryRepresentation;
@end

@implementation HKFullMedicationSearchResult

- (HKFullMedicationSearchResult)initWithProductId:(id)a3 packagingName:(id)a4 packagingNDC:(id)a5 productBrandName:(id)a6 productGenericName:(id)a7 route:(id)a8 doseForm:(id)a9
{
  id v16 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v17 = a9;
  if (!v16)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"HKMedicationsSearchResult.m" lineNumber:113 description:@"productId cannot be nil"];
  }
  v28.receiver = self;
  v28.super_class = (Class)HKFullMedicationSearchResult;
  v18 = [(HKFullMedicationSearchResult *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_productId, a3);
    objc_storeStrong((id *)&v19->_packagingName, a4);
    objc_storeStrong((id *)&v19->_packagingNDC, a5);
    objc_storeStrong((id *)&v19->_productGenericName, a7);
    objc_storeStrong((id *)&v19->_productBrandName, a6);
    objc_storeStrong((id *)&v19->_route, a8);
    objc_storeStrong((id *)&v19->_doseForm, a9);
  }

  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v4 = [(HKFullMedicationSearchResult *)self ingredients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v6);
  }

  v37[0] = @"productId";
  uint64_t v10 = [(HKFullMedicationSearchResult *)self productId];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"(null)";
  }
  v38[0] = v12;
  v37[1] = @"packagingNDC";
  uint64_t v13 = [(HKFullMedicationSearchResult *)self packagingNDC];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = @"(null)";
  }
  v38[1] = v15;
  v37[2] = @"productGenericName";
  uint64_t v16 = [(HKFullMedicationSearchResult *)self productGenericName];
  id v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"(null)";
  }
  v38[2] = v18;
  v37[3] = @"productBrandName";
  uint64_t v19 = [(HKFullMedicationSearchResult *)self productBrandName];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = @"(null)";
  }
  v38[3] = v21;
  v37[4] = @"packagingName";
  uint64_t v22 = [(HKFullMedicationSearchResult *)self packagingName];
  id v23 = (void *)v22;
  if (v22) {
    id v24 = (__CFString *)v22;
  }
  else {
    id v24 = @"(null)";
  }
  v38[4] = v24;
  v37[5] = @"route";
  uint64_t v25 = [(HKFullMedicationSearchResult *)self route];
  id v26 = (void *)v25;
  if (v25) {
    id v27 = (__CFString *)v25;
  }
  else {
    id v27 = @"(null)";
  }
  v38[5] = v27;
  v37[6] = @"doseForm";
  uint64_t v28 = [(HKFullMedicationSearchResult *)self doseForm];
  v29 = (void *)v28;
  if (v28) {
    v30 = (__CFString *)v28;
  }
  else {
    v30 = @"(null)";
  }
  v37[7] = @"ingredients";
  v38[6] = v30;
  v38[7] = v3;
  v31 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:8];

  return v31;
}

- (NSString)productId
{
  return self->_productId;
}

- (NSString)packagingName
{
  return self->_packagingName;
}

- (NSString)packagingNDC
{
  return self->_packagingNDC;
}

- (NSString)productBrandName
{
  return self->_productBrandName;
}

- (NSString)productGenericName
{
  return self->_productGenericName;
}

- (NSString)route
{
  return self->_route;
}

- (NSString)doseForm
{
  return self->_doseForm;
}

- (NSArray)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_doseForm, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_productGenericName, 0);
  objc_storeStrong((id *)&self->_productBrandName, 0);
  objc_storeStrong((id *)&self->_packagingNDC, 0);
  objc_storeStrong((id *)&self->_packagingName, 0);
  objc_storeStrong((id *)&self->_productId, 0);
}

@end