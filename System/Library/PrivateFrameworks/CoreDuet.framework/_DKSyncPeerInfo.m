@interface _DKSyncPeerInfo
- (id)debugDescription;
- (id)description;
- (void)transportsString;
@end

@implementation _DKSyncPeerInfo

- (void)transportsString
{
  if (a1)
  {
    a1 = +[_DKSyncPeerStatusTracker stringForTransports:a1[3]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  peer = self->_peer;
  v7 = -[_DKSyncPeerInfo transportsString](self);
  v8 = [v3 stringWithFormat:@"<%@ %p: peer=%@, transports=%@>", v5, self, peer, v7];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_DKSyncPeer *)self->_peer debugDescription];
  v7 = -[_DKSyncPeerInfo transportsString](self);
  v8 = [v3 stringWithFormat:@"<%@ %p: peer=%@, transports=%@>", v5, self, v6, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end