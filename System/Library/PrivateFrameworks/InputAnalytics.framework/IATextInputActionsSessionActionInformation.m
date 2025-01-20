@interface IATextInputActionsSessionActionInformation
- (BOOL)sessionHasDictation;
- (BOOL)sessionHasOnlyPrimaryInput;
- (NSString)sessionActionsString;
- (void)setSessionActionsString:(id)a3;
- (void)setSessionHasDictation:(BOOL)a3;
- (void)setSessionHasOnlyPrimaryInput:(BOOL)a3;
@end

@implementation IATextInputActionsSessionActionInformation

- (NSString)sessionActionsString
{
  return self->_sessionActionsString;
}

- (void)setSessionActionsString:(id)a3
{
}

- (BOOL)sessionHasOnlyPrimaryInput
{
  return self->_sessionHasOnlyPrimaryInput;
}

- (void)setSessionHasOnlyPrimaryInput:(BOOL)a3
{
  self->_sessionHasOnlyPrimaryInput = a3;
}

- (BOOL)sessionHasDictation
{
  return self->_sessionHasDictation;
}

- (void)setSessionHasDictation:(BOOL)a3
{
  self->_sessionHasDictation = a3;
}

- (void).cxx_destruct
{
}

@end