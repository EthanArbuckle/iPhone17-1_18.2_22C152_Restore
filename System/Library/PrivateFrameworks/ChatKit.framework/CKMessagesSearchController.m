@interface CKMessagesSearchController
+ (BOOL)supportsMenuInteraction;
+ (BOOL)supportsQuicklookForResult:(id)a3;
+ (Class)cellClassForMode:(unint64_t)a3;
+ (id)reuseIdentifierForMode:(unint64_t)a3;
+ (id)sectionIdentifier;
+ (id)sectionTitle;
- (BOOL)_shouldGroupResult:(id)a3 withOtherResult:(id)a4;
- (BOOL)applyLayoutMarginsToLayoutGroup;
- (NSDirectionalEdgeInsets)additionalGroupInsets;
- (double)interGroupSpacing;
- (double)widthForDeterminingAvatarVisibility;
- (id)_cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5;
- (id)customLayoutSectionForEnvironment:(id)a3;
- (id)fetchAttributes;
- (id)filterQueries;
- (id)queryAttributesForText:(id)a3;
- (unint64_t)maxResultsForMode:(unint64_t)a3;
- (unint64_t)searchTokenContentType;
- (void)searchWithText:(id)a3 mode:(unint64_t)a4;
@end

@implementation CKMessagesSearchController

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)fetchAttributes
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isSearchImprovementsEnabled];

  uint64_t v4 = *MEMORY[0x1E4F235C0];
  if (v3)
  {
    uint64_t v17 = *MEMORY[0x1E4F235F8];
    uint64_t v18 = v4;
    uint64_t v5 = *MEMORY[0x1E4F22B30];
    uint64_t v19 = *MEMORY[0x1E4F22C38];
    uint64_t v20 = v5;
    uint64_t v21 = *MEMORY[0x1E4F22B00];
    v22 = @"com_apple_mobilesms_mentionedAddresses";
    uint64_t v6 = *MEMORY[0x1E4F23148];
    uint64_t v23 = *MEMORY[0x1E4F23080];
    uint64_t v24 = v6;
    uint64_t v25 = *MEMORY[0x1E4F23598];
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v17;
    uint64_t v9 = 9;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F235F8];
    uint64_t v14 = v4;
    uint64_t v10 = *MEMORY[0x1E4F23598];
    uint64_t v15 = *MEMORY[0x1E4F22C38];
    uint64_t v16 = v10;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v13;
    uint64_t v9 = 4;
  }
  v11 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  return v11;
}

- (id)queryAttributesForText:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F235C0];
  v6[0] = *MEMORY[0x1E4F235F8];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)filterQueries
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isSemanticSearchEnabled];

  uint64_t v4 = *MEMORY[0x1E4F23148];
  uint64_t v5 = [NSString stringWithFormat:@"%@ != \"%@\", *MEMORY[0x1E4F23148], @"tpbck""];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    v12[0] = v5;
    v7 = [NSString stringWithFormat:@"%@ != \"%@\", *MEMORY[0x1E4F22D28], @"attachmentDomain""];
    v12[1] = v7;
    v8 = [NSString stringWithFormat:@"%@ == \"%@\", v4, @"msg""];
    v12[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  }
  else
  {
    uint64_t v11 = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  }

  return v9;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  if (a4 == 1)
  {
    [(CKMessageTypeSearchController *)self searchEnded];
  }
  else
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    v6.receiver = self;
    v6.super_class = (Class)CKMessagesSearchController;
    -[CKMessageTypeSearchController searchWithText:mode:](&v6, sel_searchWithText_mode_, a3);
  }
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  if ([(CKSearchController *)self mode] < 2) {
    return 3;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSearchController;
  return [(CKMessageTypeSearchController *)&v6 maxResultsForMode:a3];
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

+ (id)sectionTitle
{
  v2 = CKFrameworkBundle();
  int v3 = [v2 localizedStringForKey:@"SEARCH_MESSAGES_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (id)sectionIdentifier
{
  return @"MessageSearchSection";
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  int v3 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v4 = [v3 isSearchImprovementsEnabled];

  uint64_t v5 = off_1E561DC98;
  if (!v4) {
    uint64_t v5 = off_1E561D6B8;
  }
  objc_super v6 = [(__objc2_class *)*v5 reuseIdentifier];

  return v6;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  int v3 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  [v3 isSearchImprovementsEnabled];

  int v4 = objc_opt_class();

  return (Class)v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 0;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isSearchImprovementsEnabled];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    uint64_t v8 = [MEMORY[0x1E4F42608] estimatedDimension:100.0];
    uint64_t v9 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v8];
    uint64_t v10 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v9];
    uint64_t v11 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v7 heightDimension:v8];
    v12 = (void *)MEMORY[0x1E4F42618];
    v26[0] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v14 = [v12 verticalGroupWithLayoutSize:v11 subitems:v13];

    uint64_t v15 = [MEMORY[0x1E4F42630] sectionWithGroup:v14];
    objc_msgSend(v15, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v16 = [v4 container];
      [v16 contentSize];
      double v18 = v17;
      uint64_t v19 = +[CKUIBehavior sharedBehaviors];
      [v19 snapToMinConversationListWidth];
      BOOL v21 = v18 >= v20;
    }
    else
    {
      BOOL v21 = 1;
    }
    v22 = [(CKSearchController *)self delegate];
    int v23 = [v22 shouldInsetResultsForSearchController:self];

    if (v23) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = 4;
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F43110]) initWithAppearanceStyle:v24 layoutEnvironment:v4];
    [v7 setSeparatorStyle:v21];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F43108]) initWithConfiguration:v7 layoutEnvironment:v4];
  }

  return v15;
}

- (double)interGroupSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 searchMessagesInterGroupSpacing];
  double v4 = v3;

  return v4;
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSearchImprovementsEnabled];

  if (v4)
  {
    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    [v5 searchMessagesSectionInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    uint64_t v14 = [(CKSearchController *)self delegate];
    [v14 parentMarginInsetsForSearchController:self];
    double v7 = v15;
    double v11 = v16;

    double v13 = 0.0;
    double v9 = 0.0;
  }
  if ([(CKSearchController *)self mode] != 1)
  {
    double v17 = [(CKSearchController *)self results];
    uint64_t v18 = [v17 count];

    if (!v18)
    {
      double v7 = *MEMORY[0x1E4F424F0];
      double v9 = *(double *)(MEMORY[0x1E4F424F0] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F424F0] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F424F0] + 24);
    }
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.trailing = v22;
  result.bottom = v21;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  double v8 = (void *)MEMORY[0x1E4F6E778];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v8 sharedFeatureFlags];
  LODWORD(v8) = [v12 isSearchImprovementsEnabled];

  if (v8)
  {
    double v13 = [(CKMessagesSearchController *)self _cellForItemInCollectionView:v11 atIndexPath:v10 withIdentifier:v9];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CKMessagesSearchController;
    double v13 = [(CKSearchController *)&v18 cellForItemInCollectionView:v11 atIndexPath:v10 withIdentifier:v9];

    uint64_t v14 = [(CKSearchController *)self delegate];
    objc_msgSend(v13, "setShouldInsetResults:", objc_msgSend(v14, "shouldInsetResultsForSearchController:", self));

    double v15 = [v13 topHairline];
    [v15 setHidden:0];

    double v16 = [v13 bottomHairline];
    [v16 setHidden:1];

    [v13 setDelegate:self];
  }

  return v13;
}

- (id)_cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 row];
  id v10 = objc_msgSend((id)objc_opt_class(), "reuseIdentifierForMode:", -[CKSearchController mode](self, "mode"));
  id v11 = [(CKSearchController *)self results];
  double v12 = [v8 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];

  if (v9 >= (unint64_t)[v11 count])
  {
    double v13 = 0;
  }
  else
  {
    double v13 = [v11 objectAtIndex:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = v12;
    unint64_t v63 = [(CKSearchController *)self mode];
    uint64_t v59 = [v7 row];
    uint64_t v52 = [v7 row];
    uint64_t v53 = [v11 count];
    int v14 = [v13 isFromMe];
    if (v9 < 1 || v9 - 1 >= (unint64_t)[v11 count])
    {
      BOOL v17 = 0;
    }
    else
    {
      [v11 objectAtIndex:v9 - 1];
      v16 = int v15 = v14;
      BOOL v17 = [(CKMessagesSearchController *)self _shouldGroupResult:v13 withOtherResult:v16];

      int v14 = v15;
    }
    unint64_t v19 = v9 + 1;
    v62 = v10;
    if (v19 >= [v11 count])
    {
      int v21 = 1;
    }
    else
    {
      double v20 = [v11 objectAtIndex:v19];
      int v21 = ![(CKMessagesSearchController *)self _shouldGroupResult:v13 withOtherResult:v20];
    }
    int v22 = !v17;
    v61 = v12;
    int v57 = v21;
    BOOL v58 = v17;
    int v49 = v14;
    if (v14)
    {
      int v50 = 0;
    }
    else
    {
      int v23 = [v13 conversation];
      int v50 = [v23 isGroupConversation];
    }
    uint64_t v51 = v53 - 1;
    uint64_t v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v25 = [v13 item];
    uint64_t v26 = [v25 attributeSet];
    v27 = [v26 contentCreationDate];
    char v28 = [v24 isDateInToday:v27];

    int v29 = CKIsRunningInMacCatalyst();
    BOOL v30 = v63 == 2;
    if (v29) {
      BOOL v30 = 0;
    }
    if (v59) {
      int v31 = v22;
    }
    else {
      int v31 = 0;
    }
    char v32 = v30 & v31;
    char v56 = v22;
    id v55 = v7;
    char v54 = v22 | v28;
    if (v63 == 2)
    {
      char v33 = v50;
      double v34 = 10.0;
      double v35 = 4.0;
      if (!v49) {
        double v35 = 10.0;
      }
      if (v50) {
        double v34 = 8.0;
      }
      char v36 = v57;
      BOOL v37 = v58;
      if (!v58) {
        double v34 = 0.0;
      }
      if (v59) {
        int v38 = v30 & v31;
      }
      else {
        int v38 = 1;
      }
      if (v38) {
        double v39 = 12.0;
      }
      else {
        double v39 = v34;
      }
      if (v57) {
        double v40 = 18.0;
      }
      else {
        double v40 = v35;
      }
      uint64_t v42 = v51;
      uint64_t v41 = v52;
    }
    else
    {
      if (v59) {
        double v39 = 0.0;
      }
      else {
        double v39 = 4.0;
      }
      int v43 = CKIsRunningInMacCatalyst();
      uint64_t v42 = v51;
      uint64_t v41 = v52;
      if (v52 == v51)
      {
        double v44 = 16.0;
        double v45 = 20.0;
      }
      else
      {
        double v44 = 12.0;
        double v45 = 16.0;
      }
      if (v43) {
        double v40 = v44;
      }
      else {
        double v40 = v45;
      }
      char v36 = v57;
      BOOL v37 = v58;
      char v33 = v50;
    }
    BOOL v46 = v41 == v42;
    v47 = [(CKSearchController *)self currentSearchText];
    v64[0] = v37;
    v64[1] = v59 == 0;
    v64[2] = v46;
    v64[3] = v36;
    v64[4] = v56;
    v64[5] = v33;
    v64[6] = v54;
    v64[7] = v32;
    double v65 = v39;
    double v66 = v40;
    [v60 configureWithQueryResult:v13 searchText:v47 mode:v63 visibilityContext:v64];

    double v12 = v61;
    id v10 = v62;
    id v7 = v55;
  }
  else
  {
    objc_super v18 = [(CKSearchController *)self currentSearchText];
    objc_msgSend(v12, "configureWithQueryResult:searchText:mode:", v13, v18, -[CKSearchController mode](self, "mode"));
  }

  return v12;
}

- (BOOL)_shouldGroupResult:(id)a3 withOtherResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 conversation];
  id v8 = [v7 chat];
  uint64_t v9 = [v8 guid];

  id v10 = [v6 conversation];
  id v11 = [v10 chat];
  double v12 = [v11 guid];

  if ([v9 isEqualToString:v12])
  {
    double v13 = [v5 item];
    int v14 = [v13 attributeSet];
    int v15 = [v14 contentCreationDate];

    double v16 = [v6 item];
    BOOL v17 = [v16 attributeSet];
    objc_super v18 = [v17 contentCreationDate];

    unint64_t v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v20 = [v19 isDate:v15 inSameDayAsDate:v18];
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (double)widthForDeterminingAvatarVisibility
{
  v2 = [(CKSearchController *)self delegate];
  [v2 widthForDeterminingAvatarVisibility];
  double v4 = v3;

  return v4;
}

@end