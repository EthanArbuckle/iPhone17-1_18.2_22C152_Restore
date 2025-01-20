@interface MKWalletMerchantStylingInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MKWalletMerchantStylingInfo)initWithCoder:(id)a3;
- (MKWalletMerchantStylingInfo)initWithStyleAttributes:(id)a3;
- (id)_featureStyleAttributes;
- (id)description;
- (id)imageForSize:(unint64_t)a3 scale:(double)a4;
- (id)imageForSize:(unint64_t)a3 scale:(double)a4 transparent:(BOOL)a5;
- (id)tintColorForScale:(double)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKWalletMerchantStylingInfo

- (void).cxx_destruct
{
}

- (id)tintColorForScale:(double)a3
{
  v4 = [(MKWalletMerchantStylingInfo *)self _featureStyleAttributes];
  v5 = +[MKIconManager newFillColorForStyleAttributes:v4 forScale:a3];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F428B8] colorWithCGColor:v5];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageForSize:(unint64_t)a3 scale:(double)a4 transparent:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [(MKWalletMerchantStylingInfo *)self _featureStyleAttributes];
  v9 = +[MKIconManager imageForStyle:v8 size:a3 forScale:0 format:v5 transparent:a4];

  return v9;
}

- (id)_featureStyleAttributes
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F64AA8]) initWithData:self->_styleAttributesData];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F645A0]) initWithPlaceStyleAttributes:v2];

  return v3;
}

- (MKWalletMerchantStylingInfo)initWithStyleAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantStylingInfo;
  BOOL v5 = [(MKWalletMerchantStylingInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 data];
    styleAttributesData = v5->_styleAttributesData;
    v5->_styleAttributesData = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKWalletMerchantStylingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantStylingInfo;
  BOOL v5 = [(MKWalletMerchantStylingInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    styleAttributesData = v5->_styleAttributesData;
    v5->_styleAttributesData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = v4[1];
    if (v5 | (unint64_t)self->_styleAttributesData) {
      char v6 = objc_msgSend((id)v5, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)imageForSize:(unint64_t)a3 scale:(double)a4
{
  return [(MKWalletMerchantStylingInfo *)self imageForSize:a3 scale:0 transparent:a4];
}

- (id)description
{
  v2 = [(MKWalletMerchantStylingInfo *)self _featureStyleAttributes];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    if ([v2 countAttrs])
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        -[__CFString appendFormat:](v3, "appendFormat:", @"%u,%d; ",
          *(unsigned int *)([v2 v] + v4),
          *(unsigned int *)([v2 v] + v4 + 4));
        ++v5;
        v4 += 8;
      }
      while (v5 < [v2 countAttrs]);
    }
  }
  else
  {
    v3 = @"(null)";
  }

  return v3;
}

@end