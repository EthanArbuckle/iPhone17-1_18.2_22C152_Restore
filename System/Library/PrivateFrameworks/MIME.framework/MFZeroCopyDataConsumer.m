@interface MFZeroCopyDataConsumer
- (MFZeroCopyDataConsumer)init;
- (id)data;
- (int64_t)appendData:(id)a3;
- (void)done;
@end

@implementation MFZeroCopyDataConsumer

- (MFZeroCopyDataConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFZeroCopyDataConsumer;
  v2 = [(MFZeroCopyDataConsumer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataHolder = v2->_dataHolder;
    v2->_dataHolder = (MFDataHolder *)v3;
  }
  return v2;
}

- (id)data
{
  return [(MFDataHolder *)self->_dataHolder data];
}

- (int64_t)appendData:(id)a3
{
  id v4 = a3;
  if (self->_done)
  {
    int64_t v5 = -1;
  }
  else
  {
    [(MFDataHolder *)self->_dataHolder addData:v4];
    int64_t v5 = [v4 length];
  }

  return v5;
}

- (void)done
{
  self->_done = 1;
}

- (void).cxx_destruct
{
}

@end