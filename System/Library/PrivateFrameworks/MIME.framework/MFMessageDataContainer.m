@interface MFMessageDataContainer
- (MFMessageDataContainer)initWithData:(id)a3;
- (MFMessageDataContainer)initWithData:(id)a3 partial:(BOOL)a4 incomplete:(BOOL)a5;
- (id)data;
@end

@implementation MFMessageDataContainer

- (void).cxx_destruct
{
}

- (MFMessageDataContainer)initWithData:(id)a3 partial:(BOOL)a4 incomplete:(BOOL)a5
{
  result = [(MFMessageDataContainer *)self initWithData:a3];
  if (result)
  {
    result->_partial = a4;
    result->_incomplete = a5;
  }
  return result;
}

- (MFMessageDataContainer)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageDataContainer;
  v6 = [(MFMessageDataContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (id)data
{
  return self->_data;
}

@end