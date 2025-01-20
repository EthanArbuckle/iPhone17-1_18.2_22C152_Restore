@interface MPUAbbreviatingLabel
- (NSArray)textRepresentations;
- (void)_calculateTextSizes;
- (void)_selectBestRepresentation;
- (void)_setTextRepresentation:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTextRepresentations:(id)a3;
@end

@implementation MPUAbbreviatingLabel

- (void)setTextRepresentations:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_textRepresentations, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    textRepresentations = self->_textRepresentations;
    self->_textRepresentations = v4;

    [(MPUAbbreviatingLabel *)self _calculateTextSizes];
  }
}

- (void)setFont:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUAbbreviatingLabel;
  [(MPUAbbreviatingLabel *)&v4 setFont:a3];
  [(MPUAbbreviatingLabel *)self _calculateTextSizes];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPUAbbreviatingLabel *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)MPUAbbreviatingLabel;
  -[MPUAbbreviatingLabel setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(MPUAbbreviatingLabel *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22)) {
    [(MPUAbbreviatingLabel *)self _selectBestRepresentation];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPUAbbreviatingLabel *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)MPUAbbreviatingLabel;
  -[MPUAbbreviatingLabel setBounds:](&v20, sel_setBounds_, x, y, width, height);
  [(MPUAbbreviatingLabel *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22)) {
    [(MPUAbbreviatingLabel *)self _selectBestRepresentation];
  }
}

- (void)_calculateTextSizes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  textRepresentationSizes = self->_textRepresentationSizes;
  self->_textRepresentationSizes = v3;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_textRepresentations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[MPUAbbreviatingLabel _setTextRepresentation:](self, "_setTextRepresentation:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        double v10 = self->_textRepresentationSizes;
        CGFloat v11 = (void *)MEMORY[0x263F08D40];
        [(MPUAbbreviatingLabel *)self intrinsicContentSize];
        double v12 = objc_msgSend(v11, "valueWithCGSize:");
        [(NSMutableArray *)v10 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(MPUAbbreviatingLabel *)self _selectBestRepresentation];
}

- (void)_selectBestRepresentation
{
  [(MPUAbbreviatingLabel *)self bounds];
  double v4 = v3;
  [(MPUAbbreviatingLabel *)self bounds];
  BOOL v5 = CGRectEqualToRect(v15, *MEMORY[0x263F001A8]);
  textRepresentations = self->_textRepresentations;
  if (v5)
  {
    uint64_t v7 = [(NSArray *)textRepresentations firstObject];
  }
  else if ([(NSArray *)textRepresentations count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [(NSMutableArray *)self->_textRepresentationSizes objectAtIndexedSubscript:v8];
      [v9 CGSizeValue];
      double v11 = v10;

      double v12 = self->_textRepresentations;
      if (v11 <= v4) {
        break;
      }
      if (++v8 >= [(NSArray *)v12 count]) {
        goto LABEL_7;
      }
    }
    uint64_t v7 = [(NSArray *)v12 objectAtIndexedSubscript:v8];
  }
  else
  {
LABEL_7:
    uint64_t v7 = [(NSArray *)self->_textRepresentations lastObject];
  }
  id v13 = (id)v7;
  -[MPUAbbreviatingLabel _setTextRepresentation:](self, "_setTextRepresentation:");
}

- (void)_setTextRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(MPUAbbreviatingLabel *)self attributedText];
    char v6 = [v5 isEqualToAttributedString:v4];

    if ((v6 & 1) == 0)
    {
      double v12 = self;
      uint64_t v7 = &selRef_setAttributedText_;
      uint64_t v8 = &v12;
LABEL_6:
      v8[1] = (MPUAbbreviatingLabel *)MPUAbbreviatingLabel;
      objc_msgSendSuper2((objc_super *)v8, *v7, v4, v11);
    }
  }
  else
  {
    uint64_t v9 = [(MPUAbbreviatingLabel *)self text];
    char v10 = [v9 isEqualToString:v4];

    if ((v10 & 1) == 0)
    {
      double v11 = self;
      uint64_t v7 = &selRef_setText_;
      uint64_t v8 = &v11;
      goto LABEL_6;
    }
  }
}

- (NSArray)textRepresentations
{
  return self->_textRepresentations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRepresentations, 0);

  objc_storeStrong((id *)&self->_textRepresentationSizes, 0);
}

@end