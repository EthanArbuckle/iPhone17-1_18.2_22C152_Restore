@interface AVAssetLoggingIdentifier
- (AVAssetLoggingIdentifier)init;
- (NSString)name;
- (id)makeDerivedIdentifier;
- (void)dealloc;
@end

@implementation AVAssetLoggingIdentifier

- (id)makeDerivedIdentifier
{
  ++self->_priv->derivedIdentifierCounter;
  v3 = [AVSpecifiedLoggingIdentifier alloc];
  v4 = -[AVSpecifiedLoggingIdentifier initWithSpecifiedName:](v3, "initWithSpecifiedName:", [NSString stringWithFormat:@"%@.%02d", -[AVAssetLoggingIdentifier name](self, "name"), self->_priv->derivedIdentifierCounter]);
  return v4;
}

- (NSString)name
{
  return (NSString *)[NSString stringWithString:self->_priv->identifierName];
}

- (AVAssetLoggingIdentifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVAssetLoggingIdentifier;
  v2 = [(AVAssetLoggingIdentifier *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVAssetLoggingIdentifierInternal);
    v2->_priv = v3;
    if (v3)
    {
      v3->derivedIdentifierCounter = 0;
      v2->_priv->identifierName = (NSString *)[[NSString alloc] initWithFormat:@"I/%@", (id)FigCFStringCreateLoggingIdentifierOfLength()];
      CFRetain(v2->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetLoggingIdentifier;
  [(AVAssetLoggingIdentifier *)&v4 dealloc];
}

@end