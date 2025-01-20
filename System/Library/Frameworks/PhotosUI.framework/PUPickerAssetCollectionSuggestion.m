@interface PUPickerAssetCollectionSuggestion
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)extendedCuratedAssetsOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReverseSortOrder;
- (NSString)localIdentifier;
- (PUPickerAssetCollectionSuggestion)init;
- (PUPickerAssetCollectionSuggestion)initWithCoder:(id)a3;
- (PUPickerAssetCollectionSuggestion)initWithLocalIdentifier:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUPickerAssetCollectionSuggestion

- (NSString)localIdentifier
{
  PickerAssetCollectionSuggestion.localIdentifier.getter();
  v2 = (void *)sub_217C5CF28();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)extendedCuratedAssetsOnly
{
  return PickerAssetCollectionSuggestion.extendedCuratedAssetsOnly.getter() & 1;
}

- (BOOL)shouldReverseSortOrder
{
  return PickerAssetCollectionSuggestion.shouldReverseSortOrder.getter() & 1;
}

- (PUPickerAssetCollectionSuggestion)initWithLocalIdentifier:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5
{
  return (PUPickerAssetCollectionSuggestion *)PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)();
}

- (BOOL)isEqual:(id)a3
{
  return sub_217C3FE04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerAssetCollectionSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return static PickerAssetCollectionSuggestion.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (PUPickerAssetCollectionSuggestion)initWithCoder:(id)a3
{
  return (PUPickerAssetCollectionSuggestion *)PickerAssetCollectionSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PickerAssetCollectionSuggestion.encode(with:)((NSCoder)v4);
}

- (PUPickerAssetCollectionSuggestion)init
{
}

- (void).cxx_destruct
{
}

@end