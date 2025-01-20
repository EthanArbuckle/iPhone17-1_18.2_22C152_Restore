@interface _IKDSEPrototypeBundle
- (_IKDSEPrototypeBundle)init;
- (id)allPrototypes;
- (id)prototypeForItemAtIndex:(unint64_t)a3;
- (void)addPrototype:(id)a3 forIndexes:(id)a4;
@end

@implementation _IKDSEPrototypeBundle

- (_IKDSEPrototypeBundle)init
{
  v8.receiver = self;
  v8.super_class = (Class)_IKDSEPrototypeBundle;
  v2 = [(_IKDSEPrototypeBundle *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    prototypes = v2->_prototypes;
    v2->_prototypes = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)prototypeForItemAtIndex:(unint64_t)a3
{
  if (self->_flags.areEntriesDirty) {
    [(NSMutableArray *)self->_entries sortUsingComparator:&__block_literal_global_21];
  }
  uint64_t v5 = [(NSMutableArray *)self->_entries count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7 + (v6 >> 1);
      v9 = [(NSMutableArray *)self->_entries objectAtIndexedSubscript:v8];
      unint64_t v10 = [v9 range];
      if (a3 < v10 || a3 - v10 >= v11)
      {
        unint64_t v13 = [v9 range];
        if (v13 <= a3) {
          v6 += v7 + ~v8;
        }
        else {
          v6 >>= 1;
        }
        if (v13 <= a3) {
          uint64_t v7 = v8 + 1;
        }
        id v14 = 0;
      }
      else
      {
        id v14 = v9;
      }
    }
    while (!v14 && v6);
    if (v14)
    {
      v15 = -[NSMutableArray objectAtIndexedSubscript:](self->_prototypes, "objectAtIndexedSubscript:", [v14 prototypeIndex]);
      goto LABEL_23;
    }
  }
  else
  {
    id v14 = 0;
  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (id)allPrototypes
{
  return self->_prototypes;
}

- (void)addPrototype:(id)a3 forIndexes:(id)a4
{
  prototypes = self->_prototypes;
  id v7 = a4;
  [(NSMutableArray *)prototypes addObject:a3];
  uint64_t v8 = [(NSMutableArray *)self->_prototypes count] - 1;
  v9 = self->_entries;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49___IKDSEPrototypeBundle_addPrototype_forIndexes___block_invoke;
  v11[3] = &unk_1E6DE5E60;
  v12 = v9;
  uint64_t v13 = v8;
  unint64_t v10 = v9;
  [v7 enumerateRangesUsingBlock:v11];

  self->_flags.areEntriesDirty = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_prototypes, 0);
}

@end