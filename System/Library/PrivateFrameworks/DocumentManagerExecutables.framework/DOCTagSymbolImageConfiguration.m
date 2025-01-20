@interface DOCTagSymbolImageConfiguration
- (BOOL)differentiateWithShapes;
- (DOCTag)tag;
- (DOCTagSymbolImageConfiguration)initWithTag:(id)a3 color:(id)a4 variant:(unint64_t)a5 differentiateWithShapes:(BOOL)a6;
- (UIColor)color;
- (id)loadedImageForSettings;
- (unint64_t)variant;
@end

@implementation DOCTagSymbolImageConfiguration

- (DOCTagSymbolImageConfiguration)initWithTag:(id)a3 color:(id)a4 variant:(unint64_t)a5 differentiateWithShapes:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DOCTagSymbolImageConfiguration;
  v13 = [(DOCTagSymbolImageConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tag, a3);
    objc_storeStrong((id *)&v14->_color, a4);
    v14->_variant = a5;
    v14->_differentiateWithShapes = a6;
  }

  return v14;
}

- (id)loadedImageForSettings
{
  v3 = (void *)MEMORY[0x263F827E8];
  unint64_t v4 = [(DOCTagSymbolImageConfiguration *)self variant];
  BOOL v5 = [(DOCTagSymbolImageConfiguration *)self differentiateWithShapes];
  v6 = [(DOCTagSymbolImageConfiguration *)self tag];
  uint64_t v7 = [v6 labelIndex];
  v8 = [(DOCTagSymbolImageConfiguration *)self color];
  v9 = objc_msgSend(v3, "_doc_tagImageForRenderingVariant:differentiateWithShapes:tagColorType:renderedColor:", v4, v5, v7, v8);

  return v9;
}

- (DOCTag)tag
{
  return self->_tag;
}

- (UIColor)color
{
  return self->_color;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (BOOL)differentiateWithShapes
{
  return self->_differentiateWithShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_tag, 0);
}

@end