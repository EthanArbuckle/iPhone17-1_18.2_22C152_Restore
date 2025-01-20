@interface HMMTRMutableVendorMetadataProduct
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMMTRMutableVendorMetadataProduct

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMMTRVendorMetadataProduct allocWithZone:a3];
  v5 = [(HMMTRVendorMetadataProduct *)self identifier];
  v6 = [(HMMTRVendorMetadataProduct *)self categoryNumber];
  v7 = [(HMMTRVendorMetadataProduct *)v4 initWithIdentifier:v5 categoryNumber:v6];

  v8 = [(HMMTRVendorMetadataProduct *)self name];
  [(HMMTRVendorMetadataProduct *)v7 setName:v8];

  v9 = [(HMMTRVendorMetadataProduct *)self model];
  [(HMMTRVendorMetadataProduct *)v7 setModel:v9];

  v10 = [(HMMTRVendorMetadataProduct *)self installationGuideURL];
  [(HMMTRVendorMetadataProduct *)v7 setInstallationGuideURL:v10];

  [(HMMTRVendorMetadataProduct *)v7 setInvalid:[(HMMTRVendorMetadataProduct *)self invalid]];
  return v7;
}

@end