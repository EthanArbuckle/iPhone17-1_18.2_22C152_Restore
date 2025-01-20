@interface GEOThirdPartyLink
+ (id)thirdPartyLinkFromProto:(id)a3;
- (GEOThirdPartyLink)initWithAdamID:(id)a3 url:(id)a4;
- (NSString)adamID;
- (NSURL)url;
@end

@implementation GEOThirdPartyLink

+ (id)thirdPartyLinkFromProto:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (id *)a3;
  v4 = v3;
  if (v3)
  {
    -[GEOPDThirdPartyLink _readAdamId]((uint64_t)v3);
    BOOL v5 = v4[3] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = -[GEOPDThirdPartyLink url](v4);
  v8 = [v6 URLWithString:v7];

  if (v5 && v8)
  {
    v9 = [GEOThirdPartyLink alloc];
    v10 = -[GEOPDThirdPartyLink adamId](v4);
    v11 = [(GEOThirdPartyLink *)v9 initWithAdamID:v10 url:v8];
  }
  else
  {
    v12 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v5) {
        v13 = "YES";
      }
      else {
        v13 = "NO";
      }
      v14 = -[GEOPDThirdPartyLink url](v4);
      int v16 = 136315394;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Third party link could not be initialized because some data is missing.\nLink hasAdamID: %s, url: %@", (uint8_t *)&v16, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (GEOThirdPartyLink)initWithAdamID:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOThirdPartyLink;
  v8 = [(GEOThirdPartyLink *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    adamID = v8->_adamID;
    v8->_adamID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v8;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

@end