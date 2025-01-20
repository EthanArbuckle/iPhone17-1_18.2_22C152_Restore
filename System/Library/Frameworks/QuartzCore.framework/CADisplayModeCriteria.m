@interface CADisplayModeCriteria
- (CADisplayModeCriteria)init;
- (CGSize)resolution;
- (NSString)hdrMode;
- (double)refreshRate;
- (void)dealloc;
- (void)setHdrMode:(id)a3;
- (void)setRefreshRate:(double)a3;
- (void)setResolution:(CGSize)a3;
@end

@implementation CADisplayModeCriteria

- (void)setHdrMode:(id)a3
{
  if ([a3 isEqualToString:@"Dolby"])
  {
    int v5 = 5;
  }
  else if ([a3 isEqualToString:@"HDR10"])
  {
    int v5 = 3;
  }
  else
  {
    int v5 = [a3 isEqualToString:@"SDR"];
  }
  self->_priv->var2 = v5;
}

- (NSString)hdrMode
{
  unsigned int v2 = self->_priv->var2 - 1;
  if (v2 > 4) {
    return 0;
  }
  else {
    return (NSString *)*(&off_1E5272900 + v2);
  }
}

- (void)setRefreshRate:(double)a3
{
  self->_priv->var1 = a3;
}

- (double)refreshRate
{
  return self->_priv->var1;
}

- (void)setResolution:(CGSize)a3
{
  self->_priv->var0 = a3;
}

- (CGSize)resolution
{
  priv = self->_priv;
  double width = priv->var0.width;
  double height = priv->var0.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayModeCriteria;
  [(CADisplayModeCriteria *)&v3 dealloc];
}

- (CADisplayModeCriteria)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (CADisplayModeCriteriaPriv *)malloc_type_malloc(0x20uLL, 0x1000040F6D918ACuLL);
  uint64_t v4 = (CGSize *)MEMORY[0x1E4F1DB30];
  self->_priv = v3;
  v3->var0 = *v4;
  priv = self->_priv;
  priv->var1 = 0.0;
  priv->var2 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CADisplayModeCriteria;
  return [(CADisplayModeCriteria *)&v7 init];
}

@end