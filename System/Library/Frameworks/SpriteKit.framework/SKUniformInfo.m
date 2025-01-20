@interface SKUniformInfo
- (SKUniform)uniform;
- (SKUniformInfo)init;
- (unint64_t)seed;
- (unint64_t)textureTarget;
- (void)setSeed:(unint64_t)a3;
- (void)setTextureTarget:(unint64_t)a3;
- (void)setUniform:(id)a3;
@end

@implementation SKUniformInfo

- (SKUniformInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKUniformInfo;
  v2 = [(SKUniformInfo *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKUniformInfo *)v2 setSeed:0];
  }
  return v3;
}

- (unint64_t)seed
{
  return self->seed;
}

- (void)setSeed:(unint64_t)a3
{
  self->seed = a3;
}

- (unint64_t)textureTarget
{
  return self->textureTarget;
}

- (void)setTextureTarget:(unint64_t)a3
{
  self->textureTarget = a3;
}

- (SKUniform)uniform
{
  return (SKUniform *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUniform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end