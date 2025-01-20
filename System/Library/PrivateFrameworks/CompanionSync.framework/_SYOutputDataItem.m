@interface _SYOutputDataItem
- (NSData)data;
- (id)callback;
- (unint64_t)bytesSent;
- (void)setBytesSent:(unint64_t)a3;
- (void)setCallback:(id)a3;
- (void)setData:(id)a3;
@end

@implementation _SYOutputDataItem

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end