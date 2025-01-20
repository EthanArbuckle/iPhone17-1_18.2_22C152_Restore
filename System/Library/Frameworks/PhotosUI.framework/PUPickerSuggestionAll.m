@interface PUPickerSuggestionAll
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerSuggestionAll)init;
- (PUPickerSuggestionAll)initWithCoder:(id)a3;
@end

@implementation PUPickerSuggestionAll

- (PUPickerSuggestionAll)init
{
  return (PUPickerSuggestionAll *)PickerSuggestionAll.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSuggestionAll.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSuggestionAll)initWithCoder:(id)a3
{
  return (PUPickerSuggestionAll *)PickerSuggestionAll.init(coder:)(a3);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end