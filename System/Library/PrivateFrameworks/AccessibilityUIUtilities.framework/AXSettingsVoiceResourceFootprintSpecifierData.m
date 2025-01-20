@interface AXSettingsVoiceResourceFootprintSpecifierData
- (AXDialectMap)dialect;
- (BOOL)isSelected;
- (BOOL)showListItemStyle;
- (NSArray)resources;
- (NSString)name;
- (id)description;
- (void)setDialect:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setResources:(id)a3;
- (void)setShowListItemStyle:(BOOL)a3;
@end

@implementation AXSettingsVoiceResourceFootprintSpecifierData

- (id)description
{
  v3 = NSString;
  v4 = [(AXSettingsVoiceResourceFootprintSpecifierData *)self name];
  v5 = [(AXSettingsVoiceResourceFootprintSpecifierData *)self dialect];
  v6 = [v5 specificLanguageID];
  v7 = [(AXSettingsVoiceResourceFootprintSpecifierData *)self resources];
  v8 = [v3 stringWithFormat:@"AXSettingsVoiceResourceFootprintSpecifierData<%p> name:%@ dialect:%@ resources:%ld", self, v4, v6, objc_msgSend(v7, "count")];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)showListItemStyle
{
  return self->_showListItemStyle;
}

- (void)setShowListItemStyle:(BOOL)a3
{
  self->_showListItemStyle = a3;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (AXDialectMap)dialect
{
  return self->_dialect;
}

- (void)setDialect:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialect, 0);
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end