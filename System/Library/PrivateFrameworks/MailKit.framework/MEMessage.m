@interface MEMessage
+ (BOOL)extensionCanSetHeaderKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_protectedHeaders;
- (BOOL)isEqual:(id)a3;
- (MEEmailAddress)fromAddress;
- (MEMessage)initWithCoder:(id)a3;
- (MEMessage)initWithState:(int64_t)a3 encryptionState:(int64_t)a4 signatureState:(int64_t)a5 subject:(id)a6 recipients:(id)a7 from:(id)a8 dataSent:(id)a9 dateReceived:(id)a10 headers:(id)a11 rawData:(id)a12 senderMetadata:(id)a13;
- (MEMessageEncryptionState)encryptionState;
- (MEMessageRecipients)recipients;
- (MEMessageSenderMetadata)senderMetadata;
- (MEMessageState)state;
- (NSArray)allRecipientAddresses;
- (NSArray)bccAddresses;
- (NSArray)ccAddresses;
- (NSArray)replyToAddresses;
- (NSArray)toAddresses;
- (NSData)rawData;
- (NSDate)dateReceived;
- (NSDate)dateSent;
- (NSDictionary)headers;
- (NSString)ef_publicDescription;
- (NSString)subject;
- (id)_sanitaizedHeadersForHeaders:(id)a3;
- (int64_t)signatureState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSenderMetadata:(id)a3;
- (void)setSignatureState:(int64_t)a3;
@end

@implementation MEMessage

- (MEMessage)initWithState:(int64_t)a3 encryptionState:(int64_t)a4 signatureState:(int64_t)a5 subject:(id)a6 recipients:(id)a7 from:(id)a8 dataSent:(id)a9 dateReceived:(id)a10 headers:(id)a11 rawData:(id)a12 senderMetadata:(id)a13
{
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  id v17 = a11;
  id v27 = a12;
  id v26 = a13;
  v33.receiver = self;
  v33.super_class = (Class)MEMessage;
  v18 = [(MEMessage *)&v33 init];
  v19 = v18;
  if (v18)
  {
    v18->_state = a3;
    v18->_encryptionState = a4;
    v18->_signatureState = a5;
    objc_storeStrong((id *)&v18->_subject, a6);
    objc_storeStrong((id *)&v19->_fromAddress, a8);
    uint64_t v20 = [(MEMessage *)v19 _sanitaizedHeadersForHeaders:v17];
    headers = v19->_headers;
    v19->_headers = (NSDictionary *)v20;

    objc_storeStrong((id *)&v19->_recipients, a7);
    objc_storeStrong((id *)&v19->_dateSent, a9);
    objc_storeStrong((id *)&v19->_dateReceived, a10);
    objc_storeStrong((id *)&v19->_rawData, a12);
    objc_storeStrong((id *)&v19->_senderMetadata, a13);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)allRecipientAddresses
{
  return [(MEMessageRecipients *)self->_recipients allRecipients];
}

- (NSArray)toAddresses
{
  return [(MEMessageRecipients *)self->_recipients to];
}

- (NSArray)ccAddresses
{
  return [(MEMessageRecipients *)self->_recipients cc];
}

- (NSArray)bccAddresses
{
  return [(MEMessageRecipients *)self->_recipients bcc];
}

- (NSArray)replyToAddresses
{
  return [(MEMessageRecipients *)self->_recipients replyTo];
}

- (MEMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_state"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"EFPropertyKey_encryptionState"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"EFPropertyKey_signatureState"];
  id v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
  id v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_recipients"];
  v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_fromAddress"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"EFPropertyKey_headers"];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_dateSent"];
  dateSent = self->_dateSent;
  self->_dateSent = v13;

  v15 = v13;
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_dateReceived"];
  dateReceived = self->_dateReceived;
  self->_dateReceived = v16;

  v18 = v16;
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rawData"];
  rawData = self->_rawData;
  self->_rawData = v19;

  v21 = v19;
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_senderMetadata"];
  v23 = [(MEMessage *)self initWithState:v5 encryptionState:v6 signatureState:v7 subject:v27 recipients:v26 from:v25 dataSent:v15 dateReceived:v18 headers:v12 rawData:v21 senderMetadata:v22];

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  [v12 encodeInteger:self->_state forKey:@"EFPropertyKey_state"];
  [v12 encodeInteger:self->_encryptionState forKey:@"EFPropertyKey_encryptionState"];
  [v12 encodeInteger:self->_signatureState forKey:@"EFPropertyKey_signatureState"];
  id v4 = [(MEMessage *)self subject];
  [v12 encodeObject:v4 forKey:@"EFPropertyKey_subject"];

  uint64_t v5 = [(MEMessage *)self recipients];
  [v12 encodeObject:v5 forKey:@"EFPropertyKey_recipients"];

  uint64_t v6 = [(MEMessage *)self fromAddress];
  [v12 encodeObject:v6 forKey:@"EFPropertyKey_fromAddress"];

  uint64_t v7 = [(MEMessage *)self dateSent];
  [v12 encodeObject:v7 forKey:@"EFPropertyKey_dateSent"];

  v8 = [(MEMessage *)self dateReceived];
  [v12 encodeObject:v8 forKey:@"EFPropertyKey_dateReceived"];

  uint64_t v9 = [(MEMessage *)self headers];
  [v12 encodeObject:v9 forKey:@"EFPropertyKey_headers"];

  uint64_t v10 = [(MEMessage *)self rawData];
  [v12 encodeObject:v10 forKey:@"EFPropertyKey_rawData"];

  v11 = [(MEMessage *)self senderMetadata];
  [v12 encodeObject:v11 forKey:@"EFPropertyKey_senderMetadata"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    MEMessageState v7 = [(MEMessage *)self state];
    if (v7 == [v6 state]
      && (MEMessageEncryptionState v8 = -[MEMessage encryptionState](self, "encryptionState"), v8 == [v6 encryptionState]))
    {
      uint64_t v9 = [(MEMessage *)self subject];
      uint64_t v10 = [v6 subject];
      if ([v9 isEqual:v10])
      {
        v11 = [(MEMessage *)self recipients];
        id v12 = [v6 recipients];
        if ([v11 isEqual:v12])
        {
          uint64_t v20 = [(MEMessage *)self fromAddress];
          v13 = [v6 fromAddress];
          if ([v20 isEqual:v13])
          {
            v19 = [(MEMessage *)self senderMetadata];
            v18 = [v6 senderMetadata];
            if (EFObjectsAreEqual())
            {
              id v17 = [(MEMessage *)self headers];
              v14 = [v6 headers];
              char v15 = EFObjectsAreEqual();
            }
            else
            {
              char v15 = 0;
            }
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  MEMessageState v3 = [(MEMessage *)self state];
  MEMessageEncryptionState v4 = [(MEMessage *)self encryptionState];
  uint64_t v5 = [(MEMessage *)self subject];
  uint64_t v6 = [v5 hash];

  MEMessageState v7 = [(MEMessage *)self recipients];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(MEMessage *)self fromAddress];
  uint64_t v10 = [v9 hash];

  v11 = [(MEMessage *)self senderMetadata];
  uint64_t v12 = [v11 hash];

  v13 = [(MEMessage *)self headers];
  unint64_t v14 = 33 * (33 * (33 * (33 * (33 * (33 * v3 + v4) + v6) + v8) + v10) + v12)
      + [v13 hash]
      + 0x9EC41D4E1;

  return v14;
}

- (id)_sanitaizedHeadersForHeaders:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v13;
  uint64_t v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v13);
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
        uint64_t v9 = [v3 objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = v9;
          uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          uint64_t v10 = objc_msgSend(v9, "ef_filter:", &__block_literal_global_5);
        }
        v11 = (void *)v10;

        id v8 = v11;
LABEL_11:
        if ([v8 count]) {
          [v14 setObject:v8 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v4);
  }

  return v14;
}

uint64_t __42__MEMessage__sanitaizedHeadersForHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)ef_publicDescription
{
  id v3 = [MEMORY[0x263F3B360] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F3B310]) initWithStyle:2];
    uint64_t v6 = [(MEMessage *)self recipients];
    uint64_t v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = (void *)MEMORY[0x263F3B308];
    id v29 = (void *)v9;
    id v28 = [(MEMessage *)self fromAddress];
    id v27 = [v28 rawString];
    id v26 = [v10 emailAddressWithString:v27];
    v25 = objc_msgSend(v26, "ef_publicDescription");
    v24 = [v6 to];
    v23 = objc_msgSend(v24, "ef_compactMap:", &__block_literal_global_44);
    v22 = [v5 stringFromEmailAddressList:v23];
    uint64_t v21 = [v6 cc];
    uint64_t v20 = objc_msgSend(v21, "ef_compactMap:", &__block_literal_global_44);
    v19 = [v5 stringFromEmailAddressList:v20];
    long long v18 = [v6 bcc];
    long long v17 = objc_msgSend(v18, "ef_compactMap:", &__block_literal_global_44);
    v11 = [v5 stringFromEmailAddressList:v17];
    uint64_t v12 = (void *)MEMORY[0x263F3B388];
    id v13 = [(MEMessage *)self subject];
    id v14 = [v12 partiallyRedactedStringForString:v13 maximumUnredactedLength:3];
    long long v15 = [v7 stringWithFormat:@"<%@: %p>\nfromAddress: %@\nto: %@\ncc: %@\nbcc: %@\nsubject: %@\nstate: %ld", v29, self, v25, v22, v19, v11, v14, -[MEMessage state](self, "state")];
  }
  else
  {
    long long v15 = [(MEMessage *)self description];
  }
  return (NSString *)v15;
}

id __33__MEMessage_ef_publicDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F3B308];
  id v3 = [a2 rawString];
  int v4 = [v2 emailAddressWithString:v3];

  return v4;
}

+ (id)_protectedHeaders
{
  if (_protectedHeaders_onceToken != -1) {
    dispatch_once(&_protectedHeaders_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)_protectedHeaders_protectedHeaders;
  return v2;
}

void __30__MEMessage__protectedHeaders__block_invoke()
{
  v23[38] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F3B2C8];
  v23[0] = *MEMORY[0x263F3B238];
  v23[1] = v1;
  uint64_t v2 = *MEMORY[0x263F3B290];
  v23[2] = *MEMORY[0x263F3B1E8];
  v23[3] = v2;
  uint64_t v3 = *MEMORY[0x263F3B2A8];
  v23[4] = *MEMORY[0x263F3B1E0];
  v23[5] = v3;
  uint64_t v4 = *MEMORY[0x263F3B298];
  v23[6] = *MEMORY[0x263F3B2B8];
  v23[7] = v4;
  uint64_t v5 = *MEMORY[0x263F3B2C0];
  v23[8] = *MEMORY[0x263F3B280];
  v23[9] = v5;
  uint64_t v6 = *MEMORY[0x263F3B248];
  v23[10] = *MEMORY[0x263F3B230];
  v23[11] = v6;
  uint64_t v7 = *MEMORY[0x263F3B250];
  v23[12] = *MEMORY[0x263F3B270];
  v23[13] = v7;
  uint64_t v8 = *MEMORY[0x263F3B260];
  v23[14] = *MEMORY[0x263F3B258];
  v23[15] = v8;
  uint64_t v9 = *MEMORY[0x263F3B2B0];
  v23[16] = *MEMORY[0x263F3B2A0];
  v23[17] = v9;
  uint64_t v10 = *MEMORY[0x263F3B268];
  v23[18] = *MEMORY[0x263F3B278];
  v23[19] = v10;
  uint64_t v11 = *MEMORY[0x263F3B218];
  v23[20] = *MEMORY[0x263F3B220];
  v23[21] = v11;
  uint64_t v12 = *MEMORY[0x263F3B1F8];
  v23[22] = *MEMORY[0x263F3B1F0];
  v23[23] = v12;
  uint64_t v13 = *MEMORY[0x263F3B208];
  v23[24] = *MEMORY[0x263F3B200];
  v23[25] = v13;
  uint64_t v14 = *MEMORY[0x263F3B2F0];
  v23[26] = *MEMORY[0x263F3B210];
  v23[27] = v14;
  uint64_t v15 = *MEMORY[0x263F3B2D0];
  v23[28] = *MEMORY[0x263F3B2E0];
  v23[29] = v15;
  uint64_t v16 = *MEMORY[0x263F3B2E8];
  v23[30] = *MEMORY[0x263F3B2F8];
  v23[31] = v16;
  uint64_t v17 = *MEMORY[0x263F3B2D8];
  v23[32] = *MEMORY[0x263F3B1D8];
  v23[33] = v17;
  uint64_t v18 = *MEMORY[0x263F3B240];
  v23[34] = *MEMORY[0x263F3B288];
  v23[35] = v18;
  uint64_t v19 = *MEMORY[0x263F3B228];
  v23[36] = *MEMORY[0x263F3B1D0];
  v23[37] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:38];
  uint64_t v21 = [v0 setWithArray:v20];
  v22 = (void *)_protectedHeaders_protectedHeaders;
  _protectedHeaders_protectedHeaders = v21;
}

+ (BOOL)extensionCanSetHeaderKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _protectedHeaders];
  uint64_t v5 = [v3 lowercaseString];
  char v6 = [v4 containsObject:v5];

  return v6 ^ 1;
}

- (MEMessageState)state
{
  return self->_state;
}

- (MEMessageEncryptionState)encryptionState
{
  return self->_encryptionState;
}

- (NSString)subject
{
  return self->_subject;
}

- (MEEmailAddress)fromAddress
{
  return self->_fromAddress;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (MEMessageRecipients)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (int64_t)signatureState
{
  return self->_signatureState;
}

- (void)setSignatureState:(int64_t)a3
{
  self->_signatureState = a3;
}

- (MEMessageSenderMetadata)senderMetadata
{
  return self->_senderMetadata;
}

- (void)setSenderMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderMetadata, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_fromAddress, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end