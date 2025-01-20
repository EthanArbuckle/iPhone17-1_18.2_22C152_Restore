@interface BBParentSectionDataProviderFactory
+ (BOOL)supportsSecureCoding;
+ (id)factoryFromSectionInfo:(id)a3;
- (BBParentSectionDataProviderFactory)initWithCoder:(id)a3;
- (BBParentSectionDataProviderFactory)initWithSectionInfo:(id)a3;
- (BBSectionInfo)sectionInfo;
- (NSString)universalSectionIdentifier;
- (id)dataProviders;
- (id)sectionDisplayName;
- (id)sectionIcon;
- (id)sectionIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionInfo:(id)a3;
- (void)setUniversalSectionIdentifier:(id)a3;
@end

@implementation BBParentSectionDataProviderFactory

+ (id)factoryFromSectionInfo:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSectionInfo:v3];

  return v4;
}

- (BBParentSectionDataProviderFactory)initWithSectionInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BBParentSectionDataProviderFactory;
  v5 = [(BBParentSectionDataProviderFactory *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BBParentSectionDataProviderFactory *)v5 setSectionInfo:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBParentSectionDataProviderFactory)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionInfo"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_universalSectionIdentifier"];

  v7 = [(BBParentSectionDataProviderFactory *)self initWithSectionInfo:v5];
  objc_super v8 = v7;
  if (v7) {
    [(BBParentSectionDataProviderFactory *)v7 setUniversalSectionIdentifier:v6];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  sectionInfo = self->_sectionInfo;
  id v5 = a3;
  [v5 encodeObject:sectionInfo forKey:@"_sectionInfo"];
  [v5 encodeObject:self->_universalSectionIdentifier forKey:@"_universalSectionIdentifier"];
}

- (id)dataProviders
{
  return 0;
}

- (id)sectionIdentifier
{
  return [(BBSectionInfo *)self->_sectionInfo sectionID];
}

- (id)sectionDisplayName
{
  return [(BBSectionInfo *)self->_sectionInfo displayName];
}

- (id)sectionIcon
{
  return [(BBSectionInfo *)self->_sectionInfo icon];
}

- (BBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
}

- (NSString)universalSectionIdentifier
{
  return self->_universalSectionIdentifier;
}

- (void)setUniversalSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

@end