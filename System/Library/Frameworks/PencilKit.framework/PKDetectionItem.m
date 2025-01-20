@interface PKDetectionItem
- (BOOL)_hitTest:(CGPoint)a3;
- (BOOL)validCachedUUID;
- (CGAffineTransform)drawingToItemTransform;
- (CGRect)_frame;
- (CGRect)strokeBounds;
- (NSString)identifier;
- (NSUUID)cachedUUID;
- (PKDetectionItem)initWithSessionManager:(id)a3;
- (PKDetectionQueryItem)queryItem;
- (PKDrawing)drawing;
- (PKRecognitionSessionManager)sessionManager;
- (UIBezierPath)_baselinePath;
- (UIBezierPath)drawingSpaceBoundsPath;
- (UIBezierPath)itemSpaceBaselinePath;
- (UIBezierPath)itemSpaceBoundsPath;
- (UIColor)inkColor;
- (UIColor)strokeColor;
- (double)_strokeWidth;
- (id)UUID;
- (id)_actionNameForActivation:(BOOL)a3;
- (id)_strokes;
- (id)image;
- (id)setUUID:(id)a3;
- (void)_generatePaths;
- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7;
- (void)setCachedUUID:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setInkColor:(id)a3;
- (void)setItemSpaceBaselinePath:(id)a3;
- (void)setItemSpaceBoundsPath:(id)a3;
- (void)setQueryItem:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setStrokeBounds:(CGRect)a3;
- (void)setValidCachedUUID:(BOOL)a3;
- (void)set_frame:(CGRect)a3;
- (void)set_strokeWidth:(double)a3;
@end

@implementation PKDetectionItem

- (PKDetectionItem)initWithSessionManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDetectionItem;
  v5 = [(PKDetectionItem *)&v13 init];
  v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  CGPoint v9 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v5->__frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v5->__frame.size = v10;
  v5->_strokeBounds.origin = v9;
  v5->_strokeBounds.size = v10;
  inkColor = v5->_inkColor;
  v5->__strokeWidth = 0.0;
  v5->_inkColor = 0;

  objc_storeWeak((id *)&v5->_sessionManager, v4);
  return v5;
}

- (CGAffineTransform)drawingToItemTransform
{
  [(PKDetectionItem *)self _frame];
  double v6 = -v5;
  [(PKDetectionItem *)self _frame];
  double v8 = -v7;

  return CGAffineTransformMakeTranslation(retstr, v6, v8);
}

- (BOOL)_hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PKDetectionItem *)self _frame];
  v15.double x = x;
  v15.double y = y;
  if (!CGRectContainsPoint(v16, v15)) {
    return 0;
  }
  [(PKDetectionItem *)self drawingToItemTransform];
  double v6 = [(PKDetectionItem *)self itemSpaceBoundsPath];
  char v7 = objc_msgSend(v6, "containsPoint:", v13 + y * v11 + v9 * x, v14 + y * v12 + v10 * x);

  return v7;
}

- (UIBezierPath)_baselinePath
{
  return 0;
}

- (id)_strokes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PKDetectionItem *)self queryItem];
  double v5 = [v4 strokeIdentifiers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [(PKDetectionItem *)self drawing];
        double v11 = [v9 strokeUUID];
        double v12 = [v10 _visibleStrokeForIdentifier:v11];

        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_generatePaths
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  [(PKDetectionItem *)self _strokes];
  v54 = 0;
  v55 = 0;
  uint64_t v56 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v51 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        [v7 _appendPointsOfInterestForSelection:&v54];
        double strokeWidth = self->__strokeWidth;
        [v7 _maxWidthForStroke];
        if (strokeWidth >= v9) {
          double v9 = strokeWidth;
        }
        self->__double strokeWidth = v9;
        CGFloat x = self->_strokeBounds.origin.x;
        CGFloat y = self->_strokeBounds.origin.y;
        CGFloat width = self->_strokeBounds.size.width;
        CGFloat height = self->_strokeBounds.size.height;
        [v7 _bounds];
        v62.origin.CGFloat x = v14;
        v62.origin.CGFloat y = v15;
        v62.size.CGFloat width = v16;
        v62.size.CGFloat height = v17;
        v59.origin.CGFloat x = x;
        v59.origin.CGFloat y = y;
        v59.size.CGFloat width = width;
        v59.size.CGFloat height = height;
        self->_strokeBounds = CGRectUnion(v59, v62);
        if (!self->_inkColor)
        {
          v18 = [v7 ink];
          uint64_t v19 = [v18 color];
          inkColor = self->_inkColor;
          self->_inkColor = v19;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v4);
  }

  if (v54 == v55)
  {
    CGSize v39 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->__frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->__frame.size = v39;
    itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
    self->_itemSpaceBoundsPath = 0;

    itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
    self->_itemSpaceBaselinePath = 0;
  }
  else
  {
    __p = 0;
    v48 = 0;
    uint64_t v49 = 0;
    +[PKPathUtility convexHull:&__p forPoints:&v54];
    v21 = +[PKPathUtility bezierPathFromPoints:&__p];
    v22 = self->_itemSpaceBoundsPath;
    self->_itemSpaceBoundsPath = v21;

    v23 = [(PKDetectionItem *)self _baselinePath];
    v24 = self->_itemSpaceBaselinePath;
    self->_itemSpaceBaselinePath = v23;

    [(UIBezierPath *)self->_itemSpaceBoundsPath bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [(UIBezierPath *)self->_itemSpaceBaselinePath bounds];
    v63.origin.CGFloat x = v33;
    v63.origin.CGFloat y = v34;
    v63.size.CGFloat width = v35;
    v63.size.CGFloat height = v36;
    v60.origin.CGFloat x = v26;
    v60.origin.CGFloat y = v28;
    v60.size.CGFloat width = v30;
    v60.size.CGFloat height = v32;
    CGRect v61 = CGRectUnion(v60, v63);
    self->__frame = CGRectInset(v61, 0.0, -self->__strokeWidth);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    [(PKDetectionItem *)self drawingToItemTransform];
    v37 = self->_itemSpaceBoundsPath;
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    [(UIBezierPath *)v37 applyTransform:v43];
    v38 = self->_itemSpaceBaselinePath;
    v42[0] = v44;
    v42[1] = v45;
    v42[2] = v46;
    [(UIBezierPath *)v38 applyTransform:v42];
    if (__p)
    {
      v48 = __p;
      operator delete(__p);
    }
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
}

- (UIBezierPath)itemSpaceBaselinePath
{
  itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
  if (!itemSpaceBaselinePath)
  {
    [(PKDetectionItem *)self _generatePaths];
    itemSpaceBaselinePath = self->_itemSpaceBaselinePath;
  }

  return itemSpaceBaselinePath;
}

- (UIBezierPath)itemSpaceBoundsPath
{
  itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
  if (!itemSpaceBoundsPath)
  {
    [(PKDetectionItem *)self _generatePaths];
    itemSpaceBoundsPath = self->_itemSpaceBoundsPath;
  }

  return itemSpaceBoundsPath;
}

- (CGRect)_frame
{
  if (CGRectIsNull(self->__frame)) {
    [(PKDetectionItem *)self _generatePaths];
  }
  double x = self->__frame.origin.x;
  double y = self->__frame.origin.y;
  double width = self->__frame.size.width;
  double height = self->__frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_strokeWidth
{
  double result = self->__strokeWidth;
  if (result == 0.0)
  {
    [(PKDetectionItem *)self _generatePaths];
    return self->__strokeWidth;
  }
  return result;
}

- (UIColor)strokeColor
{
  return 0;
}

- (id)image
{
  id v3 = [(PKDetectionItem *)self sessionManager];
  uint64_t v4 = -[PKRecognitionSessionManager drawing](v3);
  uint64_t v5 = (objc_class *)objc_opt_class();

  id v6 = [v5 alloc];
  uint64_t v7 = [(PKDetectionItem *)self _strokes];
  double v8 = [(PKDetectionItem *)self sessionManager];
  double v9 = -[PKRecognitionSessionManager drawing](v8);
  double v10 = (void *)[v6 initWithStrokes:v7 fromDrawing:v9];

  double v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];

  [(PKDetectionItem *)self _frame];
  double v12 = objc_msgSend(v10, "imageFromRect:scale:");

  return v12;
}

- (id)UUID
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_validCachedUUID)
  {
    id v3 = [(PKDetectionItem *)self _strokes];
    if ([v3 count])
    {
      cachedUUID = self->_cachedUUID;
      self->_cachedUUID = 0;

      self->_validCachedUUID = 1;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v5 = [(PKDetectionItem *)self queryItem];
      id v6 = [v5 strokeIdentifiers];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v6);
            }
            double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            double v11 = [(PKDetectionItem *)self drawing];
            double v12 = [v10 strokeUUID];
            double v13 = [v11 _visibleStrokeForIdentifier:v12];

            CGFloat v14 = [v13 _groupID];
            if (v14)
            {
              BOOL v15 = [v13 _shapeType] == 0;

              if (v15)
              {
                CGFloat v16 = [v13 _groupID];
                CGFloat v17 = self->_cachedUUID;
                self->_cachedUUID = v16;

                goto LABEL_14;
              }
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  v18 = self->_cachedUUID;

  return v18;
}

- (id)setUUID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PKDetectionItem *)self UUID];
  uint64_t v7 = (void *)v6;
  if (self->_validCachedUUID && ((id)v6 == v5 || ([v5 isEqual:v6] & 1) != 0))
  {
    uint64_t v8 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedUUID, a3);
    self->_validCachedUUID = 1;
    double v9 = [(PKDetectionItem *)self _actionNameForActivation:v5 != 0];
    double v10 = [(PKDetectionItem *)self _strokes];
    double v11 = [(PKDetectionItem *)self drawing];
    double v12 = +[PKModifyStrokesGroupIDCommand commandForModifyingStrokes:v10 drawing:v11 groupID:v5 actionName:v9];

    double v13 = [(PKDetectionItem *)self drawing];
    [v12 applyToDrawing:v13];

    CGFloat v14 = [(PKDetectionItem *)self drawing];
    uint64_t v8 = [v12 invertedInDrawing:v14];
  }

  return v8;
}

- (id)_actionNameForActivation:(BOOL)a3
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKDrawing)drawing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawing);

  return (PKDrawing *)WeakRetained;
}

- (void)setDrawing:(id)a3
{
}

- (void)setItemSpaceBaselinePath:(id)a3
{
}

- (void)setItemSpaceBoundsPath:(id)a3
{
}

- (UIBezierPath)drawingSpaceBoundsPath
{
  return self->_drawingSpaceBoundsPath;
}

- (PKDetectionQueryItem)queryItem
{
  return self->_queryItem;
}

- (void)setQueryItem:(id)a3
{
}

- (void)set_frame:(CGRect)a3
{
  self->__frame = a3;
}

- (CGRect)strokeBounds
{
  double x = self->_strokeBounds.origin.x;
  double y = self->_strokeBounds.origin.y;
  double width = self->_strokeBounds.size.width;
  double height = self->_strokeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStrokeBounds:(CGRect)a3
{
  self->_strokeBounds = a3;
}

- (void)set_strokeWidth:(double)a3
{
  self->__double strokeWidth = a3;
}

- (UIColor)inkColor
{
  return self->_inkColor;
}

- (void)setInkColor:(id)a3
{
}

- (PKRecognitionSessionManager)sessionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionManager);

  return (PKRecognitionSessionManager *)WeakRetained;
}

- (void)setSessionManager:(id)a3
{
}

- (NSUUID)cachedUUID
{
  return self->_cachedUUID;
}

- (void)setCachedUUID:(id)a3
{
}

- (BOOL)validCachedUUID
{
  return self->_validCachedUUID;
}

- (void)setValidCachedUUID:(BOOL)a3
{
  self->_validCachedUUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedUUID, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
  objc_storeStrong((id *)&self->_inkColor, 0);
  objc_storeStrong((id *)&self->_queryItem, 0);
  objc_storeStrong((id *)&self->_drawingSpaceBoundsPath, 0);
  objc_storeStrong((id *)&self->_itemSpaceBoundsPath, 0);
  objc_storeStrong((id *)&self->_itemSpaceBaselinePath, 0);
  objc_destroyWeak((id *)&self->_drawing);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  objc_msgSend(a5, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v10, "_presentMenuAtLocation:");
}

@end