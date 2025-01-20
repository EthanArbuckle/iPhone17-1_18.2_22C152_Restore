@interface HGHeadGestureResult
- (HGHeadGestureResult)init;
- (NSDate)timestamp;
- (NSNumber)avgConfidence;
- (NSUUID)uuid;
- (unint64_t)headGesture;
- (unint64_t)headGesturePart;
- (void)setAvgConfidence:(id)a3;
- (void)setHeadGesture:(unint64_t)a3;
- (void)setHeadGesturePart:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation HGHeadGestureResult

- (HGHeadGestureResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)HGHeadGestureResult;
  v2 = [(HGHeadGestureResult *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(HGHeadGestureResult *)v2 setUuid:v3];
  }
  return v2;
}

- (unint64_t)headGesture
{
  return self->_headGesture;
}

- (void)setHeadGesture:(unint64_t)a3
{
  self->_headGesture = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)avgConfidence
{
  return self->_avgConfidence;
}

- (void)setAvgConfidence:(id)a3
{
}

- (unint64_t)headGesturePart
{
  return self->_headGesturePart;
}

- (void)setHeadGesturePart:(unint64_t)a3
{
  self->_headGesturePart = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_avgConfidence, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end