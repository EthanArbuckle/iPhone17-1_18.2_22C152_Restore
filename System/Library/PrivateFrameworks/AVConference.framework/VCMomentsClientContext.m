@interface VCMomentsClientContext
- (VCMomentsClientContext)initWithStreamToken:(int64_t)a3;
- (int64_t)streamToken;
@end

@implementation VCMomentsClientContext

- (VCMomentsClientContext)initWithStreamToken:(int64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMomentsClientContext;
  result = [(VCMomentsClientContext *)&v5 init];
  if (result) {
    result->_streamToken = a3;
  }
  return result;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end