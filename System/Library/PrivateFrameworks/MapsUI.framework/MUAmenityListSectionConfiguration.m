@interface MUAmenityListSectionConfiguration
- (MUAmenityApplePayConfiguration)applePayConfiguration;
- (NSArray)viewModels;
- (unint64_t)numberInlineAmenities;
- (void)setApplePayConfiguration:(id)a3;
- (void)setNumberInlineAmenities:(unint64_t)a3;
- (void)setViewModels:(id)a3;
@end

@implementation MUAmenityListSectionConfiguration

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (MUAmenityApplePayConfiguration)applePayConfiguration
{
  return self->_applePayConfiguration;
}

- (void)setApplePayConfiguration:(id)a3
{
}

- (unint64_t)numberInlineAmenities
{
  return self->_numberInlineAmenities;
}

- (void)setNumberInlineAmenities:(unint64_t)a3
{
  self->_numberInlineAmenities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayConfiguration, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end