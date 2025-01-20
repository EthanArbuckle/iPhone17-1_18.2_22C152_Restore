@interface SecConcrete_sec_protocol_configuration_builder
- (SecConcrete_sec_protocol_configuration_builder)init;
- (SecConcrete_sec_protocol_configuration_builder)initWithDictionary:(__CFDictionary *)a3 andInternalFlag:(BOOL)a4;
@end

@implementation SecConcrete_sec_protocol_configuration_builder

- (SecConcrete_sec_protocol_configuration_builder)initWithDictionary:(__CFDictionary *)a3 andInternalFlag:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SecConcrete_sec_protocol_configuration_builder;
  v6 = [(SecConcrete_sec_protocol_configuration_builder *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->dictionary = a3;
    if (a3) {
      CFRetain(a3);
    }
    v7->is_apple = a4;
  }
  return v7;
}

- (SecConcrete_sec_protocol_configuration_builder)init
{
  v7.receiver = self;
  v7.super_class = (Class)SecConcrete_sec_protocol_configuration_builder;
  v2 = [(SecConcrete_sec_protocol_configuration_builder *)&v7 init];
  if (v2)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
      if (InfoDictionary)
      {
        Value = (__CFDictionary *)CFDictionaryGetValue(InfoDictionary, @"NSAppTransportSecurity");
        v2->dictionary = Value;
        if (Value) {
          CFRetain(Value);
        }
        if (_is_apple_bundle_onceToken != -1) {
          dispatch_once(&_is_apple_bundle_onceToken, &__block_literal_global_4557);
        }
        v2->is_apple = _is_apple_bundle_result;
      }
    }
  }
  return v2;
}

@end