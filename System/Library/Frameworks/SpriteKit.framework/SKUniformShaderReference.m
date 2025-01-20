@interface SKUniformShaderReference
- (SKShader)targetShader;
- (void)setTargetShader:(id)a3;
@end

@implementation SKUniformShaderReference

- (SKShader)targetShader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetShader);

  return (SKShader *)WeakRetained;
}

- (void)setTargetShader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end