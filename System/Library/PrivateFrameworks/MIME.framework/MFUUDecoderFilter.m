@interface MFUUDecoderFilter
- (int64_t)appendData:(id)a3;
- (void)done;
@end

@implementation MFUUDecoderFilter

- (int64_t)appendData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 _createDispatchData];
    data = self->_data;
    if (data) {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(data, v6);
    }
    else {
      concat = v6;
    }
    v10 = self->_data;
    self->_data = concat;

    int64_t v9 = [v5 length];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)done
{
  v3 = self->_data;
  id v4 = [(OS_dispatch_data *)v3 mf_decodeUuencoded];
  v6.receiver = self;
  v6.super_class = (Class)MFUUDecoderFilter;
  [(MFBaseFilterDataConsumer *)&v6 appendData:v4];
  v5.receiver = self;
  v5.super_class = (Class)MFUUDecoderFilter;
  [(MFBaseFilterDataConsumer *)&v5 done];
}

- (void).cxx_destruct
{
}

@end