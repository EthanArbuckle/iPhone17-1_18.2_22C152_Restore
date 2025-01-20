@interface ICDFileProviderExtensionBackChannel
- (ICDFileProviderExtensionBackChannel)initWithExtension:(id)a3;
- (void)invalidateExtension;
@end

@implementation ICDFileProviderExtensionBackChannel

- (ICDFileProviderExtensionBackChannel)initWithExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDFileProviderExtensionBackChannel;
  v6 = [(ICDFileProviderExtensionBackChannel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extension, a3);
  }

  return v7;
}

- (void)invalidateExtension
{
}

- (void).cxx_destruct
{
}

@end