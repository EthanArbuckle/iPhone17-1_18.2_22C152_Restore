@interface C2MultipeerChunkDataRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)chunkDataRequested;
- (C2MultipeerChunkDataRequest)initWithCoder:(id)a3;
- (NSUUID)requestUUID;
- (id)chunkDataCallback;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkDataCallback:(id)a3;
- (void)setChunkDataRequested:(BOOL)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation C2MultipeerChunkDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestUUID = self->_requestUUID;
  id v5 = a3;
  [v5 encodeObject:requestUUID forKey:@"requestUUID"];
  [v5 encodeBool:self->_chunkDataRequested forKey:@"chunkDataRequested"];
}

- (C2MultipeerChunkDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)C2MultipeerChunkDataRequest;
  id v5 = [(C2MultipeerChunkDataRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    v5->_chunkDataRequested = [v4 decodeBoolForKey:@"chunkDataRequested"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(C2MultipeerChunkDataRequest *)self requestUUID];
  BOOL v7 = [(C2MultipeerChunkDataRequest *)self chunkDataRequested];
  v8 = @"N";
  if (v7) {
    v8 = @"Y";
  }
  objc_super v9 = [v3 stringWithFormat:@"<%@ uuid=%@ chunkDataRequested=%@>", v5, v6, v8];

  return v9;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (BOOL)chunkDataRequested
{
  return self->_chunkDataRequested;
}

- (void)setChunkDataRequested:(BOOL)a3
{
  self->_chunkDataRequested = a3;
}

- (id)chunkDataCallback
{
  return self->_chunkDataCallback;
}

- (void)setChunkDataCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chunkDataCallback, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end