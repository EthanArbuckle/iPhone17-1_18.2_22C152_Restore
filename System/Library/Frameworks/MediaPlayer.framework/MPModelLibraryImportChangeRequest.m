@interface MPModelLibraryImportChangeRequest
- (BOOL)shouldLibraryAdd;
- (MPModelObject)referralObject;
- (MPSectionedCollection)modelObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setModelObjects:(id)a3;
- (void)setReferralObject:(id)a3;
- (void)setShouldLibraryAdd:(BOOL)a3;
@end

@implementation MPModelLibraryImportChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObjects, 0);

  objc_storeStrong((id *)&self->_referralObject, 0);
}

- (void)setShouldLibraryAdd:(BOOL)a3
{
  self->_shouldLibraryAdd = a3;
}

- (BOOL)shouldLibraryAdd
{
  return self->_shouldLibraryAdd;
}

- (void)setModelObjects:(id)a3
{
}

- (MPSectionedCollection)modelObjects
{
  return self->_modelObjects;
}

- (void)setReferralObject:(id)a3
{
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
  [v5 performLibraryImportChangeRequest:self withRelatedModelObjects:0 completion:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MPModelLibraryImportChangeRequestOperation);
  [(MPModelLibraryImportChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryImportChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_modelObjects);
    *((unsigned char *)v5 + 8) = self->_shouldLibraryAdd;
    objc_storeStrong(v5 + 2, self->_referralObject);
  }
  return v5;
}

@end