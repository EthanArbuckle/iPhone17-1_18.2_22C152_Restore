@interface _MKMultiPartLabelMetrics
- (BOOL)_shiftLocationOfStrings:(id)a3 startingAtIndex:(unint64_t)a4 shiftValue:(int64_t)a5;
- (BOOL)replaceSeparatorAtIndex:(unint64_t)a3 withString:(id)a4;
- (NSArray)components;
- (NSArray)separators;
- (NSAttributedString)originalAttributedString;
- (NSMutableAttributedString)attributedString;
- (_MKMultiPartLabelMetrics)initWithMultiPartString:(id)a3;
- (unint64_t)currentSeparatorIndex;
- (void)reset;
- (void)setCurrentSeparatorIndex:(unint64_t)a3;
@end

@implementation _MKMultiPartLabelMetrics

- (_MKMultiPartLabelMetrics)initWithMultiPartString:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_MKMultiPartLabelMetrics;
  v5 = [(_MKMultiPartLabelMetrics *)&v42 init];
  v6 = v5;
  if (v5)
  {
    v34 = v5;
    v7 = (void *)MEMORY[0x1E4F1CA48];
    v8 = [v4 components];
    v37 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    v9 = (void *)MEMORY[0x1E4F1CA48];
    v10 = [v4 separators];
    v35 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

    v11 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = [v4 components];
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (!v12) {
      goto LABEL_14;
    }
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v18 = -[_MKMultiPartStringComponent initWithAttributedString:range:]([_MKMultiPartStringComponent alloc], "initWithAttributedString:range:", v17, -[NSMutableAttributedString length](v11, "length"), [v17 length]);
        [v37 addObject:v18];

        [(NSMutableAttributedString *)v11 appendAttributedString:v17];
        v19 = [v4 components];
        unint64_t v20 = [v19 count];

        if (v14 + i + 1 < v20)
        {
          v21 = [v4 separators];
          if (v14 + i < (unint64_t)[v21 count])
          {
            v22 = [v4 separators];
            v23 = [v22 objectAtIndexedSubscript:v14 + i];

            if (!v23) {
              continue;
            }
            v24 = -[_MKMultiPartStringComponent initWithAttributedString:range:]([_MKMultiPartStringComponent alloc], "initWithAttributedString:range:", v23, -[NSMutableAttributedString length](v11, "length"), [v23 length]);
            [v35 addObject:v24];

            [(NSMutableAttributedString *)v11 appendAttributedString:v23];
            v21 = v23;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      v14 += i;
      if (!v13)
      {
LABEL_14:

        uint64_t v25 = [(NSMutableAttributedString *)v11 copy];
        v6 = v34;
        originalAttributedString = v34->_originalAttributedString;
        v34->_originalAttributedString = (NSAttributedString *)v25;

        attributedString = v34->_attributedString;
        v34->_attributedString = v11;
        v28 = v11;

        uint64_t v29 = [v35 copy];
        separators = v34->_separators;
        v34->_separators = (NSArray *)v29;

        uint64_t v31 = [v37 copy];
        components = v34->_components;
        v34->_components = (NSArray *)v31;

        break;
      }
    }
  }

  return v6;
}

- (BOOL)replaceSeparatorAtIndex:(unint64_t)a3 withString:(id)a4
{
  v6 = (__CFString *)a4;
  v7 = [(_MKMultiPartLabelMetrics *)self separators];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    BOOL v31 = 0;
    v10 = v6;
  }
  else
  {
    v9 = &stru_1ED919588;
    if (v6) {
      v9 = v6;
    }
    v10 = v9;

    v11 = [(_MKMultiPartLabelMetrics *)self separators];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a3];

    uint64_t v13 = [(_MKMultiPartLabelMetrics *)self attributedString];
    uint64_t v14 = [v13 string];
    uint64_t v15 = [v12 range];
    v17 = objc_msgSend(v14, "substringWithRange:", v15, v16);
    v18 = [v12 attributedString];
    v19 = [v18 string];
    int v20 = [v17 isEqualToString:v19];

    if (!v20) {
      goto LABEL_8;
    }
    v21 = [(_MKMultiPartLabelMetrics *)self attributedString];
    uint64_t v22 = [v12 range];
    objc_msgSend(v21, "replaceCharactersInRange:withString:", v22, v23, v10);

    objc_msgSend(v12, "setRange:", objc_msgSend(v12, "range"), -[__CFString length](v10, "length"));
    uint64_t v24 = [(__CFString *)v10 length];
    uint64_t v25 = [v12 attributedString];
    uint64_t v26 = v24 - [v25 length];

    v27 = [(_MKMultiPartLabelMetrics *)self separators];
    unint64_t v28 = a3 + 1;
    BOOL v29 = [(_MKMultiPartLabelMetrics *)self _shiftLocationOfStrings:v27 startingAtIndex:v28 shiftValue:v26];

    if (v29)
    {
      v30 = [(_MKMultiPartLabelMetrics *)self components];
      BOOL v31 = [(_MKMultiPartLabelMetrics *)self _shiftLocationOfStrings:v30 startingAtIndex:v28 shiftValue:v26];
    }
    else
    {
LABEL_8:
      BOOL v31 = 0;
    }
  }
  return v31;
}

- (BOOL)_shiftLocationOfStrings:(id)a3 startingAtIndex:(unint64_t)a4 shiftValue:(int64_t)a5
{
  id v7 = a3;
  if ([v7 count] <= a4)
  {
LABEL_4:
    BOOL v11 = 1;
  }
  else
  {
    while (1)
    {
      unint64_t v8 = [v7 objectAtIndexedSubscript:a4];
      uint64_t v10 = [v8 range] + a5;
      if (v10 < 0) {
        break;
      }
      objc_msgSend(v8, "setRange:", v10, v9);

      if (++a4 >= [v7 count]) {
        goto LABEL_4;
      }
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (void)reset
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(_MKMultiPartLabelMetrics *)self setCurrentSeparatorIndex:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(_MKMultiPartLabelMetrics *)self separators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = [v8 originalRange];
        objc_msgSend(v8, "setRange:", v9, v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v11 = [(_MKMultiPartLabelMetrics *)self components];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v17 = [v16 originalRange];
        objc_msgSend(v16, "setRange:", v17, v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  v19 = [(_MKMultiPartLabelMetrics *)self originalAttributedString];
  int v20 = (NSMutableAttributedString *)[v19 mutableCopy];
  attributedString = self->_attributedString;
  self->_attributedString = v20;
}

- (NSAttributedString)originalAttributedString
{
  return self->_originalAttributedString;
}

- (NSArray)separators
{
  return self->_separators;
}

- (NSArray)components
{
  return self->_components;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (unint64_t)currentSeparatorIndex
{
  return self->_currentSeparatorIndex;
}

- (void)setCurrentSeparatorIndex:(unint64_t)a3
{
  self->_currentSeparatorIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_separators, 0);

  objc_storeStrong((id *)&self->_originalAttributedString, 0);
}

@end