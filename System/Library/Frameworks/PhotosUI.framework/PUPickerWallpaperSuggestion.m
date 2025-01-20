@interface PUPickerWallpaperSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (PUPickerWallpaperSuggestion)init;
- (PUPickerWallpaperSuggestion)initWithCoder:(id)a3;
- (PUPickerWallpaperSuggestion)initWithMode:(int64_t)a3;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerWallpaperSuggestion

- (int64_t)mode
{
  return PickerWallpaperSuggestion.mode.getter();
}

- (PUPickerWallpaperSuggestion)initWithMode:(int64_t)a3
{
  return (PUPickerWallpaperSuggestion *)PickerWallpaperSuggestion.init(mode:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerWallpaperSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerWallpaperSuggestion)initWithCoder:(id)a3
{
  return (PUPickerWallpaperSuggestion *)PickerWallpaperSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PickerWallpaperSuggestion.encode(with:)((NSCoder)v4);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

- (PUPickerWallpaperSuggestion)init
{
}

@end