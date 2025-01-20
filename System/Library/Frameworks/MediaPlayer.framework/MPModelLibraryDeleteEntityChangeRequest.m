@interface MPModelLibraryDeleteEntityChangeRequest
- (MPModelObject)modelObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setModelObject:(id)a3;
@end

@implementation MPModelLibraryDeleteEntityChangeRequest

- (void).cxx_destruct
{
}

- (void)setModelObject:(id)a3
{
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
  [v5 performDeleteEntityChangeRequest:self withRelatedModelObjects:0 completion:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MPModelLibraryDeleteEntityChangeRequestOperation);
  [(MPModelLibraryDeleteEntityChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryDeleteEntityChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 1, self->_modelObject);
  }
  return v5;
}

@end