@interface CADSequenceToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CADSequenceToken)initWithAllDBSequenceMap:(id)a3;
- (CADSequenceToken)initWithCoder:(id)a3;
- (CADSequenceToken)initWithMainDBSequence:(int)a3;
- (CADSequenceToken)initWithSerializedSequenceString:(id)a3;
- (NSDictionary)allDBSequenceMap;
- (id)description;
- (id)serializedSequenceString;
- (int)mainDBSequence;
- (int)sequenceForDatabaseID:(int)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADSequenceToken

- (CADSequenceToken)initWithMainDBSequence:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
  v10 = v5;
  v6 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [(CADSequenceToken *)self initWithAllDBSequenceMap:v7];

  return v8;
}

- (CADSequenceToken)initWithAllDBSequenceMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSequenceToken;
  v6 = [(CADSequenceToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_allDBSequenceMap, a3);
  }

  return v7;
}

- (CADSequenceToken)initWithSerializedSequenceString:(id)a3
{
  id v4 = a3;
  if ([v4 containsString:@"|"])
  {
    id v5 = [v4 componentsSeparatedByString:@"|"];
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((unint64_t)[v5 count] >= 2)
    {
      v26 = self;
      id v27 = v4;
      v7 = [v5 objectAtIndexedSubscript:0];
      v8 = [v7 componentsSeparatedByString:@","];

      v25 = v5;
      objc_super v9 = [v5 objectAtIndexedSubscript:1];
      v10 = [v9 componentsSeparatedByString:@","];

      unint64_t v11 = [v8 count];
      v28 = v10;
      unint64_t v12 = [v10 count];
      if (v11 >= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          v15 = [v8 objectAtIndexedSubscript:i];
          if (([v15 isEqual:&stru_1F1509B08] & 1) == 0)
          {
            v16 = v6;
            uint64_t v17 = [v15 intValue];
            v18 = [v28 objectAtIndexedSubscript:i];
            uint64_t v19 = [v18 intValue];

            v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v19];
            uint64_t v21 = v17;
            v6 = v16;
            v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v21];
            [v16 setObject:v20 forKeyedSubscript:v22];
          }
        }
      }

      self = v26;
      id v4 = v27;
      id v5 = v25;
    }
    v23 = [(CADSequenceToken *)self initWithAllDBSequenceMap:v6];
  }
  else
  {
    v23 = -[CADSequenceToken initWithMainDBSequence:](self, "initWithMainDBSequence:", [v4 intValue]);
  }

  return v23;
}

- (int)mainDBSequence
{
  allDBSequenceMap = self->_allDBSequenceMap;
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
  id v4 = [(NSDictionary *)allDBSequenceMap objectForKey:v3];

  LODWORD(v3) = [v4 intValue];
  return (int)v3;
}

- (int)sequenceForDatabaseID:(int)a3
{
  allDBSequenceMap = self->_allDBSequenceMap;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  id v5 = [(NSDictionary *)allDBSequenceMap objectForKey:v4];

  if (v5) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CADSequenceToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSequenceToken;
  id v5 = [(CADSequenceToken *)&v9 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_19);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder____whitelistedClasses forKey:@"kAllDBSequenceMapKey"];
    allDBSequenceMap = v5->_allDBSequenceMap;
    v5->_allDBSequenceMap = (NSDictionary *)v6;
  }
  return v5;
}

uint64_t __34__CADSequenceToken_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  initWithCoder____whitelistedClasses = v2;
  return MEMORY[0x1F41817F8](v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(CADSequenceToken *)self allDBSequenceMap];
  uint64_t v6 = [v4 allDBSequenceMap];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (id)serializedSequenceString
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(CADSequenceToken *)self allDBSequenceMap];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@,", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"|"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v9 = [(CADSequenceToken *)self allDBSequenceMap];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        v15 = [(CADSequenceToken *)self allDBSequenceMap];
        v16 = [v15 objectForKey:v14];

        [v3 appendFormat:@"%@,", v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }

  return v3;
}

- (id)description
{
  uint64_t v6 = self;
  uint64_t v2 = NSString;
  uint64_t v3 = [(CADSequenceToken *)self serializedSequenceString];
  id v4 = [v2 stringWithFormat:@"<CADSequenceToken: %p> {%@}", &v6, v3];

  return v4;
}

- (NSDictionary)allDBSequenceMap
{
  return self->_allDBSequenceMap;
}

- (void).cxx_destruct
{
}

@end