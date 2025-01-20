@interface HKMedicationsTokenizer
- (HKMedicationsTokenizer)init;
- (NLTokenizer)tokenizer;
- (id)wordsFromTranscript:(id)a3;
- (void)setTokenizer:(id)a3;
@end

@implementation HKMedicationsTokenizer

- (HKMedicationsTokenizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsTokenizer;
  v2 = [(HKMedicationsTokenizer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:0];
    [(HKMedicationsTokenizer *)v3 setTokenizer:v4];
  }
  return v3;
}

- (id)wordsFromTranscript:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v6 = [(HKMedicationsTokenizer *)self tokenizer];
  [v6 setString:v4];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v8 = [(HKMedicationsTokenizer *)self tokenizer];
  uint64_t v9 = [v4 length];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__HKMedicationsTokenizer_wordsFromTranscript___block_invoke;
  v14[3] = &unk_264BC37B0;
  id v15 = v4;
  id v10 = v7;
  id v16 = v10;
  id v11 = v4;
  objc_msgSend(v8, "enumerateTokensInRange:usingBlock:", 0, v9, v14);

  id v12 = v10;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

void __46__HKMedicationsTokenizer_wordsFromTranscript___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v6 = *(void **)(a1 + 40);
    id v7 = [v8 lowercaseString];
    [v6 addObject:v7];
  }
}

- (NLTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end