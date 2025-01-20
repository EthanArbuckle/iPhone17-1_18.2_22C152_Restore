@interface FLHSA2PasswordResetNotification
+ (BOOL)supportsSecureCoding;
- (FLHSA2PasswordResetNotification)initWithCoder:(id)a3;
- (FLHSA2PasswordResetNotification)initWithFollowUpItemUserInfo:(id)a3;
- (NSString)appleID;
- (NSString)approveButtonTitle;
- (NSString)dismissButtonTitle;
- (NSString)informativeText;
- (NSString)title;
- (id)followUpItemUserInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setApproveButtonTitle:(id)a3;
- (void)setDismissButtonTitle:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FLHSA2PasswordResetNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_informativeText forKey:@"_informativeText"];
  [v5 encodeObject:self->_approveButtonTitle forKey:@"_approveButtonTitle"];
  [v5 encodeObject:self->_dismissButtonTitle forKey:@"_dismissButtonTitle"];
  [v5 encodeObject:self->_appleID forKey:@"_appleID"];
}

- (FLHSA2PasswordResetNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FLHSA2PasswordResetNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_approveButtonTitle"];
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dismissButtonTitle"];
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;
  }
  return v5;
}

- (FLHSA2PasswordResetNotification)initWithFollowUpItemUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(FLHSA2PasswordResetNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"approveButtonTitle"];
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"dismissButtonTitle"];
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;
  }
  return v5;
}

- (id)followUpItemUserInfo
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FLHSA2PasswordResetNotification"];
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  [v3 setObject:self->_informativeText forKeyedSubscript:@"informativeText"];
  [v3 setObject:self->_approveButtonTitle forKeyedSubscript:@"approveButtonTitle"];
  [v3 setObject:self->_dismissButtonTitle forKeyedSubscript:@"dismissButtonTitle"];
  [v3 setObject:self->_appleID forKeyedSubscript:@"appleID"];

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
}

- (NSString)approveButtonTitle
{
  return self->_approveButtonTitle;
}

- (void)setApproveButtonTitle:(id)a3
{
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_approveButtonTitle, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end