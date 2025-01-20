@interface HDLocalFeatureAttributesProvider
- (HDLocalFeatureAttributesProvider)initWithLocalFeatureAttributes:(id)a3;
- (HKPairedFeatureAttributes)currentPairedFeatureAttributes;
@end

@implementation HDLocalFeatureAttributesProvider

- (HDLocalFeatureAttributesProvider)initWithLocalFeatureAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDLocalFeatureAttributesProvider;
  v5 = [(HDLocalFeatureAttributesProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localFeatureAttributes = v5->_localFeatureAttributes;
    v5->_localFeatureAttributes = (HKFeatureAttributes *)v6;
  }
  return v5;
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F2B318]) initWithLocalAttributes:self->_localFeatureAttributes pairedAttributes:0];

  return (HKPairedFeatureAttributes *)v2;
}

- (void).cxx_destruct
{
}

@end