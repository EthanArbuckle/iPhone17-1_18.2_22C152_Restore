@interface HKSourceDataModel
- (BOOL)installed;
- (BOOL)isEqual:(id)a3;
- (HKSource)source;
- (HKSourceDataModel)initWithSource:(id)a3;
- (NSDictionary)purposeStrings;
- (UIImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIcon:(id)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setPurposeStrings:(id)a3;
@end

@implementation HKSourceDataModel

- (HKSourceDataModel)initWithSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSourceDataModel;
  v6 = [(HKSourceDataModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_source, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HKSourceDataModel allocWithZone:a3] initWithSource:self->_source];
  [(HKSourceDataModel *)v4 setIcon:self->_icon];
  [(HKSourceDataModel *)v4 setInstalled:self->_installed];
  [(HKSourceDataModel *)v4 setPurposeStrings:self->_purposeStrings];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    source = self->_source;
    v6 = [v4 source];
    char v7 = [(HKSource *)source isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(HKSource *)self->_source hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKSource *)self->_source bundleIdentifier];
  v6 = [v3 stringWithFormat:@"<%@:%p bundleIdentifier:%@ installed:%i icon:%@>", v4, self, v5, self->_installed, self->_icon];

  return v6;
}

- (HKSource)source
{
  return self->_source;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (UIImage)icon
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcon:(id)a3
{
}

- (NSDictionary)purposeStrings
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPurposeStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purposeStrings, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end