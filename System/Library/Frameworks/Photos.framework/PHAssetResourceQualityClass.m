@interface PHAssetResourceQualityClass
+ (id)_cplDerivativeAssetResourceQualityClasses;
+ (id)_thumbnailAssetResourceQualityClassesForCurrentDeviceInLibrary:(id)a3;
+ (id)allQualityClassesMatchingPredicate:(id)a3 inLibrary:(id)a4;
+ (id)anyQualityClassMatchingPredicate:(id)a3 inLibrary:(id)a4;
+ (id)assetResourceQualityClassesInLibrary:(id)a3;
- (BOOL)isCroppedToSquare;
- (BOOL)isTable;
- (BOOL)isThumbnail;
- (BOOL)isVideo;
- (PHAssetResourceQualityClass)initWithCPLResourceType:(unint64_t)a3;
- (PHAssetResourceQualityClass)initWithThumbnailFormat:(id)a3;
- (PLImageFormat)backingImageFormat;
- (__CFString)colorSpaceName;
- (id)description;
- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4;
- (id)tableThumbnailEntriesAtIndexes:(id)a3 inLibrary:(id)a4;
- (int64_t)_compare:(id)a3;
- (int64_t)thumbnailKind;
- (unint64_t)backingCPLResourceType;
- (unint64_t)maxNumberOfPixelsIfSquare;
- (unint64_t)maxSideLengthIfSquare;
- (unint64_t)metalPixelFormat;
- (void)preheatDataForThumbnailIndexes:(id)a3 inLibrary:(id)a4;
- (void)setBackingCPLResourceType:(unint64_t)a3;
- (void)setBackingImageFormat:(id)a3;
@end

@implementation PHAssetResourceQualityClass

- (unint64_t)metalPixelFormat
{
  return self->_metalPixelFormat;
}

- (BOOL)isCroppedToSquare
{
  return self->_croppedToSquare;
}

- (__CFString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (BOOL)isTable
{
  return self->_table;
}

- (int64_t)_compare:(id)a3
{
  id v4 = a3;
  unint64_t maxSideLengthIfSquare = self->_maxSideLengthIfSquare;
  if (maxSideLengthIfSquare <= [v4 maxSideLengthIfSquare])
  {
    unint64_t v7 = self->_maxSideLengthIfSquare;
    if (v7 >= [v4 maxSideLengthIfSquare]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)maxSideLengthIfSquare
{
  return self->_maxSideLengthIfSquare;
}

- (void).cxx_destruct
{
}

uint64_t __76__PHAssetResourceQualityClass_allQualityClassesMatchingPredicate_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_compare:");
}

+ (id)allQualityClassesMatchingPredicate:(id)a3 inLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [(id)objc_opt_class() assetResourceQualityClassesInLibrary:v5];

  v8 = [v7 filteredArrayUsingPredicate:v6];

  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_40037];

  return v9;
}

+ (id)assetResourceQualityClassesInLibrary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  unint64_t v7 = [a1 _thumbnailAssetResourceQualityClassesForCurrentDeviceInLibrary:v5];

  [v6 addObjectsFromArray:v7];
  v8 = [a1 _cplDerivativeAssetResourceQualityClasses];
  [v6 addObjectsFromArray:v8];

  return v6;
}

+ (id)_cplDerivativeAssetResourceQualityClasses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_1EEB26D30 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EEB26D30);
        }
        unint64_t v7 = -[PHAssetResourceQualityClass initWithCPLResourceType:]([PHAssetResourceQualityClass alloc], "initWithCPLResourceType:", [*(id *)(*((void *)&v9 + 1) + 8 * i) integerValue]);
        [v2 addObject:v7];
      }
      uint64_t v4 = [&unk_1EEB26D30 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return v2;
}

- (PHAssetResourceQualityClass)initWithCPLResourceType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHAssetResourceQualityClass;
  uint64_t v4 = [(PHAssetResourceQualityClass *)&v9 init];
  uint64_t v5 = (PHAssetResourceQualityClass *)v4;
  if (v4)
  {
    *(_WORD *)(v4 + 9) = 0;
    BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 6 || a3 == 28;
    *((void *)v4 + 3) = a3;
    *((void *)v4 + 4) = 0;
    v4[8] = v6;
    if (a3 > 0x1C || ((1 << a3) & 0x100000C0) == 0)
    {
      unint64_t v7 = [MEMORY[0x1E4F59940] maxPixelSizeForResourceType:a3];
      v5->_unint64_t maxSideLengthIfSquare = (unint64_t)sqrt((double)v7);
      v5->_maxNumberOfPixelsIfSquare = v7;
    }
  }
  return v5;
}

+ (id)_thumbnailAssetResourceQualityClassesForCurrentDeviceInLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 pathManager];
  uint64_t v4 = [MEMORY[0x1E4F8AC48] thumbnailFormatsForConfigPhase:1 withPathManager:v3];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = [PHAssetResourceQualityClass alloc];
        v13 = -[PHAssetResourceQualityClass initWithThumbnailFormat:](v12, "initWithThumbnailFormat:", v11, (void)v15);
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (PHAssetResourceQualityClass)initWithThumbnailFormat:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAssetResourceQualityClass;
  id v6 = [(PHAssetResourceQualityClass *)&v9 init];
  if (v6)
  {
    v6->_croppedToSquare = [v5 isCropped];
    v6->_table = [v5 isTable];
    objc_storeStrong((id *)&v6->_backingImageFormat, a3);
    v6->_video = 0;
    v6->_thumbnailKind = [v5 thumbnailKind];
    v6->_metalPixelFormat = [v5 metalPixelFormat];
    v6->_colorSpaceName = (__CFString *)[v5 colorSpaceName];
    [v5 dimension];
    v6->_unint64_t maxSideLengthIfSquare = (unint64_t)v7;
    v6->_maxNumberOfPixelsIfSquare = (unint64_t)v7 * (unint64_t)v7;
  }

  return v6;
}

- (BOOL)isThumbnail
{
  return [(PHAssetResourceQualityClass *)self thumbnailKind] != 0;
}

- (int64_t)thumbnailKind
{
  return self->_thumbnailKind;
}

- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHAssetResourceQualityClass.m", 134, @"Invalid parameter not satisfying: %@", @"thumbnailAsset" object file lineNumber description];
  }
  if ([(PHAssetResourceQualityClass *)self isThumbnail]
    && [v7 thumbnailIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = [v7 photoLibrary];
    long long v10 = [v9 photoLibrary];
    uint64_t v11 = [v10 thumbnailManager];

    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v23 = 0;
    long long v12 = [(PHAssetResourceQualityClass *)self backingImageFormat];
    uint64_t v8 = objc_msgSend(v11, "dataForPhoto:format:allowPlaceholder:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v7, objc_msgSend(v12, "formatID"), 0, (char *)&v25 + 4, &v25, (char *)&v24 + 4, &v24, (char *)&v23 + 4, &v23);

    uint64_t v13 = [v8 length];
    if (a4 && v13)
    {
      int v15 = v25;
      int v14 = HIDWORD(v25);
      int v17 = v24;
      int v16 = HIDWORD(v24);
      uint64_t v22 = v23;
      long long v18 = [(PHAssetResourceQualityClass *)self backingImageFormat];
      int64_t v19 = [v18 thumbnailKind];

      a4->var0 = v14;
      a4->var1 = v15;
      a4->var2 = v16;
      a4->var3 = v17;
      a4->var4 = HIDWORD(v22);
      a4->var5 = v22;
      a4->var6 = v19;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PLImageFormat)backingImageFormat
{
  return self->_backingImageFormat;
}

- (unint64_t)maxNumberOfPixelsIfSquare
{
  return self->_maxNumberOfPixelsIfSquare;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setBackingCPLResourceType:(unint64_t)a3
{
  self->_backingCPLResourceType = a3;
}

- (unint64_t)backingCPLResourceType
{
  return self->_backingCPLResourceType;
}

- (void)setBackingImageFormat:(id)a3
{
}

- (id)description
{
  if ([(PHAssetResourceQualityClass *)self isTable])
  {
    uint64_t v3 = @"table";
  }
  else if ([(PHAssetResourceQualityClass *)self isThumbnail])
  {
    uint64_t v3 = @"master_thumb";
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:self->_backingCPLResourceType];
  }
  v7.receiver = self;
  v7.super_class = (Class)PHAssetResourceQualityClass;
  uint64_t v4 = [(PHAssetResourceQualityClass *)&v7 description];
  id v5 = [v4 stringByAppendingFormat:@" - %@, kind: %lu, side length: %lu", v3, -[PHAssetResourceQualityClass thumbnailKind](self, "thumbnailKind"), self->_maxSideLengthIfSquare];

  return v5;
}

- (void)preheatDataForThumbnailIndexes:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  objc_super v7 = [a4 photoLibrary];
  id v9 = [v7 thumbnailManager];

  uint64_t v8 = [(PHAssetResourceQualityClass *)self backingImageFormat];
  objc_msgSend(v9, "preheatThumbnailDataWithFormat:thumbnailIndexes:", objc_msgSend(v8, "formatID"), v6);
}

- (id)tableThumbnailEntriesAtIndexes:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PHAssetResourceQualityClass *)self backingImageFormat];
  int v9 = [v8 isTable];

  if (v9)
  {
    long long v10 = [v7 photoLibrary];
    uint64_t v11 = [v10 thumbnailManager];

    long long v12 = [(PHAssetResourceQualityClass *)self backingImageFormat];
    uint64_t v13 = objc_msgSend(v11, "thumbManagerForFormatID:", objc_msgSend(v12, "formatID"));

    int v14 = [v13 readImageEntriesAtIndexes:v6];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

+ (id)anyQualityClassMatchingPredicate:(id)a3 inLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() assetResourceQualityClassesInLibrary:v5];

  uint64_t v8 = [v7 filteredArrayUsingPredicate:v6];

  int v9 = [v8 firstObject];

  return v9;
}

@end