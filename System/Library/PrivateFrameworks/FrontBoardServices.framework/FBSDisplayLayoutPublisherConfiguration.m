@interface FBSDisplayLayoutPublisherConfiguration
- (NSString)domainIdentifier;
- (NSString)instanceIdentifier;
- (void)setDomainIdentifier:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
@end

@implementation FBSDisplayLayoutPublisherConfiguration

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end