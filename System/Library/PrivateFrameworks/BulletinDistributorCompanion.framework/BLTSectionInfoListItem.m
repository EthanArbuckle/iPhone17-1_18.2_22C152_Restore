@interface BLTSectionInfoListItem
- (BBSectionIcon)overriddenIcon;
- (NSDictionary)overrides;
- (NSString)overriddenDisplayName;
- (NSString)overriddenFactorySectionID;
- (NSString)phoneSectionID;
- (NSString)universalSectionID;
- (void)setOverriddenDisplayName:(id)a3;
- (void)setOverriddenFactorySectionID:(id)a3;
- (void)setOverriddenIcon:(id)a3;
- (void)setOverrides:(id)a3;
- (void)setPhoneSectionID:(id)a3;
- (void)setUniversalSectionID:(id)a3;
@end

@implementation BLTSectionInfoListItem

- (NSDictionary)overrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOverrides:(id)a3
{
}

- (NSString)universalSectionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUniversalSectionID:(id)a3
{
}

- (NSString)overriddenFactorySectionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOverriddenFactorySectionID:(id)a3
{
}

- (NSString)phoneSectionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoneSectionID:(id)a3
{
}

- (NSString)overriddenDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOverriddenDisplayName:(id)a3
{
}

- (BBSectionIcon)overriddenIcon
{
  return (BBSectionIcon *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOverriddenIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenIcon, 0);
  objc_storeStrong((id *)&self->_overriddenDisplayName, 0);
  objc_storeStrong((id *)&self->_phoneSectionID, 0);
  objc_storeStrong((id *)&self->_overriddenFactorySectionID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end