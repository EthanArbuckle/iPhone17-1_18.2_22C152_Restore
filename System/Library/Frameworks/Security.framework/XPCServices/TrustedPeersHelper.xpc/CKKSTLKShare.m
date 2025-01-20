@interface CKKSTLKShare
+ (BOOL)supportsSecureCoding;
+ (id)share:(id)a3 as:(id)a4 to:(id)a5 epoch:(int64_t)a6 poisoned:(int64_t)a7 error:(id *)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)signatureVerifiesWithPeerSet:(id)a3 ckrecord:(id)a4 error:(id *)a5;
- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 ckrecord:(id)a5 error:(id *)a6;
- (CKKSTLKShare)initWithCoder:(id)a3;
- (CKRecordZoneID)zoneID;
- (NSData)receiverPublicEncryptionKeySPKI;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)receiverPeerID;
- (NSString)senderPeerID;
- (NSString)tlkUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForSigning:(id)a3;
- (id)description;
- (id)init:(id)a3 sender:(id)a4 receiver:(id)a5 curve:(int64_t)a6 version:(unint64_t)a7 epoch:(int64_t)a8 poisoned:(int64_t)a9 zoneID:(id)a10;
- (id)initForKey:(id)a3 senderPeerID:(id)a4 recieverPeerID:(id)a5 receiverEncPublicKeySPKI:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 wrappedKey:(id)a11 signature:(id)a12 zoneID:(id)a13;
- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 ckrecord:(id)a5 error:(id *)a6;
- (id)signRecord:(id)a3 ckrecord:(id)a4 error:(id *)a5;
- (id)unwrapUsing:(id)a3 error:(id *)a4;
- (id)wrap:(id)a3 publicKey:(id)a4 error:(id *)a5;
- (int64_t)curve;
- (int64_t)epoch;
- (int64_t)poisoned;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setCurve:(int64_t)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setPoisoned:(int64_t)a3;
- (void)setReceiverPeerID:(id)a3;
- (void)setReceiverPublicEncryptionKeySPKI:(id)a3;
- (void)setSenderPeerID:(id)a3;
- (void)setSignature:(id)a3;
- (void)setTlkUUID:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setWrappedTLK:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSTLKShare

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_wrappedTLK, 0);
  objc_storeStrong((id *)&self->_senderPeerID, 0);
  objc_storeStrong((id *)&self->_receiverPublicEncryptionKeySPKI, 0);
  objc_storeStrong((id *)&self->_receiverPeerID, 0);

  objc_storeStrong((id *)&self->_tlkUUID, 0);
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWrappedTLK:(id)a3
{
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPoisoned:(int64_t)a3
{
  self->_poisoned = a3;
}

- (int64_t)poisoned
{
  return self->_poisoned;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setSenderPeerID:(id)a3
{
}

- (NSString)senderPeerID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceiverPublicEncryptionKeySPKI:(id)a3
{
}

- (NSData)receiverPublicEncryptionKeySPKI
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReceiverPeerID:(id)a3
{
}

- (NSString)receiverPeerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTlkUUID:(id)a3
{
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (int64_t)curve
{
  return self->_curve;
}

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v12) {
    goto LABEL_15;
  }
  id v13 = v12;
  id v33 = v11;
  id v34 = v9;
  v14 = 0;
  uint64_t v15 = *(void *)v37;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v18 = [v17 peerID];
      v19 = [(CKKSTLKShare *)self senderPeerID];
      unsigned int v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        id v21 = v17;

        v14 = v21;
      }
    }
    id v13 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v13);
  id v11 = v33;
  id v9 = v34;
  if (!v14)
  {
LABEL_15:
    v30 = +[NSString stringWithFormat:@"No trusted peer signed %@", self];
    id v29 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:19 description:v30];

    if (a6)
    {
      id v29 = v29;
      v14 = 0;
      id v28 = 0;
      *a6 = v29;
      goto LABEL_25;
    }
    v14 = 0;
    goto LABEL_19;
  }
  v22 = [(CKKSTLKShare *)self signature];
  unsigned int v23 = [(CKKSTLKShare *)self verifySignature:v22 verifyingPeer:v14 ckrecord:v33 error:a6];

  if (!v23)
  {
    id v29 = 0;
LABEL_19:
    id v28 = 0;
    goto LABEL_25;
  }
  v24 = [(CKKSTLKShare *)self unwrapUsing:v34 error:a6];
  if (!v24)
  {
    id v29 = 0;
    goto LABEL_23;
  }
  v25 = [(CKKSTLKShare *)self tlkUUID];
  v26 = [v24 uuid];
  unsigned __int8 v27 = [v25 isEqualToString:v26];

  if ((v27 & 1) == 0)
  {
    v31 = +[NSString stringWithFormat:@"Signed UUID doesn't match unsigned UUID for %@", self];
    id v29 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:20 description:v31];

    if (a6)
    {
      id v29 = v29;
      id v28 = 0;
      *a6 = v29;
      goto LABEL_24;
    }
LABEL_23:
    id v28 = 0;
    goto LABEL_24;
  }
  id v28 = v24;
  id v29 = 0;
LABEL_24:

LABEL_25:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CKKSTLKShare *)self tlkUUID];
    v7 = [v5 tlkUUID];
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v13 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v8 = [(CKKSTLKShare *)self zoneID];
    id v9 = [v5 zoneID];
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v13 = 0;
LABEL_36:

      goto LABEL_37;
    }
    id v10 = [(CKKSTLKShare *)self senderPeerID];
    id v11 = [v5 senderPeerID];
    v46 = v10;
    if (![v10 isEqualToString:v11])
    {
      unsigned __int8 v13 = 0;
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v45 = [(CKKSTLKShare *)self receiverPeerID];
    if (v45 || ([v5 receiverPeerID], (long long v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = [(CKKSTLKShare *)self receiverPeerID];
      [v5 receiverPeerID];
      v43 = v44 = v12;
      if (!objc_msgSend(v12, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        goto LABEL_32;
      }
      int v42 = 1;
    }
    else
    {
      long long v39 = 0;
      int v42 = 0;
    }
    uint64_t v14 = [(CKKSTLKShare *)self receiverPublicEncryptionKeySPKI];
    if (v14
      || ([v5 receiverPublicEncryptionKeySPKI], (long long v37 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v15 = [(CKKSTLKShare *)self receiverPublicEncryptionKeySPKI];
      v40 = [v5 receiverPublicEncryptionKeySPKI];
      v41 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        v17 = (void *)v14;
        goto LABEL_29;
      }
      long long v38 = (void *)v14;
      int v16 = 1;
    }
    else
    {
      long long v37 = 0;
      long long v38 = 0;
      int v16 = 0;
    }
    id v18 = [(CKKSTLKShare *)self epoch];
    if (v18 != [v5 epoch]
      || (id v19 = -[CKKSTLKShare curve](self, "curve"), v19 != [v5 curve])
      || (id v20 = -[CKKSTLKShare poisoned](self, "poisoned"), v20 != [v5 poisoned]))
    {
      unsigned __int8 v13 = 0;
      v17 = v38;
      if (!v16) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    [(CKKSTLKShare *)self wrappedTLK];
    uint64_t v36 = v17 = v38;
    if (v36 || ([v5 wrappedTLK], (id v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v34 = v16;
      id v21 = [(CKKSTLKShare *)self wrappedTLK];
      v32 = [v5 wrappedTLK];
      id v33 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        LOBYTE(v16) = v34;
        goto LABEL_48;
      }
      int v31 = 1;
      LOBYTE(v16) = v34;
    }
    else
    {
      id v29 = 0;
      int v31 = 0;
    }
    v35 = [(CKKSTLKShare *)self signature];
    if (v35 || ([v5 signature], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = [(CKKSTLKShare *)self signature];
      v24 = [v5 signature];
      unsigned __int8 v13 = [v30 isEqual:v24];

      if (v35)
      {

        v17 = v38;
        if (!v31) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      v17 = v38;
      v26 = v28;
    }
    else
    {
      v26 = 0;
      unsigned __int8 v13 = 1;
    }

    if ((v31 & 1) == 0)
    {
LABEL_49:
      v25 = (void *)v36;
      if (!v36)
      {

        v25 = 0;
      }

      if ((v16 & 1) == 0)
      {
LABEL_30:
        if (v17)
        {

          if (v42) {
            goto LABEL_32;
          }
        }
        else
        {

          if (v42)
          {
LABEL_32:
            v22 = (void *)v45;

            if (v45)
            {
LABEL_34:

              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        v22 = (void *)v45;
        if (v45) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
LABEL_29:

      goto LABEL_30;
    }
LABEL_48:

    goto LABEL_49;
  }
  unsigned __int8 v13 = 0;
LABEL_38:

  return v13;
}

- (CKKSTLKShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKKSTLKShare;
  id v5 = [(CKKSTLKShare *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v6;

    v5->_curve = (int64_t)[v4 decodeInt64ForKey:@"curve"];
    v5->_version = (unint64_t)[v4 decodeInt64ForKey:@"version"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlkUUID"];
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderPeerID"];
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSString *)v10;

    v5->_epoch = (int64_t)[v4 decodeInt64ForKey:@"epoch"];
    v5->_poisoned = (int64_t)[v4 decodeInt64ForKey:@"poisoned"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedTLK"];
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPeerID"];
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverSPKI"];
    receiverPublicEncryptionKeySPKI = v5->_receiverPublicEncryptionKeySPKI;
    v5->_receiverPublicEncryptionKeySPKI = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSTLKShare *)self zoneID];
  [v4 encodeObject:v5 forKey:@"zoneID"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare curve](self, "curve"), @"curve");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare version](self, "version"), @"version");
  uint64_t v6 = [(CKKSTLKShare *)self tlkUUID];
  [v4 encodeObject:v6 forKey:@"tlkUUID"];

  v7 = [(CKKSTLKShare *)self senderPeerID];
  [v4 encodeObject:v7 forKey:@"senderPeerID"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare epoch](self, "epoch"), @"epoch");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare poisoned](self, "poisoned"), @"poisoned");
  uint64_t v8 = [(CKKSTLKShare *)self wrappedTLK];
  [v4 encodeObject:v8 forKey:@"wrappedTLK"];

  id v9 = [(CKKSTLKShare *)self signature];
  [v4 encodeObject:v9 forKey:@"signature"];

  uint64_t v10 = [(CKKSTLKShare *)self receiverPeerID];
  [v4 encodeObject:v10 forKey:@"receiverPeerID"];

  id v11 = [(CKKSTLKShare *)self receiverPublicEncryptionKeySPKI];
  [v4 encodeObject:v11 forKey:@"receiverSPKI"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCurve:", -[CKKSTLKShare curve](self, "curve"));
  objc_msgSend(v4, "setVersion:", -[CKKSTLKShare version](self, "version"));
  id v5 = [(CKKSTLKShare *)self tlkUUID];
  id v6 = [v5 copy];
  [v4 setTlkUUID:v6];

  v7 = [(CKKSTLKShare *)self senderPeerID];
  id v8 = [v7 copy];
  [v4 setSenderPeerID:v8];

  objc_msgSend(v4, "setEpoch:", -[CKKSTLKShare epoch](self, "epoch"));
  objc_msgSend(v4, "setPoisoned:", -[CKKSTLKShare poisoned](self, "poisoned"));
  id v9 = [(CKKSTLKShare *)self wrappedTLK];
  id v10 = [v9 copy];
  [v4 setWrappedTLK:v10];

  id v11 = [(CKKSTLKShare *)self signature];
  id v12 = [v11 copy];
  [v4 setSignature:v12];

  unsigned __int8 v13 = [(CKKSTLKShare *)self receiverPeerID];
  id v14 = [v13 copy];
  [v4 setReceiverPeerID:v14];

  uint64_t v15 = [(CKKSTLKShare *)self receiverPublicEncryptionKeySPKI];
  id v16 = [v15 copy];
  [v4 setReceiverPublicEncryptionKeySPKI:v16];

  return v4;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v34 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    int v31 = a5;
    id v12 = 0;
    uint64_t v13 = *(void *)v37;
    uint64_t v32 = *(void *)v37;
    while (2)
    {
      id v14 = 0;
      id v33 = v11;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
        id v16 = [v15 peerID];
        v17 = [(CKKSTLKShare *)self senderPeerID];
        unsigned int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          id v19 = [(CKKSTLKShare *)self signature];
          id v35 = 0;
          unsigned int v20 = [(CKKSTLKShare *)self verifySignature:v19 verifyingPeer:v15 ckrecord:v34 error:&v35];
          id v21 = v35;

          if (v21)
          {
            v22 = v12;
            id v23 = v9;
            v24 = [(CKKSTLKShare *)self zoneID];
            v25 = [v24 zoneName];
            v26 = sub_1002194F8(@"ckksshare", v25);

            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v41 = self;
              __int16 v42 = 2112;
              v43 = v15;
              __int16 v44 = 2112;
              id v45 = v21;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "signature didn't verify for %@ %@: %@", buf, 0x20u);
            }

            id v12 = v21;
            id v9 = v23;
            uint64_t v13 = v32;
            id v11 = v33;
          }

          if (v20)
          {

            BOOL v27 = 1;
            goto LABEL_21;
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    a5 = v31;
    if (v31)
    {
      if (!v12) {
        goto LABEL_19;
      }
      id v12 = v12;
      BOOL v27 = 0;
      id *v31 = v12;
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {

    if (a5)
    {
LABEL_19:
      id v28 = [(CKKSTLKShare *)self senderPeerID];
      id v29 = +[NSString stringWithFormat:@"No TLK share from %@", v28];
      *a5 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:35 description:v29];
    }
    BOOL v27 = 0;
    id v12 = 0;
  }
LABEL_21:

  return v27;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 publicSigningKey];

  if (v13)
  {
    id v14 = objc_alloc((Class)_SFEC_X962SigningOperation);
    id v15 = objc_msgSend(objc_alloc((Class)_SFECKeySpecifier), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
    id v16 = objc_alloc_init((Class)_SFSHA256DigestOperation);
    id v17 = [v14 initWithKeySpecifier:v15 digestOperation:v16];

    id v18 = objc_alloc((Class)_SFSignedData);
    id v19 = [(CKKSTLKShare *)self dataForSigning:v12];
    id v20 = [v18 initWithData:v19 signature:v10];

    id v21 = [v11 publicSigningKey];
    v22 = [v17 verify:v20 withKey:v21 error:a6];
    LOBYTE(a6) = v22 != 0;
  }
  else
  {
    id v23 = [(CKKSTLKShare *)self zoneID];
    v24 = [v23 zoneName];
    v25 = sub_1002194F8(@"ckksshare", v24);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "no signing key for peer: %@", buf, 0xCu);
    }

    if (a6)
    {
      v26 = +[NSString stringWithFormat:@"Peer(%@) has no signing key", v11];
      *a6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:37 description:v26];

      LOBYTE(a6) = 0;
    }
  }

  return (char)a6;
}

- (id)signRecord:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)_SFEC_X962SigningOperation);
  id v11 = objc_msgSend(objc_alloc((Class)_SFECKeySpecifier), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
  id v12 = objc_alloc_init((Class)_SFSHA256DigestOperation);
  id v13 = [v10 initWithKeySpecifier:v11 digestOperation:v12];

  id v14 = [(CKKSTLKShare *)self dataForSigning:v8];

  id v15 = [v13 sign:v14 withKey:v9 error:a5];

  id v16 = [v15 signature];

  return v16;
}

- (id)dataForSigning:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableData);
  unint64_t v55 = [(CKKSTLKShare *)self version];
  [v6 appendBytes:&v55 length:8];
  v7 = [(CKKSTLKShare *)self receiverPeerID];
  id v8 = [v7 dataUsingEncoding:4];
  [v6 appendData:v8];

  id v9 = [(CKKSTLKShare *)self senderPeerID];
  id v10 = [v9 dataUsingEncoding:4];
  [v6 appendData:v10];

  id v11 = [(CKKSTLKShare *)self wrappedTLK];
  [v6 appendData:v11];

  int64_t v54 = [(CKKSTLKShare *)self curve];
  [v6 appendBytes:&v54 length:8];
  int64_t v53 = [(CKKSTLKShare *)self epoch];
  [v6 appendBytes:&v53 length:8];
  int64_t v52 = [(CKKSTLKShare *)self poisoned];
  [v6 appendBytes:&v52 length:8];
  if (v4)
  {
    long long v38 = v5;
    __int16 v42 = v6;
    id v12 = +[NSMutableDictionary dictionary];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v39 = v4;
    id v13 = [v4 allKeys];
    id v14 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v49;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (([v18 isEqualToString:@"sender"] & 1) == 0
            && ([v18 isEqualToString:@"receiver"] & 1) == 0
            && ([v18 isEqualToString:@"receiverPublicEncryptionKey"] & 1) == 0
            && ([v18 isEqualToString:@"curve"] & 1) == 0
            && ([v18 isEqualToString:@"epoch"] & 1) == 0
            && ([v18 isEqualToString:@"poisoned"] & 1) == 0
            && ([v18 isEqualToString:@"signature"] & 1) == 0
            && ([v18 isEqualToString:@"version"] & 1) == 0
            && ([v18 isEqualToString:@"parentkeyref"] & 1) == 0
            && ([v18 isEqualToString:@"wrappedkey"] & 1) == 0
            && ([v18 hasPrefix:@"server_"] & 1) == 0)
          {
            v40 = [v39 objectForKeyedSubscript:v18];
            [v12 setObject:v40 forKeyedSubscript:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v15);
    }

    id v19 = [v12 allKeys];
    id v20 = [v19 sortedArrayUsingSelector:"compare:"];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
    id v6 = v42;
    if (v22)
    {
      id v23 = v22;
      v24 = &_s21InternalSwiftProtobuf8_NameMapV0D11DescriptionO4sameyAEs12StaticStringV_tcAEmFWC_ptr;
      v25 = &_s21InternalSwiftProtobuf8_NameMapV0D11DescriptionO4sameyAEs12StaticStringV_tcAEmFWC_ptr;
      uint64_t v26 = *(void *)v45;
      do
      {
        BOOL v27 = 0;
        id v41 = v23;
        do
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v21);
          }
          id v28 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * (void)v27)];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = [v28 dataUsingEncoding:4];
            [v6 appendData:v29];
LABEL_28:

            goto LABEL_35;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v6 appendData:v28];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v29 = objc_alloc_init((Class)NSISO8601DateFormatter);
              v30 = [v29 stringForObjectValue:v28];
              [v30 dataUsingEncoding:4];
              uint64_t v31 = v26;
              uint64_t v32 = v24;
              id v33 = v21;
              id v34 = v12;
              long long v36 = v35 = v25;
              [v42 appendData:v36];

              v25 = v35;
              id v12 = v34;
              id v21 = v33;
              v24 = v32;
              uint64_t v26 = v31;
              id v23 = v41;

              id v6 = v42;
              goto LABEL_28;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v43 = (id)0xAAAAAAAAAAAAAAAALL;
              id v43 = [v28 unsignedLongLongValue];
              [v6 appendBytes:&v43 length:8];
            }
          }
LABEL_35:

          BOOL v27 = (char *)v27 + 1;
        }
        while (v23 != v27);
        id v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v23);
    }

    id v5 = v38;
    id v4 = v39;
  }

  return v6;
}

- (id)unwrapUsing:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)NSKeyedUnarchiver);
  id v8 = [(CKKSTLKShare *)self wrappedTLK];
  id v9 = [v7 initForReadingFromData:v8 error:0];

  id v10 = [objc_alloc((Class)_SFIESCiphertext) initWithCoder:v9];
  [v9 finishDecoding];
  id v11 = objc_msgSend(objc_alloc((Class)_SFIESOperation), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
  id v12 = [v6 encryptionKey];

  id v17 = 0;
  id v13 = [v11 decrypt:v10 withKey:v12 error:&v17];
  id v14 = v17;

  if (!v13 || v14)
  {
    id v15 = 0;
    if (a4) {
      *a4 = v14;
    }
  }
  else
  {
    id v15 = +[CKKSKeychainBackedKey loadFromProtobuf:v13 error:a4];
  }

  return v15;
}

- (id)wrap:(id)a3 publicKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v19 = 0;
  id v11 = [v8 serializeAsProtobuf:&v19];
  id v12 = v19;
  if (v11)
  {
    id v13 = objc_msgSend(objc_alloc((Class)_SFIESOperation), "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
    id v14 = [v13 encrypt:v11 withKey:v9 error:a5];
    id v16 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v14 encodeWithCoder:v16];
    id v17 = [v16 encodedData];
  }
  else
  {
    id v17 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v17;
}

- (id)description
{
  v3 = [(CKKSTLKShare *)self tlkUUID];
  id v4 = [(CKKSTLKShare *)self receiverPeerID];
  id v5 = [(CKKSTLKShare *)self senderPeerID];
  id v6 = +[NSString stringWithFormat:@"<CKKSTLKShareCore(%@): recv:%@ send:%@>", v3, v4, v5];

  return v6;
}

- (id)initForKey:(id)a3 senderPeerID:(id)a4 recieverPeerID:(id)a5 receiverEncPublicKeySPKI:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 wrappedKey:(id)a11 signature:(id)a12 zoneID:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id obj = a5;
  id v20 = a5;
  id v27 = a6;
  id v31 = a6;
  id v21 = a11;
  id v22 = a12;
  id v30 = a13;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShare;
  id v23 = [(CKKSTLKShare *)&v32 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_zoneID, a13);
    objc_storeStrong((id *)&v24->_tlkUUID, a3);
    objc_storeStrong((id *)&v24->_senderPeerID, a4);
    objc_storeStrong((id *)&v24->_receiverPeerID, obj);
    objc_storeStrong((id *)&v24->_receiverPublicEncryptionKeySPKI, v27);
    v24->_curve = a7;
    v24->_version = a8;
    v24->_epoch = a9;
    v24->_poisoned = a10;
    objc_storeStrong((id *)&v24->_wrappedTLK, a11);
    objc_storeStrong((id *)&v24->_signature, a12);
  }

  return v24;
}

- (id)init:(id)a3 sender:(id)a4 receiver:(id)a5 curve:(int64_t)a6 version:(unint64_t)a7 epoch:(int64_t)a8 poisoned:(int64_t)a9 zoneID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)CKKSTLKShare;
  id v20 = [(CKKSTLKShare *)&v32 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_zoneID, a10);
    v21->_curve = a6;
    v21->_version = a7;
    uint64_t v22 = [v16 uuid];
    tlkUUID = v21->_tlkUUID;
    v21->_tlkUUID = (NSString *)v22;

    uint64_t v24 = [v18 peerID];
    receiverPeerID = v21->_receiverPeerID;
    v21->_receiverPeerID = (NSString *)v24;

    uint64_t v26 = [v18 publicEncryptionKey];
    uint64_t v27 = [v26 keyData];
    receiverPublicEncryptionKeySPKI = v21->_receiverPublicEncryptionKeySPKI;
    v21->_receiverPublicEncryptionKeySPKI = (NSData *)v27;

    uint64_t v29 = [v17 peerID];
    senderPeerID = v21->_senderPeerID;
    v21->_senderPeerID = (NSString *)v29;

    v21->_epoch = a8;
    v21->_poisoned = a9;
  }

  return v21;
}

+ (id)share:(id)a3 as:(id)a4 to:(id)a5 epoch:(int64_t)a6 poisoned:(int64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [CKKSTLKShare alloc];
  id v17 = [v13 zoneID];
  id v18 = [(CKKSTLKShare *)v16 init:v13 sender:v14 receiver:v15 curve:4 version:0 epoch:a6 poisoned:a7 zoneID:v17];

  id v19 = [v15 publicEncryptionKey];

  id v33 = 0;
  id v20 = [v18 wrap:v13 publicKey:v19 error:&v33];
  id v21 = v33;
  [v18 setWrappedTLK:v20];

  if (v21)
  {
    uint64_t v22 = [v13 zoneID];
    id v23 = [v22 zoneName];
    uint64_t v24 = sub_1002194F8(@"ckksshare", v23);

    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412546;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v21;
    v25 = "couldn't share %@ (wrap failed): %@";
    goto LABEL_7;
  }
  uint64_t v26 = [v14 signingKey];
  id v32 = 0;
  uint64_t v27 = [v18 signRecord:v26 ckrecord:0 error:&v32];
  id v21 = v32;
  [v18 setSignature:v27];

  if (!v21)
  {
    id v30 = v18;
    goto LABEL_12;
  }
  id v28 = [v13 zoneID];
  uint64_t v29 = [v28 zoneName];
  uint64_t v24 = sub_1002194F8(@"ckksshare", v29);

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v21;
    v25 = "couldn't share %@ (signing failed): %@";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x16u);
  }
LABEL_8:

  if (a8)
  {
    id v21 = v21;
    id v30 = 0;
    *a8 = v21;
  }
  else
  {
    id v30 = 0;
  }
LABEL_12:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end