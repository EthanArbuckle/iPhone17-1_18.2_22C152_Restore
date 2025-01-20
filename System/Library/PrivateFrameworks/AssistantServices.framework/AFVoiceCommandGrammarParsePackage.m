@interface AFVoiceCommandGrammarParsePackage
+ (BOOL)supportsSecureCoding;
- (AFVoiceCommandGrammarParsePackage)initWithCoder:(id)a3;
- (AFVoiceCommandGrammarParsePackage)initWithNBestParses:(id)a3 preITNNBestParses:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)nBestParses;
- (NSArray)preITNNBestParses;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFVoiceCommandGrammarParsePackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preITNNBestParses, 0);
  objc_storeStrong((id *)&self->_nBestParses, 0);
}

- (NSArray)preITNNBestParses
{
  return self->_preITNNBestParses;
}

- (NSArray)nBestParses
{
  return self->_nBestParses;
}

- (void)encodeWithCoder:(id)a3
{
  nBestParses = self->_nBestParses;
  id v5 = a3;
  [v5 encodeObject:nBestParses forKey:@"AFVoiceCommandGrammarParsePackage::nBestParses"];
  [v5 encodeObject:self->_preITNNBestParses forKey:@"AFVoiceCommandGrammarParsePackage::preITNNBestParses"];
}

- (AFVoiceCommandGrammarParsePackage)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"AFVoiceCommandGrammarParsePackage::nBestParses"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"AFVoiceCommandGrammarParsePackage::preITNNBestParses"];

  v13 = [(AFVoiceCommandGrammarParsePackage *)self initWithNBestParses:v8 preITNNBestParses:v12];
  return v13;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSArray *)self->_nBestParses count])
  {
    v4 = objc_opt_new();
    nBestParses = self->_nBestParses;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke;
    v17[3] = &unk_1E5927588;
    id v18 = v4;
    id v6 = v4;
    [(NSArray *)nBestParses enumerateObjectsUsingBlock:v17];
    [v3 setObject:v6 forKey:@"nBestParses"];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v7 forKey:@"nBestParses"];
  }
  if ([(NSArray *)self->_preITNNBestParses count])
  {
    v8 = objc_opt_new();
    preITNNBestParses = self->_preITNNBestParses;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke_2;
    v15 = &unk_1E5927588;
    id v16 = v8;
    id v10 = v8;
    [(NSArray *)preITNNBestParses enumerateObjectsUsingBlock:&v12];
    objc_msgSend(v3, "setObject:forKey:", v10, @"preITNNBestParses", v12, v13, v14, v15);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v10 forKey:@"preITNNBestParses"];
  }

  return v3;
}

void __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dictionaryRepresentation];
  [v2 addObject:v3];
}

void __61__AFVoiceCommandGrammarParsePackage_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dictionaryRepresentation];
  [v2 addObject:v3];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"--nBestParses--"];
  nBestParses = self->_nBestParses;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__AFVoiceCommandGrammarParsePackage_description__block_invoke;
  v13[3] = &unk_1E5927588;
  id v5 = v3;
  id v14 = v5;
  [(NSArray *)nBestParses enumerateObjectsUsingBlock:v13];
  [v5 appendString:@"\n--preITNNBestParses--"];
  preITNNBestParses = self->_preITNNBestParses;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__AFVoiceCommandGrammarParsePackage_description__block_invoke_2;
  v11[3] = &unk_1E5927588;
  id v7 = v5;
  id v12 = v7;
  [(NSArray *)preITNNBestParses enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v7;

  return v9;
}

void __48__AFVoiceCommandGrammarParsePackage_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@"\n"];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"parse[%lu]", a3);
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendFormat:@"%@", v8];
}

void __48__AFVoiceCommandGrammarParsePackage_description__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@"\n"];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"parse[%lu]", a3);
  [*(id *)(a1 + 32) appendString:@"\n"];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 description];

  [v7 appendFormat:@"%@", v8];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFVoiceCommandGrammarParsePackage *)a3;
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
      id v6 = [(AFVoiceCommandGrammarParsePackage *)v5 nBestParses];
      nBestParses = self->_nBestParses;
      if (nBestParses == v6 || [(NSArray *)nBestParses isEqual:v6])
      {
        id v8 = [(AFVoiceCommandGrammarParsePackage *)v5 preITNNBestParses];
        preITNNBestParses = self->_preITNNBestParses;
        BOOL v10 = preITNNBestParses == v8 || [(NSArray *)preITNNBestParses isEqual:v8];
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

- (AFVoiceCommandGrammarParsePackage)initWithNBestParses:(id)a3 preITNNBestParses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceCommandGrammarParsePackage;
  id v8 = [(AFVoiceCommandGrammarParsePackage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    nBestParses = v8->_nBestParses;
    v8->_nBestParses = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    preITNNBestParses = v8->_preITNNBestParses;
    v8->_preITNNBestParses = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end