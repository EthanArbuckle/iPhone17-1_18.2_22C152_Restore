@interface PUPickerStyleablePhotoSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerStyleablePhotoSuggestion)init;
- (PUPickerStyleablePhotoSuggestion)initWithCoder:(id)a3;
- (PUPickerStyleablePhotoSuggestion)initWithMode:(int64_t)a3;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerStyleablePhotoSuggestion

- (int64_t)mode
{
  return PickerStyleablePhotoSuggestion.mode.getter();
}

- (PUPickerStyleablePhotoSuggestion)initWithMode:(int64_t)a3
{
  return (PUPickerStyleablePhotoSuggestion *)PickerStyleablePhotoSuggestion.init(mode:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerStyleablePhotoSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerStyleablePhotoSuggestion)initWithCoder:(id)a3
{
  return (PUPickerStyleablePhotoSuggestion *)PickerStyleablePhotoSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PickerStyleablePhotoSuggestion.encode(with:)((NSCoder)v4);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

- (PUPickerStyleablePhotoSuggestion)init
{
}

@end