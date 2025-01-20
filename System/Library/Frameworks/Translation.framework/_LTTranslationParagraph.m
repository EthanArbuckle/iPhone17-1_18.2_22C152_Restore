@interface _LTTranslationParagraph
+ (BOOL)supportsSecureCoding;
- (BOOL)isFinal;
- (NSArray)spans;
- (NSString)identifier;
- (NSString)text;
- (_LTTranslationParagraph)initWithCoder:(id)a3;
- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5;
- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5 isFinal:(BOOL)a6;
- (id)splitIntoSentences;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTTranslationParagraph

- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_LTTranslationParagraph;
  v11 = [(_LTTranslationParagraph *)&v14 init];
  if (v11) {
    v12 = [(_LTTranslationParagraph *)v11 initWithIdentifier:v8 text:v9 spans:v10 isFinal:1];
  }
  else {
    v12 = 0;
  }

  return v12;
}

- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5 isFinal:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationParagraph;
  v13 = [(_LTTranslationParagraph *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    text = v13->_text;
    v13->_text = (NSString *)v16;

    v13->_isFinal = a6;
    uint64_t v18 = [v12 copy];
    spans = v13->_spans;
    v13->_spans = (NSArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_spans forKey:@"spans"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
}

- (_LTTranslationParagraph)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTTranslationParagraph;
  id v5 = [(_LTTranslationParagraph *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    id v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"spans"];
    spans = v5->_spans;
    v5->_spans = (NSArray *)v12;

    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    uint64_t v14 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)splitIntoSentences
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:self->_text];
  spans = self->_spans;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke;
  v35[3] = &unk_2651DC578;
  id v6 = v4;
  id v36 = v6;
  [(NSArray *)spans enumerateObjectsUsingBlock:v35];
  v25 = v6;
  [v6 sentences];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    id v10 = v3;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v14 = [v12 length];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_2;
        v29[3] = &unk_2651DC5C8;
        id v15 = v13;
        id v30 = v15;
        objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, v29);
        if ([v15 count])
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_4;
          v27[3] = &unk_2651DC5F0;
          id v17 = v16;
          id v28 = v17;
          [v15 enumerateKeysAndObjectsUsingBlock:v27];
        }
        else
        {
          id v17 = 0;
        }
        uint64_t v18 = [_LTTranslationParagraph alloc];
        identifier = self->_identifier;
        v20 = [v12 string];
        v21 = [(_LTTranslationParagraph *)v18 initWithIdentifier:identifier text:v20 spans:v17 isFinal:self->_isFinal];
        v3 = v10;
        [v10 addObject:v21];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v8);
  }
  if ([v3 count] == 1)
  {
    v37 = self;
    id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  }
  else
  {
    id v22 = v3;
  }
  v23 = v22;

  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end