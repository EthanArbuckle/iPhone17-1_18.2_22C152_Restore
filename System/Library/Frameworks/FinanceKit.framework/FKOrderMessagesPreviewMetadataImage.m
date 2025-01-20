@interface FKOrderMessagesPreviewMetadataImage
- (NSData)data;
- (id)_initWithImage:(id)a3;
- (unint64_t)kind;
@end

@implementation FKOrderMessagesPreviewMetadataImage

- (id)_initWithImage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKOrderMessagesPreviewMetadataImage;
  v5 = [(FKOrderMessagesPreviewMetadataImage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 data];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_kind = [v4 kind];
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

@end