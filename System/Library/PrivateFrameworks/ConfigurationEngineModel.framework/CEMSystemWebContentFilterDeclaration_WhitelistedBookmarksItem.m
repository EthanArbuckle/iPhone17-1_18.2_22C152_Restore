@interface CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithURL:(id)a3 withTitle:(id)a4;
+ (id)buildWithURL:(id)a3 withBookmarkPath:(id)a4 withTitle:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadBookmarkPath;
- (NSString)payloadTitle;
- (NSString)payloadURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadBookmarkPath:(id)a3;
- (void)setPayloadTitle:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"URL";
  v6[1] = @"BookmarkPath";
  v6[2] = @"Title";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 withBookmarkPath:(id)a4 withTitle:(id)a5
{
  id v7 = a5;
  v8 = (__CFString *)a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadURL:v9];

  if (v8) {
    v11 = v8;
  }
  else {
    v11 = @"The default bookmarks directory.";
  }
  [v10 setPayloadBookmarkPath:v11];

  [v10 setPayloadTitle:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithURL:(id)a3 withTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setPayloadURL:v6];

  [v7 setPayloadTitle:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"URL" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadURL = self->_payloadURL;
  self->_payloadURL = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BookmarkPath" isRequired:0 defaultValue:@"The default bookmarks directory." error:&v22];
    id v14 = v22;
    payloadBookmarkPath = self->_payloadBookmarkPath;
    self->_payloadBookmarkPath = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Title" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadTitle = self->_payloadTitle;
      self->_payloadTitle = v18;
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"URL" withValue:self->_payloadURL isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"BookmarkPath" withValue:self->_payloadBookmarkPath isRequired:0 defaultValue:@"The default bookmarks directory."];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Title" withValue:self->_payloadTitle isRequired:1 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemWebContentFilterDeclaration_WhitelistedBookmarksItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadURL copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadBookmarkPath copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadTitle copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (NSString)payloadBookmarkPath
{
  return self->_payloadBookmarkPath;
}

- (void)setPayloadBookmarkPath:(id)a3
{
}

- (NSString)payloadTitle
{
  return self->_payloadTitle;
}

- (void)setPayloadTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTitle, 0);
  objc_storeStrong((id *)&self->_payloadBookmarkPath, 0);

  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end