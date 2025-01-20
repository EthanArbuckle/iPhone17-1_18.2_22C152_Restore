@interface ACAlertPresentationOptions
- (BOOL)interrupting;
- (BOOL)optional;
- (void)setInterrupting:(BOOL)a3;
- (void)setOptional:(BOOL)a3;
@end

@implementation ACAlertPresentationOptions

- (BOOL)optional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)interrupting
{
  return self->_interrupting;
}

- (void)setInterrupting:(BOOL)a3
{
  self->_interrupting = a3;
}

@end