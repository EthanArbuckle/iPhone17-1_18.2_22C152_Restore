@interface BNPanGestureProxyAction
+ (id)_infoFromPanGestureProxy:(id)a3 window:(id)a4;
- (BNPanGestureProxyAction)initWithPanGestureProxy:(id)a3 hostSideWindow:(id)a4;
- (BOOL)didCrossDefaultThreshold;
- (CGPoint)_convertPointInSceneReferenceSpace:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (CGPoint)translationInCoordinateSpace:(id)a3;
- (CGPoint)velocityInCoordinateSpace:(id)a3;
- (CGPoint)visualTranslationInCoordinateSpace:(id)a3;
- (UIWindow)serviceSideWindow;
- (id)actionHandler;
- (int64_t)state;
- (void)setServiceSideWindow:(id)a3;
@end

@implementation BNPanGestureProxyAction

- (BNPanGestureProxyAction)initWithPanGestureProxy:(id)a3 hostSideWindow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _infoFromPanGestureProxy:v7 window:v6];

  v11.receiver = self;
  v11.super_class = (Class)BNPanGestureProxyAction;
  v9 = [(BNPanGestureProxyAction *)&v11 initWithInfo:v8 responder:0];

  return v9;
}

- (int64_t)state
{
  v2 = [(BNPanGestureProxyAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)actionHandler
{
  return 0;
}

- (BOOL)didCrossDefaultThreshold
{
  v2 = [(BNPanGestureProxyAction *)self info];
  char v3 = [v2 BOOLForSetting:2];

  return v3;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(BNPanGestureProxyAction *)self info];
  id v6 = [v5 objectForSetting:3];
  [v6 CGPointValue];
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(BNPanGestureProxyAction *)self info];
  id v6 = [v5 objectForSetting:4];
  [v6 CGPointValue];
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(BNPanGestureProxyAction *)self info];
  id v6 = [v5 objectForSetting:5];
  [v6 CGPointValue];
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  char v3 = [(BNPanGestureProxyAction *)self info];
  id v4 = [v3 objectForSetting:6];
  [v4 CGPointValue];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)_infoFromPanGestureProxy:(id)a3 window:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  double v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "state"));
  [v8 setObject:v9 forSetting:1];

  objc_msgSend(v8, "setFlag:forSetting:", objc_msgSend(v7, "didCrossDefaultThreshold"), 2);
  double v10 = (void *)MEMORY[0x1E4F29238];
  [v7 locationInCoordinateSpace:v6];
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v32[0] = v11;
  v32[1] = v12;
  v13 = [v10 valueWithBytes:v32 objCType:"{CGPoint=dd}"];
  [v8 setObject:v13 forSetting:3];

  v14 = (void *)MEMORY[0x1E4F29238];
  [v7 translationInCoordinateSpace:v6];
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v31[0] = v15;
  v31[1] = v16;
  v17 = [v14 valueWithBytes:v31 objCType:"{CGPoint=dd}"];
  [v8 setObject:v17 forSetting:4];

  v18 = (void *)MEMORY[0x1E4F29238];
  [v7 visualTranslationInCoordinateSpace:v6];
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v30[0] = v19;
  v30[1] = v20;
  v21 = [v18 valueWithBytes:v30 objCType:"{CGPoint=dd}"];
  [v8 setObject:v21 forSetting:5];

  v22 = (void *)MEMORY[0x1E4F29238];
  [v7 velocityInCoordinateSpace:v6];
  uint64_t v24 = v23;
  uint64_t v26 = v25;

  v29[0] = v24;
  v29[1] = v26;
  v27 = [v22 valueWithBytes:v29 objCType:"{CGPoint=dd}"];
  [v8 setObject:v27 forSetting:6];

  return v8;
}

- (CGPoint)_convertPointInSceneReferenceSpace:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_serviceSideWindow = &self->_serviceSideWindow;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_serviceSideWindow);

  if (!WeakRetained)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"BNPanGestureProxyAction.m" lineNumber:77 description:@"service-side window hasn't been set"];
  }
  id v11 = objc_loadWeakRetained((id *)p_serviceSideWindow);
  objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
  double v13 = v12;
  double v15 = v14;

  id v16 = objc_loadWeakRetained((id *)p_serviceSideWindow);
  objc_msgSend(v16, "convertPoint:toCoordinateSpace:", v9, v13, v15);
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (UIWindow)serviceSideWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceSideWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setServiceSideWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end