@interface LPFetcherImageResponse
+ (BOOL)isValidMIMEType:(id)a3;
+ (id)imagePropertiesForFetcher:(id)a3;
+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5;
+ (id)responseForFetcher:(id)a3 withImage:(id)a4;
- (LPFetcherImageResponse)initWithImage:(id)a3 fetcher:(id)a4;
- (LPImage)image;
@end

@implementation LPFetcherImageResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isImageType:a3];
}

+ (id)imagePropertiesForFetcher:(id)a3
{
  v3 = objc_alloc_init(LPImageProperties);

  return v3;
}

+ (id)responseForFetcher:(id)a3 withImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [LPImage alloc];
    v9 = [a1 imagePropertiesForFetcher:v6];
    v10 = [(LPImage *)v8 initWithPlatformImage:v7 properties:v9];

    if (v10 && ![(LPImage *)v10 _isImperceptible]) {
      v11 = [[LPFetcherImageResponse alloc] initWithImage:v10 fetcher:v6];
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    v11 = [LPImage alloc];
    v12 = [a1 imagePropertiesForFetcher:v8];
    v13 = [(LPImage *)v11 initWithData:v9 MIMEType:v10 properties:v12];

    if (v13 && ![(LPImage *)v13 _isImperceptible]) {
      v14 = [[LPFetcherImageResponse alloc] initWithImage:v13 fetcher:v8];
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPFetcherImageResponse)initWithImage:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherImageResponse;
  id v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    id v10 = v9;
  }

  return v9;
}

- (LPImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end