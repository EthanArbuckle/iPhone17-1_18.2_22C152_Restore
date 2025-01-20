@interface VNSceneTaxonomyOperationPoints
+ (BOOL)supportsSecureCoding;
+ (id)URLForIdentifier:(id)a3 error:(id *)a4;
+ (id)loadFromIdentifier:(id)a3 error:(id *)a4;
+ (id)loadFromPropertyList:(id)a3 error:(id *)a4;
+ (id)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6;
- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6;
- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6;
- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (VNSceneTaxonomyOperationPoints)initWithCoder:(id)a3;
- (VNSceneTaxonomyOperationPoints)initWithLabelToOperationPointsDataIndexMap:(id)a3 operationPointsDataArray:(id *)a4;
- (const)_operationPointsDataForClassificationIdentifier:(id)a3 error:(id *)a4;
- (id)_allClassificationIdentifiers;
- (id)_propertyListRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSceneTaxonomyOperationPoints

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToOperationPointsDataIndexMap, 0);
  objc_storeStrong((id *)&self->_nonframeworkDataURL, 0);

  objc_storeStrong((id *)&self->_frameworkOperationPointsIdentifier, 0);
}

- (VNSceneTaxonomyOperationPoints)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"Identifier"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    v20 = 0;
    v6 = [(id)objc_opt_class() loadFromIdentifier:v5 error:&v20];
    v7 = v20;
LABEL_5:
    id v8 = v7;
    if (v6) {
      v9 = v6;
    }
    else {
      [v4 failWithError:v8];
    }

    goto LABEL_9;
  }
  if ([v4 containsValueForKey:@"URL"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    v19 = 0;
    v6 = [(id)objc_opt_class() loadFromURL:v5 error:&v19];
    v7 = v19;
    goto LABEL_5;
  }
  if (![v4 containsValueForKey:@"plist"])
  {
    v17 = +[VNError errorForInvalidModelWithLocalizedDescription:@"no data source available"];
    [v4 failWithError:v17];

    v6 = 0;
    goto LABEL_10;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v5 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v5 forKey:@"plist"];
  id v18 = 0;
  v6 = [(id)objc_opt_class() loadFromPropertyList:v8 error:&v18];
  id v15 = v18;
  if (v6) {
    v16 = v6;
  }
  else {
    [v4 failWithError:v15];
  }

LABEL_9:
LABEL_10:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(_OWORD *)&self->_frameworkOperationPointsIdentifier == 0)
  {
    v5 = [(VNSceneTaxonomyOperationPoints *)self _propertyListRepresentation];
    [v6 encodeObject:v5 forKey:@"plist"];
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:");
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (VNSceneTaxonomyOperationPoints *)a3;
  if (v4 == self)
  {
    BOOL v28 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = (void *)MEMORY[0x1A6257080]();
      id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v8 = [(VNSceneTaxonomyOperationPoints *)self _allClassificationIdentifiers];
      v9 = (void *)[v7 initWithArray:v8];

      id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v11 = [(VNSceneTaxonomyOperationPoints *)v5 _allClassificationIdentifiers];
      uint64_t v12 = (void *)[v10 initWithArray:v11];

      if ([v9 isEqualToSet:v12])
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id obj = v9;
        uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          v30 = v6;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              id v18 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", v17, 0, v30);
              if (!v18) {
                goto LABEL_29;
              }
              p_var0 = &v18->var0;
              v20 = [(VNSceneTaxonomyOperationPoints *)v5 _operationPointsDataForClassificationIdentifier:v17 error:0];
              if (!v20) {
                goto LABEL_29;
              }
              if (p_var0 != v20)
              {
                if (*p_var0 != *v20 || p_var0[1] != v20[1] || p_var0[3] != v20[3] || p_var0[2] != v20[2]) {
                  goto LABEL_29;
                }
                BOOL v22 = 0;
                unint64_t v23 = 0;
                v24 = v20 + 21;
                v25 = p_var0 + 21;
                do
                {
                  LODWORD(v21) = *v25;
                  if (*(float *)v25 != *v24) {
                    break;
                  }
                  LODWORD(v21) = *(v25 - 1);
                  if (*(float *)&v21 != *(v24 - 1)) {
                    break;
                  }
                  BOOL v22 = v23 > 7;
                  if (v23 == 8) {
                    break;
                  }
                  LODWORD(v21) = *(v25 - 16);
                  if (*(float *)&v21 != *(v24 - 16)) {
                    break;
                  }
                  LODWORD(v21) = *(v25 - 17);
                  float v26 = *(v24 - 17);
                  v24 += 2;
                  v25 += 2;
                  ++v23;
                }
                while (*(float *)&v21 == v26);
                if (!v22)
                {
LABEL_29:
                  int v27 = 1;
                  id v6 = v30;
                  goto LABEL_31;
                }
              }
            }
            uint64_t v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v21);
            int v27 = 0;
            id v6 = v30;
            if (v14) {
              continue;
            }
            break;
          }
        }
        else
        {
          int v27 = 0;
        }
LABEL_31:
      }
      else
      {
        int v27 = 1;
      }

      BOOL v28 = v27 == 0;
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t cachedHashValue = self->_cachedHashValue;
  if (!cachedHashValue)
  {
    id v4 = (void *)MEMORY[0x1A6257080]();
    v5 = [(VNSceneTaxonomyOperationPoints *)self _allClassificationIdentifiers];
    id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t cachedHashValue = 0;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v13 = -[VNSceneTaxonomyOperationPoints _operationPointsDataForClassificationIdentifier:error:](self, "_operationPointsDataForClassificationIdentifier:error:", v12, 0, (void)v33);
          if (v13)
          {
            p_var0 = &v13->var0;
            uint64_t v15 = [v12 hash];
            uint64_t v16 = 0;
            float v17 = p_var0[1];
            unint64_t v18 = (unint64_t)*(unsigned int *)p_var0 << 13;
            if (*p_var0 == 0.0) {
              unint64_t v18 = 0;
            }
            uint64_t v19 = LODWORD(v17);
            if (v17 == 0.0) {
              uint64_t v19 = 0;
            }
            unint64_t v20 = v19 ^ v18;
            do
            {
              double v21 = &p_var0[v16];
              float v23 = p_var0[v16 + 2];
              float v22 = p_var0[v16 + 3];
              uint64_t v24 = LODWORD(v22);
              if (v22 == 0.0) {
                uint64_t v24 = 0;
              }
              uint64_t v25 = LODWORD(v23);
              if (v23 == 0.0) {
                uint64_t v25 = 0;
              }
              float v27 = v21[20];
              float v26 = v21[21];
              uint64_t v28 = LODWORD(v26);
              uint64_t v29 = v25 ^ __ROR8__(v24 ^ __ROR8__(v20, 51), 51);
              if (v26 == 0.0) {
                uint64_t v28 = 0;
              }
              uint64_t v30 = v28 ^ __ROR8__(v29, 51);
              uint64_t v31 = LODWORD(v27);
              if (v27 == 0.0) {
                uint64_t v31 = 0;
              }
              unint64_t v20 = v31 ^ __ROR8__(v30, 51);
              v16 += 2;
            }
            while (v16 != 18);
            unint64_t cachedHashValue = v20 ^ __ROR8__(v15 ^ __ROR8__(cachedHashValue, 51), 51);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t cachedHashValue = 0;
    }

    self->_unint64_t cachedHashValue = cachedHashValue;
  }
  return cachedHashValue;
}

- (BOOL)getClassificationMetrics:(id *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  id v7 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:0];
  if (!v7)
  {
    id v12 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  id v19 = 0;
  int valid = _createValueConfidenceCurveForValidPairData((uint64_t)v7->var2, &v19, (uint64_t)a5);
  id v10 = v19;
  id v11 = v10;
  id v12 = 0;
  if (valid)
  {
    if (v10)
    {
      id v18 = 0;
      int v13 = _createValueConfidenceCurveForValidPairData((uint64_t)v8->var3, &v18, (uint64_t)a5);
      id v14 = v18;
      uint64_t v15 = v14;
      id v12 = 0;
      if (v13 && v14) {
        id v12 = (id)[objc_alloc(MEMORY[0x1E4FB3E68]) initWithPrecisionCurve:v11 recallCurve:v14];
      }

      if ((v13 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      id v12 = 0;
    }

LABEL_12:
    id v12 = v12;
    *a3 = v12;
    BOOL v16 = 1;
    goto LABEL_13;
  }
LABEL_8:

  BOOL v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)getRecall:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  uint64_t v9 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:a6];
  if (v9)
  {
    int v11 = 0;
    LODWORD(v9) = _getValueForConfidence(@"recall", (float *)v9->var3, 0, (float *)&v11, a6, a5);
    if (a3)
    {
      if (v9) {
        *(_DWORD *)a3 = v11;
      }
    }
  }
  return (char)v9;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withRecall:(float)a5 error:(id *)a6
{
  uint64_t v9 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:a6];
  if (v9)
  {
    int v11 = 0;
    LODWORD(v9) = _getConfidenceForValue(@"recall", (float *)v9->var3, 0, (float *)&v11, a6, a5);
    if (a3)
    {
      if (v9) {
        *(_DWORD *)a3 = v11;
      }
    }
  }
  return (char)v9;
}

- (BOOL)getPrecision:(float *)a3 forClassificationIdentifier:(id)a4 confidence:(float)a5 error:(id *)a6
{
  uint64_t v9 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:a6];
  if (v9)
  {
    int v11 = 0;
    LODWORD(v9) = _getValueForConfidence(@"precision", (float *)v9->var2, 1, (float *)&v11, a6, a5);
    if (a3)
    {
      if (v9) {
        *(_DWORD *)a3 = v11;
      }
    }
  }
  return (char)v9;
}

- (BOOL)getConfidence:(float *)a3 forClassificationIdentifier:(id)a4 withPrecision:(float)a5 error:(id *)a6
{
  uint64_t v9 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:a6];
  if (v9)
  {
    int v11 = 0;
    LODWORD(v9) = _getConfidenceForValue(@"precision", (float *)v9->var2, 1, (float *)&v11, a6, a5);
    if (a3)
    {
      if (v9) {
        *(_DWORD *)a3 = v11;
      }
    }
  }
  return (char)v9;
}

- (BOOL)getDefaultConfidence:(float *)a3 forClassificationIdentifier:(id)a4 error:(id *)a5
{
  id v7 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:a4 error:a5];
  if (v7)
  {
    int v9 = 0;
    LODWORD(v7) = _getConfidenceForValue(@"precision", (float *)v7->var2, 1, (float *)&v9, a5, v7->var0);
    if (a3)
    {
      if (v7) {
        *(_DWORD *)a3 = v9;
      }
    }
  }
  return (char)v7;
}

- (id)_propertyListRepresentation
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v2 = [(VNSceneTaxonomyOperationPoints *)self _allClassificationIdentifiers];
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  context = (void *)MEMORY[0x1A6257080]();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [(VNSceneTaxonomyOperationPoints *)self _operationPointsDataForClassificationIdentifier:v6 error:0];
        if (v7)
        {
          p_var0 = (_DWORD *)&v7->var0;
          int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:18];
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:18];
          uint64_t v12 = 0x3FFFFFFFFFFFFFEELL;
          do
          {
            LODWORD(v11) = p_var0[v12 + 20];
            int v13 = [NSNumber numberWithFloat:v11];
            [v9 addObject:v13];

            LODWORD(v14) = p_var0[v12 + 21];
            uint64_t v15 = [NSNumber numberWithFloat:v14];
            [v9 addObject:v15];

            LODWORD(v16) = p_var0[v12 + 38];
            float v17 = [NSNumber numberWithFloat:v16];
            [v10 addObject:v17];

            LODWORD(v18) = p_var0[v12 + 39];
            id v19 = [NSNumber numberWithFloat:v18];
            [v10 addObject:v19];

            v12 += 2;
          }
          while (v12 * 4);
          v35[0] = @"threshold";
          LODWORD(v11) = *p_var0;
          unint64_t v20 = [NSNumber numberWithFloat:v11];
          v36[0] = v20;
          v35[1] = @"F2";
          LODWORD(v21) = p_var0[1];
          float v22 = [NSNumber numberWithFloat:v21];
          v36[1] = v22;
          v36[2] = v9;
          v35[2] = @"precision";
          v35[3] = @"recall";
          v36[3] = v10;
          float v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

          [v27 setObject:v23 forKey:v6];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v4);
  }

  return v27;
}

- (id)_allClassificationIdentifiers
{
  return NSAllMapTableKeys(self->_labelToOperationPointsDataIndexMap);
}

- (const)_operationPointsDataForClassificationIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  value = (void *)-1;
  if (!NSMapMember(self->_labelToOperationPointsDataIndexMap, v6, 0, &value))
  {
    if (a4)
    {
      [(id)objc_opt_class() errorForUnknownClassificationIdentifier:v6];
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  NSUInteger v7 = (NSUInteger)value - 1;
  if ((uint64_t)value < 1 || v7 >= NSCountMapTable(self->_labelToOperationPointsDataIndexMap))
  {
    if (a4)
    {
      int v9 = [NSString stringWithFormat:@"operation point map data for \"%@\" is corrupt", v6];
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v9];
    }
    goto LABEL_9;
  }
  uint64_t v8 = &self->_operationPointsDataArray[v7];
LABEL_10:

  return v8;
}

- (void)dealloc
{
  free(self->_operationPointsDataArray);
  v3.receiver = self;
  v3.super_class = (Class)VNSceneTaxonomyOperationPoints;
  [(VNSceneTaxonomyOperationPoints *)&v3 dealloc];
}

- (VNSceneTaxonomyOperationPoints)initWithLabelToOperationPointsDataIndexMap:(id)a3 operationPointsDataArray:(id *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNSceneTaxonomyOperationPoints;
  uint64_t v8 = [(VNSceneTaxonomyOperationPoints *)&v11 init];
  int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_labelToOperationPointsDataIndexMap, a3);
    v9->_operationPointsDataArray = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 open];
    int v9 = [MEMORY[0x1E4F28F98] propertyListWithStream:v8 options:0 format:0 error:a4];
    [v8 close];
    if (v9)
    {
      uint64_t v10 = [a1 loadFromPropertyList:v9 error:a4];
      objc_super v11 = (void *)v10;
      if (v10)
      {
        uint64_t v12 = *(void **)(v10 + 8);
        *(void *)(v10 + 8) = 0;

        uint64_t v13 = [v6 copy];
        double v14 = (void *)v11[2];
        v11[2] = v13;

        uint64_t v15 = v11;
      }
    }
    else
    {
      objc_super v11 = 0;
    }
    goto LABEL_9;
  }
  if (a4)
  {
    int v9 = [NSString stringWithFormat:@"unable to open %@", v6];
    +[VNError errorForInternalErrorWithLocalizedDescription:v9];
    objc_super v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  objc_super v11 = 0;
LABEL_10:

  return v11;
}

+ (id)loadFromPropertyList:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  size_t v5 = [v39 count];
  long long v34 = (char *)malloc_type_calloc(v5, 0x98uLL, 0x10000401CC6BE04uLL);
  if (!v34)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure];
      long long v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_46:
      long long v30 = 0;
    }
    goto LABEL_47;
  }
  uint64_t v38 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:v5];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = [v39 keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v7) {
    goto LABEL_38;
  }
  uint64_t v8 = 0;
  int v9 = v34 + 80;
  id obj = v6;
  uint64_t v36 = *(void *)v41;
  while (2)
  {
    uint64_t v10 = 0;
    uint64_t v37 = v8;
    uint64_t v11 = (uint64_t)&v9[152 * v8];
    do
    {
      if (*(void *)v41 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(const void **)(*((void *)&v40 + 1) + 8 * v10);
      NSMapInsertKnownAbsent(v38, v12, (const void *)(v37 + v10 + 1));
      uint64_t v13 = [v39 objectForKey:v12];
      double v14 = [v13 objectForKey:@"threshold"];
      uint64_t v15 = v14;
      if (!v14)
      {
        if (a4)
        {
          long long v31 = [NSString stringWithFormat:@"missing threshold for \"%@\"", v12];
          *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v31];
        }
LABEL_45:

        free(v34);
        goto LABEL_46;
      }
      [v14 floatValue];
      *(_DWORD *)(v11 - 80) = v16;
      float v17 = [v13 objectForKey:@"F2"];
      double v18 = v17;
      if (v17)
      {
        [v17 floatValue];
        *(_DWORD *)(v11 - 76) = v19;
        unint64_t v20 = [v13 objectForKey:@"precision"];
        double v21 = v20;
        if (v20)
        {
          if (_parseValueConfidenceArrayWithIncreasingConfidences(v20, v11 - 72, 1))
          {
            float v22 = [v13 objectForKey:@"recall"];
            float v23 = v22;
            if (v22)
            {
              int v24 = _parseValueConfidenceArrayWithIncreasingConfidences(v22, v11, 0);
              if (a4) {
                char v25 = v24;
              }
              else {
                char v25 = 1;
              }
              if (v25)
              {
                int v26 = v24 ^ 1;
LABEL_33:

                goto LABEL_34;
              }
              uint64_t v28 = [NSString stringWithFormat:@"invalid recall table for \"%@\"", v12];
              uint64_t v29 = +[VNError errorForInvalidModelWithLocalizedDescription:v28];
            }
            else
            {
              if (!a4)
              {
                float v23 = 0;
                goto LABEL_32;
              }
              uint64_t v28 = [NSString stringWithFormat:@"missing recall table for \"%@\"", v12];
              uint64_t v29 = +[VNError errorForInvalidModelWithLocalizedDescription:v28];
            }
            *a4 = v29;

LABEL_32:
            int v26 = 1;
            goto LABEL_33;
          }
          if (a4)
          {
            float v23 = [NSString stringWithFormat:@"invalid precision table for \"%@\"", v12];
            id v27 = +[VNError errorForInvalidModelWithLocalizedDescription:v23];
            goto LABEL_23;
          }
        }
        else
        {
          if (a4)
          {
            float v23 = [NSString stringWithFormat:@"missing precision table for \"%@\"", v12];
            id v27 = +[VNError errorForInvalidModelWithLocalizedDescription:v23];
LABEL_23:
            *a4 = v27;
            goto LABEL_32;
          }
          double v21 = 0;
        }
      }
      else
      {
        if (!a4)
        {
          int v26 = 1;
          goto LABEL_35;
        }
        double v21 = [NSString stringWithFormat:@"missing F2 for \"%@\"", v12];
        *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v21];
      }
      int v26 = 1;
LABEL_34:

LABEL_35:
      if (v26) {
        goto LABEL_45;
      }
      ++v10;
      v11 += 152;
    }
    while (v7 != v10);
    id v6 = obj;
    uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    uint64_t v8 = v37 + v10;
    int v9 = v34 + 80;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_38:

  long long v30 = (void *)[objc_alloc((Class)a1) initWithLabelToOperationPointsDataIndexMap:v38 operationPointsDataArray:v34];
  if (!v30) {
    free(v34);
  }
LABEL_47:

  return v30;
}

+ (id)URLForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"VNImageAnalyzerMultiDetectorSceneNetV3R8"])
  {
    id v6 = [MEMORY[0x1E4FB3F18] sceneNetV3AndReturnError:a4];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v6 sceneOperatingPointsFileURL];

      if (v8) {
        goto LABEL_10;
      }
      if (a4)
      {
        int v9 = [NSString stringWithFormat:@"operation points not available for identifier \"%@\"", v5];
        uint64_t v10 = +[VNError errorForDataUnavailableWithLocalizedDescription:v9];
LABEL_8:
        *a4 = v10;
      }
    }
  }
  else if (a4)
  {
    int v9 = [NSString stringWithFormat:@"unknown operation points identifier \"%@\"", v5];
    uint64_t v10 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v9];
    goto LABEL_8;
  }
  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

+ (id)loadFromIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 URLForIdentifier:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [a1 loadFromURL:v7 error:a4];
    int v9 = (void *)v8;
    if (v8)
    {
      uint64_t v10 = *(void **)(v8 + 16);
      *(void *)(v8 + 16) = 0;

      uint64_t v11 = [v6 copy];
      uint64_t v12 = (void *)v9[1];
      v9[1] = v11;

      uint64_t v13 = v9;
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

@end