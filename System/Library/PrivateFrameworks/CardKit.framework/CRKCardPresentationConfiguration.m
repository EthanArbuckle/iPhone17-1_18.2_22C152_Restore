@interface CRKCardPresentationConfiguration
- (BOOL)loadsBundleProviders;
- (BOOL)respectsUserConsent;
- (CRContent)content;
- (CRKCardPresentationConfiguration)initWithCardRequest:(id)a3;
- (CRKCardPresentationConfiguration)initWithContent:(id)a3;
- (CRSCardRequest)cardRequest;
- (void)setLoadsBundleProviders:(BOOL)a3;
- (void)setRespectsUserConsent:(BOOL)a3;
@end

@implementation CRKCardPresentationConfiguration

- (CRKCardPresentationConfiguration)initWithContent:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F31618];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContent:v5 format:0];

  v7 = [(CRKCardPresentationConfiguration *)self initWithCardRequest:v6];
  return v7;
}

- (CRKCardPresentationConfiguration)initWithCardRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCardPresentationConfiguration;
  v6 = [(CRKCardPresentationConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cardRequest, a3);
    *(_WORD *)&v7->_respectsUserConsent = 257;
  }

  return v7;
}

- (CRContent)content
{
  return (CRContent *)[(CRSCardRequest *)self->_cardRequest content];
}

- (CRSCardRequest)cardRequest
{
  return self->_cardRequest;
}

- (BOOL)respectsUserConsent
{
  return self->_respectsUserConsent;
}

- (void)setRespectsUserConsent:(BOOL)a3
{
  self->_respectsUserConsent = a3;
}

- (BOOL)loadsBundleProviders
{
  return self->_loadsBundleProviders;
}

- (void)setLoadsBundleProviders:(BOOL)a3
{
  self->_loadsBundleProviders = a3;
}

- (void).cxx_destruct
{
}

@end