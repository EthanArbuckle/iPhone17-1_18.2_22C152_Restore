@interface VSIdentityProviderStorefrontMetadata
- (BOOL)isFeatured;
- (NSNumber)sortOrdinal;
- (NSString)storefrontTwoCharCode;
- (void)setIsFeatured:(BOOL)a3;
- (void)setSortOrdinal:(id)a3;
- (void)setStorefrontTwoCharCode:(id)a3;
@end

@implementation VSIdentityProviderStorefrontMetadata

- (NSString)storefrontTwoCharCode
{
  return self->_storefrontTwoCharCode;
}

- (void)setStorefrontTwoCharCode:(id)a3
{
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (void)setIsFeatured:(BOOL)a3
{
  self->_isFeatured = a3;
}

- (NSNumber)sortOrdinal
{
  return self->_sortOrdinal;
}

- (void)setSortOrdinal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortOrdinal, 0);

  objc_storeStrong((id *)&self->_storefrontTwoCharCode, 0);
}

@end