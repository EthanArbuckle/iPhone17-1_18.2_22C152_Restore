@interface DRContentWindow
+ (BOOL)_isSecure;
- (DRContentWindow)initWithWindowScene:(id)a3;
- (NSMutableDictionary)activeSessionViewModelsForTouchID;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setActiveSessionViewModelsForTouchID:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DRContentWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (DRContentWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DRContentWindow;
  v3 = [(DRContentWindow *)&v7 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(DRContentWindow *)v3 setMultipleTouchEnabled:1];
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(DRContentWindow *)v4 setActiveSessionViewModelsForTouchID:v5];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  objc_super v7 = [(DRContentWindow *)self rootViewController];
  v8 = objc_msgSend(v7, "sessionViewModelForBeginningDragManipulationAtLocation:", x, y);
  if (v8) {
    v9 = self;
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DRContentWindow;
  [(DRContentWindow *)&v27 touchesBegan:v6 withEvent:a4];
  objc_super v7 = [(DRContentWindow *)self rootViewController];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = v6;
  v8 = [v6 objectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v13 locationInView:self];
        double v15 = v14;
        double v17 = v16;
        v18 = objc_msgSend(v7, "sessionViewModelForBeginningDragManipulationAtLocation:");
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "beginDragManipulationWithLocation:", v15, v17, 0.0);
          v20 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
          v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 _touchIdentifier]);
          [v20 setObject:v19 forKey:v21];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DRContentWindow;
  [(DRContentWindow *)&v21 touchesMoved:v6 withEvent:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v16 = v6;
  objc_super v7 = [v6 objectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        v13 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
        double v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 _touchIdentifier]);
        double v15 = [v13 objectForKey:v14];

        if (v15)
        {
          [v12 locationInView:self];
          objc_msgSend(v15, "updateDragManipulationWithLocation:");
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DRContentWindow;
  [(DRContentWindow *)&v23 touchesEnded:v6 withEvent:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = v6;
  objc_super v7 = [v6 objectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
        v13 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
        double v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 _touchIdentifier]);
        double v15 = [v13 objectForKey:v14];

        if (v15)
        {
          [v12 locationInView:self];
          objc_msgSend(v15, "endDragManipulationWithLocation:");
          double v16 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
          long long v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 _touchIdentifier]);
          [v16 removeObjectForKey:v17];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DRContentWindow;
  [(DRContentWindow *)&v23 touchesCancelled:v6 withEvent:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = v6;
  objc_super v7 = [v6 objectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
        v13 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
        double v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 _touchIdentifier]);
        double v15 = [v13 objectForKey:v14];

        if (v15)
        {
          [v12 locationInView:self];
          objc_msgSend(v15, "endDragManipulationWithLocation:");
          double v16 = [(DRContentWindow *)self activeSessionViewModelsForTouchID];
          long long v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 _touchIdentifier]);
          [v16 removeObjectForKey:v17];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }
}

- (NSMutableDictionary)activeSessionViewModelsForTouchID
{
  return self->_activeSessionViewModelsForTouchID;
}

- (void)setActiveSessionViewModelsForTouchID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end