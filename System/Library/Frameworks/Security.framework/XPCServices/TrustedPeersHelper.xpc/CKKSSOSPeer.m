@interface CKKSSOSPeer
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSSOSPeer)initWithCoder:(id)a3;
- (CKKSSOSPeer)initWithSOSPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (NSString)spid;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)encodeWithCoder:(id)a3;
- (void)setSpid:(id)a3;
- (void)setViewList:(id)a3;
@end

@implementation CKKSSOSPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_spid, 0);
  objc_storeStrong((id *)&self->_publicSigningKey, 0);

  objc_storeStrong((id *)&self->_publicEncryptionKey, 0);
}

- (void)setViewList:(id)a3
{
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSpid:(id)a3
{
}

- (NSString)spid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 16, 1);
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSSOSPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSSOSPeer;
  v5 = [(CKKSSOSPeer *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spid"];
    spid = v5->_spid;
    v5->_spid = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionKey"];
    if (v8)
    {
      uint64_t v9 = +[_SFECPublicKey keyWithSubjectPublicKeyInfo:v8];
      publicEncryptionKey = v5->_publicEncryptionKey;
      v5->_publicEncryptionKey = (_SFECPublicKey *)v9;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingKey"];
    if (v11)
    {
      uint64_t v12 = +[_SFECPublicKey keyWithSubjectPublicKeyInfo:v11];
      publicSigningKey = v5->_publicSigningKey;
      v5->_publicSigningKey = (_SFECPublicKey *)v12;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSSOSPeer *)self spid];
  [v4 encodeObject:v5 forKey:@"spid"];

  uint64_t v6 = [(CKKSSOSPeer *)self publicEncryptionKey];
  v7 = [v6 encodeSubjectPublicKeyInfo];
  [v4 encodeObject:v7 forKey:@"encryptionKey"];

  id v9 = [(CKKSSOSPeer *)self publicSigningKey];
  v8 = [v9 encodeSubjectPublicKeyInfo];
  [v4 encodeObject:v8 forKey:@"signingKey"];
}

- (BOOL)shouldHaveView:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSSOSPeer *)self viewList];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [(CKKSSOSPeer *)self peerID];
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
  v7 = [(CKKSSOSPeer *)self peerID];
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
  v2 = [(CKKSSOSPeer *)self spid];
  v3 = +[NSString stringWithFormat:@"%@%@", @"spid-", v2];

  return (NSString *)v3;
}

- (CKKSSOSPeer)initWithSOSPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSSOSPeer;
  v14 = [(CKKSSOSPeer *)&v18 init];
  if (v14)
  {
    if ([v10 hasPrefix:@"spid-"])
    {
      objc_super v15 = [v10 substringFromIndex:objc_msgSend(@"spid-", "length")];
    }
    else
    {
      objc_super v15 = (NSString *)v10;
    }
    spid = v14->_spid;
    v14->_spid = v15;

    objc_storeStrong((id *)&v14->_publicEncryptionKey, a4);
    objc_storeStrong((id *)&v14->_publicSigningKey, a5);
    objc_storeStrong((id *)&v14->_viewList, a6);
  }

  return v14;
}

- (NSString)description
{
  v20 = [(CKKSSOSPeer *)self peerID];
  v3 = [(CKKSSOSPeer *)self publicEncryptionKey];
  id v4 = [v3 keyData];
  id v5 = [(CKKSSOSPeer *)self publicEncryptionKey];
  unsigned __int8 v6 = [v5 keyData];
  id v7 = [v6 length];

  if ((unint64_t)v7 >= 0x10) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  unsigned __int8 v9 = objc_msgSend(v4, "subdataWithRange:", 0, v8);
  id v10 = [(CKKSSOSPeer *)self publicSigningKey];
  id v11 = [v10 keyData];
  id v12 = [(CKKSSOSPeer *)self publicSigningKey];
  id v13 = [v12 keyData];
  id v14 = [v13 length];

  if ((unint64_t)v14 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = objc_msgSend(v11, "subdataWithRange:", 0, v15);
  v17 = [(CKKSSOSPeer *)self viewList];
  objc_super v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<CKKSSOSPeer(%@): pubEnc:%@ pubSign:%@ views:%d>", v20, v9, v16, [v17 count]);

  return (NSString *)v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end