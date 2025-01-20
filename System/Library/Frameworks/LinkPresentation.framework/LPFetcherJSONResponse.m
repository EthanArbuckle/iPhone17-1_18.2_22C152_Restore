@interface LPFetcherJSONResponse
+ (BOOL)isValidMIMEType:(id)a3;
+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5;
- (LPFetcherJSONResponse)initWithRootObject:(id)a3 fetcher:(id)a4;
- (id)rootObject;
@end

@implementation LPFetcherJSONResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isJSONType:a3];
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v6 = a3;
  id v12 = 0;
  v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a4 options:0 error:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = [[LPFetcherErrorResponse alloc] initWithError:v8 fetcher:v6];
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  if (v7)
  {
    v9 = [[LPFetcherJSONResponse alloc] initWithRootObject:v7 fetcher:v6];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (LPFetcherJSONResponse)initWithRootObject:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherJSONResponse;
  id v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_rootObject, a3);
    v10 = v9;
  }

  return v9;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (void).cxx_destruct
{
}

@end