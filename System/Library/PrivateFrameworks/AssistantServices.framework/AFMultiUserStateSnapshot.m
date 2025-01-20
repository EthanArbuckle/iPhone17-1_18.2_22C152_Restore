@interface AFMultiUserStateSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFMultiUserStateSnapshot)init;
- (AFMultiUserStateSnapshot)initWithBuilder:(id)a3;
- (AFMultiUserStateSnapshot)initWithCoder:(id)a3;
- (AFMultiUserStateSnapshot)initWithConfidenceScores:(id)a3;
- (AFMultiUserStateSnapshot)initWithDictionaryRepresentation:(id)a3;
- (AFMultiUserStateSnapshot)initWithSerializedBackingStore:(id)a3;
- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3;
- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3 confidenceScores:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)confidenceScores;
- (NSNumber)vtSatScore;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFMultiUserStateSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceScores, 0);
  objc_storeStrong((id *)&self->_vtSatScore, 0);
}

- (NSArray)confidenceScores
{
  return self->_confidenceScores;
}

- (NSNumber)vtSatScore
{
  return self->_vtSatScore;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  vtSatScore = self->_vtSatScore;
  if (vtSatScore) {
    [v3 setObject:vtSatScore forKey:@"vtSatScore"];
  }
  if (self->_confidenceScores)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_confidenceScores, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_confidenceScores;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "buildDictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
    [v4 setObject:v13 forKey:@"confidenceScores"];
  }
  v14 = objc_msgSend(v4, "copy", (void)v16);

  return v14;
}

- (AFMultiUserStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"vtSatScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v9 = [v5 objectForKey:@"confidenceScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = self;
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(id *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v17 = [[AFSharedConfidenceScore alloc] initWithDictionaryRepresentation:v16];

              if (v17) {
                [v10 addObject:v17];
              }
            }
            else
            {

              long long v17 = 0;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      long long v18 = (void *)[v10 copy];
      self = v20;
    }
    else
    {
      long long v18 = 0;
    }

    self = [(AFMultiUserStateSnapshot *)self initWithVtSatScore:v7 confidenceScores:v18];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  vtSatScore = self->_vtSatScore;
  id v5 = a3;
  [v5 encodeObject:vtSatScore forKey:@"AFMultiUserStateSnapshot::vtSatScore"];
  [v5 encodeObject:self->_confidenceScores forKey:@"AFMultiUserStateSnapshot::confidenceScores"];
}

- (AFMultiUserStateSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFMultiUserStateSnapshot::vtSatScore"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AFMultiUserStateSnapshot::confidenceScores"];

  uint64_t v10 = [(AFMultiUserStateSnapshot *)self initWithVtSatScore:v5 confidenceScores:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFMultiUserStateSnapshot *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFMultiUserStateSnapshot *)v5 vtSatScore];
      vtSatScore = self->_vtSatScore;
      if (vtSatScore == v6 || [(NSNumber *)vtSatScore isEqual:v6])
      {
        uint64_t v8 = [(AFMultiUserStateSnapshot *)v5 confidenceScores];
        confidenceScores = self->_confidenceScores;
        BOOL v10 = confidenceScores == v8 || [(NSArray *)confidenceScores isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_vtSatScore hash];
  return [(NSArray *)self->_confidenceScores hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFMultiUserStateSnapshot;
  id v5 = [(AFMultiUserStateSnapshot *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {vtSatScore = %@, confidenceScores = %@}", v5, self->_vtSatScore, self->_confidenceScores];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFMultiUserStateSnapshot *)self _descriptionWithIndent:0];
}

- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3 confidenceScores:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__AFMultiUserStateSnapshot_initWithVtSatScore_confidenceScores___block_invoke;
  v12[3] = &unk_1E5925520;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFMultiUserStateSnapshot *)self initWithBuilder:v12];

  return v10;
}

void __64__AFMultiUserStateSnapshot_initWithVtSatScore_confidenceScores___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setVtSatScore:v3];
  [v4 setConfidenceScores:*(void *)(a1 + 40)];
}

- (AFMultiUserStateSnapshot)init
{
  return [(AFMultiUserStateSnapshot *)self initWithBuilder:0];
}

- (AFMultiUserStateSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFMultiUserStateSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFMultiUserStateSnapshot;
  id v5 = [(AFMultiUserStateSnapshot *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFMultiUserStateSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFMultiUserStateSnapshotMutation *)v7 isDirty])
    {
      id v8 = [(_AFMultiUserStateSnapshotMutation *)v7 getVtSatScore];
      uint64_t v9 = [v8 copy];
      vtSatScore = v6->_vtSatScore;
      v6->_vtSatScore = (NSNumber *)v9;

      id v11 = [(_AFMultiUserStateSnapshotMutation *)v7 getConfidenceScores];
      uint64_t v12 = [v11 copy];
      confidenceScores = v6->_confidenceScores;
      v6->_confidenceScores = (NSArray *)v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFMultiUserStateSnapshotMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFMultiUserStateSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFMultiUserStateSnapshotMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFMultiUserStateSnapshot);
      id v7 = [(_AFMultiUserStateSnapshotMutation *)v5 getVtSatScore];
      uint64_t v8 = [v7 copy];
      vtSatScore = v6->_vtSatScore;
      v6->_vtSatScore = (NSNumber *)v8;

      BOOL v10 = [(_AFMultiUserStateSnapshotMutation *)v5 getConfidenceScores];
      uint64_t v11 = [v10 copy];
      confidenceScores = v6->_confidenceScores;
      v6->_confidenceScores = (NSArray *)v11;
    }
    else
    {
      id v6 = (AFMultiUserStateSnapshot *)[(AFMultiUserStateSnapshot *)self copy];
    }
  }
  else
  {
    id v6 = (AFMultiUserStateSnapshot *)[(AFMultiUserStateSnapshot *)self copy];
  }

  return v6;
}

- (AFMultiUserStateSnapshot)initWithConfidenceScores:(id)a3
{
  return [(AFMultiUserStateSnapshot *)self initWithVtSatScore:0 confidenceScores:a3];
}

- (AFMultiUserStateSnapshot)initWithVtSatScore:(id)a3
{
  return [(AFMultiUserStateSnapshot *)self initWithVtSatScore:a3 confidenceScores:0];
}

- (id)ad_shortDescription
{
  id v3 = NSString;
  id v4 = [(AFMultiUserStateSnapshot *)self vtSatScore];
  id v5 = [(AFMultiUserStateSnapshot *)self confidenceScores];
  uint64_t v6 = [v5 count];
  id v7 = @"YES";
  if (!v6) {
    id v7 = @"NO";
  }
  uint64_t v8 = [v3 stringWithFormat:@"(vtSatScore = %@, hasConfidenceScores = %@)", v4, v7];

  return v8;
}

- (AFMultiUserStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(AFMultiUserStateSnapshot *)self initWithDictionaryRepresentation:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end