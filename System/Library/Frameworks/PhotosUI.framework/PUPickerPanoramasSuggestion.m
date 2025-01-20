@interface PUPickerPanoramasSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerPanoramasSuggestion)init;
- (PUPickerPanoramasSuggestion)initWithCoder:(id)a3;
@end

@implementation PUPickerPanoramasSuggestion

- (PUPickerPanoramasSuggestion)init
{
  return (PUPickerPanoramasSuggestion *)PickerPanoramasSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerPanoramasSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerPanoramasSuggestion)initWithCoder:(id)a3
{
  return (PUPickerPanoramasSuggestion *)PickerPanoramasSuggestion.init(coder:)(a3);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end