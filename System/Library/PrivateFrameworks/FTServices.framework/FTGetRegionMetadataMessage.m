@interface FTGetRegionMetadataMessage
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsHTTPHeaders;
- (FTGetRegionMetadataMessage)init;
- (NSDictionary)responseRegionInformation;
- (NSString)language;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setResponseRegionInformation:(id)a3;
@end

@implementation FTGetRegionMetadataMessage

- (FTGetRegionMetadataMessage)init
{
  v10.receiver = self;
  v10.super_class = (Class)FTGetRegionMetadataMessage;
  v2 = [(IDSBaseMessage *)&v10 init];
  if (v2)
  {
    IMGetConferenceSettings();
    id v3 = 0;
    v6 = objc_msgSend_lastObject(v3, v4, v5);
    objc_msgSend_setTopic_(v2, v7, (uint64_t)v6);

    objc_msgSend_setWantsResponse_(v2, v8, 1);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)FTGetRegionMetadataMessage;
  id v4 = [(IDSBaseMessage *)&v14 copyWithZone:a3];
  v7 = objc_msgSend_language(self, v5, v6);
  objc_msgSend_setLanguage_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_responseRegionInformation(self, v9, v10);
  objc_msgSend_setResponseRegionInformation_(v4, v12, (uint64_t)v11);

  return v4;
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsBAASigning
{
  return 1;
}

- (int64_t)command
{
  return 96;
}

- (int64_t)responseCommand
{
  return 97;
}

- (BOOL)wantsHTTPGet
{
  return 1;
}

- (id)bagKey
{
  return @"vc-profile-get-region-metadata";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend_addObject_(v2, v3, @"accept-language");

  return v2;
}

- (id)messageBody
{
  id v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = objc_msgSend_language(self, v4, v5);
  if (v6)
  {
    CFDictionarySetValue(v3, @"accept-language", v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFF270();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  objc_msgSend_objectForKey_(a3, a2, @"regions");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseRegionInformation_(self, v4, (uint64_t)v5);
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSDictionary)responseRegionInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setResponseRegionInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseRegionInformation, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end