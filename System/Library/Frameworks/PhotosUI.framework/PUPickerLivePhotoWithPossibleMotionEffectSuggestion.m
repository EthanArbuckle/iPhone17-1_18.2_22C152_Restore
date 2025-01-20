@interface PUPickerLivePhotoWithPossibleMotionEffectSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)init;
- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)initWithCoder:(id)a3;
@end

@implementation PUPickerLivePhotoWithPossibleMotionEffectSuggestion

- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)init
{
  return (PUPickerLivePhotoWithPossibleMotionEffectSuggestion *)PickerLivePhotoWithPossibleMotionEffectSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerLivePhotoWithPossibleMotionEffectSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)initWithCoder:(id)a3
{
  return (PUPickerLivePhotoWithPossibleMotionEffectSuggestion *)PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(a3);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end