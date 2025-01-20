@interface BEWebAppManifest
- (BEWebAppManifest)initWithJSONData:(id)a3 manifestURL:(id)a4;
- (NSData)jsonData;
- (NSURL)manifestURL;
@end

@implementation BEWebAppManifest

- (BEWebAppManifest)initWithJSONData:(id)a3 manifestURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BEWebAppManifest;
  v9 = [(BEWebAppManifest *)&v13 init];
  if (v9)
  {
    v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:0];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_storeStrong((id *)&v9->_jsonData, a3);
      objc_storeStrong((id *)&v9->_manifestURL, a4);
      v11 = v9;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSData)jsonData
{
  return self->_jsonData;
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);

  objc_storeStrong((id *)&self->_jsonData, 0);
}

@end