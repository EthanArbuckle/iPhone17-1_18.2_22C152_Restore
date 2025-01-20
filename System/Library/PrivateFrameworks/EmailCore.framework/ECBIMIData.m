@interface ECBIMIData
+ (id)bimiDataForHeaders:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ECBIMIData)initWithIndicator:(id)a3 location:(id)a4 evidenceLocation:(id)a5 indicatorHash:(id)a6 hashAlgorithm:(id)a7;
- (NSData)indicator;
- (NSString)hashAlgorithm;
- (NSString)indicatorHash;
- (NSURL)evidenceLocation;
- (NSURL)location;
- (uint64_t)_calculateHash;
- (unint64_t)hash;
@end

@implementation ECBIMIData

+ (id)bimiDataForHeaders:(id)a3
{
  v3 = +[_ECBIMIHeaderParser bimiDataForHeaders:]((uint64_t)_ECBIMIHeaderParser, a3);
  return v3;
}

- (ECBIMIData)initWithIndicator:(id)a3 location:(id)a4 evidenceLocation:(id)a5 indicatorHash:(id)a6 hashAlgorithm:(id)a7
{
  id v20 = a3;
  id v19 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ECBIMIData;
  v16 = [(ECBIMIData *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_indicator, a3);
    objc_storeStrong((id *)&v17->_location, a4);
    objc_storeStrong((id *)&v17->_evidenceLocation, a5);
    objc_storeStrong((id *)&v17->_indicatorHash, a6);
    objc_storeStrong((id *)&v17->_hashAlgorithm, a7);
    -[ECBIMIData _calculateHash]((uint64_t)v17);
  }

  return v17;
}

- (uint64_t)_calculateHash
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 16) hash];
    uint64_t v3 = [*(id *)(v1 + 24) hash];
    uint64_t v4 = [*(id *)(v1 + 32) hash];
    uint64_t v5 = [*(id *)(v1 + 40) hash];
    result = [*(id *)(v1 + 48) hash];
    *(void *)(v1 + 8) = 33 * (33 * (33 * (33 * v2 + v3) + v4) + v5) + result + 39135393;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ECBIMIData *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if ([(ECBIMIData *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    v6 = [(ECBIMIData *)self indicator];
    v7 = [(ECBIMIData *)v5 indicator];
    if (EFObjectsAreEqual())
    {
      v8 = [(ECBIMIData *)self location];
      v9 = [(ECBIMIData *)v5 location];
      if (EFObjectsAreEqual())
      {
        v17 = [(ECBIMIData *)self evidenceLocation];
        v10 = [(ECBIMIData *)v5 evidenceLocation];
        if (EFObjectsAreEqual())
        {
          v16 = [(ECBIMIData *)self indicatorHash];
          id v15 = [(ECBIMIData *)v5 indicatorHash];
          if (EFObjectsAreEqual())
          {
            id v14 = [(ECBIMIData *)self hashAlgorithm];
            v11 = [(ECBIMIData *)v5 hashAlgorithm];
            char v12 = EFObjectsAreEqual();
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSData)indicator
{
  return self->_indicator;
}

- (NSURL)location
{
  return self->_location;
}

- (NSURL)evidenceLocation
{
  return self->_evidenceLocation;
}

- (NSString)indicatorHash
{
  return self->_indicatorHash;
}

- (NSString)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashAlgorithm, 0);
  objc_storeStrong((id *)&self->_indicatorHash, 0);
  objc_storeStrong((id *)&self->_evidenceLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end