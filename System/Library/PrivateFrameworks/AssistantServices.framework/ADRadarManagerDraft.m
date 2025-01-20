@interface ADRadarManagerDraft
- (BOOL)isUserInitiated;
- (NSArray)deviceIDs;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)problemDescription;
- (NSString)title;
- (int64_t)componentIdentifier;
- (void)setComponentIdentifier:(int64_t)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setIsUserInitiated:(BOOL)a3;
- (void)setProblemDescription:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ADRadarManagerDraft

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_problemDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setComponentIdentifier:(int64_t)a3
{
  self->_componentIdentifier = a3;
}

- (int64_t)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setDeviceIDs:(id)a3
{
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)setProblemDescription:(id)a3
{
}

- (NSString)problemDescription
{
  return self->_problemDescription;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

@end