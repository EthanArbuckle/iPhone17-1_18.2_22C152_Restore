@interface BYODPurchaseURL
- (BYODPurchaseURL)initWithDictionary:(id)a3;
- (NSString)dnsProviderName;
- (NSString)purchaseURL;
- (void)setDnsProviderName:(id)a3;
- (void)setPurchaseURL:(id)a3;
@end

@implementation BYODPurchaseURL

- (BYODPurchaseURL)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODPurchaseURL;
  v5 = [(BYODPurchaseURL *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"purchaseDomainServerUrl"];
    purchaseURL = v5->_purchaseURL;
    v5->_purchaseURL = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"dnsProviderName"];
    dnsProviderName = v5->_dnsProviderName;
    v5->_dnsProviderName = (NSString *)v8;
  }
  return v5;
}

- (NSString)purchaseURL
{
  return self->_purchaseURL;
}

- (void)setPurchaseURL:(id)a3
{
}

- (NSString)dnsProviderName
{
  return self->_dnsProviderName;
}

- (void)setDnsProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsProviderName, 0);

  objc_storeStrong((id *)&self->_purchaseURL, 0);
}

@end