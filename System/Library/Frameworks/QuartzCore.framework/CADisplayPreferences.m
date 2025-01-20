@interface CADisplayPreferences
- (BOOL)matchContent;
- (CADisplayPreferences)init;
- (CADisplayPreferences)initWithMatchContent:(BOOL)a3 preferredHdrType:(int)a4;
- (CADisplayPreferences)initWithPreferences:(id)a3;
- (NSString)preferredHdrMode;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)_preferredHdrType;
- (void)dealloc;
- (void)setMatchContent:(BOOL)a3;
- (void)setPreferredHdrMode:(id)a3;
@end

@implementation CADisplayPreferences

- (BOOL)matchContent
{
  return self->_priv->var0;
}

- (CADisplayPreferences)initWithMatchContent:(BOOL)a3 preferredHdrType:(int)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7 = (CADisplayPreferencesPriv *)malloc_type_malloc(8uLL, 0x10000404A09149AuLL);
  self->_priv = v7;
  v7->var0 = a3;
  v7->var1 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CADisplayPreferences;
  return [(CADisplayPreferences *)&v9 init];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayPreferences;
  [(CADisplayPreferences *)&v3 dealloc];
}

- (void)setPreferredHdrMode:(id)a3
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
  self->_priv->var1 = v5;
}

- (int)_preferredHdrType
{
  return self->_priv->var1;
}

- (NSString)preferredHdrMode
{
  unsigned int v2 = self->_priv->var1 - 1;
  if (v2 > 4) {
    return 0;
  }
  else {
    return (NSString *)*(&off_1E5272900 + v2);
  }
}

- (void)setMatchContent:(BOOL)a3
{
  self->_priv->var0 = a3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CAMutableDisplayPreferences allocWithZone:a3];

  return [(CADisplayPreferences *)v4 initWithPreferences:self];
}

- (CADisplayPreferences)initWithPreferences:(id)a3
{
  if (a3)
  {
    uint64_t v3 = *((void *)a3 + 1);
    a3 = (id)(*(unsigned char *)v3 != 0);
    uint64_t v4 = *(unsigned int *)(v3 + 4);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [(CADisplayPreferences *)self initWithMatchContent:a3 preferredHdrType:v4];
}

- (CADisplayPreferences)init
{
  return [(CADisplayPreferences *)self initWithPreferences:0];
}

@end