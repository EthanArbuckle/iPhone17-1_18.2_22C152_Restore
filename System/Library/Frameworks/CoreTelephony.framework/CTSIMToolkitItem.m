@interface CTSIMToolkitItem
+ (BOOL)supportsSecureCoding;
- (BOOL)selected;
- (CTSIMToolkitItem)initWithCoder:(id)a3;
- (CTSIMToolkitItem)initWithText:(id)a3 selected:(BOOL)a4;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation CTSIMToolkitItem

- (CTSIMToolkitItem)initWithText:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTSIMToolkitItem;
  v7 = [(CTSIMToolkitItem *)&v10 init];
  if (v7)
  {
    v8 = (void *)[v6 copy];
    [(CTSIMToolkitItem *)v7 setText:v8];

    [(CTSIMToolkitItem *)v7 setSelected:v4];
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTSIMToolkitItem *)self text];
  [v3 appendFormat:@", Text=%@", v4];

  BOOL v5 = [(CTSIMToolkitItem *)self selected];
  id v6 = @"No";
  if (v5) {
    id v6 = @"Yes";
  }
  [v3 appendFormat:@", Selected=%@", v6];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CTSIMToolkitItem *)self text];
  id v6 = (void *)[v5 copy];
  v7 = objc_msgSend(v4, "initWithText:selected:", v6, -[CTSIMToolkitItem selected](self, "selected"));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(CTSIMToolkitItem *)self text];
  [v5 encodeObject:v4 forKey:@"kTextKey"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTSIMToolkitItem selected](self, "selected"), @"kSelectedKey");
}

- (CTSIMToolkitItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSIMToolkitItem;
  id v5 = [(CTSIMToolkitItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_selected = [v4 decodeBoolForKey:@"kSelectedKey"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
}

@end