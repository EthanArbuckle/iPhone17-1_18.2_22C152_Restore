@interface CNComposeRecipientNameOptions
- (unint64_t)shortNameFormat;
- (void)setShortNameFormat:(unint64_t)a3;
@end

@implementation CNComposeRecipientNameOptions

- (unint64_t)shortNameFormat
{
  return self->_shortNameFormat;
}

- (void)setShortNameFormat:(unint64_t)a3
{
  self->_shortNameFormat = a3;
}

@end