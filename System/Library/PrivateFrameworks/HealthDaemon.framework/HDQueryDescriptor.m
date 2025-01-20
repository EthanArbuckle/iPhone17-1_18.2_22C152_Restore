@interface HDQueryDescriptor
+ (HDQueryDescriptor)queryDescriptorWithSampleType:(id)a3;
+ (HDQueryDescriptor)queryDescriptorWithSampleTypes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDQueryDescriptor)init;
- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 filter:(id)a7 samplePredicate:(id)a8 deletedObjectsPredicate:(id)a9;
- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 samplePredicate:(id)a7;
- (HDSQLitePredicate)deletedObjectsPredicate;
- (HDSQLitePredicate)samplePredicate;
- (NSDictionary)encodingOptions;
- (NSSet)restrictedSourceEntities;
- (NSSet)sampleTypes;
- (_HKFilter)filter;
- (id)authorizationFilter;
- (unint64_t)hash;
@end

@implementation HDQueryDescriptor

- (HDQueryDescriptor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HDQueryDescriptor)queryDescriptorWithSampleType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];

  v7 = (void *)[v5 initWithSampleTypes:v6 encodingOptions:0 restrictedSourceEntities:0 authorizationFilter:0 filter:0 samplePredicate:0 deletedObjectsPredicate:0];

  return (HDQueryDescriptor *)v7;
}

+ (HDQueryDescriptor)queryDescriptorWithSampleTypes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithSampleTypes:v4 encodingOptions:0 restrictedSourceEntities:0 authorizationFilter:0 filter:0 samplePredicate:0 deletedObjectsPredicate:0];

  return (HDQueryDescriptor *)v5;
}

- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 samplePredicate:(id)a7
{
  return [(HDQueryDescriptor *)self initWithSampleTypes:a3 encodingOptions:a4 restrictedSourceEntities:a5 authorizationFilter:a6 filter:0 samplePredicate:a7 deletedObjectsPredicate:0];
}

- (HDQueryDescriptor)initWithSampleTypes:(id)a3 encodingOptions:(id)a4 restrictedSourceEntities:(id)a5 authorizationFilter:(id)a6 filter:(id)a7 samplePredicate:(id)a8 deletedObjectsPredicate:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!v16)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HDQueryDescriptor.m", 67, @"Invalid parameter not satisfying: %@", @"sampleTypes" object file lineNumber description];
  }
  if (![v16 count])
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HDQueryDescriptor.m", 68, @"Invalid parameter not satisfying: %@", @"sampleTypes.count" object file lineNumber description];
  }
  v41.receiver = self;
  v41.super_class = (Class)HDQueryDescriptor;
  v23 = [(HDQueryDescriptor *)&v41 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    sampleTypes = v23->_sampleTypes;
    v23->_sampleTypes = (NSSet *)v24;

    uint64_t v26 = [v17 copy];
    encodingOptions = v23->_encodingOptions;
    v23->_encodingOptions = (NSDictionary *)v26;

    uint64_t v28 = [v18 copy];
    restrictedSourceEntities = v23->_restrictedSourceEntities;
    v23->_restrictedSourceEntities = (NSSet *)v28;

    v30 = _Block_copy(v19);
    id authorizationFilter = v23->_authorizationFilter;
    v23->_id authorizationFilter = v30;

    uint64_t v32 = [v20 copy];
    filter = v23->_filter;
    v23->_filter = (_HKFilter *)v32;

    uint64_t v34 = [v21 copy];
    samplePredicate = v23->_samplePredicate;
    v23->_samplePredicate = (HDSQLitePredicate *)v34;

    uint64_t v36 = [v22 copy];
    deletedObjectsPredicate = v23->_deletedObjectsPredicate;
    v23->_deletedObjectsPredicate = (HDSQLitePredicate *)v36;
  }
  return v23;
}

- (unint64_t)hash
{
  v3 = [(HDQueryDescriptor *)self sampleTypes];
  uint64_t v4 = [v3 hash];
  id v5 = [(HDQueryDescriptor *)self encodingOptions];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HDQueryDescriptor *)self restrictedSourceEntities];
  uint64_t v8 = [v7 hash];
  v9 = [(HDQueryDescriptor *)self authorizationFilter];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(HDQueryDescriptor *)self filter];
  uint64_t v12 = [v11 hash];
  v13 = [(HDQueryDescriptor *)self samplePredicate];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(HDQueryDescriptor *)self deletedObjectsPredicate];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDQueryDescriptor *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HDQueryDescriptor *)self sampleTypes];
      uint64_t v7 = [(HDQueryDescriptor *)v5 sampleTypes];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HDQueryDescriptor *)v5 sampleTypes];
        if (!v9) {
          goto LABEL_39;
        }
        uint64_t v10 = (void *)v9;
        v11 = [(HDQueryDescriptor *)self sampleTypes];
        uint64_t v12 = [(HDQueryDescriptor *)v5 sampleTypes];
        int v13 = [v11 isEqualToSet:v12];

        if (!v13) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self encodingOptions];
      uint64_t v15 = [(HDQueryDescriptor *)v5 encodingOptions];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        uint64_t v8 = (void *)v15;
        uint64_t v16 = [(HDQueryDescriptor *)v5 encodingOptions];
        if (!v16) {
          goto LABEL_39;
        }
        id v17 = (void *)v16;
        id v18 = [(HDQueryDescriptor *)self encodingOptions];
        id v19 = [(HDQueryDescriptor *)v5 encodingOptions];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self restrictedSourceEntities];
      uint64_t v21 = [(HDQueryDescriptor *)v5 restrictedSourceEntities];
      if (v6 == (void *)v21)
      {
      }
      else
      {
        uint64_t v8 = (void *)v21;
        uint64_t v22 = [(HDQueryDescriptor *)v5 restrictedSourceEntities];
        if (!v22) {
          goto LABEL_39;
        }
        v23 = (void *)v22;
        uint64_t v24 = [(HDQueryDescriptor *)self restrictedSourceEntities];
        v25 = [(HDQueryDescriptor *)v5 restrictedSourceEntities];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self authorizationFilter];
      uint64_t v27 = [(HDQueryDescriptor *)v5 authorizationFilter];
      if (v6 == (void *)v27)
      {
      }
      else
      {
        uint64_t v8 = (void *)v27;
        uint64_t v28 = [(HDQueryDescriptor *)v5 authorizationFilter];
        if (!v28) {
          goto LABEL_39;
        }
        v29 = (void *)v28;
        v30 = [(HDQueryDescriptor *)self authorizationFilter];
        v31 = [(HDQueryDescriptor *)v5 authorizationFilter];
        uint64_t v32 = _Block_copy(v31);
        int v33 = [v30 isEqual:v32];

        if (!v33) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self filter];
      uint64_t v34 = [(HDQueryDescriptor *)v5 filter];
      if (v6 == (void *)v34)
      {
      }
      else
      {
        uint64_t v8 = (void *)v34;
        uint64_t v35 = [(HDQueryDescriptor *)v5 filter];
        if (!v35) {
          goto LABEL_39;
        }
        uint64_t v36 = (void *)v35;
        v37 = [(HDQueryDescriptor *)self filter];
        v38 = [(HDQueryDescriptor *)v5 filter];
        int v39 = [v37 isEqual:v38];

        if (!v39) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self samplePredicate];
      uint64_t v40 = [(HDQueryDescriptor *)v5 samplePredicate];
      if (v6 == (void *)v40)
      {
      }
      else
      {
        uint64_t v8 = (void *)v40;
        uint64_t v41 = [(HDQueryDescriptor *)v5 samplePredicate];
        if (!v41) {
          goto LABEL_39;
        }
        v42 = (void *)v41;
        v43 = [(HDQueryDescriptor *)self samplePredicate];
        v44 = [(HDQueryDescriptor *)v5 samplePredicate];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_40;
        }
      }
      uint64_t v6 = [(HDQueryDescriptor *)self deletedObjectsPredicate];
      uint64_t v46 = [(HDQueryDescriptor *)v5 deletedObjectsPredicate];
      if (v6 == (void *)v46)
      {

LABEL_44:
        BOOL v14 = 1;
        goto LABEL_41;
      }
      uint64_t v8 = (void *)v46;
      uint64_t v47 = [(HDQueryDescriptor *)v5 deletedObjectsPredicate];
      if (v47)
      {
        v48 = (void *)v47;
        v49 = [(HDQueryDescriptor *)self deletedObjectsPredicate];
        v50 = [(HDQueryDescriptor *)v5 deletedObjectsPredicate];
        char v51 = [v49 isEqual:v50];

        if (v51) {
          goto LABEL_44;
        }
LABEL_40:
        BOOL v14 = 0;
LABEL_41:

        goto LABEL_42;
      }
LABEL_39:

      goto LABEL_40;
    }
    BOOL v14 = 0;
  }
LABEL_42:

  return v14;
}

- (NSSet)sampleTypes
{
  return self->_sampleTypes;
}

- (NSDictionary)encodingOptions
{
  return self->_encodingOptions;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

- (HDSQLitePredicate)samplePredicate
{
  return self->_samplePredicate;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (HDSQLitePredicate)deletedObjectsPredicate
{
  return self->_deletedObjectsPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedObjectsPredicate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_samplePredicate, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);

  objc_storeStrong((id *)&self->_sampleTypes, 0);
}

@end