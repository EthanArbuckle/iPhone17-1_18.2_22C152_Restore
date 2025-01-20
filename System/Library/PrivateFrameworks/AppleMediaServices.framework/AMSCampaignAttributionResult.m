@interface AMSCampaignAttributionResult
- (AMSCampaignAttributionResult)initWithURL:(id)a3;
- (NSURL)redirectURL;
@end

@implementation AMSCampaignAttributionResult

- (AMSCampaignAttributionResult)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCampaignAttributionResult;
  v6 = [(AMSCampaignAttributionResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_redirectURL, a3);
  }

  return v7;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void).cxx_destruct
{
}

@end