@interface MUISearchSuggestionCategory
+ (id)allMailboxesCategory;
+ (id)contactCategory;
+ (id)documentCategory;
+ (id)genericCategory;
+ (id)instantAnswersCategory;
+ (id)linkCategory;
+ (id)locationCategory;
+ (id)recentGenericCategory;
+ (id)recentSearchCategory;
+ (id)suggestedSearchCategory;
+ (id)topHitsCategory;
- (BOOL)isGroupedInCategory:(id)a3;
- (BOOL)isLegacy;
- (MUISearchSuggestionCategory)groupingCategory;
- (MUISearchSuggestionCategory)init;
- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3;
- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3 groupingCategory:(id)a4;
- (NSArray)scopes;
- (NSString)displayName;
- (NSString)parsecCategory;
- (UIImage)atomImage;
- (UIImage)image;
- (id)description;
- (id)imageInstantiationBlock;
- (unint64_t)indexOfScopeWithIdentifier:(id)a3;
- (void)setAtomImage:(id)a3;
- (void)setGroupingCategory:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageInstantiationBlock:(id)a3;
- (void)setParsecCategory:(id)a3;
- (void)setScopes:(id)a3;
@end

@implementation MUISearchSuggestionCategory

+ (id)contactCategory
{
  if (contactCategory_onceToken != -1) {
    dispatch_once(&contactCategory_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)contactCategory_category;
  return v2;
}

void __68__MUISearchSuggestionCategory_MUIContactSuggestion__contactCategory__block_invoke()
{
  v0 = [MUISearchSuggestionCategory alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_PEOPLE" value:&stru_1F39CB5D8 table:0];
  uint64_t v3 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v2];
  v4 = (void *)contactCategory_category;
  contactCategory_category = v3;

  [(id)contactCategory_category setParsecCategory:*MEMORY[0x1E4F73E08]];
  id v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v5 performBlock:&__block_literal_global_36];
}

void __68__MUISearchSuggestionCategory_MUIContactSuggestion__contactCategory__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E4FB1818], "mui_imageWithSystemSymbolName:", @"person.crop.circle");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [(id)contactCategory_category setAtomImage:v0];
}

+ (id)documentCategory
{
  if (documentCategory_onceToken != -1) {
    dispatch_once(&documentCategory_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)documentCategory_category;
  return v2;
}

uint64_t __70__MUISearchSuggestionCategory_MUIDocumentSuggestion__documentCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_DOCUMENTS" value:&stru_1F39CB5D8 table:0];
  uint64_t v3 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v2];
  v4 = (void *)documentCategory_category;
  documentCategory_category = v3;

  uint64_t v5 = *MEMORY[0x1E4F73DE0];
  v6 = (void *)documentCategory_category;
  return [v6 setParsecCategory:v5];
}

+ (id)suggestedSearchCategory
{
  if (suggestedSearchCategory_onceToken != -1) {
    dispatch_once(&suggestedSearchCategory_onceToken, &__block_literal_global_76);
  }
  v2 = (void *)suggestedSearchCategory_category;
  return v2;
}

void __75__MUISearchSuggestionCategory_MUISearchSuggestion__suggestedSearchCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_SUGGESTED_SEARCHES" value:&stru_1F39CB5D8 table:0];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v1];
  uint64_t v3 = (void *)suggestedSearchCategory_category;
  suggestedSearchCategory_category = v2;
}

+ (id)genericCategory
{
  if (genericCategory_onceToken[0] != -1) {
    dispatch_once(genericCategory_onceToken, &__block_literal_global_83);
  }
  uint64_t v2 = (void *)genericCategory_category;
  return v2;
}

uint64_t __68__MUISearchSuggestionCategory_MUIGenericSuggestion__genericCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = +[MUISearchSuggestionCategory suggestedSearchCategory];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:0 groupingCategory:v1];
  uint64_t v3 = (void *)genericCategory_category;
  genericCategory_category = v2;

  uint64_t v4 = *MEMORY[0x1E4F73DE8];
  uint64_t v5 = (void *)genericCategory_category;
  return [v5 setParsecCategory:v4];
}

+ (id)recentGenericCategory
{
  if (recentGenericCategory_onceToken != -1) {
    dispatch_once(&recentGenericCategory_onceToken, &__block_literal_global_86);
  }
  uint64_t v2 = (void *)recentGenericCategory_category;
  return v2;
}

uint64_t __80__MUISearchSuggestionCategory_MUIRecentGenericSuggestion__recentGenericCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = +[MUISearchSuggestionCategory recentSearchCategory];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:0 groupingCategory:v1];
  uint64_t v3 = (void *)recentGenericCategory_category;
  recentGenericCategory_category = v2;

  uint64_t v4 = *MEMORY[0x1E4F73DE8];
  uint64_t v5 = (void *)recentGenericCategory_category;
  return [v5 setParsecCategory:v4];
}

+ (id)linkCategory
{
  if (linkCategory_onceToken != -1) {
    dispatch_once(&linkCategory_onceToken, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)linkCategory_category;
  return v2;
}

uint64_t __62__MUISearchSuggestionCategory_MUILinkSuggestion__linkCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 localizedStringForKey:@"Links" value:&stru_1F39CB5D8 table:0];
  uint64_t v3 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v2];
  uint64_t v4 = (void *)linkCategory_category;
  linkCategory_category = v3;

  uint64_t v5 = *MEMORY[0x1E4F73DF8];
  v6 = (void *)linkCategory_category;
  return [v6 setParsecCategory:v5];
}

+ (id)locationCategory
{
  if (locationCategory_onceToken != -1) {
    dispatch_once(&locationCategory_onceToken, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)locationCategory_category;
  return v2;
}

uint64_t __70__MUISearchSuggestionCategory_MUILocationSuggestion__locationCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 localizedStringForKey:@"Locations" value:&stru_1F39CB5D8 table:0];
  uint64_t v3 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v2];
  uint64_t v4 = (void *)locationCategory_category;
  locationCategory_category = v3;

  uint64_t v5 = *MEMORY[0x1E4F73E00];
  v6 = (void *)locationCategory_category;
  return [v6 setParsecCategory:v5];
}

+ (id)instantAnswersCategory
{
  if (instantAnswersCategory_onceToken != -1) {
    dispatch_once(&instantAnswersCategory_onceToken, &__block_literal_global_241);
  }
  [(id)instantAnswersCategory_category setParsecCategory:*MEMORY[0x1E4F73DF0]];
  uint64_t v2 = (void *)instantAnswersCategory_category;
  return v2;
}

void __88__MUISearchSuggestionCategory_MUISearchInstantAnswersSuggestion__instantAnswersCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_INSTANT_ANSWERS" value:&stru_1F39CB5D8 table:@"Main"];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v1];
  uint64_t v3 = (void *)instantAnswersCategory_category;
  instantAnswersCategory_category = v2;
}

+ (id)topHitsCategory
{
  if (topHitsCategory_onceToken[0] != -1) {
    dispatch_once(topHitsCategory_onceToken, &__block_literal_global_35);
  }
  [(id)topHitsCategory_category setParsecCategory:*MEMORY[0x1E4F73E10]];
  uint64_t v2 = (void *)topHitsCategory_category;
  return v2;
}

void __46__MUISearchSuggestionCategory_topHitsCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_TOP_HITS" value:&stru_1F39CB5D8 table:@"Main"];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v1];
  uint64_t v3 = (void *)topHitsCategory_category;
  topHitsCategory_category = v2;
}

- (MUISearchSuggestionCategory)init
{
}

- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3
{
  return [(MUISearchSuggestionCategory *)self initWithDisplayName:a3 groupingCategory:0];
}

- (MUISearchSuggestionCategory)initWithDisplayName:(id)a3 groupingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUISearchSuggestionCategory;
  v8 = [(MUISearchSuggestionCategory *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v9;

    objc_storeWeak((id *)&v8->_groupingCategory, v7);
  }

  return v8;
}

- (id)description
{
  if ([(NSArray *)self->_scopes count])
  {
    objc_msgSend(NSString, "stringWithFormat:", @" (%ld scopes)", -[NSArray count](self->_scopes, "count"));
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = &stru_1F39CB5D8;
  }
  id v4 = [NSString stringWithFormat:@"<%@: %p> %@%@", objc_opt_class(), self, self->_displayName, v3];

  return v4;
}

- (UIImage)image
{
  image = self->_image;
  if (image) {
    goto LABEL_2;
  }
  uint64_t v5 = [(MUISearchSuggestionCategory *)self imageInstantiationBlock];

  if (!v5)
  {
    image = self->_image;
LABEL_2:
    uint64_t v3 = image;
    goto LABEL_5;
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"<%p>.image", self);
  id v7 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  v8 = [(MUISearchSuggestionCategory *)self imageInstantiationBlock];
  uint64_t v3 = [v7 cachedImage:v8 forKey:v6];

LABEL_5:
  return v3;
}

- (unint64_t)indexOfScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_scopes count])
  {
    scopes = self->_scopes;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__MUISearchSuggestionCategory_indexOfScopeWithIdentifier___block_invoke;
    v8[3] = &unk_1E6D135C8;
    id v9 = v4;
    unint64_t v6 = [(NSArray *)scopes indexOfObjectPassingTest:v8];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __58__MUISearchSuggestionCategory_indexOfScopeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (MUISearchSuggestionCategory)groupingCategory
{
  WeakRetained = (MUISearchSuggestionCategory *)objc_loadWeakRetained((id *)&self->_groupingCategory);
  if (!WeakRetained) {
    WeakRetained = self;
  }
  return WeakRetained;
}

- (BOOL)isGroupedInCategory:(id)a3
{
  id v4 = a3;
  if ([(MUISearchSuggestionCategory *)self isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [(MUISearchSuggestionCategory *)self groupingCategory];
    char v5 = [v6 isEqual:v4];
  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setImage:(id)a3
{
}

- (UIImage)atomImage
{
  return self->_atomImage;
}

- (void)setAtomImage:(id)a3
{
}

- (NSString)parsecCategory
{
  return self->_parsecCategory;
}

- (void)setParsecCategory:(id)a3
{
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
}

- (void)setGroupingCategory:(id)a3
{
}

- (id)imageInstantiationBlock
{
  return self->_imageInstantiationBlock;
}

- (void)setImageInstantiationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageInstantiationBlock, 0);
  objc_destroyWeak((id *)&self->_groupingCategory);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_parsecCategory, 0);
  objc_storeStrong((id *)&self->_atomImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (id)recentSearchCategory
{
  if (recentSearchCategory_onceToken != -1) {
    dispatch_once(&recentSearchCategory_onceToken, &__block_literal_global_135);
  }
  uint64_t v2 = (void *)recentSearchCategory_category;
  return v2;
}

void __83__MUISearchSuggestionCategory_MFSearchRecentSearchCategories__recentSearchCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 localizedStringForKey:@"SEARCH_SUGGESTION_CATEGORY_RECENT_SEARCHES" value:&stru_1F39CB5D8 table:0];
  uint64_t v2 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v1];
  uint64_t v3 = (void *)recentSearchCategory_category;
  recentSearchCategory_category = v2;
}

+ (id)allMailboxesCategory
{
  if (allMailboxesCategory_onceToken != -1) {
    dispatch_once(&allMailboxesCategory_onceToken, &__block_literal_global_142);
  }
  uint64_t v2 = (void *)allMailboxesCategory_category;
  return v2;
}

uint64_t __78__MUISearchSuggestionCategory_MUIAllMailboxesSuggestion__allMailboxesCategory__block_invoke()
{
  id v0 = [MUISearchSuggestionCategory alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 localizedStringForKey:@"All Mailboxes" value:&stru_1F39CB5D8 table:0];
  uint64_t v3 = [(MUISearchSuggestionCategory *)v0 initWithDisplayName:v2];
  id v4 = (void *)allMailboxesCategory_category;
  allMailboxesCategory_category = v3;

  char v5 = (void *)allMailboxesCategory_category;
  return [v5 setParsecCategory:@"content"];
}

@end