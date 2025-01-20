@interface VCCannedAVSync
+ (id)sharedCannedAVSync;
- (VCCannedAVSync)init;
- (double)base;
- (double)modulo;
- (void)addStreamWithCount:(int)a3 rate:(double)a4;
- (void)clear;
- (void)setBase:(double)a3;
- (void)setModulo:(double)a3;
@end

@implementation VCCannedAVSync

- (VCCannedAVSync)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCannedAVSync;
  result = [(VCCannedAVSync *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_base = xmmword_1E25A2030;
  }
  return result;
}

- (void)clear
{
  self->_modulo = 86400.0;
}

- (void)addStreamWithCount:(int)a3 rate:(double)a4
{
  double modulo = (double)a3 / a4;
  if (self->_modulo < modulo) {
    double modulo = self->_modulo;
  }
  self->_double modulo = modulo;
}

+ (id)sharedCannedAVSync
{
  if (sharedCannedAVSync_sDispatchOnceToken != -1) {
    dispatch_once(&sharedCannedAVSync_sDispatchOnceToken, &__block_literal_global_83);
  }
  return (id)sharedCannedAVSync_sSharedCannedAVSync;
}

VCCannedAVSync *__36__VCCannedAVSync_sharedCannedAVSync__block_invoke()
{
  result = objc_alloc_init(VCCannedAVSync);
  sharedCannedAVSync_sSharedCannedAVSync = (uint64_t)result;
  return result;
}

- (double)base
{
  return self->_base;
}

- (void)setBase:(double)a3
{
  self->_base = a3;
}

- (double)modulo
{
  return self->_modulo;
}

- (void)setModulo:(double)a3
{
  self->_double modulo = a3;
}

@end