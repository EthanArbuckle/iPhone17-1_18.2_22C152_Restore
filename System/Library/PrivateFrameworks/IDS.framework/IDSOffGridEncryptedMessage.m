@interface IDSOffGridEncryptedMessage
+ (BOOL)supportsSecureCoding;
+ (id)_daemonListener;
+ (int64_t)maxPayloadSize;
- (IDSOffGridEncryptedMessage)initWithCoder:(id)a3;
- (IDSOffGridEncryptedMessage)initWithDictionaryMessage:(id)a3;
- (IDSOffGridEncryptedMessage)initWithMessage:(id)a3 senderURI:(id)a4 recipientURI:(id)a5 encryptionProperties:(id)a6;
- (IDSOffGridEncryptedMessage)initWithPayload:(id)a3 senderURI:(id)a4 recipientURI:(id)a5;
- (IDSOffGridEncryptedMessage)initWithSegments:(id)a3;
- (IDSOffGridEncryptionProperties)encryptionProperties;
- (IDSURI)recipientURI;
- (IDSURI)senderURI;
- (NSData)message;
- (NSDate)date;
- (NSNumber)pendingCount;
- (NSNumber)pendingTotalCount;
- (NSNumber)preferredService;
- (NSString)identifier;
- (NSString)recipientShortHandle;
- (NSString)senderShortHandle;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)payload;
- (id)splitMessageIntoMessagesThatFit;
- (int64_t)compare:(id)a3;
- (int64_t)maxPayloadSizeRemaining;
- (int64_t)preferredServiceType;
- (int64_t)serviceTypeFromNumber:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setEncryptionProperties:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPendingCount:(id)a3;
- (void)setPendingTotalCount:(id)a3;
- (void)setPreferredService:(id)a3;
- (void)setRecipientShortHandle:(id)a3;
- (void)setRecipientURI:(id)a3;
- (void)setSenderShortHandle:(id)a3;
- (void)setSenderURI:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IDSOffGridEncryptedMessage

+ (id)_daemonListener
{
  v2 = +[IDSDaemonController sharedInstance];
  v3 = [v2 listener];

  return v3;
}

+ (int64_t)maxPayloadSize
{
  v2 = [a1 _daemonListener];
  uint64_t v3 = [v2 maxIMLPayloadSize];

  return v3 - 3;
}

- (IDSOffGridEncryptedMessage)initWithMessage:(id)a3 senderURI:(id)a4 recipientURI:(id)a5 encryptionProperties:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSOffGridEncryptedMessage;
  v15 = [(IDSOffGridEncryptedMessage *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_message, a3);
    objc_storeStrong((id *)&v16->_senderURI, a4);
    objc_storeStrong((id *)&v16->_recipientURI, a5);
    objc_storeStrong((id *)&v16->_encryptionProperties, a6);
  }

  return v16;
}

- (IDSOffGridEncryptedMessage)initWithPayload:(id)a3 senderURI:(id)a4 recipientURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSOffGridEncryptedMessage;
  id v11 = [(IDSOffGridEncryptedMessage *)&v23 init];
  if (!v11)
  {
LABEL_7:
    id v12 = v11;
    goto LABEL_8;
  }
  if ((unint64_t)[v8 length] >= 4)
  {
    id v13 = objc_msgSend(v8, "subdataWithRange:", 0, 1);
    id v14 = objc_msgSend(v8, "subdataWithRange:", 1, 2);
    v15 = objc_msgSend(v8, "subdataWithRange:", 3, objc_msgSend(v8, "length") - 3);
    unsigned __int16 v22 = 0;
    [v14 getBytes:&v22 length:2];
    objc_storeStrong((id *)&v11->_message, v15);
    objc_storeStrong((id *)&v11->_senderURI, a4);
    objc_storeStrong((id *)&v11->_recipientURI, a5);
    v16 = objc_alloc_init(IDSOffGridEncryptionProperties);
    encryptionProperties = v11->_encryptionProperties;
    v11->_encryptionProperties = v16;

    objc_super v18 = [NSNumber numberWithUnsignedShort:v22];
    [(IDSOffGridEncryptionProperties *)v11->_encryptionProperties setRatchetCounter:v18];

    [(IDSOffGridEncryptionProperties *)v11->_encryptionProperties setEncryptionKeyID:v13];
    unint64_t v19 = [v8 length];
    if (v19 >= 0x13)
    {
      v20 = objc_msgSend(v8, "subdataWithRange:", v19 - 16, 16);
      [(IDSOffGridEncryptionProperties *)v11->_encryptionProperties setAuthTag:v20];
    }
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_8:

  return v12;
}

- (IDSOffGridEncryptedMessage)initWithDictionaryMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)IDSOffGridEncryptedMessage;
    v5 = [(IDSOffGridEncryptedMessage *)&v28 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"message"];
      message = v5->_message;
      v5->_message = (NSData *)v6;

      uint64_t v8 = [v4 objectForKeyedSubscript:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v8;

      uint64_t v10 = [v4 objectForKeyedSubscript:@"senderURI"];
      senderURI = v5->_senderURI;
      v5->_senderURI = (IDSURI *)v10;

      uint64_t v12 = [v4 objectForKeyedSubscript:@"recipientURI"];
      recipientURI = v5->_recipientURI;
      v5->_recipientURI = (IDSURI *)v12;

      id v14 = [IDSOffGridEncryptionProperties alloc];
      v15 = [v4 objectForKeyedSubscript:@"encryptionProperties"];
      uint64_t v16 = [(IDSOffGridEncryptionProperties *)v14 initWithDictionary:v15];
      encryptionProperties = v5->_encryptionProperties;
      v5->_encryptionProperties = (IDSOffGridEncryptionProperties *)v16;

      uint64_t v18 = [v4 objectForKeyedSubscript:@"date"];
      date = v5->_date;
      v5->_date = (NSDate *)v18;

      uint64_t v20 = [v4 objectForKeyedSubscript:@"pendingTotalCount"];
      pendingTotalCount = v5->_pendingTotalCount;
      v5->_pendingTotalCount = (NSNumber *)v20;

      uint64_t v22 = [v4 objectForKeyedSubscript:@"pendingCount"];
      pendingCount = v5->_pendingCount;
      v5->_pendingCount = (NSNumber *)v22;

      uint64_t v24 = [v4 objectForKeyedSubscript:@"preferredService"];
      preferredService = v5->_preferredService;
      v5->_preferredService = (NSNumber *)v24;
    }
    self = v5;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (IDSOffGridEncryptedMessage)initWithSegments:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [a3 sortedArrayUsingSelector:sel_compare_];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "message", (void)v22);
        id v11 = v10;
        if (v7) {
          [v7 appendData:v10];
        }
        else {
          v7 = (void *)[v10 mutableCopy];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  uint64_t v12 = [v4 firstObject];
  id v13 = (IDSOffGridEncryptedMessage *)[v12 copy];

  [(IDSOffGridEncryptedMessage *)v13 setMessage:v7];
  id v14 = [(IDSOffGridEncryptedMessage *)v13 encryptionProperties];
  [v14 setSegmentNumber:&unk_1EE28B3D0];

  v15 = [(IDSOffGridEncryptedMessage *)v13 encryptionProperties];
  [v15 setTotalSegments:&unk_1EE28B3D0];

  unint64_t v16 = [v7 length];
  if (v16 >= 0x13)
  {
    v17 = objc_msgSend(v7, "subdataWithRange:", v16 - 16, 16);
    uint64_t v18 = [(IDSOffGridEncryptedMessage *)v13 encryptionProperties];
    [v18 setAuthTag:v17];
  }
  unint64_t v19 = objc_msgSend(v4, "firstObject", (void)v22);
  uint64_t v20 = [v19 date];
  [(IDSOffGridEncryptedMessage *)v13 setDate:v20];

  return v13;
}

- (int64_t)maxPayloadSizeRemaining
{
  uint64_t v3 = [(id)objc_opt_class() maxPayloadSize];
  id v4 = [(IDSOffGridEncryptedMessage *)self message];
  int64_t v5 = v3 - [v4 length];

  return v5;
}

- (id)splitMessageIntoMessagesThatFit
{
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IDSOffGridEncryptedMessage *)self maxPayloadSizeRemaining];
  uint64_t v3 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_191A41628(self, v2, v3);
  }

  id v4 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_191A41588(self);
  }

  int64_t v5 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_191A414D0(self);
  }

  if (v2 < 0)
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = [(IDSOffGridEncryptedMessage *)self message];
    unint64_t v10 = [v9 length];
    uint64_t v11 = [(id)objc_opt_class() maxPayloadSize];
    uint64_t v12 = [v9 length];
    if (v10)
    {
      unint64_t v14 = 0;
      unint64_t v15 = v12 + v2;
      uint64_t v16 = 1;
      *(void *)&long long v13 = 134218752;
      long long v37 = v13;
      do
      {
        uint64_t v17 = objc_msgSend(v9, "length", v37);
        if (v15 >= v17 - v14) {
          unint64_t v18 = v17 - v14;
        }
        else {
          unint64_t v18 = v15;
        }
        unint64_t v19 = objc_msgSend(v9, "subdataWithRange:", v14, v18);
        uint64_t v20 = (void *)[(IDSOffGridEncryptedMessage *)self copy];
        v21 = [NSNumber numberWithUnsignedInteger:v16];
        long long v22 = [v20 encryptionProperties];
        [v22 setSegmentNumber:v21];

        [v20 setMessage:v19];
        [v38 addObject:v20];
        long long v23 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v37;
          v46 = self;
          __int16 v47 = 1024;
          int v48 = v16;
          __int16 v49 = 2048;
          unint64_t v50 = v18;
          __int16 v51 = 2048;
          v52 = v20;
          _os_log_debug_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEBUG, "%p - split message part %d {size: %lld, ptr: %p}", buf, 0x26u);
        }
        v14 += v18;

        ++v16;
        unint64_t v15 = v11;
      }
      while (v14 < v10);
      unint64_t v10 = v16 - 1;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v38;
    uint64_t v24 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v8);
          }
          objc_super v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v29 = [v28 encryptionProperties];
          v30 = [v29 segmentNumber];
          uint64_t v31 = [v30 integerValue];

          if (v31 != v10)
          {
            v32 = [v28 encryptionProperties];
            [v32 setAuthTag:0];
          }
          v33 = [NSNumber numberWithInteger:v10];
          v34 = [v28 encryptionProperties];
          [v34 setTotalSegments:v33];
        }
        uint64_t v25 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v25);
    }

    v35 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_191A41448((uint64_t)self, v10, v35);
    }
  }
  else
  {
    uint64_t v6 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
    [v6 setSegmentNumber:&unk_1EE28B3D0];

    v7 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
    [v7 setTotalSegments:&unk_1EE28B3D0];

    v53[0] = self;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
  uint64_t v6 = [v4 encryptionProperties];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  message = self->_message;
  if (message) {
    CFDictionarySetValue(v3, @"message", message);
  }
  identifier = self->_identifier;
  if (identifier) {
    CFDictionarySetValue(v4, @"identifier", identifier);
  }
  int64_t v7 = [(IDSOffGridEncryptionProperties *)self->_encryptionProperties dictionaryRepresentation];
  if (v7) {
    CFDictionarySetValue(v4, @"encryptionProperties", v7);
  }

  service = self->_service;
  if (service) {
    CFDictionarySetValue(v4, @"service", service);
  }
  id v9 = [(IDSURI *)self->_senderURI prefixedURI];
  if (v9) {
    CFDictionarySetValue(v4, @"senderURI", v9);
  }

  senderShortHandle = self->_senderShortHandle;
  if (senderShortHandle) {
    CFDictionarySetValue(v4, @"senderShortHandle", senderShortHandle);
  }
  uint64_t v11 = [(IDSURI *)self->_recipientURI prefixedURI];
  if (v11) {
    CFDictionarySetValue(v4, @"recipientURI", v11);
  }

  recipientShortHandle = self->_recipientShortHandle;
  if (recipientShortHandle) {
    CFDictionarySetValue(v4, @"recipientShortHandle", recipientShortHandle);
  }
  date = self->_date;
  if (date) {
    CFDictionarySetValue(v4, @"date", date);
  }
  pendingTotalCount = self->_pendingTotalCount;
  if (pendingTotalCount) {
    CFDictionarySetValue(v4, @"pendingTotalCount", pendingTotalCount);
  }
  pendingCount = self->_pendingCount;
  if (pendingCount) {
    CFDictionarySetValue(v4, @"pendingCount", pendingCount);
  }
  preferredService = self->_preferredService;
  if (preferredService) {
    CFDictionarySetValue(v4, @"preferredService", preferredService);
  }
  uint64_t v17 = (void *)[(__CFDictionary *)v4 copy];

  return v17;
}

- (id)payload
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v4 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
  int64_t v5 = [v4 encryptionKeyID];

  uint64_t v6 = objc_msgSend(v5, "subdataWithRange:", 0, 1);
  [v3 appendData:v6];

  int64_t v7 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v5 debugDescription];
    *(_DWORD *)buf = 134218498;
    v21 = self;
    __int16 v22 = 2112;
    unint64_t v23 = (unint64_t)v16;
    __int16 v24 = 2048;
    uint64_t v25 = [v3 length];
    _os_log_debug_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEBUG, "%p - payload call, added keyID %@ {len: %lld}", buf, 0x20u);
  }
  id v8 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
  id v9 = [v8 ratchetCounter];
  unsigned __int16 v10 = [v9 unsignedShortValue];

  unsigned __int16 v19 = v10;
  [v3 appendBytes:&v19 length:2];
  uint64_t v11 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v17 = v19;
    uint64_t v18 = [v3 length];
    *(_DWORD *)buf = 134218496;
    v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = v17;
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    _os_log_debug_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEBUG, "%p - payload call, added ratchet ctr %lld {len: %lld}", buf, 0x20u);
  }

  uint64_t v12 = [(IDSOffGridEncryptedMessage *)self message];
  [v3 appendData:v12];

  long long v13 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_191A417C8((uint64_t)self, v3);
  }

  unint64_t v14 = [MEMORY[0x1E4F6B460] IDSOffGridMessenger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_191A41734((uint64_t)self, v3);
  }

  return v3;
}

- (int64_t)preferredServiceType
{
  id v3 = [(IDSOffGridEncryptedMessage *)self preferredService];
  int64_t v4 = [(IDSOffGridEncryptedMessage *)self serviceTypeFromNumber:v3];

  return v4;
}

- (int64_t)serviceTypeFromNumber:(id)a3
{
  if (!a3) {
    return -1;
  }
  uint64_t v3 = [a3 integerValue];
  if (v3 == 1) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = -1;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(IDSOffGridEncryptedMessage *)self message];
  uint64_t v6 = [(IDSOffGridEncryptedMessage *)self senderURI];
  int64_t v7 = [(IDSOffGridEncryptedMessage *)self recipientURI];
  id v8 = [(IDSOffGridEncryptedMessage *)self encryptionProperties];
  id v9 = (void *)[v8 copy];
  unsigned __int16 v10 = (void *)[v4 initWithMessage:v5 senderURI:v6 recipientURI:v7 encryptionProperties:v9];

  uint64_t v11 = [(IDSOffGridEncryptedMessage *)self preferredService];
  [v10 setPreferredService:v11];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridEncryptedMessage)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
  unint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"senderURI"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"recipientURI"];
  int64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionProperties"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
  int64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"senderShortHandle"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"recipientShortHandle"];
  unint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  long long v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pendingTotalCount"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pendingCount"];
  id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"preferredService"];

  unsigned __int16 v10 = [[IDSOffGridEncryptedMessage alloc] initWithMessage:v18 senderURI:v14 recipientURI:v4 encryptionProperties:v5];
  [(IDSOffGridEncryptedMessage *)v10 setIdentifier:v17];
  [(IDSOffGridEncryptedMessage *)v10 setService:v6];
  [(IDSOffGridEncryptedMessage *)v10 setSenderShortHandle:v7];
  [(IDSOffGridEncryptedMessage *)v10 setRecipientShortHandle:v8];
  [(IDSOffGridEncryptedMessage *)v10 setDate:v15];
  [(IDSOffGridEncryptedMessage *)v10 setPendingTotalCount:v13];
  [(IDSOffGridEncryptedMessage *)v10 setPendingCount:v12];
  [(IDSOffGridEncryptedMessage *)v10 setPreferredService:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  message = self->_message;
  id v5 = a3;
  [v5 encodeObject:message forKey:@"message"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_senderURI forKey:@"senderURI"];
  [v5 encodeObject:self->_recipientURI forKey:@"recipientURI"];
  [v5 encodeObject:self->_encryptionProperties forKey:@"encryptionProperties"];
  [v5 encodeObject:self->_service forKey:@"service"];
  [v5 encodeObject:self->_senderShortHandle forKey:@"senderShortHandle"];
  [v5 encodeObject:self->_recipientShortHandle forKey:@"recipientShortHandle"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_pendingTotalCount forKey:@"pendingTotalCount"];
  [v5 encodeObject:self->_pendingCount forKey:@"pendingCount"];
  [v5 encodeObject:self->_preferredService forKey:@"preferredService"];
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (void)setSenderURI:(id)a3
{
}

- (IDSURI)recipientURI
{
  return self->_recipientURI;
}

- (void)setRecipientURI:(id)a3
{
}

- (IDSOffGridEncryptionProperties)encryptionProperties
{
  return self->_encryptionProperties;
}

- (void)setEncryptionProperties:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSNumber)pendingTotalCount
{
  return self->_pendingTotalCount;
}

- (void)setPendingTotalCount:(id)a3
{
}

- (NSNumber)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)senderShortHandle
{
  return self->_senderShortHandle;
}

- (void)setSenderShortHandle:(id)a3
{
}

- (NSString)recipientShortHandle
{
  return self->_recipientShortHandle;
}

- (void)setRecipientShortHandle:(id)a3
{
}

- (NSNumber)preferredService
{
  return self->_preferredService;
}

- (void)setPreferredService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredService, 0);
  objc_storeStrong((id *)&self->_recipientShortHandle, 0);
  objc_storeStrong((id *)&self->_senderShortHandle, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingCount, 0);
  objc_storeStrong((id *)&self->_pendingTotalCount, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_encryptionProperties, 0);
  objc_storeStrong((id *)&self->_recipientURI, 0);
  objc_storeStrong((id *)&self->_senderURI, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end