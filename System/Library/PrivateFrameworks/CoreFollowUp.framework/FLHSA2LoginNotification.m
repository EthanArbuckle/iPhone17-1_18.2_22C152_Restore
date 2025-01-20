@interface FLHSA2LoginNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)userAllowedSignIn;
- (FLHSA2LoginNotification)initWithCoder:(id)a3;
- (FLHSA2LoginNotification)initWithFollowUpItemUserInfo:(id)a3;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSSet)supportedDismissActions;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)approveButtonTitle;
- (NSString)codePrompt;
- (NSString)deviceColorString;
- (NSString)deviceModel;
- (NSString)deviceType;
- (NSString)dismissButtonTitle;
- (NSString)footerText;
- (NSString)informativeText;
- (NSString)pushMessageID;
- (NSString)title;
- (id)followUpItemUserInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setApproveButtonTitle:(id)a3;
- (void)setCodePrompt:(id)a3;
- (void)setDeviceColorString:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setDismissButtonTitle:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setInformativeText:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setPushMessageID:(id)a3;
- (void)setSupportedDismissActions:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserAllowedSignIn:(BOOL)a3;
@end

@implementation FLHSA2LoginNotification

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
  [v5 encodeObject:self->_codePrompt forKey:@"_codePrompt"];
  [v5 encodeObject:self->_footerText forKey:@"_footerText"];
  [v5 encodeObject:self->_approveButtonTitle forKey:@"_approveButtonTitle"];
  [v5 encodeObject:self->_dismissButtonTitle forKey:@"_dismissButtonTitle"];
  [v5 encodeObject:self->_appleID forKey:@"_appleID"];
  [v5 encodeObject:self->_latitude forKey:@"_latitude"];
  [v5 encodeObject:self->_longitude forKey:@"_longitude"];
  [v5 encodeObject:self->_deviceType forKey:@"_deviceType"];
  [v5 encodeObject:self->_deviceModel forKey:@"_deviceModel"];
  [v5 encodeObject:self->_deviceColorString forKey:@"_deviceColorString"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_pushMessageID forKey:@"_pushMessageID"];
  [v5 encodeObject:self->_supportedDismissActions forKey:@"_supportedDismissActions"];
  [v5 encodeBool:self->_userAllowedSignIn forKey:@"_userAllowedSignIn"];
}

- (FLHSA2LoginNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FLHSA2LoginNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_codePrompt"];
    codePrompt = v5->_codePrompt;
    v5->_codePrompt = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_footerText"];
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_approveButtonTitle"];
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dismissButtonTitle"];
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_latitude"];
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_longitude"];
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceType"];
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceModel"];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceColorString"];
    deviceColorString = v5->_deviceColorString;
    v5->_deviceColorString = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pushMessageID"];
    pushMessageID = v5->_pushMessageID;
    v5->_pushMessageID = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"_supportedDismissActions"];
    supportedDismissActions = v5->_supportedDismissActions;
    v5->_supportedDismissActions = (NSSet *)v37;

    v5->_userAllowedSignIn = [v4 decodeBoolForKey:@"_userAllowedSignIn"];
  }

  return v5;
}

- (FLHSA2LoginNotification)initWithFollowUpItemUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(FLHSA2LoginNotification *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"informativeText"];
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"codePrompt"];
    codePrompt = v5->_codePrompt;
    v5->_codePrompt = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"footerText"];
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"approveButtonTitle"];
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"dismissButtonTitle"];
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"latitude"];
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"longitude"];
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"deviceType"];
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"deviceModel"];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"deviceColorString"];
    deviceColorString = v5->_deviceColorString;
    v5->_deviceColorString = (NSString *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"pushMessageID"];
    pushMessageID = v5->_pushMessageID;
    v5->_pushMessageID = (NSString *)v32;

    v34 = [v4 objectForKeyedSubscript:@"userAllowedSignIn"];
    v5->_userAllowedSignIn = [v34 BOOLValue];
  }
  return v5;
}

- (id)followUpItemUserInfo
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FLHSA2LoginNotification"];
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  [v3 setObject:self->_informativeText forKeyedSubscript:@"informativeText"];
  [v3 setObject:self->_codePrompt forKeyedSubscript:@"codePrompt"];
  [v3 setObject:self->_footerText forKeyedSubscript:@"footerText"];
  [v3 setObject:self->_approveButtonTitle forKeyedSubscript:@"approveButtonTitle"];
  [v3 setObject:self->_dismissButtonTitle forKeyedSubscript:@"dismissButtonTitle"];
  [v3 setObject:self->_appleID forKeyedSubscript:@"appleID"];
  [v3 setObject:self->_latitude forKeyedSubscript:@"latitude"];
  [v3 setObject:self->_longitude forKeyedSubscript:@"longitude"];
  [v3 setObject:self->_deviceType forKeyedSubscript:@"deviceType"];
  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceColorString forKeyedSubscript:@"deviceColorString"];
  [v3 setObject:self->_altDSID forKeyedSubscript:@"altDSID"];
  [v3 setObject:self->_pushMessageID forKeyedSubscript:@"pushMessageID"];
  id v4 = [NSNumber numberWithBool:self->_userAllowedSignIn];
  [v3 setObject:v4 forKeyedSubscript:@"userAllowedSignIn"];

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

- (NSString)codePrompt
{
  return self->_codePrompt;
}

- (void)setCodePrompt:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
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

- (NSSet)supportedDismissActions
{
  return self->_supportedDismissActions;
}

- (void)setSupportedDismissActions:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceColorString
{
  return self->_deviceColorString;
}

- (void)setDeviceColorString:(id)a3
{
}

- (NSString)pushMessageID
{
  return self->_pushMessageID;
}

- (void)setPushMessageID:(id)a3
{
}

- (BOOL)userAllowedSignIn
{
  return self->_userAllowedSignIn;
}

- (void)setUserAllowedSignIn:(BOOL)a3
{
  self->_userAllowedSignIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMessageID, 0);
  objc_storeStrong((id *)&self->_deviceColorString, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_supportedDismissActions, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_approveButtonTitle, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_codePrompt, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end