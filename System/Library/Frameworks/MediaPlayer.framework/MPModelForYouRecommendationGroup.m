@interface MPModelForYouRecommendationGroup
+ (id)__displaysAsGridCellInCarPlay_KEY;
+ (id)__displaysAsTitledSectionWithRowsInCarPlay_KEY;
+ (id)__groupType_KEY;
+ (id)__hrefURL_KEY;
+ (id)__lastUpdatedDate_KEY;
+ (id)__loadAdditionalContentURL_KEY;
+ (id)__refreshURL_KEY;
+ (id)__sectionIndex_KEY;
+ (id)__sectionedItems_KEY;
+ (id)__subgroups_KEY;
+ (id)__title_KEY;
+ (id)__traits_KEY;
+ (id)classesForSecureCoding;
+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyGroupType__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyHrefURL__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyLastUpdatedDate__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyRefreshURL__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertySectionIndex__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertySectionedItems__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertySubgroups__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyTitle__MAPPING_MISSING__;
+ (void)__MPModelForYouRecommendationGroupPropertyTraits__MAPPING_MISSING__;
- (BOOL)isGroupRecommendation;
- (NSURL)refreshURL;
- (id)itemAtIndex:(int64_t)a3;
- (int64_t)numberOfItems;
- (void)setGroupRecommendation:(BOOL)a3;
- (void)setRefreshURL:(id)a3;
@end

@implementation MPModelForYouRecommendationGroup

+ (id)__traits_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyTraits";
}

+ (id)__title_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyTitle";
}

+ (id)__subgroups_KEY
{
  return @"MPModelForYouRecommendationGroupPropertySubgroups";
}

+ (id)__sectionedItems_KEY
{
  return @"MPModelForYouRecommendationGroupPropertySectionedItems";
}

+ (id)__sectionIndex_KEY
{
  return @"MPModelForYouRecommendationGroupPropertySectionIndex";
}

+ (id)__refreshURL_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyRefreshURL";
}

+ (id)__loadAdditionalContentURL_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL";
}

+ (id)__lastUpdatedDate_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyLastUpdatedDate";
}

+ (id)__hrefURL_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyHrefURL";
}

+ (id)__groupType_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyGroupType";
}

+ (id)__displaysAsTitledSectionWithRowsInCarPlay_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay";
}

+ (id)__displaysAsGridCellInCarPlay_KEY
{
  return @"MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay";
}

- (void).cxx_destruct
{
}

- (void)setGroupRecommendation:(BOOL)a3
{
  self->_groupRecommendation = a3;
}

- (BOOL)isGroupRecommendation
{
  return self->_groupRecommendation;
}

- (id)itemAtIndex:(int64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a3, -[MPModelForYouRecommendationGroup sectionIndex](self, "sectionIndex"));
  v5 = [(MPModelForYouRecommendationGroup *)self sectionedItems];
  v6 = [v5 itemAtIndexPath:v4];

  return v6;
}

- (int64_t)numberOfItems
{
  v3 = [(MPModelForYouRecommendationGroup *)self sectionedItems];
  int64_t v4 = objc_msgSend(v3, "numberOfItemsInSection:", -[MPModelForYouRecommendationGroup sectionIndex](self, "sectionIndex"));

  return v4;
}

- (void)setRefreshURL:(id)a3
{
}

- (NSURL)refreshURL
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v4 = NSString;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  v7 = objc_msgSend(v4, "stringWithFormat:", @"%lld", llround(v6 * 1000.0));

  [v3 setObject:v7 forKey:@"time"];
  v8 = [MEMORY[0x1E4F29088] componentsWithURL:self->_refreshURL resolvingAgainstBaseURL:0];
  v9 = [v8 queryItems];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke;
  v14[3] = &unk_1E57F76F0;
  id v15 = v10;
  id v11 = v10;
  [v3 enumerateKeysAndObjectsUsingBlock:v14];
  [v8 setQueryItems:v11];
  v12 = [v8 URL];

  return (NSURL *)v12;
}

void __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = (objc_class *)MEMORY[0x1E4F290C8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithName:v5 value:v7];

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke_2;
    v12[3] = &unk_1E57F76C8;
    id v13 = v5;
    uint64_t v10 = [v9 indexOfObjectPassingTest:v12];
    id v11 = *(void **)(a1 + 32);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      [v11 addObject:v8];
    }
    else {
      [v11 replaceObjectAtIndex:v10 withObject:v8];
    }
  }
}

uint64_t __46__MPModelForYouRecommendationGroup_refreshURL__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:50 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyDisplaysAsTitledSectionWithRowsInCarPlay"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:49 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyDisplaysAsGridCellInCarPlay"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyTraits__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:48 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyTraits"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyRefreshURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:47 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyRefreshURL"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyHrefURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:46 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyHrefURL"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:45 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyLoadAdditionalContentURL"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:44 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyTitle"];
}

+ (void)__MPModelForYouRecommendationGroupPropertySubgroups__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:43 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertySubgroups"];
}

+ (void)__MPModelForYouRecommendationGroupPropertySectionIndex__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:42 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertySectionIndex"];
}

+ (void)__MPModelForYouRecommendationGroupPropertySectionedItems__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:41 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertySectionedItems"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyLastUpdatedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:40 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyLastUpdatedDate"];
}

+ (void)__MPModelForYouRecommendationGroupPropertyGroupType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelForYouRecommendationGroup.m" lineNumber:39 description:@"Translator was missing mapping for MPModelForYouRecommendationGroupPropertyGroupType"];
}

+ (id)classesForSecureCoding
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

@end