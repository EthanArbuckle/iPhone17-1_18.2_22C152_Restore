@interface AXSSInterDeviceSearchResult
+ (id)searchResultWithPeerID:(id)a3 deviceType:(id)a4;
- (AXSSInterDeviceSearchResult)initWithPeerID:(id)a3 deviceType:(id)a4;
- (BOOL)isEqual:(id)a3;
- (MCPeerID)peerID;
- (NSString)deviceType;
- (NSString)name;
- (unint64_t)hash;
- (void)setDeviceType:(id)a3;
- (void)setPeerID:(id)a3;
@end

@implementation AXSSInterDeviceSearchResult

+ (id)searchResultWithPeerID:(id)a3 deviceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPeerID:v7 deviceType:v6];

  return v8;
}

- (AXSSInterDeviceSearchResult)initWithPeerID:(id)a3 deviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSSInterDeviceSearchResult;
  v8 = [(AXSSInterDeviceSearchResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXSSInterDeviceSearchResult *)v8 setPeerID:v6];
    [(AXSSInterDeviceSearchResult *)v9 setDeviceType:v7];
  }

  return v9;
}

- (NSString)name
{
  v2 = [(AXSSInterDeviceSearchResult *)self peerID];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 peerID];
    id v6 = [(AXSSInterDeviceSearchResult *)self peerID];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AXSSInterDeviceSearchResult *)self peerID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);

  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end