@interface FKOrderMessagesPreviewMetadataText
- (CGColor)overrideColor;
- (NSString)text;
- (id)_initWithText:(id)a3;
- (void)dealloc;
@end

@implementation FKOrderMessagesPreviewMetadataText

- (id)_initWithText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKOrderMessagesPreviewMetadataText;
  v5 = [(FKOrderMessagesPreviewMetadataText *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 text];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_overrideColor = CGColorRetain((CGColorRef)[v4 overrideColor]);
  }

  return v5;
}

- (void)dealloc
{
  CGColorRelease(self->_overrideColor);
  v3.receiver = self;
  v3.super_class = (Class)FKOrderMessagesPreviewMetadataText;
  [(FKOrderMessagesPreviewMetadataText *)&v3 dealloc];
}

- (NSString)text
{
  return self->_text;
}

- (CGColor)overrideColor
{
  return self->_overrideColor;
}

- (void).cxx_destruct
{
}

@end