@interface _MPModelLibraryRegisteredTransientState
- (MPSectionedCollection)modelObjects;
- (MPSectionedCollection)relatedModelObjects;
- (NSUUID)token;
- (int64_t)addState;
- (int64_t)favoriteState;
- (int64_t)keepLocalState;
- (void)setAddState:(int64_t)a3;
- (void)setFavoriteState:(int64_t)a3;
- (void)setKeepLocalState:(int64_t)a3;
- (void)setModelObjects:(id)a3;
- (void)setRelatedModelObjects:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation _MPModelLibraryRegisteredTransientState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);

  objc_storeStrong((id *)&self->_modelObjects, 0);
}

- (void)setToken:(id)a3
{
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setRelatedModelObjects:(id)a3
{
}

- (MPSectionedCollection)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setModelObjects:(id)a3
{
}

- (MPSectionedCollection)modelObjects
{
  return self->_modelObjects;
}

- (void)setFavoriteState:(int64_t)a3
{
  self->_favoriteState = a3;
}

- (int64_t)favoriteState
{
  return self->_favoriteState;
}

- (void)setKeepLocalState:(int64_t)a3
{
  self->_keepLocalState = a3;
}

- (int64_t)keepLocalState
{
  return self->_keepLocalState;
}

- (void)setAddState:(int64_t)a3
{
  self->_addState = a3;
}

- (int64_t)addState
{
  return self->_addState;
}

@end