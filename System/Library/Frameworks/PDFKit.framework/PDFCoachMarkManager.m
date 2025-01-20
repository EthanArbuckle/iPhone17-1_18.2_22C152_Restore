@interface PDFCoachMarkManager
- (PDFCoachMarkManager)initWithPDFRenderingProperties:(id)a3;
- (id)_pageLayerForPage:(id)a3;
- (void)_cleanCoachMarks;
- (void)createCoachMarkForPage:(id)a3 atFrame:(CGRect)a4;
- (void)pageLayerDidAppear:(id)a3;
- (void)pageLayerWillRemove:(id)a3;
@end

@implementation PDFCoachMarkManager

- (PDFCoachMarkManager)initWithPDFRenderingProperties:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDFCoachMarkManager;
  v5 = [(PDFCoachMarkManager *)&v15 init];
  if (v5)
  {
    v6 = objc_alloc_init(PDFCoachMarkManagerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->renderingProperties, v4);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = v5->_private;
    coachMarks = v9->coachMarks;
    v9->coachMarks = v8;

    v11 = [[PDFTimer alloc] initWithThrottleDelay:sel__cleanCoachMarks forSelector:v5 forTarget:1.7];
    v12 = v5->_private;
    timer = v12->timer;
    v12->timer = v11;
  }
  return v5;
}

- (void)createCoachMarkForPage:(id)a3 atFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (!CGRectIsNull(v17))
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    if (!CGRectIsInfinite(v18))
    {
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      if (!CGRectIsEmpty(v19) && PDFRectValid(x, y, width, height))
      {
        v9 = -[PDFCoachMark initWithFrame:]([PDFCoachMark alloc], "initWithFrame:", x, y, width, height);
        [(PDFTimer *)self->_private->timer update];
        v10 = [(PDFCoachMarkManager *)self _pageLayerForPage:v15];
        if (v10)
        {
          [(PDFCoachMark *)v9 playEffect:v10];
        }
        else
        {
          v11 = [v15 document];
          uint64_t v12 = [v11 indexForPage:v15];

          coachMarks = self->_private->coachMarks;
          v14 = [NSNumber numberWithUnsignedInteger:v12];
          [(NSMutableDictionary *)coachMarks setObject:v9 forKey:v14];
        }
      }
    }
  }
}

- (void)pageLayerDidAppear:(id)a3
{
  id v14 = a3;
  id v4 = [v14 page];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 document];
    uint64_t v7 = [v6 indexForPage:v5];

    coachMarks = self->_private->coachMarks;
    v9 = [NSNumber numberWithUnsignedInteger:v7];
    v10 = [(NSMutableDictionary *)coachMarks objectForKey:v9];

    if (v10)
    {
      [v10 effectTimeLeft];
      if (v11 >= 0.0) {
        [v10 playEffect:v14];
      }
      uint64_t v12 = self->_private->coachMarks;
      v13 = [NSNumber numberWithUnsignedInteger:v7];
      [(NSMutableDictionary *)v12 removeObjectForKey:v13];
    }
  }
}

- (void)pageLayerWillRemove:(id)a3
{
  id v8 = [a3 page];
  id v4 = [v8 document];
  uint64_t v5 = [v4 indexForPage:v8];

  coachMarks = self->_private->coachMarks;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
  [(NSMutableDictionary *)coachMarks removeObjectForKey:v7];
}

- (void)_cleanCoachMarks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_private->coachMarks;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKey:](self->_private->coachMarks, "objectForKey:", v9, (void)v12);
        [v10 effectTimeLeft];
        if (v11 < 0.0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_private->coachMarks removeObjectsForKeys:v3];
}

- (id)_pageLayerForPage:(id)a3
{
  p_renderingProperties = &self->_private->renderingProperties;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_renderingProperties);
  uint64_t v6 = [v4 document];
  uint64_t v7 = [v6 indexForPage:v4];

  id v8 = [WeakRetained pdfView];
  uint64_t v9 = v8;
  if (v8)
  {
    v10 = [v8 pageViewForPageAtIndex:v7];
    double v11 = [v10 pageLayer];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end