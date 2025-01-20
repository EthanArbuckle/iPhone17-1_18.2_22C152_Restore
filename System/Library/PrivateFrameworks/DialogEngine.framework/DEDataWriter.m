@interface DEDataWriter
- (DEDataWriter)init;
- (NSMutableData)data;
- (void)setData:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEDataWriter

- (void).cxx_destruct
{
}

- (void)setData:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)writeData:(id)a3
{
}

- (DEDataWriter)init
{
  v7.receiver = self;
  v7.super_class = (Class)DEDataWriter;
  v2 = [(DEDataWriter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    v5 = v2;
  }

  return v2;
}

@end