@interface HKGraphSeriesOverlayData
- (CGAffineTransform)graphSeriesPointTransform;
- (CGRect)graphSeriesScreenRect;
- (HKGraphSeries)graphSeries;
- (HKGraphSeriesBlockCoordinateList)graphSeriesCoordinates;
- (HKGraphSeriesOverlayData)initWithGraphSeries:(id)a3 graphSeriesScreenRect:(CGRect)a4 graphSeriesCoordinates:(id)a5 graphSeriesPointTransform:(CGAffineTransform *)a6;
@end

@implementation HKGraphSeriesOverlayData

- (HKGraphSeriesOverlayData)initWithGraphSeries:(id)a3 graphSeriesScreenRect:(CGRect)a4 graphSeriesCoordinates:(id)a5 graphSeriesPointTransform:(CGAffineTransform *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKGraphSeriesOverlayData;
  v16 = [(HKGraphSeriesOverlayData *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_graphSeries, a3);
    v17->_graphSeriesScreenRect.origin.CGFloat x = x;
    v17->_graphSeriesScreenRect.origin.CGFloat y = y;
    v17->_graphSeriesScreenRect.size.CGFloat width = width;
    v17->_graphSeriesScreenRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v17->_graphSeriesCoordinates, a5);
    long long v18 = *(_OWORD *)&a6->a;
    long long v19 = *(_OWORD *)&a6->c;
    *(_OWORD *)&v17->_graphSeriesPointTransform.tCGFloat x = *(_OWORD *)&a6->tx;
    *(_OWORD *)&v17->_graphSeriesPointTransform.c = v19;
    *(_OWORD *)&v17->_graphSeriesPointTransform.a = v18;
  }

  return v17;
}

- (HKGraphSeries)graphSeries
{
  return self->_graphSeries;
}

- (CGRect)graphSeriesScreenRect
{
  double x = self->_graphSeriesScreenRect.origin.x;
  double y = self->_graphSeriesScreenRect.origin.y;
  double width = self->_graphSeriesScreenRect.size.width;
  double height = self->_graphSeriesScreenRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (HKGraphSeriesBlockCoordinateList)graphSeriesCoordinates
{
  return self->_graphSeriesCoordinates;
}

- (CGAffineTransform)graphSeriesPointTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphSeriesCoordinates, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end