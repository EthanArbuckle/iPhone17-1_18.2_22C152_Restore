@interface HMVEventWriter
- (HMVEventWriter)init;
@end

@implementation HMVEventWriter

- (HMVEventWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMVEventWriter;
  return [(HMVEventWriter *)&v3 init];
}

@end