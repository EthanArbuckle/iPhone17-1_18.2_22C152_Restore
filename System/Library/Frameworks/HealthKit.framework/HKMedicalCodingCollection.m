@interface HKMedicalCodingCollection
+ (BOOL)supportsSecureCoding;
+ (HKMedicalCodingCollection)collectionWithCoding:(id)a3;
+ (HKMedicalCodingCollection)collectionWithCodings:(id)a3;
+ (id)stripCodingsMatchingSystem:(id)a3 fromCodings:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKMedicalCodingCollection)init;
- (HKMedicalCodingCollection)initWithCoder:(id)a3;
- (HKMedicalCodingCollection)initWithCodings:(id)a3;
- (NSArray)codings;
- (NSDictionary)codingsBySystem;
- (NSSet)codingsSet;
- (id)codingsExcludingCodingSystem:(id)a3;
- (id)codingsForCodingSystem:(id)a3;
- (id)collectionByAddingCodings:(id)a3;
- (id)description;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalCodingCollection

+ (HKMedicalCodingCollection)collectionWithCodings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HKMedicalCodingCollection.m", 29, @"Invalid parameter not satisfying: %@", @"codings" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc((Class)a1) initWithCodings:v5];

  return (HKMedicalCodingCollection *)v6;
}

+ (HKMedicalCodingCollection)collectionWithCoding:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HKMedicalCodingCollection.m", 34, @"Invalid parameter not satisfying: %@", @"coding" object file lineNumber description];
  }
  id v6 = objc_alloc((Class)a1);
  v11[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = (void *)[v6 initWithCodings:v7];

  return (HKMedicalCodingCollection *)v8;
}

- (HKMedicalCodingCollection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalCodingCollection)initWithCodings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKMedicalCodingCollection.m", 44, @"Invalid parameter not satisfying: %@", @"codings" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalCodingCollection;
  id v6 = [(HKMedicalCodingCollection *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v5];
    codingsOrderedSet = v6->_codingsOrderedSet;
    v6->_codingsOrderedSet = (NSOrderedSet *)v7;
  }
  return v6;
}

- (id)collectionByAddingCodings:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(HKMedicalCodingCollection *)self codings];
  v8 = (void *)[v6 initWithArray:v7];

  [v8 addObjectsFromArray:v5];
  v9 = [[HKMedicalCodingCollection alloc] initWithCodings:v8];

  return v9;
}

- (id)description
{
  v3 = [(HKMedicalCodingCollection *)self codings];
  uint64_t v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_21);
  id v5 = [v4 componentsJoinedByString:@", "];

  id v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@:%p, codings = [%@]>", v8, self, v5, 0];

  return v9;
}

uint64_t __40__HKMedicalCodingCollection_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (id)codingsForCodingSystem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(HKMedicalCodingCollection *)self codings];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __52__HKMedicalCodingCollection_codingsForCodingSystem___block_invoke;
  v11[3] = &unk_1E58BFCD0;
  id v12 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "hk_filter:", v11);
  v9 = [v5 setWithArray:v8];

  return v9;
}

uint64_t __52__HKMedicalCodingCollection_codingsForCodingSystem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 codingSystem];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)codingsExcludingCodingSystem:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(HKMedicalCodingCollection *)self codings];
  id v7 = [v5 stripCodingsMatchingSystem:v4 fromCodings:v6];

  return v7;
}

+ (id)stripCodingsMatchingSystem:(id)a3 fromCodings:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKMedicalCodingCollection_stripCodingsMatchingSystem_fromCodings___block_invoke;
  v9[3] = &unk_1E58BFCD0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a4, "hk_filter:", v9);

  return v7;
}

uint64_t __68__HKMedicalCodingCollection_stripCodingsMatchingSystem_fromCodings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 codingSystem];
  id v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    uint64_t v7 = 0;
  }
  else if (v5)
  {
    id v6 = [v3 codingSystem];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (NSDictionary)codingsBySystem
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = self->_codingsOrderedSet;
  uint64_t v5 = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v9 codingSystem];
        objc_super v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = +[HKMedicalCodingSystem unknownSystem];
        }
        v13 = v12;

        v14 = [v3 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v3 setObject:v15 forKeyedSubscript:v13];
        }
        v16 = [v3 objectForKeyedSubscript:v13];
        [v16 addObject:v9];
      }
      uint64_t v6 = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v17 = [v3 allKeys];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__HKMedicalCodingCollection_codingsBySystem__block_invoke;
  v21[3] = &unk_1E58BFCF8;
  id v22 = v3;
  id v18 = v3;
  v19 = objc_msgSend(v17, "hk_mapToDictionary:", v21);

  return (NSDictionary *)v19;
}

void __44__HKMedicalCodingCollection_codingsBySystem__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = a3;
  id v7 = a2;
  id v9 = [v5 objectForKeyedSubscript:v7];
  v8 = (void *)[v9 copy];
  ((void (**)(void, id, void *))a3)[2](v6, v7, v8);
}

- (NSArray)codings
{
  return [(NSOrderedSet *)self->_codingsOrderedSet array];
}

- (NSSet)codingsSet
{
  return [(NSOrderedSet *)self->_codingsOrderedSet set];
}

- (int64_t)count
{
  return [(NSOrderedSet *)self->_codingsOrderedSet count];
}

- (unint64_t)hash
{
  v2 = [(HKMedicalCodingCollection *)self codings];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(HKMedicalCodingCollection *)self codings];
      id v7 = [(HKMedicalCodingCollection *)v5 codings];
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v8 = [(HKMedicalCodingCollection *)v5 codings];
        if (v8)
        {
          id v9 = [(HKMedicalCodingCollection *)self codings];
          id v10 = [(HKMedicalCodingCollection *)v5 codings];
          int v11 = [v9 isEqual:v10] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 1;
        }
      }
      char v12 = v11 ^ 1;
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalCodingCollection)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"Codings"];

  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)HKMedicalCodingCollection;
    id v9 = [(HKMedicalCodingCollection *)&v14 init];
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v8];
      codingsOrderedSet = v9->_codingsOrderedSet;
      v9->_codingsOrderedSet = (NSOrderedSet *)v10;
    }
    self = v9;
    char v12 = self;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKMedicalCodingCollection *)self codings];
  [v4 encodeObject:v5 forKey:@"Codings"];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSOrderedSet *)self->_codingsOrderedSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end