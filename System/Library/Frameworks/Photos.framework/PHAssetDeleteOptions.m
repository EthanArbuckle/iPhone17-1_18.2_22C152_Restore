@interface PHAssetDeleteOptions
- (BOOL)shouldExpungeFromLocalStorageOnly;
- (PHAssetDeleteOptions)init;
- (PHAssetDeleteOptions)initWithXPCDict:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)expungeSource;
- (void)encodeToXPCDict:(id)a3;
- (void)setExpungeSource:(int64_t)a3;
- (void)setShouldExpungeFromLocalStorageOnly:(BOOL)a3;
@end

@implementation PHAssetDeleteOptions

- (void)setShouldExpungeFromLocalStorageOnly:(BOOL)a3
{
  self->_shouldExpungeFromLocalStorageOnly = a3;
}

- (BOOL)shouldExpungeFromLocalStorageOnly
{
  return self->_shouldExpungeFromLocalStorageOnly;
}

- (void)setExpungeSource:(int64_t)a3
{
  self->_expungeSource = a3;
}

- (int64_t)expungeSource
{
  return self->_expungeSource;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHAssetDeleteOptions);
  [(PHAssetDeleteOptions *)v4 setShouldExpungeFromLocalStorageOnly:self->_shouldExpungeFromLocalStorageOnly];
  [(PHAssetDeleteOptions *)v4 setExpungeSource:self->_expungeSource];
  return v4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "deleteOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "shouldExpungeFromLocalStorageOnly", self->_shouldExpungeFromLocalStorageOnly);
  xpc_dictionary_set_int64(xdict, "expungeSource", self->_expungeSource);
}

- (PHAssetDeleteOptions)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v5 = [(PHAssetDeleteOptions *)self init];
  if (v5)
  {
    v6 = xpc_dictionary_get_value(v4, "deleteOptions");
    v7 = v6;
    if (v6)
    {
      v5->_shouldExpungeFromLocalStorageOnly = xpc_dictionary_get_BOOL(v6, "shouldExpungeFromLocalStorageOnly");
      v5->_expungeSource = xpc_dictionary_get_int64(v7, "expungeSource");
    }
  }
  return v5;
}

- (PHAssetDeleteOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAssetDeleteOptions;
  return [(PHAssetDeleteOptions *)&v3 init];
}

@end