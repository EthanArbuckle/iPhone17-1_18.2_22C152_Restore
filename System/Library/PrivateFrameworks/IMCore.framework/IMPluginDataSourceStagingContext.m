@interface IMPluginDataSourceStagingContext
+ (IMPluginDataSourceStagingContext)stagingContextWithIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4;
- (BOOL)isEmbeddedInTextView;
- (IMPluginDataSourceStagingContext)initWithTransientIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4;
- (NSString)transientIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIsEmbeddedInTextView:(BOOL)a3;
- (void)setTransientIdentifier:(id)a3;
@end

@implementation IMPluginDataSourceStagingContext

- (IMPluginDataSourceStagingContext)initWithTransientIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMPluginDataSourceStagingContext;
  v8 = [(IMPluginDataSourceStagingContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transientIdentifier, a3);
    v9->_isEmbeddedInTextView = a4;
  }

  return v9;
}

+ (IMPluginDataSourceStagingContext)stagingContextWithIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [IMPluginDataSourceStagingContext alloc];
  isEmbeddedInTextView = objc_msgSend_initWithTransientIdentifier_isEmbeddedInTextView_(v6, v7, (uint64_t)v5, v4);

  return (IMPluginDataSourceStagingContext *)isEmbeddedInTextView;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [IMPluginDataSourceStagingContext alloc];
  v8 = objc_msgSend_transientIdentifier(self, v5, v6, v7);
  uint64_t isEmbeddedInTextView = objc_msgSend_isEmbeddedInTextView(self, v9, v10, v11);
  v14 = objc_msgSend_initWithTransientIdentifier_isEmbeddedInTextView_(v4, v13, (uint64_t)v8, isEmbeddedInTextView);

  return v14;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (void)setTransientIdentifier:(id)a3
{
}

- (BOOL)isEmbeddedInTextView
{
  return self->_isEmbeddedInTextView;
}

- (void)setIsEmbeddedInTextView:(BOOL)a3
{
  self->_uint64_t isEmbeddedInTextView = a3;
}

- (void).cxx_destruct
{
}

@end