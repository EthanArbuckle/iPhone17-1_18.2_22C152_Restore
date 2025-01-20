@interface CKDAppContainerAccountMetadata
- (CKContainerOptions)containerOptions;
- (CKDAppContainerAccountMetadata)init;
- (CKDAppContainerAccountMetadata)initWithContainerOptions:(id)a3 tokenRegistered:(int64_t)a4;
- (int64_t)tokenRegistered;
- (void)setContainerOptions:(id)a3;
- (void)setTokenRegistered:(int64_t)a3;
@end

@implementation CKDAppContainerAccountMetadata

- (int64_t)tokenRegistered
{
  return self->_tokenRegistered;
}

- (void)setTokenRegistered:(int64_t)a3
{
  self->_tokenRegistered = a3;
}

- (void)setContainerOptions:(id)a3
{
}

- (CKDAppContainerAccountMetadata)init
{
  return (CKDAppContainerAccountMetadata *)objc_msgSend_initWithContainerOptions_tokenRegistered_(self, a2, 0, -1);
}

- (CKDAppContainerAccountMetadata)initWithContainerOptions:(id)a3 tokenRegistered:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDAppContainerAccountMetadata;
  v8 = [(CKDAppContainerAccountMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_containerOptions, a3);
    v9->_tokenRegistered = a4;
  }

  return v9;
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (void).cxx_destruct
{
}

@end