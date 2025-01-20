@interface ISContentLayer
- (BOOL)acceptSymbol;
- (IFColor)backgroundColor;
- (ISCompositorResource)content;
- (ISContentLayer)init;
- (void)setAcceptSymbol:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContent:(id)a3;
@end

@implementation ISContentLayer

- (ISContentLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISContentLayer;
  v2 = [(ISLayer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.0];
    backgroundColor = v2->_backgroundColor;
    v2->_backgroundColor = (IFColor *)v3;

    v2->_acceptSymbol = 1;
  }
  return v2;
}

- (IFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (ISCompositorResource)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BOOL)acceptSymbol
{
  return self->_acceptSymbol;
}

- (void)setAcceptSymbol:(BOOL)a3
{
  self->_acceptSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end