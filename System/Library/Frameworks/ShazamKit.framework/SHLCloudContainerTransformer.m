@interface SHLCloudContainerTransformer
- (SHLCloudContainerTransformer)initWithScope:(int64_t)a3;
- (id)cloudBackedContainer;
- (int64_t)scope;
- (void)setScope:(int64_t)a3;
@end

@implementation SHLCloudContainerTransformer

- (SHLCloudContainerTransformer)initWithScope:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SHLCloudContainerTransformer;
  result = [(SHLCloudContainerTransformer *)&v5 init];
  if (result) {
    result->_scope = a3;
  }
  return result;
}

- (id)cloudBackedContainer
{
  v3 = +[SHLCloudContext sharedContext];
  v4 = objc_msgSend(v3, "containerWithScope:", -[SHLCloudContainerTransformer scope](self, "scope"));

  objc_super v5 = [[SHLCloudBackedContainer alloc] initWithContainer:v4 usingEncryption:(id)[(SHLCloudContainerTransformer *)self scope] == (id)1];

  return v5;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

@end