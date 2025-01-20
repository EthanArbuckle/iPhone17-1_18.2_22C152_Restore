@interface ENRegionServerAgencyConfiguration
+ (BOOL)supportsSecureCoding;
- (ENRegion)region;
- (ENRegionServerAgencyConfiguration)initWithCoder:(id)a3;
- (ENRegionServerAgencyConfiguration)initWithRegion:(id)a3;
- (ENRegionServerAgencyConfiguration)initWithServerResponseDictionary:(id)a3 locale:(id)a4;
- (ENRegionServerAgencyLocalizedConfiguration)localizedConfiguration;
- (NSArray)agencyColor;
- (NSArray)agencyHeaderTextColor;
- (NSString)agencyDisplayName;
- (NSString)agencyImageURL;
- (NSURL)agencyFAQWebsiteURL;
- (NSURL)agencyWebsiteURL;
- (NSURL)revokedClassificationURL;
- (NSURL)verificationCodeLearnMoreURL;
- (NSURL)webReportURL;
- (id)description;
- (unint64_t)agencyHeaderStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAgencyColor:(id)a3;
- (void)setAgencyHeaderStyle:(unint64_t)a3;
- (void)setAgencyHeaderTextColor:(id)a3;
- (void)setAgencyImageURL:(id)a3;
- (void)setLocalizedConfiguration:(id)a3;
@end

@implementation ENRegionServerAgencyConfiguration

- (ENRegionServerAgencyConfiguration)initWithRegion:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ENRegionServerAgencyConfiguration;
  v6 = [(ENRegionServerAgencyConfiguration *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_region, a3);
    agencyColor = v7->_agencyColor;
    v7->_agencyColor = (NSArray *)&unk_26C60D450;

    agencyHeaderTextColor = v7->_agencyHeaderTextColor;
    v7->_agencyHeaderTextColor = (NSArray *)&unk_26C60D468;

    agencyImageURL = v7->_agencyImageURL;
    v7->_agencyImageURL = (NSString *)&stru_26C604128;

    uint64_t v11 = objc_opt_new();
    agencyWebsiteURL = v7->_agencyWebsiteURL;
    v7->_agencyWebsiteURL = (NSURL *)v11;

    uint64_t v13 = objc_opt_new();
    agencyFAQWebsiteURL = v7->_agencyFAQWebsiteURL;
    v7->_agencyFAQWebsiteURL = (NSURL *)v13;

    v15 = [[ENRegionServerAgencyLocalizedConfiguration alloc] initWithRegion:v5];
    localizedConfiguration = v7->_localizedConfiguration;
    v7->_localizedConfiguration = v15;

    v17 = v7;
  }

  return v7;
}

- (id)description
{
  v15 = NSString;
  v14 = [(ENRegionServerAgencyConfiguration *)self region];
  v3 = [(ENRegionServerAgencyConfiguration *)self agencyDisplayName];
  v4 = [(ENRegionServerAgencyConfiguration *)self agencyColor];
  id v5 = [(ENRegionServerAgencyConfiguration *)self agencyImageURL];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ENRegionServerAgencyConfiguration agencyHeaderStyle](self, "agencyHeaderStyle"));
  v7 = [(ENRegionServerAgencyConfiguration *)self agencyHeaderTextColor];
  v8 = [(ENRegionServerAgencyConfiguration *)self agencyWebsiteURL];
  v9 = [(ENRegionServerAgencyConfiguration *)self verificationCodeLearnMoreURL];
  v10 = [(ENRegionServerAgencyConfiguration *)self webReportURL];
  uint64_t v11 = [(ENRegionServerAgencyConfiguration *)self localizedConfiguration];
  v12 = [v15 stringWithFormat:@"Agency - %@, [Display Name]: %@, [Color]: %@, [Image]: %@, [Style]: %@, [HeaderTextColor]: %@, [Website]: %@, [VerificationCodeLearnMoreURL]: %@, [WebReportURL]: %@, [Localized Configuration]: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  region = self->_region;
  id v6 = a3;
  [v6 encodeObject:region forKey:@"region"];
  [v6 encodeObject:self->_agencyColor forKey:@"agencyColor"];
  [v6 encodeObject:self->_agencyHeaderTextColor forKey:@"agencyHeaderTextColor"];
  [v6 encodeObject:self->_agencyImageURL forKey:@"agencyImage"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_agencyHeaderStyle];
  [v6 encodeObject:v5 forKey:@"agencyHeaderStyle"];

  [v6 encodeObject:self->_agencyWebsiteURL forKey:@"agencyWebsiteURL"];
  [v6 encodeObject:self->_agencyFAQWebsiteURL forKey:@"agencyFAQWebsiteURL"];
  [v6 encodeObject:self->_localizedConfiguration forKey:@"agencyLocalizations"];
  [v6 encodeObject:self->_revokedClassificationURL forKey:@"revokedURL"];
  [v6 encodeObject:self->_verificationCodeLearnMoreURL forKey:@"verificationCodeLearnMoreURL"];
  [v6 encodeObject:self->_webReportURL forKey:@"webReportURL"];
}

- (ENRegionServerAgencyConfiguration)initWithServerResponseDictionary:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v40 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v43.receiver = self,
        v43.super_class = (Class)ENRegionServerAgencyConfiguration,
        (self = [(ENRegionServerAgencyConfiguration *)&v43 init]) == 0))
  {
    v37 = 0;
    goto LABEL_29;
  }
  v8 = +[ENRegion regionFromServerResponseDictionary:v6];
  v9 = v8;
  if (!v8)
  {
    v37 = 0;
    goto LABEL_28;
  }
  v10 = (ENRegion *)[v8 copy];
  region = self->_region;
  self->_region = v10;

  v12 = [v6 objectForKeyedSubscript:@"config"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = 0;
    goto LABEL_27;
  }
  int v42 = 0;
  objc_opt_class();
  uint64_t v13 = NSDictionaryGetNSArrayOfClass();
  objc_storeStrong((id *)&self->_agencyColor, v13);
  objc_opt_class();
  v14 = NSDictionaryGetNSArrayOfClass();
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, v14);
  CFStringGetTypeID();
  v15 = CFDictionaryGetTypedValue();
  v16 = v15;
  agencyImageURL = self->_agencyImageURL;
  self->_agencyImageURL = v16;

  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v42) {
    unint64_t v19 = 0;
  }
  else {
    unint64_t v19 = Int64Ranged;
  }
  self->_agencyHeaderStyle = v19;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = [NSURL URLWithString:v20];
    if (!v21) {
      goto LABEL_30;
    }
    agencyWebsiteURL = self->_agencyWebsiteURL;
    self->_agencyWebsiteURL = v21;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v23 = [NSURL URLWithString:v20];
    if (!v23) {
      goto LABEL_30;
    }
    agencyFAQWebsiteURL = self->_agencyFAQWebsiteURL;
    self->_agencyFAQWebsiteURL = v23;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v25 = [NSURL URLWithString:v20];
    if (!v25) {
      goto LABEL_30;
    }
    revokedClassificationURL = self->_revokedClassificationURL;
    self->_revokedClassificationURL = v25;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v27 = [NSURL URLWithString:v20];
    if (!v27) {
      goto LABEL_30;
    }
    verificationCodeLearnMoreURL = self->_verificationCodeLearnMoreURL;
    self->_verificationCodeLearnMoreURL = v27;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_23:
    id v39 = v6;
    v31 = v9;
    v32 = v14;
    v33 = v13;

    v34 = (void *)MEMORY[0x2166BC6F0]();
    id v41 = 0;
    v35 = [(ENRegionServerAgencyConfiguration *)self region];
    +[ENRegionServerAgencyLocalizedConfiguration getLocalizedAgencyConfiguration:&v41 region:v35 fromDictionary:v12 locale:v7];
    id v36 = v41;
    id v20 = v41;

    if (v20)
    {
      objc_storeStrong((id *)&self->_localizedConfiguration, v36);
      v37 = self;
    }
    else
    {
      v37 = 0;
    }
    uint64_t v13 = v33;
    v14 = v32;
    v9 = v31;
    id v6 = v39;
    goto LABEL_26;
  }
  v29 = [NSURL URLWithString:v20];
  if (v29)
  {
    webReportURL = self->_webReportURL;
    self->_webReportURL = v29;

    goto LABEL_23;
  }
LABEL_30:
  v37 = 0;
LABEL_26:

LABEL_27:
LABEL_28:

LABEL_29:
  return v37;
}

- (ENRegionServerAgencyConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENRegionServerAgencyConfiguration;
  id v5 = [(ENRegionServerAgencyConfiguration *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    if (v6)
    {
      objc_storeStrong((id *)&v5->_region, v6);
      objc_opt_class();
      NSDecodeNSArrayOfClassIfPresent();

      id v6 = 0;
    }
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (NSString)agencyDisplayName
{
  v2 = [(ENRegionServerAgencyConfiguration *)self localizedConfiguration];
  v3 = [v2 displayName];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSArray)agencyColor
{
  return self->_agencyColor;
}

- (void)setAgencyColor:(id)a3
{
}

- (NSArray)agencyHeaderTextColor
{
  return self->_agencyHeaderTextColor;
}

- (void)setAgencyHeaderTextColor:(id)a3
{
}

- (NSString)agencyImageURL
{
  return self->_agencyImageURL;
}

- (void)setAgencyImageURL:(id)a3
{
}

- (unint64_t)agencyHeaderStyle
{
  return self->_agencyHeaderStyle;
}

- (void)setAgencyHeaderStyle:(unint64_t)a3
{
  self->_agencyHeaderStyle = a3;
}

- (NSURL)agencyWebsiteURL
{
  return self->_agencyWebsiteURL;
}

- (NSURL)agencyFAQWebsiteURL
{
  return self->_agencyFAQWebsiteURL;
}

- (ENRegionServerAgencyLocalizedConfiguration)localizedConfiguration
{
  return self->_localizedConfiguration;
}

- (void)setLocalizedConfiguration:(id)a3
{
}

- (NSURL)revokedClassificationURL
{
  return self->_revokedClassificationURL;
}

- (NSURL)verificationCodeLearnMoreURL
{
  return self->_verificationCodeLearnMoreURL;
}

- (NSURL)webReportURL
{
  return self->_webReportURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webReportURL, 0);
  objc_storeStrong((id *)&self->_verificationCodeLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_revokedClassificationURL, 0);
  objc_storeStrong((id *)&self->_localizedConfiguration, 0);
  objc_storeStrong((id *)&self->_agencyFAQWebsiteURL, 0);
  objc_storeStrong((id *)&self->_agencyWebsiteURL, 0);
  objc_storeStrong((id *)&self->_agencyImageURL, 0);
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, 0);
  objc_storeStrong((id *)&self->_agencyColor, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end