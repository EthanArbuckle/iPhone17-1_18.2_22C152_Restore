@interface __NSVariableWidthString
- (__NSVariableWidthString)initWithString:(id)a3 widthVariants:(id)a4;
- (__NSVariableWidthString)initWithWidthVariants:(id)a3;
- (id)_widthVariants;
- (id)formatConfiguration;
- (id)variantFittingPresentationWidth:(int64_t)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation __NSVariableWidthString

- (__NSVariableWidthString)initWithString:(id)a3 widthVariants:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)__NSVariableWidthString;
  v6 = [(NSString *)&v8 init];
  if (v6)
  {
    v6->_variants = (NSDictionary *)[a4 copy];
    v6->_defaultString = (NSString *)[a3 copy];
  }
  return v6;
}

- (__NSVariableWidthString)initWithWidthVariants:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_19;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = (void *)[a3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  objc_super v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v13 = [v12 integerValue];
      if (v8) {
        BOOL v14 = v13 < v9;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        objc_super v8 = v12;
        uint64_t v9 = v13;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  }
  while (v7);
  if (v8) {
    v16 = (__CFString *)[a3 objectForKey:v8];
  }
  else {
LABEL_19:
  }
    v16 = &stru_1ECA5C228;
  return [(__NSVariableWidthString *)self initWithString:v16 widthVariants:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)__NSVariableWidthString;
  [(__NSVariableWidthString *)&v3 dealloc];
}

- (id)variantFittingPresentationWidth:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_variants) {
    goto LABEL_15;
  }
  v5 = [(NSDictionary *)self->_variants objectForKey:+[NSString stringWithFormat:@"%ld", a3]];
  if (!v5)
  {
    if (![(NSDictionary *)self->_variants count]) {
      goto LABEL_15;
    }
    uint64_t v7 = [(NSArray *)[(NSDictionary *)self->_variants allKeys] sortedArrayUsingComparator:&__block_literal_global_3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    v5 = 0;
    uint64_t v10 = *(void *)v16;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
      if ([v12 integerValue] > a3) {
        break;
      }
      v5 = [(NSDictionary *)self->_variants objectForKey:v12];
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v9) {
          goto LABEL_8;
        }
        break;
      }
    }
    if (!v5) {
      goto LABEL_15;
    }
  }
  if (v5 != self->_defaultString) {
    uint64_t v6 = [[__NSVariableWidthString alloc] initWithString:v5 widthVariants:self->_variants];
  }
  else {
LABEL_15:
  }
    uint64_t v6 = self;
  return v6;
}

- (id)formatConfiguration
{
  if (!self->_defaultString || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  defaultString = self->_defaultString;

  return (id)[(NSString *)defaultString performSelector:sel_formatConfiguration];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_defaultString characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (unint64_t)length
{
  return [(NSString *)self->_defaultString length];
}

- (id)_widthVariants
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSDictionary *)self->_variants count])
  {
    uint64_t v4 = [(NSArray *)[(NSDictionary *)self->_variants allKeys] sortedArrayUsingComparator:&__block_literal_global_3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObject:", -[NSDictionary objectForKeyedSubscript:](self->_variants, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i)));
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [v3 addObject:self];
  }
  return v3;
}

@end