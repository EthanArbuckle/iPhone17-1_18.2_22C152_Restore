@interface GEOOfflineDataBatchKey
- (BOOL)isEqual:(id)a3;
- (GEOOfflineDataBatchKey)initWithLayer:(unsigned int)a3 key:(id)a4;
- (NSData)key;
- (id)description;
- (unint64_t)hash;
- (unsigned)layer;
@end

@implementation GEOOfflineDataBatchKey

- (GEOOfflineDataBatchKey)initWithLayer:(unsigned int)a3 key:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOOfflineDataBatchKey;
  v7 = [(GEOOfflineDataBatchKey *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_layer = a3;
    uint64_t v9 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t layer = self->_layer;
  return [(NSData *)self->_key hash] ^ layer;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int layer = self->_layer;
    if (layer == [v5 layer])
    {
      key = self->_key;
      v8 = [v5 key];
      BOOL v9 = [(NSData *)key isEqualToData:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [(NSData *)self->_key base64EncodedStringWithOptions:0];
  id v4 = [NSString stringWithFormat:@"{ layer: %llu, key: %@ }", self->_layer, v3];

  return v4;
}

- (unsigned)layer
{
  return self->_layer;
}

- (NSData)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end