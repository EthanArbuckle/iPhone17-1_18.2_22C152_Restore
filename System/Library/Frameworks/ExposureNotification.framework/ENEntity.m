@interface ENEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ENEntity)initWithBundleID:(id)a3 agencyColor:(id)a4 agencyHeaderStyle:(id)a5 agencyHeaderTextColor:(id)a6 localizedAgencyName:(id)a7 localizedAgencyImageURL:(id)a8 localizedAgencyTurndownMessage:(id)a9 localizedRegionName:(id)a10 region:(id)a11;
- (ENEntity)initWithBundleID:(id)a3 region:(id)a4;
- (ENEntity)initWithCoder:(id)a3;
- (ENRegion)region;
- (NSArray)agencyColor;
- (NSArray)agencyHeaderTextColor;
- (NSNumber)agencyHeaderStyle;
- (NSString)bundleIdentifier;
- (NSString)localizedAgencyImageURL;
- (NSString)localizedAgencyName;
- (NSString)localizedAgencyTurndownMessage;
- (NSString)localizedRegionName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENEntity

- (ENEntity)initWithBundleID:(id)a3 agencyColor:(id)a4 agencyHeaderStyle:(id)a5 agencyHeaderTextColor:(id)a6 localizedAgencyName:(id)a7 localizedAgencyImageURL:(id)a8 localizedAgencyTurndownMessage:(id)a9 localizedRegionName:(id)a10 region:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v17 = a10;
  id v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)ENEntity;
  v19 = [(ENEntity *)&v33 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_agencyColor, a4);
    objc_storeStrong((id *)&v20->_agencyHeaderStyle, a5);
    objc_storeStrong((id *)&v20->_agencyHeaderTextColor, a6);
    objc_storeStrong((id *)&v20->_localizedAgencyName, a7);
    objc_storeStrong((id *)&v20->_localizedAgencyTurndownMessage, a9);
    objc_storeStrong((id *)&v20->_localizedAgencyImageURL, a8);
    objc_storeStrong((id *)&v20->_localizedRegionName, a10);
    uint64_t v21 = [v32 copy];
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v21;

    uint64_t v23 = [v18 copy];
    region = v20->_region;
    v20->_region = (ENRegion *)v23;
  }
  return v20;
}

- (ENEntity)initWithBundleID:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENEntity;
  v8 = [(ENEntity *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    region = v8->_region;
    v8->_region = (ENRegion *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENEntity)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v6 = [v3 setWithArray:v5];

  id v18 = (void *)v6;
  id v17 = [v4 decodeObjectOfClasses:v6 forKey:@"agc"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agh"];
  v8 = [v4 decodeObjectOfClasses:v6 forKey:@"aghc"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agn"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atn"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aIu"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bun"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reg"];
  objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rgn"];

  v15 = [(ENEntity *)self initWithBundleID:v12 agencyColor:v17 agencyHeaderStyle:v7 agencyHeaderTextColor:v8 localizedAgencyName:v9 localizedAgencyImageURL:v11 localizedAgencyTurndownMessage:v10 localizedRegionName:v14 region:v13];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  agencyColor = self->_agencyColor;
  id v5 = a3;
  [v5 encodeObject:agencyColor forKey:@"agc"];
  [v5 encodeObject:self->_agencyHeaderStyle forKey:@"agh"];
  [v5 encodeObject:self->_agencyHeaderTextColor forKey:@"aghc"];
  [v5 encodeObject:self->_localizedAgencyName forKey:@"agn"];
  [v5 encodeObject:self->_localizedAgencyTurndownMessage forKey:@"atn"];
  [v5 encodeObject:self->_localizedAgencyImageURL forKey:@"aIu"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bun"];
  [v5 encodeObject:self->_region forKey:@"reg"];
  [v5 encodeObject:self->_localizedRegionName forKey:@"rgn"];
}

- (unint64_t)hash
{
  if ([(NSString *)self->_bundleIdentifier length])
  {
    NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
    return [(ENRegion *)self->_region hash] ^ v3;
  }
  else
  {
    region = self->_region;
    return [(ENRegion *)region hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v42 = 0;
    goto LABEL_57;
  }
  id v5 = v4;
  region = self->_region;
  id v7 = [v5 region];
  v8 = region;
  uint64_t v9 = v7;
  v10 = v9;
  if (v8 == v9) {
    int v11 = 1;
  }
  else {
    int v11 = (v8 == 0) != (v9 != 0) && [(ENRegion *)v8 isEqual:v9];
  }

  if ([(NSString *)self->_bundleIdentifier length])
  {
    if (!v11) {
      goto LABEL_22;
    }
    bundleIdentifier = self->_bundleIdentifier;
    v13 = [v5 bundleIdentifier];
    objc_super v14 = bundleIdentifier;
    v15 = v13;
    if (v14 == v15)
    {
    }
    else
    {
      v16 = v15;
      if ((v14 == 0) == (v15 != 0)) {
        goto LABEL_21;
      }
      char v17 = [(NSNumber *)v14 isEqual:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_22;
      }
    }
LABEL_16:
    agencyColor = self->_agencyColor;
    v19 = [v5 agencyColor];
    LODWORD(agencyColor) = [(NSArray *)agencyColor isEqualToArray:v19];

    if (!agencyColor) {
      goto LABEL_22;
    }
    agencyHeaderStyle = self->_agencyHeaderStyle;
    uint64_t v21 = [v5 agencyHeaderStyle];
    objc_super v14 = agencyHeaderStyle;
    v22 = v21;
    if (v14 == v22)
    {

      goto LABEL_35;
    }
    v16 = v22;
    if ((v14 == 0) != (v22 != 0))
    {
      int v23 = [(NSNumber *)v14 isEqual:v22];

      if (!v23) {
        goto LABEL_22;
      }
LABEL_35:
      agencyHeaderTextColor = self->_agencyHeaderTextColor;
      objc_super v33 = [v5 agencyHeaderTextColor];
      int v34 = [(NSArray *)agencyHeaderTextColor isEqualToArray:v33];

      NSUInteger v35 = [(NSString *)self->_localizedAgencyName length];
      if (v35) {
        int v25 = 0;
      }
      else {
        int v25 = v34;
      }
      if (v35 && v34)
      {
        localizedAgencyName = self->_localizedAgencyName;
        v37 = [v5 localizedAgencyName];
        v38 = localizedAgencyName;
        v39 = v37;
        v40 = v39;
        if (v38 == v39)
        {
          int v25 = 1;
        }
        else if ((v38 == 0) == (v39 != 0))
        {
          int v25 = 0;
        }
        else
        {
          int v25 = [(NSString *)v38 isEqual:v39];
        }
      }
      if ([(NSString *)self->_localizedAgencyTurndownMessage length])
      {
        if (!v25) {
          goto LABEL_23;
        }
        localizedAgencyTurndownMessage = self->_localizedAgencyTurndownMessage;
        v50 = [v5 localizedAgencyTurndownMessage];
        v51 = localizedAgencyTurndownMessage;
        v52 = v50;
        v53 = v52;
        if (v51 == v52)
        {
          int v25 = 1;
        }
        else if ((v51 == 0) == (v52 != 0))
        {
          int v25 = 0;
        }
        else
        {
          int v25 = [(NSString *)v51 isEqual:v52];
        }
      }
LABEL_25:
      NSUInteger v26 = [(NSString *)self->_localizedAgencyImageURL length];
      if (v26) {
        int v24 = 0;
      }
      else {
        int v24 = v25;
      }
      if (v26 && v25)
      {
        localizedAgencyImageURL = self->_localizedAgencyImageURL;
        id v28 = [v5 localizedAgencyImageURL];
        id v29 = localizedAgencyImageURL;
        id v30 = v28;
        id v31 = v30;
        if (v29 == v30)
        {
          int v24 = 1;
        }
        else if ((v29 == 0) == (v30 != 0))
        {
          int v24 = 0;
        }
        else
        {
          int v24 = [(NSString *)v29 isEqual:v30];
        }
      }
      goto LABEL_45;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v11) {
    goto LABEL_16;
  }
LABEL_22:
  [(NSString *)self->_localizedAgencyName length];
  if (![(NSString *)self->_localizedAgencyTurndownMessage length])
  {
    int v25 = 0;
    goto LABEL_25;
  }
LABEL_23:
  [(NSString *)self->_localizedAgencyImageURL length];
  int v24 = 0;
LABEL_45:
  NSUInteger v41 = [(NSString *)self->_localizedRegionName length];
  if (v41) {
    char v42 = 0;
  }
  else {
    char v42 = v24;
  }
  if (v41 && v24)
  {
    localizedRegionName = self->_localizedRegionName;
    v44 = [v5 localizedRegionName];
    v45 = localizedRegionName;
    v46 = v44;
    v47 = v46;
    if (v45 == v46)
    {
      char v42 = 1;
    }
    else if ((v45 == 0) == (v46 != 0))
    {
      char v42 = 0;
    }
    else
    {
      char v42 = [(NSString *)v45 isEqual:v46];
    }
  }
LABEL_57:

  return v42;
}

- (id)description
{
  v2 = @"<>";
  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  agencyColor = self->_agencyColor;
  if (!bundleIdentifier) {
    bundleIdentifier = @"<>";
  }
  localizedRegionName = (__CFString *)self->_localizedRegionName;
  region = self->_region;
  if (!region) {
    region = (ENRegion *)@"<>";
  }
  localizedAgencyTurndownMessage = (__CFString *)self->_localizedAgencyTurndownMessage;
  localizedAgencyImageURL = (__CFString *)self->_localizedAgencyImageURL;
  if (!localizedRegionName) {
    localizedRegionName = @"<>";
  }
  localizedAgencyName = (__CFString *)self->_localizedAgencyName;
  if (!localizedAgencyName) {
    localizedAgencyName = @"<>";
  }
  if (!localizedAgencyTurndownMessage) {
    localizedAgencyTurndownMessage = @"<>";
  }
  if (!localizedAgencyImageURL) {
    localizedAgencyImageURL = @"<>";
  }
  if (!agencyColor) {
    agencyColor = (NSArray *)@"<>";
  }
  agencyHeaderStyle = self->_agencyHeaderStyle;
  agencyHeaderTextColor = self->_agencyHeaderTextColor;
  if (!agencyHeaderStyle) {
    agencyHeaderStyle = (NSNumber *)@"<>";
  }
  if (agencyHeaderTextColor) {
    v2 = (__CFString *)agencyHeaderTextColor;
  }
  return (id)[NSString stringWithFormat:@"App: %@, Region: %@ (%@),\nPHA: %@,\nMessage: %@,\n%@,\n%@,\n%@,\n%@", bundleIdentifier, region, localizedRegionName, localizedAgencyName, localizedAgencyTurndownMessage, localizedAgencyImageURL, agencyColor, agencyHeaderStyle, v2];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)agencyColor
{
  return self->_agencyColor;
}

- (NSNumber)agencyHeaderStyle
{
  return self->_agencyHeaderStyle;
}

- (NSArray)agencyHeaderTextColor
{
  return self->_agencyHeaderTextColor;
}

- (NSString)localizedAgencyName
{
  return self->_localizedAgencyName;
}

- (NSString)localizedAgencyTurndownMessage
{
  return self->_localizedAgencyTurndownMessage;
}

- (NSString)localizedAgencyImageURL
{
  return self->_localizedAgencyImageURL;
}

- (NSString)localizedRegionName
{
  return self->_localizedRegionName;
}

- (ENRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_localizedRegionName, 0);
  objc_storeStrong((id *)&self->_localizedAgencyImageURL, 0);
  objc_storeStrong((id *)&self->_localizedAgencyTurndownMessage, 0);
  objc_storeStrong((id *)&self->_localizedAgencyName, 0);
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, 0);
  objc_storeStrong((id *)&self->_agencyHeaderStyle, 0);
  objc_storeStrong((id *)&self->_agencyColor, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end