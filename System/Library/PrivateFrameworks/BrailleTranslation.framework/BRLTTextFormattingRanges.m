@interface BRLTTextFormattingRanges
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BRLTTextFormattingRanges)initWithCoder:(id)a3;
- (NSMutableArray)boldRanges;
- (NSMutableArray)italicRanges;
- (NSMutableArray)underlineRanges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addBoldRange:(_NSRange)a3;
- (void)addItalicRange:(_NSRange)a3;
- (void)addUnderlineRange:(_NSRange)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBoldRanges:(id)a3;
- (void)setItalicRanges:(id)a3;
- (void)setUnderlineRanges:(id)a3;
@end

@implementation BRLTTextFormattingRanges

- (void)addBoldRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  boldRanges = self->_boldRanges;
  if (!boldRanges)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v8 = self->_boldRanges;
    self->_boldRanges = v7;

    boldRanges = self->_boldRanges;
  }
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)boldRanges addObject:v9];
}

- (NSMutableArray)boldRanges
{
  return self->_boldRanges;
}

- (void)addItalicRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  italicRanges = self->_italicRanges;
  if (!italicRanges)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v8 = self->_italicRanges;
    self->_italicRanges = v7;

    italicRanges = self->_italicRanges;
  }
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)italicRanges addObject:v9];
}

- (NSMutableArray)italicRanges
{
  return self->_italicRanges;
}

- (void)addUnderlineRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  underlineRanges = self->_underlineRanges;
  if (!underlineRanges)
  {
    v7 = [MEMORY[0x263EFF980] array];
    v8 = self->_underlineRanges;
    self->_underlineRanges = v7;

    underlineRanges = self->_underlineRanges;
  }
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)underlineRanges addObject:v9];
}

- (NSMutableArray)underlineRanges
{
  return self->_underlineRanges;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  underlineRanges = self->_underlineRanges;
  id v5 = a3;
  v6 = (void *)[(NSMutableArray *)underlineRanges copy];
  [v5 encodeObject:v6 forKey:@"underlineRanges"];

  v7 = (void *)[(NSMutableArray *)self->_italicRanges copy];
  [v5 encodeObject:v7 forKey:@"italicRanges"];

  id v8 = (id)[(NSMutableArray *)self->_boldRanges copy];
  [v5 encodeObject:v8 forKey:@"boldRanges"];
}

- (BRLTTextFormattingRanges)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)BRLTTextFormattingRanges;
  id v3 = a3;
  v4 = [(BRLTTextFormattingRanges *)&v21 init];
  id v5 = (void *)MEMORY[0x263EFFA08];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v7 = [v5 setWithArray:v6];
  uint64_t v8 = [v3 decodeObjectOfClasses:v7 forKey:@"underlineRanges"];
  underlineRanges = v4->_underlineRanges;
  v4->_underlineRanges = (NSMutableArray *)v8;

  v10 = (void *)MEMORY[0x263EFFA08];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v12 = [v10 setWithArray:v11];
  uint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"italicRanges"];
  italicRanges = v4->_italicRanges;
  v4->_italicRanges = (NSMutableArray *)v13;

  v15 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v17 = [v15 setWithArray:v16];
  uint64_t v18 = [v3 decodeObjectOfClasses:v17 forKey:@"boldRanges"];

  boldRanges = v4->_boldRanges;
  v4->_boldRanges = (NSMutableArray *)v18;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = [(BRLTTextFormattingRanges *)self underlineRanges];
  v6 = (void *)[v5 copy];
  [v4 setUnderlineRanges:v6];

  v7 = [(BRLTTextFormattingRanges *)self italicRanges];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setItalicRanges:v8];

  id v9 = [(BRLTTextFormattingRanges *)self boldRanges];
  v10 = (void *)[v9 copy];
  [v4 setBoldRanges:v10];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)BRLTTextFormattingRanges;
  v4 = [(BRLTTextFormattingRanges *)&v10 description];
  id v5 = [(BRLTTextFormattingRanges *)self underlineRanges];
  v6 = [(BRLTTextFormattingRanges *)self italicRanges];
  v7 = [(BRLTTextFormattingRanges *)self boldRanges];
  uint64_t v8 = [v3 stringWithFormat:@"%@: underline{%@}, italic{%@}, bold{%@}", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRLTTextFormattingRanges *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(BRLTTextFormattingRanges *)self underlineRanges];
      uint64_t v7 = [(BRLTTextFormattingRanges *)v5 underlineRanges];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        id v9 = [(BRLTTextFormattingRanges *)self underlineRanges];
        objc_super v10 = [(BRLTTextFormattingRanges *)v5 underlineRanges];
        int v11 = [v9 isEqualToArray:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      uint64_t v13 = [(BRLTTextFormattingRanges *)self italicRanges];
      uint64_t v14 = [(BRLTTextFormattingRanges *)v5 italicRanges];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        v16 = [(BRLTTextFormattingRanges *)self italicRanges];
        v17 = [(BRLTTextFormattingRanges *)v5 italicRanges];
        int v18 = [v16 isEqualToArray:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v19 = [(BRLTTextFormattingRanges *)self boldRanges];
      uint64_t v20 = [(BRLTTextFormattingRanges *)v5 boldRanges];
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        objc_super v21 = v19;
      }
      else
      {
        objc_super v21 = (void *)v20;
        v22 = [(BRLTTextFormattingRanges *)self boldRanges];
        v23 = [(BRLTTextFormattingRanges *)v5 boldRanges];
        char v12 = [v22 isEqualToArray:v23];
      }
      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (void)setBoldRanges:(id)a3
{
}

- (void)setItalicRanges:(id)a3
{
}

- (void)setUnderlineRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineRanges, 0);
  objc_storeStrong((id *)&self->_italicRanges, 0);
  objc_storeStrong((id *)&self->_boldRanges, 0);
}

@end