@interface AVSampleBufferAudioRendererLoggingIdentifier
- (AVSampleBufferAudioRendererLoggingIdentifier)init;
- (NSString)name;
- (void)dealloc;
@end

@implementation AVSampleBufferAudioRendererLoggingIdentifier

- (AVSampleBufferAudioRendererLoggingIdentifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferAudioRendererLoggingIdentifier;
  v2 = [(AVSampleBufferAudioRendererLoggingIdentifier *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVSampleBufferAudioRendererLoggingIdentifierInternal);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->identifierName = (NSString *)[[NSString alloc] initWithFormat:@"P/%@", (id)FigCFStringCreateLoggingIdentifierOfLength()];
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
  v4.super_class = (Class)AVSampleBufferAudioRendererLoggingIdentifier;
  [(AVSampleBufferAudioRendererLoggingIdentifier *)&v4 dealloc];
}

- (NSString)name
{
  return (NSString *)[NSString stringWithString:self->_priv->identifierName];
}

@end