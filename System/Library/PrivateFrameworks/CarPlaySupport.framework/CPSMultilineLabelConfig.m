@interface CPSMultilineLabelConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabelConfig:(id)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIFont)font;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)lineCount;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setLineCount:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation CPSMultilineLabelConfig

- (id)copyWithZone:(_NSZone *)a3
{
  v9 = self;
  v8[2] = (id)a2;
  v8[1] = a3;
  v8[0] = (id)objc_opt_new();
  v5 = [(CPSMultilineLabelConfig *)v9 text];
  objc_msgSend(v8[0], "setText:");

  v6 = [(CPSMultilineLabelConfig *)v9 font];
  objc_msgSend(v8[0], "setFont:");

  uint64_t v3 = [(CPSMultilineLabelConfig *)v9 lineCount];
  [v8[0] setLineCount:v3];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (BOOL)isEqualToLabelConfig:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v7 = [(CPSMultilineLabelConfig *)v9 lineCount];
  if (v7 == [location[0] lineCount])
  {
    v5 = [(CPSMultilineLabelConfig *)v9 font];
    id v4 = (id)[location[0] font];
    char v6 = -[UIFont isEqual:](v5, "isEqual:");

    BOOL v10 = (v6 & 1) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] == v7)
  {
    char v8 = 1;
    int v5 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)CPSMultilineLabelConfig;
    if ([(CPSMultilineLabelConfig *)&v4 isEqual:location[0]]) {
      char v8 = [(CPSMultilineLabelConfig *)v7 isEqualToLabelConfig:location[0]];
    }
    else {
      char v8 = 0;
    }
    int v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)description
{
  v9 = NSString;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = [(CPSMultilineLabelConfig *)self lineCount];
  v12 = [(CPSMultilineLabelConfig *)self font];
  [(UIFont *)v12 pointSize];
  uint64_t v7 = v2;
  v11 = [(CPSMultilineLabelConfig *)self attributedText];
  uint64_t v3 = @"YES";
  if (!v11) {
    uint64_t v3 = @"NO";
  }
  char v8 = v3;
  BOOL v10 = [(CPSMultilineLabelConfig *)self text];
  id v13 = (id)[v9 stringWithFormat:@"<%@: %p lineCount=%ld fontSize=%f %@ - %@>", v5, self, v6, v7, v8, v10];

  return v13;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(unint64_t)a3
{
  self->_lineCount = a3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end