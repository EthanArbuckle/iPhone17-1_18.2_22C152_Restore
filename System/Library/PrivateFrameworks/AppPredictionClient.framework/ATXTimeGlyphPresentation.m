@interface ATXTimeGlyphPresentation
+ (BOOL)supportsSecureCoding;
- (ATXTimeGlyphPresentation)initWithCoder:(id)a3;
- (ATXTimeGlyphPresentation)initWithSymbolName:(id)a3 colorName:(id)a4 title:(id)a5 options:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTimeGlyphPresentation:(id)a3;
- (NSString)colorName;
- (NSString)symbolName;
- (NSString)title;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeGlyphPresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  symbolName = self->_symbolName;
  id v5 = a3;
  [v5 encodeObject:symbolName forKey:@"symbolName"];
  [v5 encodeObject:self->_colorName forKey:@"colorName"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_options forKey:@"options"];
}

- (ATXTimeGlyphPresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"options"];

  v9 = [(ATXTimeGlyphPresentation *)self initWithSymbolName:v5 colorName:v6 title:v7 options:v8];
  return v9;
}

- (ATXTimeGlyphPresentation)initWithSymbolName:(id)a3 colorName:(id)a4 title:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXTimeGlyphPresentation;
  v13 = [(ATXTimeGlyphPresentation *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    colorName = v13->_colorName;
    v13->_colorName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    title = v13->_title;
    v13->_title = (NSString *)v18;

    v13->_options = a6;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_symbolName hash];
  return [(NSString *)self->_colorName hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXTimeGlyphPresentation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTimeGlyphPresentation *)self isEqualToATXTimeGlyphPresentation:v5];

  return v6;
}

- (BOOL)isEqualToATXTimeGlyphPresentation:(id)a3
{
  id v4 = (id *)a3;
  symbolName = self->_symbolName;
  BOOL v6 = (NSString *)v4[1];
  if (symbolName == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = symbolName;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = self->_colorName;
  id v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_colorName, 0);

  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end