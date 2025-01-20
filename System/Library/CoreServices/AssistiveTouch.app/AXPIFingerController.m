@interface AXPIFingerController
- (CGPoint)hndAbsoluteCentroidForMultifingers:(CGPoint)a3;
- (CGPoint)hndCentroidForPinchChainMidPoint:(CGPoint)a3;
- (CGPoint)hndConvertPointToFingerContainerView:(CGPoint)a3;
- (CGPoint)hndMenuPointForFingerLayout;
- (CGPoint)hndStandardCentroidForMultifingers:(CGPoint)a3;
@end

@implementation AXPIFingerController

- (CGPoint)hndConvertPointToFingerContainerView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(AXPIFingerController *)self fingerContainerView];
  v6 = [v5 window];
  v7 = [v6 layer];
  objc_msgSend(v7, "convertPoint:fromLayer:", 0, x, y);
  double v9 = v8;
  double v11 = v10;

  v12 = [v5 window];
  objc_msgSend(v12, "convertPoint:toView:", v5, v9, v11);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)hndStandardCentroidForMultifingers:(CGPoint)a3
{
  -[AXPIFingerController hndConvertPointToFingerContainerView:](self, "hndConvertPointToFingerContainerView:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(AXPIFingerController *)self fingerModels];
  double v9 = (char *)[v8 count];

  if ((unint64_t)(v9 - 3) < 2)
  {
    v22 = [(AXPIFingerController *)self fingerModels];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 location];
    double v25 = v24;
    double v27 = v26;

    v28 = [(AXPIFingerController *)self fingerModels];
    v29 = [v28 objectAtIndexedSubscript:1];
    [v29 location];
    double v31 = v30;
    double v33 = v32;

    double v5 = v5 - (v31 - v25);
    double v20 = v7 - (v33 - v27);
    double v21 = -60.0;
    goto LABEL_7;
  }
  if (v9 == (char *)5)
  {
    v34 = [(AXPIFingerController *)self fingerModels];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 location];
    double v37 = v36;
    double v39 = v38;

    v40 = [(AXPIFingerController *)self fingerModels];
    v41 = [v40 objectAtIndexedSubscript:3];
    [v41 location];
    double v43 = v42;
    double v45 = v44;

    double v5 = v5 - (v43 - v37);
    double v20 = v7 - (v45 - v39);
    double v21 = -15.0;
    goto LABEL_7;
  }
  if (v9 == (char *)2)
  {
    double v10 = [(AXPIFingerController *)self fingerModels];
    double v11 = [v10 objectAtIndexedSubscript:0];
    [v11 location];
    double v13 = v12;
    double v15 = v14;

    double v16 = [(AXPIFingerController *)self fingerModels];
    double v17 = [v16 objectAtIndexedSubscript:1];
    [v17 location];

    AX_CGPointGetMidpointToPoint();
    double v5 = v5 - (v18 - v13);
    double v20 = v7 - (v19 - v15);
    double v21 = -35.0;
LABEL_7:
    double v7 = v20 + v21;
  }
  double v46 = v5;
  double v47 = v7;
  result.double y = v47;
  result.double x = v46;
  return result;
}

- (CGPoint)hndAbsoluteCentroidForMultifingers:(CGPoint)a3
{
  -[AXPIFingerController hndConvertPointToFingerContainerView:](self, "hndConvertPointToFingerContainerView:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(AXPIFingerController *)self fingerModels];
  id v9 = [v8 count];

  if (v9)
  {
    [(AXPIFingerController *)self midpointForFingers];
    double v11 = v10;
    double v13 = v12;
    double v14 = [(AXPIFingerController *)self fingerModels];
    double v15 = [v14 objectAtIndexedSubscript:0];
    [v15 location];
    double v17 = v16;
    double v19 = v18;

    double v5 = v5 - (v11 - v17);
    double v7 = v7 - (v13 - v19);
  }
  double v20 = v5;
  double v21 = v7;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)hndCentroidForPinchChainMidPoint:(CGPoint)a3
{
  -[AXPIFingerController hndConvertPointToFingerContainerView:](self, "hndConvertPointToFingerContainerView:", a3.x, a3.y);
  double v6 = v5;
  double v8 = v7;
  id v9 = [(AXPIFingerController *)self fingerModels];
  id v10 = [v9 count];

  if (v10 != (id)2)
  {
    double v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"AXPIFingerController+HNDAdditions.m" lineNumber:108 description:@"Should have had two fingers when asking for pinch centroid."];
  }
  double v11 = [(AXPIFingerController *)self fingerModels];
  double v12 = [v11 objectAtIndexedSubscript:0];
  [v12 location];
  double v14 = v13;
  double v16 = v15;

  double v17 = [(AXPIFingerController *)self fingerModels];
  double v18 = [v17 objectAtIndexedSubscript:0];
  [v18 location];
  double v19 = [(AXPIFingerController *)self fingerModels];
  double v20 = [v19 objectAtIndexedSubscript:1];
  [v20 location];
  AX_CGPointGetMidpointToPoint();
  double v22 = v21;
  double v24 = v23;

  double v25 = v6 - (v22 - v14);
  double v26 = v8 - (v24 - v16);
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGPoint)hndMenuPointForFingerLayout
{
  v3 = [(AXPIFingerController *)self fingerModels];
  id v4 = [v3 count];

  switch((unint64_t)v4)
  {
    case 1uLL:
      double v5 = [(AXPIFingerController *)self fingerModels];
      double v6 = v5;
      uint64_t v7 = 0;
      goto LABEL_5;
    case 2uLL:
      double v13 = [(AXPIFingerController *)self fingerModels];
      double v14 = [v13 objectAtIndexedSubscript:0];
      [v14 location];

      double v15 = [(AXPIFingerController *)self fingerModels];
      double v16 = v15;
      uint64_t v17 = 1;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      double v5 = [(AXPIFingerController *)self fingerModels];
      double v6 = v5;
      uint64_t v7 = 1;
LABEL_5:
      id v10 = [v5 objectAtIndexedSubscript:v7];
      [v10 location];
      CGFloat x = v11;
      CGFloat y = v12;

      break;
    case 5uLL:
      double v18 = [(AXPIFingerController *)self fingerModels];
      double v19 = [v18 objectAtIndexedSubscript:0];
      [v19 location];

      double v15 = [(AXPIFingerController *)self fingerModels];
      double v16 = v15;
      uint64_t v17 = 3;
LABEL_8:
      double v20 = [v15 objectAtIndexedSubscript:v17];
      [v20 location];

      AX_CGPointGetMidpointToPoint();
      CGFloat x = v21;
      CGFloat y = v22;
      break;
    default:
      CGFloat x = CGPointZero.x;
      CGFloat y = CGPointZero.y;
      break;
  }
  double v23 = x;
  double v24 = y;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

@end