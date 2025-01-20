@interface FKMapsBrand
- (BOOL)isEqual:(id)a3;
- (FKMapsBrand)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 logoURL:(id)a15;
- (NSURL)logoURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setLogoURL:(id)a3;
@end

@implementation FKMapsBrand

- (FKMapsBrand)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14 logoURL:(id)a15
{
  uint64_t v19 = *(void *)&a4;
  id v22 = a15;
  v27.receiver = self;
  v27.super_class = (Class)FKMapsBrand;
  v23 = [(FKMapsItem *)&v27 initWithMUID:a3 resultProviderIdentifier:v19 name:a5 phoneNumber:a6 url:a7 heroImageURL:a8 heroImageAttributionName:a9 category:a10 mapsCategoryIdentifier:a11 encodedStylingInfo:a12 businessChatURL:a13 lastProcessedDate:a14];
  if (v23)
  {
    uint64_t v24 = [v22 copy];
    logoURL = v23->_logoURL;
    v23->_logoURL = (NSURL *)v24;
  }
  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FKMapsBrand;
  v5 = -[FKMapsItem copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSURL *)self->_logoURL copyWithZone:a3];
  v7 = (void *)v5[13];
  v5[13] = v6;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_logoURL];
  v7.receiver = self;
  v7.super_class = (Class)FKMapsBrand;
  id v4 = [(FKMapsItem *)&v7 hash];
  unint64_t v5 = FKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FKMapsBrand *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)FKMapsBrand;
    if ([(FKMapsItem *)&v9 isEqual:v6]) {
      char v7 = FKEqualObjects(self->_logoURL, v6[13]);
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end