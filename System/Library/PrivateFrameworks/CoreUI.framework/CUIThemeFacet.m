@interface CUIThemeFacet
+ (BOOL)assetExistsForRenditionKey:(id)a3 fromTheme:(unint64_t)a4;
+ (id)_bundleIdentifierForThemeRef:(unint64_t)a3;
+ (id)_facetWithKeyList:(const _renditionkeytoken *)a3 andRenditionKeyClass:(Class)a4 orRenditionKey:(id)a5 fromTheme:(unint64_t)a6;
+ (id)_themeStoreForThemeIndex:(unint64_t)a3;
+ (id)cursorFacetWithName:(id)a3 fromTheme:(unint64_t)a4;
+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 dimension1:(int64_t)a5 dimension2:(int64_t)a6 fromTheme:(unint64_t)a7;
+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 fromTheme:(unint64_t)a5;
+ (id)facetWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4;
+ (unint64_t)themeForBundleIdentifier:(id)a3 error:(id *)a4;
+ (unint64_t)themeNamed:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
+ (unint64_t)themeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
+ (unint64_t)themeWithContentsOfURL:(id)a3 error:(id *)a4;
+ (void)_invalidateArtworkCaches;
+ (void)initialize;
+ (void)themeUnregisterThemeRef:(unint64_t)a3;
- (BOOL)_canGetRenditionForKey:(id)a3 withDrawingLayer:(int64_t)a4;
- (BOOL)_isButtonGlyph;
- (BOOL)hasValueSlices;
- (BOOL)hitTestAtPoint:(CGPoint)a3 inFrame:(CGRect)a4 owner:(id)a5 userInfo:(id)a6;
- (BOOL)isTintable;
- (BOOL)isValidButtonImageSource;
- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3;
- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3 renditionKey:(id)a4;
- (CGPoint)_hotSpot;
- (CGSize)_thumbnailSizeForRendition:(id)a3;
- (CGSize)imageSize;
- (CGSize)sizeForSegmentOfType:(int)a3;
- (CGSize)thumbnailSize;
- (CGSize)topLeftCapSize;
- (CUIImage)_imageForRenditionFromKey:(int)a3 withSize:(CGFloat)a4 isMask:(CGFloat)a5;
- (CUIThemeFacet)init;
- (CUIThemeFacet)initWithCoder:(id)a3;
- (CUIThemeFacet)initWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4;
- (NSString)description;
- (_WORD)isValidButtonImageSourceForSize:(_WORD *)result;
- (__n128)_initWithRenditionKey:(uint64_t)a1;
- (double)alpha;
- (double)alphaWithKeyAdjustment:(id)a3;
- (id)_approximateRenditionForRenditionKey:(void *)a1;
- (id)_makeLayerFromCAPackageData;
- (id)_rendition;
- (id)_renditionForSpecificKey:(id)a3;
- (id)_themeStore;
- (id)blendModeAsCAFilterString;
- (id)blendModeAsCAFilterStringWithKeyAjustment:(id)a3;
- (id)displayName;
- (id)gradientWithKeyAdjustment:(id)a3 angle:(double *)a4 style:(unint64_t *)a5;
- (id)highlightWithSize:(CGSize)a3 keyAdjustment:(id)a4;
- (id)image;
- (id)imageForSlice:(int64_t)a3 withKeyAdjustment:(id)a4;
- (id)imageForSliceIndex:(int64_t)a3;
- (id)imageForState:(int64_t)a3;
- (id)imageForState:(int64_t)a3 value:(int64_t)a4;
- (id)imageForState:(int64_t)a3 value:(int64_t)a4 size:(unint64_t)a5;
- (id)imageWithSize:(CGSize)a3 keyAdjustment:(id)a4;
- (id)makeLayer;
- (id)maskForSlice:(int64_t)a3 withKeyAdjustment:(id)a4;
- (id)maskWithSize:(CGSize)a3 keyAdjustment:(id)a4;
- (id)properties;
- (id)renditionKey;
- (id)renditionMetricsWithKeyAdjustment:(id)a3;
- (id)renditionSliceInformationForRect:(CGRect)a3 keyAdjustment:(id)a4;
- (id)themeRendition;
- (id)thumbnail;
- (int)blendMode;
- (int)blendModeWithKeyAdjustment:(id)a3;
- (int64_t)_sliceIndexForSlice:(int64_t)a3 ofRendition:(id)a4;
- (int64_t)renditionType;
- (unint64_t)themeIndex;
- (void)_applyFixedAttributesToKey:(id)a3;
- (void)_drawAsMaskSpecificRenditionKey:(CGContext *)a3 inFrame:(CGBlendMode)a4 context:(int)a5 alpha:(uint64_t)a6 operation:(CGFloat)a7 isFocused:(CGFloat)a8 focusRingColor:(CGFloat)a9;
- (void)_drawMaskFromSpecificRenditionKey:(CGBlendMode)a3 inFrame:(int)a4 alpha:(uint64_t)a5 operation:(CGContext *)a6 isFocused:(CGFloat)a7 focusRingColor:(CGFloat)a8 context:(CGFloat)a9;
- (void)_drawSlice:(int64_t)a3 inFrame:(CGRect)a4 withKeyAdjustment:(id)a5 context:(CGContext *)a6;
- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(uint64_t)a4 context:(uint64_t)a5 isFocused:(unsigned __int8)a6 focusRingColor:(void *)a7 isFlipped:(CGFloat)a8 effects:(CGFloat)a9;
- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(unsigned int)a4 context:(uint64_t)a5 alpha:(uint64_t)a6 operation:(unsigned __int8)a7 isFocused:(void *)a8 focusRingColor:(CGFloat)a9 isFlipped:(CGFloat)a10 effects:(CGFloat)a11;
- (void)_drawSpecificRenditionKey:(void *)a3 rendition:(CGContext *)a4 inFrame:(uint64_t)a5 context:(uint64_t)a6 alpha:(uint64_t)a7 operation:(unsigned __int8)a8 isFocused:(CGFloat)a9 focusRingColor:(CGFloat)a10 isFlipped:(CGFloat)a11 effects:(CGFloat)a12;
- (void)_setHasCheckedButtonGlyph:(BOOL)a3;
- (void)_setIsButtonGlyph:(BOOL)a3;
- (void)_setThemeIndex:(unint64_t)a3;
- (void)_updateSpecificRenditionKey:(id)a3 isFocused:(BOOL *)a4 owner:(id)a5 userInfo:(id)a6;
- (void)dealloc;
- (void)drawAbsoluteAnimationFrame:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7;
- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7;
- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8;
- (void)drawAsOnePartWithSlice:(int)a3 inFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8;
- (void)drawGradientInFrame:(CGRect)a3 angle:(double)a4 alpha:(double)a5 operation:(int)a6 isFocused:(int)a7 focusRingColor:(CGColor *)a8 keyAdjustment:(id)a9 context:(CGContext *)a10 effects:(id)a11;
- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 keyAdjustment:(id)a5 context:(CGContext *)a6;
- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 keyAdjustment:(id)a6 context:(CGContext *)a7;
- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8;
- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7;
- (void)drawHighlightInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 context:(CGContext *)a8 effects:(id)a9;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8;
- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7;
- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 context:(CGContext *)a5;
- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6;
- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6 effects:(id)a7;
- (void)drawInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6;
- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8;
- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9;
- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7;
- (void)drawMaskInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6;
- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8;
- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7;
- (void)drawSegmentInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 segmentType:(int)a6 context:(CGContext *)a7 effects:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)updateLayer:(id)a3;
- (void)updateLayer:(id)a3 effects:(id)a4;
- (void)updateSegmentBezelLeadingCapLayer:(id)a3 bezelFillLayer:(id)a4 trailingBezelCapLayer:(id)a5 forSegmentType:(int)a6 segmentBounds:(CGRect)a7 leadingSeparatorWidth:(double)a8 trailingSeparatorWidth:(double)a9 renditionKey:(id)a10 effects:(id)a11;
@end

@implementation CUIThemeFacet

+ (unint64_t)themeNamed:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  if (a3) {
    v7 = (__CFString *)a3;
  }
  else {
    v7 = @"AppThemeBits";
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  uint64_t v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __RunTimeThemeRefForBundleIdentifierAndName_block_invoke;
  v14[3] = &unk_1E5A51ED0;
  v14[4] = [a4 stringByAppendingFormat:@" %@", v7];
  v14[5] = a4;
  v14[6] = v7;
  v14[7] = &v21;
  v14[8] = &v15;
  PerformBlockWithThemeRefCache((uint64_t)v14);
  unint64_t v8 = v22[3];
  v9 = (void *)v16[5];
  if (v9)
  {
    if (!v8)
    {
      v10 = v9;
      goto LABEL_9;
    }
  }
  v10 = &stru_1EF488038;
LABEL_9:
  uint64_t v11 = v22[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0));
    unint64_t v8 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  return v8;
}

+ (unint64_t)themeWithContentsOfURL:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%lld", [a3 path], atomic_fetch_add_explicit(&RunTimeThemeRefForFileURL___counter, 1uLL, memory_order_relaxed) + 1);
    if (v6)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3052000000;
      v18 = __Block_byref_object_copy__1;
      v19 = __Block_byref_object_dispose__1;
      uint64_t v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __RunTimeThemeRefForFileURL_block_invoke;
      v14[3] = &unk_1E5A51EF8;
      v14[4] = v6;
      v14[5] = a3;
      v14[6] = &v21;
      v14[7] = &v15;
      PerformBlockWithThemeRefCache((uint64_t)v14);
      unint64_t v7 = v22[3];
      unint64_t v8 = (void *)v16[5];
      if (v8)
      {
        if (v7)
        {
          v9 = v8;
          goto LABEL_13;
        }
      }
      v9 = &stru_1EF488038;
LABEL_13:
      uint64_t v12 = v22[3];
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v21, 8);
      if (v12) {
        return v7;
      }
      goto LABEL_9;
    }
    v10 = +[NSString stringWithFormat:@"RunTimeThemeRefForFileURL() unable to resolve location of catalog file from %@", a3];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"RunTimeThemeRefForFileURL() unable to resolve location of catalog file from empty url %@", 0];
  }
  v9 = (__CFString *)v10;
LABEL_9:
  uint64_t v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, NSLocalizedDescriptionKey, 0));
  unint64_t v7 = 0;
  if (a4) {
    *a4 = v11;
  }
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:2];
  }
}

void __41__CUIThemeFacet_themeUnregisterThemeRef___block_invoke(uint64_t a1, void *a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a2);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(a2, "objectForKey:", v8), "unsignedIntegerValue") == *(id *)(a1 + 32))
        {
          id v9 = v8;
          if (v9)
          {
            v10 = v9;
            [a2 removeObjectForKey:v9];
          }
          goto LABEL_12;
        }
      }
      id v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:
  _UnRegisterThemeRef(*(void *)(a1 + 32));
}

+ (void)themeUnregisterThemeRef:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __41__CUIThemeFacet_themeUnregisterThemeRef___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
  v3[4] = a3;
  PerformBlockWithThemeRefCache((uint64_t)v3);
}

+ (void)_invalidateArtworkCaches
{
  os_unfair_lock_lock((os_unfair_lock_t)&artworkCacheMutex);
  os_unfair_lock_unlock((os_unfair_lock_t)&artworkCacheMutex);
}

+ (id)_themeStoreForThemeIndex:(unint64_t)a3
{
  return (id)_LookupStructuredThemeProvider(a3, a2);
}

- (id)_themeStore
{
  v3 = objc_opt_class();
  unint64_t themeIndex = self->_themeIndex;
  return [v3 _themeStoreForThemeIndex:themeIndex];
}

- (CGPoint)_hotSpot
{
  double x = self->_hotSpot.x;
  double y = self->_hotSpot.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_updateSpecificRenditionKey:(id)a3 isFocused:(BOOL *)a4 owner:(id)a5 userInfo:(id)a6
{
  [a3 copyValuesFromKeyList:self->_renditionKeyList];
  [a5 updateRenditionKey:a3 getFocus:a4 userInfo:a6];
  renditionKeyList = self->_renditionKeyList;
  [a3 setValuesFromKeyList:renditionKeyList];
}

- (id)_approximateRenditionForRenditionKey:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (uint64_t)[a2 themeScale];
  id v5 = [a1 _themeStore];
  if (!v5)
  {
    _CUILog(4, (uint64_t)"Warning: -[CUIThemeFacet imageForState:value:variant:] unable to find theme store.", v6, v7, v8, v9, v10, v11, v16);
    return 0;
  }
  long long v12 = v5;
  unsigned __int8 v13 = objc_msgSend(v5, "canGetRenditionWithKey:", objc_msgSend(a2, "keyList"));
  if (v4 >= 2 && (v13 & 1) == 0)
  {
    [a2 setThemeScale:1];
    if ((objc_msgSend(v12, "canGetRenditionWithKey:", objc_msgSend(a2, "keyList")) & 1) == 0) {
      [a2 setThemeScale:v4];
    }
  }
  id v14 = [a2 keyList];
  return [v12 renditionWithKey:v14];
}

- (id)_renditionForSpecificKey:(id)a3
{
  id v4 = [a3 copy];
  id v5 = [(CUIThemeFacet *)self _themeStore];
  if ((uint64_t)[v4 themeScale] >= 2
    && (objc_msgSend(v5, "canGetRenditionWithKey:", objc_msgSend(v4, "keyList")) & 1) == 0)
  {
    [v4 setThemeScale:1];
  }
  id v6 = objc_msgSend(v5, "renditionWithKey:", objc_msgSend(v4, "keyList"));

  return v6;
}

- (id)_rendition
{
  v3 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  id v4 = [(CUIThemeFacet *)self _renditionForSpecificKey:v3];

  return v4;
}

- (CGSize)_thumbnailSizeForRendition:(id)a3
{
  id v4 = (char *)[a3 type];
  if ((unint64_t)(v4 - 1) > 2)
  {
    double width = NSZeroSize.width;
    double height = NSZeroSize.height;
  }
  else
  {
    id v5 = v4;
    objc_msgSend(objc_msgSend(a3, "imageForSliceIndex:", 0), "size");
    double width = v6;
    double v9 = v8;
    if (v5 == (char *)3) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = 2;
    }
    objc_msgSend(objc_msgSend(a3, "imageForSliceIndex:", v10), "size");
    double v13 = v9 + v12;
    if (v5 == (char *)2)
    {
      double height = v13 + 30.0;
    }
    else
    {
      double v14 = width + v11 + 30.0;
      double height = v13 + 30.0;
      if (v5 == (char *)1) {
        double height = v9;
      }
      double width = v14;
    }
  }
  double v16 = width;
  result.double height = height;
  result.double width = v16;
  return result;
}

- (void)_setHasCheckedButtonGlyph:(BOOL)a3
{
  *(_WORD *)&self->_fFlags = *(_WORD *)&self->_fFlags & 0xFFFE | a3;
}

- (void)_setIsButtonGlyph:(BOOL)a3
{
  *(_WORD *)&self->_fFlags |= 3u;
}

- (BOOL)_isButtonGlyph
{
  $E9F57C97F2D6EAA6A8442301CBF94B81 fFlags = self->_fFlags;
  if ((*(unsigned char *)&fFlags & 1) == 0)
  {
    $E9F57C97F2D6EAA6A8442301CBF94B81 fFlags = ($E9F57C97F2D6EAA6A8442301CBF94B81)(*(_DWORD *)&fFlags | 1);
    *(_WORD *)&self->_$E9F57C97F2D6EAA6A8442301CBF94B81 fFlags = fFlags;
  }
  return (*(unsigned int *)&fFlags >> 1) & 1;
}

- (CUIImage)_imageForRenditionFromKey:(int)a3 withSize:(CGFloat)a4 isMask:(CGFloat)a5
{
  id v5 = a1;
  if (a1)
  {
    id v10 = [(CUIImage *)a1 _renditionForSpecificKey:a2];
    unint64_t v11 = (unint64_t)[v10 type];
    id v12 = [v10 metrics];
    double v13 = v12;
    double v14 = 25.0;
    double v15 = 25.0;
    double v16 = 25.0;
    if (v11 != 6) {
      objc_msgSend(v12, "imageSize", 25.0, 25.0);
    }
    if (v10) {
      double v17 = v16;
    }
    else {
      double v17 = 25.0;
    }
    if (v10) {
      double v14 = v15;
    }
    double v18 = (double)(uint64_t)[a2 themeScale];
    [v13 scale];
    double v20 = v14 * (v18 / v19);
    double v21 = (double)(uint64_t)[a2 themeScale];
    [v13 scale];
    double v23 = v17 * (v21 / v22);
    v62.double width = NSZeroSize.width;
    v62.double height = NSZeroSize.height;
    v61.double width = a4;
    v61.double height = a5;
    BOOL v24 = NSEqualSizes(v61, v62);
    if (v24) {
      double v25 = v23;
    }
    else {
      double v25 = a5;
    }
    if (v24) {
      double v26 = v20;
    }
    else {
      double v26 = a4;
    }
    double v27 = floor(v25);
    if (v26 != floor(v26) || v25 != v27)
    {
      id v29 = objc_msgSend(-[CUIImage _themeStore](v5, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
      _CUILog(4, (uint64_t)"WARNING: Image size requires rounding, might be off by a pixel. Pass integral sizes and rects to CUIThemeFacet methods. %@", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      double v26 = round(v26);
      double v25 = round(v25);
    }
    BOOL v36 = (v11 & 0xFFFFFFFFFFFFFFFDLL) == 0;
    BOOL v37 = v20 != v26;
    double v38 = round((v26 - v20) * 0.5);
    if (!v36 || !v37) {
      double v38 = -0.0;
    }
    double v39 = NSZeroPoint.x + v38;
    if (v36 && v37) {
      CGFloat v40 = v20;
    }
    else {
      CGFloat v40 = v26;
    }
    BOOL v41 = v11 < 2;
    BOOL v42 = v23 != v25;
    double v43 = round((v25 - v23) * 0.5);
    if (!v41 || !v42) {
      double v43 = -0.0;
    }
    double v44 = NSZeroPoint.y + v43;
    if (v41 && v42) {
      CGFloat v45 = v23;
    }
    else {
      CGFloat v45 = v25;
    }
    v46 = +[NSMutableData dataWithLength:(unint64_t)(v25 * v26 * 32.0 + 32.0)];
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    if (a3) {
      uint32_t v48 = 2;
    }
    else {
      uint32_t v48 = 8194;
    }
    v49 = CGBitmapContextCreate([(NSMutableData *)v46 bytes], (unint64_t)v26, (unint64_t)v25, 8uLL, vcvtd_n_u64_f64(v26, 2uLL), SRGB, v48);
    if (a3)
    {
      -[CUIThemeFacet _drawAsMaskSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:](v5, a2, v49, kCGBlendModeNormal, 0, 0, v39, v44, v40, v45, 1.0);
      Image = CGBitmapContextCreateImage(v49);
      *(_OWORD *)decode = xmmword_1A139EA00;
      size_t Width = CGImageGetWidth(Image);
      size_t Height = CGImageGetHeight(Image);
      size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
      size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
      size_t BytesPerRow = CGImageGetBytesPerRow(Image);
      DataProvider = CGImageGetDataProvider(Image);
      BOOL ShouldInterpolate = CGImageGetShouldInterpolate(Image);
      v58 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
      CGImageRelease(Image);
    }
    else
    {
      -[CUIImage _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](v5, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", a2, v49, 0, 0, 0, 0, v39, v44, v40, v45, 1.0);
      v58 = CGBitmapContextCreateImage(v49);
    }
    id v5 = +[CUIImage imageWithCGImage:v58];
    CGContextRelease(v49);
    CGImageRelease(v58);
  }
  return v5;
}

- (void)_drawAsMaskSpecificRenditionKey:(CGContext *)a3 inFrame:(CGBlendMode)a4 context:(int)a5 alpha:(uint64_t)a6 operation:(CGFloat)a7 isFocused:(CGFloat)a8 focusRingColor:(CGFloat)a9
{
  if (a1)
  {
    id v22 = [a1 renditionForSpecificKeyWrapper:a2];
    if (a11 >= 0.00000011920929)
    {
      double v23 = v22;
      BOOL v24 = (char *)[v22 type];
      if ((unint64_t)(v24 - 1) > 1)
      {
        if (v24)
        {
          if (v24 == (char *)3)
          {
            uint64_t v27 = a1[2];
            double v28 = (double)(uint64_t)[a2 themeScale];
            DrawNinePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, v28, v27, v23, a3, a5, a6, a4);
          }
          else
          {
            id v30 = +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", [v23 type]);
            objc_msgSend(objc_msgSend(a1, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
            _CUILog(4, (uint64_t)"ERROR: CUIThemeFacet needs code to draw a mask from %@ rendition %@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
          }
        }
        else
        {
          uint64_t v29 = a1[2];
          DrawOnePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, v29, v23, a3, a5, a6, a4, 0);
        }
      }
      else
      {
        uint64_t v25 = a1[2];
        double v26 = (double)(uint64_t)[a2 themeScale];
        DrawThreePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, v26, v25, v23, a3, a5, a6, a4);
      }
    }
  }
}

+ (unint64_t)themeForBundleIdentifier:(id)a3 error:(id *)a4
{
  return (unint64_t)[a1 themeNamed:0 forBundleIdentifier:a3 error:a4];
}

+ (unint64_t)themeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3052000000;
  double v18 = __Block_byref_object_copy__1;
  double v19 = __Block_byref_object_dispose__1;
  uint64_t v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __RunTimeThemeRefForBytes_block_invoke;
  v14[3] = &unk_1E5A51F20;
  v14[4] = +[NSString stringWithFormat:@"%p:%lu:%lld", a3, a4, atomic_fetch_add_explicit(&RunTimeThemeRefForBytes___counter, 1uLL, memory_order_relaxed) + 1];
  v14[5] = &v21;
  v14[7] = a3;
  void v14[8] = a4;
  v14[6] = &v15;
  PerformBlockWithThemeRefCache((uint64_t)v14);
  unint64_t v8 = v22[3];
  double v9 = (void *)v16[5];
  if (!v9) {
    goto LABEL_5;
  }
  if (!v8)
  {

LABEL_5:
    id v10 = &stru_1EF488038;
    goto LABEL_6;
  }
  id v10 = v9;
LABEL_6:
  uint64_t v11 = v22[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    id v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0));
    unint64_t v8 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  return v8;
}

+ (id)_bundleIdentifierForThemeRef:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  double v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke;
  v5[3] = &unk_1E5A51EA8;
  v5[4] = &v6;
  v5[5] = a3;
  PerformBlockWithThemeRefCache((uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke_2;
  v4[3] = &unk_1E5A51E80;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  return [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

id __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id result = [a3 unsignedIntegerValue];
  if (result == *(id *)(a1 + 40))
  {
    id result = a2;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 fromTheme:(unint64_t)a5
{
  return [a1 facetWithElement:a3 part:a4 dimension1:0 dimension2:0 fromTheme:a5];
}

+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 dimension1:(int64_t)a5 dimension2:(int64_t)a6 fromTheme:(unint64_t)a7
{
  unsigned __int16 v8 = a6;
  unsigned __int16 v9 = a5;
  unsigned __int16 v10 = a4;
  v13[0] = 0;
  v13[1] = 0;
  int v14 = 0;
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 1, (unsigned __int16)a3, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 2, v10, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 8, v9, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 9, v8, 5u);
  return [a1 _facetWithKeyList:v13 andRenditionKeyClass:0 orRenditionKey:0 fromTheme:a7];
}

+ (id)facetWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  return [a1 _facetWithKeyList:0 andRenditionKeyClass:0 orRenditionKey:a3 fromTheme:a4];
}

+ (id)_facetWithKeyList:(const _renditionkeytoken *)a3 andRenditionKeyClass:(Class)a4 orRenditionKey:(id)a5 fromTheme:(unint64_t)a6
{
  id v7 = a5;
  if ((unint64_t)a3 | (unint64_t)a5)
  {
    uint64_t v11 = [_CUIThemeFacetCacheKey alloc];
    id v12 = a3;
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"CUIThemeFacet.m" lineNumber:794 description:@"improper arguments"];
    uint64_t v11 = [_CUIThemeFacetCacheKey alloc];
  }
  id v12 = (const _renditionkeytoken *)objc_msgSend(v7, "keyList", v12);
LABEL_4:
  double v13 = [(_CUIThemeFacetCacheKey *)v11 initWithKeyList:v12 themeIndex:a6];
  os_unfair_lock_lock((os_unfair_lock_t)&facetCacheMutex);
  if (FacetCache_pred != -1) {
    dispatch_once(&FacetCache_pred, &__block_literal_global_334);
  }
  int v14 = (void *)FacetCache_facetCache;
  if (RecentlyUsedFacetCacheKeys_pred != -1) {
    dispatch_once(&RecentlyUsedFacetCacheKeys_pred, &__block_literal_global_336);
  }
  uint64_t v15 = (void *)RecentlyUsedFacetCacheKeys_facetCacheKeys;
  id v16 = [(id)RecentlyUsedFacetCacheKeys_facetCacheKeys indexOfObject:v13];
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7)
    {
      uint64_t v17 = 0;
    }
    else
    {
      if (a4) {
        double v19 = a4;
      }
      else {
        double v19 = (objc_class *)CUIRenditionKey;
      }
      id v7 = [[v19 alloc] initWithKeyList:a3];
      uint64_t v17 = v7;
    }
    id v18 = [objc_alloc((Class)a1) initWithRenditionKey:v7 fromTheme:a6];

    if (_facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__isFacetCacheAtLimit == 1)
    {
      objc_msgSend(v14, "removeObjectForKey:", objc_msgSend(v15, "objectAtIndex:", 0));
      [v15 removeObjectAtIndex:0];
    }
    else if (++_facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__facetCacheCount == 20)
    {
      _facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__isFacetCacheAtLimit = 1;
    }
    [v15 addObject:v13];
    [v14 setObject:v18 forKey:v13];
    id v20 = v18;
  }
  else
  {
    [v15 removeObjectAtIndex:v16];
    [v15 addObject:v13];
    id v18 = [v14 objectForKey:v13];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&facetCacheMutex);

  id v21 = v18;
  return v21;
}

+ (id)cursorFacetWithName:(id)a3 fromTheme:(unint64_t)a4
{
  long long v15 = 0uLL;
  id v7 = objc_msgSend(objc_msgSend(a1, "_themeStoreForThemeIndex:", a4), "renditionKeyForName:cursorHotSpot:", a3, &v15);
  if (*(double *)&v15 < 0.0 || *((double *)&v15 + 1) < 0.0)
  {
    _CUILog(4, (uint64_t)"+[CUIThemeFacet cursorFacetWithName:fromTheme:] - Facet named %@ is not a cursor facet.", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    return 0;
  }
  else
  {
    id result = objc_msgSend(a1, "_facetWithKeyList:andRenditionKeyClass:orRenditionKey:fromTheme:", v7, 0, 0, a4, *((double *)&v15 + 1));
    *((_OWORD *)result + 3) = v15;
  }
  return result;
}

- (__n128)_initWithRenditionKey:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 keyList];
    unsigned int v4 = CUIRenditionKeyTokenCount((uint64_t)v3);
    unsigned __int16 v5 = v4 + 1;
    uint64_t v6 = malloc_type_calloc(v4 + 1, 4uLL, 0x100004052888210uLL);
    *(void *)(a1 + 8) = v6;
    CUIRenditionKeyCopy(v6, v3, v5);
    *(void *)(a1 + 24) = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(__n128 *)(a1 + 40) = result;
    *(void *)(a1 + 56) = 0xBFF0000000000000;
    *(_DWORD *)(a1 + 64) = -1;
  }
  return result;
}

- (CUIThemeFacet)initWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIThemeFacet;
  id v7 = [(CUIThemeFacet *)&v9 init];
  if (v7)
  {
    if (!a3) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v7 file:@"CUIThemeFacet.m" lineNumber:891 description:@"Facet must be initialized with non-nil rendition key"];
    }
    v7->_unint64_t themeIndex = a4;
    -[CUIThemeFacet _initWithRenditionKey:]((uint64_t)v7, a3);
  }
  return v7;
}

- (CUIThemeFacet)init
{
  id v3 = [CUIRenditionKey alloc];
  unsigned __int16 v5 = -[CUIRenditionKey initWithKeyList:](v3, "initWithKeyList:", objc_msgSend(CUIPlaceHolderRendition((uint64_t)v3, v4), "key"));
  uint64_t v6 = [(CUIThemeFacet *)self initWithRenditionKey:v5 fromTheme:0];

  return v6;
}

- (CUIThemeFacet)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CUIThemeFacet;
  uint64_t v4 = [(CUIThemeFacet *)&v9 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      id v5 = [a3 decodeObjectForKey:@"CUIThemeFacetRenditionKey"];
      unint64_t v6 = (unint64_t)[a3 decodeIntegerForKey:@"CUIThemeFacetThemeIndex"];
    }
    else
    {
      id v5 = [a3 decodeObject];
      unsigned int v8 = 0;
      [a3 decodeValueOfObjCType:"i" at:&v8 size:4];
      unint64_t v6 = v8;
    }
    v4->_unint64_t themeIndex = v6;
    -[CUIThemeFacet _initWithRenditionKey:]((uint64_t)v4, v5);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIThemeFacet version](CUIThemeFacet, "version"), @"CUIThemeFacetVersion");
    [a3 encodeObject:v5 forKey:@"CUIThemeFacetRenditionKey"];
    [a3 encodeInteger:self->_themeIndex forKey:@"CUIThemeFacetThemeIndex"];
  }
  else
  {
    [a3 encodeObject:v5];
    int themeIndex = self->_themeIndex;
    [a3 encodeValueOfObjCType:"i" at:&themeIndex];
  }
}

- (void)dealloc
{
  free(self->_renditionKeyList);
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeFacet;
  [(CUIThemeFacet *)&v3 dealloc];
}

+ (BOOL)assetExistsForRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  unint64_t v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 keyList]);
  id v7 = [a1 _themeStoreForThemeIndex:a4];
  if (objc_msgSend(v7, "canGetRenditionWithKey:", -[CUIRenditionKey keyList](v6, "keyList")))
  {
    unsigned __int8 v8 = 1;
  }
  else if ([(CUIRenditionKey *)v6 themeScale] < 1)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    [(CUIRenditionKey *)v6 setThemeScale:1];
    unsigned __int8 v8 = objc_msgSend(v7, "canGetRenditionWithKey:", -[CUIRenditionKey keyList](v6, "keyList"));
  }

  return v8;
}

- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3 renditionKey:(id)a4
{
  if (a4) {
    unint64_t v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    unint64_t v6 = objc_alloc_init(CUIRenditionKey);
  }
  id v7 = v6;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v6];
  id v8 = [(CUIThemeFacet *)self _renditionForSpecificKey:v7];
  if ((unint64_t)[v8 type] > 3)
  {
    uint64_t v10 = 0;
  }
  else
  {
    objc_super v9 = (CGImage *)[v8 unslicedImage];
    uint64_t v10 = v9;
    if (v9)
    {
      CGImageRetain(v9);
      id v11 = [v8 sliceInformation];
      double Width = (double)CGImageGetWidth(v10);
      double Height = (double)CGImageGetHeight(v10);
      [v11 destinationRect];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [v11 positionOfSliceBoundary:0];
      double v23 = v22 + v15;
      double v24 = v15 + v19;
      [v11 positionOfSliceBoundary:2];
      double v26 = v25;
      [v11 positionOfSliceBoundary:1];
      double v28 = v17 + v27;
      [v11 positionOfSliceBoundary:3];
      a3->origin.double x = v23 / Width;
      a3->origin.double y = v28 / Height;
      a3->size.double width = (Width - v23 + v26 - v24) / Width;
      a3->size.double height = (Height - v28 + v29 - (v17 + v21)) / Height;
    }
  }

  return v10;
}

- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3
{
  return [(CUIThemeFacet *)self copyLayerImageContentsAndCenter:a3 renditionKey:0];
}

- (id)_makeLayerFromCAPackageData
{
  if (result)
  {
    id v1 = [result _rendition];
    if ([v1 type] == (id)1000
      && (id v2 = [v1 utiType],
          uint64_t v3 = kCAPackageTypeArchive,
          [v2 isEqualToString:kCAPackageTypeArchive]))
    {
      uint64_t v5 = 0;
      __n128 result = -[CAPackage rootLayer](+[CAPackage packageWithData:type:options:error:](CAPackage, "packageWithData:type:options:error:", [v1 data], v3, 0, &v5), "rootLayer");
      if (v5) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = result == 0;
      }
      if (v4) {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)makeLayer
{
  id v2 = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "type");
  uint64_t v3 = (void **)CAGradientLayer_ptr;
  if (v2 != (id)6) {
    uint64_t v3 = (void **)CALayer_ptr;
  }
  BOOL v4 = *v3;
  return [v4 layer];
}

- (void)updateLayer:(id)a3
{
}

- (void)updateLayer:(id)a3 effects:(id)a4
{
  id v7 = [(CUIThemeFacet *)self _rendition];
  [v7 opacity];
  *(float *)&double v8 = v8;
  [a3 setOpacity:v8];
  if ([v7 type] == (id)6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v74 = 0;
      long double v75 = 0.0;
      id v9 = [(CUIThemeFacet *)self gradientWithKeyAdjustment:0 angle:&v75 style:&v74];
      if (!v9) {
        return;
      }
      id v10 = v9;
      [a3 bounds];
      double v12 = v11;
      double v14 = v13;
      long long v72 = 0uLL;
      double v76 = 0.0;
      double v77 = 0.0;
      FrameIntersectionWithAxis((double *)&v72, &v76, v15, v16, v11, v13, v75);
      double v17 = *(double *)&v72 / v12;
      double v18 = 1.0 - *((double *)&v72 + 1) / v14;
      double v19 = 1.0 - v77 / v14;
      double v20 = v76 / v12;
      objc_msgSend(a3, "setStartPoint:", v17, v18);
      objc_msgSend(a3, "setEndPoint:", v20, v19);
      if (v74 == 1282306592)
      {
        double v21 = &kCAGradientLayerAxial;
      }
      else
      {
        if (v74 != 1382312992)
        {
LABEL_36:
          ARGBBitmapContext = CreateARGBBitmapContext(256.0, 1.0, 1.0);
          if (!ARGBBitmapContext)
          {
            _CUILog(4, (uint64_t)"CoreUI: Couldn't create CreateARGBBitmapContext() in -[CUIThemeFacet updateLayer:effects:]", v64, v65, v66, v67, v68, v69, v72);
            [a3 setColorMap:0];
            return;
          }
          v70 = ARGBBitmapContext;
          if (a4) {
            id v10 = [v10 gradientByApplyingEffects:a4];
          }
          objc_msgSend(v10, "drawInRect:angle:withContext:", v70, 0.0, 0.0, 256.0, 1.0, 0.0);
          CGImageRef Image = CGBitmapContextCreateImage(v70);
          CFRelease(v70);
          [a3 setColorMap:Image];
          v47 = Image;
          goto LABEL_40;
        }
        double v21 = &kCAGradientLayerRadial;
      }
      [a3 setType:*v21];
      goto LABEL_36;
    }
  }
  if ([v7 type] == (id)8 && objc_msgSend(v7, "subtype") == 50)
  {
    [v7 scale];
    objc_msgSend(a3, "setContentsScale:");
    objc_msgSend(objc_msgSend(v7, "imageForSliceIndex:", 0), "size");
    double v23 = v22;
    double v25 = v24;
    double v26 = (CGImage *)[v7 unslicedImage];
    if (a4)
    {
      [v7 scale];
      double v26 = (CGImage *)objc_msgSend(a4, "newFlattenedImageFromShapeCGImage:withScale:", v26);
      double v27 = +[CUIImage imageWithCGImage:v26];
      CGImageRelease(v26);
    }
    else
    {
      double v27 = +[CUIImage imageWithCGImage:v26];
    }
    [(CUIImage *)v27 size];
    double v49 = v48;
    double v51 = v50;
    [v7 scale];
    double v53 = v23 / v52;
    [v7 scale];
    objc_msgSend(a3, "setFrame:", 0.0, 0.0, v53, v25 / v54);
    [a3 setContents:v26];
    double v55 = v23 / v49;
    double v56 = v25 / v51;
    objc_msgSend(a3, "setContentsRect:", 0.0, 0.0, v23 / v49, v56);
    unint64_t v57 = vcvtad_u64_f64(v49 / v23);
    double v58 = (double)(unint64_t)round(v49 / v23);
    v59 = +[CAKeyframeAnimation animationWithKeyPath:@"contentsRect"];
    [(CAKeyframeAnimation *)v59 setCalculationMode:kCAAnimationDiscrete];
    [(CAKeyframeAnimation *)v59 setDuration:v58 * 0.0333333333];
    [(CAKeyframeAnimation *)v59 setRemovedOnCompletion:0];
    [(CAKeyframeAnimation *)v59 setFillMode:kCAFillModeBoth];
    v60 = +[NSMutableArray arrayWithCapacity:v57];
    NSSize v61 = +[NSMutableArray arrayWithCapacity:v57];
    if (v57)
    {
      for (unint64_t i = 0; i != v57; ++i)
      {
        [(NSMutableArray *)v60 addObject:+[NSNumber numberWithDouble:(double)i / v58]];
        [(NSMutableArray *)v61 addObject:+[NSValue valueWithRect:](NSValue, "valueWithRect:", v55 * (double)i, 0.0, v55, v56)];
      }
    }
    [(CAKeyframeAnimation *)v59 setValues:v61];
    [(CAKeyframeAnimation *)v59 setKeyTimes:v60];
    [a3 addAnimation:v59 forKey:@"filmstrip animation"];
  }
  else
  {
    if ([v7 type] != (id)1000
      || (CFStringRef v28 = (const __CFString *)[v7 utiType], !UTTypeConformsTo(v28, kCAPackageTypeArchive)))
    {
      long long v72 = xmmword_1A139EB30;
      long long v73 = unk_1A139EB40;
      uint64_t v31 = [(CUIThemeFacet *)self copyLayerImageContentsAndCenter:&v72];
      unsigned int v32 = [v7 subtype];
      if (a4)
      {
        [v7 scale];
        uint64_t v33 = (CGImage *)objc_msgSend(a4, "newFlattenedImageFromShapeCGImage:withScale:", v31);
        CGImageRelease(v31);
        uint64_t v31 = v33;
      }
      [a3 setContents:v31];
      objc_msgSend(a3, "setContentsCenter:", v72, v73);
      [v7 scale];
      objc_msgSend(a3, "setContentsScale:");
      if (v32 <= 0x1E && ((1 << v32) & 0x40900800) != 0) {
        uint64_t v34 = &kCAContentsScalingRepeat;
      }
      else {
        uint64_t v34 = &kCAContentsScalingStretch;
      }
      [a3 setContentsScaling:*v34];
      [(CUIThemeFacet *)self alpha];
      *(float *)&double v35 = v35;
      [a3 setOpacity:v35];
      objc_msgSend(a3, "setCompositingFilter:", -[CUIThemeFacet blendModeAsCAFilterString](self, "blendModeAsCAFilterString"));
      [a3 frame];
      if (v37 == CGSizeZero.width && v36 == CGSizeZero.height)
      {
        [a3 frame];
        double v39 = v38;
        double v41 = v40;
        double Width = (double)CGImageGetWidth(v31);
        [v7 scale];
        double v44 = Width / v43;
        double Height = (double)CGImageGetHeight(v31);
        [v7 scale];
        objc_msgSend(a3, "setFrame:", v39, v41, v44, Height / v46);
      }
      v47 = v31;
LABEL_40:
      CGImageRelease(v47);
      return;
    }
    id LayerFromCAPackage = -[CUIThemeFacet _makeLayerFromCAPackageData](self);
    if (LayerFromCAPackage)
    {
      id v30 = LayerFromCAPackage;
      objc_msgSend(objc_msgSend(a3, "sublayers"), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
      [a3 bounds];
      objc_msgSend(v30, "setFrame:");
      [a3 addSublayer:v30];
    }
  }
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 context:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v11 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v11, a5, 0, 0, 0, 0, x, y, width, height);
}

- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(uint64_t)a4 context:(uint64_t)a5 isFocused:(unsigned __int8)a6 focusRingColor:(void *)a7 isFlipped:(CGFloat)a8 effects:(CGFloat)a9
{
  if (a1)
  {
    id v22 = [a1 renditionForSpecificKeyWrapper:a2];
    [v22 opacity];
    -[CUIThemeFacet _drawSpecificRenditionKey:rendition:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:]((uint64_t *)a1, a2, v22, a3, (uint64_t)[v22 blendMode], a4, a5, a6, a8, a9, a10, a11, v23, a7);
  }
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6
{
  uint64_t v8 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v14 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v14, a6, v8, (uint64_t)a5, 0, 0, x, y, width, height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  if (a4 >= 0.0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 20;
  }
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
  uint64_t v9 = *(void *)&a5;
  if (a4 >= 0.0) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 20;
  }
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:", v10, v9, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6 effects:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v16 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v16, a6, v10, (uint64_t)a5, 0, a7, x, y, width, height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 context:(CGContext *)a8 effects:(id)a9
{
  uint64_t v12 = *(void *)&a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v20 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v20, a8, a5, v12, (uint64_t)a7, 0, a9, x, y, width, height, a4);
}

- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(unsigned int)a4 context:(uint64_t)a5 alpha:(uint64_t)a6 operation:(unsigned __int8)a7 isFocused:(void *)a8 focusRingColor:(CGFloat)a9 isFlipped:(CGFloat)a10 effects:(CGFloat)a11
{
  if (a1)
  {
    id v26 = [a1 renditionForSpecificKeyWrapper:a2];
    [v26 opacity];
    double v28 = v27;
    unsigned int v29 = [v26 blendMode];
    if (a13 == 1.0) {
      double v30 = v28;
    }
    else {
      double v30 = a13;
    }
    if (a4) {
      uint64_t v31 = a4;
    }
    else {
      uint64_t v31 = v29;
    }
    -[CUIThemeFacet _drawSpecificRenditionKey:rendition:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:]((uint64_t *)a1, a2, v26, a3, v31, a5, a6, a7, a9, a10, a11, a12, v30, a8);
  }
}

- (void)drawAsOnePartWithSlice:(int)a3 inFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v18 = [(CUIThemeFacet *)self themeRendition];
  [v18 opacity];
  double v20 = v19;
  unsigned int v21 = [v18 blendMode];
  if (v20 >= 0.00000011920929)
  {
    CGBlendMode v22 = v21;
    unint64_t themeIndex = self->_themeIndex;
    [v18 scale];
    DrawOnePartElementFromRenditionWithOperation(x, y, width, height, v20, v24, themeIndex, v18, a7, a5, (uint64_t)a6, v22, a3, a8);
  }
}

- (void)drawAbsoluteAnimationFrame:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = [(CUIThemeFacet *)self themeRendition];
  [v15 opacity];
  double v17 = v16;
  CGBlendMode v18 = [v15 blendMode];
  DrawAbsoluteAnimationFrameWithOperation(v15, a7, v18, a5, a3, x, y, width, height, v17, (uint64_t)a6, v19);
}

- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
}

- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = [(CUIThemeFacet *)self themeRendition];
  [v17 opacity];
  double v19 = v18;
  CGBlendMode v20 = [v17 blendMode];
  DrawAnimationFrameMappedFrom0_1RangedValue(v17, a7, v20, a5, a3, x, y, width, height, v19, (uint64_t)a6, a8);
}

- (void)drawSegmentInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 segmentType:(int)a6 context:(CGContext *)a7 effects:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v17 = a6 - 1;
  if ((a6 - 1) > 2)
  {
    int v18 = 0;
    int v19 = 2;
  }
  else
  {
    int v18 = dword_1A139EB50[v17];
    int v19 = dword_1A139EB5C[v17];
  }
  id v20 = [(CUIThemeFacet *)self themeRendition];
  [v20 opacity];
  double v22 = v21;
  unsigned int v23 = [v20 blendMode];
  if (v22 >= 0.00000011920929)
  {
    CGBlendMode v24 = v23;
    unint64_t themeIndex = self->_themeIndex;
    [v20 scale];
    DrawThreePartElementFromRenditionWithOperation(x, y, width, height, v22, v26, themeIndex, v20, a7, a4, (uint64_t)a5, v24, v18, 1, v19, a8);
  }
}

- (void)updateSegmentBezelLeadingCapLayer:(id)a3 bezelFillLayer:(id)a4 trailingBezelCapLayer:(id)a5 forSegmentType:(int)a6 segmentBounds:(CGRect)a7 leadingSeparatorWidth:(double)a8 trailingSeparatorWidth:(double)a9 renditionKey:(id)a10 effects:(id)a11
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  if (a10) {
    unsigned int v23 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a10 keyList]);
  }
  else {
    unsigned int v23 = objc_alloc_init(CUIRenditionKey);
  }
  CGFloat v45 = v23;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v23];
  id v24 = [(CUIThemeFacet *)self _renditionForSpecificKey:v45];
  [v24 scale];
  double v26 = v25;
  int v27 = a6 - 1;
  if ((a6 - 1) > 2)
  {
    uint64_t v29 = 0;
    uint64_t v28 = 2;
  }
  else
  {
    uint64_t v28 = qword_1A139EB68[v27];
    uint64_t v29 = qword_1A139EB80[v27];
  }
  id v30 = objc_msgSend(v24, "imageForSliceIndex:", v29, *(void *)&a9);
  id v31 = [v24 imageForSliceIndex:1];
  id v32 = [v24 imageForSliceIndex:v28];
  [v30 size];
  double v34 = v33;
  [v32 size];
  double v36 = v35;
  id v37 = [v30 image];
  id v38 = [v31 image];
  id v39 = [v32 image];
  if (a11)
  {
    id v37 = [a11 newFlattenedImageFromShapeCGImage:v37 withScale:v26];
    id v38 = [a11 newFlattenedImageFromShapeCGImage:v38 withScale:v26];
    id v39 = [a11 newFlattenedImageFromShapeCGImage:v39 withScale:v26];
    CFAutorelease(v37);
    CFAutorelease(v38);
    CFAutorelease(v39);
  }
  double v40 = v36 / v26;
  [a3 setContents:v37];
  [a4 setContents:v38];
  [a5 setContents:v39];
  [a3 setContentsScale:v26];
  [a4 setContentsScale:v26];
  [a5 setContentsScale:v26];
  double v41 = x + a8;
  double v42 = x + width - v40 - v44;
  double v43 = v41 + v34 / v26;
  objc_msgSend(a3, "setFrame:");
  objc_msgSend(a5, "setFrame:", v42, y, v40, height);
  objc_msgSend(a4, "setFrame:", v43, y, v42 - v43, height);
}

- (void)drawInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
}

- (void)drawHighlightInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
}

- (void)drawMaskInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
}

- (BOOL)_canGetRenditionForKey:(id)a3 withDrawingLayer:(int64_t)a4
{
  [a3 setThemeLayer:a4];
  [a3 setThemeState:0];
  id v6 = [(CUIThemeFacet *)self _themeStore];
  id v7 = [a3 keyList];
  return [v6 canGetRenditionWithKey:v7];
}

- (BOOL)hitTestAtPoint:(CGPoint)a3 inFrame:(CGRect)a4 owner:(id)a5 userInfo:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.y;
  double v13 = a3.x;
  if (!NSPointInRect(a3, a4)) {
    return 0;
  }
  id v15 = objc_alloc_init(CUIRenditionKey);
  [(CUIThemeFacet *)self _updateSpecificRenditionKey:v15 isFocused:0 owner:a5 userInfo:a6];
  if (![(CUIThemeFacet *)self _canGetRenditionForKey:v15 withDrawingLayer:4])[(CUIRenditionKey *)v15 setThemeLayer:0]; {
  BOOL v16 = 1;
  }
  int v17 = [(CUIThemeFacet *)(CUIImage *)self _imageForRenditionFromKey:1 withSize:width isMask:height];
  if (v17)
  {
    int v18 = [(CUIImage *)v17 image];
    size_t BytesPerRow = CGImageGetBytesPerRow(v18);
    size_t v20 = CGImageGetHeight(v18);
    size_t v21 = CGImageGetWidth(v18);
    if (v21)
    {
      size_t v22 = v21;
      if (BytesPerRow / v21 == 4
        && (DataProvider = CGImageGetDataProvider(v18), (CFDataRef v24 = CGDataProviderCopyData(DataProvider)) != 0))
      {
        CFDataRef v25 = v24;
        double v26 = v12 - y;
        BOOL v16 = *(_DWORD *)&CFDataGetBytePtr(v24)[4 * (uint64_t)rint(v13 - x) + 4 * (v20 + ~(uint64_t)rint(v26)) * v22] != 0;
        CFRelease(v25);
      }
      else
      {
        BOOL v16 = 1;
      }
    }
  }

  return v16;
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  if (a4 >= 0.0) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 20;
  }
  -[CUIThemeFacet drawInFrame:alpha:operation:owner:userInfo:context:](self, "drawInFrame:alpha:operation:owner:userInfo:context:", v10, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  if (a4 >= 0.0) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 20;
  }
  -[CUIThemeFacet drawHighlightInFrame:alpha:operation:owner:userInfo:context:](self, "drawHighlightInFrame:alpha:operation:owner:userInfo:context:", v10, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  if (a3.size.height != 0.0)
  {
    CGFloat width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      CGFloat height = a3.size.height;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      int v17 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
      [(CUIThemeFacet *)self _updateSpecificRenditionKey:v17 isFocused:0 owner:a5 userInfo:a6];
      if (a4 >= 0.0) {
        CGBlendMode v16 = kCGBlendModeNormal;
      }
      else {
        CGBlendMode v16 = kCGBlendModeSourceAtop;
      }
      -[CUIThemeFacet _drawMaskFromSpecificRenditionKey:inFrame:alpha:operation:isFocused:focusRingColor:context:](self, v17, v16, 0, 0, a7, x, y, width, height, a4);
    }
  }
}

- (void)_drawMaskFromSpecificRenditionKey:(CGBlendMode)a3 inFrame:(int)a4 alpha:(uint64_t)a5 operation:(CGContext *)a6 isFocused:(CGFloat)a7 focusRingColor:(CGFloat)a8 context:(CGFloat)a9
{
  if (a1)
  {
    if (([a1 _canGetRenditionForKey:a2 withDrawingLayer:2] & 1) == 0) {
      [a2 setThemeLayer:0];
    }
    -[CUIThemeFacet _drawAsMaskSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:](a1, a2, a6, a3, a4, a5, a7, a8, a9, a10, a11);
  }
}

- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  if (a3.size.height != 0.0)
  {
    uint64_t v32 = v14;
    uint64_t v33 = v13;
    uint64_t v34 = v12;
    uint64_t v35 = v11;
    uint64_t v36 = v10;
    uint64_t v37 = v9;
    uint64_t v38 = v7;
    uint64_t v39 = v8;
    double width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      double height = a3.size.height;
      double y = a3.origin.y;
      double x = a3.origin.x;
      unsigned __int8 v31 = 0;
      CFDataRef v24 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
      [(CUIThemeFacet *)self _updateSpecificRenditionKey:v24 isFocused:&v31 owner:a5 userInfo:a6];
      unint64_t themeIndex = self->_themeIndex;
      LODWORD(a5) = v31;
      int64_t v26 = [(CUIRenditionKey *)v24 themeScale];
      DrawPulsedElementFromRenditionKey(themeIndex, v24, a7, (int)a5, x, y, width, height, a4, (double)v26, 0, v27, v28, v29, v30);
    }
  }
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8
{
  if (a3.size.height != 0.0)
  {
    uint64_t v28 = v15;
    uint64_t v29 = v14;
    uint64_t v30 = v13;
    uint64_t v31 = v12;
    uint64_t v32 = v11;
    uint64_t v33 = v10;
    uint64_t v34 = v8;
    uint64_t v35 = v9;
    CGFloat width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      CGFloat height = a3.size.height;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      unsigned __int8 v27 = 0;
      int64_t v26 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
      [(CUIThemeFacet *)self _updateSpecificRenditionKey:v26 isFocused:&v27 owner:a6 userInfo:a7];
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v26, a8, a5, v27, 0, 0, 0, x, y, width, height, a4);
    }
  }
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8
{
  if (a3.size.height != 0.0)
  {
    double width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      uint64_t v12 = *(void *)&a5;
      double height = a3.size.height;
      double y = a3.origin.y;
      double x = a3.origin.x;
      int v18 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
      [(CUIThemeFacet *)self _updateSpecificRenditionKey:v18 isFocused:0 owner:a6 userInfo:a7];
      [(CUIRenditionKey *)v18 setThemeLayer:1];
      [(CUIRenditionKey *)v18 setThemeState:0];
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](self, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", v18, a8, v12, 0, 0, 0, x, y, width, height, a4);
    }
  }
}

- (void)drawGradientInFrame:(CGRect)a3 angle:(double)a4 alpha:(double)a5 operation:(int)a6 isFocused:(int)a7 focusRingColor:(CGColor *)a8 keyAdjustment:(id)a9 context:(CGContext *)a10 effects:(id)a11
{
  uint64_t v14 = *(void *)&a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a9) {
    CFDataRef v24 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a9 keyList]);
  }
  else {
    CFDataRef v24 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v37 = v24;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v24];
  id v25 = [(CUIThemeFacet *)self _renditionForSpecificKey:v37];
  if ([v25 type] == (id)6)
  {
    CGContextSaveGState(a10);
    int AllowsDithering = CGContextGetAllowsDithering();
    if (a5 != 1.0) {
      CGContextSetAlpha(a10, a5);
    }
    if (a6) {
      CGContextSetBlendMode(a10, (CGBlendMode)a6);
    }
    id v27 = [v25 gradient];
    id v28 = v27;
    if (a11) {
      id v28 = [v27 gradientByApplyingEffects:a11];
    }
    unsigned int v29 = [v25 gradientStyle];
    if (AllowsDithering != [v28 isDithered]) {
      CGContextSetAllowsDithering();
    }
    switch(v29)
    {
      case 0x416E676Cu:
        objc_msgSend(v28, "drawAngleGradientInRect:relativeCenterPosition:withContext:", a10, x, y, width, height, x + width * 0.5, y + height * 0.5);
        break;
      case 0x52646C20u:
        objc_msgSend(v28, "drawRadialGradientInRect:relativeCenterPosition:withContext:", a10, x, y, width, height, x + width * 0.5, y + height * 0.5);
        if (!AllowsDithering)
        {
LABEL_23:
          CGContextRestoreGState(a10);
          if (v14)
          {
            CUIStartFocusRingInternal();
            v39.origin.double x = x;
            v39.origin.double y = y;
            v39.size.double width = width;
            v39.size.double height = height;
            CGContextFillRect(a10, v39);
            CUIStartFocusRingInternal();
          }
          goto LABEL_25;
        }
LABEL_22:
        CGContextSetAllowsDithering();
        goto LABEL_23;
      case 0x4C6E7220u:
        objc_msgSend(v28, "drawInRect:angle:withContext:", a10, x, y, width, height, a4);
        if (!AllowsDithering) {
          goto LABEL_23;
        }
        goto LABEL_22;
    }
    if (!AllowsDithering) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v25)
  {
    uint64_t v30 = NSStringFromSelector(a2);
    objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "debugDescriptionForKeyList:", -[CUIRenditionKey keyList](v37, "keyList"));
    _CUILog(4, (uint64_t)"ERROR: %@ called on pixel-type rendition of %@ with key: %@\nIgnoring gradient angle information and applying regular rendition drawing", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
    -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v37, a10, a6, v14, (uint64_t)a8, 0, a11, x, y, width, height, a5);
  }
LABEL_25:
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  uint64_t v11 = *(void *)&a5;
  if (a4 >= 0.0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 20;
  }
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9
{
  if (a3.size.height != 0.0)
  {
    CGFloat width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      uint64_t v12 = *(void *)&a6;
      CGFloat height = a3.size.height;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      if (a8) {
        int v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a8 keyList]);
      }
      else {
        int v19 = objc_alloc_init(CUIRenditionKey);
      }
      size_t v20 = v19;
      [(CUIThemeFacet *)self _applyFixedAttributesToKey:v19];
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v20, a9, a5, v12, (uint64_t)a7, 0, 0, x, y, width, height, a4);
    }
  }
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 keyAdjustment:(id)a5 context:(CGContext *)a6
{
  if (a4 >= 0.0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 20;
  }
  -[CUIThemeFacet drawHighlightInFrame:alpha:operation:keyAdjustment:context:](self, "drawHighlightInFrame:alpha:operation:keyAdjustment:context:", v8, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 keyAdjustment:(id)a6 context:(CGContext *)a7
{
  if (a3.size.height != 0.0)
  {
    double width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      uint64_t v9 = *(void *)&a5;
      double height = a3.size.height;
      double y = a3.origin.y;
      double x = a3.origin.x;
      if (a6) {
        uint64_t v15 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a6 keyList]);
      }
      else {
        uint64_t v15 = objc_alloc_init(CUIRenditionKey);
      }
      CGBlendMode v16 = v15;
      [(CUIThemeFacet *)self _applyFixedAttributesToKey:v15];
      [(CUIRenditionKey *)v16 setThemeLayer:1];
      [(CUIRenditionKey *)v16 setThemeState:0];
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](self, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", v16, a7, v9, 0, 0, 0, x, y, width, height, a4);
    }
  }
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  uint64_t v11 = *(void *)&a5;
  if (a4 >= 0.0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 20;
  }
  -[CUIThemeFacet drawMaskInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:](self, "drawMaskInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9
{
  if (a3.size.height != 0.0)
  {
    CGFloat width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      CGFloat height = a3.size.height;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      if (a8) {
        int v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a8 keyList]);
      }
      else {
        int v19 = objc_alloc_init(CUIRenditionKey);
      }
      size_t v20 = v19;
      [(CUIThemeFacet *)self _applyFixedAttributesToKey:v19];
      -[CUIThemeFacet _drawMaskFromSpecificRenditionKey:inFrame:alpha:operation:isFocused:focusRingColor:context:](self, v20, (CGBlendMode)a5, a6, (uint64_t)a7, a9, x, y, width, height, a4);
    }
  }
}

- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  if (a3.size.height != 0.0)
  {
    double width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      double height = a3.size.height;
      double y = a3.origin.y;
      double x = a3.origin.x;
      if (a7) {
        int v17 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a7 keyList]);
      }
      else {
        int v17 = objc_alloc_init(CUIRenditionKey);
      }
      CFDataRef v24 = v17;
      [(CUIThemeFacet *)self _applyFixedAttributesToKey:v17];
      unint64_t themeIndex = self->_themeIndex;
      int64_t v19 = [(CUIRenditionKey *)v24 themeScale];
      DrawPulsedElementFromRenditionKey(themeIndex, v24, a8, a5, x, y, width, height, a4, (double)v19, (uint64_t)a6, v20, v21, v22, v23);
    }
  }
}

- (void)_drawSpecificRenditionKey:(void *)a3 rendition:(CGContext *)a4 inFrame:(uint64_t)a5 context:(uint64_t)a6 alpha:(uint64_t)a7 operation:(unsigned __int8)a8 isFocused:(CGFloat)a9 focusRingColor:(CGFloat)a10 isFlipped:(CGFloat)a11 effects:(CGFloat)a12
{
  if (a1 && a12 != 0.0 && a11 != 0.0 && a13 >= 0.00000011920929)
  {
    id v28 = (char *)[a3 type];
    if ((unint64_t)(v28 - 1) > 1)
    {
      if (v28)
      {
        if (v28 == (char *)6)
        {
          [a3 gradientDrawingAngle];
          double v34 = v33;
          double v35 = fmod(v33, 360.0);
          if (v34 < 0.0) {
            double v35 = v35 + 360.0;
          }
          if (((v35 > 0.0) & a8) != 0) {
            double v36 = 360.0 - v35;
          }
          else {
            double v36 = v35;
          }
          objc_msgSend(a1, "drawGradientInFrame:angle:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:effects:", a5, a6, a7, a2, a4, a14, a9, a10, a11, a12, v36, a13);
        }
        else if (v28 == (char *)3)
        {
          uint64_t v29 = a1[2];
          double v30 = (double)(uint64_t)[a2 themeScale];
          DrawNinePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, v30, v29, a3, a4, a6, a7, (CGBlendMode)a5, a14);
        }
        else
        {
          id v37 = +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", [a3 type]);
          objc_msgSend(objc_msgSend(a1, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
          _CUILog(4, (uint64_t)"CUIThemeFacet needs code to draw %@ rendition %@", v38, v39, v40, v41, v42, v43, (uint64_t)v37);
        }
      }
      else
      {
        uint64_t v31 = a1[2];
        double v32 = (double)(uint64_t)[a2 themeScale];
        DrawOnePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, v32, v31, a3, a4, a6, a7, (CGBlendMode)a5, 0, a14);
      }
    }
    else
    {
      DrawThreePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, (double)(uint64_t)[a2 themeScale], a1[2], a3, a4, a6, a7, (CGBlendMode)a5, 0, 1, 2, a14);
    }
  }
}

- (void)_drawSlice:(int64_t)a3 inFrame:(CGRect)a4 withKeyAdjustment:(id)a5 context:(CGContext *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (a5) {
    uint64_t v13 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a5 keyList]);
  }
  else {
    uint64_t v13 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v15 = v13;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v13];
  id v14 = [(CUIThemeFacet *)self _renditionForSpecificKey:v15];
  DrawThemeImageWithOperation(objc_msgSend(v14, "imageForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v14)), a6, kCGBlendModeNormal, 0, x, y, width, height, 1.0);
}

- (id)renditionMetricsWithKeyAdjustment:(id)a3
{
  if (a3) {
    BOOL v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 keyList]);
  }
  else {
    BOOL v4 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v5 = v4;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v4];
  id v6 = objc_msgSend(-[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v5), "metrics");

  return v6;
}

- (id)renditionSliceInformationForRect:(CGRect)a3 keyAdjustment:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    uint64_t v9 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    uint64_t v9 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v10 = v9;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v9];
  id v11 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v10);
  if ([v11 type] == (id)6)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = (CUIRenditionSliceInformation *)[v11 sliceInformation];
    if (v12) {
      uint64_t v12 = -[CUIRenditionSliceInformation initWithSliceInformation:destinationRect:]([CUIRenditionSliceInformation alloc], "initWithSliceInformation:destinationRect:", v12, x, y, width, height);
    }
  }

  return v12;
}

- (id)imageForState:(int64_t)a3
{
  uint64_t v5 = CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 6);
  return [(CUIThemeFacet *)self imageForState:a3 value:v5];
}

- (BOOL)hasValueSlices
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  CUIRenditionKeyCopy(v4, &self->_renditionKeyList->identifier, 0x16u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 6, 1, 0x16u);
  return objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "canGetRenditionWithKey:", v4);
}

- (_WORD)isValidButtonImageSourceForSize:(_WORD *)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = [result _themeStore];
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    CUIRenditionKeyCopy(v5, v3[1], 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, (unsigned __int16)a2, 0x16u);
    if (([v4 canGetRenditionWithKey:v5] & 1) == 0)
    {
      if (!a2
        || (CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, 0, 0x16u),
            ([v4 canGetRenditionWithKey:v5] & 1) == 0))
      {
        CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, (unsigned __int16)a2, 0x16u);
      }
    }
    return (_WORD **)(objc_msgSend(objc_msgSend(v4, "renditionWithKey:", v5), "type") == 0);
  }
  return result;
}

- (BOOL)isValidButtonImageSource
{
  uint64_t v3 = CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 3);
  return -[CUIThemeFacet isValidButtonImageSourceForSize:](self, v3);
}

- (id)imageForState:(int64_t)a3 value:(int64_t)a4
{
  uint64_t v7 = CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 3);
  return [(CUIThemeFacet *)self imageForState:a3 value:a4 size:v7];
}

- (id)imageForState:(int64_t)a3 value:(int64_t)a4 size:(unint64_t)a5
{
  if (!-[CUIThemeFacet isValidButtonImageSourceForSize:](self, a5)) {
    return 0;
  }
  uint64_t v9 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  [(CUIRenditionKey *)v9 setThemeState:a3];
  [(CUIRenditionKey *)v9 setThemeValue:a4];
  if ([(CUIRenditionKey *)v9 themeSize] != a5) {
    [(CUIRenditionKey *)v9 setThemeSize:a5];
  }
  id v10 = objc_msgSend(-[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v9), "imageForSliceIndex:", 0);

  return v10;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  id v4 = [(CUIThemeFacet *)self renditionForSpecificKeyWrapper:[(CUIThemeFacet *)self renditionKey]];
  return [v4 imageForSliceIndex:a3];
}

- (id)image
{
  return [(CUIThemeFacet *)self imageForSliceIndex:0];
}

- (double)alphaWithKeyAdjustment:(id)a3
{
  if (a3) {
    id v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 keyList]);
  }
  else {
    id v4 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v5 = v4;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v4];
  id v6 = [(CUIThemeFacet *)self renditionForSpecificKeyWrapper:v5];

  [v6 opacity];
  return result;
}

- (double)alpha
{
  [(CUIThemeFacet *)self alphaWithKeyAdjustment:0];
  return result;
}

- (int)blendModeWithKeyAdjustment:(id)a3
{
  if (a3) {
    id v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 keyList]);
  }
  else {
    id v4 = objc_alloc_init(CUIRenditionKey);
  }
  uint64_t v5 = v4;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v4];
  id v6 = [(CUIThemeFacet *)self renditionForSpecificKeyWrapper:v5];

  return [v6 blendMode];
}

- (int)blendMode
{
  return [(CUIThemeFacet *)self blendModeWithKeyAdjustment:0];
}

- (id)blendModeAsCAFilterStringWithKeyAjustment:(id)a3
{
  unsigned int v3 = [(CUIThemeFacet *)self blendModeWithKeyAdjustment:a3];
  id result = 0;
  switch(v3)
  {
    case 1u:
      uint64_t v5 = (id *)&kCAFilterMultiplyBlendMode;
      goto LABEL_24;
    case 2u:
      uint64_t v5 = (id *)&kCAFilterScreenBlendMode;
      goto LABEL_24;
    case 3u:
      uint64_t v5 = (id *)&kCAFilterOverlayBlendMode;
      goto LABEL_24;
    case 4u:
      uint64_t v5 = (id *)&kCAFilterDarkenBlendMode;
      goto LABEL_24;
    case 5u:
      uint64_t v5 = (id *)&kCAFilterLightenBlendMode;
      goto LABEL_24;
    case 6u:
      uint64_t v5 = (id *)&kCAFilterColorDodgeBlendMode;
      goto LABEL_24;
    case 7u:
      uint64_t v5 = (id *)&kCAFilterColorBurnBlendMode;
      goto LABEL_24;
    case 8u:
      uint64_t v5 = (id *)&kCAFilterSoftLightBlendMode;
      goto LABEL_24;
    case 9u:
      uint64_t v5 = (id *)&kCAFilterHardLightBlendMode;
      goto LABEL_24;
    case 0xAu:
      uint64_t v5 = (id *)&kCAFilterDifferenceBlendMode;
      goto LABEL_24;
    case 0xBu:
      uint64_t v5 = (id *)&kCAFilterExclusionBlendMode;
      goto LABEL_24;
    case 0x10u:
      uint64_t v5 = (id *)&kCAFilterClear;
      goto LABEL_24;
    case 0x11u:
      uint64_t v5 = (id *)&kCAFilterCopy;
      goto LABEL_24;
    case 0x12u:
      uint64_t v5 = (id *)&kCAFilterSourceIn;
      goto LABEL_24;
    case 0x13u:
      uint64_t v5 = (id *)&kCAFilterSourceOut;
      goto LABEL_24;
    case 0x14u:
      uint64_t v5 = (id *)&kCAFilterSourceAtop;
      goto LABEL_24;
    case 0x15u:
      uint64_t v5 = (id *)&kCAFilterDestOver;
      goto LABEL_24;
    case 0x16u:
      uint64_t v5 = (id *)&kCAFilterDestIn;
      goto LABEL_24;
    case 0x17u:
      uint64_t v5 = (id *)&kCAFilterDestOut;
      goto LABEL_24;
    case 0x18u:
      uint64_t v5 = (id *)&kCAFilterDestAtop;
      goto LABEL_24;
    case 0x19u:
      uint64_t v5 = (id *)&kCAFilterXor;
      goto LABEL_24;
    case 0x1Bu:
      uint64_t v5 = (id *)&kCAFilterPlusL;
LABEL_24:
      id result = *v5;
      break;
    default:
      return result;
  }
  return result;
}

- (id)blendModeAsCAFilterString
{
  return [(CUIThemeFacet *)self blendModeAsCAFilterStringWithKeyAjustment:0];
}

- (CGSize)imageSize
{
  unsigned int v3 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  id v4 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v3);
  if ([v4 type] == (id)6)
  {
    CGFloat width = NSZeroSize.width;
    CGFloat height = NSZeroSize.height;
  }
  else
  {
    id v7 = [v4 metrics];
    if (v7) {
      [v7 imageSize];
    }
    else {
      objc_msgSend(objc_msgSend(v4, "imageForSliceIndex:", 0), "size");
    }
    CGFloat width = v8;
    CGFloat height = v9;
  }

  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGSize)sizeForSegmentOfType:(int)a3
{
  if ((id)[(CUIThemeFacet *)self renditionType] == (id)5)
  {
    int v5 = a3 - 1;
    if ((a3 - 1) > 2)
    {
      uint64_t v7 = 0;
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = qword_1A139EB68[v5];
      uint64_t v7 = qword_1A139EB80[v5];
    }
    id v10 = [(CUIThemeFacet *)self imageForSliceIndex:v7];
    id v11 = [(CUIThemeFacet *)self imageForSliceIndex:1];
    id v12 = [(CUIThemeFacet *)self imageForSliceIndex:v6];
    [v10 size];
    double v14 = v13;
    [v11 size];
    double v16 = v14 + v15;
    [v12 size];
    double v18 = v16 + v17;
    [v10 size];
    double v20 = v19;
    [v11 size];
    if (v20 <= v21) {
      uint64_t v22 = v11;
    }
    else {
      uint64_t v22 = v10;
    }
    [v22 size];
    double v24 = v23;
    [v12 size];
    if (v24 > v25)
    {
      [v10 size];
      double v27 = v26;
      [v11 size];
      if (v27 <= v28) {
        id v12 = v11;
      }
      else {
        id v12 = v10;
      }
    }
    [v12 size];
    double v8 = v18;
  }
  else
  {
    [(CUIThemeFacet *)self imageSize];
  }
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (id)gradientWithKeyAdjustment:(id)a3 angle:(double *)a4 style:(unint64_t *)a5
{
  if (a3) {
    double v8 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a3 keyList]);
  }
  else {
    double v8 = objc_alloc_init(CUIRenditionKey);
  }
  double v9 = v8;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v8];
  id v10 = [(CUIThemeFacet *)self _renditionForSpecificKey:v9];
  if ([v10 type] == (id)6)
  {
    id v11 = [v10 gradient];

    if (v11)
    {
      if (a4)
      {
        [v10 gradientDrawingAngle];
        *(void *)a4 = v12;
      }
      if (a5) {
        *a5 = [v10 gradientStyle];
      }
    }
  }
  else
  {

    return 0;
  }
  return v11;
}

- (void)_setThemeIndex:(unint64_t)a3
{
  self->_unint64_t themeIndex = a3;
}

- (unint64_t)themeIndex
{
  return self->_themeIndex;
}

- (id)themeRendition
{
  unsigned int v3 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  id v4 = [(CUIThemeFacet *)self renditionForSpecificKeyWrapper:v3];

  return v4;
}

- (id)renditionKey
{
  id v2 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  return v2;
}

- (int64_t)renditionType
{
  int64_t result = self->_renditionType;
  if (result < 0)
  {
    int64_t result = (int64_t)objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "type");
    self->_renditionType = result;
  }
  return result;
}

- (BOOL)isTintable
{
  unsigned int isTintable = self->_isTintable;
  if ((isTintable & 0x80000000) != 0)
  {
    unsigned int isTintable = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "isTintable");
    self->_unsigned int isTintable = isTintable;
  }
  return isTintable != 0;
}

- (id)properties
{
  id v2 = [(CUIThemeFacet *)self _rendition];
  return [v2 properties];
}

- (id)displayName
{
  unsigned int v3 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
  id v4 = objc_msgSend(-[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v3), "name");

  if (v4) {
    return v4;
  }
  else {
    return @"Problem in -[CUIThemeFacet displayName]";
  }
}

- (id)thumbnail
{
  id v4 = [(CUIThemeFacet *)self _rendition];
  if (!v4) {
    id v4 = CUIPlaceHolderRendition(0, v3);
  }
  int v5 = (char *)[v4 type];
  if ((unint64_t)(v5 - 1) < 3 || v5 == (char *)6)
  {
    [(CUIThemeFacet *)self _thumbnailSizeForRendition:v4];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    id v11 = [[CUIRenditionKey alloc] initWithKeyList:self->_renditionKeyList];
    uint64_t v12 = [(CUIThemeFacet *)(CUIImage *)self _imageForRenditionFromKey:0 withSize:v8 isMask:v10];

    return v12;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [v4 imageForSliceIndex:0];
  }
}

- (CGSize)thumbnailSize
{
  double height = self->_thumbnailSize.height;
  if (height >= 0.0)
  {
    double width = self->_thumbnailSize.width;
  }
  else
  {
    objc_msgSend(-[CUIThemeFacet thumbnail](self, "thumbnail"), "size");
    self->_thumbnailSize.double width = width;
    self->_thumbnailSize.double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)topLeftCapSize
{
  id v2 = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "imageForSliceIndex:", 0);
  if (v2)
  {
    [v2 size];
  }
  else
  {
    double width = NSZeroSize.width;
    double height = NSZeroSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_applyFixedAttributesToKey:(id)a3
{
}

- (int64_t)_sliceIndexForSlice:(int64_t)a3 ofRendition:(id)a4
{
  int v5 = (char *)[a4 type];
  BOOL v6 = (unint64_t)(v5 - 1) < 2 && a3 == 4;
  int64_t v7 = 2;
  if (!v6) {
    int64_t v7 = a3 - 1;
  }
  if (v5 == (char *)6) {
    int64_t v7 = 0;
  }
  if (a3 >= 1) {
    return v7;
  }
  else {
    return 0;
  }
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeFacet;
  return -[NSString stringByAppendingFormat:](-[CUIThemeFacet description](&v3, sel_description), "stringByAppendingFormat:", @" %@", objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "debugDescriptionForKeyList:", self->_renditionKeyList));
}

- (id)maskForSlice:(int64_t)a3 withKeyAdjustment:(id)a4
{
  if (a4) {
    BOOL v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    BOOL v6 = objc_alloc_init(CUIRenditionKey);
  }
  int64_t v7 = v6;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v6];
  [(CUIRenditionKey *)v7 setThemeLayer:2];
  [(CUIRenditionKey *)v7 setThemeState:0];
  id v8 = [(CUIThemeFacet *)self _renditionForSpecificKey:v7];
  id v9 = objc_msgSend(v8, "maskForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v8));

  return v9;
}

- (id)imageForSlice:(int64_t)a3 withKeyAdjustment:(id)a4
{
  if (a4) {
    BOOL v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    BOOL v6 = objc_alloc_init(CUIRenditionKey);
  }
  int64_t v7 = v6;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v6];
  if ([(CUIThemeFacet *)self _isButtonGlyph]) {
    id v8 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v7);
  }
  else {
    id v8 = [(CUIThemeFacet *)self _renditionForSpecificKey:v7];
  }
  id v9 = objc_msgSend(v8, "imageForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v8));

  return v9;
}

- (id)imageWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4) {
    int64_t v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    int64_t v7 = objc_alloc_init(CUIRenditionKey);
  }
  id v8 = v7;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v7];
  id v9 = [(CUIThemeFacet *)(CUIImage *)self _imageForRenditionFromKey:0 withSize:width isMask:height];

  return v9;
}

- (id)highlightWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4) {
    int64_t v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    int64_t v7 = objc_alloc_init(CUIRenditionKey);
  }
  id v8 = v7;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v7];
  [(CUIRenditionKey *)v8 setThemeLayer:1];
  [(CUIRenditionKey *)v8 setThemeState:0];
  id v9 = [(CUIThemeFacet *)(CUIImage *)self _imageForRenditionFromKey:0 withSize:width isMask:height];

  return v9;
}

- (id)maskWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4) {
    int64_t v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", [a4 keyList]);
  }
  else {
    int64_t v7 = objc_alloc_init(CUIRenditionKey);
  }
  id v8 = v7;
  [(CUIThemeFacet *)self _applyFixedAttributesToKey:v7];
  [(CUIRenditionKey *)v8 setThemeLayer:2];
  [(CUIRenditionKey *)v8 setThemeState:0];
  id v9 = [(CUIThemeFacet *)(CUIImage *)self _imageForRenditionFromKey:1 withSize:width isMask:height];

  return v9;
}

@end