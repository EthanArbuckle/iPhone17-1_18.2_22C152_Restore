@interface CSAddressingViewModel
+ (BOOL)supportsSecureCoding;
- (CSAddressingViewModel)initWithCoder:(id)a3;
- (CSAddressingViewModel)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9;
- (NSData)headerImageData;
- (NSString)headerTitle;
- (NSString)loadingText;
- (NSString)primaryButtonText;
- (NSString)secondaryButtonText;
- (NSString)supplementaryText;
- (NSString)userInfoText;
- (void)encodeWithCoder:(id)a3;
- (void)setHeaderImageData:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)setPrimaryButtonText:(id)a3;
- (void)setSecondaryButtonText:(id)a3;
- (void)setSupplementaryText:(id)a3;
- (void)setUserInfoText:(id)a3;
@end

@implementation CSAddressingViewModel

- (CSAddressingViewModel)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CSAddressingViewModel;
  v22 = [(CSAddressingViewModel *)&v25 init];
  v23 = v22;
  if (v22)
  {
    [(CSAddressingViewModel *)v22 setHeaderImageData:v15];
    [(CSAddressingViewModel *)v23 setHeaderTitle:v16];
    [(CSAddressingViewModel *)v23 setLoadingText:v17];
    [(CSAddressingViewModel *)v23 setSupplementaryText:v18];
    [(CSAddressingViewModel *)v23 setUserInfoText:v19];
    [(CSAddressingViewModel *)v23 setPrimaryButtonText:v20];
    [(CSAddressingViewModel *)v23 setSecondaryButtonText:v21];
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  headerImageData = self->_headerImageData;
  id v5 = a3;
  [v5 encodeObject:headerImageData forKey:@"headerImageData"];
  [v5 encodeObject:self->_headerTitle forKey:@"headerTitle"];
  [v5 encodeObject:self->_loadingText forKey:@"loadingText"];
  [v5 encodeObject:self->_supplementaryText forKey:@"supplementaryText"];
  [v5 encodeObject:self->_userInfoText forKey:@"userInfoText"];
  [v5 encodeObject:self->_primaryButtonText forKey:@"primaryButtonText"];
  [v5 encodeObject:self->_secondaryButtonText forKey:@"secondaryButtonText"];
}

- (CSAddressingViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSAddressingViewModel;
  id v5 = [(CSAddressingViewModel *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerImageData"];
    headerImageData = v5->_headerImageData;
    v5->_headerImageData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerTitle"];
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loadingText"];
    loadingText = v5->_loadingText;
    v5->_loadingText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementaryText"];
    supplementaryText = v5->_supplementaryText;
    v5->_supplementaryText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfoText"];
    userInfoText = v5->_userInfoText;
    v5->_userInfoText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryButtonText"];
    primaryButtonText = v5->_primaryButtonText;
    v5->_primaryButtonText = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryButtonText"];
    secondaryButtonText = v5->_secondaryButtonText;
    v5->_secondaryButtonText = (NSString *)v18;
  }
  return v5;
}

- (NSData)headerImageData
{
  return self->_headerImageData;
}

- (void)setHeaderImageData:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)loadingText
{
  return self->_loadingText;
}

- (void)setLoadingText:(id)a3
{
}

- (NSString)supplementaryText
{
  return self->_supplementaryText;
}

- (void)setSupplementaryText:(id)a3
{
}

- (NSString)userInfoText
{
  return self->_userInfoText;
}

- (void)setUserInfoText:(id)a3
{
}

- (NSString)primaryButtonText
{
  return self->_primaryButtonText;
}

- (void)setPrimaryButtonText:(id)a3
{
}

- (NSString)secondaryButtonText
{
  return self->_secondaryButtonText;
}

- (void)setSecondaryButtonText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonText, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_userInfoText, 0);
  objc_storeStrong((id *)&self->_supplementaryText, 0);
  objc_storeStrong((id *)&self->_loadingText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);

  objc_storeStrong((id *)&self->_headerImageData, 0);
}

@end