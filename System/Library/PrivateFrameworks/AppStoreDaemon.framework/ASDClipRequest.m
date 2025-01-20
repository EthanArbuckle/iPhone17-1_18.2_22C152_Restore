@interface ASDClipRequest
+ (BOOL)supportsSecureCoding;
- (ASDClipRequest)initWithCoder:(id)a3;
- (ASDClipRequest)initWithDictionary:(id)a3;
- (BOOL)prefetchDecryption;
- (BOOL)thirdPartyWithNoAppReferrer;
- (NSData)placeholderArtwork;
- (NSDictionary)dictionary;
- (NSString)installSourceBundleID;
- (NSString)referrerType;
- (NSURL)sourceURL;
- (NSUUID)uniqueID;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallSourceBundleID:(id)a3;
- (void)setPlaceholderArtwork:(id)a3;
- (void)setPrefetchDecryption:(BOOL)a3;
- (void)setReferrerType:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setThirdPartyWithNoAppReferrer:(BOOL)a3;
@end

@implementation ASDClipRequest

- (ASDClipRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDClipRequest;
  v5 = [(ASDClipRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClipRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASDClipRequest;
  v5 = [(ASDClipRequest *)&v25 init];
  if (v5)
  {
    v5->_prefetchDecryption = [v4 decodeBoolForKey:@"_prefetchDecryption"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_placeholderArtwork"];
    placeholderArtwork = v5->_placeholderArtwork;
    v5->_placeholderArtwork = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_installSourceBundleID"];
    installSourceBundleID = v5->_installSourceBundleID;
    v5->_installSourceBundleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referrerType"];
    referrerType = v5->_referrerType;
    v5->_referrerType = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v22;

    v5->_thirdPartyWithNoAppReferrer = [v4 decodeBoolForKey:@"_thirdPartyWithNoAppReferrer"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL prefetchDecryption = self->_prefetchDecryption;
  id v5 = a3;
  [v5 encodeBool:prefetchDecryption forKey:@"_prefetchDecryption"];
  [v5 encodeObject:self->_placeholderArtwork forKey:@"_placeholderArtwork"];
  [v5 encodeObject:self->_uniqueID forKey:@"_uniqueID"];
  [v5 encodeObject:self->_dictionary forKey:@"_dictionary"];
  [v5 encodeObject:self->_installSourceBundleID forKey:@"_installSourceBundleID"];
  [v5 encodeObject:self->_referrerType forKey:@"_referrerType"];
  [v5 encodeObject:self->_sourceURL forKey:@"_sourceURL"];
  [v5 encodeBool:self->_thirdPartyWithNoAppReferrer forKey:@"_thirdPartyWithNoAppReferrer"];
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSData)placeholderArtwork
{
  return self->_placeholderArtwork;
}

- (void)setPlaceholderArtwork:(id)a3
{
}

- (BOOL)prefetchDecryption
{
  return self->_prefetchDecryption;
}

- (void)setPrefetchDecryption:(BOOL)a3
{
  self->_BOOL prefetchDecryption = a3;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)installSourceBundleID
{
  return self->_installSourceBundleID;
}

- (void)setInstallSourceBundleID:(id)a3
{
}

- (NSString)referrerType
{
  return self->_referrerType;
}

- (void)setReferrerType:(id)a3
{
}

- (BOOL)thirdPartyWithNoAppReferrer
{
  return self->_thirdPartyWithNoAppReferrer;
}

- (void)setThirdPartyWithNoAppReferrer:(BOOL)a3
{
  self->_thirdPartyWithNoAppReferrer = a3;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_referrerType, 0);
  objc_storeStrong((id *)&self->_installSourceBundleID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_placeholderArtwork, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end