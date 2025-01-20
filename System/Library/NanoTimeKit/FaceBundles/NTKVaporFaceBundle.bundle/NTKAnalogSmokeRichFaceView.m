@interface NTKAnalogSmokeRichFaceView
+ (BOOL)isRichComplicationsEnabled;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
@end

@implementation NTKAnalogSmokeRichFaceView

+ (BOOL)isRichComplicationsEnabled
{
  return 1;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 15 || a4 == 10;
}

@end