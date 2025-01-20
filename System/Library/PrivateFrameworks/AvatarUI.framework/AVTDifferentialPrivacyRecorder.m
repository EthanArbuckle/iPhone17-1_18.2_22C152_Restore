@interface AVTDifferentialPrivacyRecorder
+ (id)makeCachingNumRecorderProvider:(id)a3;
+ (id)makeCachingStringRecorderProvider:(id)a3;
- (AVTDifferentialPrivacyRecorder)init;
- (AVTDifferentialPrivacyRecorder)initWithStringRecorderProvider:(id)a3 numericDataRecorderProvider:(id)a4;
- (NSMutableDictionary)numRecorders;
- (NSMutableDictionary)stringRecorders;
- (id)numRecorderProvider;
- (id)stringRecorderProvider;
- (void)recordNumber:(id)a3 forKey:(id)a4;
- (void)recordString:(id)a3 forKey:(id)a4;
@end

@implementation AVTDifferentialPrivacyRecorder

- (AVTDifferentialPrivacyRecorder)init
{
  return [(AVTDifferentialPrivacyRecorder *)self initWithStringRecorderProvider:&__block_literal_global_21 numericDataRecorderProvider:&__block_literal_global_3_1];
}

id __38__AVTDifferentialPrivacyRecorder_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)get_DPStringRecorderClass_softClass;
  uint64_t v11 = get_DPStringRecorderClass_softClass;
  if (!get_DPStringRecorderClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __get_DPStringRecorderClass_block_invoke;
    v7[3] = &unk_263FF09B0;
    v7[4] = &v8;
    __get_DPStringRecorderClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] initWithKey:v2];

  return v5;
}

id __38__AVTDifferentialPrivacyRecorder_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)get_DPNumericDataRecorderClass_softClass;
  uint64_t v11 = get_DPNumericDataRecorderClass_softClass;
  if (!get_DPNumericDataRecorderClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __get_DPNumericDataRecorderClass_block_invoke;
    v7[3] = &unk_263FF09B0;
    v7[4] = &v8;
    __get_DPNumericDataRecorderClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] initWithKey:v2];

  return v5;
}

+ (id)makeCachingStringRecorderProvider:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__AVTDifferentialPrivacyRecorder_makeCachingStringRecorderProvider___block_invoke;
  v9[3] = &unk_263FF23E0;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  v7 = (void *)MEMORY[0x210530210](v9);

  return v7;
}

id __68__AVTDifferentialPrivacyRecorder_makeCachingStringRecorderProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

+ (id)makeCachingNumRecorderProvider:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__AVTDifferentialPrivacyRecorder_makeCachingNumRecorderProvider___block_invoke;
  v9[3] = &unk_263FF2408;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  v7 = (void *)MEMORY[0x210530210](v9);

  return v7;
}

id __65__AVTDifferentialPrivacyRecorder_makeCachingNumRecorderProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

- (AVTDifferentialPrivacyRecorder)initWithStringRecorderProvider:(id)a3 numericDataRecorderProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTDifferentialPrivacyRecorder;
  uint64_t v8 = [(AVTDifferentialPrivacyRecorder *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() makeCachingStringRecorderProvider:v6];
    id stringRecorderProvider = v8->_stringRecorderProvider;
    v8->_id stringRecorderProvider = (id)v9;

    uint64_t v11 = [(id)objc_opt_class() makeCachingNumRecorderProvider:v7];
    id numRecorderProvider = v8->_numRecorderProvider;
    v8->_id numRecorderProvider = (id)v11;
  }
  return v8;
}

- (void)recordString:(id)a3 forKey:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTDifferentialPrivacyRecorder *)self stringRecorderProvider];
  uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v6);

  v11[0] = v7;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  [v9 record:v10];
}

- (void)recordNumber:(id)a3 forKey:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTDifferentialPrivacyRecorder *)self numRecorderProvider];
  uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v6);

  v11[0] = v7;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  [v9 record:v10];
}

- (id)stringRecorderProvider
{
  return self->_stringRecorderProvider;
}

- (id)numRecorderProvider
{
  return self->_numRecorderProvider;
}

- (NSMutableDictionary)stringRecorders
{
  return self->_stringRecorders;
}

- (NSMutableDictionary)numRecorders
{
  return self->_numRecorders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numRecorders, 0);
  objc_storeStrong((id *)&self->_stringRecorders, 0);
  objc_storeStrong(&self->_numRecorderProvider, 0);
  objc_storeStrong(&self->_stringRecorderProvider, 0);
}

@end