@interface CKKSActualPeer
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesPeer:(id)a3;
- (BOOL)shouldHaveView:(id)a3;
- (CKKSActualPeer)initWithCoder:(id)a3;
- (CKKSActualPeer)initWithPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6;
- (NSSet)viewList;
- (NSString)description;
- (NSString)peerID;
- (_SFECPublicKey)publicEncryptionKey;
- (_SFECPublicKey)publicSigningKey;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSActualPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_publicSigningKey, 0);
  objc_storeStrong((id *)&self->_publicEncryptionKey, 0);

  objc_storeStrong((id *)&self->_peerID, 0);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (_SFECPublicKey)publicSigningKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 24, 1);
}

- (_SFECPublicKey)publicEncryptionKey
{
  return (_SFECPublicKey *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSActualPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKKSActualPeer;
  v5 = [(CKKSActualPeer *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerID"];
    peerID = v5->_peerID;
    v5->_peerID = (NSString *)v6;

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
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v14 = +[NSArray arrayWithObjects:v20 count:2];
    v15 = +[NSSet setWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"viewList"];
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSActualPeer *)self peerID];
  [v4 encodeObject:v5 forKey:@"peerID"];

  uint64_t v6 = [(CKKSActualPeer *)self publicEncryptionKey];
  v7 = [v6 encodeSubjectPublicKeyInfo];
  [v4 encodeObject:v7 forKey:@"encryptionKey"];

  v8 = [(CKKSActualPeer *)self publicSigningKey];
  uint64_t v9 = [v8 encodeSubjectPublicKeyInfo];
  [v4 encodeObject:v9 forKey:@"signingKey"];

  id v10 = [(CKKSActualPeer *)self viewList];
  [v4 encodeObject:v10 forKey:@"viewList"];
}

- (BOOL)shouldHaveView:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSActualPeer *)self viewList];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)matchesPeer:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [(CKKSActualPeer *)self peerID];
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
  v7 = [(CKKSActualPeer *)self peerID];
  v8 = [v5 peerID];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (CKKSActualPeer)initWithPeerID:(id)a3 encryptionPublicKey:(id)a4 signingPublicKey:(id)a5 viewList:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSActualPeer;
  v15 = [(CKKSActualPeer *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peerID, a3);
    objc_storeStrong((id *)&v16->_publicEncryptionKey, a4);
    objc_storeStrong((id *)&v16->_publicSigningKey, a5);
    objc_storeStrong((id *)&v16->_viewList, a6);
  }

  return v16;
}

- (NSString)description
{
  v20 = [(CKKSActualPeer *)self peerID];
  v3 = [(CKKSActualPeer *)self publicEncryptionKey];
  id v4 = [v3 keyData];
  id v5 = [(CKKSActualPeer *)self publicEncryptionKey];
  unsigned __int8 v6 = [v5 keyData];
  id v7 = [v6 length];

  if ((unint64_t)v7 >= 0x10) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  unsigned __int8 v9 = objc_msgSend(v4, "subdataWithRange:", 0, v8);
  id v10 = [(CKKSActualPeer *)self publicSigningKey];
  id v11 = [v10 keyData];
  id v12 = [(CKKSActualPeer *)self publicSigningKey];
  id v13 = [v12 keyData];
  id v14 = [v13 length];

  if ((unint64_t)v14 >= 0x10) {
    uint64_t v15 = 16;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  uint64_t v16 = objc_msgSend(v11, "subdataWithRange:", 0, v15);
  v17 = [(CKKSActualPeer *)self viewList];
  objc_super v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<CKKSActualPeer(%@): pubEnc:%@ pubSign:%@ views:%d>", v20, v9, v16, [v17 count]);

  return (NSString *)v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end