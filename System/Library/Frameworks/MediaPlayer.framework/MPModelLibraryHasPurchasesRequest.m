@interface MPModelLibraryHasPurchasesRequest
- (MPMediaLibrary)mediaLibrary;
- (MPModelKind)itemKind;
- (MPModelObject)modelObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setItemKind:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setModelObject:(id)a3;
@end

@implementation MPModelLibraryHasPurchasesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);

  objc_storeStrong((id *)&self->_modelObject, 0);
}

- (void)setItemKind:(id)a3
{
}

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (void)setMediaLibrary:(id)a3
{
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
  v5 = objc_alloc_init(MPModelLibraryHasPurchasesRequestOperation);
  [(MPModelLibraryHasPurchasesRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryHasPurchasesRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = [(MPModelLibraryHasPurchasesRequest *)self modelObject];
    [v4 setModelObject:v5];

    v6 = [(MPModelLibraryHasPurchasesRequest *)self itemKind];
    [v4 setItemKind:v6];

    v7 = [(MPModelLibraryHasPurchasesRequest *)self mediaLibrary];
    [v4 setMediaLibrary:v7];
  }
  return v4;
}

- (MPMediaLibrary)mediaLibrary
{
  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
  {
    v3 = mediaLibrary;
  }
  else
  {
    v3 = +[MPMediaLibrary deviceMediaLibrary];
  }

  return v3;
}

@end