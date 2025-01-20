@interface MSMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isPending;
- (BOOL)requiresValidation;
- (BOOL)shouldExpire;
- (MSMessage)init;
- (MSMessage)initWithCoder:(id)a3;
- (MSMessage)initWithSession:(MSSession *)session;
- (MSMessageLayout)layout;
- (MSSession)session;
- (NSData)_data;
- (NSDate)time;
- (NSError)error;
- (NSString)accessibilityLabel;
- (NSString)breadcrumbText;
- (NSString)guid;
- (NSString)senderAddress;
- (NSString)statusText;
- (NSString)summaryText;
- (NSURL)URL;
- (NSUUID)senderParticipantIdentifier;
- (id)_payloadDataFromAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6;
- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6;
- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 allowDataPayloads:(BOOL)a5;
- (id)_sanitizedCopy;
- (id)_shallowCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_mergeSanitizedDataFromMessage:(id)a3;
- (void)_mergeSanitizedKeepingModifiedMessage:(id)a3;
- (void)_sanitize;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setBreadcrumbText:(id)a3;
- (void)setError:(NSError *)error;
- (void)setGuid:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setLayout:(MSMessageLayout *)layout;
- (void)setPending:(BOOL)a3;
- (void)setRequiresValidation:(BOOL)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSenderParticipantIdentifier:(id)a3;
- (void)setShouldExpire:(BOOL)shouldExpire;
- (void)setStatusText:(id)a3;
- (void)setSummaryText:(NSString *)summaryText;
- (void)setTime:(id)a3;
- (void)setURL:(NSURL *)URL;
- (void)set_data:(id)a3;
@end

@implementation MSMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessage)initWithSession:(MSSession *)session
{
  v5 = session;
  v9.receiver = self;
  v9.super_class = (Class)MSMessage;
  v6 = [(MSMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, session);
  }

  return v7;
}

- (MSMessage)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MSMessage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];
    session = v5->_session;
    v5->_session = (MSSession *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityLabel"];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusText"];
    statusText = v5->_statusText;
    v5->_statusText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summaryText"];
    summaryText = v5->_summaryText;
    v5->_summaryText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"breadcrumbText"];
    breadcrumbText = v5->_breadcrumbText;
    v5->_breadcrumbText = (NSString *)v16;

    v5->_shouldExpire = [v4 decodeBoolForKey:@"shouldExpire"];
    v5->_pending = [v4 decodeBoolForKey:@"pending"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDate *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:3];
    v22 = objc_msgSend(v20, "setWithArray:", v21, v34, v35);

    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"balloonLayout"];
    layout = v5->_layout;
    v5->_layout = (MSMessageLayout *)v23;

    v5->_isFromMe = [v4 decodeBoolForKey:@"isFromMe"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderPID"];
    senderParticipantIdentifier = v5->_senderParticipantIdentifier;
    v5->_senderParticipantIdentifier = (NSUUID *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
    guid = v5->_guid;
    v5->_guid = (NSString *)v29;

    v5->_requiresValidation = [v4 decodeBoolForKey:@"requiresValidation"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->__data;
    v5->__data = (NSData *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  session = self->_session;
  id v5 = a3;
  [v5 encodeObject:session forKey:@"session"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"accessibilityLabel"];
  [v5 encodeObject:self->_URL forKey:@"URL"];
  [v5 encodeObject:self->_statusText forKey:@"statusText"];
  [v5 encodeObject:self->_summaryText forKey:@"summaryText"];
  [v5 encodeObject:self->_breadcrumbText forKey:@"breadcrumbText"];
  [v5 encodeObject:self->_layout forKey:@"balloonLayout"];
  [v5 encodeBool:self->_shouldExpire forKey:@"shouldExpire"];
  [v5 encodeBool:self->_pending forKey:@"pending"];
  [v5 encodeObject:self->_time forKey:@"time"];
  [v5 encodeBool:self->_isFromMe forKey:@"isFromMe"];
  [v5 encodeObject:self->_senderParticipantIdentifier forKey:@"senderPID"];
  [v5 encodeObject:self->_senderAddress forKey:@"senderAddress"];
  [v5 encodeObject:self->_guid forKey:@"guid"];
  [v5 encodeBool:self->_requiresValidation forKey:@"requiresValidation"];
  [v5 encodeObject:self->__data forKey:@"data"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[MSMessage allocWithZone:](MSMessage, "allocWithZone:");
  uint64_t v6 = [(MSMessage *)self session];
  v7 = [(MSMessage *)v5 initWithSession:v6];

  uint64_t v8 = (void *)[(NSString *)self->_accessibilityLabel copyWithZone:a3];
  [(MSMessage *)v7 setAccessibilityLabel:v8];

  objc_super v9 = (void *)[(NSURL *)self->_URL copyWithZone:a3];
  [(MSMessage *)v7 setURL:v9];

  id v10 = [(MSMessageLayout *)self->_layout copyWithZone:a3];
  [(MSMessage *)v7 setLayout:v10];

  v11 = (void *)[(NSString *)self->_statusText copyWithZone:a3];
  [(MSMessage *)v7 setStatusText:v11];

  uint64_t v12 = (void *)[(NSString *)self->_summaryText copyWithZone:a3];
  [(MSMessage *)v7 setSummaryText:v12];

  v13 = (void *)[(NSString *)self->_breadcrumbText copyWithZone:a3];
  [(MSMessage *)v7 setBreadcrumbText:v13];

  [(MSMessage *)v7 setShouldExpire:self->_shouldExpire];
  [(MSMessage *)v7 setPending:self->_pending];
  uint64_t v14 = (void *)[(NSDate *)self->_time copyWithZone:a3];
  [(MSMessage *)v7 setTime:v14];

  v15 = (void *)[(NSUUID *)self->_senderParticipantIdentifier copyWithZone:a3];
  [(MSMessage *)v7 setSenderParticipantIdentifier:v15];

  uint64_t v16 = (void *)[(NSString *)self->_senderAddress copyWithZone:a3];
  [(MSMessage *)v7 setSenderAddress:v16];

  v17 = (void *)[(NSString *)self->_guid copyWithZone:a3];
  [(MSMessage *)v7 setGuid:v17];

  [(MSMessage *)v7 setIsFromMe:self->_isFromMe];
  [(MSMessage *)v7 setRequiresValidation:self->_requiresValidation];
  uint64_t v18 = (void *)[(NSData *)self->__data copyWithZone:a3];
  [(MSMessage *)v7 set_data:v18];

  return v7;
}

- (id)_shallowCopy
{
  v3 = [[MSMessage alloc] initWithSession:self->_session];
  [(MSMessage *)v3 setAccessibilityLabel:self->_accessibilityLabel];
  [(MSMessage *)v3 setURL:self->_URL];
  [(MSMessage *)v3 setLayout:self->_layout];
  [(MSMessage *)v3 setStatusText:self->_statusText];
  [(MSMessage *)v3 setSummaryText:self->_summaryText];
  [(MSMessage *)v3 setBreadcrumbText:self->_breadcrumbText];
  [(MSMessage *)v3 setShouldExpire:self->_shouldExpire];
  [(MSMessage *)v3 setPending:self->_pending];
  [(MSMessage *)v3 setTime:self->_time];
  [(MSMessage *)v3 setSenderParticipantIdentifier:self->_senderParticipantIdentifier];
  [(MSMessage *)v3 setSenderAddress:self->_senderAddress];
  [(MSMessage *)v3 setGuid:self->_guid];
  [(MSMessage *)v3 setIsFromMe:self->_isFromMe];
  [(MSMessage *)v3 setRequiresValidation:self->_requiresValidation];
  [(MSMessage *)v3 set_data:self->__data];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSMessage *)a3;
  if (v4 == self)
  {
    char v38 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      session = self->_session;
      v7 = [(MSMessage *)v5 session];
      if (session == v7 || [(MSSession *)session isEqual:v7])
      {
        URL = self->_URL;
        objc_super v9 = [(MSMessage *)v5 URL];
        if (URL == v9 || [(NSURL *)URL isEqual:v9])
        {
          accessibilityLabel = self->_accessibilityLabel;
          v11 = [(MSMessage *)v5 accessibilityLabel];
          if (accessibilityLabel == v11 || [(NSString *)accessibilityLabel isEqualToString:v11])
          {
            layout = self->_layout;
            v13 = [(MSMessage *)v5 layout];
            if (layout == v13 || [(MSMessageLayout *)layout isEqual:v13])
            {
              statusText = self->_statusText;
              v15 = [(MSMessage *)v5 statusText];
              if (statusText == v15 || [(NSString *)statusText isEqualToString:v15])
              {
                summaryText = self->_summaryText;
                v17 = [(MSMessage *)v5 summaryText];
                if ((summaryText == v17 || [(NSString *)summaryText isEqualToString:v17])
                  && (BOOL shouldExpire = self->_shouldExpire, shouldExpire == [(MSMessage *)v5 shouldExpire])
                  && (BOOL pending = self->_pending, pending == [(MSMessage *)v5 isPending]))
                {
                  senderParticipantIdentifier = self->_senderParticipantIdentifier;
                  v21 = [(MSMessage *)v5 senderParticipantIdentifier];
                  if (senderParticipantIdentifier == v21
                    || (v22 = senderParticipantIdentifier,
                        uint64_t v23 = v21,
                        int v24 = [(NSUUID *)v22 isEqual:v21],
                        v21 = v23,
                        v24))
                  {
                    v42 = v21;
                    senderAddress = self->_senderAddress;
                    v26 = [(MSMessage *)v5 senderAddress];
                    if (senderAddress == v26
                      || (uint64_t v27 = senderAddress,
                          v28 = v26,
                          int v29 = [(NSString *)v27 isEqual:v26],
                          v26 = v28,
                          v29))
                    {
                      v41 = v26;
                      guid = self->_guid;
                      uint64_t v31 = [(MSMessage *)v5 guid];
                      if (guid == v31
                        || (v32 = guid, v33 = v31, v34 = [(NSString *)v32 isEqual:v31], uint64_t v31 = v33, v34))
                      {
                        v40 = v31;
                        BOOL requiresValidation = self->_requiresValidation;
                        if (requiresValidation == [(MSMessage *)v5 requiresValidation])
                        {
                          data = self->__data;
                          uint64_t v37 = [(MSMessage *)v5 _data];
                          if (data == v37) {
                            char v38 = 1;
                          }
                          else {
                            char v38 = [(NSData *)data isEqual:v37];
                          }
                        }
                        else
                        {
                          char v38 = 0;
                        }
                        uint64_t v31 = v40;
                      }
                      else
                      {
                        char v38 = 0;
                      }

                      v26 = v41;
                    }
                    else
                    {
                      char v38 = 0;
                    }

                    v21 = v42;
                  }
                  else
                  {
                    char v38 = 0;
                  }
                }
                else
                {
                  char v38 = 0;
                }
              }
              else
              {
                char v38 = 0;
              }
            }
            else
            {
              char v38 = 0;
            }
          }
          else
          {
            char v38 = 0;
          }
        }
        else
        {
          char v38 = 0;
        }
      }
      else
      {
        char v38 = 0;
      }
    }
    else
    {
      char v38 = 0;
    }
  }

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MSSession *)self->_session hash];
  NSUInteger v4 = [(NSString *)self->_accessibilityLabel hash] ^ v3;
  uint64_t v5 = [(MSMessageLayout *)self->_layout hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSURL *)self->_URL hash];
  NSUInteger v7 = [(NSString *)self->_statusText hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_summaryText hash] ^ self->_shouldExpire;
  BOOL isFromMe = self->_isFromMe;
  uint64_t v10 = isFromMe ^ [(NSUUID *)self->_senderParticipantIdentifier hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_senderAddress hash];
  return v8 ^ v11 ^ [(NSString *)self->_guid hash];
}

- (MSMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSMessage;
  return [(MSMessage *)&v3 init];
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v5 = URL;
  NSUInteger v7 = self->_URL;
  p_URL = &self->_URL;
  v17 = v5;
  if ((-[NSURL isEqual:](v7, "isEqual:") & 1) == 0)
  {
    uint64_t v8 = [(NSURL *)v17 scheme];
    if (!v8)
    {
LABEL_7:
      objc_storeStrong((id *)p_URL, URL);
      goto LABEL_8;
    }
    objc_super v9 = (void *)v8;
    uint64_t v10 = [(NSURL *)v17 scheme];
    NSUInteger v11 = [v10 lowercaseString];
    if ([v11 isEqualToString:@"http"])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v12 = [(NSURL *)v17 scheme];
    v13 = [v12 lowercaseString];
    if ([v13 isEqualToString:@"https"])
    {

      goto LABEL_6;
    }
    uint64_t v14 = [(NSURL *)v17 scheme];
    v15 = [v14 lowercaseString];
    char v16 = [v15 isEqualToString:@"data"];

    if (v16) {
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (id)_sanitizedCopy
{
  v2 = [(MSMessage *)self _shallowCopy];
  [v2 _sanitize];

  return v2;
}

- (void)_sanitize
{
  objc_super v3 = [(MSMessage *)self layout];
  NSUInteger v4 = [v3 _sanitizedCopy];
  [(MSMessage *)self setLayout:v4];

  [(MSMessage *)self setStatusText:0];
  [(MSMessage *)self setSummaryText:0];
  [(MSMessage *)self setAccessibilityLabel:0];
  [(MSMessage *)self setSenderAddress:0];

  [(MSMessage *)self setGuid:0];
}

- (void)_mergeSanitizedDataFromMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 layout];
  [(MSMessage *)self setLayout:v5];

  uint64_t v6 = [v4 statusText];
  [(MSMessage *)self setStatusText:v6];

  NSUInteger v7 = [v4 summaryText];
  [(MSMessage *)self setSummaryText:v7];

  uint64_t v8 = [v4 accessibilityLabel];
  [(MSMessage *)self setAccessibilityLabel:v8];

  objc_super v9 = [v4 senderAddress];
  [(MSMessage *)self setSenderAddress:v9];

  id v10 = [v4 guid];

  [(MSMessage *)self setGuid:v10];
}

- (void)_mergeSanitizedKeepingModifiedMessage:(id)a3
{
  id v16 = a3;
  id v4 = [(MSMessage *)self layout];

  if (!v4)
  {
    uint64_t v5 = [v16 layout];
    [(MSMessage *)self setLayout:v5];
  }
  uint64_t v6 = [(MSMessage *)self statusText];

  if (!v6)
  {
    NSUInteger v7 = [v16 statusText];
    [(MSMessage *)self setStatusText:v7];
  }
  uint64_t v8 = [(MSMessage *)self summaryText];

  if (!v8)
  {
    objc_super v9 = [v16 summaryText];
    [(MSMessage *)self setSummaryText:v9];
  }
  id v10 = [(MSMessage *)self accessibilityLabel];

  if (!v10)
  {
    NSUInteger v11 = [v16 accessibilityLabel];
    [(MSMessage *)self setAccessibilityLabel:v11];
  }
  uint64_t v12 = [(MSMessage *)self senderAddress];

  if (!v12)
  {
    v13 = [v16 senderAddress];
    [(MSMessage *)self setSenderAddress:v13];
  }
  uint64_t v14 = [(MSMessage *)self guid];

  if (!v14)
  {
    v15 = [v16 guid];
    [(MSMessage *)self setGuid:v15];
  }
}

- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 allowDataPayloads:(BOOL)a5
{
  return [(MSMessage *)self _pluginPayloadWithAppIconData:a3 appName:a4 adamID:0 allowDataPayloads:a5];
}

- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6
{
  BOOL v6 = a6;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2050000000;
  uint64_t v12 = (void *)getCKBrowserItemPayloadClass_softClass;
  uint64_t v39 = getCKBrowserItemPayloadClass_softClass;
  if (!getCKBrowserItemPayloadClass_softClass)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __getCKBrowserItemPayloadClass_block_invoke;
    v35[3] = &unk_1E6E98778;
    v35[4] = &v36;
    __getCKBrowserItemPayloadClass_block_invoke((uint64_t)v35);
    uint64_t v12 = (void *)v37[3];
  }
  BOOL v33 = v6;
  v13 = v12;
  _Block_object_dispose(&v36, 8);
  uint64_t v14 = IMLogHandleForCategory();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[MSMessage _pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:](v13, v15);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[MSMessage _pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:]();
  }

  id v16 = objc_alloc_init(v13);
  v17 = [(MSMessage *)self layout];
  uint64_t v18 = [(MSMessage *)self layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v20 = [v17 alternateLayout];
LABEL_12:
    v21 = v20;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v17;
    goto LABEL_12;
  }
  v21 = 0;
LABEL_14:
  v22 = [v21 image];

  if (v22)
  {
    uint64_t v23 = [v21 image];
    int v24 = UIImageJPEGRepresentation(v23, 0.5);
    uint64_t v25 = +[_MSTempFileManager sharedInstance];
    v26 = [v25 writeTemporaryFileWithData:v24 type:*MEMORY[0x1E4F22610]];

    if (!v26) {
      goto LABEL_20;
    }
LABEL_19:
    v40[0] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v16 setAttachments:v28];

    goto LABEL_20;
  }
  uint64_t v27 = [v21 mediaFileURL];

  if (v27)
  {
    v26 = [v21 mediaFileURL];
    if (v26) {
      goto LABEL_19;
    }
  }
LABEL_20:
  int v29 = [(MSMessage *)self _payloadDataFromAppIconData:v34 appName:v10 adamID:v11 allowDataPayloads:v33];
  if (v29) {
    [v16 setData:v29];
  }
  v30 = [(MSMessage *)self summaryText];
  [v16 setBreadcrumbText:v30];

  uint64_t v31 = [(MSMessage *)self statusText];
  [v16 setStatusText:v31];

  objc_msgSend(v16, "setShouldExpire:", -[MSMessage shouldExpire](self, "shouldExpire"));
  objc_msgSend(v16, "setRequiresValidation:", -[MSMessage requiresValidation](self, "requiresValidation"));

  return v16;
}

- (id)_payloadDataFromAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6
{
  BOOL v6 = a6;
  v82[6] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = [(MSMessage *)self layout];
  v15 = [(MSMessage *)self session];
  id v16 = [v15 identifier];

  if (v16)
  {
    v17 = [(MSMessage *)self session];
    uint64_t v18 = [v17 identifier];
    [v13 setObject:v18 forKey:*MEMORY[0x1E4F6D338]];
  }
  v19 = [(MSMessage *)self URL];

  if (v19)
  {
    id v20 = [(MSMessage *)self URL];
    [v13 setObject:v20 forKey:*MEMORY[0x1E4F6D330]];
  }
  if (v6)
  {
    v21 = [(MSMessage *)self _data];

    if (v21)
    {
      v22 = [(MSMessage *)self _data];
      [v13 setObject:v22 forKey:*MEMORY[0x1E4F6D308]];
    }
  }
  uint64_t v23 = [(MSMessage *)self accessibilityLabel];

  if (v23)
  {
    int v24 = [(MSMessage *)self accessibilityLabel];
    [v13 setObject:v24 forKey:*MEMORY[0x1E4F6D2C8]];
  }
  if (v10)
  {
    uint64_t v25 = (void *)[v10 _FTCopyGzippedData];
    [v13 setObject:v25 forKey:*MEMORY[0x1E4F6D2E0]];
  }
  if (v11) {
    [v13 setObject:v11 forKey:*MEMORY[0x1E4F6D2E8]];
  }
  if (v12) {
    [v13 setObject:v12 forKey:*MEMORY[0x1E4F6D2D0]];
  }
  v26 = [(MSMessage *)self statusText];

  if (v26)
  {
    uint64_t v27 = [(MSMessage *)self statusText];
    [v13 setObject:v27 forKey:*MEMORY[0x1E4F6D328]];
  }
  v28 = [(MSMessage *)self summaryText];

  if (v28)
  {
    int v29 = [(MSMessage *)self summaryText];
    [v13 setObject:v29 forKey:*MEMORY[0x1E4F6D318]];
  }
  objc_opt_class();
  v30 = v14;
  v75 = v11;
  v76 = v10;
  v74 = v12;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = v14;
    v77 = 0;
    v73 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [v14 alternateLayout];
      uint64_t v33 = [v14 requiredCapabilities];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v77 = [v32 linkMetadata];
        uint64_t v31 = objc_alloc_init(MSMessageTemplateLayout);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v31 = v32;
          v77 = 0;
        }
        else
        {
          v77 = 0;
          uint64_t v31 = 0;
        }
      }
      v73 = (void *)v33;
    }
    else
    {
      v77 = 0;
      v73 = 0;
      uint64_t v31 = 0;
    }
  }
  v81[0] = *MEMORY[0x1E4F6CB38];
  uint64_t v34 = [(MSMessageTemplateLayout *)v31 caption];
  uint64_t v35 = (void *)v34;
  if (v34) {
    uint64_t v36 = (__CFString *)v34;
  }
  else {
    uint64_t v36 = &stru_1F4067188;
  }
  v82[0] = v36;
  v81[1] = *MEMORY[0x1E4F6CB58];
  uint64_t v37 = [(MSMessageTemplateLayout *)v31 subcaption];
  uint64_t v38 = (void *)v37;
  if (v37) {
    uint64_t v39 = (__CFString *)v37;
  }
  else {
    uint64_t v39 = &stru_1F4067188;
  }
  v82[1] = v39;
  v81[2] = *MEMORY[0x1E4F6CB50];
  uint64_t v40 = [(MSMessageTemplateLayout *)v31 trailingCaption];
  v41 = (void *)v40;
  if (v40) {
    v42 = (__CFString *)v40;
  }
  else {
    v42 = &stru_1F4067188;
  }
  v82[2] = v42;
  v81[3] = *MEMORY[0x1E4F6CB60];
  uint64_t v43 = [(MSMessageTemplateLayout *)v31 trailingSubcaption];
  v44 = (void *)v43;
  if (v43) {
    v45 = (__CFString *)v43;
  }
  else {
    v45 = &stru_1F4067188;
  }
  v82[3] = v45;
  v81[4] = *MEMORY[0x1E4F6CB48];
  uint64_t v46 = [(MSMessageTemplateLayout *)v31 imageTitle];
  v47 = (void *)v46;
  if (v46) {
    v48 = (__CFString *)v46;
  }
  else {
    v48 = &stru_1F4067188;
  }
  v82[4] = v48;
  v81[5] = *MEMORY[0x1E4F6CB40];
  uint64_t v49 = [(MSMessageTemplateLayout *)v31 imageSubtitle];
  v50 = (void *)v49;
  if (v49) {
    v51 = (__CFString *)v49;
  }
  else {
    v51 = &stru_1F4067188;
  }
  v82[5] = v51;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:6];

  v53 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v53);
  uint64_t v55 = *MEMORY[0x1E4F6D2F0];
  [v13 setObject:v54 forKey:*MEMORY[0x1E4F6D2F0]];
  uint64_t v56 = *MEMORY[0x1E4F6D2F8];
  [v13 setObject:v52 forKey:*MEMORY[0x1E4F6D2F8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = [MEMORY[0x1E4F1CA60] dictionary];
    [v57 setObject:MEMORY[0x1E4F1CC08] forKey:v56];
    v58 = (objc_class *)objc_opt_class();
    v59 = NSStringFromClass(v58);
    [v57 setObject:v59 forKey:v55];

    id v80 = 0;
    v60 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v57 requiringSecureCoding:1 error:&v80];
    id v61 = v80;
    v62 = v61;
    if (v60)
    {
      [v13 setObject:v60 forKey:*MEMORY[0x1E4F6D300]];
    }
    else
    {
      id v71 = v61;
      _IMWarn();
    }
  }
  if (v77)
  {
    id v79 = 0;
    v63 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v77 requiringSecureCoding:1 error:&v79];
    id v64 = v79;
    v65 = v64;
    if (v63)
    {
      if ([v63 length])
      {
        [v13 setObject:v63 forKey:*MEMORY[0x1E4F6D310]];
LABEL_59:

        goto LABEL_60;
      }
    }
    else
    {
      id v71 = v64;
    }
    _IMWarn();
    goto LABEL_59;
  }
LABEL_60:
  if (!objc_msgSend(v73, "count", v71)) {
    goto LABEL_67;
  }
  id v78 = 0;
  v66 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v73 requiringSecureCoding:1 error:&v78];
  id v67 = v78;
  v68 = v67;
  if (!v66)
  {
    id v72 = v67;
    goto LABEL_65;
  }
  if (![v66 length])
  {
LABEL_65:
    _IMWarn();
    goto LABEL_66;
  }
  [v13 setObject:v66 forKey:*MEMORY[0x1E4F6D320]];
LABEL_66:

LABEL_67:
  v69 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0, v72);

  return v69;
}

- (MSSession)session
{
  return self->_session;
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_BOOL pending = a3;
}

- (NSUUID)senderParticipantIdentifier
{
  return self->_senderParticipantIdentifier;
}

- (void)setSenderParticipantIdentifier:(id)a3
{
}

- (MSMessageLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(MSMessageLayout *)layout
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)shouldExpire
{
  return self->_shouldExpire;
}

- (void)setShouldExpire:(BOOL)shouldExpire
{
  self->_BOOL shouldExpire = shouldExpire;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(NSString *)summaryText
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(NSError *)error
{
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSData)_data
{
  return self->__data;
}

- (void)set_data:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_BOOL isFromMe = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (void)setRequiresValidation:(BOOL)a3
{
  self->_BOOL requiresValidation = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (NSString)breadcrumbText
{
  return self->_breadcrumbText;
}

- (void)setBreadcrumbText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbText, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->__data, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_senderParticipantIdentifier, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138413058;
  v2 = @"CKBrowserItemPayload";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_0_2();
  id v4 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessage.m";
  _os_log_error_impl(&dword_1E4A76000, v0, OS_LOG_TYPE_ERROR, "Failed to load weak link class: '%@': %s:%i (%s)", (uint8_t *)&v1, 0x26u);
}

- (void)_pluginPayloadWithAppIconData:(objc_class *)a1 appName:(NSObject *)a2 adamID:allowDataPayloads:.cold.2(objc_class *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v3 = NSStringFromClass(a1);
  int v4 = 138413058;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  OUTLINED_FUNCTION_0_2();
  NSUInteger v7 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessage.m";
  _os_log_debug_impl(&dword_1E4A76000, a2, OS_LOG_TYPE_DEBUG, "Loaded weak linked class: '%@': %s:%i (%s)", (uint8_t *)&v4, 0x26u);
}

@end