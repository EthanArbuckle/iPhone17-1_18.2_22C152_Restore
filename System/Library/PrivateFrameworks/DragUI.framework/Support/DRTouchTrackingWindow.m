@interface DRTouchTrackingWindow
+ (BOOL)_isSecure;
- (BOOL)canBecomeKeyWindow;
- (BOOL)tracksTouches;
- (DRTouchTrackingWindow)initWithWindowScene:(id)a3;
- (DRTouchTrackingWindowDelegate)trackingDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTrackingDelegate:(id)a3;
- (void)setTracksTouches:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DRTouchTrackingWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (DRTouchTrackingWindow)initWithWindowScene:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DRTouchTrackingWindow;
  v3 = [(DRTouchTrackingWindow *)&v9 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(DRTouchTrackingWindow *)v3 setMultipleTouchEnabled:1];
    v4->_tracksTouches = 1;
    uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
    velocityIntegratorsByTouch = v4->_velocityIntegratorsByTouch;
    v4->_velocityIntegratorsByTouch = (NSMapTable *)v5;

    v7 = [(DRTouchTrackingWindow *)v4 _bindingLayer];
    [v7 setAllowsHitTesting:0];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DRTouchTrackingWindow;
  -[DRTouchTrackingWindow hitTest:withEvent:](&v12, "hitTest:withEvent:", v7, x, y);
  v8 = (DRTouchTrackingWindow *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = self;
    objc_super v9 = DRLogTarget();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v18.double x = x;
      v18.double y = y;
      v10 = NSStringFromCGPoint(v18);
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "hitTest %@ withEvent:%@ failed to return a view. Falling back.", buf, 0x16u);
    }
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (self->_tracksTouches)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_super v12 = objc_opt_new();
          [v12 setMinimumRequiredMovement:0.0];
          [v12 setHysteresisTimeInterval:0.3];
          [(NSMapTable *)self->_velocityIntegratorsByTouch setObject:v12 forKey:v11];
          [v11 locationInView:self];
          objc_msgSend(v12, "addSample:");
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    v13 = [(DRTouchTrackingWindow *)self trackingDelegate];
    [v13 touchTrackingWindow:self touchesBegan:v6];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v12 = [(NSMapTable *)self->_velocityIntegratorsByTouch objectForKey:v11];
        if (v12)
        {
          [v11 locationInView:self];
          objc_msgSend(v12, "addSample:");
          char v8 = 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
    if (v8)
    {
      v13 = [(DRTouchTrackingWindow *)self trackingDelegate];
      [v13 touchTrackingWindow:self touchesMoved:v5];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [(NSMapTable *)self->_velocityIntegratorsByTouch objectForKey:v12];
        if (v13)
        {
          [v12 locationInView:self];
          objc_msgSend(v13, "addSample:");
          long long v14 = objc_opt_new();
          [v14 setTouch:v12];
          [v13 velocity3D];
          v16[0] = v16[2];
          v16[1] = v16[3];
          [v14 setVelocity:v16];
          [v6 addObject:v14];
          [(NSMapTable *)self->_velocityIntegratorsByTouch removeObjectForKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    long long v15 = [(DRTouchTrackingWindow *)self trackingDelegate];
    [v15 touchTrackingWindow:self touchesEnded:v7 pairedWithVelocities:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v12 = [(NSMapTable *)self->_velocityIntegratorsByTouch objectForKey:v11];
        if (v12)
        {
          [(NSMapTable *)self->_velocityIntegratorsByTouch removeObjectForKey:v11];
          char v8 = 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
    if (v8)
    {
      v13 = [(DRTouchTrackingWindow *)self trackingDelegate];
      [v13 touchTrackingWindow:self touchesCancelled:v5];
    }
  }
}

- (BOOL)tracksTouches
{
  return self->_tracksTouches;
}

- (void)setTracksTouches:(BOOL)a3
{
  if (self->_tracksTouches != a3)
  {
    self->_tracksTouches = a3;
    if (!a3)
    {
      if ([(NSMapTable *)self->_velocityIntegratorsByTouch count])
      {
        v4 = +[NSMutableSet set];
        long long v10 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        id v5 = [(NSMapTable *)self->_velocityIntegratorsByTouch keyEnumerator];
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v11;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(v5);
              }
              [v4 addObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
              uint64_t v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          }
          while (v7);
        }

        [(DRTouchTrackingWindow *)self touchesCancelled:v4 withEvent:0];
      }
    }
  }
}

- (DRTouchTrackingWindowDelegate)trackingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingDelegate);
  return (DRTouchTrackingWindowDelegate *)WeakRetained;
}

- (void)setTrackingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingDelegate);
  objc_storeStrong((id *)&self->_velocityIntegratorsByTouch, 0);
}

@end