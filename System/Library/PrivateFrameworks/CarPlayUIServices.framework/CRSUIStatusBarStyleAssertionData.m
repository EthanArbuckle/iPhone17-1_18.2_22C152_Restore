@interface CRSUIStatusBarStyleAssertionData
- (BOOL)isSiriPresentation;
- (NSString)identifier;
- (int64_t)colorVariant;
- (int64_t)interfaceStyle;
- (void)setColorVariant:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)setSiriPresentation:(BOOL)a3;
@end

@implementation CRSUIStatusBarStyleAssertionData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (int64_t)colorVariant
{
  return self->_colorVariant;
}

- (void)setColorVariant:(int64_t)a3
{
  self->_colorVariant = a3;
}

- (BOOL)isSiriPresentation
{
  return self->_siriPresentation;
}

- (void)setSiriPresentation:(BOOL)a3
{
  self->_siriPresentation = a3;
}

- (void).cxx_destruct
{
}

@end