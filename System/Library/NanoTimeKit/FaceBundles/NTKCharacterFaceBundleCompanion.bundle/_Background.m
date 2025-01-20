@interface _Background
- (MTLTexture)glowTex;
- (MTLTexture)numbersTex;
- (NSNumber)glow;
- (NSNumber)numbers;
- (void)setGlow:(id)a3;
- (void)setGlowTex:(id)a3;
- (void)setNumbers:(id)a3;
- (void)setNumbersTex:(id)a3;
@end

@implementation _Background

- (NSNumber)numbers
{
  return self->_numbers;
}

- (void)setNumbers:(id)a3
{
}

- (NSNumber)glow
{
  return self->_glow;
}

- (void)setGlow:(id)a3
{
}

- (MTLTexture)numbersTex
{
  return self->_numbersTex;
}

- (void)setNumbersTex:(id)a3
{
}

- (MTLTexture)glowTex
{
  return self->_glowTex;
}

- (void)setGlowTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glowTex, 0);
  objc_storeStrong((id *)&self->_numbersTex, 0);
  objc_storeStrong((id *)&self->_glow, 0);

  objc_storeStrong((id *)&self->_numbers, 0);
}

@end