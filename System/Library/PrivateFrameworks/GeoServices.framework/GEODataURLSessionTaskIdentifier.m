@interface GEODataURLSessionTaskIdentifier
- (BOOL)isEqual:(id)a3;
- (GEODataURLSessionTaskIdentifier)initWithSession:(id)a3 task:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation GEODataURLSessionTaskIdentifier

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->_sessionIdentity == v4[1] && self->_taskIdentifier == v4[2];

  return v6;
}

- (GEODataURLSessionTaskIdentifier)initWithSession:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GEODataURLSessionTaskIdentifier;
  v8 = [(GEODataURLSessionTaskIdentifier *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_sessionIdentity = (int64_t)v6;
    uint64_t v10 = [v7 taskIdentifier];
    uint64_t v11 = (v9->_sessionIdentity - v10 + 0x61C8864680B583EDLL) ^ 0x13C6EF;
    unint64_t v12 = (v10 + 0x61C8864680B583EDLL - v11) ^ (v11 << 9);
    unint64_t v13 = (0x9E3779B97F4A7C13 - v11 - v12) ^ (v12 >> 8);
    unint64_t v14 = (v11 - v12 - v13) ^ (v13 >> 38);
    unint64_t v15 = (v12 - v13 - v14) ^ (v14 << 23);
    unint64_t v16 = (v13 - v14 - v15) ^ (v15 >> 5);
    unint64_t v17 = (v14 - v15 - v16) ^ (v16 >> 35);
    unint64_t v18 = (v15 - v16 - v17) ^ (v17 << 49);
    unint64_t v19 = (v16 - v17 - v18) ^ (v18 >> 11);
    unint64_t v20 = (v17 - v18 - v19) ^ (v19 >> 12);
    v9->_taskIdentifier = v10;
    v9->_hash = (v19 - v20 - ((v18 - v19 - v20) ^ (v20 << 18))) ^ (((v18 - v19 - v20) ^ (v20 << 18)) >> 22);
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%06lx-%lu>", self->_sessionIdentity >> 8, self->_taskIdentifier);
}

@end