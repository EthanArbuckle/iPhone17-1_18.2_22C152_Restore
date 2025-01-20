@interface AMScattering
- (AMScattering)initWithMaterialName:(id)a3;
- (AMScattering)initWithValues:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)validatedWithoutError:(id *)a3;
- (NSArray)frequencyBands;
- (NSArray)numDataPointsReferenceData;
- (NSArray)scatteringReferenceData;
- (NSArray)scatteringUserData;
- (NSArray)uncertaintyReferenceData;
- (NSString)materialDescription;
- (NSString)materialName;
- (int)totalNumDataSetsReferenceData;
- (void)setScatteringUserData:(id)a3;
@end

@implementation AMScattering

- (AMScattering)initWithValues:(id)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AMScattering;
  v7 = [(AMScattering *)&v41 init];
  v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [v6 allKeys];
  v10 = [v8 setWithArray:v9];
  v11 = (void *)MEMORY[0x263EFFA08];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"materialName", @"materialDescription", @"frequencyBands", @"scatteringUserData", @"scatteringReferenceData", @"uncertaintyReferenceData", @"numDataPointsReferenceData", @"totalNumDataSetsReferenceData", 0);
  v13 = [v11 setWithArray:v12];
  char v14 = [v10 isSubsetOfSet:v13];

  if ((v14 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43[0] = @"At least one mandatory key was not found in input dictionary.";
    v39 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    *a4 = [v38 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:7 userInfo:v39];

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:@"materialName"];
  materialName = v7->_materialName;
  v7->_materialName = (NSString *)v15;

  uint64_t v17 = [v6 objectForKeyedSubscript:@"materialDescription"];
  materialDescription = v7->_materialDescription;
  v7->_materialDescription = (NSString *)v17;

  v19 = [v6 objectForKeyedSubscript:@"frequencyBands"];
  uint64_t v20 = decimalValuesFromCSV(v19);
  frequencyBands = v7->_frequencyBands;
  v7->_frequencyBands = (NSArray *)v20;

  v22 = [v6 objectForKeyedSubscript:@"scatteringUserData"];
  v23 = decimalValuesFromCSV(v22);
  uint64_t v24 = clampArrayValues(v23, &unk_26DB35420, &unk_26DB35438);
  scatteringUserData = v7->_scatteringUserData;
  v7->_scatteringUserData = (NSArray *)v24;

  v26 = [v6 objectForKeyedSubscript:@"scatteringReferenceData"];
  v27 = decimalValuesFromCSV(v26);
  uint64_t v28 = clampArrayValues(v27, &unk_26DB35420, &unk_26DB35438);
  scatteringReferenceData = v7->_scatteringReferenceData;
  v7->_scatteringReferenceData = (NSArray *)v28;

  v30 = [v6 objectForKeyedSubscript:@"uncertaintyReferenceData"];
  v31 = decimalValuesFromCSV(v30);
  uint64_t v32 = clampArrayValues(v31, &unk_26DB35420, &unk_26DB35438);
  uncertaintyReferenceData = v7->_uncertaintyReferenceData;
  v7->_uncertaintyReferenceData = (NSArray *)v32;

  v34 = [v6 objectForKeyedSubscript:@"numDataPointsReferenceData"];
  uint64_t v35 = integerValuesFromCSV(v34);
  numDataPointsReferenceData = v7->_numDataPointsReferenceData;
  v7->_numDataPointsReferenceData = (NSArray *)v35;

  v37 = [v6 objectForKeyedSubscript:@"totalNumDataSetsReferenceData"];
  v7->_totalNumDataSetsReferenceData = [v37 intValue];

  if (![(AMScattering *)v7 validatedWithoutError:a4]) {
    goto LABEL_6;
  }
  a4 = v7;
LABEL_7:

  return (AMScattering *)a4;
}

- (AMScattering)initWithMaterialName:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)AMScattering;
  v5 = [(AMScattering *)&v15 init];
  materialName = v5->_materialName;
  v5->_materialName = v4;
  v7 = v4;

  materialDescription = v5->_materialDescription;
  v5->_materialDescription = 0;

  frequencyBands = v5->_frequencyBands;
  v5->_frequencyBands = 0;

  scatteringUserData = v5->_scatteringUserData;
  v5->_scatteringUserData = 0;

  scatteringReferenceData = v5->_scatteringReferenceData;
  v5->_scatteringReferenceData = 0;

  uncertaintyReferenceData = v5->_uncertaintyReferenceData;
  v5->_uncertaintyReferenceData = 0;

  numDataPointsReferenceData = v5->_numDataPointsReferenceData;
  v5->_numDataPointsReferenceData = 0;

  v5->_totalNumDataSetsReferenceData = 0;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AMScattering *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v22 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    materialName = self->_materialName;
    v8 = [(AMScattering *)v6 materialName];
    LODWORD(materialName) = [(NSString *)materialName isEqualToString:v8];

    if (!materialName) {
      goto LABEL_14;
    }
    materialDescription = self->_materialDescription;
    v10 = [(AMScattering *)v6 materialDescription];
    LODWORD(materialDescription) = [(NSString *)materialDescription isEqualToString:v10];

    if (!materialDescription) {
      goto LABEL_14;
    }
    frequencyBands = self->_frequencyBands;
    v12 = [(AMScattering *)v6 frequencyBands];
    LODWORD(frequencyBands) = [(NSArray *)frequencyBands isEqualToArray:v12];

    if (!frequencyBands) {
      goto LABEL_14;
    }
    scatteringUserData = self->_scatteringUserData;
    char v14 = [(AMScattering *)v6 scatteringUserData];
    LODWORD(scatteringUserData) = [(NSArray *)scatteringUserData isEqualToArray:v14];

    if (!scatteringUserData) {
      goto LABEL_14;
    }
    scatteringReferenceData = self->_scatteringReferenceData;
    v16 = [(AMScattering *)v6 scatteringReferenceData];
    LODWORD(scatteringReferenceData) = [(NSArray *)scatteringReferenceData isEqualToArray:v16];

    if (!scatteringReferenceData) {
      goto LABEL_14;
    }
    uncertaintyReferenceData = self->_uncertaintyReferenceData;
    v18 = [(AMScattering *)v6 uncertaintyReferenceData];
    LODWORD(uncertaintyReferenceData) = [(NSArray *)uncertaintyReferenceData isEqualToArray:v18];

    if (!uncertaintyReferenceData) {
      goto LABEL_14;
    }
    numDataPointsReferenceData = self->_numDataPointsReferenceData;
    uint64_t v20 = [(AMScattering *)v6 numDataPointsReferenceData];
    LODWORD(numDataPointsReferenceData) = [(NSArray *)numDataPointsReferenceData isEqualToArray:v20];

    if (numDataPointsReferenceData)
    {
      int totalNumDataSetsReferenceData = self->_totalNumDataSetsReferenceData;
      BOOL v22 = totalNumDataSetsReferenceData == [(AMScattering *)v6 totalNumDataSetsReferenceData];
    }
    else
    {
LABEL_14:
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)validatedWithoutError:(id *)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NSArray *)self->_frequencyBands count];
  if ([(NSArray *)self->_scatteringUserData count] == v5
    && [(NSArray *)self->_scatteringReferenceData count] == v5
    && [(NSArray *)self->_uncertaintyReferenceData count] == v5
    && [(NSArray *)self->_numDataPointsReferenceData count] == v5)
  {
    if (([(NSString *)self->_materialName isEqual:&stru_26DB344D0] & 1) != 0
      || [(NSString *)self->_materialDescription isEqual:&stru_26DB344D0])
    {
      if (a3)
      {
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08320];
        v31 = @"Name and/or description is empty.";
        v7 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v8 = v6;
        uint64_t v9 = 4;
LABEL_11:
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", @"com.apple.acousticmaterials.ErrorDomain", v9, v7, v25);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (self->_totalNumDataSetsReferenceData < 0)
      {
        if (!a3) {
          return 0;
        }
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F08320];
        v29 = @"The value of totalNumDataSetsReferenceData is negative.";
        v7 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v8 = v23;
        uint64_t v9 = 6;
        goto LABEL_11;
      }
      if (!v5) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 1;
      char v14 = &unk_26DB35420;
      while (1)
      {
        objc_super v15 = -[NSArray objectAtIndexedSubscript:](self->_scatteringUserData, "objectAtIndexedSubscript:", v12, v25);
        if (!valueIsBetween(v15, v14, &unk_26DB35438)) {
          break;
        }
        v16 = [(NSArray *)self->_scatteringReferenceData objectAtIndexedSubscript:v12];
        if (!valueIsBetween(v16, v14, &unk_26DB35438)) {
          goto LABEL_27;
        }
        uint64_t v17 = [(NSArray *)self->_uncertaintyReferenceData objectAtIndexedSubscript:v12];
        if (!valueIsBetween(v17, v14, &unk_26DB35438))
        {

LABEL_27:
          break;
        }
        unsigned int v18 = v13;
        v19 = [(NSArray *)self->_numDataPointsReferenceData objectAtIndexedSubscript:v12];
        uint64_t v20 = [NSNumber numberWithInt:self->_totalNumDataSetsReferenceData];
        v25 = v15;
        v21 = v14;
        BOOL IsBetween = valueIsBetween(v19, v14, v20);

        if (!IsBetween) {
          goto LABEL_29;
        }
        uint64_t v12 = v18;
        int v13 = v18 + 1;
        BOOL result = 1;
        char v14 = v21;
        if (v5 <= v18) {
          return result;
        }
      }

LABEL_29:
      if (a3)
      {
        uint64_t v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = *MEMORY[0x263F08320];
        v27 = @"At least one value in one of the data sets lies outside the permitted value ranges.";
        v7 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        v8 = v24;
        uint64_t v9 = 7;
        goto LABEL_11;
      }
    }
  }
  else if (a3)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = @"Data arrays have different lengths.";
    v7 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v8 = v10;
    uint64_t v9 = 3;
    goto LABEL_11;
  }
  return 0;
}

- (NSString)materialName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)materialDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)frequencyBands
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)scatteringUserData
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScatteringUserData:(id)a3
{
}

- (NSArray)scatteringReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)uncertaintyReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)numDataPointsReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (int)totalNumDataSetsReferenceData
{
  return self->_totalNumDataSetsReferenceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDataPointsReferenceData, 0);
  objc_storeStrong((id *)&self->_uncertaintyReferenceData, 0);
  objc_storeStrong((id *)&self->_scatteringReferenceData, 0);
  objc_storeStrong((id *)&self->_scatteringUserData, 0);
  objc_storeStrong((id *)&self->_frequencyBands, 0);
  objc_storeStrong((id *)&self->_materialDescription, 0);
  objc_storeStrong((id *)&self->_materialName, 0);
}

@end