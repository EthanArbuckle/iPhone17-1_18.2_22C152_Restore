@interface CNReputationResult
+ (id)descriptionForScore:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CNReputationHandle)handle;
- (CNReputationResult)initWithHandle:(id)a3 score:(int64_t)a4;
- (id)description;
- (int64_t)score;
- (unint64_t)hash;
@end

@implementation CNReputationResult

- (CNReputationResult)initWithHandle:(id)a3 score:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNReputationResult;
  v7 = [(CNReputationResult *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    handle = v7->_handle;
    v7->_handle = (CNReputationHandle *)v8;

    v7->_score = a4;
    v10 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNReputationResult *)self handle];
  id v5 = (id)[v3 appendName:@"handle" object:v4];

  id v6 = objc_msgSend((id)objc_opt_class(), "descriptionForScore:", -[CNReputationResult score](self, "score"));
  id v7 = (id)[v3 appendName:@"score" object:v6];

  uint64_t v8 = [v3 build];

  return v8;
}

+ (id)descriptionForScore:(int64_t)a3
{
  if (a3 == 2)
  {
    id v5 = NSString;
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v5 stringWithFormat:@"%@ (bad)", v4];
  }
  else if (a3 == 1)
  {
    id v6 = NSString;
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 stringWithFormat:@"%@ (good)", v4];
  }
  else
  {
    v3 = NSString;
    if (a3)
    {
      v4 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v3 stringWithFormat:@"%@ (invalid)", v4];
    }
    else
    {
      v4 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v3 stringWithFormat:@"%@ (neutral)", v4];
    }
  id v7 = };

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__CNReputationResult_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __30__CNReputationResult_isEqual___block_invoke_2;
  objc_super v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __30__CNReputationResult_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) score];
  uint64_t v4 = [*(id *)(a1 + 40) score];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __30__CNReputationResult_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) handle];
  uint64_t v4 = [*(id *)(a1 + 40) handle];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__CNReputationResult_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNReputationResult_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __26__CNReputationResult_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) handle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNReputationResult_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) score];

  return [v1 integerHash:v2];
}

- (CNReputationHandle)handle
{
  return (CNReputationHandle *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end