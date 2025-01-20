@interface HAPUint8Wrapper
+ (id)wrappertlv:(unint64_t)a3 name:(id)a4;
- (NSNumber)field;
- (void)setField:(id)a3;
@end

@implementation HAPUint8Wrapper

- (void).cxx_destruct
{
}

- (void)setField:(id)a3
{
}

- (NSNumber)field
{
  return self->_field;
}

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4
{
  id v5 = a4;
  v6 = [(HAPFieldWrapper *)[HAPUint8Wrapper alloc] initWithTlvId:a3 name:v5];

  return v6;
}

@end