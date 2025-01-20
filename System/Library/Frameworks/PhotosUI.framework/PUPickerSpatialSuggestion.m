@interface PUPickerSpatialSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerSpatialSuggestion)init;
- (PUPickerSpatialSuggestion)initWithCoder:(id)a3;
@end

@implementation PUPickerSpatialSuggestion

- (PUPickerSpatialSuggestion)init
{
  return (PUPickerSpatialSuggestion *)PickerSpatialSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSpatialSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSpatialSuggestion)initWithCoder:(id)a3
{
  return (PUPickerSpatialSuggestion *)PickerSpatialSuggestion.init(coder:)(a3);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end