@interface _IMBSBrand
- (BOOL)isVerified;
- (id)_init;
- (id)_initWithBSBrand:(id)a3;
- (id)brandURI;
- (id)localizedResponseTime;
- (id)logoFingerprint;
- (id)name;
- (id)primaryPhoneNumber;
- (void)clearCachedAssets:(id)a3;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6;
- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
@end

@implementation _IMBSBrand

- (id)_initWithBSBrand:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_IMBSBrand;
  id v4 = [(IMBrand *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_IMBSBrand;
    [(IMBrand *)&v7 _setBrand:a3];
  }
  return v5;
}

- (id)_init
{
  return [(_IMBSBrand *)self _initWithBSBrand:0];
}

- (id)brandURI
{
  v2 = [(IMBrand *)self brand];

  return (id)MEMORY[0x1F4181798](v2, sel_brandURI);
}

- (id)name
{
  if (![(_IMBSBrand *)self isVerified]) {
    return (id)objc_msgSend(NSString, "localizedStringWithFormat:", objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", @"MAYBE", &stru_1EF2CAD28, @"IMSharedUtilities"), -[BSBrand name](-[IMBrand brand](self, "brand"), "name"));
  }
  v3 = [(IMBrand *)self brand];

  return (id)[(BSBrand *)v3 name];
}

- (id)primaryPhoneNumber
{
  v2 = [(IMBrand *)self brand];

  return (id)MEMORY[0x1F4181798](v2, sel_primaryPhoneNumber);
}

- (BOOL)isVerified
{
  v2 = [(IMBrand *)self brand];

  return [(BSBrand *)v2 isVerified];
}

- (id)localizedResponseTime
{
  v2 = [(IMBrand *)self brand];

  return (id)MEMORY[0x1F4181798](v2, sel_localizedResponseTime);
}

- (id)logoFingerprint
{
  v2 = [(IMBrand *)self brand];

  return (id)MEMORY[0x1F4181798](v2, sel_logoFingerprint);
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  id v4 = [(IMBrand *)self brand];

  MEMORY[0x1F4181798](v4, sel_squareLogoDataForDesiredSize_completion_);
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  id v4 = [(IMBrand *)self brand];

  MEMORY[0x1F4181798](v4, sel_wideLogoDataForDesiredSize_completion_);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  v6 = [(IMBrand *)self brand];

  MEMORY[0x1F4181798](v6, sel_logoDataOfType_desiredSize_fingerprint_completion_);
}

- (void)clearCachedAssets:(id)a3
{
  v3 = [(IMBrand *)self brand];

  MEMORY[0x1F4181798](v3, sel_clearCachedAssets_);
}

@end