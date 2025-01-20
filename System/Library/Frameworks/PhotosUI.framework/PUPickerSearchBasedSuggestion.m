@interface PUPickerSearchBasedSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerSearchBasedSuggestion)init;
- (PUPickerSearchBasedSuggestion)initWithCoder:(id)a3;
- (PUPickerSearchBasedSuggestion)initWithMode:(int64_t)a3;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerSearchBasedSuggestion

- (int64_t)mode
{
  return PickerSearchBasedSuggestion.mode.getter();
}

- (PUPickerSearchBasedSuggestion)initWithMode:(int64_t)a3
{
  return (PUPickerSearchBasedSuggestion *)PickerSearchBasedSuggestion.init(mode:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSearchBasedSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSearchBasedSuggestion)initWithCoder:(id)a3
{
  return (PUPickerSearchBasedSuggestion *)PickerSearchBasedSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PickerSearchBasedSuggestion.encode(with:)((NSCoder)v4);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

- (PUPickerSearchBasedSuggestion)init
{
}

@end