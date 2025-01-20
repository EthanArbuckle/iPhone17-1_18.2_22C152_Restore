@interface CPLTransferSpeedFormatter
- (CPLTransferSpeedFormatter)init;
- (NSByteCountFormatter)byteCountFormatter;
- (id)stringForObjectValue:(id)a3;
@end

@implementation CPLTransferSpeedFormatter

- (void).cxx_destruct
{
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (id)stringForObjectValue:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(NSByteCountFormatter *)self->_byteCountFormatter stringForObjectValue:v5];

  v8 = (void *)[v6 initWithFormat:@"%@/s", v7];
  return v8;
}

- (CPLTransferSpeedFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLTransferSpeedFormatter;
  v2 = [(CPLTransferSpeedFormatter *)&v6 init];
  if (v2)
  {
    v3 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E4F28B68]);
    byteCountFormatter = v2->_byteCountFormatter;
    v2->_byteCountFormatter = v3;

    [(NSByteCountFormatter *)v2->_byteCountFormatter setCountStyle:3];
  }
  return v2;
}

@end