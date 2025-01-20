@interface FKMapsMerchant
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (CNPostalAddress)postalAddress;
- (FKMapsMerchant)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 location:(id)a15 postalAddress:(id)a16;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setLocation:(id)a3;
- (void)setPostalAddress:(id)a3;
@end

@implementation FKMapsMerchant

- (FKMapsMerchant)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 location:(id)a15 postalAddress:(id)a16
{
  uint64_t v19 = *(void *)&a4;
  id v22 = a15;
  id v23 = a16;
  v31.receiver = self;
  v31.super_class = (Class)FKMapsMerchant;
  v24 = [(FKMapsItem *)&v31 initWithMUID:a3 resultProviderIdentifier:v19 name:a5 phoneNumber:a6 url:a7 heroImageURL:a8 heroImageAttributionName:a9 category:a10 mapsCategoryIdentifier:a11 encodedStylingInfo:a12 businessChatURL:a13 lastProcessedDate:a14];
  if (v24)
  {
    uint64_t v25 = [v22 copy];
    location = v24->_location;
    v24->_location = (CLLocation *)v25;

    uint64_t v27 = [v23 copy];
    postalAddress = v24->_postalAddress;
    v24->_postalAddress = (CNPostalAddress *)v27;
  }
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FKMapsMerchant;
  v5 = -[FKMapsItem copyWithZone:](&v11, sel_copyWithZone_);
  uint64_t v6 = [(CLLocation *)self->_location copyWithZone:a3];
  v7 = (void *)v5[13];
  v5[13] = v6;

  uint64_t v8 = [(CNPostalAddress *)self->_postalAddress copyWithZone:a3];
  v9 = (void *)v5[14];
  v5[14] = v8;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_location];
  [v3 safelyAddObject:self->_postalAddress];
  v7.receiver = self;
  v7.super_class = (Class)FKMapsMerchant;
  id v4 = [(FKMapsItem *)&v7 hash];
  unint64_t v5 = FKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FKMapsMerchant *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v10.receiver = self;
    v10.super_class = (Class)FKMapsMerchant;
    if ([(FKMapsItem *)&v10 isEqual:v6]
      && ([(CLLocation *)self->_location distanceFromLocation:v6[13]], v7 == 0.0))
    {
      char v8 = FKEqualObjects(self->_postalAddress, v6[14]);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddress, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end