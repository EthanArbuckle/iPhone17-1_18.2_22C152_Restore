@interface MUAmenityApplePayConfiguration
+ (id)configurationFromAmenityItem:(id)a3;
- (BOOL)showApplePayIcons;
- (MUAmenityItemViewModel)applePayRowAmenity;
- (void)setApplePayRowAmenity:(id)a3;
- (void)setShowApplePayIcons:(BOOL)a3;
@end

@implementation MUAmenityApplePayConfiguration

+ (id)configurationFromAmenityItem:(id)a3
{
  id v3 = a3;
  if ([v3 isApplePayAmenity])
  {
    v4 = objc_alloc_init(MUAmenityApplePayConfiguration);
    -[MUAmenityApplePayConfiguration setShowApplePayIcons:](v4, "setShowApplePayIcons:", [v3 isAmenityPresent]);
    v5 = [v3 amenityTitle];
    uint64_t v6 = [v5 length];

    if (v6) {
      [(MUAmenityApplePayConfiguration *)v4 setApplePayRowAmenity:v3];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MUAmenityItemViewModel)applePayRowAmenity
{
  return self->_applePayRowAmenity;
}

- (void)setApplePayRowAmenity:(id)a3
{
}

- (BOOL)showApplePayIcons
{
  return self->_showApplePayIcons;
}

- (void)setShowApplePayIcons:(BOOL)a3
{
  self->_showApplePayIcons = a3;
}

- (void).cxx_destruct
{
}

@end