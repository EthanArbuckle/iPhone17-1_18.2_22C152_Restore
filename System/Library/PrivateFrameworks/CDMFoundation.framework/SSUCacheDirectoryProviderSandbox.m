@interface SSUCacheDirectoryProviderSandbox
- (NSURL)directory;
- (SSUCacheDirectoryProviderSandbox)initWithDirectory:(id)a3;
- (id)lookupOrCreateCacheDirectory:(id *)a3;
@end

@implementation SSUCacheDirectoryProviderSandbox

- (void).cxx_destruct
{
}

- (NSURL)directory
{
  return self->_directory;
}

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  return self->_directory;
}

- (SSUCacheDirectoryProviderSandbox)initWithDirectory:(id)a3
{
  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSUCacheDirectoryProviderSandbox;
  v5 = [(SSUCacheDirectoryProviderSandbox *)&v8 init];
  directory = v5->_directory;
  v5->_directory = v4;

  return v5;
}

@end