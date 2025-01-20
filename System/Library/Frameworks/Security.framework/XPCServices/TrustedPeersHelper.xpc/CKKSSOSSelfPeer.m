@interface CKKSSOSSelfPeer
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSSOSSelfPeer)initWithSOSPeerID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (NSString)spid;
- (_SFECKeyPair)encryptionKey;
- (_SFECKeyPair)signingKey;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)setEncryptionKey:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setSpid:(id)a3;
@end

@implementation CKKSSOSSelfPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spid, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_viewList, 0);
}

- (void)setSpid:(id)a3
{
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (_SFECKeyPair)signingKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (_SFECKeyPair)encryptionKey
{
  return (_SFECKeyPair *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)shouldHaveView:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSSOSSelfPeer *)self viewList];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [(CKKSSOSSelfPeer *)self peerID];
  if (!v6)
  {
    v3 = [v5 peerID];
    if (!v3)
    {
      unsigned __int8 v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CKKSSOSSelfPeer *)self peerID];
  v8 = [v5 peerID];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (NSString)peerID
{
  v2 = [(CKKSSOSSelfPeer *)self spid];
  v3 = +[NSString stringWithFormat:@"%@%@", @"spid-", v2];

  return (NSString *)v3;
}

- (_SFECPublicKey)publicSigningKey
{
  v2 = [(CKKSSOSSelfPeer *)self signingKey];
  v3 = [v2 publicKey];

  return (_SFECPublicKey *)v3;
}

- (_SFECPublicKey)publicEncryptionKey
{
  v2 = [(CKKSSOSSelfPeer *)self encryptionKey];
  v3 = [v2 publicKey];

  return (_SFECPublicKey *)v3;
}

- (CKKSSOSSelfPeer)initWithSOSPeerID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 viewList:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSSOSSelfPeer;
  v14 = [(CKKSSOSSelfPeer *)&v18 init];
  if (v14)
  {
    if ([v10 hasPrefix:@"spid-"])
    {
      v15 = [v10 substringFromIndex:objc_msgSend(@"spid-", "length")];
    }
    else
    {
      v15 = (NSString *)v10;
    }
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_encryptionKey, a4);
    objc_storeStrong((id *)&v14->_signingKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (NSString)description
{
  v20 = [(CKKSSOSSelfPeer *)self peerID];
  v3 = [(CKKSSOSSelfPeer *)self publicEncryptionKey];
  id v4 = [v3 keyData];
  id v5 = [(CKKSSOSSelfPeer *)self publicEncryptionKey];
  unsigned __int8 v6 = [v5 keyData];
  id v7 = [v6 length];

  if ((unint64_t)v7 >= 0x10) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  unsigned __int8 v9 = objc_msgSend(v4, "subdataWithRange:", 0, v8);
  id v10 = [(CKKSSOSSelfPeer *)self publicSigningKey];
  id v11 = [v10 keyData];
  id v12 = [(CKKSSOSSelfPeer *)self publicSigningKey];
  id v13 = [v12 keyData];
  id v14 = [v13 length];

  if ((unint64_t)v14 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = objc_msgSend(v11, "subdataWithRange:", 0, v15);
  v17 = [(CKKSSOSSelfPeer *)self viewList];
  objc_super v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<CKKSSOSSelfPeer(%@): pubEnc:%@ pubSign:%@ views:%d>", v20, v9, v16, [v17 count]);

  return (NSString *)v18;
}

@end