@interface IMBrand
+ (id)brandWithBSBrand:(id)a3;
+ (id)placeholderNameForBrandURI:(id)a3;
- (BOOL)isVerified;
- (BSBrand)brand;
- (NSData)logoFingerprint;
- (NSString)brandURI;
- (NSString)localizedResponseTime;
- (NSString)name;
- (NSString)primaryPhoneNumber;
- (id)_init;
- (void)_setBrand:(id)a3;
- (void)clearCachedAssets:(id)a3;
- (void)dealloc;
- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6;
- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4;
@end

@implementation IMBrand

+ (id)brandWithBSBrand:(id)a3
{
  if (qword_1E94FFAB8 != -1) {
    dispatch_once(&qword_1E94FFAB8, &unk_1EF2BFA60);
  }
  id v4 = [[_IMBSBrand alloc] _initWithBSBrand:a3];

  return v4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IMBrand;
  return [(IMBrand *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMBrand;
  [(IMBrand *)&v3 dealloc];
}

- (NSString)brandURI
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (NSString)primaryPhoneNumber
{
  return 0;
}

- (BOOL)isVerified
{
  return 0;
}

- (NSString)localizedResponseTime
{
  return 0;
}

- (NSData)logoFingerprint
{
  return 0;
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
}

- (void)clearCachedAssets:(id)a3
{
}

+ (id)placeholderNameForBrandURI:(id)a3
{
  if (!MEMORY[0x1A62278A0](a3, a2)) {
    return a3;
  }
  if (qword_1E94FFAB8 != -1) {
    dispatch_once(&qword_1E94FFAB8, &unk_1EF2BFA60);
  }
  uint64_t v4 = qword_1E94FFAC0;

  return (id)MEMORY[0x1F4181798](v4, sel_placeholderName);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
}

- (void)_setBrand:(id)a3
{
  brand = self->_brand;
  if (brand != a3)
  {

    self->_brand = (BSBrand *)a3;
  }
}

- (BSBrand)brand
{
  return self->_brand;
}

@end