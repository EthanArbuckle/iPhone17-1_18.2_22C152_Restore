@interface BCSParsedURLData
+ (BOOL)supportsSecureCoding;
- (BCSParsedURLData)initWithCoder:(id)a3;
- (BCSParsedURLData)initWithURL:(id)a3;
- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4;
- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5;
- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5 preferredBundleID:(id)a6;
- (NSString)extraPreviewText;
- (NSString)preferredBundleID;
- (NSURL)url;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSParsedURLData

- (BCSParsedURLData)initWithURL:(id)a3
{
  return [(BCSParsedURLData *)self initWithURL:a3 type:1];
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4
{
  return [(BCSParsedURLData *)self initWithURL:a3 type:a4 extraPreviewText:0];
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5
{
  return [(BCSParsedURLData *)self initWithURL:a3 type:a4 extraPreviewText:a5 preferredBundleID:0];
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5 preferredBundleID:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCSParsedURLData;
  v14 = [(BCSParsedURLData *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v15->_type = a4;
    uint64_t v16 = [v12 copy];
    extraPreviewText = v15->_extraPreviewText;
    v15->_extraPreviewText = (NSString *)v16;

    if (v13)
    {
      v18 = (NSString *)v13;
    }
    else
    {
      v18 = +[BCSAppRanker bundleIdentifierOfLastUsedAppForURL:v15->_url];
    }
    preferredBundleID = v15->_preferredBundleID;
    v15->_preferredBundleID = v18;

    v20 = v15;
  }

  return v15;
}

- (BCSParsedURLData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"url");
  v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"type");
  v7 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"extraPreviewText");
  v8 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"preferredBundleID");

  v9 = -[BCSParsedURLData initWithURL:type:extraPreviewText:preferredBundleID:](self, "initWithURL:type:extraPreviewText:preferredBundleID:", v5, [v6 integerValue], v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_extraPreviewText forKey:@"extraPreviewText"];
  [v5 encodeObject:self->_preferredBundleID forKey:@"preferredBundleID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)preferredBundleID
{
  return self->_preferredBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBundleID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
}

@end