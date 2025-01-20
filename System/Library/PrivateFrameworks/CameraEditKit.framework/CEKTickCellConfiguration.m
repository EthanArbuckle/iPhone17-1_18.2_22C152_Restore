@interface CEKTickCellConfiguration
- (CEKTickCellConfiguration)initWithImage:(id)a3;
- (CEKTickCellConfiguration)initWithText:(id)a3 font:(id)a4;
- (CGSize)contentSize;
- (NSString)text;
- (UIFont)font;
- (UIImage)image;
@end

@implementation CEKTickCellConfiguration

- (CEKTickCellConfiguration)initWithImage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CEKTickCellConfiguration;
  v6 = [(CEKTickCellConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    [v5 size];
    v7->_contentSize.width = v8;
    v7->_contentSize.height = v9;
  }

  return v7;
}

- (CEKTickCellConfiguration)initWithText:(id)a3 font:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CEKTickCellConfiguration;
  CGFloat v8 = [(CEKTickCellConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;

    objc_storeStrong((id *)&v8->_font, a4);
    uint64_t v16 = *MEMORY[0x1E4FB12B0];
    v17[0] = v7;
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, 3.40282347e38, 3.40282347e38);
    v8->_contentSize.width = v12;
    v8->_contentSize.height = v13;
  }
  return v8;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end