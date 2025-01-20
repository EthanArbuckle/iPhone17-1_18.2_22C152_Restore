@interface NWURLErrorUserInfoDictionary
- (NWURLError)error;
- (NWURLErrorUserInfoDictionary)initWithError:(id)a3;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)setError:(id)a3;
@end

@implementation NWURLErrorUserInfoDictionary

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NWURLError)error
{
  return self->_error;
}

- (id)keyEnumerator
{
  v3 = objc_alloc_init(NWURLErrorUserInfoDictionaryEnumerator);
  v4 = [(NWURLErrorUserInfoDictionary *)self error];
  [(NWURLErrorUserInfoDictionaryEnumerator *)v3 setError:v4];

  v5 = +[NWURLError allUserInfoKeys];
  v6 = [v5 keyEnumerator];
  [(NWURLErrorUserInfoDictionaryEnumerator *)v3 setUserInfoKeyEnumerator:v6];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NWURLError allUserInfoKeys];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = NSSelectorFromString(v6);

  if (v7)
  {
    v8 = [(NWURLErrorUserInfoDictionary *)self error];
    v9 = [v8 v7];
LABEL_5:

    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4F289C0] isEqual:v4])
  {
    v8 = [(NWURLErrorUserInfoDictionary *)self error];
    v10 = [v8 failingURL];
    v9 = [v10 absoluteString];

    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = +[NWURLError allUserInfoKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__NWURLErrorUserInfoDictionary_count__block_invoke;
  v6[3] = &unk_1E52496D0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __37__NWURLErrorUserInfoDictionary_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = [v4 error];
  uint64_t v7 = NSSelectorFromString(v5);

  v8 = [v6 v7];

  if (v8) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (NWURLErrorUserInfoDictionary)initWithError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWURLErrorUserInfoDictionary;
  v5 = [(NWURLErrorUserInfoDictionary *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NWURLErrorUserInfoDictionary *)v5 setError:v4];
  }

  return v6;
}

@end