@interface IDSPendingOfflineMessageResponse
- (NSString)messageIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (int64_t)command;
- (void)setMessageIdentifier:(id)a3;
@end

@implementation IDSPendingOfflineMessageResponse

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IDSPendingOfflineMessageResponse;
  return [(IDSMessage *)&v4 copyWithZone:a3];
}

- (int64_t)command
{
  return 160;
}

- (id)messageBody
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)IDSPendingOfflineMessageResponse;
  v3 = [(IDSMessage *)&v23 messageBody];
  Mutable = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  CFDictionarySetValue(Mutable, @"scv", &unk_1EF028A50);
  uint64_t v11 = objc_msgSend_messageIdentifier(self, v8, v9, v10);
  if (v11)
  {
    v15 = (void *)v11;
    objc_msgSend_messageIdentifier(self, v12, v13, v14);
    id v16 = objc_claimAutoreleasedReturnValue();
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);

    if (v20)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v20, uu);
      jw_uuid_to_data();
      id v21 = 0;
      if (v21) {
        CFDictionarySetValue(Mutable, @"U", v21);
      }
    }
  }
  return Mutable;
}

- (NSString)messageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMessageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end