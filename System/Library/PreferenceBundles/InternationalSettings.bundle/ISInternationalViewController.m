@interface ISInternationalViewController
+ (id)currentLocale;
+ (id)deviceLanguageFrom:(id)a3;
+ (id)deviceLanguageIdentifier;
+ (id)localizedRestartStringForCurrentDevice;
+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3;
+ (id)preferredLanguages;
+ (id)textColor;
- (BOOL)canEditLanguageAtIndexPath:(id)a3 tableView:(id)a4;
- (BOOL)indexPathIsInPreferredLanguagesGroup:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (ISInternationalViewController)init;
- (NSMutableArray)removedGroupsAbovePreferredLanguagesInEditing;
- (NSMutableArray)removedGroupsBelowPreferredLanguagesInEditing;
- (NSMutableArray)updatedAppleLanguages;
- (PSSpecifier)addLanguageSpecifier;
- (id)numberingSystem:(id)a3;
- (id)numberingSystemsShortTitles;
- (id)numberingSystemsTitles;
- (id)numberingSystemsValues;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)topLanguageFromArray:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)sectionIndexForTableView:(id)a3 fromSuperSectionIndex:(unint64_t)a4;
- (void)addLanguagesToSpecifiers:(id)a3;
- (void)cancelEdits;
- (void)initializeUpdatedAppleLanguagesIfNeeded;
- (void)moveSpecifierAtIndexPath:(id)a3 toIndexPath:(id)a4 moveRow:(BOOL)a5;
- (void)setAddLanguageSpecifier:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNumberingSystem:(id)a3 specifier:(id)a4;
- (void)setRemovedGroupsAbovePreferredLanguagesInEditing:(id)a3;
- (void)setRemovedGroupsBelowPreferredLanguagesInEditing:(id)a3;
- (void)setUpdatedAppleLanguages:(id)a3;
- (void)showLanguageSheet:(id)a3;
- (void)showLocaleSheet:(id)a3;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)toggleEdit;
- (void)updateCell:(id)a3 forPreferredLanguageAtIndex:(unint64_t)a4;
- (void)updateSpecifiersForLocaleRegionChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation ISInternationalViewController

- (ISInternationalViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ISInternationalViewController;
  v2 = [(ISInternationalViewController *)&v8 init];
  v3 = [(id)objc_opt_class() preferredLanguages];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    v5 = [(ISInternationalViewController *)v2 editButtonItem];
    v6 = [(ISInternationalViewController *)v2 navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_30FF0);
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ISInternationalViewController;
  [(ISInternationalViewController *)&v4 viewDidLoad];
  v3 = [(ISInternationalViewController *)self table];
  [v3 _setAllowsReorderingWhenNotEditing:1];
}

+ (id)preferredLanguages
{
  return +[NSLocale preferredLanguages];
}

+ (id)currentLocale
{
  return +[NSLocale preferredLocale];
}

+ (id)deviceLanguageIdentifier
{
  return +[NSLocale _deviceLanguage];
}

+ (id)deviceLanguageFrom:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSBundle bundleWithIdentifier:@"com.apple.Foundation"];
  v5 = [v4 localizations];

  v6 = +[NSBundle preferredLocalizationsFromArray:v5 forPreferences:v3];

  v7 = [v6 firstObject];

  objc_super v8 = +[NSLocale canonicalLanguageIdentifierFromString:v7];

  return v8;
}

- (id)topLanguageFromArray:(id)a3
{
  id v3 = [a3 firstObject];
  if (v3)
  {
    objc_super v4 = +[NSLocale renderableUILanguages];
    unsigned __int8 v5 = [v4 containsObject:v3];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = +[NSLocale baseLanguageFromLanguage:v3];

      id v3 = (void *)v6;
    }
  }

  return v3;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)addLanguagesToSpecifiers:(id)a3
{
  id v24 = a3;
  objc_super v4 = [(id)objc_opt_class() preferredLanguages];
  if ([(ISInternationalViewController *)self isEditing])
  {
    unsigned __int8 v5 = [(ISInternationalViewController *)self updatedAppleLanguages];

    if (v5)
    {
      uint64_t v6 = [(ISInternationalViewController *)self updatedAppleLanguages];

      objc_super v4 = (void *)v6;
    }
  }
  if ((unint64_t)[v4 count] >= 2
    && ([(ISInternationalViewController *)self isEditing] & 1) == 0)
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"toggleEdit"];
    objc_super v8 = [(ISInternationalViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  v9 = (char *)[v24 indexOfSpecifierWithID:@"PREFERRED_LANGUAGE_GROUP"];
  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    id v11 = [v4 count];
    if ((uint64_t)v11 >= 1)
    {
      v12 = v10 + 1;
      unint64_t v13 = (unint64_t)v11 + 1;
      uint64_t v22 = PSCellClassKey;
      v23 = v12;
      do
      {
        v14 = [v4 objectAtIndexedSubscript:v13 - 2];
        v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:4 edit:0];

        v16 = [v4 objectAtIndexedSubscript:v13 - 2];
        v17 = +[NSLocale localeWithLocaleIdentifier:v16];
        v18 = [v17 selectableScriptCodes];
        id v19 = [v18 count];

        if ((unint64_t)v19 >= 2)
        {
          v20 = [v4 objectAtIndexedSubscript:v13 - 2];
          uint64_t v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          v15 = (void *)v21;
        }
        [v15 setProperty:objc_opt_class() forKey:v22];
        [v24 insertObject:v15 atIndex:v23];

        --v13;
      }
      while (v13 > 1);
    }
  }
}

- (BOOL)indexPathIsInPreferredLanguagesGroup:(id)a3
{
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = a3;
  [(ISInternationalViewController *)self getGroup:&v7 row:0 ofSpecifierID:@"PREFERRED_LANGUAGE_GROUP"];
  id v5 = [v4 section];

  return v5 == (id)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ISInternationalViewController *)self isEditing])
  {
    id v8 = [v7 row];
    id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"Cell"];
    [(ISInternationalViewController *)self updateCell:v9 forPreferredLanguageAtIndex:v8];
  }
  else
  {
    id v10 = [(ISInternationalViewController *)self indexForIndexPath:v7];
    id v11 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v10];
    if ([(ISInternationalViewController *)self indexPathIsInPreferredLanguagesGroup:v7])
    {
      v18.receiver = self;
      v18.super_class = (Class)ISInternationalViewController;
      id v9 = [(ISInternationalViewController *)&v18 tableView:v6 cellForRowAtIndexPath:v7];
      v12 = [v11 identifier];
      unsigned int v13 = [v12 isEqualToString:@"ADD_PREFERRED_LANGUAGE"];

      if (v13)
      {
        v14 = [v11 name];
        v15 = [v9 textLabel];
        [v15 setText:v14];
      }
      else
      {
        -[ISInternationalViewController updateCell:forPreferredLanguageAtIndex:](self, "updateCell:forPreferredLanguageAtIndex:", v9, [v7 indexAtPosition:1]);
      }
    }
    else
    {

      v17.receiver = self;
      v17.super_class = (Class)ISInternationalViewController;
      id v9 = [(ISInternationalViewController *)&v17 tableView:v6 cellForRowAtIndexPath:v7];
    }
  }

  return v9;
}

- (void)updateCell:(id)a3 forPreferredLanguageAtIndex:(unint64_t)a4
{
  id v66 = a3;
  id v6 = [(ISInternationalViewController *)self updatedAppleLanguages];
  if (!v6)
  {
    id v6 = [(id)objc_opt_class() preferredLanguages];
  }
  if ((unint64_t)[v6 count] > a4)
  {
    id v7 = [v6 objectAtIndexedSubscript:a4];
    id v8 = [(id)objc_opt_class() currentLocale];
    id v9 = [v8 regionCode];

    id v10 = +[NSLocale localeWithLocaleIdentifier:v7];
    id v11 = [v10 regionCode];

    v64 = v10;
    if (v11)
    {
      id v12 = [v10 regionCode];
    }
    else
    {
      id v12 = v9;
    }
    unsigned int v13 = v12;
    id v14 = v7;
    v15 = v14;
    if ([v13 isEqualToString:v9])
    {
      v15 = +[NSLocale baseLanguageFromLanguage:v14];
    }
    if (+[IntlUtility canCapitalizeAutonymForLanguage:v14])
    {
      if (+[IntlUtility forceCapitalizationInLanguageLists])uint64_t v16 = 4; {
      else
      }
        uint64_t v16 = 3;
    }
    else
    {
      uint64_t v16 = 3;
    }
    v60 = v13;
    v61 = v9;
    objc_super v17 = +[NSLocale localeWithLocaleIdentifier:v14];
    uint64_t v18 = [v17 localizedStringForLanguage:v15 context:v16];

    id v19 = +[NSMutableDictionary dictionaryWithObject:v14 forKey:kCTLanguageAttributeName];
    v20 = [(id)objc_opt_class() textColor];

    if (v20)
    {
      uint64_t v21 = [(id)objc_opt_class() textColor];
      [v19 setObject:v21 forKeyedSubscript:NSForegroundColorAttributeName];
    }
    v63 = v19;
    id v22 = [objc_alloc((Class)NSAttributedString) initWithString:v18 attributes:v19];
    v23 = [v66 textLabel];
    v62 = v22;
    [v23 setAttributedText:v22];

    id v24 = +[NSLocale baseLanguageFromLanguage:v15];
    unint64_t deviceLanguageIndex = self->_deviceLanguageIndex;
    v65 = (void *)v18;
    if (deviceLanguageIndex >= a4)
    {
      v26 = +[NSLocale systemLanguages];
      unsigned int v27 = [v26 containsObject:v15];

      if (!v27)
      {
        if (([v24 isEqualToString:v15] & 1) == 0)
        {
          v34 = [(id)objc_opt_class() deviceLanguageIdentifier];
          if ([v24 isEqualToString:v34])
          {
            v35 = v24;
            unint64_t v36 = self->_deviceLanguageIndex;

            BOOL v37 = v36 >= a4;
            id v24 = v35;
            if (v37)
            {
              v38 = +[IPLanguage languageWithIdentifier:v35];
              v55 = [v38 localizedStringForName];

              v58 = +[NSBundle bundleForClass:objc_opt_class()];
              v56 = [(id)objc_opt_class() modelSpecificLocalizedStringKeyForKey:@"DEVICE_LANGUAGE_%@"];
              v39 = [v58 localizedStringForKey:v56 value:&stru_31478 table:@"InternationalSettings"];
              v40 = +[NSString stringWithFormat:v55];
              v41 = [v66 detailTextLabel];
              [v41 setText:v40];

              self->_unint64_t deviceLanguageIndex = a4;
            }
          }
          else
          {
          }
        }
LABEL_28:
        v42 = [v66 detailTextLabel];
        uint64_t v43 = [v42 text];
        if (v43)
        {
          v44 = (void *)v43;
          v46 = v60;
          v45 = v61;
        }
        else
        {
          v59 = v24;
          v47 = +[NSLocale _deviceLanguage];
          v48 = +[NSLocale baseLanguageFromLanguage:v47];
          unsigned __int8 v49 = [v59 isEqualToString:v48];

          id v24 = v59;
          v46 = v60;
          v45 = v61;
          if (v49) {
            goto LABEL_32;
          }
          v50 = +[IPLanguage languageWithIdentifier:v15];
          v42 = [v50 localizedStringForName];

          if ([v65 isEqualToString:v42]) {
            v51 = 0;
          }
          else {
            v51 = v42;
          }
          v52 = [v66 detailTextLabel];
          [v52 setText:v51];

          v53 = [(id)objc_opt_class() textColor];

          if (!v53)
          {
            id v24 = v59;
            goto LABEL_31;
          }
          v44 = [(id)objc_opt_class() textColor];
          v54 = [v66 detailTextLabel];
          [v54 setTextColor:v44];

          id v24 = v59;
        }

LABEL_31:
LABEL_32:

        goto LABEL_33;
      }
      unint64_t deviceLanguageIndex = self->_deviceLanguageIndex;
    }
    if (deviceLanguageIndex >= a4)
    {
      v28 = [(id)objc_opt_class() deviceLanguageIdentifier];
      unsigned int v29 = [v15 isEqualToString:v28];

      if (v29)
      {
        v57 = +[NSBundle bundleForClass:objc_opt_class()];
        v30 = [(id)objc_opt_class() modelSpecificLocalizedStringKeyForKey:@"DEVICE_LANGUAGE"];
        [v57 localizedStringForKey:v30 value:&stru_31478 table:@"InternationalSettings"];
        v32 = v31 = v24;
        v33 = [v66 detailTextLabel];
        [v33 setText:v32];

        id v24 = v31;
        self->_unint64_t deviceLanguageIndex = a4;
      }
    }
    goto LABEL_28;
  }
LABEL_33:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(ISInternationalViewController *)self isEditing])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned int v7 = [(ISInternationalViewController *)self indexPathIsInPreferredLanguagesGroup:v5];
    id v8 = [(ISInternationalViewController *)self specifierAtIndexPath:v5];
    id v9 = [v8 identifier];
    unsigned __int8 v10 = [v9 isEqualToString:@"ADD_PREFERRED_LANGUAGE"];

    unsigned __int8 v6 = 0;
    if (v7 && (v10 & 1) == 0)
    {
      id v11 = [(id)objc_opt_class() preferredLanguages];
      id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v15 = v12;
      unsigned int v13 = +[NSArray arrayWithObjects:&v15 count:1];
      unsigned __int8 v6 = +[IPLanguageListManager canRemoveLanguages:v13 fromPreferredLanguages:v11];
    }
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(ISInternationalViewController *)self isEditing])
  {
    char v6 = 1;
  }
  else
  {
    unsigned __int8 v7 = [(ISInternationalViewController *)self indexPathIsInPreferredLanguagesGroup:v5];
    id v8 = [(ISInternationalViewController *)self specifierAtIndexPath:v5];
    id v9 = [v8 identifier];
    unsigned __int8 v10 = [v9 isEqualToString:@"ADD_PREFERRED_LANGUAGE"];

    char v6 = v7 & (v10 ^ 1);
  }

  return v6;
}

- (void)initializeUpdatedAppleLanguagesIfNeeded
{
  id v3 = [(ISInternationalViewController *)self updatedAppleLanguages];
  id v4 = [v3 count];

  if (!v4)
  {
    id v6 = [(id)objc_opt_class() preferredLanguages];
    if (![v6 count]) {
      sub_20D0C();
    }
    id v5 = [v6 mutableCopy];
    [(ISInternationalViewController *)self setUpdatedAppleLanguages:v5];
  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  [(ISInternationalViewController *)self initializeUpdatedAppleLanguagesIfNeeded];
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  [(ISInternationalViewController *)self getGroup:&v19 row:0 ofSpecifierID:@"PREFERRED_LANGUAGE_GROUP"];
  id v7 = [v6 section];
  if (v7 == (id)v19)
  {
    id v8 = (char *)[v6 row];

    id v9 = [(ISInternationalViewController *)self updatedAppleLanguages];
    unsigned __int8 v10 = (char *)[v9 count];

    if (v8 >= v10)
    {
      id v11 = [(ISInternationalViewController *)self updatedAppleLanguages];
      id v8 = (char *)[v11 count] - 1;
    }
    uint64_t v12 = v19;
    unsigned int v13 = v8;
    goto LABEL_7;
  }
  id v14 = [v6 section];

  uint64_t v12 = v19;
  if ((uint64_t)v14 < v19)
  {
    unsigned int v13 = 0;
LABEL_7:
    v15 = +[NSIndexPath indexPathForRow:v13 inSection:v12];
    goto LABEL_9;
  }
  uint64_t v16 = [(ISInternationalViewController *)self updatedAppleLanguages];
  objc_super v17 = (char *)[v16 count];
  v15 = +[NSIndexPath indexPathForRow:v17 - 1 inSection:v19];

LABEL_9:

  return v15;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(ISInternationalViewController *)self moveSpecifierAtIndexPath:v7 toIndexPath:v8 moveRow:0];
  if (([(ISInternationalViewController *)self isEditing] & 1) == 0
    && ([v8 isEqual:v7] & 1) == 0)
  {
    id v9 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
    unsigned __int8 v10 = +[UIDevice currentDevice];
    id v11 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, objc_msgSend(v10, "sf_isiPad"));

    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v13 = [v12 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10DF0;
    v19[3] = &unk_31018;
    v19[4] = self;
    id v20 = v8;
    id v21 = v7;
    id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v19];

    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10E38;
    v18[3] = &unk_30EC0;
    v18[4] = self;
    objc_super v17 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v18];

    [v11 addAction:v14];
    [v11 addAction:v17];
    [(ISInternationalViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

- (void)moveSpecifierAtIndexPath:(id)a3 toIndexPath:(id)a4 moveRow:(BOOL)a5
{
  BOOL v5 = a5;
  id v27 = a3;
  id v8 = a4;
  [(ISInternationalViewController *)self initializeUpdatedAppleLanguagesIfNeeded];
  id v9 = [v27 row];
  id v10 = [v8 row];
  id v11 = [(ISInternationalViewController *)self updatedAppleLanguages];
  id v12 = [v11 count];

  if (!v12) {
    goto LABEL_21;
  }
  unsigned int v13 = [(ISInternationalViewController *)self updatedAppleLanguages];
  if (v9 >= [v13 count]) {
    sub_20DBC();
  }

  id v14 = [(ISInternationalViewController *)self updatedAppleLanguages];
  if (v10 >= [v14 count]) {
    sub_20D90();
  }

  v15 = [(ISInternationalViewController *)self updatedAppleLanguages];
  if (v9 < [v15 count])
  {
    uint64_t v16 = [(ISInternationalViewController *)self updatedAppleLanguages];
    id v17 = [v16 count];

    if (v10 >= v17) {
      goto LABEL_8;
    }
    uint64_t v18 = [(ISInternationalViewController *)self updatedAppleLanguages];
    v15 = [v18 objectAtIndexedSubscript:v9];

    uint64_t v19 = [(ISInternationalViewController *)self updatedAppleLanguages];
    [v19 removeObjectAtIndex:v9];

    id v20 = [(ISInternationalViewController *)self updatedAppleLanguages];
    [v20 insertObject:v15 atIndex:v10];
  }
LABEL_8:
  id v21 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if ([*v21 count])
  {
    id v22 = [(ISInternationalViewController *)self indexForIndexPath:v27];
    id v23 = [(ISInternationalViewController *)self indexForIndexPath:v8];
    if (v22 >= [*v21 count]) {
      sub_20D64();
    }
    if (v22 < [*v21 count])
    {
      id v24 = [(ISInternationalViewController *)self specifierAtIndex:v22];
      if (v24)
      {
        id v25 = [*v21 mutableCopy];
        if (v23 >= [v25 count]) {
          sub_20D38();
        }
        id v26 = [v25 count];
        if (v5)
        {
          if (v23 < v26)
          {
            [(ISInternationalViewController *)self removeSpecifierAtIndex:v22 animated:1];
            [(ISInternationalViewController *)self insertSpecifier:v24 atIndex:v23 animated:1];
          }
        }
        else
        {
          if (v23 < v26)
          {
            [v25 removeObjectAtIndex:v22];
            [v25 insertObject:v24 atIndex:v23];
          }
          objc_storeStrong(v21, v25);
        }
      }
    }
  }
LABEL_21:
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"DELETE" value:&stru_31478 table:@"InternationalSettings"];
  unsigned int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_11280;
  uint64_t v16 = &unk_31090;
  id v17 = self;
  id v18 = v5;
  id v8 = v5;
  id v9 = +[UIContextualAction contextualActionWithStyle:1 title:v7 handler:&v13];

  uint64_t v19 = v9;
  id v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1, v13, v14, v15, v16, v17);
  id v11 = +[UISwipeActionsConfiguration configurationWithActions:v10];

  return v11;
}

- (BOOL)canEditLanguageAtIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ISInternationalViewController *)self isEditing]
    && ([(ISInternationalViewController *)self updatedAppleLanguages],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = [(ISInternationalViewController *)self updatedAppleLanguages];
  }
  else
  {
    id v10 = [(id)objc_opt_class() preferredLanguages];
  }
  id v11 = [v6 row];
  if (v11 >= [v10 count]) {
    sub_20E14();
  }
  id v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  uint64_t v16 = v12;
  unsigned int v13 = +[NSArray arrayWithObjects:&v16 count:1];
  unsigned __int8 v14 = +[IPLanguageListManager canRemoveLanguages:v13 fromPreferredLanguages:v10];

  return v14;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(ISInternationalViewController *)self canEditLanguageAtIndexPath:a4 tableView:a3];
}

- (void)toggleEdit
{
  id v3 = [(ISInternationalViewController *)self table];
  unsigned int v4 = [v3 isEditing];

  id v5 = self;
  if (!v4)
  {
    uint64_t v11 = 1;
LABEL_8:
    [(ISInternationalViewController *)v5 setEditing:v11 animated:1];
    goto LABEL_26;
  }
  id v6 = [(ISInternationalViewController *)self updatedAppleLanguages];
  id v7 = [v6 count];

  id v5 = self;
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [(id)objc_opt_class() preferredLanguages];
  if (![v8 count]) {
    sub_20E40();
  }
  id v9 = [(ISInternationalViewController *)self updatedAppleLanguages];
  unsigned __int8 v10 = [v8 isEqualToArray:v9];

  if (v10)
  {
    [(ISInternationalViewController *)self setEditing:0 animated:1];
  }
  else
  {
    id v12 = objc_alloc((Class)IPLanguageListManager);
    unsigned int v13 = [(ISInternationalViewController *)self updatedAppleLanguages];
    id v14 = [v12 initWithPreferredLanguages:v13];
    v54 = [v14 systemDisplayLanguage];

    v15 = objc_opt_class();
    uint64_t v16 = [(ISInternationalViewController *)self updatedAppleLanguages];
    id v17 = [v15 deviceLanguageFrom:v16];

    uint64_t v18 = [(id)objc_opt_class() deviceLanguageIdentifier];
    uint64_t v19 = [(ISInternationalViewController *)self updatedAppleLanguages];
    id v20 = [(ISInternationalViewController *)self topLanguageFromArray:v19];

    uint64_t v21 = [(ISInternationalViewController *)self topLanguageFromArray:v8];
    id v22 = (void *)v21;
    id v23 = &stru_31478;
    if (v21) {
      id v23 = (__CFString *)v21;
    }
    id v24 = v23;

    v52 = v17;
    v53 = (void *)v18;
    unsigned __int8 v51 = [v17 isEqualToString:v18];
    unsigned int v25 = [v20 isEqualToString:v24];

    id v26 = +[NSLocale systemLanguages];
    unsigned __int8 v27 = [v26 containsObject:v20];

    if ((v27 & 1) != 0
      || (+[NSLocale systemLanguages],
          v28 = objc_claimAutoreleasedReturnValue(),
          +[NSLocale baseLanguageFromLanguage:v20],
          unsigned int v29 = objc_claimAutoreleasedReturnValue(),
          unsigned int v30 = [v28 containsObject:v29],
          v29,
          v28,
          ((v25 | v30) & 1) != 0))
    {
      v31 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
    }
    else
    {
      v32 = +[NSBundle bundleForClass:objc_opt_class()];
      v33 = [(id)objc_opt_class() modelSpecificLocalizedStringKeyForKey:@"%@_IS_UNSUPPORTED_DEVICE_WILL_FALLBACK_TO_%@_WHERE_%@_IS_NOT_SUPPORTED"];
      v34 = [v32 localizedStringForKey:v33 value:&stru_31478 table:@"InternationalSettings"];
      v31 = +[NSLocale string:v34 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v20 secondLanguageIdentifier:v54 thirdLanguageIdentifier:v20];
    }
    v35 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v31 target:self set:0 get:0 detail:0 cell:13 edit:0];
    uint64_t v55 = PSConfirmationCancelKey;
    unint64_t v36 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v37 = [v36 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
    v56 = v37;
    v38 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    id v39 = [v38 mutableCopy];

    v40 = +[UIDevice currentDevice];
    unsigned __int8 v41 = objc_msgSend(v40, "sf_isiPad");

    if (!v31 || (v41 & 1) != 0)
    {
      v45 = +[NSBundle bundleForClass:objc_opt_class()];
      v46 = [(id)objc_opt_class() modelSpecificLocalizedStringKeyForKey:@"%@_WILL_BE_USED_AS_DEVICE_LANGUAGE"];
      v47 = [v45 localizedStringForKey:v46 value:&stru_31478 table:@"InternationalSettings"];
      v42 = +[NSLocale string:v47 withCapitalizedDisplayNamesForFirstLanguageIdentifier:v54 secondLanguageIdentifier:0 thirdLanguageIdentifier:0];

      if (v51)
      {
        v48 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned __int8 v49 = [v48 localizedStringForKey:@"ASK_CHANGE_LANGUAGE_PREFERENCE_TITLE" value:&stru_31478 table:@"InternationalSettings"];
        [v39 setObject:v49 forKeyedSubscript:PSConfirmationTitleKey];
      }
      else
      {
        [v39 setObject:v42 forKeyedSubscript:PSConfirmationTitleKey];
      }
      v44 = v52;
      if (v31) {
        [v39 setObject:v31 forKeyedSubscript:PSConfirmationPromptKey];
      }
      uint64_t v43 = +[NSBundle bundleForClass:objc_opt_class()];
      v50 = [v43 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
      [v39 setObject:v50 forKeyedSubscript:PSConfirmationOKKey];
    }
    else
    {
      [v39 setObject:v31 forKeyedSubscript:PSConfirmationPromptKey];
      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v43 = [v42 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
      [v39 setObject:v43 forKeyedSubscript:PSConfirmationTitleKey];
      v44 = v52;
    }

    [v35 setupWithDictionary:v39];
    [v35 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
    [v35 setConfirmationAction:"changeLanguage:"];
    [v35 setConfirmationCancelAction:"cancelChangeLanguage:"];
    [(ISInternationalViewController *)self showConfirmationViewForSpecifier:v35];
  }
LABEL_26:
  [(ISInternationalViewController *)self beginUpdates];
  [(ISInternationalViewController *)self endUpdates];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)ISInternationalViewController;
  [(ISInternationalViewController *)&v60 setEditing:a3 animated:1];
  if (v4)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelEdits"];
    id v7 = [(ISInternationalViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];

    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"toggleEdit"];
    id v9 = [(ISInternationalViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    uint64_t v51 = 0;
    [(ISInternationalViewController *)self getGroup:&v51 row:0 ofSpecifierID:@"PREFERRED_LANGUAGE_GROUP"];
    unsigned __int8 v10 = +[NSMutableArray array];
    [(ISInternationalViewController *)self setRemovedGroupsAbovePreferredLanguagesInEditing:v10];

    uint64_t v11 = +[NSMutableArray array];
    [(ISInternationalViewController *)self setRemovedGroupsBelowPreferredLanguagesInEditing:v11];

    if ((uint64_t)[(ISInternationalViewController *)self numberOfGroups] >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        if (v12 != v51)
        {
          unsigned int v13 = [(ISInternationalViewController *)self specifiersInGroup:v12];
          if (v12 >= v51) {
            [(ISInternationalViewController *)self removedGroupsBelowPreferredLanguagesInEditing];
          }
          else {
          id v14 = [(ISInternationalViewController *)self removedGroupsAbovePreferredLanguagesInEditing];
          }
          [v14 addObject:v13];
        }
        ++v12;
      }
      while (v12 < (uint64_t)[(ISInternationalViewController *)self numberOfGroups]);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v15 = [(ISInternationalViewController *)self removedGroupsAbovePreferredLanguagesInEditing];
    id v16 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v48;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          [(ISInternationalViewController *)self removeContiguousSpecifiers:*(void *)(*((void *)&v47 + 1) + 8 * i) animated:1];
        }
        id v17 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
      }
      while (v17);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v20 = [(ISInternationalViewController *)self removedGroupsBelowPreferredLanguagesInEditing];
    id v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          [(ISInternationalViewController *)self removeContiguousSpecifiers:*(void *)(*((void *)&v43 + 1) + 8 * (void)j) animated:1];
        }
        id v22 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
      }
      while (v22);
    }

    unsigned int v25 = [(ISInternationalViewController *)self specifierForID:@"ADD_PREFERRED_LANGUAGE"];
    [(ISInternationalViewController *)self setAddLanguageSpecifier:v25];

    id v26 = [(ISInternationalViewController *)self addLanguageSpecifier];
    [(ISInternationalViewController *)self removeSpecifier:v26 animated:1];
  }
  else
  {
    unsigned __int8 v27 = [(ISInternationalViewController *)self navigationItem];
    [v27 setLeftBarButtonItem:0];

    id v28 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"toggleEdit"];
    unsigned int v29 = [(ISInternationalViewController *)self navigationItem];
    [v29 setRightBarButtonItem:v28];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    unsigned int v30 = [(ISInternationalViewController *)self removedGroupsAbovePreferredLanguagesInEditing];
    id v31 = [v30 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v57;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(v30);
          }
          [(ISInternationalViewController *)self insertContiguousSpecifiers:*(void *)(*((void *)&v56 + 1) + 8 * (void)k) atIndex:[(ISInternationalViewController *)self indexOfSpecifierID:@"PREFERRED_LANGUAGE_GROUP"] animated:1];
        }
        id v32 = [v30 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v32);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v35 = [(ISInternationalViewController *)self removedGroupsBelowPreferredLanguagesInEditing];
    id v36 = [v35 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v53;
      do
      {
        for (m = 0; m != v37; m = (char *)m + 1)
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(v35);
          }
          [(ISInternationalViewController *)self insertContiguousSpecifiers:*(void *)(*((void *)&v52 + 1) + 8 * (void)m) atEndOfGroup:(char *)[(ISInternationalViewController *)self numberOfGroups] - 1 animated:1];
        }
        id v37 = [v35 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v37);
    }

    [(ISInternationalViewController *)self setRemovedGroupsAbovePreferredLanguagesInEditing:0];
    [(ISInternationalViewController *)self setRemovedGroupsBelowPreferredLanguagesInEditing:0];
    uint64_t v51 = 0;
    [(ISInternationalViewController *)self getGroup:&v51 row:0 ofSpecifierID:@"PREFERRED_LANGUAGE_GROUP"];
    v40 = [(ISInternationalViewController *)self addLanguageSpecifier];
    [(ISInternationalViewController *)self insertSpecifier:v40 atEndOfGroup:v51 animated:1];

    [(ISInternationalViewController *)self setAddLanguageSpecifier:0];
  }
  unsigned __int8 v41 = [(ISInternationalViewController *)self navigationItem];
  [v41 setHidesBackButton:v4 animated:1];

  v42 = [(ISInternationalViewController *)self table];
  [v42 setEditing:v4 animated:1];
}

- (void)updateSpecifiersForLocaleRegionChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ISInternationalViewController *)self specifierForID:@"LOCALE"];
  [v5 setProperty:v4 forKey:PSValueKey];
  [v5 setProperty:v4 forKey:@"country"];

  id v6 = [(ISInternationalViewController *)self specifierForID:@"LOCALE"];
  unsigned __int8 v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v9 = v5;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [(ISInternationalViewController *)self replaceContiguousSpecifiers:v7 withSpecifiers:v8];
}

- (unint64_t)sectionIndexForTableView:(id)a3 fromSuperSectionIndex:(unint64_t)a4
{
  id v6 = a3;
  if (([(ISInternationalViewController *)self isEditing] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ISInternationalViewController;
    a4 -= (unint64_t)[(ISInternationalViewController *)&v8 numberOfSectionsInTableView:v6];
  }

  return a4;
}

- (void)cancelEdits
{
  [(ISInternationalViewController *)self setUpdatedAppleLanguages:0];
  id v3 = [(ISInternationalViewController *)self navigationItem];
  [v3 setHidesBackButton:0 animated:1];

  v6.receiver = self;
  v6.super_class = (Class)ISInternationalViewController;
  [(ISInternationalViewController *)&v6 setEditing:0 animated:1];
  id v4 = [(ISInternationalViewController *)self table];
  [v4 setEditing:0 animated:1];

  id v5 = [(ISInternationalViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:0];

  [(ISInternationalViewController *)self reloadSpecifiers];
}

- (void)showLanguageSheet:(id)a3
{
  id v4 = (char *)a3;
  id v5 = objc_alloc_init(ISLanguageSetupController);
  [(ISLanguageSetupController *)v5 setParentController:self];
  [(ISLanguageSetupController *)v5 setSpecifier:v4];
  objc_storeWeak((id *)&v4[OBJC_IVAR___PSSpecifier_target], self);

  [(ISInternationalViewController *)self showController:v5];
}

- (void)showLocaleSheet:(id)a3
{
  id v4 = (char *)a3;
  id v5 = objc_alloc_init(ISLocaleSetupController);
  [(ISLocaleSetupController *)v5 setParentController:self];
  [(ISLocaleSetupController *)v5 setSpecifier:v4];
  objc_storeWeak((id *)&v4[OBJC_IVAR___PSSpecifier_target], self);

  [(ISInternationalViewController *)self showController:v5];
}

+ (id)textColor
{
  return 0;
}

+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3
{
  return +[UIDevice modelSpecificLocalizedStringKeyForKey:a3];
}

+ (id)localizedRestartStringForCurrentDevice
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = +[ISInternationalViewController modelSpecificLocalizedStringKeyForKey:@"APPLYING_WILL_RESTART"];
  id v4 = [v2 localizedStringForKey:v3 value:&stru_31478 table:@"InternationalSettings"];

  return v4;
}

- (id)numberingSystem:(id)a3
{
  id v3 = [a3 propertyForKey:PSValueKey];
  if (!v3)
  {
    id v4 = [(id)objc_opt_class() currentLocale];
    id v5 = [v4 localeIdentifier];

    objc_super v6 = +[NSLocale componentsFromLocaleIdentifier:v5];
    id v3 = [v6 objectForKey:@"numbers"];
    if (!v3)
    {
      id v3 = +[IntlUtility defaultNumberingSystemForLocaleID:v5];
    }
  }

  return v3;
}

- (void)setNumberingSystem:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(id)objc_opt_class() currentLocale];
  id v9 = [v8 localeIdentifier];

  unsigned __int8 v10 = +[NSLocale componentsFromLocaleIdentifier:v9];
  uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];
  uint64_t v12 = +[NSMutableDictionary dictionaryWithDictionary:v10];
  [v12 removeObjectForKey:@"numbers"];
  unsigned int v13 = +[NSLocale localeIdentifierFromComponents:v12];
  id v14 = +[IntlUtility defaultNumberingSystemForLocaleID:v13];

  if ([v14 isEqual:v6]) {
    [v11 removeObjectForKey:@"numbers"];
  }
  else {
    [v11 setObject:v6 forKey:@"numbers"];
  }
  if (([v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v15 = +[NSLocale canonicalLocaleIdentifierFromComponents:v11];

    [(ISInternationalViewController *)self setLocaleOnly:v15];
    id v9 = (void *)v15;
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v16 = (void *)qword_391D0;
  uint64_t v23 = qword_391D0;
  if (!qword_391D0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_13128;
    v19[3] = &unk_30D98;
    v19[4] = &v20;
    sub_13128((uint64_t)v19);
    id v16 = (void *)v21[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v20, 8);
  uint64_t v18 = [v17 sharedCloudSettingsManager];
  [v18 writeToCloudSettings:&off_329E0 forStore:@"com.apple.cloudsettings.international"];
}

- (id)numberingSystemsTitles
{
  id v3 = +[NSMutableArray array];
  id v4 = [(id)objc_opt_class() currentLocale];
  id v5 = [v4 localeIdentifier];

  id v6 = [(ISInternationalViewController *)self numberingSystemsValues];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[IntlUtility displayNameForNumberingSystemWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i) localeIdentifier:v5];
        if (v11) {
          [v3 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)numberingSystemsShortTitles
{
  v2 = +[NSMutableArray array];
  id v3 = [(id)objc_opt_class() currentLocale];
  id v4 = [v3 localeIdentifier];

  id v5 = +[IntlUtility numberingSystemsForLocaleID:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = +[IntlUtility shortDisplayNameForNumberingSystemWithIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * i) localeIdentifier:v4];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v2;
}

- (id)numberingSystemsValues
{
  v2 = [(id)objc_opt_class() currentLocale];
  id v3 = [v2 localeIdentifier];
  id v4 = +[IntlUtility numberingSystemsForLocaleID:v3];

  return v4;
}

- (NSMutableArray)updatedAppleLanguages
{
  return self->_updatedAppleLanguages;
}

- (void)setUpdatedAppleLanguages:(id)a3
{
}

- (NSMutableArray)removedGroupsAbovePreferredLanguagesInEditing
{
  return self->_removedGroupsAbovePreferredLanguagesInEditing;
}

- (void)setRemovedGroupsAbovePreferredLanguagesInEditing:(id)a3
{
}

- (NSMutableArray)removedGroupsBelowPreferredLanguagesInEditing
{
  return self->_removedGroupsBelowPreferredLanguagesInEditing;
}

- (void)setRemovedGroupsBelowPreferredLanguagesInEditing:(id)a3
{
}

- (PSSpecifier)addLanguageSpecifier
{
  return self->_addLanguageSpecifier;
}

- (void)setAddLanguageSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addLanguageSpecifier, 0);
  objc_storeStrong((id *)&self->_removedGroupsBelowPreferredLanguagesInEditing, 0);
  objc_storeStrong((id *)&self->_removedGroupsAbovePreferredLanguagesInEditing, 0);

  objc_storeStrong((id *)&self->_updatedAppleLanguages, 0);
}

@end