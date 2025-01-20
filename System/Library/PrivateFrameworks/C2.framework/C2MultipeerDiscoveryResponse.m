@interface C2MultipeerDiscoveryResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)chunkAvailable;
- (C2MultipeerDiscoveryResponse)initWithCoder:(id)a3;
- (NSData)chunkSignature;
- (NSUUID)requestUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkAvailable:(BOOL)a3;
- (void)setChunkSignature:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation C2MultipeerDiscoveryResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestUUID = self->_requestUUID;
  id v5 = a3;
  [v5 encodeObject:requestUUID forKey:@"requestUUID"];
  [v5 encodeObject:self->_chunkSignature forKey:@"chunkSignature"];
  [v5 encodeBool:self->_chunkAvailable forKey:@"chunkAvailable"];
}

- (C2MultipeerDiscoveryResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MultipeerDiscoveryResponse;
  id v5 = [(C2MultipeerDiscoveryResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chunkSignature"];
    chunkSignature = v5->_chunkSignature;
    v5->_chunkSignature = (NSData *)v8;

    v5->_chunkAvailable = [v4 decodeBoolForKey:@"chunkAvailable"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(C2MultipeerDiscoveryResponse *)self requestUUID];
  v7 = [(C2MultipeerDiscoveryResponse *)self chunkSignature];
  BOOL v8 = [(C2MultipeerDiscoveryResponse *)self chunkAvailable];
  v9 = @"N";
  if (v8) {
    v9 = @"Y";
  }
  v10 = [v3 stringWithFormat:@"<%@ uuid=%@ chunkSignature=%@ chunkAvailable=%@>", v5, v6, v7, v9];

  return v10;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSData)chunkSignature
{
  return self->_chunkSignature;
}

- (void)setChunkSignature:(id)a3
{
}

- (BOOL)chunkAvailable
{
  return self->_chunkAvailable;
}

- (void)setChunkAvailable:(BOOL)a3
{
  self->_chunkAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkSignature, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end