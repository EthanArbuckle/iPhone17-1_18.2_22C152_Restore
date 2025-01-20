@interface LACKeyBagStateProviderMKBAdapter
- (LACKeyBagStateProviderMKBAdapter)initWithUserId:(unsigned int)a3;
- (int64_t)state;
@end

@implementation LACKeyBagStateProviderMKBAdapter

- (LACKeyBagStateProviderMKBAdapter)initWithUserId:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LACKeyBagStateProviderMKBAdapter;
  result = [(LACKeyBagStateProviderMKBAdapter *)&v5 init];
  if (result) {
    result->_userId = a3;
  }
  return result;
}

- (int64_t)state
{
  v6[1] = *MEMORY[0x263EF8340];
  objc_super v5 = @"DeviceHandle";
  v2 = [NSNumber numberWithUnsignedInt:self->_userId];
  v6[0] = v2;
  [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  int v3 = MKBGetDeviceLockState();

  if ((v3 + 8) > 0xB) {
    return 0;
  }
  else {
    return qword_254FD06B8[v3 + 8];
  }
}

@end