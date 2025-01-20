@interface BMDSLSubscriber
- (NSString)identifier;
- (id)bpsSubscriber;
@end

@implementation BMDSLSubscriber

- (id)bpsSubscriber
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end