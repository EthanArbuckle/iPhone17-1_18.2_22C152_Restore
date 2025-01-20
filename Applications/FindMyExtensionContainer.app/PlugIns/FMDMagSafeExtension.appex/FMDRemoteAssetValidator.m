@interface FMDRemoteAssetValidator
- (BOOL)isValidReponse:(id)a3 validationError:(id *)a4;
- (FMDRemoteAssetMIMETypeProviderType)mimeTypeProvider;
- (FMDRemoteAssetValidator)initWithRequestURL:(id)a3 mimeTypeProvider:(id)a4;
- (NSURL)requestURL;
- (void)setMimeTypeProvider:(id)a3;
- (void)setRequestURL:(id)a3;
@end

@implementation FMDRemoteAssetValidator

- (FMDRemoteAssetValidator)initWithRequestURL:(id)a3 mimeTypeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDRemoteAssetValidator;
  v9 = [(FMDRemoteAssetValidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    objc_storeStrong((id *)&v10->_mimeTypeProvider, a4);
  }

  return v10;
}

- (BOOL)isValidReponse:(id)a3 validationError:(id *)a4
{
  id v6 = a3;
  id v7 = [(FMDRemoteAssetValidator *)self mimeTypeProvider];
  id v8 = [(FMDRemoteAssetValidator *)self requestURL];
  v9 = [v8 pathExtension];
  v10 = [v7 mimeTypeForFileExtension:v9];

  v11 = [v6 MIMEType];
  objc_super v12 = [(FMDRemoteAssetValidator *)self requestURL];
  v13 = [v12 pathExtension];

  v14 = [v6 URL];

  v15 = [v14 pathExtension];

  if (v10 && v11 && [v10 length] && objc_msgSend(v11, "length"))
  {
    v16 = v10;
    v17 = v11;
LABEL_11:
    unsigned __int8 v18 = [v16 isEqualToString:v17];
    goto LABEL_25;
  }
  if (v13 && v15 && [v13 length] && objc_msgSend(v15, "length"))
  {
    v16 = v13;
    v17 = v15;
    goto LABEL_11;
  }
  if (a4)
  {
    if (v10 && v13 && [v10 length] && objc_msgSend(v13, "length"))
    {
      if (v11 && v15 && [v11 length] && objc_msgSend(v15, "length")) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 1;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.RemoteAssetValidation" code:v19 userInfo:0];
    unsigned __int8 v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
LABEL_25:

  return v18;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
}

- (FMDRemoteAssetMIMETypeProviderType)mimeTypeProvider
{
  return self->_mimeTypeProvider;
}

- (void)setMimeTypeProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeTypeProvider, 0);

  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end