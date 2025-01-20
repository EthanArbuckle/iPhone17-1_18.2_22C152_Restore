@interface BKDeviceDescriptor
+ (id)deviceDescriptorForType:(int64_t)a3;
+ (void)initialize;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation BKDeviceDescriptor

+ (void)initialize
{
  if (initializeOSLog_onceToken != -1) {
    dispatch_once(&initializeOSLog_onceToken, &__block_literal_global_1);
  }
}

+ (id)deviceDescriptorForType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setType:a3];
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end