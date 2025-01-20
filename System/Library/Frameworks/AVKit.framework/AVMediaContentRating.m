@interface AVMediaContentRating
+ (id)contentRestrictionsCountryCode;
- (AVMediaContentRating)init;
- (AVMediaContentRating)initWithRating:(id)a3 rank:(int64_t)a4 countryCode:(id)a5 domain:(int64_t)a6;
- (BOOL)_isCurrentlyRestricted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaContentRating:(id)a3;
- (BOOL)isImageMask;
- (BOOL)isRestricted;
- (NSString)countryCode;
- (NSString)displayName;
- (UIImage)image;
- (id)description;
- (int64_t)domain;
- (int64_t)rank;
- (unint64_t)hash;
- (void)_setRestricted:(BOOL)a3;
@end

@implementation AVMediaContentRating

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)_setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)rank
{
  return self->_rank;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)_isCurrentlyRestricted
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [(AVMediaContentRating *)self countryCode];
  v5 = [v3 localizedStringForCountryCode:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(AVMediaContentRating *)self countryCode];
  }
  v8 = v7;

  v9 = NSString;
  v10 = [(AVMediaContentRating *)self displayName];
  int64_t v11 = [(AVMediaContentRating *)self rank];
  v12 = [(AVMediaContentRating *)self countryCode];
  int64_t v13 = [(AVMediaContentRating *)self domain];
  v14 = @"Unknown";
  if (v13 == 1) {
    v14 = @"Movies";
  }
  if (v13 == 2) {
    v14 = @"TVShows";
  }
  v15 = v14;
  BOOL v16 = [(AVMediaContentRating *)self isRestricted];
  v17 = @"not restricted";
  if (v16) {
    v17 = @"restricted";
  }
  v18 = [v9 stringWithFormat:@"<AVMediaContentRating: \"%@\" %d \"%@\" %@ (%@) - %@>", v10, v11, v12, v8, v15, v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVMediaContentRating *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AVMediaContentRating *)self isEqualToMediaContentRating:v4];
  }

  return v5;
}

- (BOOL)isEqualToMediaContentRating:(id)a3
{
  v4 = (AVMediaContentRating *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 {
         && (uint64_t v6 = [(AVMediaContentRating *)v4 domain], v6 == [(AVMediaContentRating *)self domain]))
  }
  {
    id v7 = [(AVMediaContentRating *)v5 countryCode];
    v8 = [(AVMediaContentRating *)self countryCode];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(AVMediaContentRating *)v5 displayName];
      v10 = [(AVMediaContentRating *)self displayName];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(AVMediaContentRating *)self displayName];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(AVMediaContentRating *)self rank] ^ v4;

  return v5;
}

- (BOOL)isImageMask
{
  v2 = [(AVMediaContentRating *)self displayName];
  BOOL v3 = +[AVMediaContentRatings isRatingImageMask:v2];

  return v3;
}

- (UIImage)image
{
  v2 = [(AVMediaContentRating *)self displayName];
  BOOL v3 = +[AVMediaContentRatings imageForRating:v2];

  return (UIImage *)v3;
}

- (AVMediaContentRating)init
{
  return 0;
}

- (AVMediaContentRating)initWithRating:(id)a3 rank:(int64_t)a4 countryCode:(id)a5 domain:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVMediaContentRating;
  v12 = [(AVMediaContentRating *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;

    v12->_rank = a4;
    uint64_t v15 = [v11 copy];
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v15;

    v12->_domain = a6;
    [(AVMediaContentRating *)v12 _setRestricted:[(AVMediaContentRating *)v12 _isCurrentlyRestricted]];
  }

  return v12;
}

+ (id)contentRestrictionsCountryCode
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  BOOL v3 = [v2 countryCode];

  return v3;
}

@end