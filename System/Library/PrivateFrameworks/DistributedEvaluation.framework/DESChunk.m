@interface DESChunk
- (BOOL)isEqual:(id)a3;
- (DESChunk)initWithKey:(id)a3 clippingBound:(id)a4 data:(id)a5;
- (NSMutableData)data;
- (NSNumber)clippingBound;
- (NSString)key;
- (unint64_t)hash;
- (void)setClippingBound:(id)a3;
@end

@implementation DESChunk

- (DESChunk)initWithKey:(id)a3 clippingBound:(id)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DESChunk;
  v12 = [(DESChunk *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v13->_clippingBound, a4);
    objc_storeStrong((id *)&v13->_data, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DESChunk *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(DESChunk *)self key];
      v7 = [(DESChunk *)v5 key];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(DESChunk *)self clippingBound];
        id v9 = [(DESChunk *)v5 clippingBound];
        if (v8 == v9)
        {
          id v11 = [(DESChunk *)self data];
          v12 = [(DESChunk *)v5 data];
          char v10 = [v11 isEqualToData:v12];
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSNumber *)self->_clippingBound hash] ^ v3;
  return v4 ^ [(NSMutableData *)self->_data hash];
}

- (NSString)key
{
  return self->_key;
}

- (NSNumber)clippingBound
{
  return self->_clippingBound;
}

- (void)setClippingBound:(id)a3
{
}

- (NSMutableData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_clippingBound, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end