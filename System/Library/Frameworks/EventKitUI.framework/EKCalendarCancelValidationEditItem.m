@interface EKCalendarCancelValidationEditItem
- (BOOL)hidden;
- (unint64_t)numberOfSubitems;
- (void)setHidden:(BOOL)a3;
@end

@implementation EKCalendarCancelValidationEditItem

- (unint64_t)numberOfSubitems
{
  return [(EKCalendarCancelValidationEditItem *)self hidden] ^ 1;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

@end