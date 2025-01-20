@interface _VNRequestForensicsRequestAndObservationsCacheKeyTuple
- (BOOL)isEqual:(id)a3;
- (NSObject)observationsCacheKey;
- (VNRequest)request;
- (_VNRequestForensicsRequestAndObservationsCacheKeyTuple)initWithRequest:(id)a3 observationsCacheKey:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _VNRequestForensicsRequestAndObservationsCacheKeyTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsCacheKey, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (NSObject)observationsCacheKey
{
  return self->_observationsCacheKey;
}

- (VNRequest)request
{
  return self->_request;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)a3;
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
      v7 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v5 request];

      if (request == v7)
      {
        observationsCacheKey = self->_observationsCacheKey;
        v10 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)v5 observationsCacheKey];
        char v8 = [observationsCacheKey isEqual:v10];
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
  v3 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)self request];
  uint64_t v4 = [v3 hash];

  v5 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)self observationsCacheKey];
  unint64_t v6 = [v5 hash] ^ __ROR8__(v4, 51);

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)self request];
  v5 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)self observationsCacheKey];
  unint64_t v6 = [v3 stringWithFormat:@"( %@, %@)", v4, v5];

  return v6;
}

- (_VNRequestForensicsRequestAndObservationsCacheKeyTuple)initWithRequest:(id)a3 observationsCacheKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_VNRequestForensicsRequestAndObservationsCacheKeyTuple;
  v9 = [(_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_observationsCacheKey, a4);
    v11 = v10;
  }

  return v10;
}

@end