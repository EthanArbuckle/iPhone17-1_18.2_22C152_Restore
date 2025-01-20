@interface BNBannerSourceTemplatePresentableSpecification
- (BNBannerSourceTemplatePresentableSpecification)initWithBSXPCCoder:(id)a3;
- (BNTemplateItemProviding)primaryTemplateItemProvider;
- (BNTemplateItemProviding)secondaryTemplateItemProvider;
- (BNTemplateViewProviding)leadingTemplateViewProvider;
- (BNTemplateViewProviding)trailingTemplateViewProvider;
- (BOOL)providesTemplateContent;
- (NSString)presentableAccessibilityIdentifier;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setLeadingTemplateViewProvider:(id)a3;
- (void)setPresentableAccessibilityIdentifier:(id)a3;
- (void)setPrimaryTemplateItemProvider:(id)a3;
- (void)setSecondaryTemplateItemProvider:(id)a3;
- (void)setTrailingTemplateViewProvider:(id)a3;
@end

@implementation BNBannerSourceTemplatePresentableSpecification

- (BOOL)providesTemplateContent
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BNBannerSourceTemplatePresentableSpecification;
  [(BNBannerSourcePresentableSpecification *)&v25 encodeWithBSXPCCoder:v4];
  leadingTemplateViewProvider = self->_leadingTemplateViewProvider;
  if (leadingTemplateViewProvider)
  {
    uint64_t v6 = objc_opt_class();
    v7 = leadingTemplateViewProvider;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    [v4 encodeObject:v9 forKey:@"leadingTemplateViewProvider"];
  }
  trailingTemplateViewProvider = self->_trailingTemplateViewProvider;
  if (trailingTemplateViewProvider)
  {
    uint64_t v11 = objc_opt_class();
    v12 = trailingTemplateViewProvider;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    [v4 encodeObject:v14 forKey:@"trailingTemplateViewProvider"];
  }
  primaryTemplateItemProvider = self->_primaryTemplateItemProvider;
  if (primaryTemplateItemProvider)
  {
    uint64_t v16 = objc_opt_class();
    v17 = primaryTemplateItemProvider;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    [v4 encodeObject:v19 forKey:@"primaryTemplateItemProvider"];
  }
  secondaryTemplateItemProvider = self->_secondaryTemplateItemProvider;
  if (secondaryTemplateItemProvider)
  {
    uint64_t v21 = objc_opt_class();
    v22 = secondaryTemplateItemProvider;
    if (v21)
    {
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    [v4 encodeObject:v24 forKey:@"secondaryTemplateItemProvider"];
  }
  if ([(NSString *)self->_presentableAccessibilityIdentifier length]) {
    [v4 encodeObject:self->_presentableAccessibilityIdentifier forKey:@"presentableAccessibilityIdentifier"];
  }
}

- (BNBannerSourceTemplatePresentableSpecification)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BNBannerSourceTemplatePresentableSpecification;
  v5 = [(BNBannerSourcePresentableSpecification *)&v17 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingTemplateViewProvider"];
    leadingTemplateViewProvider = v5->_leadingTemplateViewProvider;
    v5->_leadingTemplateViewProvider = (BNTemplateViewProviding *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingTemplateViewProvider"];
    trailingTemplateViewProvider = v5->_trailingTemplateViewProvider;
    v5->_trailingTemplateViewProvider = (BNTemplateViewProviding *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryTemplateItemProvider"];
    primaryTemplateItemProvider = v5->_primaryTemplateItemProvider;
    v5->_primaryTemplateItemProvider = (BNTemplateItemProviding *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTemplateItemProvider"];
    secondaryTemplateItemProvider = v5->_secondaryTemplateItemProvider;
    v5->_secondaryTemplateItemProvider = (BNTemplateItemProviding *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentableAccessibilityIdentifier"];
    presentableAccessibilityIdentifier = v5->_presentableAccessibilityIdentifier;
    v5->_presentableAccessibilityIdentifier = (NSString *)v14;
  }
  return v5;
}

- (BNTemplateViewProviding)leadingTemplateViewProvider
{
  return self->_leadingTemplateViewProvider;
}

- (void)setLeadingTemplateViewProvider:(id)a3
{
}

- (BNTemplateViewProviding)trailingTemplateViewProvider
{
  return self->_trailingTemplateViewProvider;
}

- (void)setTrailingTemplateViewProvider:(id)a3
{
}

- (BNTemplateItemProviding)primaryTemplateItemProvider
{
  return self->_primaryTemplateItemProvider;
}

- (void)setPrimaryTemplateItemProvider:(id)a3
{
}

- (BNTemplateItemProviding)secondaryTemplateItemProvider
{
  return self->_secondaryTemplateItemProvider;
}

- (void)setSecondaryTemplateItemProvider:(id)a3
{
}

- (NSString)presentableAccessibilityIdentifier
{
  return self->_presentableAccessibilityIdentifier;
}

- (void)setPresentableAccessibilityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentableAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryTemplateItemProvider, 0);
  objc_storeStrong((id *)&self->_primaryTemplateItemProvider, 0);
  objc_storeStrong((id *)&self->_trailingTemplateViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingTemplateViewProvider, 0);
}

@end