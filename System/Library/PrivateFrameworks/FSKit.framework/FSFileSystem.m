@interface FSFileSystem
- (FSModuleExtension)extension;
- (NSError)errorState;
- (int64_t)containerState;
- (void)setContainerState:(int64_t)a3;
- (void)setErrorState:(id)a3;
- (void)setExtension:(id)a3;
- (void)wipeResource:(id)a3 completionHandler:(id)a4;
- (void)wipeResource:(id)a3 reply:(id)a4;
@end

@implementation FSFileSystem

- (void)wipeResource:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FSFileSystem *)self extension];
  +[FSFileSystemBasis wipeResource:v7 extension:v8 completionHandler:v6];
}

- (void)wipeResource:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FSFileSystem *)self extension];
  +[FSFileSystemBasis wipeResource:v7 extension:v8 completionHandler:v6];
}

- (int64_t)containerState
{
  return self->containerState;
}

- (void)setContainerState:(int64_t)a3
{
  self->containerState = a3;
}

- (NSError)errorState
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorState:(id)a3
{
}

- (FSModuleExtension)extension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->errorState, 0);
}

@end