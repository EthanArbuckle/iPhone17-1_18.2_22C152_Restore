@interface MPModelLibraryFavoriteEntityChangeRequest
- (MPModelLibraryFavoriteEntityRequestAction)requestAction;
- (MPModelObject)modelObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setModelObject:(id)a3;
- (void)setRequestAction:(id)a3;
@end

@implementation MPModelLibraryFavoriteEntityChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAction, 0);

  objc_storeStrong((id *)&self->_modelObject, 0);
}

- (void)setRequestAction:(id)a3
{
}

- (MPModelLibraryFavoriteEntityRequestAction)requestAction
{
  return self->_requestAction;
}

- (void)setModelObject:(id)a3
{
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryFavoriteEntityChangeRequestOperation);
  [(MPModelLibraryFavoriteEntityChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryFavoriteEntityChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_modelObject);
    objc_storeStrong(v5 + 2, self->_requestAction);
  }
  return v5;
}

@end