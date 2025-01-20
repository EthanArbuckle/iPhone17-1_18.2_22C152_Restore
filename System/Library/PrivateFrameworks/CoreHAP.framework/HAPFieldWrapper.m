@interface HAPFieldWrapper
- (HAPFieldWrapper)initWithTlvId:(unint64_t)a3 name:(id)a4;
- (NSString)name;
- (int64_t)tlvid;
- (void)setName:(id)a3;
- (void)setTlvid:(int64_t)a3;
@end

@implementation HAPFieldWrapper

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setTlvid:(int64_t)a3
{
  self->_tlvid = a3;
}

- (int64_t)tlvid
{
  return self->_tlvid;
}

- (HAPFieldWrapper)initWithTlvId:(unint64_t)a3 name:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAPFieldWrapper;
  v8 = [(HAPFieldWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_tlvid = a3;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

@end