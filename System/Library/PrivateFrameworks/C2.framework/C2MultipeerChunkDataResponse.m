@interface C2MultipeerChunkDataResponse
+ (BOOL)supportsSecureCoding;
- (C2MultipeerChunkDataResponse)initWithCoder:(id)a3;
- (NSData)chunkData;
- (NSUUID)requestUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkData:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation C2MultipeerChunkDataResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestUUID = self->_requestUUID;
  id v5 = a3;
  [v5 encodeObject:requestUUID forKey:@"requestUUID"];
  [v5 encodeObject:self->_chunkData forKey:@"chunkData"];
}

- (C2MultipeerChunkDataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MultipeerChunkDataResponse;
  id v5 = [(C2MultipeerChunkDataResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chunkData"];
    chunkData = v5->_chunkData;
    v5->_chunkData = (NSData *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(C2MultipeerChunkDataResponse *)self requestUUID];
  v7 = [(C2MultipeerChunkDataResponse *)self chunkData];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ uuid=%@ chunkDataLength=%llu>", v5, v6, objc_msgSend(v7, "length")];

  return v8;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSData)chunkData
{
  return self->_chunkData;
}

- (void)setChunkData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkData, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end