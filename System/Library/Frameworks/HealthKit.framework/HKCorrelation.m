@interface HKCorrelation
+ (BOOL)_allowEmptyCorrelations;
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects;
+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects device:(HKDevice *)device metadata:(NSDictionary *)metadata;
+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects metadata:(NSDictionary *)metadata;
- (BOOL)_containsObjects;
- (BOOL)_correlatedObjectsMatchFilterDictionary:(id)a3;
- (HKCorrelation)initWithCoder:(id)a3;
- (NSSet)objects;
- (NSSet)objectsForType:(HKObjectType *)objectType;
- (id)_allTypes;
- (id)_init;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (void)_addCorrelatedObject:(id)a3;
- (void)_addCorrelatedObjects:(id)a3;
- (void)_filterCorrelatedObjectsWithFilterDictionary:(id)a3;
- (void)_removeAllCorrelatedObjects;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCorrelation

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects
{
  return (HKCorrelation *)[a1 correlationWithType:correlationType startDate:startDate endDate:endDate objects:objects device:0 metadata:0];
}

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects metadata:(NSDictionary *)metadata
{
  return (HKCorrelation *)[a1 correlationWithType:correlationType startDate:startDate endDate:endDate objects:objects device:0 metadata:metadata];
}

+ (HKCorrelation)correlationWithType:(HKCorrelationType *)correlationType startDate:(NSDate *)startDate endDate:(NSDate *)endDate objects:(NSSet *)objects device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  v14 = correlationType;
  v15 = startDate;
  v16 = endDate;
  v17 = objects;
  v18 = device;
  v19 = metadata;
  if (v15)
  {
    [(NSDate *)v15 timeIntervalSinceReferenceDate];
    double v21 = v20;
    if (v16)
    {
LABEL_3:
      [(NSDate *)v16 timeIntervalSinceReferenceDate];
      double v23 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    double v21 = 2.22507386e-308;
    if (v16) {
      goto LABEL_3;
    }
  }
  double v23 = 2.22507386e-308;
LABEL_6:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__HKCorrelation_correlationWithType_startDate_endDate_objects_device_metadata___block_invoke;
  v27[3] = &unk_1E58C85E0;
  v28 = v17;
  v24 = v17;
  v25 = (void *)[a1 _newSampleWithType:v14 startDate:v18 endDate:v19 device:v27 metadata:v21 config:v23];

  return (HKCorrelation *)v25;
}

uint64_t __79__HKCorrelation_correlationWithType_startDate_endDate_objects_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _addCorrelatedObjects:*(void *)(a1 + 32)];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)HKCorrelation;
  v2 = [(HKSample *)&v6 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)v2[12];
    v2[12] = v3;
  }
  return v2;
}

- (NSSet)objects
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(NSMutableDictionary *)self->_objects allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 unionSet:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)HKCorrelation;
  uint64_t v5 = [(HKSample *)&v9 description];
  uint64_t v6 = [(HKCorrelation *)self objects];
  uint64_t v7 = [v3 stringWithFormat:@"<%@> %@ (%ld objects)", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (void)_addCorrelatedObject:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 sampleType];
  uint64_t v5 = [(NSMutableDictionary *)self->_objects objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_objects setObject:v5 forKeyedSubscript:v4];
  }
  [v5 addObject:v6];
}

- (void)_addCorrelatedObjects:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HKCorrelation *)self _addCorrelatedObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSSet)objectsForType:(HKObjectType *)objectType
{
  uint64_t v3 = [(NSMutableDictionary *)self->_objects objectForKeyedSubscript:objectType];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return (NSSet *)v4;
}

- (void)_filterCorrelatedObjectsWithFilterDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objects = self->_objects;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HKCorrelation__filterCorrelatedObjectsWithFilterDictionary___block_invoke;
  v11[3] = &unk_1E58C8608;
  id v12 = v4;
  uint64_t v7 = v5;
  long long v13 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)objects enumerateKeysAndObjectsUsingBlock:v11];
  long long v9 = self->_objects;
  self->_objects = v7;
  long long v10 = v7;
}

void __62__HKCorrelation__filterCorrelatedObjectsWithFilterDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (+[_HKFilter filter:acceptsDataObject:](_HKFilter, "filter:acceptsDataObject:", v8, v14, (void)v15))
        {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if ([v7 count]) {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
  }
}

- (BOOL)_correlatedObjectsMatchFilterDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = 1;
    if ([v4 count])
    {
      uint64_t v12 = 0;
      long long v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 1;
      objects = self->_objects;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__HKCorrelation__correlatedObjectsMatchFilterDictionary___block_invoke;
      v9[3] = &unk_1E58C8630;
      id v10 = v5;
      uint64_t v11 = &v12;
      [(NSMutableDictionary *)objects enumerateKeysAndObjectsUsingBlock:v9];
      BOOL v6 = *((unsigned char *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void __57__HKCorrelation__correlatedObjectsMatchFilterDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!+[_HKFilter filter:acceptsDataObject:](_HKFilter, "filter:acceptsDataObject:", v8, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)_containsObjects
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objects = self->_objects;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__HKCorrelation__containsObjects__block_invoke;
  v5[3] = &unk_1E58C8658;
  v5[4] = &v6;
  [(NSMutableDictionary *)objects enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__HKCorrelation__containsObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_removeAllCorrelatedObjects
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objects = self->_objects;
  self->_objects = v3;

  MEMORY[0x1F41817F8](v3, objects);
}

- (id)_allTypes
{
  return (id)[(NSMutableDictionary *)self->_objects allKeys];
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  id v4 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)HKCorrelation;
  id v5 = -[HKSample _validateWithConfiguration:](&v52, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = [(HKCorrelation *)v4 correlationType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v8 = 0x1E4F28000uLL;
  if ((isKindOfClass & 1) == 0)
  {
    char v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(HKCorrelation *)v4 correlationType];
    uint64_t v12 = objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v10, a2, @"Data type %@ must be of type %@"", v11, objc_opt_class());

    id v5 = (void *)v12;
  }
  if (([(id)objc_opt_class() _allowEmptyCorrelations] & 1) == 0
    && ![(HKCorrelation *)v4 _containsObjects])
  {
    long long v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v14, a2, @"%@: Objects must contain one or more HKSample"", objc_opt_class());

    id v5 = (void *)v15;
  }
  [(HKCorrelation *)v4 objects];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v47)
  {
    long long v16 = @"@\"\"";
    uint64_t v46 = *(void *)v49;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v4;
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v21 = v8;
        }
        else
        {
          v45 = v17;
          double v22 = a2;
          double v23 = v16;
          unint64_t v21 = v8;
          v24 = *(void **)(v8 + 3160);
          uint64_t v25 = objc_opt_class();
          uint64_t v26 = objc_opt_class();
          uint64_t v43 = objc_opt_class();
          v27 = v24;
          long long v16 = v23;
          a2 = v22;
          long long v17 = objc_msgSend(v27, "hk_errorForInvalidArgument:class:selector:format:", v16, v25, v22, @"%@: All objects must be of class %@, received %@", v26, v43, v20);
        }
        objc_opt_class();
        unint64_t v8 = v21;
        if (objc_opt_isKindOfClass())
        {
          v28 = *(void **)(v21 + 3160);
          id v4 = v19;
          uint64_t v29 = objc_opt_class();
          uint64_t v30 = objc_msgSend(v28, "hk_errorForInvalidArgument:class:selector:format:", v16, v29, a2, @"%@: Correlations cannot contain other correlations. Received %@", objc_opt_class(), v20);

          long long v17 = (void *)v30;
        }
        else
        {
          id v4 = v19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v31 = *(void **)(v8 + 3160);
          uint64_t v32 = objc_opt_class();
          uint64_t v33 = objc_msgSend(v31, "hk_errorForInvalidArgument:class:selector:format:", v16, v32, a2, @"%@: Correlations cannot contain workouts. Received %@", objc_opt_class(), v20);

          long long v17 = (void *)v33;
        }
        uint64_t v34 = [v20 _source];
        if (v34)
        {
          v35 = (void *)v34;
          v36 = v17;
          v37 = [v20 _source];
          v38 = +[HKSource defaultSource];
          char v39 = [v37 isEqual:v38];

          if (v39)
          {
            unint64_t v8 = 0x1E4F28000;
            long long v17 = v36;
          }
          else
          {
            v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v41 = objc_opt_class();
            long long v17 = objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", v16, v41, a2, @"%@: Correlations cannot contain objects that were saved by other sources. Received %@", objc_opt_class(), v20);

            unint64_t v8 = 0x1E4F28000uLL;
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v47);
  }
  else
  {
    long long v17 = v5;
  }

  return v17;
}

+ (BOOL)_allowEmptyCorrelations
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCorrelation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCorrelation;
  id v5 = [(HKSample *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"correlatedObjects"];
    objects = v5->_objects;
    v5->_objects = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCorrelation;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_objects, @"correlatedObjects", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end