@interface AVMobileFluidSliderMark
+ (id)interstitialMarkAtValue:(float)a3;
+ (id)liveEdgeMarkAtValue:(float)a3;
- (AVMobileFluidSliderMark)initWithStartValue:(float)a3 endValue:(float)a4 filledColor:(id)a5 unfilledColor:(id)a6 markWithType:(unint64_t)a7;
- (UIColor)filledColor;
- (UIColor)unfilledColor;
- (float)endValue;
- (float)startValue;
- (unint64_t)markType;
@end

@implementation AVMobileFluidSliderMark

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfilledColor, 0);

  objc_storeStrong((id *)&self->_filledColor, 0);
}

- (unint64_t)markType
{
  return self->_markType;
}

- (UIColor)unfilledColor
{
  return self->_unfilledColor;
}

- (UIColor)filledColor
{
  return self->_filledColor;
}

- (float)endValue
{
  return self->_endValue;
}

- (float)startValue
{
  return self->_startValue;
}

- (AVMobileFluidSliderMark)initWithStartValue:(float)a3 endValue:(float)a4 filledColor:(id)a5 unfilledColor:(id)a6 markWithType:(unint64_t)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AVMobileFluidSliderMark;
  v15 = [(AVMobileFluidSliderMark *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_startValue = a3;
    v15->_endValue = a4;
    objc_storeStrong((id *)&v15->_filledColor, a5);
    objc_storeStrong((id *)&v16->_unfilledColor, a6);
    v16->_markType = a7;
  }

  return v16;
}

+ (id)liveEdgeMarkAtValue:(float)a3
{
  v4 = [AVMobileFluidSliderMark alloc];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "avkit_liveContentAccessoryViewColor");
  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "avkit_liveContentAccessoryViewColor");
  *(float *)&double v7 = a3;
  *(float *)&double v8 = a3;
  v9 = [(AVMobileFluidSliderMark *)v4 initWithStartValue:v5 endValue:v6 filledColor:1 unfilledColor:v7 markWithType:v8];

  return v9;
}

+ (id)interstitialMarkAtValue:(float)a3
{
  v4 = [AVMobileFluidSliderMark alloc];
  v5 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
  *(float *)&double v7 = a3;
  *(float *)&double v8 = a3;
  v9 = [(AVMobileFluidSliderMark *)v4 initWithStartValue:v5 endValue:v6 filledColor:0 unfilledColor:v7 markWithType:v8];

  return v9;
}

@end