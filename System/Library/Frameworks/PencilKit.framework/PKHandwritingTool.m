@interface PKHandwritingTool
- (BOOL)_isHandwritingTool;
- (BOOL)isEqual:(id)a3;
- (Class)_toolPickerItemClass;
- (NSString)localeIdentifier;
- (PKHandwritingTool)init;
- (PKHandwritingTool)initWithLocaleIdentifier:(id)a3;
- (id)_defaultItemIdentifier;
- (unint64_t)hash;
@end

@implementation PKHandwritingTool

- (PKHandwritingTool)init
{
  return [(PKHandwritingTool *)self initWithLocaleIdentifier:@"en"];
}

- (PKHandwritingTool)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1618] clearColor];
  v6 = +[PKInk inkWithType:@"com.apple.ink.handwriting" color:v5 weight:0.0];
  v11.receiver = self;
  v11.super_class = (Class)PKHandwritingTool;
  v7 = [(PKTool *)&v11 _initWithInk:v6];

  if (v7)
  {
    uint64_t v8 = [v4 copy];
    localeIdentifier = v7->_localeIdentifier;
    v7->_localeIdentifier = (NSString *)v8;
  }
  return v7;
}

- (BOOL)_isHandwritingTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return @"com.apple.tool.scribble";
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKHandwritingTool *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKHandwritingTool;
    if ([(PKTool *)&v12 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(PKTool *)self ink];
      v7 = [(PKTool *)v5 ink];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(PKHandwritingTool *)self localeIdentifier];
        v9 = [(PKHandwritingTool *)v5 localeIdentifier];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(PKTool *)self ink];
  uint64_t v4 = [v3 hash];
  v5 = [(PKHandwritingTool *)self localeIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
}

@end