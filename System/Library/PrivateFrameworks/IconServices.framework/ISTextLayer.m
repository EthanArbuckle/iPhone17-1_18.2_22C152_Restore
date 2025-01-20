@interface ISTextLayer
- (IFColor)color;
- (ISTextLayer)init;
- (NSString)fontName;
- (NSString)text;
- (double)fontSize;
- (void)setColor:(id)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setText:(id)a3;
@end

@implementation ISTextLayer

- (ISTextLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISTextLayer;
  v2 = [(ISLayer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:1.0];
    color = v2->_color;
    v2->_color = (IFColor *)v3;
  }
  return v2;
}

- (IFColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end