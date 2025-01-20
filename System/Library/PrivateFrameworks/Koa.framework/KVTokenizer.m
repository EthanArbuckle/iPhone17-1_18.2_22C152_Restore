@interface KVTokenizer
- (KVTokenizer)initWithLocale:(id)a3;
- (SEMTokenizer)tokenizer;
- (id)locale;
- (id)queryFromText:(id)a3;
- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4;
@end

@implementation KVTokenizer

- (void).cxx_destruct
{
}

- (SEMTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (id)queryFromText:(id)a3
{
  id v4 = a3;
  v5 = [KVSpanMatchQuery alloc];
  v10 = objc_msgSend_queryFromText_(self->_tokenizer, v6, (uint64_t)v4, v7, v8, v9);
  v15 = objc_msgSend_initWithQuery_(v5, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4
{
}

- (id)locale
{
  return (id)((uint64_t (*)(SEMTokenizer *, char *))MEMORY[0x1F4181798])(self->_tokenizer, sel_locale);
}

- (KVTokenizer)initWithLocale:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVTokenizer;
  v5 = [(KVTokenizer *)&v16 init];
  if (v5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v6 = (void *)qword_1E9F97008;
    uint64_t v21 = qword_1E9F97008;
    if (!qword_1E9F97008)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1BC3C5578;
      v17[3] = &unk_1E62AD708;
      v17[4] = &v18;
      sub_1BC3C5578((uint64_t)v17);
      v6 = (void *)v19[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = [v7 alloc];
    uint64_t v13 = objc_msgSend_initWithLocale_(v8, v9, (uint64_t)v4, v10, v11, v12);
    tokenizer = v5->_tokenizer;
    v5->_tokenizer = (SEMTokenizer *)v13;
  }
  return v5;
}

@end