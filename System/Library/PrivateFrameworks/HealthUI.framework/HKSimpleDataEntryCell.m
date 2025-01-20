@interface HKSimpleDataEntryCell
- (BOOL)editDisabled;
- (void)beginEditing;
- (void)setEditDisabled:(BOOL)a3;
@end

@implementation HKSimpleDataEntryCell

- (BOOL)editDisabled
{
  return self->_editDisabled;
}

- (void)setEditDisabled:(BOOL)a3
{
  self->_editDisabled = a3;
}

- (void)beginEditing
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end