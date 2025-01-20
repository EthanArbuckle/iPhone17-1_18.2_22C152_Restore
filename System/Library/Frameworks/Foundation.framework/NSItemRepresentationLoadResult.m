@interface NSItemRepresentationLoadResult
+ (id)resultWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6;
+ (id)resultWithError:(id)a3;
- (BOOL)wasOpenedInPlace;
- (Class)archivedObjectClass;
- (NSData)data;
- (NSError)error;
- (NSSecurityScopedURLWrapper)urlWrapper;
- (NSString)archivedObjectClassName;
- (id)cleanupHandler;
- (id)copyWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setArchivedObjectClass:(Class)a3;
- (void)setArchivedObjectClassName:(id)a3;
- (void)setCleanupHandler:(id)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setUrlWrapper:(id)a3;
- (void)setWasOpenedInPlace:(BOOL)a3;
@end

@implementation NSItemRepresentationLoadResult

+ (id)resultWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6
{
  id v10 = objc_alloc_init((Class)a1);
  [v10 setData:a3];
  [v10 setUrlWrapper:a4];
  [v10 setCleanupHandler:a5];
  [v10 setError:a6];

  return v10;
}

+ (id)resultWithError:(id)a3
{
  return (id)[a1 resultWithData:0 urlWrapper:0 cleanupHandler:0 error:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSItemRepresentationLoadResult;
  [(NSItemRepresentationLoadResult *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(NSItemRepresentationLoadResult);
  [(NSItemRepresentationLoadResult *)v4 setData:self->_data];
  [(NSItemRepresentationLoadResult *)v4 setUrlWrapper:self->_urlWrapper];
  [(NSItemRepresentationLoadResult *)v4 setCleanupHandler:self->_cleanupHandler];
  [(NSItemRepresentationLoadResult *)v4 setError:self->_error];
  [(NSItemRepresentationLoadResult *)v4 setWasOpenedInPlace:self->_wasOpenedInPlace];
  [(NSItemRepresentationLoadResult *)v4 setArchivedObjectClass:self->_archivedObjectClass];
  return v4;
}

- (id)copyWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6
{
  id v10 = (void *)[(NSItemRepresentationLoadResult *)self copy];
  [v10 setData:a3];
  [v10 setUrlWrapper:a4];
  [v10 setCleanupHandler:a5];
  [v10 setError:a6];
  return v10;
}

- (NSString)archivedObjectClassName
{
  return 0;
}

- (void)setArchivedObjectClassName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDDF0 != -1) {
    dispatch_once(&qword_1EB1EDDF0, &__block_literal_global_128);
  }
  uint64_t v4 = _MergedGlobals_148;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_148, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_fault_impl(&dword_181795000, v4, OS_LOG_TYPE_FAULT, "It is insecure to set the archived object class name. The class name provided will be ignored: %{public}@. Please use .archivedObjectClass instead and do _NOT_ use NSClassFromString(…) unless you are matching the class to an allow-list.", (uint8_t *)&v5, 0xCu);
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSSecurityScopedURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (void)setUrlWrapper:(id)a3
{
}

- (id)cleanupHandler
{
  return self->_cleanupHandler;
}

- (void)setCleanupHandler:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (Class)archivedObjectClass
{
  return self->_archivedObjectClass;
}

- (void)setArchivedObjectClass:(Class)a3
{
}

- (BOOL)wasOpenedInPlace
{
  return self->_wasOpenedInPlace;
}

- (void)setWasOpenedInPlace:(BOOL)a3
{
  self->_wasOpenedInPlace = a3;
}

@end