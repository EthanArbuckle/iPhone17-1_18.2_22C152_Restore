@interface MPModelStoreBrowseSection
+ (id)__brick_KEY;
+ (id)__displaysAsGridCellInCarPlay_KEY;
+ (id)__loadAdditionalContentURL_KEY;
+ (id)__memberOfChartSet_KEY;
+ (id)__previouslyRetrievedNestedResponse_KEY;
+ (id)__radioStation_KEY;
+ (id)__sectionType_KEY;
+ (id)__title_KEY;
+ (id)__uniformContentItemType_KEY;
+ (void)__MPModelStoreBrowseSectionPropertyBrick__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyMemberOfChartSet__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyTitle__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyType__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionPropertyUniformContentItemType__MAPPING_MISSING__;
+ (void)__MPModelStoreBrowseSectionRelationshipRadioStation__MAPPING_MISSING__;
- (BOOL)containsOnlyEditorialElements;
- (void)setContainsOnlyEditorialElements:(BOOL)a3;
@end

@implementation MPModelStoreBrowseSection

+ (void)__MPModelStoreBrowseSectionRelationshipRadioStation__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:27 description:@"Translator was missing mapping for MPModelStoreBrowseSectionRelationshipRadioStation"];
}

+ (id)__radioStation_KEY
{
  return @"MPModelStoreBrowseSectionRelationshipRadioStation";
}

+ (void)__MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:26 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay"];
}

+ (id)__displaysAsGridCellInCarPlay_KEY
{
  return @"MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay";
}

+ (void)__MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:25 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse"];
}

+ (id)__previouslyRetrievedNestedResponse_KEY
{
  return @"MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse";
}

+ (void)__MPModelStoreBrowseSectionPropertyBrick__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:24 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyBrick"];
}

+ (id)__brick_KEY
{
  return @"MPModelStoreBrowseSectionPropertyBrick";
}

+ (void)__MPModelStoreBrowseSectionPropertyMemberOfChartSet__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:23 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyMemberOfChartSet"];
}

+ (id)__memberOfChartSet_KEY
{
  return @"MPModelStoreBrowseSectionPropertyMemberOfChartSet";
}

+ (void)__MPModelStoreBrowseSectionPropertyUniformContentItemType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:22 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyUniformContentItemType"];
}

+ (id)__uniformContentItemType_KEY
{
  return @"MPModelStoreBrowseSectionPropertyUniformContentItemType";
}

+ (void)__MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:21 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL"];
}

+ (id)__loadAdditionalContentURL_KEY
{
  return @"MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL";
}

+ (void)__MPModelStoreBrowseSectionPropertyType__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:20 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyType"];
}

+ (id)__sectionType_KEY
{
  return @"MPModelStoreBrowseSectionPropertyType";
}

+ (void)__MPModelStoreBrowseSectionPropertyTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelStoreBrowseSection.m" lineNumber:19 description:@"Translator was missing mapping for MPModelStoreBrowseSectionPropertyTitle"];
}

+ (id)__title_KEY
{
  return @"MPModelStoreBrowseSectionPropertyTitle";
}

- (void)setContainsOnlyEditorialElements:(BOOL)a3
{
  self->_containsOnlyEditorialElements = a3;
}

- (BOOL)containsOnlyEditorialElements
{
  return self->_containsOnlyEditorialElements;
}

@end