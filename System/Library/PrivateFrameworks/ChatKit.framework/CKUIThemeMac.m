@interface CKUIThemeMac
- (id)contactsActionButtonBackgroundColor;
- (id)conversationListBackgroundColor;
- (id)conversationListCellColor;
- (id)conversationListCellPreviewBackgroundColor;
- (id)conversationListCellSelectedDateColor;
- (id)conversationListCellSelectedSummaryColor;
- (id)conversationListCellSelectedTextColor;
- (id)conversationListCollectionViewBackgroundColor;
- (id)conversationListDateColor;
- (id)conversationListEditingPinsSummaryColor;
- (id)conversationListFocusFilterBannerTextColor;
- (id)conversationListPinnedCellSelectorViewColor;
- (id)conversationListPinnedConversationNameSelectedColor;
- (id)conversationListSenderColor;
- (id)conversationListSummaryColor;
- (id)detailsAddButtonBackgroundColor;
- (id)detailsAttachmentsDecorationViewBackgroundColor;
- (id)detailsBackgroundColor;
- (id)detailsCollectionViewBackgroundColor;
- (id)detailsGroupPhotoBackgroundColor;
- (id)detailsHeaderFooterContentViewBackgroundColor;
- (id)entryFieldButtonColor;
- (id)iosMacDetailsCellColor;
- (id)paddleSeparatorColor;
- (id)quickActionButtonGlyphColor;
- (id)readSelectedIndicatorColor;
- (id)selectedConversationListTypingIndicatorBubbleColor;
- (id)spotlightSearchBackgroundColor;
- (id)spotlightSearchBarBackgroundColor;
- (id)spotlightSearchSegmentedControlBackgroundColor;
@end

@implementation CKUIThemeMac

- (id)quickActionButtonGlyphColor
{
  if (quickActionButtonGlyphColor_once_1931 != -1) {
    dispatch_once(&quickActionButtonGlyphColor_once_1931, &__block_literal_global_1933);
  }
  v2 = (void *)quickActionButtonGlyphColor_sBehavior_1930;

  return v2;
}

void __43__CKUIThemeMac_quickActionButtonGlyphColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v1 = (void *)quickActionButtonGlyphColor_sBehavior_1930;
  quickActionButtonGlyphColor_sBehavior_1930 = v0;
}

- (id)entryFieldButtonColor
{
  if (entryFieldButtonColor_once_1935 != -1) {
    dispatch_once(&entryFieldButtonColor_once_1935, &__block_literal_global_1937);
  }
  v2 = (void *)entryFieldButtonColor_sBehavior_1934;

  return v2;
}

void __37__CKUIThemeMac_entryFieldButtonColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v1 = (void *)entryFieldButtonColor_sBehavior_1934;
  entryFieldButtonColor_sBehavior_1934 = v0;
}

- (id)conversationListSenderColor
{
  if (conversationListSenderColor_once_1939 != -1) {
    dispatch_once(&conversationListSenderColor_once_1939, &__block_literal_global_1941);
  }
  v2 = (void *)conversationListSenderColor_sBehavior_1938;

  return v2;
}

void __43__CKUIThemeMac_conversationListSenderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] labelColor];
  v1 = (void *)conversationListSenderColor_sBehavior_1938;
  conversationListSenderColor_sBehavior_1938 = v0;
}

- (id)conversationListSummaryColor
{
  int v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListSummaryColor_sBehavior_1943;
  if (conversationListSummaryColor_sBehavior_1943) {
    BOOL v4 = conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor_1942 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v6 = (void *)conversationListSummaryColor_sBehavior_1943;
    conversationListSummaryColor_sBehavior_1943 = v5;

    conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor_1942 = v2;
    v3 = (void *)conversationListSummaryColor_sBehavior_1943;
  }

  return v3;
}

- (id)conversationListEditingPinsSummaryColor
{
  int v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1945;
  if (conversationListEditingPinsSummaryColor_sBehavior_1945) {
    BOOL v4 = conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor_1944 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
    v6 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1945;
    conversationListEditingPinsSummaryColor_sBehavior_1945 = v5;

    conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor_1944 = v2;
    v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1945;
  }

  return v3;
}

- (id)conversationListCellSelectedTextColor
{
  if (conversationListCellSelectedTextColor_once_1947 != -1) {
    dispatch_once(&conversationListCellSelectedTextColor_once_1947, &__block_literal_global_1949);
  }
  int v2 = (void *)conversationListCellSelectedTextColor_sBehavior_1946;

  return v2;
}

void __53__CKUIThemeMac_conversationListCellSelectedTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  v1 = (void *)conversationListCellSelectedTextColor_sBehavior_1946;
  conversationListCellSelectedTextColor_sBehavior_1946 = v0;
}

- (id)conversationListCellPreviewBackgroundColor
{
  if (conversationListCellPreviewBackgroundColor_once != -1) {
    dispatch_once(&conversationListCellPreviewBackgroundColor_once, &__block_literal_global_1951);
  }
  return 0;
}

- (id)conversationListCellSelectedSummaryColor
{
  if (conversationListCellSelectedSummaryColor_once_1953 != -1) {
    dispatch_once(&conversationListCellSelectedSummaryColor_once_1953, &__block_literal_global_1955);
  }
  int v2 = (void *)conversationListCellSelectedSummaryColor_sBehavior_1952;

  return v2;
}

void __56__CKUIThemeMac_conversationListCellSelectedSummaryColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.8];
  v1 = (void *)conversationListCellSelectedSummaryColor_sBehavior_1952;
  conversationListCellSelectedSummaryColor_sBehavior_1952 = v0;
}

- (id)readSelectedIndicatorColor
{
  if (readSelectedIndicatorColor_once_1957 != -1) {
    dispatch_once(&readSelectedIndicatorColor_once_1957, &__block_literal_global_1959);
  }
  int v2 = (void *)readSelectedIndicatorColor_sBehavior_1956;

  return v2;
}

void __42__CKUIThemeMac_readSelectedIndicatorColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  v1 = (void *)readSelectedIndicatorColor_sBehavior_1956;
  readSelectedIndicatorColor_sBehavior_1956 = v0;
}

- (id)conversationListDateColor
{
  int v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListDateColor_sBehavior_1961;
  if (conversationListDateColor_sBehavior_1961) {
    BOOL v4 = conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor_1960 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v6 = (void *)conversationListDateColor_sBehavior_1961;
    conversationListDateColor_sBehavior_1961 = v5;

    conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor_1960 = v2;
    v3 = (void *)conversationListDateColor_sBehavior_1961;
  }

  return v3;
}

- (id)conversationListCellSelectedDateColor
{
  if (conversationListCellSelectedDateColor_once_1963 != -1) {
    dispatch_once(&conversationListCellSelectedDateColor_once_1963, &__block_literal_global_1965);
  }
  int v2 = (void *)conversationListCellSelectedDateColor_sBehavior_1962;

  return v2;
}

void __53__CKUIThemeMac_conversationListCellSelectedDateColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.8];
  v1 = (void *)conversationListCellSelectedDateColor_sBehavior_1962;
  conversationListCellSelectedDateColor_sBehavior_1962 = v0;
}

- (id)conversationListCellColor
{
  if (conversationListCellColor_once_1967 != -1) {
    dispatch_once(&conversationListCellColor_once_1967, &__block_literal_global_1969);
  }
  int v2 = (void *)conversationListCellColor_sBehavior_1966;

  return v2;
}

void __41__CKUIThemeMac_conversationListCellColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] clearColor];
  }
  v1 = (void *)conversationListCellColor_sBehavior_1966;
  conversationListCellColor_sBehavior_1966 = v0;
}

- (id)conversationListBackgroundColor
{
  if (conversationListBackgroundColor_once_1971 != -1) {
    dispatch_once(&conversationListBackgroundColor_once_1971, &__block_literal_global_1973);
  }
  id v2 = (void *)conversationListBackgroundColor_sBehavior_1970;

  return v2;
}

void __47__CKUIThemeMac_conversationListBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  v1 = (void *)conversationListBackgroundColor_sBehavior_1970;
  conversationListBackgroundColor_sBehavior_1970 = v0;
}

- (id)conversationListCollectionViewBackgroundColor
{
  if (conversationListCollectionViewBackgroundColor_once_1975 != -1) {
    dispatch_once(&conversationListCollectionViewBackgroundColor_once_1975, &__block_literal_global_1977);
  }
  id v2 = (void *)conversationListCollectionViewBackgroundColor_sBehavior_1974;

  return v2;
}

void __61__CKUIThemeMac_conversationListCollectionViewBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  v1 = (void *)conversationListCollectionViewBackgroundColor_sBehavior_1974;
  conversationListCollectionViewBackgroundColor_sBehavior_1974 = v0;
}

- (id)conversationListPinnedCellSelectorViewColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CKUIThemeMac_conversationListPinnedCellSelectorViewColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (conversationListPinnedCellSelectorViewColor_once_1979 != -1) {
    dispatch_once(&conversationListPinnedCellSelectorViewColor_once_1979, block);
  }
  return (id)conversationListPinnedCellSelectorViewColor_sBehavior_1978;
}

void __59__CKUIThemeMac_conversationListPinnedCellSelectorViewColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) conversationListSelectedCellColor];
  id v2 = (void *)conversationListPinnedCellSelectorViewColor_sBehavior_1978;
  conversationListPinnedCellSelectorViewColor_sBehavior_1978 = v1;
}

- (id)conversationListPinnedConversationNameSelectedColor
{
  if (conversationListPinnedConversationNameSelectedColor_once_1981 != -1) {
    dispatch_once(&conversationListPinnedConversationNameSelectedColor_once_1981, &__block_literal_global_1983);
  }
  id v2 = (void *)conversationListPinnedConversationNameSelectedColor_sBehavior_1980;

  return v2;
}

void __67__CKUIThemeMac_conversationListPinnedConversationNameSelectedColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v1 = (void *)conversationListPinnedConversationNameSelectedColor_sBehavior_1980;
  conversationListPinnedConversationNameSelectedColor_sBehavior_1980 = v0;
}

- (id)conversationListFocusFilterBannerTextColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKUIThemeMac_conversationListFocusFilterBannerTextColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (conversationListFocusFilterBannerTextColor_once_1985 != -1) {
    dispatch_once(&conversationListFocusFilterBannerTextColor_once_1985, block);
  }
  return (id)conversationListFocusFilterBannerTextColor_sBehavior_1984;
}

void __58__CKUIThemeMac_conversationListFocusFilterBannerTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) conversationListSummaryColor];
  id v2 = (void *)conversationListFocusFilterBannerTextColor_sBehavior_1984;
  conversationListFocusFilterBannerTextColor_sBehavior_1984 = v1;
}

- (id)selectedConversationListTypingIndicatorBubbleColor
{
  if (selectedConversationListTypingIndicatorBubbleColor_once_1987 != -1) {
    dispatch_once(&selectedConversationListTypingIndicatorBubbleColor_once_1987, &__block_literal_global_1989);
  }
  id v2 = (void *)selectedConversationListTypingIndicatorBubbleColor_sBehavior_1986;

  return v2;
}

void __66__CKUIThemeMac_selectedConversationListTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v1 = (void *)selectedConversationListTypingIndicatorBubbleColor_sBehavior_1986;
  selectedConversationListTypingIndicatorBubbleColor_sBehavior_1986 = v0;
}

- (id)spotlightSearchBackgroundColor
{
  if (spotlightSearchBackgroundColor_once_1991 != -1) {
    dispatch_once(&spotlightSearchBackgroundColor_once_1991, &__block_literal_global_1993);
  }
  id v2 = (void *)spotlightSearchBackgroundColor_sBehavior_1990;

  return v2;
}

void __46__CKUIThemeMac_spotlightSearchBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  }
  uint64_t v1 = (void *)spotlightSearchBackgroundColor_sBehavior_1990;
  spotlightSearchBackgroundColor_sBehavior_1990 = v0;
}

- (id)detailsCollectionViewBackgroundColor
{
  if (detailsCollectionViewBackgroundColor_once_1995 != -1) {
    dispatch_once(&detailsCollectionViewBackgroundColor_once_1995, &__block_literal_global_1997);
  }
  id v2 = (void *)detailsCollectionViewBackgroundColor_sBehavior_1994;

  return v2;
}

void __52__CKUIThemeMac_detailsCollectionViewBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  }
  uint64_t v1 = (void *)detailsCollectionViewBackgroundColor_sBehavior_1994;
  detailsCollectionViewBackgroundColor_sBehavior_1994 = v0;
}

- (id)spotlightSearchBarBackgroundColor
{
  if (spotlightSearchBarBackgroundColor_once != -1) {
    dispatch_once(&spotlightSearchBarBackgroundColor_once, &__block_literal_global_1999);
  }
  id v2 = (void *)spotlightSearchBarBackgroundColor_sBehavior;

  return v2;
}

void __49__CKUIThemeMac_spotlightSearchBarBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] systemLightGrayTintColor];
  uint64_t v1 = (void *)spotlightSearchBarBackgroundColor_sBehavior;
  spotlightSearchBarBackgroundColor_sBehavior = v0;
}

- (id)spotlightSearchSegmentedControlBackgroundColor
{
  if (spotlightSearchSegmentedControlBackgroundColor_once_2001 != -1) {
    dispatch_once(&spotlightSearchSegmentedControlBackgroundColor_once_2001, &__block_literal_global_2003);
  }
  id v2 = (void *)spotlightSearchSegmentedControlBackgroundColor_sBehavior_2000;

  return v2;
}

void __62__CKUIThemeMac_spotlightSearchSegmentedControlBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  uint64_t v1 = (void *)spotlightSearchSegmentedControlBackgroundColor_sBehavior_2000;
  spotlightSearchSegmentedControlBackgroundColor_sBehavior_2000 = v0;
}

- (id)contactsActionButtonBackgroundColor
{
  if (contactsActionButtonBackgroundColor_once_2005 != -1) {
    dispatch_once(&contactsActionButtonBackgroundColor_once_2005, &__block_literal_global_2007);
  }
  id v2 = (void *)contactsActionButtonBackgroundColor_sBehavior_2004;

  return v2;
}

void __51__CKUIThemeMac_contactsActionButtonBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
  uint64_t v1 = (void *)contactsActionButtonBackgroundColor_sBehavior_2004;
  contactsActionButtonBackgroundColor_sBehavior_2004 = v0;
}

- (id)detailsGroupPhotoBackgroundColor
{
  if (detailsGroupPhotoBackgroundColor_once_2009 != -1) {
    dispatch_once(&detailsGroupPhotoBackgroundColor_once_2009, &__block_literal_global_2011);
  }
  return 0;
}

- (id)detailsHeaderFooterContentViewBackgroundColor
{
  if (detailsHeaderFooterContentViewBackgroundColor_once_2013 != -1) {
    dispatch_once(&detailsHeaderFooterContentViewBackgroundColor_once_2013, &__block_literal_global_2015);
  }
  id v2 = (void *)detailsHeaderFooterContentViewBackgroundColor_sBehavior_2012;

  return v2;
}

void __61__CKUIThemeMac_detailsHeaderFooterContentViewBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  uint64_t v1 = (void *)detailsHeaderFooterContentViewBackgroundColor_sBehavior_2012;
  detailsHeaderFooterContentViewBackgroundColor_sBehavior_2012 = v0;
}

- (id)iosMacDetailsCellColor
{
  if (iosMacDetailsCellColor_once_2017 != -1) {
    dispatch_once(&iosMacDetailsCellColor_once_2017, &__block_literal_global_2019);
  }
  id v2 = (void *)iosMacDetailsCellColor_sBehavior_2016;

  return v2;
}

void __38__CKUIThemeMac_iosMacDetailsCellColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  uint64_t v1 = (void *)iosMacDetailsCellColor_sBehavior_2016;
  iosMacDetailsCellColor_sBehavior_2016 = v0;
}

- (id)detailsBackgroundColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CKUIThemeMac_detailsBackgroundColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (detailsBackgroundColor_once_2021 != -1) {
    dispatch_once(&detailsBackgroundColor_once_2021, block);
  }
  return (id)detailsBackgroundColor_sBehavior_2020;
}

void __38__CKUIThemeMac_detailsBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) iosMacDetailsCellColor];
  id v2 = (void *)detailsBackgroundColor_sBehavior_2020;
  detailsBackgroundColor_sBehavior_2020 = v1;
}

- (id)detailsAddButtonBackgroundColor
{
  if (detailsAddButtonBackgroundColor_once_2023 != -1) {
    dispatch_once(&detailsAddButtonBackgroundColor_once_2023, &__block_literal_global_2025);
  }
  id v2 = (void *)detailsAddButtonBackgroundColor_sBehavior_2022;

  return v2;
}

void __47__CKUIThemeMac_detailsAddButtonBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
  uint64_t v1 = (void *)detailsAddButtonBackgroundColor_sBehavior_2022;
  detailsAddButtonBackgroundColor_sBehavior_2022 = v0;
}

- (id)detailsAttachmentsDecorationViewBackgroundColor
{
  if (detailsAttachmentsDecorationViewBackgroundColor_once_2027 != -1) {
    dispatch_once(&detailsAttachmentsDecorationViewBackgroundColor_once_2027, &__block_literal_global_2029);
  }
  id v2 = (void *)detailsAttachmentsDecorationViewBackgroundColor_sBehavior_2026;

  return v2;
}

void __63__CKUIThemeMac_detailsAttachmentsDecorationViewBackgroundColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if ([v2 macApplicationMetricsGatheringEnabled])
  {
    uint64_t v0 = 0;
  }
  else
  {
    uint64_t v0 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  uint64_t v1 = (void *)detailsAttachmentsDecorationViewBackgroundColor_sBehavior_2026;
  detailsAttachmentsDecorationViewBackgroundColor_sBehavior_2026 = v0;
}

- (id)paddleSeparatorColor
{
  if (paddleSeparatorColor_once_2031 != -1) {
    dispatch_once(&paddleSeparatorColor_once_2031, &__block_literal_global_2033);
  }
  id v2 = (void *)paddleSeparatorColor_sBehavior_2030;

  return v2;
}

void __36__CKUIThemeMac_paddleSeparatorColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.4];
  uint64_t v1 = (void *)paddleSeparatorColor_sBehavior_2030;
  paddleSeparatorColor_sBehavior_2030 = v0;
}

@end