@interface GLKEffectPropertyConstantColor
- (GLKEffectPropertyConstantColor)init;
- (_GLKVector4)color;
- (id)description;
- (unsigned)enabled;
- (void)bind;
- (void)dealloc;
- (void)setColor:(_GLKVector4)a3;
- (void)setEnabled:(unsigned __int8)a3;
- (void)setShaderBindings;
@end

@implementation GLKEffectPropertyConstantColor

- (GLKEffectPropertyConstantColor)init
{
  v10.receiver = self;
  v10.super_class = (Class)GLKEffectPropertyConstantColor;
  v2 = [(GLKEffectProperty *)&v10 init];
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.4S, #1.0 }
    v2->_color = _Q0;
    [(GLKEffectProperty *)v2 setNameString:"a_color"];
    v3->_enabled = 1;
  }
  return v3;
}

- (void)setShaderBindings
{
  if (self->_enabled)
  {
    GLint params = 0;
    glGetIntegerv(0x8B8Du, &params);
    [(GLKEffectProperty *)self setLocation:glGetAttribLocation(params, [(GLKEffectProperty *)self nameString])];
  }
}

- (void)bind
{
  if (self->_enabled)
  {
    GLuint v3 = [(GLKEffectProperty *)self location];
    glVertexAttrib4fv(v3, &self->_color.x);
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ = %p\n{\n", objc_msgSend((id)objc_opt_class(), "description"), self];
  objc_msgSend(v3, "appendFormat:", @"\t{%7.3f,%7.3f,%7.3f,%7.3f}\n", self->_color.x, self->_color.y, self->_color.z, self->_color.w);
  [v3 appendFormat:@"}"];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyConstantColor;
  [(GLKEffectProperty *)&v2 dealloc];
}

- (_GLKVector4)color
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (void)setColor:(_GLKVector4)a3
{
  self->_color.x = v3;
  self->_color.y = v4;
  self->_color.z = v5;
  self->_color.w = v6;
}

- (unsigned)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(unsigned __int8)a3
{
  self->_enabled = a3;
}

@end