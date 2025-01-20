@interface _NSBundleODRDataForExtensions
+ (_NSBundleODRDataForExtensions)dataForBundle:(int)a3 createIfRequired:;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)accessSandboxExtension:(id)a3;
- (void)dealloc;
- (void)hostApplicationAssetPacksBecameAvailable:(id)a3;
- (void)hostApplicationAssetPacksBecameUnavailable:(id)a3;
@end

@implementation _NSBundleODRDataForExtensions

+ (_NSBundleODRDataForExtensions)dataForBundle:(int)a3 createIfRequired:
{
  self;
  if (qword_1EB1E85C0 != -1) {
    dispatch_once(&qword_1EB1E85C0, &__block_literal_global_221);
  }
  [(id)qword_1EB1E85B8 lock];
  v5 = (NSMapTable *)qword_1EB1E85B0;
  if (!qword_1EB1E85B0)
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v5 = +[NSMapTable strongToStrongObjectsMapTable];
    qword_1EB1E85B0 = (uint64_t)v5;
  }
  uint64_t v6 = [(NSMapTable *)v5 objectForKey:a2];
  v7 = (_NSBundleODRDataForExtensions *)v6;
  if (a3 && !v6)
  {
    v7 = [(_NSBundleODRDataCommon *)[_NSBundleODRDataForExtensions alloc] initWithBundle:a2];
    [(id)qword_1EB1E85B0 setObject:v7 forKey:a2];
    v8 = v7;
  }
LABEL_10:
  [(id)qword_1EB1E85B8 unlock];
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSXPCConnection *)self->_connection invalidate];

  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataForExtensions;
  [(_NSBundleODRDataCommon *)&v3 dealloc];
}

- (void)accessSandboxExtension:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a3 UTF8String];
  int64_t v4 = sandbox_extension_consume();
  self->super._sandboxToken = v4;
  if (v4 < 0)
  {
    int v5 = *__error();
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    uint64_t v6 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest encountered a sandboxing error (extensions): %d", (uint8_t *)v7, 8u);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  self->_connection = (NSXPCConnection *)a4;
  return 1;
}

- (void)hostApplicationAssetPacksBecameAvailable:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 0;
  if (![(_NSBundleODRDataCommon *)self assetPacksBecameAvailable:a3 error:&v4])
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    objc_super v3 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_181795000, v3, OS_LOG_TYPE_ERROR, "Error in extension adding asset packs: %@", buf, 0xCu);
    }
  }
}

- (void)hostApplicationAssetPacksBecameUnavailable:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (![(_NSBundleODRDataCommon *)self assetPacksBecameUnavailable:a3 error:0])
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    objc_super v3 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      uint64_t v5 = 0;
      _os_log_error_impl(&dword_181795000, v3, OS_LOG_TYPE_ERROR, "Error in extension removing asset packs: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end