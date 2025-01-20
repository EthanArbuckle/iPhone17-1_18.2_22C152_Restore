@interface AVAssetClientURLRequestHelper
- (AVAssetClientURLRequestHelper)initWithAsset:(id)a3;
- (AVAssetResourceLoader)resourceLoader;
- (OpaqueFigAsset)figAsset;
- (id)URLAsset;
- (id)figAssetProvider;
- (void)dealloc;
- (void)setFigAssetProvider:(id)a3;
- (void)setResourceLoader:(id)a3;
@end

@implementation AVAssetClientURLRequestHelper

- (AVAssetClientURLRequestHelper)initWithAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetClientURLRequestHelper;
  v4 = [(AVAssetClientURLRequestHelper *)&v6 init];
  if (v4)
  {
    v4->_weakReferenceToSelf = [[AVWeakReference alloc] initWithReferencedObject:v4];
    v4->_weakReferenceToAsset = (AVWeakReference *)(id)[a3 _weakReference];
  }
  return v4;
}

- (void)setFigAssetProvider:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetClientURLRequestHelper;
  [(AVAssetClientURLRequestHelper *)&v3 dealloc];
}

- (id)URLAsset
{
  return [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
}

- (OpaqueFigAsset)figAsset
{
  result = (OpaqueFigAsset *)self->_figAssetProvider;
  if (result) {
    return (OpaqueFigAsset *)(*((uint64_t (**)(void))result + 2))();
  }
  return result;
}

- (AVAssetResourceLoader)resourceLoader
{
  return (AVAssetResourceLoader *)[(AVWeakReference *)self->_weakReferenceToResourceLoader referencedObject];
}

- (void)setResourceLoader:(id)a3
{
  self->_weakReferenceToResourceLoader = [[AVWeakReference alloc] initWithReferencedObject:a3];
}

- (id)figAssetProvider
{
  return self->_figAssetProvider;
}

@end