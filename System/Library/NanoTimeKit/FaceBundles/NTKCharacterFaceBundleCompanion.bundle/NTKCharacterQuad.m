@interface NTKCharacterQuad
- (BOOL)prepareForTime:(double)a3;
- (NTKCharacterQuad)initWithCLKDevice:(id)a3;
- (NTKCharacterRenderer)renderer;
- (id)clkDevice;
- (void)dealloc;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation NTKCharacterQuad

- (NTKCharacterQuad)initWithCLKDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKCharacterQuad;
  v6 = [(NTKCharacterQuad *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clkDevice, a3);
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKCharacterQuad;
  [(NTKCharacterQuad *)&v2 dealloc];
}

- (id)clkDevice
{
  return self->_clkDevice;
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(NTKCharacterRenderer *)self->_renderer renderWithEncoder:v4];

  kdebug_trace();
}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (NTKCharacterRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_clkDevice, 0);
}

@end