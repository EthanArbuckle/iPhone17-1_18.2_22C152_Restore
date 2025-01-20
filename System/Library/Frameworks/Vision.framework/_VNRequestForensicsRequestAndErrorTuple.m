@interface _VNRequestForensicsRequestAndErrorTuple
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (VNRequest)request;
- (_VNRequestForensicsRequestAndErrorTuple)initWithRequest:(id)a3 error:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _VNRequestForensicsRequestAndErrorTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (NSError)error
{
  return self->_error;
}

- (VNRequest)request
{
  return self->_request;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_VNRequestForensicsRequestAndErrorTuple *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      request = self->_request;
      v7 = [(_VNRequestForensicsRequestAndErrorTuple *)v5 request];

      if (request == v7)
      {
        error = self->_error;
        v10 = [(_VNRequestForensicsRequestAndErrorTuple *)v5 error];
        char v8 = [(NSError *)error isEqual:v10];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(_VNRequestForensicsRequestAndErrorTuple *)self request];
  uint64_t v4 = [v3 hash];

  v5 = [(_VNRequestForensicsRequestAndErrorTuple *)self error];
  unint64_t v6 = [v5 hash] ^ __ROR8__(v4, 51);

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(_VNRequestForensicsRequestAndErrorTuple *)self request];
  v5 = [(_VNRequestForensicsRequestAndErrorTuple *)self error];
  unint64_t v6 = [v3 stringWithFormat:@"( %@, %@)", v4, v5];

  return v6;
}

- (_VNRequestForensicsRequestAndErrorTuple)initWithRequest:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_VNRequestForensicsRequestAndErrorTuple;
  v9 = [(_VNRequestForensicsRequestAndErrorTuple *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    v11 = v10;
  }

  return v10;
}

@end