@interface ILNetworkResponse
+ (BOOL)supportsSecureCoding;
- (ILNetworkResponse)initWithCoder:(id)a3;
- (ILNetworkResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSData)data;
- (NSHTTPURLResponse)urlResponse;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setUrlResponse:(id)a3;
@end

@implementation ILNetworkResponse

- (ILNetworkResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ILNetworkResponse;
  v8 = [(ILNetworkResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    urlResponse = v8->_urlResponse;
    v8->_urlResponse = (NSHTTPURLResponse *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILNetworkResponse *)self urlResponse];
  id v6 = [(ILNetworkResponse *)self data];
  id v7 = [v3 stringWithFormat:@"<%@ %p urlResponse=%@ data.length=%lu>", v4, self, v5, objc_msgSend(v6, "length")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILNetworkResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_urlResponse);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_data);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = [(ILNetworkResponse *)self initWithURLResponse:v7 data:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILNetworkResponse *)self urlResponse];
  id v6 = NSStringFromSelector(sel_urlResponse);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(ILNetworkResponse *)self data];
  id v7 = NSStringFromSelector(sel_data);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
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
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_urlResponse, 0);
}

@end