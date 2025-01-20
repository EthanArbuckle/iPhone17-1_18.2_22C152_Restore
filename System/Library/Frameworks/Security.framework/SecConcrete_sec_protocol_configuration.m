@interface SecConcrete_sec_protocol_configuration
- (SecConcrete_sec_protocol_configuration)init;
@end

@implementation SecConcrete_sec_protocol_configuration

- (void).cxx_destruct
{
}

- (SecConcrete_sec_protocol_configuration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SecConcrete_sec_protocol_configuration;
  v2 = [(SecConcrete_sec_protocol_configuration *)&v6 init];
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    dictionary = v2->dictionary;
    v2->dictionary = v3;
  }
  return v2;
}

@end