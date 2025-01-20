@interface ResamplerTextures
- (MTLTexture)inputTexture;
- (MTLTexture)inputTexureUV;
- (MTLTexture)outputTextureUV;
- (MTLTexture)outputTextureY;
- (MTLTexture)tempTextureUV;
- (MTLTexture)tempTextureY;
- (void)setInputTexture:(id)a3;
- (void)setInputTexureUV:(id)a3;
- (void)setOutputTextureUV:(id)a3;
- (void)setOutputTextureY:(id)a3;
- (void)setTempTextureUV:(id)a3;
- (void)setTempTextureY:(id)a3;
@end

@implementation ResamplerTextures

- (MTLTexture)inputTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputTexture:(id)a3
{
}

- (MTLTexture)inputTexureUV
{
  return (MTLTexture *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputTexureUV:(id)a3
{
}

- (MTLTexture)tempTextureY
{
  return (MTLTexture *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTempTextureY:(id)a3
{
}

- (MTLTexture)tempTextureUV
{
  return (MTLTexture *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTempTextureUV:(id)a3
{
}

- (MTLTexture)outputTextureY
{
  return (MTLTexture *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputTextureY:(id)a3
{
}

- (MTLTexture)outputTextureUV
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputTextureUV:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextureUV, 0);
  objc_storeStrong((id *)&self->_outputTextureY, 0);
  objc_storeStrong((id *)&self->_tempTextureUV, 0);
  objc_storeStrong((id *)&self->_tempTextureY, 0);
  objc_storeStrong((id *)&self->_inputTexureUV, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);
}

@end