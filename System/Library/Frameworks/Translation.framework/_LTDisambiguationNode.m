@interface _LTDisambiguationNode
+ (BOOL)supportsSecureCoding;
- (NSArray)links;
- (NSString)romanization;
- (NSString)text;
- (_LTDisambiguationNode)initWithCoder:(id)a3;
- (_LTDisambiguationNode)initWithText:(id)a3 links:(id)a4 romanization:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_insertPrefix:(id)a3;
- (void)_removeAllLinks;
- (void)_removeRomanization;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTDisambiguationNode

- (_LTDisambiguationNode)initWithText:(id)a3 links:(id)a4 romanization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDisambiguationNode;
  v11 = [(_LTDisambiguationNode *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    text = v11->_text;
    v11->_text = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    links = v11->_links;
    v11->_links = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    romanization = v11->_romanization;
    v11->_romanization = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (void)_removeAllLinks
{
  self->_links = (NSArray *)MEMORY[0x263EFFA68];
  MEMORY[0x270F9A758]();
}

- (void)_removeRomanization
{
  self->_romanization = 0;
  MEMORY[0x270F9A758]();
}

- (void)_insertPrefix:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSString *)self->_text length])
  {
    v5 = [NSString stringWithFormat:@"%@%@", v4, self->_text];
    text = self->_text;
    self->_text = v5;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = self->_links;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) _insertPrefix:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    if ([(NSString *)self->_romanization length])
    {
      uint64_t v12 = [NSString stringWithFormat:@"%@%@", v4, self->_romanization, (void)v14];
      romanization = self->_romanization;
      self->_romanization = v12;
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_links forKey:@"links"];
  [v5 encodeObject:self->_romanization forKey:@"romanization"];
}

- (_LTDisambiguationNode)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTDisambiguationNode;
  id v5 = [(_LTDisambiguationNode *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"links"];
    links = v5->_links;
    v5->_links = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"romanization"];
    romanization = v5->_romanization;
    v5->_romanization = (NSString *)v13;

    long long v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "allocWithZone:"), "initWithArray:copyItems:", self->_links, 1);
  uint64_t v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v7 = (void *)[(NSString *)self->_text copy];
  uint64_t v8 = (void *)[(NSString *)self->_romanization copy];
  uint64_t v9 = (void *)[v6 initWithText:v7 links:v5 romanization:v8];

  return v9;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)romanization
{
  return self->_romanization;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_romanization, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end