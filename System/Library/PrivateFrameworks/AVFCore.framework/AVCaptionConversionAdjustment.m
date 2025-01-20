@interface AVCaptionConversionAdjustment
+ (AVCaptionConversionAdjustment)captionConversionAdjustmentWithFigDictionary:(__CFDictionary *)a3;
- (AVCaptionConversionAdjustmentType)adjustmentType;
@end

@implementation AVCaptionConversionAdjustment

+ (AVCaptionConversionAdjustment)captionConversionAdjustmentWithFigDictionary:(__CFDictionary *)a3
{
  if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F327F8]), "longValue") != 1)return 0; {
  return (AVCaptionConversionAdjustment *)+[AVCaptionConversionTimeRangeAdjustment captionConversionTimeRangeAdjustmentWithFigDictionary:a3];
  }
}

- (AVCaptionConversionAdjustmentType)adjustmentType
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end