@interface HSTVendorEvent
+ (const)hsClassName;
- (HSTVendorEvent)initWithType:(unsigned __int16)a3 buffer:(const void *)a4 length:(unint64_t)a5;
- (NSData)data;
- (unsigned)type;
- (void)setData:(id)a3;
- (void)setType:(unsigned __int16)a3;
@end

@implementation HSTVendorEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)86,(char)101,(char)110,(char)100,(char)111,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (HSTVendorEvent)initWithType:(unsigned __int16)a3 buffer:(const void *)a4 length:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)HSTVendorEvent;
  v8 = [(HSTEvent *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    uint64_t v10 = +[NSData dataWithBytes:a4 length:a5];
    data = v9->_data;
    v9->_data = (NSData *)v10;

    v12 = v9;
  }

  return v9;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end