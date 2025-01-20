@interface _GCGamepadEventKeyboardEventAdapterConfig
+ (BOOL)supportsSecureCoding;
- (_GCGamepadEventKeyboardEventAdapterConfig)init;
- (_GCGamepadEventKeyboardEventAdapterConfig)initWithCoder:(id)a3;
- (int64_t)gamepadElementForUsagePage:(int64_t)a3 usage:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)mapUsagePage:(int64_t)a3 usage:(int64_t)a4 toGamepadElement:(int64_t)a5;
@end

@implementation _GCGamepadEventKeyboardEventAdapterConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventKeyboardEventAdapterConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCGamepadEventKeyboardEventAdapterConfig;
  return [(_GCGamepadEventKeyboardEventAdapterConfig *)&v3 init];
}

- (_GCGamepadEventKeyboardEventAdapterConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCGamepadEventKeyboardEventAdapterConfig;
  v5 = [(_GCGamepadEventKeyboardEventAdapterConfig *)&v10 init];
  if (v5)
  {
    unint64_t v9 = 0;
    v6 = (const void *)[v4 decodeBytesForKey:@"mappings" returnedLength:&v9];
    if (v9 >= 0x2F0) {
      size_t v7 = 752;
    }
    else {
      size_t v7 = v9;
    }
    memcpy(v5->_mappings, v6, v7);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)mapUsagePage:(int64_t)a3 usage:(int64_t)a4 toGamepadElement:(int64_t)a5
{
  if ((unint64_t)a5 <= 0x2E)
  {
    v5 = (char *)self + 16 * a5;
    *((void *)v5 + 1) = a3;
    *((void *)v5 + 2) = a4;
  }
}

- (int64_t)gamepadElementForUsagePage:(int64_t)a3 usage:(int64_t)a4
{
  int64_t result = 0;
  for (i = &self->_mappings[0].usage; *(i - 1) != a3 || *i != a4; i += 2)
  {
    if (++result == 47) {
      return -1;
    }
  }
  return result;
}

@end