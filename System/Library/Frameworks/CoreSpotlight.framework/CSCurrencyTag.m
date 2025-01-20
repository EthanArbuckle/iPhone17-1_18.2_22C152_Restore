@interface CSCurrencyTag
- (CSCurrencyTag)initWithCurrencyAmount:(id)a3 currencyCode:(id)a4 confidence:(double)a5;
- (void)encodeWithCSCoder:(id)a3;
@end

@implementation CSCurrencyTag

- (CSCurrencyTag)initWithCurrencyAmount:(id)a3 currencyCode:(id)a4 confidence:(double)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    v15[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v14.receiver = self;
  v14.super_class = (Class)CSCurrencyTag;
  v12 = [(CSNumericAnalysisTag *)&v14 initWithPrimaryValue:v8 components:v11 confidence:a5];

  return v12;
}

- (void)encodeWithCSCoder:(id)a3
{
  id v10 = a3;
  [v10 beginType:"CSCurrencyTag"];
  uint64_t v4 = [(CSNumericAnalysisTag *)self primaryValue];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &unk_1EDBD69E8;
  }
  [v10 encodeObject:v6];

  uint64_t v7 = [(CSNumericAnalysisTag *)self components];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  [v10 encodeObject:v9];

  [(CSNumericAnalysisTag *)self confidence];
  objc_msgSend(v10, "encodeDouble:");
  [v10 endType];
}

@end