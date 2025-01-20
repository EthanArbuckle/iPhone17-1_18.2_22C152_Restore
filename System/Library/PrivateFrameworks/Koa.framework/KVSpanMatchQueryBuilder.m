@interface KVSpanMatchQueryBuilder
- (KVSpanMatchQueryBuilder)initWithLocale:(id)a3;
- (id)build;
- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWitespace:(BOOL)a9;
@end

@implementation KVSpanMatchQueryBuilder

- (void).cxx_destruct
{
}

- (id)build
{
  v6 = objc_msgSend_build(self->_builder, a2, v2, v3, v4, v5);
  v7 = [KVSpanMatchQuery alloc];
  v12 = objc_msgSend_initWithQuery_(v7, v8, (uint64_t)v6, v9, v10, v11);

  return v12;
}

- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWitespace:(BOOL)a9
{
}

- (KVSpanMatchQueryBuilder)initWithLocale:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVSpanMatchQueryBuilder;
  uint64_t v5 = [(KVSpanMatchQueryBuilder *)&v16 init];
  if (v5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v6 = (void *)qword_1E9F97018;
    uint64_t v21 = qword_1E9F97018;
    if (!qword_1E9F97018)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1BC3D59C0;
      v17[3] = &unk_1E62AD708;
      v17[4] = &v18;
      sub_1BC3D59C0((uint64_t)v17);
      v6 = (void *)v19[3];
    }
    v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = [v7 alloc];
    uint64_t v13 = objc_msgSend_initWithLocale_(v8, v9, (uint64_t)v4, v10, v11, v12);
    builder = v5->_builder;
    v5->_builder = (SEMSpanMatchQueryBuilder *)v13;
  }
  return v5;
}

@end