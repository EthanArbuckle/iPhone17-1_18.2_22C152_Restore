@interface BCMessage
+ (id)defaultBubbleTitleFor:(id)a3;
- (BCDictionarySerializable)rootObject;
- (BCImageStore)imageStore;
- (BCMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6;
- (BCMessage)initWithData:(id)a3 url:(id)a4 sessionIdentifier:(id)a5 isFromMe:(BOOL)a6;
- (BCMessageData)messageData;
- (BCMessageInfo)receivedMessage;
- (BCMessageInfo)replyMessage;
- (BOOL)isFromMe;
- (BOOL)isVersionSupported;
- (NSAttributedString)subtitle;
- (NSData)data;
- (NSDictionary)dictionaryValue;
- (NSString)accessibilityLabel;
- (NSString)messageGUID;
- (NSString)requestIdentifier;
- (NSString)rootKey;
- (NSString)subcaption;
- (NSString)summaryText;
- (NSString)title;
- (NSURL)url;
- (NSUUID)sessionIdentifier;
- (UIImage)image;
- (id)encodedStringForDictionary:(uint64_t)a1;
- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7;
- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6;
- (int64_t)style;
- (int64_t)type;
- (int64_t)version;
- (uint64_t)isAnyUnknownRootKey;
- (void)setAccessibilityLabel:(id)a3;
- (void)setSubcaption:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummaryText:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateTitles;
@end

@implementation BCMessage

- (BCMessage)initWithData:(id)a3 url:(id)a4 sessionIdentifier:(id)a5 isFromMe:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  v12 = [(BCMessage *)self initWithData:a3 url:a4 messageGUID:0 isFromMe:v6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_sessionIdentifier, a5);
  }

  return v13;
}

- (BCMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = LogCategory_Daemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v50 = [v10 description];
    v51 = [v11 description];
    *(_DWORD *)buf = 138412802;
    int64_t v75 = (int64_t)v50;
    __int16 v76 = 2112;
    int64_t v77 = (int64_t)v51;
    __int16 v78 = 1024;
    BOOL v79 = v6;
    _os_log_debug_impl(&dword_228C26000, v13, OS_LOG_TYPE_DEBUG, "BCMessage: initWithData: %@ url: %@ isFromMe: %d", buf, 0x1Cu);
  }
  v73.receiver = self;
  v73.super_class = (Class)BCMessage;
  v14 = [(BCMessage *)&v73 init];
  if (!v14) {
    goto LABEL_35;
  }
  v15 = [[BCMessageData alloc] initWithUrl:v11 data:v10];
  objc_storeStrong((id *)&v14->_messageData, v15);
  v16 = [(BCMessageData *)v15 combinedDictionary];

  if (!v16)
  {
    v47 = LogCategory_Daemon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_228C26000, v47, OS_LOG_TYPE_ERROR, "BCMessage: Error intializing, missing data", buf, 2u);
    }

    goto LABEL_22;
  }
  id v72 = v10;
  id v17 = v12;
  v18 = [(BCMessageData *)v15 combinedDictionary];
  v19 = [v18 objectForKeyedSubscript:@"version"];
  v20 = [(BCMessageData *)v15 combinedDictionary];
  v21 = v20;
  if (v19) {
    v22 = @"version";
  }
  else {
    v22 = @"mspVersion";
  }
  v23 = [v20 objectForKeyedSubscript:v22];

  v24 = v23;
  if (!v23)
  {
    v48 = LogCategory_Daemon();
    id v12 = v17;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_228C26000, v48, OS_LOG_TYPE_ERROR, "BCMessage: Cannot initialize with nil version", buf, 2u);
    }
    id v10 = v72;
    goto LABEL_21;
  }
  uint64_t v25 = [v23 integerValue];
  v14->_int64_t version = v25;
  if (v25 <= 0)
  {
    v48 = LogCategory_Daemon();
    id v12 = v17;
    id v10 = v72;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      int64_t version = v14->_version;
      *(_DWORD *)buf = 134217984;
      int64_t v75 = version;
      _os_log_error_impl(&dword_228C26000, v48, OS_LOG_TYPE_ERROR, "BCMessage: Unexpected payload version %ld", buf, 0xCu);
    }
LABEL_21:

LABEL_22:
    v49 = 0;
    goto LABEL_36;
  }
  v26 = [(BCMessageData *)v15 combinedDictionary];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"requestIdentifier"];

  id v12 = v17;
  id obj = (id)v27;
  if (v27)
  {
    v69 = v24;
    v28 = [BCImageStore alloc];
    v29 = [(BCMessageData *)v15 imagesArray];
    v30 = [(BCImageStore *)v28 initWithArray:v29];

    v31 = [(BCMessageData *)v15 combinedDictionary];
    v32 = [(BCMessage *)v14 rootKey];
    v33 = [v31 objectForKey:v32];

    v34 = [(BCImageStore *)v30 dictionary];
    v14->_isFromMe = v6;
    v68 = v30;
    objc_storeStrong((id *)&v14->_imageStore, v30);
    if ([(BCMessage *)v14 isVersionSupported])
    {
      v35 = [(BCMessage *)v14 makeRootObjectWithMessageData:v15 dictionary:v33 imageDictionary:v34 version:v14->_version];
      v36 = v34;
      rootObject = v14->_rootObject;
      v14->_rootObject = v35;
      v66 = v35;

      v38 = [BCMessageInfo alloc];
      v39 = [(BCMessageData *)v15 replyMessageDictionary];
      uint64_t v40 = [(BCMessageInfo *)v38 initWithDictionary:v39 imageDictionary:v36];
      replyMessage = v14->_replyMessage;
      v14->_replyMessage = (BCMessageInfo *)v40;

      v42 = [BCMessageInfo alloc];
      v43 = [(BCMessageData *)v15 receivedMessageDictionary];
      v44 = v42;
      v34 = v36;
      uint64_t v45 = [(BCMessageInfo *)v44 initWithDictionary:v43 imageDictionary:v36];
      receivedMessage = v14->_receivedMessage;
      v14->_receivedMessage = (BCMessageInfo *)v45;
    }
    else
    {
      v43 = LogCategory_Daemon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = [(BCMessage *)v14 type];
        int64_t v54 = v14->_version;
        *(_DWORD *)buf = 134218240;
        int64_t v75 = v53;
        __int16 v76 = 2048;
        int64_t v77 = v54;
        _os_log_impl(&dword_228C26000, v43, OS_LOG_TYPE_DEFAULT, "BCMessage: Cannot create rootObject for BCMessage of type %ld since version %ld of payload is not supported", buf, 0x16u);
      }
    }
    v55 = v69;

    objc_storeStrong((id *)&v14->_requestIdentifier, obj);
    v56 = LogCategory_Daemon();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      [(BCMessageData *)v15 combinedDictionary];
      v64 = v63 = v34;
      *(_DWORD *)buf = 138412290;
      int64_t v75 = (int64_t)v64;
      _os_log_debug_impl(&dword_228C26000, v56, OS_LOG_TYPE_DEBUG, "BCMessage: messageData: %@ ", buf, 0xCu);

      v34 = v63;
    }

    v57 = LogCategory_Daemon();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [(BCMessageData *)v15 combinedDictionary];
      [v67 objectForKeyedSubscript:@"version"];
      v71 = v33;
      v59 = v58 = v34;
      v60 = [(BCMessageData *)v15 combinedDictionary];
      v61 = [v60 objectForKeyedSubscript:@"mspVersion"];
      *(_DWORD *)buf = 138412546;
      int64_t v75 = (int64_t)v59;
      __int16 v76 = 2112;
      int64_t v77 = (int64_t)v61;
      _os_log_impl(&dword_228C26000, v57, OS_LOG_TYPE_DEFAULT, "BCMessage: version: %@ mspVersion: %@", buf, 0x16u);

      v55 = v69;
      v34 = v58;
      v33 = v71;
    }
    if (v12)
    {
      objc_storeStrong((id *)&v14->_messageGUID, a5);
      -[BCMessage updateTitles](v14);
    }

    id v10 = v72;
LABEL_35:
    v49 = v14;
    goto LABEL_36;
  }
  v52 = LogCategory_Daemon();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_228C26000, v52, OS_LOG_TYPE_ERROR, "BCMessage: Cannot initialize with nil request identifier", buf, 2u);
  }

  v49 = 0;
  id v10 = v72;
LABEL_36:

  return v49;
}

- (void)updateTitles
{
  if ([a1 isFromMe]) {
    [a1 replyMessage];
  }
  else {
  id v25 = [a1 receivedMessage];
  }
  v2 = [v25 title];
  [a1 setTitle:v2];

  v3 = [v25 alternateTitle];

  if (v3)
  {
    v4 = [v25 alternateTitle];
    [v25 setTitle:v4];
  }
  uint64_t v5 = [a1 title];
  if (!v5
    || (BOOL v6 = (void *)v5,
        [a1 rootKey],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"error"],
        v7,
        v6,
        v8))
  {
    v9 = +[BCMessage defaultBubbleTitleFor:a1];
    [v25 setTitle:v9];
  }
  uint64_t v10 = [v25 subtitle];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [a1 rootKey];
    char v13 = [v12 isEqualToString:@"error"];

    if ((v13 & 1) == 0)
    {
      id v14 = objc_alloc(MEMORY[0x263F086A0]);
      v15 = [v25 subtitle];
      v16 = (void *)[v14 initWithString:v15];
      [a1 setSubtitle:v16];
    }
  }
  id v17 = [a1 rootObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [[BCInternalAuthenticationManager alloc] initWithAuthenticationRequest:v17];
    v19 = [(BCInternalAuthenticationManager *)v18 title];
    [a1 setTitle:v19];

    id v20 = objc_alloc(MEMORY[0x263F086A0]);
    v21 = [(BCInternalAuthenticationManager *)v18 subtitle];
    v22 = (void *)[v20 initWithString:v21];
    [a1 setSubtitle:v22];
  }
  v23 = [a1 title];
  [a1 setSummaryText:v23];

  v24 = [a1 title];
  [a1 setAccessibilityLabel:v24];
}

- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)BCMessage;
  id v17 = [(BCMessage *)&v25 init];
  if (v17)
  {
    v17->_int64_t version = [v12 version];
    uint64_t v18 = [v12 requestIdentifier];
    requestIdentifier = v17->_requestIdentifier;
    v17->_requestIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_rootObject, a5);
    objc_storeStrong((id *)&v17->_internalRootKey, a4);
    v17->_isFromMe = 1;
    objc_storeStrong((id *)&v17->_replyMessage, a7);
    objc_storeStrong((id *)&v17->_receivedMessage, a6);
    uint64_t v20 = [v12 imageStore];
    imageStore = v17->_imageStore;
    v17->_imageStore = (BCImageStore *)v20;

    uint64_t v22 = [v12 messageGUID];
    messageGUID = v17->_messageGUID;
    v17->_messageGUID = (NSString *)v22;

    -[BCMessage updateTitles](v17);
  }

  return v17;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(BCMessage *)self rootObject];
  uint64_t v5 = [v4 dictionaryValue];
  BOOL v6 = [(BCMessage *)self rootKey];
  [v3 setObject:v5 forKey:v6];

  v7 = [(BCMessage *)self requestIdentifier];
  [v3 setObject:v7 forKey:@"requestIdentifier"];

  int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[BCMessage version](self, "version"));
  [v3 setObject:v8 forKey:@"version"];

  v9 = [(BCMessage *)self imageStore];
  uint64_t v10 = [v9 rawArray];

  if (v10)
  {
    id v11 = [(BCMessage *)self imageStore];
    id v12 = [v11 rawArray];
    [v3 setObject:v12 forKey:@"images"];
  }
  id v13 = [(BCMessage *)self receivedMessage];

  if (v13)
  {
    id v14 = [(BCMessage *)self receivedMessage];
    id v15 = [v14 dictionaryValue];
    [v3 setObject:v15 forKey:@"receivedMessage"];
  }
  id v16 = [(BCMessage *)self replyMessage];

  if (v16)
  {
    id v17 = [(BCMessage *)self replyMessage];
    uint64_t v18 = [v17 dictionaryValue];
    [v3 setObject:v18 forKey:@"replyMessage"];
  }
  v19 = (void *)[v3 copy];

  return (NSDictionary *)v19;
}

- (NSURL)url
{
  v3 = [(BCMessage *)self receivedMessage];
  v4 = [v3 dictionaryValue];
  uint64_t v5 = -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v4);

  BOOL v6 = [(BCMessage *)self replyMessage];
  v7 = [v6 dictionaryValue];
  int v8 = -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v7);

  v9 = [(BCMessage *)self dictionaryValue];
  uint64_t v10 = -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v9);

  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  if (v5)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"receivedMessage" value:v5];
    [v12 addObject:v13];
  }
  if (v8)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"replyMessage" value:v8];
    [v12 addObject:v14];
  }
  if (v10)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"images" value:v10];
    [v12 addObject:v15];
  }
  [v11 setQueryItems:v12];
  id v16 = [v11 URL];

  return (NSURL *)v16;
}

- (id)encodedStringForDictionary:(uint64_t)a1
{
  v2 = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    id v8 = 0;
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:a2 options:1 error:&v8];
    id v4 = v8;
    if (v4)
    {
      uint64_t v5 = LogCategory_Daemon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v4;
        _os_log_error_impl(&dword_228C26000, v5, OS_LOG_TYPE_ERROR, "BCMessage: error encoding dictionary %@", buf, 0xCu);
      }
      v2 = 0;
    }
    else
    {
      uint64_t v6 = [v3 base64EncodedDataWithOptions:0];

      uint64_t v5 = [[NSString alloc] initWithData:v6 encoding:4];
      v2 = -[NSString normalizedBase64Encoded](v5);
      v3 = (void *)v6;
    }
  }

  return v2;
}

- (NSData)data
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(BCMessage *)self dictionaryValue];
  id v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  return (NSData *)v4;
}

- (int64_t)style
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(BCMessage *)self isFromMe]) {
    [(BCMessage *)self replyMessage];
  }
  else {
  v3 = [(BCMessage *)self receivedMessage];
  }
  id v4 = [v3 style];

  uint64_t v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_228C26000, v5, OS_LOG_TYPE_DEFAULT, "BCMessage: style %@", (uint8_t *)&v8, 0xCu);
  }

  if ([v4 isEqualToString:@"small"])
  {
    int64_t v6 = 1;
  }
  else if ([v4 isEqualToString:@"large"])
  {
    int64_t v6 = 2;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)type
{
  v3 = [(BCMessage *)self rootKey];
  char v4 = [v3 isEqualToString:@"authenticate"];

  if (v4) {
    return 5;
  }
  int64_t v6 = [(BCMessage *)self rootKey];
  char v7 = [v6 isEqualToString:@"internalAuthenticate"];

  if (v7) {
    return 6;
  }
  int v8 = [(BCMessage *)self rootKey];
  char v9 = [v8 isEqualToString:@"content"];

  if (v9) {
    return 3;
  }
  uint64_t v10 = [(BCMessage *)self rootKey];
  char v11 = [v10 isEqualToString:@"listPicker"];

  if (v11) {
    return 1;
  }
  id v12 = [(BCMessage *)self rootKey];
  char v13 = [v12 isEqualToString:@"quick-reply"];

  if (v13) {
    return 8;
  }
  id v14 = [(BCMessage *)self rootKey];
  char v15 = [v14 isEqualToString:@"event"];

  if (v15) {
    return 2;
  }
  id v16 = [(BCMessage *)self rootKey];
  char v17 = [v16 isEqualToString:@"payment"];

  if (v17) {
    return 0;
  }
  uint64_t v18 = [(BCMessage *)self rootKey];
  char v19 = [v18 isEqualToString:@"dynamic"];

  if (v19) {
    return 7;
  }
  uint64_t v20 = [(BCMessage *)self rootKey];
  int v21 = [v20 isEqualToString:@"unknown"];

  if (v21) {
    return 9;
  }
  else {
    return 4;
  }
}

- (UIImage)image
{
  if ([(BCMessage *)self isFromMe]) {
    [(BCMessage *)self replyMessage];
  }
  else {
  v3 = [(BCMessage *)self receivedMessage];
  }
  char v4 = [v3 image];

  return (UIImage *)v4;
}

- (NSString)rootKey
{
  if (self)
  {
    internalRootKey = self->_internalRootKey;
    if (internalRootKey)
    {
      char v4 = internalRootKey;
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(BCMessage *)self messageData];
  int64_t v6 = [v5 combinedDictionary];
  char v4 = @"internalAuthenticate";
  char v7 = [v6 objectForKey:@"internalAuthenticate"];

  if (!v7)
  {
    int v8 = [(BCMessage *)self messageData];
    char v9 = [v8 combinedDictionary];
    char v4 = @"authenticate";
    uint64_t v10 = [v9 objectForKey:@"authenticate"];

    if (!v10)
    {
      char v11 = [(BCMessage *)self messageData];
      id v12 = [v11 combinedDictionary];
      char v4 = @"listPicker";
      char v13 = [v12 objectForKey:@"listPicker"];

      if (!v13)
      {
        id v14 = [(BCMessage *)self messageData];
        char v15 = [v14 combinedDictionary];
        char v4 = @"quick-reply";
        id v16 = [v15 objectForKey:@"quick-reply"];

        if (!v16)
        {
          char v17 = [(BCMessage *)self messageData];
          uint64_t v18 = [v17 combinedDictionary];
          char v4 = @"event";
          char v19 = [v18 objectForKey:@"event"];

          if (!v19)
          {
            uint64_t v20 = [(BCMessage *)self messageData];
            int v21 = [v20 combinedDictionary];
            char v4 = @"content";
            uint64_t v22 = [v21 objectForKey:@"content"];

            if (!v22)
            {
              v23 = [(BCMessage *)self messageData];
              v24 = [v23 combinedDictionary];
              char v4 = @"payment";
              objc_super v25 = [v24 objectForKey:@"payment"];

              if (!v25)
              {
                v26 = [(BCMessage *)self messageData];
                uint64_t v27 = [v26 combinedDictionary];
                char v4 = @"dynamic";
                uint64_t v28 = [v27 objectForKey:@"dynamic"];
                if (v28)
                {
                  v29 = (void *)v28;
                  v30 = [(BCMessage *)self messageData];
                  v31 = [v30 combinedDictionary];
                  v32 = [NSString stringWithFormat:@"%@.%@.%@", @"dynamic", @"data", @"encryptionKey"];
                  v33 = [v31 valueForKeyPath:v32];
                  uint64_t v34 = [v33 length];

                  if (!v34) {
                    goto LABEL_20;
                  }
                }
                else
                {
                }
                if (!+[BCFeatureFlag isFeatureEnabledForFeature:1])goto LABEL_25; {
                v35 = [(BCMessage *)self messageData];
                }
                v36 = [v35 combinedDictionary];
                char v4 = @"notification";
                v37 = [v36 objectForKey:@"notification"];

                if (!v37)
                {
LABEL_25:
                  if (-[BCMessage isAnyUnknownRootKey](self)) {
                    char v4 = @"unknown";
                  }
                  else {
                    char v4 = @"error";
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_20:

  return (NSString *)v4;
}

- (uint64_t)isAnyUnknownRootKey
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  if (qword_2682A35F8 != -1) {
    dispatch_once(&qword_2682A35F8, &__block_literal_global);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(a1, "messageData", 0);
  v3 = [v2 combinedDictionary];
  char v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (![(id)_MergedGlobals_4 containsObject:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          uint64_t v5 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = [v9 combinedDictionary];
  uint64_t v12 = [v11 objectForKey:@"internalAuthenticate"];
  if (v12)
  {
    char v13 = (void *)v12;
    BOOL v14 = [(BCMessage *)self isFromMe];

    if (v14)
    {
      char v15 = BCInternalAuthenticationResponse;
LABEL_7:
      uint64_t v18 = [[v15 alloc] initWithDictionary:v10];
LABEL_8:
      char v19 = (void *)v18;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v16 = [v9 combinedDictionary];
  char v17 = [v16 objectForKey:@"internalAuthenticate"];

  if (v17)
  {
    char v15 = BCInternalAuthenticationRequest;
    goto LABEL_7;
  }
  int v21 = [v9 combinedDictionary];
  uint64_t v22 = [v21 objectForKey:@"authenticate"];
  if (v22)
  {
    v23 = (void *)v22;
    BOOL v24 = [(BCMessage *)self isFromMe];

    if (v24)
    {
      uint64_t v18 = +[BCOAuth2ResponseFactory makeResponseObjectWithDictionary:v10 version:a6];
      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v25 = [v9 combinedDictionary];
  v26 = [v25 objectForKey:@"authenticate"];

  if (v26)
  {
    uint64_t v18 = +[BCOAuth2RequestFactory makeRequestObjectWithDictionary:v10 version:a6];
    goto LABEL_8;
  }
  char v19 = 0;
LABEL_9:

  return v19;
}

void __32__BCMessage_isAnyUnknownRootKey__block_invoke()
{
  v5[15] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFF9C0]);
  v5[0] = @"images";
  v5[1] = @"mspVersion";
  v5[2] = @"data";
  v5[3] = @"receivedMessage";
  v5[4] = @"replyMessage";
  v5[5] = @"requestIdentifier";
  v5[6] = @"version";
  v5[7] = @"authenticate";
  v5[8] = @"content";
  v5[9] = @"event";
  v5[10] = @"internalAuthenticate";
  v5[11] = @"dynamic";
  v5[12] = @"listPicker";
  v5[13] = @"payment";
  v5[14] = @"quick-reply";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:15];
  v2 = (void *)[v0 initWithArray:v1];

  if (+[BCFeatureFlag isFeatureEnabledForFeature:1]) {
    [v2 addObject:@"notification"];
  }
  uint64_t v3 = [v2 copy];
  char v4 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v3;
}

- (BOOL)isVersionSupported
{
  unint64_t v3 = [(BCMessage *)self type];
  if (v3 > 0xA || ((0x5FFu >> v3) & 1) == 0) {
    return 0;
  }
  int64_t v5 = qword_228C3ADE0[v3];
  return [(BCMessage *)self version] <= v5;
}

+ (id)defaultBubbleTitleFor:(id)a3
{
  id v3 = a3;
  char v4 = +[BCShared classBundle]();
  int64_t v5 = [v4 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_26DD2B2A8 table:0];

  if (v3)
  {
    uint64_t v6 = [v3 rootKey];
    if ([v6 isEqualToString:@"unknown"])
    {

LABEL_8:
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"ERROR_UNKNOWN_ROOT_KEY_iOS";
      goto LABEL_9;
    }
    char v7 = [v3 isVersionSupported];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
    int v8 = [v3 rootKey];
    if ([v8 isEqualToString:@"listPicker"])
    {
      int v9 = [v3 isFromMe];

      if (v9)
      {
        id v10 = +[BCShared classBundle]();
        long long v11 = v10;
        uint64_t v12 = @"DEFAULT_LIST_PICKER_SELECTED_TITLE";
LABEL_9:
        char v13 = [v10 localizedStringForKey:v12 value:&stru_26DD2B2A8 table:0];

        int64_t v5 = v11;
LABEL_10:

        int64_t v5 = v13;
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v16 = [v3 rootKey];
    int v17 = [v16 isEqualToString:@"listPicker"];

    if (v17)
    {
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"DEFAULT_LIST_PICKER_TITLE";
      goto LABEL_9;
    }
    uint64_t v18 = [v3 rootKey];
    if ([v18 isEqualToString:@"event"])
    {
      int v19 = [v3 isFromMe];

      if (v19)
      {
        id v10 = +[BCShared classBundle]();
        long long v11 = v10;
        uint64_t v12 = @"DEFAULT_TIME_PICKER_SELECTED_TITLE";
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v20 = [v3 rootKey];
    int v21 = [v20 isEqualToString:@"event"];

    if (v21)
    {
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"DEFAULT_TIME_PICKER_TITLE";
      goto LABEL_9;
    }
    uint64_t v22 = [v3 rootKey];
    int v23 = [v22 isEqualToString:@"payment"];

    if (v23)
    {
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"ERROR_APPLE_PAY_TITLE";
      goto LABEL_9;
    }
    BOOL v24 = [v3 rootKey];
    int v25 = [v24 isEqualToString:@"authenticate"];

    if (v25
      || ([v3 rootKey],
          v26 = objc_claimAutoreleasedReturnValue(),
          int v27 = [v26 isEqualToString:@"internalAuthenticate"],
          v26,
          v27))
    {
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"DEFAULT_ERROR_TITLE";
      goto LABEL_9;
    }
    uint64_t v28 = [v3 rootKey];
    if ([v28 isEqualToString:@"dynamic"])
    {
      int v29 = [v3 isFromMe];

      if (v29)
      {
        id v10 = +[BCShared classBundle]();
        long long v11 = v10;
        uint64_t v12 = @"DEFAULT_JITAPPKIT_SELECTED_TITLE";
        goto LABEL_9;
      }
    }
    else
    {
    }
    v30 = [v3 rootKey];
    int v31 = [v30 isEqualToString:@"dynamic"];

    if (v31)
    {
      id v10 = +[BCShared classBundle]();
      long long v11 = v10;
      uint64_t v12 = @"DEFAULT_JITAPPKIT_TITLE";
      goto LABEL_9;
    }
    if (+[BCFeatureFlag isFeatureEnabledForFeature:1])
    {
      v32 = [v3 rootKey];
      char v33 = [v32 isEqualToString:@"notification"];

      if (v33)
      {
        char v13 = @"Notification";
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  id v14 = v5;

  return v14;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BCDictionarySerializable)rootObject
{
  return self->_rootObject;
}

- (BCImageStore)imageStore
{
  return self->_imageStore;
}

- (BCMessageData)messageData
{
  return self->_messageData;
}

- (BCMessageInfo)receivedMessage
{
  return self->_receivedMessage;
}

- (BCMessageInfo)replyMessage
{
  return self->_replyMessage;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(id)a3
{
}

- (NSString)subcaption
{
  return self->_subcaption;
}

- (void)setSubcaption:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRootKey, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_subcaption, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_replyMessage, 0);
  objc_storeStrong((id *)&self->_receivedMessage, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end