@interface AVAssetSynchronousInspectorLoader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVAssetSynchronousInspectorLoader)initWithAssetInspector:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (id)assetInspector;
- (id)lyrics;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5;
@end

@implementation AVAssetSynchronousInspectorLoader

- (AVAssetSynchronousInspectorLoader)initWithAssetInspector:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetSynchronousInspectorLoader;
  v4 = [(AVAssetInspectorLoader *)&v6 init];
  if (v4) {
    v4->_assetInspector = (AVAssetInspector *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetSynchronousInspectorLoader;
  [(AVAssetInspectorLoader *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  assetInspector = self->_assetInspector;
  uint64_t v6 = [a3 assetInspector];
  return [(AVAssetInspector *)assetInspector isEqual:v6];
}

- (unint64_t)hash
{
  return [(AVAssetInspector *)self->_assetInspector hash];
}

- (id)assetInspector
{
  return self->_assetInspector;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_assetInspector;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result duration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (id)lyrics
{
  return [(AVAssetInspector *)self->_assetInspector lyrics];
}

- (BOOL)isPlayable
{
  return [(AVAssetInspector *)self->_assetInspector isPlayable];
}

- (BOOL)isExportable
{
  return [(AVAssetInspector *)self->_assetInspector isExportable];
}

- (BOOL)isReadable
{
  return [(AVAssetInspector *)self->_assetInspector isReadable];
}

- (BOOL)isComposable
{
  return [(AVAssetInspector *)self->_assetInspector isComposable];
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return [(AVAssetInspector *)self->_assetInspector isCompatibleWithSavedPhotosAlbum];
}

@end