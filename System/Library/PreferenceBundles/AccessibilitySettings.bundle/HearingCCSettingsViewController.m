@interface HearingCCSettingsViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (HearingCCSettingsViewController)init;
- (NSMutableArray)includedIdentifiers;
- (NSMutableArray)moreIdentifiers;
- (PSSpecifier)includedModulesGroupSpecifier;
- (PSSpecifier)moreModulesGroupSpecifier;
- (id)_identifierAtIndexPath:(id)a3;
- (id)_identifiersInSection:(unint64_t)a3;
- (id)_specifierNameForOption:(unint64_t)a3;
- (id)_specifiersForIdentifiers:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)_indexForInsertingItemWithIdentifier:(id)a3 intoArray:(id)a4;
- (unint64_t)includedSectionIndex;
- (unint64_t)moreSectionIndex;
- (void)_includedIdentifierAtIndexPath:(id)a3;
- (void)_moreIdentifierAtIndexPath:(id)a3;
- (void)_repopulateModuleData;
- (void)_saveState;
- (void)setIncludedIdentifiers:(id)a3;
- (void)setIncludedModulesGroupSpecifier:(id)a3;
- (void)setIncludedSectionIndex:(unint64_t)a3;
- (void)setMoreIdentifiers:(id)a3;
- (void)setMoreModulesGroupSpecifier:(id)a3;
- (void)setMoreSectionIndex:(unint64_t)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation HearingCCSettingsViewController

- (HearingCCSettingsViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HearingCCSettingsViewController;
  v2 = [(AccessibilitySettingsBaseController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    includedIdentifiers = v2->_includedIdentifiers;
    v2->_includedIdentifiers = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    moreIdentifiers = v2->_moreIdentifiers;
    v2->_moreIdentifiers = v5;

    [(HearingCCSettingsViewController *)v2 _repopulateModuleData];
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HearingCCSettingsViewController;
  [(HearingCCSettingsViewController *)&v3 viewDidLoad];
  [*(id *)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__table] setEditing:1 animated:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    [(HearingCCSettingsViewController *)self setIncludedSectionIndex:0];
    v6 = settingsLocString(@"INCLUDED_MODULES_SECTION_TITLE", @"Accessibility");
    v7 = +[PSSpecifier groupSpecifierWithName:v6];
    [(HearingCCSettingsViewController *)self setIncludedModulesGroupSpecifier:v7];

    objc_super v8 = [(HearingCCSettingsViewController *)self includedModulesGroupSpecifier];
    [v5 addObject:v8];

    v9 = [(HearingCCSettingsViewController *)self includedIdentifiers];
    v10 = [(HearingCCSettingsViewController *)self _specifiersForIdentifiers:v9];
    [v5 addObjectsFromArray:v10];

    [(HearingCCSettingsViewController *)self setMoreSectionIndex:1];
    v11 = settingsLocString(@"MORE_MODULES_SECTION_TITLE", @"Accessibility");
    v12 = +[PSSpecifier groupSpecifierWithName:v11];
    [(HearingCCSettingsViewController *)self setMoreModulesGroupSpecifier:v12];

    v13 = [(HearingCCSettingsViewController *)self moreModulesGroupSpecifier];
    [v5 addObject:v13];

    v14 = [(HearingCCSettingsViewController *)self moreIdentifiers];
    v15 = [(HearingCCSettingsViewController *)self _specifiersForIdentifiers:v14];
    [v5 addObjectsFromArray:v15];

    v16 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)_repopulateModuleData
{
  uint64_t v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_229BB8, &off_229BD0, &off_229BE8, &off_229C00, &off_229C18, &off_229C30, 0);
  v4 = +[HUHearingSettings sharedInstance];
  id v5 = [v4 hearingControlCenterOrder];
  id v6 = [v5 mutableCopy];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __56__HearingCCSettingsViewController__repopulateModuleData__block_invoke;
  v9[3] = &unk_20AEA8;
  id v10 = v6;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v7 = v11;
  id v8 = v6;
  [v3 enumerateObjectsUsingBlock:v9];
  [v8 removeObject:&off_229BB8];
  [v7 removeObject:&off_229BB8];
  [v8 removeObject:&off_229BD0];
  [v7 removeObject:&off_229BD0];
  [(HearingCCSettingsViewController *)self setIncludedIdentifiers:v8];
  [(HearingCCSettingsViewController *)self setMoreIdentifiers:v7];
}

void __56__HearingCCSettingsViewController__repopulateModuleData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)_identifiersInSection:(unint64_t)a3
{
  if ([(HearingCCSettingsViewController *)self includedSectionIndex] == a3)
  {
    id v5 = [(HearingCCSettingsViewController *)self includedIdentifiers];
  }
  else if ([(HearingCCSettingsViewController *)self moreSectionIndex] == a3)
  {
    id v5 = [(HearingCCSettingsViewController *)self moreIdentifiers];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_identifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [v4 row];

  id v7 = [(HearingCCSettingsViewController *)self _identifiersInSection:v5];
  id v8 = [v7 objectAtIndex:v6];

  return v8;
}

- (unint64_t)_indexForInsertingItemWithIdentifier:(id)a3 intoArray:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_39);

  return (unint64_t)v7;
}

int64_t __82__HearingCCSettingsViewController__indexForInsertingItemWithIdentifier_intoArray___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

- (void)_includedIdentifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v16 = [(HearingCCSettingsViewController *)self _identifierAtIndexPath:v4];
  id v5 = [(HearingCCSettingsViewController *)self includedIdentifiers];
  id v6 = [v5 count];

  id v7 = [(HearingCCSettingsViewController *)self moreModulesGroupSpecifier];
  id v8 = [(HearingCCSettingsViewController *)self indexOfSpecifier:v7];
  id v9 = [v4 row];

  uint64_t v10 = (uint64_t)v9 + (void)v8 + 1;
  id v11 = [(HearingCCSettingsViewController *)self includedModulesGroupSpecifier];
  v12 = (char *)[(HearingCCSettingsViewController *)self indexOfSpecifier:v11] + (void)v6 + 1;

  v13 = [(HearingCCSettingsViewController *)self specifierAtIndex:v10];
  v14 = [(HearingCCSettingsViewController *)self moreIdentifiers];
  [v14 removeObject:v16];

  v15 = [(HearingCCSettingsViewController *)self includedIdentifiers];
  [v15 insertObject:v16 atIndex:v6];

  [(HearingCCSettingsViewController *)self beginUpdates];
  [(HearingCCSettingsViewController *)self removeSpecifierAtIndex:v10 animated:1];
  [(HearingCCSettingsViewController *)self insertSpecifier:v13 atIndex:v12 animated:1];
  [(HearingCCSettingsViewController *)self endUpdates];
  [(HearingCCSettingsViewController *)self _saveState];
}

- (void)_moreIdentifierAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HearingCCSettingsViewController *)self _identifierAtIndexPath:v4];
  id v6 = [(HearingCCSettingsViewController *)self moreIdentifiers];
  unint64_t v7 = [(HearingCCSettingsViewController *)self _indexForInsertingItemWithIdentifier:v5 intoArray:v6];

  id v8 = [(HearingCCSettingsViewController *)self includedModulesGroupSpecifier];
  id v9 = [(HearingCCSettingsViewController *)self indexOfSpecifier:v8];
  id v10 = [v4 row];

  uint64_t v11 = (uint64_t)v10 + (void)v9 + 1;
  v12 = [(HearingCCSettingsViewController *)self moreModulesGroupSpecifier];
  v13 = (char *)[(HearingCCSettingsViewController *)self indexOfSpecifier:v12] + v7;

  v14 = [(HearingCCSettingsViewController *)self specifierAtIndex:v11];
  v15 = [(HearingCCSettingsViewController *)self includedIdentifiers];
  [v15 removeObject:v5];

  id v16 = [(HearingCCSettingsViewController *)self moreIdentifiers];
  [v16 insertObject:v5 atIndex:v7];

  v17 = [(HearingCCSettingsViewController *)self table];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __62__HearingCCSettingsViewController__moreIdentifierAtIndexPath___block_invoke;
  v22[3] = &unk_208ED8;
  v22[4] = self;
  v22[5] = v11;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __62__HearingCCSettingsViewController__moreIdentifierAtIndexPath___block_invoke_2;
  v19[3] = &unk_20AEF0;
  v19[4] = self;
  id v20 = v14;
  v21 = v13;
  id v18 = v14;
  [v17 performBatchUpdates:v22 completion:v19];
}

id __62__HearingCCSettingsViewController__moreIdentifierAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifierAtIndex:*(void *)(a1 + 40) animated:1];
}

id __62__HearingCCSettingsViewController__moreIdentifierAtIndexPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) insertSpecifier:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48) animated:1];
  v2 = *(void **)(a1 + 32);

  return [v2 _saveState];
}

- (id)_specifiersForIdentifiers:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __61__HearingCCSettingsViewController__specifiersForIdentifiers___block_invoke;
  v9[3] = &unk_20AEA8;
  void v9[4] = self;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __61__HearingCCSettingsViewController__specifiersForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_specifierNameForOption:", objc_msgSend(a2, "unsignedIntValue"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [objc_alloc((Class)PSSpecifier) initWithName:v4 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_specifierNameForOption:(unint64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0x18uLL:
    case 0x1DuLL:
      id v3 = hearingLocString();
      break;
    case 0x1EuLL:
      id v3 = paLocString();
      break;
    case 0x1FuLL:
      id v3 = settingsLocString(@"PERSONAL_AUDIO", @"Accessibility");
      break;
    default:
      break;
  }

  return v3;
}

- (void)_saveState
{
  v2 = [(HearingCCSettingsViewController *)self includedIdentifiers];
  id v4 = [v2 mutableCopy];

  [v4 insertObject:&off_229BD0 atIndex:0];
  [v4 insertObject:&off_229BB8 atIndex:0];
  id v3 = +[HUHearingSettings sharedInstance];
  [v3 setHearingControlCenterOrder:v4];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "section", a3);
  return v5 == (id)[(HearingCCSettingsViewController *)self includedSectionIndex];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 == (id)[(HearingCCSettingsViewController *)self includedSectionIndex])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v5 section];
    char v7 = v8 == (id)[(HearingCCSettingsViewController *)self moreSectionIndex];
  }

  return v7;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v13 = [(HearingCCSettingsViewController *)self _identifierAtIndexPath:v8];
  id v9 = [v8 section];

  id v10 = [(HearingCCSettingsViewController *)self _identifiersInSection:v9];
  [v10 removeObject:v13];
  uint64_t v11 = -[HearingCCSettingsViewController _identifiersInSection:](self, "_identifiersInSection:", [v7 section]);
  id v12 = [v7 row];

  [v11 insertObject:v13 atIndex:v12];
  [(HearingCCSettingsViewController *)self reloadSpecifiers];
  [(HearingCCSettingsViewController *)self _saveState];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)[(HearingCCSettingsViewController *)self includedSectionIndex])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HearingCCSettingsViewController;
    BOOL v9 = [(HearingCCSettingsViewController *)&v11 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if (a4 == 1)
    {
      [(HearingCCSettingsViewController *)self _moreIdentifierAtIndexPath:v8];
    }
    else if (a4 == 2)
    {
      [(HearingCCSettingsViewController *)self _includedIdentifierAtIndexPath:v8];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 == (id)[(HearingCCSettingsViewController *)self includedSectionIndex])
  {
    int64_t v7 = 1;
  }
  else
  {
    id v8 = [v5 section];
    int64_t v7 = 2 * (v8 == (id)[(HearingCCSettingsViewController *)self moreSectionIndex]);
  }

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 section];
  if (v9 >= (id)[(HearingCCSettingsViewController *)self includedSectionIndex])
  {
    id v12 = [v8 section];
    id v10 = v8;
    if (v12 < (id)[(HearingCCSettingsViewController *)self moreSectionIndex]) {
      goto LABEL_6;
    }
    objc_super v11 = [(HearingCCSettingsViewController *)self _identifierAtIndexPath:v7];
    id v13 = [(HearingCCSettingsViewController *)self moreIdentifiers];
    unint64_t v14 = [(HearingCCSettingsViewController *)self _indexForInsertingItemWithIdentifier:v11 intoArray:v13];

    id v10 = +[NSIndexPath indexPathForRow:v14 inSection:[(HearingCCSettingsViewController *)self moreSectionIndex]];
  }
  else
  {
    id v10 = +[NSIndexPath indexPathForRow:0 inSection:[(HearingCCSettingsViewController *)self includedSectionIndex]];
    objc_super v11 = v8;
  }

LABEL_6:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (unint64_t)includedSectionIndex
{
  return self->_includedSectionIndex;
}

- (void)setIncludedSectionIndex:(unint64_t)a3
{
  self->_includedSectionIndex = a3;
}

- (PSSpecifier)includedModulesGroupSpecifier
{
  return self->_includedModulesGroupSpecifier;
}

- (void)setIncludedModulesGroupSpecifier:(id)a3
{
}

- (NSMutableArray)includedIdentifiers
{
  return self->_includedIdentifiers;
}

- (void)setIncludedIdentifiers:(id)a3
{
}

- (unint64_t)moreSectionIndex
{
  return self->_moreSectionIndex;
}

- (void)setMoreSectionIndex:(unint64_t)a3
{
  self->_moreSectionIndex = a3;
}

- (PSSpecifier)moreModulesGroupSpecifier
{
  return self->_moreModulesGroupSpecifier;
}

- (void)setMoreModulesGroupSpecifier:(id)a3
{
}

- (NSMutableArray)moreIdentifiers
{
  return self->_moreIdentifiers;
}

- (void)setMoreIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreIdentifiers, 0);
  objc_storeStrong((id *)&self->_moreModulesGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);

  objc_storeStrong((id *)&self->_includedModulesGroupSpecifier, 0);
}

@end