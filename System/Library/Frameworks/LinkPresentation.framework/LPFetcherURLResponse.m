@interface LPFetcherURLResponse
- (LPFetcherURLResponse)initWithURL:(id)a3 fetcher:(id)a4;
- (NSURL)URL;
@end

@implementation LPFetcherURLResponse

- (LPFetcherURLResponse)initWithURL:(id)a3 fetcher:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherURLResponse;
  v8 = [(LPFetcherResponse *)&v12 initWithState:2 fetcher:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URL, a3);
    v10 = v9;
  }

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end