@interface HDUserDomainConceptProcessingState
+ (id)fetchFromKeyValueDomain:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4;
- (HDUserDomainConceptProcessingState)init;
- (HDUserDomainConceptProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(id)a4 maximumPropertyType:(int64_t)a5;
- (HKOntologyVersion)ontologyVersion;
- (id)copyByUpdatingAnchor:(int64_t)a3;
- (id)description;
- (int64_t)anchor;
- (int64_t)maximumPropertyType;
- (unint64_t)hash;
@end

@implementation HDUserDomainConceptProcessingState

- (HDUserDomainConceptProcessingState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUserDomainConceptProcessingState)initWithAnchor:(int64_t)a3 ontologyVersion:(id)a4 maximumPropertyType:(int64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDUserDomainConceptProcessingState;
  v9 = [(HDUserDomainConceptProcessingState *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_anchor = a3;
    uint64_t v11 = [v8 copy];
    ontologyVersion = v10->_ontologyVersion;
    v10->_ontologyVersion = (HKOntologyVersion *)v11;

    v10->_maximumPropertyType = a5;
  }

  return v10;
}

- (id)copyByUpdatingAnchor:(int64_t)a3
{
  v5 = [HDUserDomainConceptProcessingState alloc];
  ontologyVersion = self->_ontologyVersion;
  int64_t maximumPropertyType = self->_maximumPropertyType;

  return [(HDUserDomainConceptProcessingState *)v5 initWithAnchor:a3 ontologyVersion:ontologyVersion maximumPropertyType:maximumPropertyType];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t anchor = self->_anchor;
  v6 = HKStringFromUserDomainConceptPropertyType();
  v7 = [v3 stringWithFormat:@"<%@:%p %lld, %@ (%ld), %@>", v4, self, anchor, v6, self->_maximumPropertyType, self->_ontologyVersion];

  return v7;
}

- (unint64_t)hash
{
  int64_t anchor = self->_anchor;
  return [(HKOntologyVersion *)self->_ontologyVersion hash] ^ anchor ^ self->_maximumPropertyType;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDUserDomainConceptProcessingState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v8 = self->_anchor == v5->_anchor
        && ((ontologyVersion = self->_ontologyVersion, v7 = v5->_ontologyVersion, ontologyVersion == v7)
         || v7 && -[HKOntologyVersion isEqual:](ontologyVersion, "isEqual:"))
        && self->_maximumPropertyType == v5->_maximumPropertyType;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (id)fetchFromKeyValueDomain:(id)a3 error:(id *)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32[0] = @"UserDomainConceptProcessingStateAnchor";
  v32[1] = @"UserDomainConceptProcessingStateVersionString";
  v32[2] = @"UserDomainConceptProcessingStateMaxPropertyType";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v7 = [v5 valuesForKeys:v6 error:a4];
  BOOL v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"UserDomainConceptProcessingStateAnchor"];
    v10 = [v8 objectForKeyedSubscript:@"UserDomainConceptProcessingStateVersionString"];
    uint64_t v11 = [v8 objectForKeyedSubscript:@"UserDomainConceptProcessingStateMaxPropertyType"];
    v12 = (void *)v11;
    if (v9) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13 || v11 == 0)
    {
      id v15 = v5;
      self;
      id v31 = 0;
      BOOL v16 = +[HDUserDomainConceptPersistableProcessingState fetchFromKeyValueDomain:v15 stateOut:&v31 error:a4];

      id v17 = v31;
      v26 = 0;
      if (v16)
      {
        v18 = [HDUserDomainConceptProcessingState alloc];
        if (v17)
        {
          uint64_t v30 = [v17 anchor];
          v29 = v18;
          id v19 = objc_alloc(MEMORY[0x1E4F2B308]);
          v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "ontologyVersion"));
          v20 = [v28 stringValue];
          v21 = (void *)[v19 initWithString:v20];
          v26 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:](v29, "initWithAnchor:ontologyVersion:maximumPropertyType:", v30, v21, [v17 maximumPropertyType]);

          v22 = v28;
        }
        else
        {
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F2B308]) initEmptyVersion];
          v26 = [(HDUserDomainConceptProcessingState *)v18 initWithAnchor:-1 ontologyVersion:v22 maximumPropertyType:180000];
        }
      }
    }
    else
    {
      v23 = [HDUserDomainConceptProcessingState alloc];
      uint64_t v24 = [v9 longLongValue];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F2B308]) initWithString:v10];
      v26 = -[HDUserDomainConceptProcessingState initWithAnchor:ontologyVersion:maximumPropertyType:](v23, "initWithAnchor:ontologyVersion:maximumPropertyType:", v24, v25, [v12 longLongValue]);
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)persistInKeyValueDomain:(id)a3 error:(id *)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22[0] = @"UserDomainConceptProcessingStateAnchor";
  v7 = [NSNumber numberWithLongLong:self->_anchor];
  v23[0] = v7;
  v22[1] = @"UserDomainConceptProcessingStateVersionString";
  BOOL v8 = [(HKOntologyVersion *)self->_ontologyVersion string];
  v23[1] = v8;
  v22[2] = @"UserDomainConceptProcessingStateMaxPropertyType";
  v9 = [NSNumber numberWithInteger:self->_maximumPropertyType];
  v23[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  int v11 = [v6 setValuesWithDictionary:v10 error:a4];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:@"LastProcessedUserDomainConceptStateKey"];
    id v17 = 0;
    char v13 = [v6 removeValuesForKeys:v12 error:&v17];
    id v14 = v17;

    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      id v15 = HKLogHealthOntology();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = self;
        __int16 v20 = 2114;
        id v21 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clear legacy state from key-value domain %{public}@", buf, 0x16u);
      }
    }
  }

  return v11;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (HKOntologyVersion)ontologyVersion
{
  return self->_ontologyVersion;
}

- (int64_t)maximumPropertyType
{
  return self->_maximumPropertyType;
}

- (void).cxx_destruct
{
}

@end