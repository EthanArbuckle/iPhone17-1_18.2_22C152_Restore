@interface _AFUIFakeTraitsClass
- (BOOL)displaySecureTextUsingPlainText;
- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3;
@end

@implementation _AFUIFakeTraitsClass

- (BOOL)displaySecureTextUsingPlainText
{
  return self->_displaySecureTextUsingPlainText;
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  self->_displaySecureTextUsingPlainText = a3;
}

@end