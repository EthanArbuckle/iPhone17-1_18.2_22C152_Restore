@interface AVUnitTestUnplayableAPACAssetTrackInspector
- (BOOL)isPlayable;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (void)dealloc;
@end

@implementation AVUnitTestUnplayableAPACAssetTrackInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  return [(AVFigAssetTrackInspector *)&v6 _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:a5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  [(AVFigAssetTrackInspector *)&v2 dealloc];
}

- (BOOL)isPlayable
{
  v6.receiver = self;
  v6.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  v3 = (const opaqueCMFormatDescription *)objc_msgSend(-[AVFigAssetTrackInspector formatDescriptions](&v6, sel_formatDescriptions), "objectAtIndexedSubscript:", 0);
  if (CMFormatDescriptionGetMediaSubType(v3) == 1634754915) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AVUnitTestUnplayableAPACAssetTrackInspector;
  return [(AVFigAssetTrackInspector *)&v5 isPlayable];
}

@end