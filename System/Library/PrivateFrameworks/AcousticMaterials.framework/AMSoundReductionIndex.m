@interface AMSoundReductionIndex
- (AMSoundReductionIndex)initWithMaterialName:(id)a3;
- (AMSoundReductionIndex)initWithValues:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)validatedWithoutError:(id *)a3;
- (NSArray)frequencyBands;
- (NSArray)numDataPointsReferenceData;
- (NSArray)soundReductionIndexReferenceData;
- (NSArray)soundReductionIndexUserData;
- (NSArray)uncertaintyReferenceData;
- (NSNumber)averageSoundReductionIndex;
- (NSNumber)materialDepth;
- (NSNumber)uncertaintyMaterialDepth;
- (NSString)materialDescription;
- (NSString)materialName;
- (int)totalNumDataSetsReferenceData;
- (void)setSoundReductionIndexUserData:(id)a3;
@end

@implementation AMSoundReductionIndex

- (AMSoundReductionIndex)initWithValues:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AMSoundReductionIndex;
  v7 = [(AMSoundReductionIndex *)&v47 init];
  v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [v6 allKeys];
  v10 = [v8 setWithArray:v9];
  v11 = (void *)MEMORY[0x263EFFA08];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"materialName", @"materialDescription", @"materialDepth", @"uncertaintyMaterialDepth", @"frequencyBands", @"soundReductionIndexUserData", @"soundReductionIndexReferenceData", @"uncertaintyReferenceData", @"averageSoundReductionIndex", @"numDataPointsReferenceData", @"totalNumDataSetsReferenceData", 0);
  v13 = [v11 setWithArray:v12];
  char v14 = [v10 isSubsetOfSet:v13];

  if ((v14 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49[0] = @"At least one mandatory key was not found in input dictionary.";
    v45 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    *a4 = [v44 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:7 userInfo:v45];

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

  uint64_t v19 = [v6 objectForKeyedSubscript:@"materialDepth"];
  materialDepth = v7->_materialDepth;
  v7->_materialDepth = (NSNumber *)v19;

  uint64_t v21 = [v6 objectForKeyedSubscript:@"uncertaintyMaterialDepth"];
  uncertaintyMaterialDepth = v7->_uncertaintyMaterialDepth;
  v7->_uncertaintyMaterialDepth = (NSNumber *)v21;

  v23 = [v6 objectForKeyedSubscript:@"frequencyBands"];
  uint64_t v24 = decimalValuesFromCSV(v23);
  frequencyBands = v7->_frequencyBands;
  v7->_frequencyBands = (NSArray *)v24;

  v26 = [v6 objectForKeyedSubscript:@"soundReductionIndexUserData"];
  v27 = decimalValuesFromCSV(v26);
  uint64_t v28 = clampArrayValues(v27, &unk_26DB353F0, &unk_26DB35408);
  soundReductionIndexUserData = v7->_soundReductionIndexUserData;
  v7->_soundReductionIndexUserData = (NSArray *)v28;

  v30 = [v6 objectForKeyedSubscript:@"soundReductionIndexReferenceData"];
  v31 = decimalValuesFromCSV(v30);
  uint64_t v32 = clampArrayValues(v31, &unk_26DB353F0, &unk_26DB35408);
  soundReductionIndexReferenceData = v7->_soundReductionIndexReferenceData;
  v7->_soundReductionIndexReferenceData = (NSArray *)v32;

  v34 = [v6 objectForKeyedSubscript:@"uncertaintyReferenceData"];
  v35 = decimalValuesFromCSV(v34);
  uint64_t v36 = clampArrayValues(v35, &unk_26DB353F0, &unk_26DB35408);
  uncertaintyReferenceData = v7->_uncertaintyReferenceData;
  v7->_uncertaintyReferenceData = (NSArray *)v36;

  uint64_t v38 = [v6 objectForKeyedSubscript:@"averageSoundReductionIndex"];
  averageSoundReductionIndex = v7->_averageSoundReductionIndex;
  v7->_averageSoundReductionIndex = (NSNumber *)v38;

  v40 = [v6 objectForKeyedSubscript:@"numDataPointsReferenceData"];
  uint64_t v41 = integerValuesFromCSV(v40);
  numDataPointsReferenceData = v7->_numDataPointsReferenceData;
  v7->_numDataPointsReferenceData = (NSArray *)v41;

  v43 = [v6 objectForKeyedSubscript:@"totalNumDataSetsReferenceData"];
  v7->_totalNumDataSetsReferenceData = [v43 intValue];

  if (![(AMSoundReductionIndex *)v7 validatedWithoutError:a4]) {
    goto LABEL_6;
  }
  a4 = v7;
LABEL_7:

  return (AMSoundReductionIndex *)a4;
}

- (AMSoundReductionIndex)initWithMaterialName:(id)a3
{
  v4 = (NSString *)a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSoundReductionIndex;
  v5 = [(AMSoundReductionIndex *)&v18 init];
  materialName = v5->_materialName;
  v5->_materialName = v4;
  v7 = v4;

  materialDescription = v5->_materialDescription;
  v5->_materialDescription = 0;

  frequencyBands = v5->_frequencyBands;
  v5->_frequencyBands = 0;

  materialDepth = v5->_materialDepth;
  v5->_materialDepth = 0;

  uncertaintyMaterialDepth = v5->_uncertaintyMaterialDepth;
  v5->_uncertaintyMaterialDepth = 0;

  soundReductionIndexUserData = v5->_soundReductionIndexUserData;
  v5->_soundReductionIndexUserData = 0;

  soundReductionIndexReferenceData = v5->_soundReductionIndexReferenceData;
  v5->_soundReductionIndexReferenceData = 0;

  uncertaintyReferenceData = v5->_uncertaintyReferenceData;
  v5->_uncertaintyReferenceData = 0;

  averageSoundReductionIndex = v5->_averageSoundReductionIndex;
  v5->_averageSoundReductionIndex = 0;

  numDataPointsReferenceData = v5->_numDataPointsReferenceData;
  v5->_numDataPointsReferenceData = 0;

  v5->_totalNumDataSetsReferenceData = 0;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AMSoundReductionIndex *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v28 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    materialName = self->_materialName;
    v8 = [(AMSoundReductionIndex *)v6 materialName];
    LODWORD(materialName) = [(NSString *)materialName isEqualToString:v8];

    if (!materialName) {
      goto LABEL_17;
    }
    materialDescription = self->_materialDescription;
    v10 = [(AMSoundReductionIndex *)v6 materialDescription];
    LODWORD(materialDescription) = [(NSString *)materialDescription isEqualToString:v10];

    if (!materialDescription) {
      goto LABEL_17;
    }
    materialDepth = self->_materialDepth;
    v12 = [(AMSoundReductionIndex *)v6 materialDepth];
    LODWORD(materialDepth) = [(NSNumber *)materialDepth isEqualToNumber:v12];

    if (!materialDepth) {
      goto LABEL_17;
    }
    uncertaintyMaterialDepth = self->_uncertaintyMaterialDepth;
    char v14 = [(AMSoundReductionIndex *)v6 uncertaintyMaterialDepth];
    LODWORD(uncertaintyMaterialDepth) = [(NSNumber *)uncertaintyMaterialDepth isEqualToNumber:v14];

    if (!uncertaintyMaterialDepth) {
      goto LABEL_17;
    }
    frequencyBands = self->_frequencyBands;
    v16 = [(AMSoundReductionIndex *)v6 frequencyBands];
    LODWORD(frequencyBands) = [(NSArray *)frequencyBands isEqualToArray:v16];

    if (!frequencyBands) {
      goto LABEL_17;
    }
    soundReductionIndexUserData = self->_soundReductionIndexUserData;
    objc_super v18 = [(AMSoundReductionIndex *)v6 soundReductionIndexUserData];
    LODWORD(soundReductionIndexUserData) = [(NSArray *)soundReductionIndexUserData isEqualToArray:v18];

    if (!soundReductionIndexUserData) {
      goto LABEL_17;
    }
    soundReductionIndexReferenceData = self->_soundReductionIndexReferenceData;
    v20 = [(AMSoundReductionIndex *)v6 soundReductionIndexReferenceData];
    LODWORD(soundReductionIndexReferenceData) = [(NSArray *)soundReductionIndexReferenceData isEqualToArray:v20];

    if (!soundReductionIndexReferenceData) {
      goto LABEL_17;
    }
    uncertaintyReferenceData = self->_uncertaintyReferenceData;
    v22 = [(AMSoundReductionIndex *)v6 uncertaintyReferenceData];
    LODWORD(uncertaintyReferenceData) = [(NSArray *)uncertaintyReferenceData isEqualToArray:v22];

    if (!uncertaintyReferenceData) {
      goto LABEL_17;
    }
    averageSoundReductionIndex = self->_averageSoundReductionIndex;
    uint64_t v24 = [(AMSoundReductionIndex *)v6 averageSoundReductionIndex];
    LODWORD(averageSoundReductionIndex) = [(NSNumber *)averageSoundReductionIndex isEqualToNumber:v24];

    if (!averageSoundReductionIndex) {
      goto LABEL_17;
    }
    numDataPointsReferenceData = self->_numDataPointsReferenceData;
    v26 = [(AMSoundReductionIndex *)v6 numDataPointsReferenceData];
    LODWORD(numDataPointsReferenceData) = [(NSArray *)numDataPointsReferenceData isEqualToArray:v26];

    if (numDataPointsReferenceData)
    {
      int totalNumDataSetsReferenceData = self->_totalNumDataSetsReferenceData;
      BOOL v28 = totalNumDataSetsReferenceData == [(AMSoundReductionIndex *)v6 totalNumDataSetsReferenceData];
    }
    else
    {
LABEL_17:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)validatedWithoutError:(id *)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NSArray *)self->_frequencyBands count];
  if ([(NSArray *)self->_soundReductionIndexUserData count] == v5
    && [(NSArray *)self->_soundReductionIndexReferenceData count] == v5
    && [(NSArray *)self->_uncertaintyReferenceData count] == v5
    && [(NSArray *)self->_numDataPointsReferenceData count] == v5)
  {
    if (([(NSString *)self->_materialName isEqual:&stru_26DB344D0] & 1) != 0
      || [(NSString *)self->_materialDescription isEqual:&stru_26DB344D0])
    {
      if (a3)
      {
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F08320];
        v37 = @"Name and or description is empty or corrupted.";
        v7 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v8 = v6;
        uint64_t v9 = 4;
LABEL_11:
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", @"com.apple.acousticmaterials.ErrorDomain", v9, v7, v29);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [(NSNumber *)self->_materialDepth floatValue];
      if (v12 < 0.0
        || ([(NSNumber *)self->_uncertaintyMaterialDepth floatValue], v13 < 0.0)
        || ([(NSNumber *)self->_averageSoundReductionIndex floatValue], v14 < 0.0))
      {
        if (!a3) {
          return 0;
        }
        uint64_t v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = *MEMORY[0x263F08320];
        v35 = @"The value of materialDepth, uncertainityMaterialDepth or averageSoundReductionIndex is negative.";
        v7 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v8 = v15;
        uint64_t v9 = 5;
        goto LABEL_11;
      }
      if (self->_totalNumDataSetsReferenceData < 0)
      {
        if (!a3) {
          return 0;
        }
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08320];
        v33 = @"The value of totalNumDataSetsReferenceData is negative.";
        v7 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        v8 = v27;
        uint64_t v9 = 6;
        goto LABEL_11;
      }
      if (!v5) {
        return 1;
      }
      uint64_t v16 = 0;
      int v17 = 1;
      objc_super v18 = &unk_26DB353F0;
      while (1)
      {
        uint64_t v19 = -[NSArray objectAtIndexedSubscript:](self->_soundReductionIndexUserData, "objectAtIndexedSubscript:", v16, v29);
        if (!valueIsBetween(v19, v18, &unk_26DB35408)) {
          break;
        }
        v20 = [(NSArray *)self->_soundReductionIndexReferenceData objectAtIndexedSubscript:v16];
        if (!valueIsBetween(v20, v18, &unk_26DB35408)) {
          goto LABEL_33;
        }
        uint64_t v21 = [(NSArray *)self->_uncertaintyReferenceData objectAtIndexedSubscript:v16];
        if (!valueIsBetween(v21, v18, &unk_26DB35408)
          || !valueIsBetween(self->_averageSoundReductionIndex, v18, &unk_26DB35408))
        {

LABEL_33:
          break;
        }
        unsigned int v22 = v17;
        v23 = [(NSArray *)self->_numDataPointsReferenceData objectAtIndexedSubscript:v16];
        uint64_t v24 = [NSNumber numberWithInt:self->_totalNumDataSetsReferenceData];
        v29 = v19;
        v25 = v18;
        BOOL IsBetween = valueIsBetween(v23, v18, v24);

        if (!IsBetween) {
          goto LABEL_35;
        }
        uint64_t v16 = v22;
        int v17 = v22 + 1;
        BOOL result = 1;
        objc_super v18 = v25;
        if (v5 <= v22) {
          return result;
        }
      }

LABEL_35:
      if (a3)
      {
        BOOL v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08320];
        v31 = @"At least one value in one of the data sets lies outside the permitted value ranges.";
        v7 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v8 = v28;
        uint64_t v9 = 7;
        goto LABEL_11;
      }
    }
  }
  else if (a3)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = @"Data arrays have different lengths.";
    v7 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
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

- (NSNumber)materialDepth
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)uncertaintyMaterialDepth
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)frequencyBands
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)soundReductionIndexUserData
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSoundReductionIndexUserData:(id)a3
{
}

- (NSArray)soundReductionIndexReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)uncertaintyReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)averageSoundReductionIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)numDataPointsReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (int)totalNumDataSetsReferenceData
{
  return self->_totalNumDataSetsReferenceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDataPointsReferenceData, 0);
  objc_storeStrong((id *)&self->_averageSoundReductionIndex, 0);
  objc_storeStrong((id *)&self->_uncertaintyReferenceData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndexReferenceData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndexUserData, 0);
  objc_storeStrong((id *)&self->_frequencyBands, 0);
  objc_storeStrong((id *)&self->_uncertaintyMaterialDepth, 0);
  objc_storeStrong((id *)&self->_materialDepth, 0);
  objc_storeStrong((id *)&self->_materialDescription, 0);
  objc_storeStrong((id *)&self->_materialName, 0);
}

@end