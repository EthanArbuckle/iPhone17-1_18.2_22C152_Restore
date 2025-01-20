@interface GEORelatedPlaceModuleConfiguration
- (BOOL)isVertical;
- (GEORelatedPlaceModuleConfiguration)initWithPlaceTemplateModuleConfiguration:(id)a3;
- (NSString)sectionTitle;
- (id)description;
- (int)componentIdentifier;
- (int)layoutVariant;
- (unint64_t)numberOfRows;
@end

@implementation GEORelatedPlaceModuleConfiguration

- (GEORelatedPlaceModuleConfiguration)initWithPlaceTemplateModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORelatedPlaceModuleConfiguration;
  v6 = [(GEORelatedPlaceModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_relatedPlaceConfig, a3);
  }

  return v7;
}

- (NSString)sectionTitle
{
  return (NSString *)[(GEOPDTemplatePlaceModuleConfiguration *)self->_relatedPlaceConfig sectionTitle];
}

- (int)componentIdentifier
{
  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (relatedPlaceConfig) {
    return relatedPlaceConfig->_templatePlaceComponentId;
  }
  else {
    return 0;
  }
}

- (unint64_t)numberOfRows
{
  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (!relatedPlaceConfig) {
    return 0;
  }
  if ((*(unsigned char *)&relatedPlaceConfig->_flags & 2) != 0) {
    return relatedPlaceConfig->_numberOfRows;
  }
  return 1;
}

- (BOOL)isVertical
{
  relatedPlaceConfig = self->_relatedPlaceConfig;
  return relatedPlaceConfig && (*(unsigned char *)&relatedPlaceConfig->_flags & 4) != 0 && relatedPlaceConfig->_orientation == 2;
}

- (int)layoutVariant
{
  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (!relatedPlaceConfig || (*(unsigned char *)&relatedPlaceConfig->_flags & 1) == 0) {
    return 0;
  }
  int layoutType = relatedPlaceConfig->_layoutType;
  if ((layoutType - 1) >= 4) {
    return 0;
  }
  else {
    return layoutType;
  }
}

- (id)description
{
  return [(GEOPDTemplatePlaceModuleConfiguration *)self->_relatedPlaceConfig description];
}

- (void).cxx_destruct
{
}

@end