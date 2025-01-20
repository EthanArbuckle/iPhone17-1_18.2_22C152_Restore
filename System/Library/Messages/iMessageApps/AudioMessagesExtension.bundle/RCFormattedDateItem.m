@interface RCFormattedDateItem
- (NSString)formattedDate;
- (double)expiration;
- (void)setExpiration:(double)a3;
- (void)setFormattedDate:(id)a3;
@end

@implementation RCFormattedDateItem

- (NSString)formattedDate
{
  return self->_formattedDate;
}

- (void)setFormattedDate:(id)a3
{
}

- (double)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (void).cxx_destruct
{
}

@end