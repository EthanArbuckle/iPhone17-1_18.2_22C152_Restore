@interface _MXVersion
- (NSArray)components;
- (_MXVersion)init;
- (_MXVersion)initWithComponents:(id)a3;
- (_MXVersion)initWithVersionString:(id)a3;
- (int64_t)compare:(id)a3;
@end

@implementation _MXVersion

- (_MXVersion)init
{
  result = (_MXVersion *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_MXVersion)initWithComponents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MXVersion;
  v5 = [(_MXVersion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (NSArray *)v6;
  }
  return v5;
}

- (_MXVersion)initWithVersionString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v4, "componentsSeparatedByString:", @".", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "integerValue"));
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(_MXVersion *)self initWithComponents:v5];
  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(_MXVersion *)self components];
  uint64_t v6 = [v4 components];
  unint64_t v7 = [v5 count];
  if (v7 <= [v6 count]) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v5;
  }
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    while (1)
    {
      v12 = &unk_1ED97E700;
      if (v11 < [v5 count])
      {
        v12 = [v5 objectAtIndexedSubscript:v11];
      }
      v13 = &unk_1ED97E700;
      if (v11 < [v6 count])
      {
        v13 = [v6 objectAtIndexedSubscript:v11];
      }
      int64_t v14 = [v12 compare:v13];

      if (v14) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    int64_t v14 = 0;
  }

  return v14;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
}

@end