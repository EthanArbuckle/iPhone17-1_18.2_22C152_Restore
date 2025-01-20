@interface MPModelLibraryKeepLocalChangeRequest
- (MPModelObject)modelObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)enableState;
- (unint64_t)constraints;
- (void)setConstraints:(unint64_t)a3;
- (void)setEnableState:(int64_t)a3;
- (void)setModelObject:(id)a3;
@end

@implementation MPModelLibraryKeepLocalChangeRequest

- (void).cxx_destruct
{
}

- (void)setConstraints:(unint64_t)a3
{
  self->_constraints = a3;
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
}

- (int64_t)enableState
{
  return self->_enableState;
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
  v5 = objc_alloc_init(MPModelLibraryKeepLocalChangeRequestOperation);
  [(MPModelLibraryKeepLocalChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryKeepLocalChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)v4 + 1, self->_modelObject);
    v5[2] = self->_enableState;
    v5[3] = self->_constraints;
  }
  return v5;
}

@end