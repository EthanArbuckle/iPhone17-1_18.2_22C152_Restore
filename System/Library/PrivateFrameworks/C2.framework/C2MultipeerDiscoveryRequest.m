@interface C2MultipeerDiscoveryRequest
+ (BOOL)supportsSecureCoding;
- (C2MultipeerDiscoveryRequest)initWithCoder:(id)a3;
- (NSData)chunkSignature;
- (NSString)containerIdentifier;
- (NSUUID)requestUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkSignature:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation C2MultipeerDiscoveryRequest

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
  [v5 encodeObject:self->_containerIdentifier forKey:@"containerIdentifier"];
}

- (C2MultipeerDiscoveryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)C2MultipeerDiscoveryRequest;
  id v5 = [(C2MultipeerDiscoveryRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chunkSignature"];
    chunkSignature = v5->_chunkSignature;
    v5->_chunkSignature = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(C2MultipeerDiscoveryRequest *)self requestUUID];
  v7 = [(C2MultipeerDiscoveryRequest *)self chunkSignature];
  uint64_t v8 = [(C2MultipeerDiscoveryRequest *)self containerIdentifier];
  v9 = [v3 stringWithFormat:@"<%@ uuid=%@ chunkSignature=%@ containerIdentifier=%@>", v5, v6, v7, v8];

  return v9;
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

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_chunkSignature, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end