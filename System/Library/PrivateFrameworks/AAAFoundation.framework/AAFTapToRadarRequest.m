@interface AAFTapToRadarRequest
- (BOOL)fullDiagnostic;
- (NSArray)keywordIDs;
- (NSArray)keywords;
- (NSString)alertCancelButtonText;
- (NSString)alertDefaultButtonText;
- (NSString)alertMessage;
- (NSString)alertOtherButtonText;
- (NSString)alertTitle;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)deviceTypes;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (id)alertOtherButtonAction;
- (id)formattedKeywords;
- (void)setAlertCancelButtonText:(id)a3;
- (void)setAlertDefaultButtonText:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertOtherButtonAction:(id)a3;
- (void)setAlertOtherButtonText:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setDeviceTypes:(id)a3;
- (void)setFullDiagnostic:(BOOL)a3;
- (void)setKeywordIDs:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarTitle:(id)a3;
@end

@implementation AAFTapToRadarRequest

- (id)formattedKeywords
{
  v3 = [(AAFTapToRadarRequest *)self keywords];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(AAFTapToRadarRequest *)self keywords];
    v6 = [v5 componentsJoinedByString:@","];
  }
  else
  {
    v6 = &stru_1F393D320;
  }
  return v6;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
}

- (NSString)alertDefaultButtonText
{
  return self->_alertDefaultButtonText;
}

- (void)setAlertDefaultButtonText:(id)a3
{
}

- (NSString)alertCancelButtonText
{
  return self->_alertCancelButtonText;
}

- (void)setAlertCancelButtonText:(id)a3
{
}

- (NSString)alertOtherButtonText
{
  return self->_alertOtherButtonText;
}

- (void)setAlertOtherButtonText:(id)a3
{
}

- (id)alertOtherButtonAction
{
  return self->_alertOtherButtonAction;
}

- (void)setAlertOtherButtonAction:(id)a3
{
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (BOOL)fullDiagnostic
{
  return self->_fullDiagnostic;
}

- (void)setFullDiagnostic:(BOOL)a3
{
  self->_fullDiagnostic = a3;
}

- (NSString)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setDeviceTypes:(id)a3
{
}

- (NSArray)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setKeywordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong(&self->_alertOtherButtonAction, 0);
  objc_storeStrong((id *)&self->_alertOtherButtonText, 0);
  objc_storeStrong((id *)&self->_alertCancelButtonText, 0);
  objc_storeStrong((id *)&self->_alertDefaultButtonText, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end