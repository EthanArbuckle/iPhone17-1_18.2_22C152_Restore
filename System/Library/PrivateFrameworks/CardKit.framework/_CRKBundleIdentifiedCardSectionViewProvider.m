@interface _CRKBundleIdentifiedCardSectionViewProvider
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)vetoDisplayOfCardSection:(id)a3;
- (CRCard)card;
- (CRKCardSectionViewProviding)realCardSectionViewProvider;
- (NSArray)viewConfigurations;
- (NSString)providerIdentifier;
- (unint64_t)displayPriorityForCardSection:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setRealCardSectionViewProvider:(id)a3;
@end

@implementation _CRKBundleIdentifiedCardSectionViewProvider

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = NSStringFromSelector(a3);
  v4 = NSStringFromSelector(sel_providerIdentifier);
  char v5 = [v3 isEqualToString:v4];

  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = objc_opt_respondsToSelector();
  }
  return v6 & 1;
}

- (BOOL)vetoDisplayOfCardSection:(id)a3
{
  return [(CRKCardSectionViewProviding *)self->_realCardSectionViewProvider vetoDisplayOfCardSection:a3];
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return [(CRKCardSectionViewProviding *)self->_realCardSectionViewProvider displayPriorityForCardSection:a3];
}

- (CRCard)card
{
  return (CRCard *)[(CRKCardSectionViewProviding *)self->_realCardSectionViewProvider card];
}

- (NSArray)viewConfigurations
{
  return (NSArray *)[(CRKCardSectionViewProviding *)self->_realCardSectionViewProvider viewConfigurations];
}

- (NSString)providerIdentifier
{
  return self->providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (CRKCardSectionViewProviding)realCardSectionViewProvider
{
  return self->_realCardSectionViewProvider;
}

- (void)setRealCardSectionViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realCardSectionViewProvider, 0);
  objc_storeStrong((id *)&self->viewConfigurations, 0);
  objc_storeStrong((id *)&self->card, 0);

  objc_storeStrong((id *)&self->providerIdentifier, 0);
}

@end