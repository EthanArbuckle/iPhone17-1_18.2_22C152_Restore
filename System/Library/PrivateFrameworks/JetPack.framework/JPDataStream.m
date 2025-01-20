@interface JPDataStream
- (JPDataStream)initWithData:(id)a3;
- (NSData)data;
@end

@implementation JPDataStream

- (JPDataStream)initWithData:(id)a3
{
  id v3 = a3;
  [v3 bytes];
  [v3 length];
  JetPackCreateDataStream();
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end