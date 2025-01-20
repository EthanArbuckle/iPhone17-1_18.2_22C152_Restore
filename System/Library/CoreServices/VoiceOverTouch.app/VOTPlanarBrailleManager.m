@interface VOTPlanarBrailleManager
+ (id)manager;
- (BOOL)_isElementForReading:(id)a3;
- (BOOL)_isModeReadingType;
- (BOOL)_shouldShowImages;
- (BOOL)imageInvert;
- (CGPoint)imageOrigin;
- (NSArray)planarBrailleElements;
- (NSLock)planarCacheLock;
- (NSMutableDictionary)planarNeighborhoodCache;
- (VOTElement)focusedElement;
- (VOTPlanarBrailleManager)init;
- (VOTPlanarBrailleManagerDelegate)delegate;
- (double)imageIntensity;
- (double)imageZoom;
- (int)previousPanningDirection;
- (int64_t)mode;
- (void)_handlePlanarPanFailedInPreviewModeIsLeft:(BOOL)a3;
- (void)_handlePlanarPanFailedInReadingTypeModeIsLeft:(BOOL)a3;
- (void)_setImageData:(id)a3;
- (void)_setTextData:(id)a3 focusedIndex:(int64_t)a4;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)refreshPlanarBraille;
- (void)setDelegate:(id)a3;
- (void)setFocusedElement:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageIntensity:(double)a3;
- (void)setImageInvert:(BOOL)a3;
- (void)setImageOrigin:(CGPoint)a3;
- (void)setImageZoom:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setPlanarBrailleElement:(id)a3;
- (void)setPlanarBrailleElements:(id)a3;
- (void)setPlanarCacheLock:(id)a3;
- (void)setPlanarNeighborhoodCache:(id)a3;
- (void)setPreviousPanningDirection:(int)a3;
@end

@implementation VOTPlanarBrailleManager

+ (id)manager
{
  if (qword_1001EBC88 != -1) {
    dispatch_once(&qword_1001EBC88, &stru_1001B6EB8);
  }
  v2 = (void *)qword_1001EBC80;

  return v2;
}

- (VOTPlanarBrailleManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VOTPlanarBrailleManager;
  v2 = [(VOTPlanarBrailleManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_imageIntensity = xmmword_10016EA90;
    v2->_imageInvert = 0;
    v2->_imageOrigin.x = 0.0;
    v2->_imageOrigin.y = 0.0;
    v2->_mode = 1;
    v2->_previousPanningDirection = -1;
    uint64_t v4 = objc_opt_new();
    planarCacheLock = v3->_planarCacheLock;
    v3->_planarCacheLock = (NSLock *)v4;

    uint64_t v6 = objc_opt_new();
    planarNeighborhoodCache = v3->_planarNeighborhoodCache;
    v3->_planarNeighborhoodCache = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)setPlanarBrailleElement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v22 = v4;
    uint64_t v6 = +[NSArray arrayWithObjects:&v22 count:1];
    [(VOTPlanarBrailleManager *)self setPlanarBrailleElements:v6];

    if ([(VOTPlanarBrailleManager *)self _shouldShowImages]
      && (+[VOTWorkspace sharedWorkspace],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 visionEngine],
          v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 processElementFor2DBrailleDisplay:v5],
          v8,
          v7,
          v9))
    {
      [(VOTPlanarBrailleManager *)self setFocusedElement:v5];
    }
    else if ([(VOTPlanarBrailleManager *)self mode])
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = sub_100101DDC;
      v20 = sub_100101DEC;
      id v21 = v5;
      objc_initWeak(&location, self);
      v10 = [(id)VOTSharedWorkspace elementManager];
      uint64_t v11 = v17[5];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100101DF4;
      v13[3] = &unk_1001B6F08;
      v13[4] = self;
      v13[5] = &v16;
      objc_copyWeak(&v14, &location);
      [v10 fetchElementsFrom:v11 inDirection:2 count:32 scroll:0 block:v13];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v12 = objc_opt_new();
      [(VOTPlanarBrailleManager *)self _setImageData:v12];

      [(VOTPlanarBrailleManager *)self setFocusedElement:v5];
    }
  }
}

- (void)setImageData:(id)a3
{
  id v4 = a3;
  if ([(VOTPlanarBrailleManager *)self _shouldShowImages])
  {
    v5 = AXLogBrailleHW();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 length]);
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Processing image data: %@", (uint8_t *)&v9, 0xCu);
    }
    v7 = [(VOTPlanarBrailleManager *)self delegate];
    id v8 = [objc_alloc((Class)SCRO2DBrailleData) initWithImageData:v4];
    [v7 setPlanarData:v8];
  }
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VOTPlanarBrailleManager *)self focusedElement];

  if (v5)
  {
    uint64_t v6 = [(VOTPlanarBrailleManager *)self planarBrailleElements];
    id v7 = [v6 count];

    if (!v7)
    {
      id v8 = [(VOTPlanarBrailleManager *)self focusedElement];
      v10 = v8;
      int v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [(VOTPlanarBrailleManager *)self setPlanarBrailleElements:v9];
    }
    if ((id)[(VOTPlanarBrailleManager *)self mode] == (id)3) {
      [(VOTPlanarBrailleManager *)self _handlePlanarPanFailedInPreviewModeIsLeft:v3];
    }
    else {
      [(VOTPlanarBrailleManager *)self _handlePlanarPanFailedInReadingTypeModeIsLeft:v3];
    }
  }
}

- (void)_handlePlanarPanFailedInReadingTypeModeIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VOTPlanarBrailleManager *)self focusedElement];
  uint64_t v6 = [(VOTPlanarBrailleManager *)self focusedElement];
  unsigned __int8 v7 = [(VOTPlanarBrailleManager *)self _isElementForReading:v6];

  id v8 = [(VOTPlanarBrailleManager *)self planarBrailleElements];
  int v9 = v8;
  if (v3)
  {
    v10 = [v8 firstObject];

    uint64_t v11 = [(id)VOTSharedWorkspace elementManager];
    [v11 setCurrentElement:v10 shouldSetBrailleElement:0];

    v12 = [(id)VOTSharedWorkspace elementManager];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001026B4;
    v31[3] = &unk_1001B6F30;
    unsigned __int8 v34 = v7;
    v13 = &v32;
    v31[4] = self;
    v32 = v5;
    id v14 = &v33;
    v33 = v10;
    id v15 = v5;
    id v16 = v10;
    v17 = (void ***)v31;
    uint64_t v18 = v12;
    id v19 = v16;
    uint64_t v20 = 2;
  }
  else
  {
    id v21 = [v8 lastObject];

    id v22 = [(id)VOTSharedWorkspace elementManager];
    [v22 setCurrentElement:v21 shouldSetBrailleElement:0];

    v12 = [(id)VOTSharedWorkspace elementManager];
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_10010284C;
    v26 = &unk_1001B6F30;
    unsigned __int8 v30 = v7;
    v13 = &v28;
    v27 = self;
    v28 = v5;
    id v14 = &v29;
    v29 = v21;
    id v15 = v21;
    id v16 = v5;
    v17 = &v23;
    uint64_t v18 = v12;
    id v19 = v15;
    uint64_t v20 = 1;
  }
  objc_msgSend(v18, "fetchElementsFrom:inDirection:count:scroll:block:", v19, v20, 1, 1, v17, v23, v24, v25, v26, v27);
}

- (void)_handlePlanarPanFailedInPreviewModeIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VOTPlanarBrailleManager *)self planarBrailleElements];
  uint64_t v6 = [(VOTPlanarBrailleManager *)self focusedElement];
  unsigned __int8 v7 = [v5 indexOfObject:v6];

  id v8 = [(VOTPlanarBrailleManager *)self delegate];
  id v9 = [v8 numberOfTextLinesInPlanarBraille];

  if (v3)
  {
    uint64_t v10 = (v7 - (unsigned char *)v9) & ~((v7 - (unsigned char *)v9) >> 63);
  }
  else
  {
    uint64_t v11 = &v7[(void)v9];
    v12 = [(VOTPlanarBrailleManager *)self planarBrailleElements];
    v13 = (char *)[v12 count] - 1;

    if (v11 >= v13) {
      uint64_t v10 = (uint64_t)v13;
    }
    else {
      uint64_t v10 = (uint64_t)v11;
    }
  }
  id v14 = [(VOTPlanarBrailleManager *)self planarBrailleElements];
  id v16 = [v14 objectAtIndex:v10];

  id v15 = [(id)VOTSharedWorkspace elementManager];
  [v15 moveToElement:v16];
}

- (void)refreshPlanarBraille
{
  BOOL v3 = [(VOTPlanarBrailleManager *)self focusedElement];

  if (v3)
  {
    id v4 = [(VOTPlanarBrailleManager *)self focusedElement];
    [(VOTPlanarBrailleManager *)self setPlanarBrailleElement:v4];
  }
}

- (BOOL)_shouldShowImages
{
  return ![(VOTPlanarBrailleManager *)self mode] || (id)[(VOTPlanarBrailleManager *)self mode] == (id)1;
}

- (BOOL)_isModeReadingType
{
  int64_t v3 = [(VOTPlanarBrailleManager *)self mode];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(VOTPlanarBrailleManager *)self mode] == (id)2;
  }
  return v3;
}

- (void)_setImageData:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)SCRO2DBrailleData) initWithImageData:v4];

  v5 = [(VOTPlanarBrailleManager *)self delegate];
  [v5 setPlanarData:v6];
}

- (void)_setTextData:(id)a3 focusedIndex:(int64_t)a4
{
  id v11 = a3;
  int64_t v6 = [(VOTPlanarBrailleManager *)self mode];
  [(VOTPlanarBrailleManager *)self setPreviousPanningDirection:0xFFFFFFFFLL];
  id v7 = objc_alloc((Class)SCRO2DBrailleData);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [objc_alloc((Class)SCRO2DBrailleData) initWithStrings:v11 focusedIndex:a4 truncateStrings:v6 == 3 alignAtTop:1];
    uint64_t v10 = [(VOTPlanarBrailleManager *)self delegate];
    [v10 setPlanarData:v9];
  }
}

- (BOOL)_isElementForReading:(id)a3
{
  id v3 = a3;
  if (([v3 isReadingContent] & 1) != 0
    || ([v3 includeDuringContentReading] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 doesHaveTraits:kAXWebContentTrait];
  }

  return v4;
}

- (VOTPlanarBrailleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTPlanarBrailleManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)imageIntensity
{
  return self->_imageIntensity;
}

- (void)setImageIntensity:(double)a3
{
  self->_imageIntensity = a3;
}

- (double)imageZoom
{
  return self->_imageZoom;
}

- (void)setImageZoom:(double)a3
{
  self->_imageZoom = a3;
}

- (BOOL)imageInvert
{
  return self->_imageInvert;
}

- (void)setImageInvert:(BOOL)a3
{
  self->_imageInvert = a3;
}

- (CGPoint)imageOrigin
{
  double x = self->_imageOrigin.x;
  double y = self->_imageOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setImageOrigin:(CGPoint)a3
{
  self->_imageOrigin = a3;
}

- (VOTElement)focusedElement
{
  return self->_focusedElement;
}

- (void)setFocusedElement:(id)a3
{
}

- (NSLock)planarCacheLock
{
  return self->_planarCacheLock;
}

- (void)setPlanarCacheLock:(id)a3
{
}

- (NSArray)planarBrailleElements
{
  return self->_planarBrailleElements;
}

- (void)setPlanarBrailleElements:(id)a3
{
}

- (NSMutableDictionary)planarNeighborhoodCache
{
  return self->_planarNeighborhoodCache;
}

- (void)setPlanarNeighborhoodCache:(id)a3
{
}

- (int)previousPanningDirection
{
  return self->_previousPanningDirection;
}

- (void)setPreviousPanningDirection:(int)a3
{
  self->_previousPanningDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planarNeighborhoodCache, 0);
  objc_storeStrong((id *)&self->_planarBrailleElements, 0);
  objc_storeStrong((id *)&self->_planarCacheLock, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end