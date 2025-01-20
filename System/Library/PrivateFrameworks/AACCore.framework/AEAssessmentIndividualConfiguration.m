@interface AEAssessmentIndividualConfiguration
+ (BOOL)supportsSecureCoding;
- (AEAssessmentIndividualConfiguration)init;
- (AEAssessmentIndividualConfiguration)initWithCoder:(id)a3;
- (BOOL)allowsNetworkAccess;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configurationInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)isEqualToConfiguration:(uint64_t)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNetworkAccess:(BOOL)a3;
- (void)setConfigurationInfo:(id)a3;
@end

@implementation AEAssessmentIndividualConfiguration

- (AEAssessmentIndividualConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEAssessmentIndividualConfiguration;
  v2 = [(AEAssessmentIndividualConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsNetworkAccess = 1;
    configurationInfo = v2->_configurationInfo;
    v2->_configurationInfo = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowsNetworkAccess:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  v5 = [(AEAssessmentIndividualConfiguration *)self configurationInfo];
  objc_super v6 = (void *)[v5 copy];
  [v4 setConfigurationInfo:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEAssessmentIndividualConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AEAssessmentIndividualConfiguration;
  v5 = [(AEAssessmentIndividualConfiguration *)&v18 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsNetworkAccess"];
    v5->_allowsNetworkAccess = [v6 BOOLValue];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"configurationInfo"];
    configurationInfo = v5->_configurationInfo;
    v5->_configurationInfo = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_super v6 = objc_msgSend(v4, "numberWithBool:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  [v5 encodeObject:v6 forKey:@"allowsNetworkAccess"];

  id v7 = [(AEAssessmentIndividualConfiguration *)self configurationInfo];
  [v5 encodeObject:v7 forKey:@"configurationInfo"];
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  uint64_t v4 = [v3 hash];
  id v5 = [(AEAssessmentIndividualConfiguration *)self configurationInfo];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentIndividualConfiguration *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentIndividualConfiguration *)v4 isMemberOfClass:objc_opt_class()]) {
    char v6 = -[AEAssessmentIndividualConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    int v5 = [(id)a1 allowsNetworkAccess];
    if (v5 != [v4 allowsNetworkAccess])
    {
      a1 = 0;
      goto LABEL_11;
    }
    char v6 = [(id)a1 configurationInfo];
    if (v6 || ([v4 configurationInfo], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = [(id)a1 configurationInfo];
      uint64_t v8 = [v4 configurationInfo];
      a1 = [v7 isEqual:v8];

      if (v6)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      a1 = 1;
    }

    goto LABEL_10;
  }
LABEL_11:

  return a1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(AEAssessmentIndividualConfiguration *)self allowsNetworkAccess]) {
    int v5 = @"Yes";
  }
  else {
    int v5 = @"No";
  }
  char v6 = [(AEAssessmentIndividualConfiguration *)self configurationInfo];
  id v7 = [v3 stringWithFormat:@"<%@: %p { allowsNetworkAccess = %@, configurationInfo = %@ }>", v4, self, v5, v6];

  return v7;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void)setAllowsNetworkAccess:(BOOL)a3
{
  self->_allowsNetworkAccess = a3;
}

- (NSDictionary)configurationInfo
{
  return self->_configurationInfo;
}

- (void)setConfigurationInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end