@interface _LTTranslationFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)clientBundleID;
- (NSString)errorsAsJSON;
- (NSString)safariVersion;
- (NSString)sessionID;
- (NSString)sourceContentAsJSON;
- (NSString)targetContentAsJSON;
- (NSURL)webpageURL;
- (_LTLocalePair)localePair;
- (_LTTranslationFeedback)initWithCoder:(id)a3;
- (int64_t)category;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setClientBundleID:(id)a3;
- (void)setErrorsAsJSON:(id)a3;
- (void)setLocalePair:(id)a3;
- (void)setSafariVersion:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceContentAsJSON:(id)a3;
- (void)setTargetContentAsJSON:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation _LTTranslationFeedback

- (void)encodeWithCoder:(id)a3
{
  sourceContentAsJSON = self->_sourceContentAsJSON;
  id v5 = a3;
  [v5 encodeObject:sourceContentAsJSON forKey:@"sourceContentAsJSON"];
  [v5 encodeObject:self->_targetContentAsJSON forKey:@"targetContentAsJSON"];
  [v5 encodeObject:self->_errorsAsJSON forKey:@"errorsAsJSON"];
  [v5 encodeObject:self->_safariVersion forKey:@"safariVersion"];
  [v5 encodeObject:self->_webpageURL forKey:@"webpageURL"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeObject:self->_sessionID forKey:@"sessionID"];
  [v5 encodeInteger:self->_category forKey:@"category"];
}

- (_LTTranslationFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationFeedback;
  id v5 = [(_LTTranslationFeedback *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceContentAsJSON"];
    sourceContentAsJSON = v5->_sourceContentAsJSON;
    v5->_sourceContentAsJSON = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentAsJSON"];
    targetContentAsJSON = v5->_targetContentAsJSON;
    v5->_targetContentAsJSON = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorsAsJSON"];
    errorsAsJSON = v5->_errorsAsJSON;
    v5->_errorsAsJSON = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"safariVersion"];
    safariVersion = v5->_safariVersion;
    v5->_safariVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webpageURL"];
    webpageURL = v5->_webpageURL;
    v5->_webpageURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v18;

    v5->_category = [v4 decodeIntegerForKey:@"category"];
    v20 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sourceContentAsJSON
{
  return self->_sourceContentAsJSON;
}

- (void)setSourceContentAsJSON:(id)a3
{
}

- (NSString)targetContentAsJSON
{
  return self->_targetContentAsJSON;
}

- (void)setTargetContentAsJSON:(id)a3
{
}

- (NSString)errorsAsJSON
{
  return self->_errorsAsJSON;
}

- (void)setErrorsAsJSON:(id)a3
{
}

- (NSString)safariVersion
{
  return self->_safariVersion;
}

- (void)setSafariVersion:(id)a3
{
}

- (NSURL)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_errorsAsJSON, 0);
  objc_storeStrong((id *)&self->_targetContentAsJSON, 0);

  objc_storeStrong((id *)&self->_sourceContentAsJSON, 0);
}

@end