@interface PKStrokeSelection
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 drawingClass:(Class)a5 error:(id *)a6;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)strokeSelectionFromData:(id)a3;
+ (id)strokeSelectionFromData:(id)a3 forDrawingClass:(Class)a4;
- (BOOL)containsBitmapData;
- (CGRect)bounds;
- (CGRect)boundsWithoutLasso;
- (CGRect)externalElementsBounds;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSItemProvider)externalElementsItemProvider;
- (NSOrderedSet)externalElements;
- (NSOrderedSet)strokes;
- (NSSet)strokeIdentifiers;
- (NSString)description;
- (PKDrawing)drawing;
- (PKStroke)lassoStroke;
- (PKStrokeSelection)initWithStrokes:(id)a3 externalElements:(id)a4 lassoStroke:(id)a5 drawing:(id)a6;
- (PKStrokeSelection)initWithStrokes:(id)a3 lassoStroke:(id)a4 drawing:(id)a5;
- (PKStrokeSelectionImage)strokeImage;
- (PKStrokeSelectionImage)strokeImageWithHighlight;
- (id)_newDrawingWithStrokes;
- (id)imageDataForSelection;
- (id)legacyStrokeDataForSelection;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)strokeDataForSelection;
- (int64_t)requiredContentVersion;
- (void)generateImageWithConfig:(id)a3 fullSizeConfig:(id)a4 selectionInteraction:(id)a5 withCompletion:(id)a6;
- (void)newExternalElementsCGImageFromCGImage:(CGImage *)a3 withConfig:(id)a4 selectionInteraction:(id)a5 renderImage:(BOOL)a6 withCompletion:(id)a7;
- (void)setExternalElements:(id)a3;
- (void)setExternalElementsItemProvider:(id)a3;
- (void)setStrokeImage:(id)a3;
- (void)setStrokeImageWithHighlight:(id)a3;
@end

@implementation PKStrokeSelection

- (PKStrokeSelection)initWithStrokes:(id)a3 lassoStroke:(id)a4 drawing:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKStrokeSelection;
  v11 = [(PKStrokeSelection *)&v27 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    strokes = v11->_strokes;
    v11->_strokes = (NSOrderedSet *)v12;

    objc_storeStrong((id *)&v11->_lassoStroke, a4);
    objc_storeStrong((id *)&v11->_drawing, a5);
    v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v15 = v11->_strokes;
    uint64_t v16 = [(NSOrderedSet *)v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v19), "_strokeUUID", (void)v23);
          [(NSSet *)v14 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSOrderedSet *)v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v17);
    }

    strokeIdentifiers = v11->_strokeIdentifiers;
    v11->_strokeIdentifiers = v14;
  }
  return v11;
}

- (PKStrokeSelection)initWithStrokes:(id)a3 externalElements:(id)a4 lassoStroke:(id)a5 drawing:(id)a6
{
  id v10 = a4;
  v11 = [(PKStrokeSelection *)self initWithStrokes:a3 lassoStroke:a5 drawing:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    externalElements = v11->_externalElements;
    v11->_externalElements = (NSOrderedSet *)v12;
  }
  return v11;
}

- (int64_t)requiredContentVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_strokes;
  uint64_t v3 = [(NSOrderedSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    int64_t v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "requiredContentVersion", (void)v10);
      if (v6 <= v8) {
        int64_t v6 = v8;
      }
      if (v6 == 3) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [(NSOrderedSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (CGRect)bounds
{
  [(PKStrokeSelection *)self boundsWithoutLasso];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  lassoStroke = self->_lassoStroke;
  if (lassoStroke)
  {
    [(PKStroke *)lassoStroke _bounds];
    v23.origin.CGFloat x = v12;
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v15;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectUnion(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)boundsWithoutLasso
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v7 = self->_strokes;
  uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "_bounds", (void)v20);
        v30.origin.CGFloat x = v12;
        v30.origin.CGFloat y = v13;
        v30.size.CGFloat width = v14;
        v30.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v30);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(PKStrokeSelection *)self externalElementsBounds];
  v31.origin.CGFloat x = v16;
  v31.origin.CGFloat y = v17;
  v31.size.CGFloat width = v18;
  v31.size.CGFloat height = v19;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  return CGRectUnion(v28, v31);
}

- (CGRect)externalElementsBounds
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int64_t v6 = self->_externalElements;
  uint64_t v7 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "boundingBox", (void)v19);
        v28.origin.CGFloat x = v11;
        v28.origin.CGFloat y = v12;
        v28.size.CGFloat width = v13;
        v28.size.CGFloat height = v14;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.drawing";
  v4[1] = @"com.apple.pencilkit.strokes";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[PKStrokeSelection objectWithItemProviderData:v8 typeIdentifier:v7 drawingClass:objc_opt_class() error:a5];

  return v9;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 drawingClass:(Class)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (([v9 isEqual:@"com.apple.pencilkit.strokes"] & 1) != 0
    || [v9 isEqual:@"com.apple.drawing"])
  {
    uint64_t v10 = +[PKStrokeSelection strokeSelectionFromData:v8 forDrawingClass:a5];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"com.apple.drawing"];
  double v3 = [MEMORY[0x1E4FB1818] writableTypeIdentifiersForItemProvider];
  [v2 addObjectsFromArray:v3];

  uint64_t v4 = [(id)*MEMORY[0x1E4F44510] identifier];
  [v2 addObject:v4];

  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObject:@"com.apple.drawing"];
  if (![(PKStrokeSelection *)self containsBitmapData]) {
    [v3 addObject:@"com.apple.pencilkit.strokes"];
  }
  uint64_t v4 = [MEMORY[0x1E4FB1818] writableTypeIdentifiersForItemProvider];
  [v3 addObjectsFromArray:v4];

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isEqual:@"com.apple.drawing"])
  {
    uint64_t v8 = [(PKStrokeSelection *)self strokeDataForSelection];
LABEL_11:
    double v17 = (void *)v8;
    v7[2](v7, v8, 0);
LABEL_12:

    goto LABEL_13;
  }
  if ([v6 isEqual:@"com.apple.pencilkit.strokes"]
    && ![(PKStrokeSelection *)self containsBitmapData])
  {
    uint64_t v8 = [(PKStrokeSelection *)self legacyStrokeDataForSelection];
    goto LABEL_11;
  }
  id v9 = [MEMORY[0x1E4FB1818] readableTypeIdentifiersForItemProvider];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    strokeImage = self->_strokeImage;
    if (strokeImage)
    {
      uint64_t v12 = [(PKStrokeSelectionImage *)strokeImage fullSizeConfig];
      if (v12)
      {
        CGFloat v13 = (void *)v12;
        CGFloat v14 = [(PKStrokeSelectionImage *)self->_strokeImage fullSizeConfig];
        double v15 = [(PKStrokeSelectionImage *)self->_strokeImage config];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          long long v20 = [(PKStrokeSelectionImage *)self->_strokeImage fullSizeConfig];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __81__PKStrokeSelection_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
          v21[3] = &unk_1E64C7DD0;
          id v22 = v6;
          long long v23 = v7;
          [(PKStrokeSelection *)self generateImageWithConfig:v20 fullSizeConfig:0 selectionInteraction:0 withCompletion:v21];

          goto LABEL_13;
        }
      }
      double v17 = [(PKStrokeSelectionImage *)self->_strokeImage combinedImage];
      id v18 = (id)[v17 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
      goto LABEL_12;
    }
  }
LABEL_13:

  return 0;
}

void __81__PKStrokeSelection_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 combinedImage];
  id v3 = (id)[v4 loadDataWithTypeIdentifier:*(void *)(a1 + 32) forItemProviderCompletionHandler:*(void *)(a1 + 40)];
}

- (id)imageDataForSelection
{
  v2 = [(PKStrokeSelectionImage *)self->_strokeImage combinedImage];
  id v3 = UIImagePNGRepresentation(v2);

  return v3;
}

- (id)_newDrawingWithStrokes
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(NSOrderedSet *)self->_strokes array];
  double v5 = (void *)[v3 initWithStrokes:v4 fromDrawing:self->_drawing];

  if (self->_lassoStroke)
  {
    id v6 = objc_msgSend(v5, "_addStroke:");
    id v7 = (id)[v5 setStroke:v6 hidden:0];
  }
  return v5;
}

- (id)legacyStrokeDataForSelection
{
  if (self->_strokes && self->_drawing)
  {
    id v2 = [(PKStrokeSelection *)self _newDrawingWithStrokes];
    id v3 = [v2 serializeWithVersion:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)strokeDataForSelection
{
  if (self->_strokes && self->_drawing)
  {
    id v2 = [(PKStrokeSelection *)self _newDrawingWithStrokes];
    id v3 = [v2 serializeTransiently];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)strokeSelectionFromData:(id)a3
{
  id v4 = a3;
  double v5 = [a1 strokeSelectionFromData:v4 forDrawingClass:objc_opt_class()];

  return v5;
}

+ (id)strokeSelectionFromData:(id)a3 forDrawingClass:(Class)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)[[a4 alloc] initWithData:v5 loadNonInkingStrokes:1 error:0];
    id v7 = (void *)MEMORY[0x1E4F1CA70];
    uint64_t v8 = [v6 strokes];
    long long v23 = [v7 orderedSetWithArray:v8];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v24 = v6;
    id v9 = [v6 _rootStrokes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        CGFloat v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
        double v15 = objc_msgSend(v14, "ink", v23);
        char v16 = [v15 identifier];
        char v17 = [v16 isEqual:@"com.apple.ink.lasso"];

        if (v17) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v18 = v14;

      if (!v18) {
        goto LABEL_14;
      }
      long long v19 = v23;
      long long v20 = v24;
      if ([v23 containsObject:v18]) {
        [v23 removeObject:v18];
      }
    }
    else
    {
LABEL_10:

      id v18 = 0;
LABEL_14:
      long long v19 = v23;
      long long v20 = v24;
    }
    long long v21 = [[PKStrokeSelection alloc] initWithStrokes:v19 lassoStroke:v18 drawing:0];
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (BOOL)containsBitmapData
{
  id v2 = [(PKStrokeSelection *)self _newDrawingWithStrokes];
  BOOL v3 = [v2 _minimumSerializationVersion] > 1;

  return v3;
}

- (void)newExternalElementsCGImageFromCGImage:(CGImage *)a3 withConfig:(id)a4 selectionInteraction:(id)a5 renderImage:(BOOL)a6 withCompletion:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  CGFloat v14 = (void (**)(id, void))a7;
  if (!a3) {
    goto LABEL_13;
  }
  double v15 = [(PKStrokeSelection *)self externalElements];
  if (![v15 count])
  {

    goto LABEL_13;
  }
  char v16 = [v13 delegate];
  char v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0)
  {
LABEL_13:
    v14[2](v14, 0);
    goto LABEL_14;
  }
  BOOL v28 = a6;
  uint64_t v27 = CGBitmapContextCreateForFlatteningImage();
  id v18 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v19 = [(PKStrokeSelection *)self externalElements];
  long long v20 = [v19 reversedOrderedSet];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = [*(id *)(*((void *)&v34 + 1) + 8 * v24) identifier];
        [v18 addObject:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  long long v26 = [v13 delegate];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__PKStrokeSelection_newExternalElementsCGImageFromCGImage_withConfig_selectionInteraction_renderImage_withCompletion___block_invoke;
  v29[3] = &unk_1E64C7DF8;
  BOOL v33 = v28;
  CGRect v31 = a3;
  uint64_t v32 = v27;
  uint64_t v30 = v14;
  [v26 selectionInteraction:v13 renderPreviewForElements:v18 inContext:v27 withConfig:v12 inAttachment:0 withCompletion:v29];

LABEL_14:
}

uint64_t __118__PKStrokeSelection_newExternalElementsCGImageFromCGImage_withConfig_selectionInteraction_renderImage_withCompletion___block_invoke(uint64_t a1)
{
  double Width = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 40));
  double Height = (double)CGImageGetHeight(*(CGImageRef *)(a1 + 40));
  if (*(unsigned char *)(a1 + 56))
  {
    v7.origin.CGFloat x = 0.0;
    v7.origin.CGFloat y = 0.0;
    v7.size.CGFloat width = Width;
    v7.size.CGFloat height = Height;
    CGContextDrawImage(*(CGContextRef *)(a1 + 48), v7, *(CGImageRef *)(a1 + 40));
  }
  v8.origin.CGFloat x = 0.0;
  v8.origin.CGFloat y = 0.0;
  v8.size.CGFloat width = Width;
  v8.size.CGFloat height = Height;
  CGContextClipToRect(*(CGContextRef *)(a1 + 48), v8);
  CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 48));
  CGContextRelease(*(CGContextRef *)(a1 + 48));
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)generateImageWithConfig:(id)a3 fullSizeConfig:(id)a4 selectionInteraction:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 sixChannel];
  double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__13;
  v61 = __Block_byref_object_dispose__13;
  char v16 = [PKImageRenderer alloc];
  [v10 imageSize];
  v62 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:](v16, "initWithSize:scale:renderQueue:sixChannelBlending:", 0, v14);
  uint64_t v17 = [v10 invertedColors];
  [(id)v58[5] setInvertColors:v17];
  id v18 = (void *)v58[5];
  [(PKStrokeSelection *)self strokes];
  if (v14) {
    long long v19 = {;
  }
    long long v20 = [v19 array];
    [v10 strokeBounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v10 scale];
    double v30 = v29;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke;
    v50[3] = &unk_1E64C7E48;
    id v51 = v10;
    id v52 = v11;
    v53 = self;
    id v54 = v12;
    v56 = &v57;
    id v55 = v13;
    objc_msgSend(v18, "sixChannelCGRenderStrokes:clippedToStrokeSpaceRect:scale:completion:", v20, v50, v22, v24, v26, v28, v30);

    CGRect v31 = v51;
  }
  else {
    uint64_t v32 = {;
  }
    BOOL v33 = [v32 array];
    [v10 strokeBounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    [v10 scale];
    double v43 = v42;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_3;
    v44[3] = &unk_1E64C7E98;
    v44[4] = self;
    id v45 = v10;
    id v46 = v12;
    v49 = &v57;
    id v48 = v13;
    id v47 = v11;
    objc_msgSend(v18, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v33, v44, v35, v37, v39, v41, v43);

    CGRect v31 = v45;
  }

  _Block_object_dispose(&v57, 8);
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [[PKStrokeSelectionImage alloc] initWithImage:0 config:*(void *)(a1 + 32) fullSizeConfig:*(void *)(a1 + 40)];
  if (a2)
  {
    CGRect v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
    [(PKStrokeSelectionImage *)v6 setAddImage:v7];
  }
  if (a3)
  {
    CGRect v8 = [MEMORY[0x1E4FB1818] imageWithCGImage:a3];
    [(PKStrokeSelectionImage *)v6 setMulImage:v8];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_2;
  v15[3] = &unk_1E64C7E20;
  char v16 = v6;
  long long v14 = *(_OWORD *)(a1 + 64);
  id v12 = (id)v14;
  long long v17 = v14;
  id v13 = v6;
  [v10 newExternalElementsCGImageFromCGImage:a2 withConfig:v9 selectionInteraction:v11 renderImage:0 withCompletion:v15];
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_2(uint64_t a1, CGImage *a2)
{
  if (a2)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scale];
    id v5 = objc_msgSend(v4, "imageWithCGImage:scale:orientation:", a2, 0);
    [*(id *)(a1 + 32) setImage:v5];

    CGImageRelease(a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  CGRect v7 = *(void **)(v6 + 40);
  if (v7)
  {
    *(void *)(v6 + 40) = 0;
  }
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_4;
  v7[3] = &unk_1E64C7E70;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = a2;
  id v8 = v4;
  id v10 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  [v5 newExternalElementsCGImageFromCGImage:a2 withConfig:v8 selectionInteraction:v6 renderImage:1 withCompletion:v7];
}

void __96__PKStrokeSelection_generateImageWithConfig_fullSizeConfig_selectionInteraction_withCompletion___block_invoke_4(uint64_t a1, CGImage *a2)
{
  BOOL v3 = *(CGImage **)(a1 + 64);
  if (a2)
  {
    CGImageRelease(*(CGImageRef *)(a1 + 64));
    BOOL v3 = a2;
LABEL_4:
    id v5 = (void *)MEMORY[0x1E4FB1818];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) scale];
    objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v3, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v3) {
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_5:
  if ([*(id *)(a1 + 32) rotated])
  {
    uint64_t v6 = objc_msgSend(v9, "pk_imageRotated90DegreesClockwise:", 0);

    id v9 = (id)v6;
  }
  CGImageRelease(v3);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [[PKStrokeSelectionImage alloc] initWithImage:v9 config:*(void *)(a1 + 32) fullSizeConfig:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, PKStrokeSelectionImage *))(v7 + 16))(v7, v8);
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = [(PKStrokeSelection *)self strokeIdentifiers];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(PKStrokeSelection *)self externalElements];
  uint64_t v7 = [v3 stringWithFormat:@"<PKStrokeSelection: %p %ld strokes, %ld elements>", self, v5, objc_msgSend(v6, "count")];

  return (NSString *)v7;
}

- (NSOrderedSet)strokes
{
  return self->_strokes;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (PKStroke)lassoStroke
{
  return self->_lassoStroke;
}

- (PKStrokeSelectionImage)strokeImage
{
  return self->_strokeImage;
}

- (void)setStrokeImage:(id)a3
{
}

- (PKStrokeSelectionImage)strokeImageWithHighlight
{
  return self->_strokeImageWithHighlight;
}

- (void)setStrokeImageWithHighlight:(id)a3
{
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (NSOrderedSet)externalElements
{
  return self->_externalElements;
}

- (void)setExternalElements:(id)a3
{
}

- (NSItemProvider)externalElementsItemProvider
{
  return self->_externalElementsItemProvider;
}

- (void)setExternalElementsItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalElementsItemProvider, 0);
  objc_storeStrong((id *)&self->_externalElements, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokeImageWithHighlight, 0);
  objc_storeStrong((id *)&self->_strokeImage, 0);
  objc_storeStrong((id *)&self->_lassoStroke, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end