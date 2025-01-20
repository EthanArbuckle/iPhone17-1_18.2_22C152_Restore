@interface AVOutputDeviceAuthorizedPeer
- (AVOutputDeviceAuthorizedPeer)init;
- (AVOutputDeviceAuthorizedPeer)initWithID:(id)a3 publicKey:(id)a4 hasAdministratorPrivileges:(BOOL)a5;
- (BOOL)hasAdministratorPrivileges;
- (BOOL)isEqual:(id)a3;
- (NSData)publicKey;
- (NSString)peerID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVOutputDeviceAuthorizedPeer

- (AVOutputDeviceAuthorizedPeer)init
{
  return [(AVOutputDeviceAuthorizedPeer *)self initWithID:0 publicKey:0 hasAdministratorPrivileges:0];
}

- (AVOutputDeviceAuthorizedPeer)initWithID:(id)a3 publicKey:(id)a4 hasAdministratorPrivileges:(BOOL)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AVOutputDeviceAuthorizedPeer;
  v8 = [(AVOutputDeviceAuthorizedPeer *)&v13 init];
  v9 = objc_alloc_init(AVOutputDeviceAuthorizedPeerInternal);
  v8->_ivars = v9;
  if (v9
    && (v8->_ivars->ID = (NSString *)[a3 copy]) != 0
    && (v8->_ivars->publicKey = (NSData *)[a4 copy], ivars = v8->_ivars, ivars->publicKey))
  {
    ivars->isAdmin = a5;
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceAuthorizedPeer;
  [(AVOutputDeviceAuthorizedPeer *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "isEqualToString:", -[AVOutputDeviceAuthorizedPeer peerID](self, "peerID"));
    if (v5)
    {
      int v5 = objc_msgSend((id)objc_msgSend(a3, "publicKey"), "isEqualToData:", -[AVOutputDeviceAuthorizedPeer publicKey](self, "publicKey"));
      if (v5)
      {
        char v6 = [a3 hasAdministratorPrivileges];
        LOBYTE(v5) = v6 ^ [(AVOutputDeviceAuthorizedPeer *)self hasAdministratorPrivileges] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(AVOutputDeviceAuthorizedPeer *)self peerID] hash];
  uint64_t v4 = [(NSData *)[(AVOutputDeviceAuthorizedPeer *)self publicKey] hash] ^ v3;
  return v4 ^ [(AVOutputDeviceAuthorizedPeer *)self hasAdministratorPrivileges];
}

- (NSString)peerID
{
  return self->_ivars->ID;
}

- (NSData)publicKey
{
  return self->_ivars->publicKey;
}

- (BOOL)hasAdministratorPrivileges
{
  return self->_ivars->isAdmin;
}

@end