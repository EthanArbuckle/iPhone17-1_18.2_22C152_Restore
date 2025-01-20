@interface BLTSectionInfoItem
- (BBSectionInfo)sectionInfo;
- (NSString)displayName;
- (void)setSectionInfo:(id)a3;
@end

@implementation BLTSectionInfoItem

- (NSString)displayName
{
  v3 = [(BLTSectionInfoItem *)self sectionInfo];
  v4 = [v3 displayName];

  if (!v4)
  {
    v5 = (void *)MEMORY[0x263F01868];
    v6 = [(BLTSectionInfoItem *)self sectionInfo];
    v7 = [v6 sectionID];
    v8 = [v5 applicationProxyForIdentifier:v7];

    v4 = [v8 localizedName];
  }
  return (NSString *)v4;
}

- (BBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end