@interface KVFieldValue
- (KVFieldValue)initWithFieldType:(int64_t)a3 value:(id)a4;
- (NSString)value;
- (int64_t)fieldType;
@end

@implementation KVFieldValue

- (void).cxx_destruct
{
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (KVFieldValue)initWithFieldType:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KVFieldValue;
  v8 = [(KVFieldValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_fieldType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

@end