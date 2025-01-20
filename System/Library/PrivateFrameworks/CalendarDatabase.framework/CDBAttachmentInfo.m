@interface CDBAttachmentInfo
- (CDBAttachmentInfo)initWithLegacyURL:(id)a3 url:(id)a4 localRelativePath:(id)a5;
- (NSString)localRelativePath;
- (NSURL)legacyURL;
- (NSURL)url;
@end

@implementation CDBAttachmentInfo

- (CDBAttachmentInfo)initWithLegacyURL:(id)a3 url:(id)a4 localRelativePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDBAttachmentInfo;
  v11 = [(CDBAttachmentInfo *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    legacyURL = v11->_legacyURL;
    v11->_legacyURL = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    localRelativePath = v11->_localRelativePath;
    v11->_localRelativePath = (NSString *)v16;
  }
  return v11;
}

- (NSURL)legacyURL
{
  return self->_legacyURL;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)localRelativePath
{
  return self->_localRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRelativePath, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_legacyURL, 0);
}

@end