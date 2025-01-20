@interface CAFWriteRequest
+ (id)requestWithCharacteristic:(id)a3 value:(id)a4;
- (CAFWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4;
- (id)value;
@end

@implementation CAFWriteRequest

+ (id)requestWithCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 writable]) {
    v8 = (void *)[objc_alloc((Class)a1) initWithCharacteristic:v6 value:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (CAFWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAFWriteRequest;
  v8 = [(CAFRequest *)&v11 initWithCharacteristic:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end