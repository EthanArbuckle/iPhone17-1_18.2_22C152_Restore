@interface CKKSExternalTLKShare
+ (BOOL)supportsSecureCoding;
+ (id)parseFromJSONDict:(id)a3 error:(id *)a4;
+ (id)unstringifyPeerID:(id)a3;
- (CKKSExternalTLKShare)initWithCoder:(id)a3;
- (CKKSExternalTLKShare)initWithView:(id)a3 tlkUUID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 wrappedTLK:(id)a7 signature:(id)a8;
- (NSData)receiverPeerID;
- (NSData)senderPeerID;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)tlkUUID;
- (NSString)view;
- (id)description;
- (id)jsonDictionary;
- (id)stringifyPeerID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSExternalTLKShare

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_wrappedTLK, 0);
  objc_storeStrong((id *)&self->_senderPeerID, 0);
  objc_storeStrong((id *)&self->_receiverPeerID, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)senderPeerID
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)receiverPeerID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)jsonDictionary
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v15[0] = @"view";
  v14 = [(CKKSExternalTLKShare *)self view];
  v16[0] = v14;
  v15[1] = @"tlkUUID";
  v3 = [(CKKSExternalTLKShare *)self tlkUUID];
  v16[1] = v3;
  v15[2] = @"receiverPeerID";
  v4 = [(CKKSExternalTLKShare *)self receiverPeerID];
  v5 = [(CKKSExternalTLKShare *)self stringifyPeerID:v4];
  v16[2] = v5;
  v15[3] = @"senderPeerID";
  v6 = [(CKKSExternalTLKShare *)self senderPeerID];
  v7 = [(CKKSExternalTLKShare *)self stringifyPeerID:v6];
  v16[3] = v7;
  v15[4] = @"wrappedTLK";
  v8 = [(CKKSExternalTLKShare *)self wrappedTLK];
  v9 = [v8 base64EncodedStringWithOptions:0];
  v16[4] = v9;
  v15[5] = @"signature";
  v10 = [(CKKSExternalTLKShare *)self signature];
  v11 = [v10 base64EncodedStringWithOptions:0];
  v16[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSExternalTLKShare *)self view];
  [v4 encodeObject:v5 forKey:@"view"];

  v6 = [(CKKSExternalTLKShare *)self tlkUUID];
  [v4 encodeObject:v6 forKey:@"tlkUUID"];

  v7 = [(CKKSExternalTLKShare *)self receiverPeerID];
  [v4 encodeObject:v7 forKey:@"receiverPeerID"];

  v8 = [(CKKSExternalTLKShare *)self senderPeerID];
  [v4 encodeObject:v8 forKey:@"senderPeerID"];

  v9 = [(CKKSExternalTLKShare *)self wrappedTLK];
  [v4 encodeObject:v9 forKey:@"wrappedTLK"];

  id v10 = [(CKKSExternalTLKShare *)self signature];
  [v4 encodeObject:v10 forKey:@"signature"];
}

- (CKKSExternalTLKShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKKSExternalTLKShare;
  v5 = [(CKKSExternalTLKShare *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"view"];
    view = v5->_view;
    v5->_view = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlkUUID"];
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiverPeerID"];
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderPeerID"];
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedTLK"];
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CKKSExternalTLKShare *)self tlkUUID];
  v5 = [(CKKSExternalTLKShare *)self receiverPeerID];
  uint64_t v6 = [(CKKSExternalTLKShare *)self stringifyPeerID:v5];
  v7 = [(CKKSExternalTLKShare *)self senderPeerID];
  uint64_t v8 = [(CKKSExternalTLKShare *)self stringifyPeerID:v7];
  v9 = [v3 stringWithFormat:@"<CKKSExternalTLKShare(%@): recv:%@ send:%@@>", v4, v6, v8];

  return v9;
}

- (id)stringifyPeerID:(id)a3
{
  v3 = NSString;
  id v4 = [a3 base64EncodedStringWithOptions:0];
  v5 = [v3 stringWithFormat:@"spid-%@", v4];

  return v5;
}

- (CKKSExternalTLKShare)initWithView:(id)a3 tlkUUID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 wrappedTLK:(id)a7 signature:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CKKSExternalTLKShare;
  v18 = [(CKKSExternalTLKShare *)&v24 init];
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_view, a3);
    objc_storeStrong((id *)&v19->_tlkUUID, a4);
    objc_storeStrong((id *)&v19->_receiverPeerID, a5);
    objc_storeStrong((id *)&v19->_senderPeerID, a6);
    objc_storeStrong((id *)&v19->_wrappedTLK, a7);
    objc_storeStrong((id *)&v19->_signature, a8);
  }

  return v19;
}

+ (id)parseFromJSONDict:(id)a3 error:(id *)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"view"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"tlkUUID"];
  v9 = [v6 objectForKeyedSubscript:@"receiverPeerID"];
  uint64_t v10 = [a1 unstringifyPeerID:v9];

  v11 = [v6 objectForKeyedSubscript:@"senderPeerID"];
  uint64_t v12 = [a1 unstringifyPeerID:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v14 = [v6 objectForKeyedSubscript:@"wrappedTLK"];
  id v15 = (void *)[v13 initWithBase64EncodedString:v14 options:0];

  id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v17 = [v6 objectForKeyedSubscript:@"signature"];

  v18 = (void *)[v16 initWithBase64EncodedString:v17 options:0];
  if (v7 && v8 && v10 && v12 && v15 && v18)
  {
    objc_super v19 = [[CKKSExternalTLKShare alloc] initWithView:v7 tlkUUID:v8 receiverPeerID:v10 senderPeerID:v12 wrappedTLK:v15 signature:v18];
    goto LABEL_17;
  }
  v20 = [MEMORY[0x1E4F1CA48] array];
  id v21 = v20;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
    [v20 addObject:@"view"];
    if (v8)
    {
LABEL_10:
      if (v10) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  [v21 addObject:@"tlkUUID"];
  if (v10)
  {
LABEL_11:
    if (v12) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v21 addObject:@"receiverPeerID"];
  if (v12)
  {
LABEL_12:
    if (v15) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v21 addObject:@"senderPeerID"];
  if (v15)
  {
LABEL_13:
    if (v18) {
      goto LABEL_14;
    }
LABEL_25:
    [v21 addObject:@"signature"];
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_24:
  [v21 addObject:@"wrapppedTLK"];
  if (!v18) {
    goto LABEL_25;
  }
LABEL_14:
  if (a4)
  {
LABEL_15:
    id v22 = (void *)MEMORY[0x1E4F28C58];
    v26 = a4;
    uint64_t v23 = *MEMORY[0x1E4F28760];
    v28[0] = *MEMORY[0x1E4F28568];
    v28[1] = @"missingkeys";
    v29[0] = @"Missing some required field";
    v29[1] = v21;
    objc_super v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, v28, 2, v26);
    void *v27 = [v22 errorWithDomain:v23 code:-50 userInfo:v24];
  }
LABEL_16:

  objc_super v19 = 0;
LABEL_17:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)unstringifyPeerID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"spid-"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"spid-", "length")];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;
  if (v4) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end