@interface AAiCloudTermsAgreeResponse
- (NSDictionary)acceptedTermsInfo;
@end

@implementation AAiCloudTermsAgreeResponse

- (NSDictionary)acceptedTermsInfo
{
  acceptedTermsInfo = self->_acceptedTermsInfo;
  if (!acceptedTermsInfo)
  {
    v4 = [(AAResponse *)self httpResponse];
    objc_msgSend(v4, "ak_acceptedTermsInfo");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_acceptedTermsInfo;
    self->_acceptedTermsInfo = v5;

    acceptedTermsInfo = self->_acceptedTermsInfo;
  }

  return acceptedTermsInfo;
}

- (void).cxx_destruct
{
}

@end