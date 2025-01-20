@interface HFAnalyticsCameraTimelinePinchToZoomEvent
- (BOOL)didPinchToZoom;
- (HFAnalyticsCameraTimelinePinchToZoomEvent)initWithData:(id)a3;
- (id)payload;
- (unint64_t)pinchToZoomCount;
- (void)setDidPinchToZoom:(BOOL)a3;
- (void)setPinchToZoomCount:(unint64_t)a3;
@end

@implementation HFAnalyticsCameraTimelinePinchToZoomEvent

- (HFAnalyticsCameraTimelinePinchToZoomEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"didPinchToZoom"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorHfanalyti_4.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"pinchToZoomCount"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }

  if (!v9) {
    NSLog(&cfstr_ErrorHfanalyti_5.isa);
  }
  v12.receiver = self;
  v12.super_class = (Class)HFAnalyticsCameraTimelinePinchToZoomEvent;
  v10 = [(HFAnalyticsEvent *)&v12 initWithEventType:57];
  if (v10)
  {
    v10->_didPinchToZoom = [v7 BOOLValue];
    v10->_pinchToZoomCount = [v7 unsignedIntValue];
  }

  return v10;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsCameraTimelinePinchToZoomEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsCameraTimelinePinchToZoomEvent didPinchToZoom](self, "didPinchToZoom"));
  [v4 setObject:v5 forKeyedSubscript:@"didPinchToZoom"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsCameraTimelinePinchToZoomEvent pinchToZoomCount](self, "pinchToZoomCount"));
  [v4 setObject:v6 forKeyedSubscript:@"pinchToZoomCount"];

  return v4;
}

- (BOOL)didPinchToZoom
{
  return self->_didPinchToZoom;
}

- (void)setDidPinchToZoom:(BOOL)a3
{
  self->_didPinchToZoom = a3;
}

- (unint64_t)pinchToZoomCount
{
  return self->_pinchToZoomCount;
}

- (void)setPinchToZoomCount:(unint64_t)a3
{
  self->_pinchToZoomCount = a3;
}

@end