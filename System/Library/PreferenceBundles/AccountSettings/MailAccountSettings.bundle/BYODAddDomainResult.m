@interface BYODAddDomainResult
- (BOOL)isDomainConnect;
- (BYODAddDomainResult)initWithDictionary:(id)a3;
- (NSString)domain;
- (void)setDomain:(id)a3;
- (void)setIsDomainConnect:(BOOL)a3;
@end

@implementation BYODAddDomainResult

- (BYODAddDomainResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYODAddDomainResult;
  v5 = [(BYODAddDomainResult *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"isDomainConnect"];
    v5->_isDomainConnect = [v8 BOOLValue];
  }
  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (BOOL)isDomainConnect
{
  return self->_isDomainConnect;
}

- (void)setIsDomainConnect:(BOOL)a3
{
  self->_isDomainConnect = a3;
}

- (void).cxx_destruct
{
}

@end