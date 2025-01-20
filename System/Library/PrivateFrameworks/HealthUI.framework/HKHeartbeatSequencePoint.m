@interface HKHeartbeatSequencePoint
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKHeartbeatSequencePoint)initWithTimeInterval:(double)a3 beatsPerMinute:(double)a4;
- (NSNumber)xValue;
- (NSNumber)yValue;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)xValueAsGenericType;
- (id)yValueForKey:(id)a3;
@end

@implementation HKHeartbeatSequencePoint

- (HKHeartbeatSequencePoint)initWithTimeInterval:(double)a3 beatsPerMinute:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HKHeartbeatSequencePoint;
  v6 = [(HKHeartbeatSequencePoint *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithDouble:a3];
    xValue = v6->_xValue;
    v6->_xValue = (NSNumber *)v7;

    uint64_t v9 = [NSNumber numberWithDouble:a4];
    yValue = v6->_yValue;
    v6->_yValue = (NSNumber *)v9;
  }
  return v6;
}

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)allYValues
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_yValue;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end