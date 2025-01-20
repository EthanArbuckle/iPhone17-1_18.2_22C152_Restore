@interface ASSettingsOofUIController
- (BOOL)datePickerShowing;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (DAOofParams)serverData;
- (NSArray)externalMessageGroupSpecifiers;
- (NSArray)externalMessageSpecifiers;
- (NSArray)messageSpecifiers;
- (NSDate)autoReplyStartDate;
- (NSDate)previousUserSelectedAutoReplyEndDate;
- (NSDate)userSelectedAutoReplyEndDate;
- (NSString)autoExternalReplyMessage;
- (NSString)autoReplyMessage;
- (PSSpecifier)currentEndTimeSpecifier;
- (PSSpecifier)mailSwitchSpecifier;
- (UIBarButtonItem)saveButton;
- (UIDatePicker)layoutDatePicker;
- (id)_composeNewAutoReplyStringWithDate:(id)a3;
- (id)_stringFormatOfDate:(id)a3;
- (id)_updateAutoReplyMessage:(id)a3 withDate:(id)a4;
- (id)autoReplyTextCellSpecifiers;
- (id)currentDateString:(id)a3;
- (id)externalAudiencePropertyWithSpecifier:(id)a3;
- (id)externalAutoReplyTextboxSpecifiers;
- (id)externalMessageRadioSpecifiers;
- (id)externalSpecifersToRemoveAll:(BOOL)a3;
- (id)oofExternalMessageStateWithSpecifier:(id)a3;
- (id)oofStateWithSpecifier:(id)a3;
- (id)outOfOfficeEndDateDisplaySpecifier;
- (id)specifiers;
- (id)timePickerSpecifier;
- (id)trimWhitespaceAndNewlinesFromString:(id)a3;
- (int)ASOutOfOfficeEnabledState;
- (int)oooExternalMessageAudience;
- (unint64_t)ASOutOfOfficeDirtyStates;
- (void)_insertAdditionalExternalSpecifiersAnimated:(BOOL)a3;
- (void)_insertAdditionalOOOSpecifiersAnimated:(BOOL)a3;
- (void)_removeAdditionalExternalSpecifiersAnimated:(BOOL)a3;
- (void)_removeAdditionalOOOSpecifiersAnimated:(BOOL)a3;
- (void)_resetAllOutOfOfficeLocalValueToServerValue:(BOOL)a3;
- (void)_updateAllAutoReplyMessages:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)datePickerCell:(id)a3 changedDate:(id)a4;
- (void)dismissKeyboard;
- (void)enableSaveButton;
- (void)saveButtonTapped:(id)a3;
- (void)setASOutOfOfficeDirtyStates:(unint64_t)a3;
- (void)setASOutOfOfficeEnabledState:(int)a3;
- (void)setAutoExternalReplyMessage:(id)a3;
- (void)setAutoReplyMessage:(id)a3;
- (void)setAutoReplyStartDate:(id)a3;
- (void)setAutoReplyText:(id)a3 withSpecifier:(id)a4;
- (void)setCurrentEndTimeSpecifier:(id)a3;
- (void)setDatePickerShowing:(BOOL)a3;
- (void)setExternalAudienceProperty:(id)a3 withSpecifier:(id)a4;
- (void)setExternalAutoReplyText:(id)a3 withSpecifier:(id)a4;
- (void)setExternalMessageGroupSpecifiers:(id)a3;
- (void)setExternalMessageSpecifiers:(id)a3;
- (void)setLayoutDatePicker:(id)a3;
- (void)setMailSwitchSpecifier:(id)a3;
- (void)setMessageSpecifiers:(id)a3;
- (void)setOofExternalMessageState:(id)a3 withSpecifier:(id)a4;
- (void)setOofState:(id)a3 withSpecifier:(id)a4;
- (void)setOooExternalMessageAudience:(int)a3;
- (void)setPreviousUserSelectedAutoReplyEndDate:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setServerData:(id)a3;
- (void)setUserSelectedAutoReplyEndDate:(id)a3;
- (void)showKeyboard;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textContentViewDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSelectedDate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASSettingsOofUIController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[UIDevice currentDevice];
    unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v7 = [(ASSettingsOofUIController *)self table];
      [v7 setKeyboardDismissMode:1];
    }
    v8 = [(ASSettingsOofUIController *)self specifier];
    v9 = [v8 userInfo];
    v10 = [v9 objectForKeyedSubscript:@"kPSOofServerData"];
    [(ASSettingsOofUIController *)self setServerData:v10];

    [(ASSettingsOofUIController *)self _resetAllOutOfOfficeLocalValueToServerValue:1];
    v11 = +[NSMutableArray array];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"OOF_STATE" value:&stru_30C50 table:@"ASAccountSetup"];
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"setOofState:withSpecifier:" get:"oofStateWithSpecifier:" detail:objc_opt_class() cell:6 edit:0];

    [v14 setIdentifier:@"kPSOofStateIdentifier"];
    [(ASSettingsOofUIController *)self setMailSwitchSpecifier:v14];
    [v11 addObject:v14];
    if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState])
    {
      v15 = [(ASSettingsOofUIController *)self outOfOfficeEndDateDisplaySpecifier];
      [v11 addObject:v15];

      v16 = [(ASSettingsOofUIController *)self autoReplyTextCellSpecifiers];
      [v11 addObjectsFromArray:v16];

      v17 = [(ASSettingsOofUIController *)self externalMessageGroupSpecifiers];
      [v11 addObjectsFromArray:v17];
    }
    v18 = *(void **)&self->ACUIViewController_opaque[v3];
    *(void *)&self->ACUIViewController_opaque[v3] = v11;

    v4 = *(void **)&self->ACUIViewController_opaque[v3];
  }

  return v4;
}

- (void)_insertAdditionalOOOSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofScheduleEndDate"];

  if (!v5)
  {
    id v10 = +[NSMutableArray array];
    unint64_t v6 = [(ASSettingsOofUIController *)self outOfOfficeEndDateDisplaySpecifier];
    [v10 addObject:v6];

    if ([(ASSettingsOofUIController *)self datePickerShowing])
    {
      v7 = [(ASSettingsOofUIController *)self timePickerSpecifier];
      [v10 addObject:v7];
    }
    v8 = [(ASSettingsOofUIController *)self autoReplyTextCellSpecifiers];
    [v10 addObjectsFromArray:v8];

    v9 = [(ASSettingsOofUIController *)self externalMessageGroupSpecifiers];
    [v10 addObjectsFromArray:v9];

    [(ASSettingsOofUIController *)self insertContiguousSpecifiers:v10 afterSpecifierID:@"OUT_OF_OFFICE_ENABLED" animated:v3];
    [(ASSettingsOofUIController *)self performSelector:"showKeyboard" withObject:0 afterDelay:0.0];
  }
}

- (void)_removeAdditionalOOOSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)NSMutableArray);
  v21[0] = @"kPSOofScheduleEndDate";
  v21[1] = @"kPSOofMessageGroupSpecifierID";
  v21[2] = @"kPSOofMessage";
  unint64_t v6 = +[NSArray arrayWithObjects:v21 count:3];
  id v7 = [v5 initWithArray:v6];

  if ([(ASSettingsOofUIController *)self datePickerShowing])
  {
    [v7 insertObject:@"kPSOofDatePickerSpecifierID" atIndex:1];
    [(ASSettingsOofUIController *)self setDatePickerShowing:0];
  }
  v8 = [(ASSettingsOofUIController *)self externalSpecifersToRemoveAll:1];
  [v7 addObjectsFromArray:v8];

  v9 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[ASSettingsOofUIController specifierForID:](self, "specifierForID:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v14), (void)v16);
        if (v15) {
          [v9 addObject:v15];
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(ASSettingsOofUIController *)self dismissKeyboard];
  [(ASSettingsOofUIController *)self beginUpdates];
  [(ASSettingsOofUIController *)self removeContiguousSpecifiers:v9 animated:v3];
  [(ASSettingsOofUIController *)self endUpdates];
}

- (void)_insertAdditionalExternalSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofExternalMessageTextBoxSpecifierID"];

  if (!v5)
  {
    id v9 = +[NSMutableArray array];
    unint64_t v6 = [(ASSettingsOofUIController *)self externalMessageRadioSpecifiers];
    [v9 addObjectsFromArray:v6];

    id v7 = [(ASSettingsOofUIController *)self externalAutoReplyTextboxSpecifiers];
    [v9 addObjectsFromArray:v7];

    v8 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofExternalMessageSpacerSpecifierID"];
    [v8 removePropertyForKey:PSFooterTextGroupKey];
    [(ASSettingsOofUIController *)self beginUpdates];
    [(ASSettingsOofUIController *)self reloadSpecifier:v8 animated:v3];
    [(ASSettingsOofUIController *)self insertContiguousSpecifiers:v9 afterSpecifierID:@"kPSOofExternalMessageStateGroupSpecifierID" animated:v3];
    [(ASSettingsOofUIController *)self endUpdates];
  }
}

- (id)externalSpecifersToRemoveAll:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  unint64_t v6 = v5;
  if (v3)
  {
    [v5 addObject:@"kPSOofExternalMessageSpacerSpecifierID"];
    [v6 addObject:@"kPSOofExternalMessageStateGroupSpecifierID"];
  }
  [v6 addObject:@"kPSOofExternalMessageAudienceRadioGroupSpecifierID"];
  [v6 addObject:@"kPSOofExternalMessageGroupSpecifierID"];
  [v6 addObject:@"kPSOofExternalMessageTextBoxSpecifierID"];
  id v7 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofExternalMessageSpacerSpecifierID"];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"OOF_EXTERNAL_MESSAGE_DESCRIPTION" value:&stru_30C50 table:@"ASAccountSetup"];
  [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

  [(ASSettingsOofUIController *)self reloadSpecifier:v7 animated:1];

  return v6;
}

- (void)_removeAdditionalExternalSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  unint64_t v6 = [(ASSettingsOofUIController *)self externalSpecifersToRemoveAll:0];
  [v5 addObjectsFromArray:v6];

  id v7 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[ASSettingsOofUIController specifierForID:](self, "specifierForID:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
        if (v13) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(ASSettingsOofUIController *)self dismissKeyboard];
  [(ASSettingsOofUIController *)self beginUpdates];
  [(ASSettingsOofUIController *)self removeContiguousSpecifiers:v7 animated:v3];
  [(ASSettingsOofUIController *)self endUpdates];
}

- (id)externalMessageRadioSpecifiers
{
  externalMessageGroupSpecifiers = self->_externalMessageGroupSpecifiers;
  if (!externalMessageGroupSpecifiers)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"OOF_EXTERNAL_MESSAGE_AUDIENCE" value:&stru_30C50 table:@"ASAccountSetup"];
    unint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setExternalAudienceProperty:withSpecifier:" get:"externalAudiencePropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"OOF_EXTERNAL_CONTACTS_ONLY" value:&stru_30C50 table:@"ASAccountSetup"];
    v15[0] = v8;
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"OOF_EXTERNAL_EVERYONE" value:&stru_30C50 table:@"ASAccountSetup"];
    v15[1] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v15 count:2];

    [v6 setValues:&off_32788 titles:v11];
    [v6 setProperty:&off_325C8 forKey:PSDefaultValueKey];
    [v6 setIdentifier:@"kPSOofExternalMessageAudienceRadioGroupSpecifierID"];
    id v12 = +[NSMutableArray array];
    [(NSArray *)v12 addObject:v6];
    uint64_t v13 = self->_externalMessageGroupSpecifiers;
    self->_externalMessageGroupSpecifiers = v12;

    externalMessageGroupSpecifiers = self->_externalMessageGroupSpecifiers;
  }

  return externalMessageGroupSpecifiers;
}

- (id)externalAutoReplyTextboxSpecifiers
{
  BOOL v3 = [(ASSettingsOofUIController *)self externalMessageSpecifiers];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v6 = [v5 localizedStringForKey:@"OOF_EXTERNAL_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v7 setIdentifier:@"kPSOofExternalMessageGroupSpecifierID"];
    [v4 addObject:v7];
    id v8 = +[PSSpecifier preferenceSpecifierNamed:@"EXTERNAL_AUTO_REPLY_TEXT_BOX" target:self set:"setExternalAutoReplyText:withSpecifier:" get:"externalAutoReplyTextWithSpecifier:" detail:0 cell:14 edit:0];
    [v8 setIdentifier:@"kPSOofExternalMessageTextBoxSpecifierID"];
    LODWORD(v9) = 11.0;
    id v10 = +[NSNumber numberWithFloat:v9];
    [v8 setProperty:v10 forKey:PSTextViewBottomMarginKey];

    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v8 setProperty:self forKey:@"kPSOofTextViewdelegate"];
    [v4 addObject:v8];
    [(ASSettingsOofUIController *)self setExternalMessageSpecifiers:v4];
  }

  return [(ASSettingsOofUIController *)self externalMessageSpecifiers];
}

- (NSArray)externalMessageGroupSpecifiers
{
  BOOL v3 = +[NSMutableArray array];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"OOF_EXTERNAL_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];
  unint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setOofExternalMessageState:withSpecifier:" get:"oofExternalMessageStateWithSpecifier:" detail:objc_opt_class() cell:6 edit:0];

  [v6 setIdentifier:@"kPSOofExternalMessageStateGroupSpecifierID"];
  id v7 = +[PSSpecifier emptyGroupSpecifier];
  [v7 setIdentifier:@"kPSOofExternalMessageSpacerSpecifierID"];
  if (![(ASSettingsOofUIController *)self oooExternalMessageAudience])
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringForKey:@"OOF_EXTERNAL_MESSAGE_DESCRIPTION" value:&stru_30C50 table:@"ASAccountSetup"];
    [v7 setProperty:v9 forKey:PSFooterTextGroupKey];
  }
  [v3 addObject:v7];
  [v3 addObject:v6];
  if ([(ASSettingsOofUIController *)self oooExternalMessageAudience])
  {
    id v10 = [(ASSettingsOofUIController *)self externalMessageRadioSpecifiers];
    [v3 addObjectsFromArray:v10];

    uint64_t v11 = [(ASSettingsOofUIController *)self externalAutoReplyTextboxSpecifiers];
    [v3 addObjectsFromArray:v11];
  }

  return (NSArray *)v3;
}

- (id)outOfOfficeEndDateDisplaySpecifier
{
  BOOL v3 = [(ASSettingsOofUIController *)self currentEndTimeSpecifier];

  if (!v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"OOF_END_DATE" value:&stru_30C50 table:@"ASAccountSetup"];
    unint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"currentDateString:" detail:0 cell:4 edit:0];

    [v6 setIdentifier:@"kPSOofScheduleEndDate"];
    id v7 = +[NSNumber numberWithBool:1];
    [v6 setProperty:v7 forKey:PSHidesDisclosureIndicatorKey];

    [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [(ASSettingsOofUIController *)self setCurrentEndTimeSpecifier:v6];
  }
  id v8 = [(ASSettingsOofUIController *)self currentEndTimeSpecifier];
  double v9 = +[NSNumber numberWithBool:[(ASSettingsOofUIController *)self datePickerShowing]];
  [v8 setProperty:v9 forKey:@"kPSOofScheduleEndDateTextColor"];

  return [(ASSettingsOofUIController *)self currentEndTimeSpecifier];
}

- (id)timePickerSpecifier
{
  BOOL v3 = +[PSSpecifier preferenceSpecifierNamed:&stru_30C50 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v3 setIdentifier:@"kPSOofDatePickerSpecifierID"];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v4 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
  [v3 setProperty:v4 forKey:@"kPSOofPickerSelectedDate"];

  [v3 setProperty:self forKey:@"kPSOofDateTimePickerDelegate"];
  id v5 = [(ASSettingsOofUIController *)self layoutDatePicker];
  objc_msgSend(v5, "as_preferredHeight");
  *(float *)&double v6 = v6;
  id v7 = +[NSNumber numberWithFloat:v6];
  [v3 setProperty:v7 forKey:PSTableCellHeightKey];

  return v3;
}

- (id)autoReplyTextCellSpecifiers
{
  BOOL v3 = [(ASSettingsOofUIController *)self messageSpecifiers];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    double v6 = [v5 localizedStringForKey:@"OOF_INTERNAL_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v7 setIdentifier:@"kPSOofMessageGroupSpecifierID"];
    [v4 addObject:v7];
    id v8 = +[PSSpecifier preferenceSpecifierNamed:@"AUTO_REPLY_TEXT_BOX" target:self set:"setAutoReplyText:withSpecifier:" get:"autoReplyTextWithSpecifier:" detail:0 cell:14 edit:0];
    [v8 setIdentifier:@"kPSOofMessage"];
    LODWORD(v9) = 11.0;
    id v10 = +[NSNumber numberWithFloat:v9];
    [v8 setProperty:v10 forKey:PSTextViewBottomMarginKey];

    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v8 setProperty:self forKey:@"kPSOofTextViewdelegate"];
    [v4 addObject:v8];
    [(ASSettingsOofUIController *)self setMessageSpecifiers:v4];
  }

  return [(ASSettingsOofUIController *)self messageSpecifiers];
}

- (id)oofStateWithSpecifier:(id)a3
{
  uint64_t v3 = [(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState];

  return +[NSNumber numberWithInt:v3];
}

- (void)setOofState:(id)a3 withSpecifier:(id)a4
{
  if (![a3 BOOLValue])
  {
    [(ASSettingsOofUIController *)self _removeAdditionalOOOSpecifiersAnimated:1];
    [(ASSettingsOofUIController *)self setASOutOfOfficeEnabledState:0];
    unsigned int v6 = [(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState];
    id v7 = [(ASSettingsOofUIController *)self serverData];
    unsigned int v8 = [v7 oofState];

    unint64_t v9 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
    if (v6 == v8)
    {
      unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_9:
      [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v10];
      goto LABEL_10;
    }
LABEL_8:
    unint64_t v10 = v9 | 1;
    goto LABEL_9;
  }
  [(ASSettingsOofUIController *)self _resetAllOutOfOfficeLocalValueToServerValue:0];
  [(ASSettingsOofUIController *)self _insertAdditionalOOOSpecifiersAnimated:1];
  [(ASSettingsOofUIController *)self setASOutOfOfficeEnabledState:1];
  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0xFFFFFFFFFFFFFFFELL];
  id v5 = [(ASSettingsOofUIController *)self serverData];
  if ([v5 oofState] == 1)
  {

    goto LABEL_10;
  }
  uint64_t v11 = [(ASSettingsOofUIController *)self serverData];
  unsigned int v12 = [v11 oofState];

  if (v12 != 2)
  {
    unint64_t v9 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
    goto LABEL_8;
  }
LABEL_10:

  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (id)oofExternalMessageStateWithSpecifier:(id)a3
{
  uint64_t v3 = [(ASSettingsOofUIController *)self oooExternalMessageAudience];

  return +[NSNumber numberWithInt:v3];
}

- (void)setOofExternalMessageState:(id)a3 withSpecifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    id v5 = [(ASSettingsOofUIController *)self serverData];
    if ([v5 externalState])
    {
      unsigned int v6 = [(ASSettingsOofUIController *)self serverData];
      -[ASSettingsOofUIController setOooExternalMessageAudience:](self, "setOooExternalMessageAudience:", [v6 externalState]);
    }
    else
    {
      [(ASSettingsOofUIController *)self setOooExternalMessageAudience:1];
    }

    id v7 = [(ASSettingsOofUIController *)self serverData];
    unsigned int v8 = [v7 externalMessage];
    [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v8];

    [(ASSettingsOofUIController *)self _insertAdditionalExternalSpecifiersAnimated:1];
  }
  else
  {
    [(ASSettingsOofUIController *)self setOooExternalMessageAudience:0];
    [(ASSettingsOofUIController *)self _removeAdditionalExternalSpecifiersAnimated:1];
  }
  unsigned int v9 = [(ASSettingsOofUIController *)self oooExternalMessageAudience];
  unint64_t v10 = [(ASSettingsOofUIController *)self serverData];
  LOBYTE(v9) = v9 != [v10 externalState];

  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0xFFFFFFFFFFFFFFEFLL | (16 * (v9 & 1))];

  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)setAutoReplyText:(id)a3 withSpecifier:(id)a4
{
  id v13 = [a4 propertyForKey:PSTableCellKey];
  id v5 = [v13 textView];
  unsigned int v6 = [v5 text];
  [(ASSettingsOofUIController *)self setAutoReplyMessage:v6];

  id v7 = [(ASSettingsOofUIController *)self autoReplyMessage];
  unsigned int v8 = [(ASSettingsOofUIController *)self serverData];
  unsigned int v9 = [v8 message];
  unsigned int v10 = [v7 isEqualToString:v9];

  unint64_t v11 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v12 = 4;
  if (v10) {
    uint64_t v12 = 0;
  }
  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v11 | v12];
  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)setExternalAutoReplyText:(id)a3 withSpecifier:(id)a4
{
  id v13 = [a4 propertyForKey:PSTableCellKey];
  id v5 = [v13 textView];
  unsigned int v6 = [v5 text];
  [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v6];

  id v7 = [(ASSettingsOofUIController *)self autoExternalReplyMessage];
  unsigned int v8 = [(ASSettingsOofUIController *)self serverData];
  unsigned int v9 = [v8 externalMessage];
  unsigned int v10 = [v7 isEqualToString:v9];

  unint64_t v11 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0xFFFFFFFFFFFFFFF7;
  uint64_t v12 = 8;
  if (v10) {
    uint64_t v12 = 0;
  }
  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v11 | v12];
  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)setExternalAudienceProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 intValue];
  id v10 = [v6 identifier];

  if ([v10 isEqualToString:@"kPSOofExternalMessageAudienceRadioGroupSpecifierID"]
    && v7 != [(ASSettingsOofUIController *)self oooExternalMessageAudience])
  {
    [(ASSettingsOofUIController *)self setOooExternalMessageAudience:v7];
    unsigned int v8 = [(ASSettingsOofUIController *)self serverData];
    BOOL v9 = v7 != [v8 externalState];

    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0xFFFFFFFFFFFFFFEFLL | (16 * v9)];
  }
  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (id)externalAudiencePropertyWithSpecifier:(id)a3
{
  v4 = [a3 identifier];
  if ([v4 isEqualToString:@"kPSOofExternalMessageAudienceRadioGroupSpecifierID"]) {
    uint64_t v5 = [(ASSettingsOofUIController *)self oooExternalMessageAudience];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = +[NSNumber numberWithInt:v5];

  return v6;
}

- (id)_stringFormatOfDate:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_3A5C8;
  if (!qword_3A5C8)
  {
    uint64_t v5 = +[NSLocale currentLocale];
    id v6 = +[NSDateFormatter dateFormatFromTemplate:@"EEEE, MMMM d" options:0 locale:v5];

    id v7 = objc_alloc_init((Class)NSDateFormatter);
    unsigned int v8 = (void *)qword_3A5C8;
    qword_3A5C8 = (uint64_t)v7;

    [(id)qword_3A5C8 setDateFormat:v6];
    v4 = (void *)qword_3A5C8;
  }
  BOOL v9 = [v4 stringFromDate:v3];

  return v9;
}

- (id)_composeNewAutoReplyStringWithDate:(id)a3
{
  if (a3)
  {
    id v3 = -[ASSettingsOofUIController _stringFormatOfDate:](self, "_stringFormatOfDate:");
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"OOF_DEFAULT_AUTO_REPLY_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];

    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }
  else
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v3 localizedStringForKey:@"OOF_DEFAULT_AUTO_REPLY_MESSAGE_WITHOUT_DATE" value:&stru_30C50 table:@"ASAccountSetup"];
  }

  return v6;
}

- (id)_updateAutoReplyMessage:(id)a3 withDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  BOOL v9 = [(ASSettingsOofUIController *)self previousUserSelectedAutoReplyEndDate];

  if (v9)
  {
    id v10 = [(ASSettingsOofUIController *)self previousUserSelectedAutoReplyEndDate];
    unint64_t v11 = [(ASSettingsOofUIController *)self _stringFormatOfDate:v10];

    id v12 = [v8 rangeOfString:v11];
    uint64_t v14 = v13;

    BOOL v15 = v11 == 0;
  }
  else
  {
    uint64_t v14 = 0;
    id v12 = 0;
    BOOL v15 = 1;
  }
  long long v16 = [(ASSettingsOofUIController *)self _stringFormatOfDate:v7];
  if (!v15 && v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v12, v14, v16);
LABEL_10:
    v21 = (void *)v17;

    goto LABEL_11;
  }
  if (![v8 length]) {
    goto LABEL_9;
  }
  long long v18 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v19 = [v18 localizedStringForKey:@"OOF_DEFAULT_AUTO_REPLY_MESSAGE_WITHOUT_DATE" value:&stru_30C50 table:@"ASAccountSetup"];
  unsigned int v20 = [v8 isEqualToString:v19];

  v21 = v8;
  if (v20)
  {
LABEL_9:
    uint64_t v17 = [(ASSettingsOofUIController *)self _composeNewAutoReplyStringWithDate:v7];
    goto LABEL_10;
  }
LABEL_11:
  id v22 = v21;

  return v22;
}

- (void)_updateAllAutoReplyMessages:(id)a3
{
  id v14 = a3;
  v4 = [(ASSettingsOofUIController *)self autoReplyMessage];
  uint64_t v5 = [(ASSettingsOofUIController *)self autoExternalReplyMessage];
  unsigned int v6 = [v4 isEqualToString:v5];

  id v7 = [(ASSettingsOofUIController *)self autoReplyMessage];
  id v8 = [(ASSettingsOofUIController *)self _updateAutoReplyMessage:v7 withDate:v14];

  BOOL v9 = [(ASSettingsOofUIController *)self autoReplyMessage];
  unsigned __int8 v10 = [v9 isEqualToString:v8];

  if ((v10 & 1) == 0) {
    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] | 4];
  }
  if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 4) != 0)
  {
    [(ASSettingsOofUIController *)self setAutoReplyMessage:v8];
    [(ASSettingsOofUIController *)self reloadSpecifierID:@"kPSOofMessage" animated:0];
  }
  if (v6
    && ([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 4) != 0)
  {
    [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v8];
    if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 4) != 0) {
      [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] | 8];
    }
  }
  else
  {
    uint64_t v11 = [(ASSettingsOofUIController *)self autoExternalReplyMessage];
    id v12 = [(ASSettingsOofUIController *)self _updateAutoReplyMessage:v11 withDate:v14];

    uint64_t v13 = [(ASSettingsOofUIController *)self autoExternalReplyMessage];
    LOBYTE(v11) = [v13 isEqualToString:v12];

    if (v11) {
      goto LABEL_12;
    }
    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] | 8];
    [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v12];
    id v8 = v12;
  }
  [(ASSettingsOofUIController *)self reloadSpecifierID:@"kPSOofExternalMessageTextBoxSpecifierID" animated:0];
  id v12 = v8;
LABEL_12:
  [(ASSettingsOofUIController *)self setPreviousUserSelectedAutoReplyEndDate:v14];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)ASSettingsOofUIController;
  [(ASSettingsOofUIController *)&v22 viewDidLoad];
  id v3 = [(ASSettingsOofUIController *)self saveButton];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v6 = [v5 localizedStringForKey:@"SAVE" value:&stru_30C50 table:@"Localizable"];
    id v7 = [v4 initWithTitle:v6 style:2 target:self action:"saveButtonTapped:"];
    [(ASSettingsOofUIController *)self setSaveButton:v7];
  }
  id v8 = [(ASSettingsOofUIController *)self cancelButton];

  if (!v8)
  {
    id v9 = objc_alloc((Class)UIBarButtonItem);
    unsigned __int8 v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_30C50 table:@"Localizable"];
    id v12 = [v9 initWithTitle:v11 style:2 target:self action:"cancelButtonTapped:"];
    [(ASSettingsOofUIController *)self setCancelButton:v12];
  }
  uint64_t v13 = [(ASSettingsOofUIController *)self cancelButton];
  id v14 = [(ASSettingsOofUIController *)self navigationItem];
  [v14 setLeftBarButtonItem:v13];

  BOOL v15 = [(ASSettingsOofUIController *)self saveButton];
  long long v16 = [(ASSettingsOofUIController *)self navigationItem];
  [v16 setRightBarButtonItem:v15];

  uint64_t v17 = +[UIDatePicker as_newConfiguredPicker];
  [(ASSettingsOofUIController *)self setLayoutDatePicker:v17];

  long long v18 = [(ASSettingsOofUIController *)self layoutDatePicker];
  [v18 setHidden:1];

  long long v19 = [(ASSettingsOofUIController *)self table];
  unsigned int v20 = [(ASSettingsOofUIController *)self layoutDatePicker];
  [v19 insertSubview:v20 atIndex:0];

  v21 = [(ASSettingsOofUIController *)self layoutDatePicker];
  objc_msgSend(v21, "as_installConstraints");

  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ASSettingsOofUIController;
  id v4 = a3;
  [(ASSettingsOofUIController *)&v14 traitCollectionDidChange:v4];
  uint64_t v5 = [(ASSettingsOofUIController *)self traitCollection];
  unsigned int v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if ([(ASSettingsOofUIController *)self datePickerShowing] && v6 != v7)
  {
    id v8 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofDatePickerSpecifierID"];
    id v9 = [(ASSettingsOofUIController *)self indexPathForSpecifier:v8];
    unsigned __int8 v10 = [(ASSettingsOofUIController *)self table];
    uint64_t v11 = [v10 cellForRowAtIndexPath:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 datePicker];
      objc_msgSend(v12, "as_preferredHeight");
      uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setProperty:v13 forKey:PSTableCellHeightKey];

      [(ASSettingsOofUIController *)self reloadSpecifier:v8];
    }
  }
}

- (void)saveButtonTapped:(id)a3
{
  id v4 = a3;
  id v23 = objc_alloc_init((Class)DAOofSettingsInfo);
  if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState])
  {
    uint64_t v5 = [(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState];
  }
  else
  {
    unsigned int v6 = [(ASSettingsOofUIController *)self serverData];
    [v6 setExternalState:0];
    [v23 setExternalState:0];

    uint64_t v5 = 0;
  }
  [v23 setOofState:v5];
  if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 2) != 0
    && [v23 oofState] == 2)
  {
    id v7 = [(ASSettingsOofUIController *)self autoReplyStartDate];
    [v23 setStartTime:v7];

    id v8 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
    [v23 setEndTime:v8];
  }
  else
  {
    id v9 = [(ASSettingsOofUIController *)self serverData];
    unsigned __int8 v10 = [v9 startTime];
    [v23 setStartTime:v10];

    id v8 = [(ASSettingsOofUIController *)self serverData];
    uint64_t v11 = [v8 endTime];
    [v23 setEndTime:v11];
  }
  if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 4) != 0) {
    goto LABEL_11;
  }
  id v12 = [(ASSettingsOofUIController *)self serverData];
  uint64_t v13 = [v12 message];
  objc_super v14 = [(ASSettingsOofUIController *)self trimWhitespaceAndNewlinesFromString:v13];
  id v15 = [v14 length];

  if (!v15)
  {
LABEL_11:
    long long v16 = [(ASSettingsOofUIController *)self autoReplyMessage];
    [v23 setMessage:v16];
  }
  else
  {
    long long v16 = [(ASSettingsOofUIController *)self serverData];
    uint64_t v17 = [v16 message];
    [v23 setMessage:v17];
  }
  if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 0x10) != 0)
  {
    objc_msgSend(v23, "setExternalState:", -[ASSettingsOofUIController oooExternalMessageAudience](self, "oooExternalMessageAudience"));
  }
  else
  {
    long long v18 = [(ASSettingsOofUIController *)self serverData];
    objc_msgSend(v23, "setExternalState:", objc_msgSend(v18, "externalState"));
  }
  if (([(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] & 8) != 0)
  {
    long long v19 = [(ASSettingsOofUIController *)self autoExternalReplyMessage];
    [v23 setExternalMessage:v19];
  }
  else
  {
    long long v19 = [(ASSettingsOofUIController *)self serverData];
    unsigned int v20 = [v19 externalMessage];
    [v23 setExternalMessage:v20];
  }
  uint64_t v21 = OBJC_IVAR___PSViewController__specifier;
  objc_super v22 = [*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] target];
  objc_msgSend(v22, "da_performSelectorThatDoesntAffectRetainCount:withObject:", *(void *)(*(void *)&self->ACUIViewController_opaque[v21] + OBJC_IVAR___PSSpecifier_setter), v23);

  [(ASSettingsOofUIController *)self dismissAnimated:1];
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)enableSaveButton
{
  BOOL v3 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] != 0;
  id v5 = [(ASSettingsOofUIController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v8 = 1;
  if ([(ASSettingsOofUIController *)self datePickerShowing])
  {
    unsigned int v6 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofDatePickerSpecifierID"];
    id v7 = [(ASSettingsOofUIController *)self indexPathForSpecifier:v6];

    if (v7 == v5) {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASSettingsOofUIController;
  id v7 = a4;
  [(ASSettingsOofUIController *)&v16 tableView:v6 didSelectRowAtIndexPath:v7];
  BOOL v8 = [(ASSettingsOofUIController *)self currentEndTimeSpecifier];
  id v9 = [(ASSettingsOofUIController *)self indexPathForSpecifier:v8];

  LODWORD(v8) = [v7 isEqual:v9];
  unsigned int v10 = [(ASSettingsOofUIController *)self datePickerShowing];
  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      [(ASSettingsOofUIController *)self setDatePickerShowing:1];
      id v12 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      [(ASSettingsOofUIController *)self updateSelectedDate:v12];

      uint64_t v13 = [(ASSettingsOofUIController *)self timePickerSpecifier];
      [(ASSettingsOofUIController *)self insertSpecifier:v13 afterSpecifierID:@"kPSOofScheduleEndDate" animated:1];

      [v6 scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:1];
      goto LABEL_8;
    }
    uint64_t v11 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofDatePickerSpecifierID"];
    [(ASSettingsOofUIController *)self setDatePickerShowing:0];
    [(ASSettingsOofUIController *)self removeSpecifier:v11 animated:1];
    goto LABEL_6;
  }
  if (v10)
  {
    uint64_t v11 = [(ASSettingsOofUIController *)self specifierForID:@"kPSOofDatePickerSpecifierID"];
    [(ASSettingsOofUIController *)self removeSpecifier:v11 animated:1];
    [(ASSettingsOofUIController *)self setDatePickerShowing:0];
LABEL_6:
  }
LABEL_8:
  objc_super v14 = [(ASSettingsOofUIController *)self currentEndTimeSpecifier];
  id v15 = +[NSNumber numberWithBool:[(ASSettingsOofUIController *)self datePickerShowing]];
  [v14 setProperty:v15 forKey:@"kPSOofScheduleEndDateTextColor"];

  [(ASSettingsOofUIController *)self reloadSpecifierID:@"kPSOofScheduleEndDate" animated:0];
  [(ASSettingsOofUIController *)self dismissKeyboard];
}

- (id)currentDateString:(id)a3
{
  unsigned __int8 v4 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
  if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState] == 2 || (v4 & 2) != 0)
  {
    id v7 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];

    if (v7)
    {
      BOOL v8 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      id v9 = +[NSDateFormatter localizedStringFromDate:v8 dateStyle:2 timeStyle:1];

      [(ASSettingsOofUIController *)self setASOutOfOfficeEnabledState:2];
      goto LABEL_8;
    }
    id v5 = +[NSDate date];
    uint64_t v6 = +[NSDateFormatter localizedStringFromDate:v5 dateStyle:2 timeStyle:1];
  }
  else
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"OOF_NO_END_DATE" value:&stru_30C50 table:@"ASAccountSetup"];
  }
  id v9 = (void *)v6;

LABEL_8:

  return v9;
}

- (void)_resetAllOutOfOfficeLocalValueToServerValue:(BOOL)a3
{
  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:0];
  id v50 = +[NSDate date];
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
  id v5 = [v4 components:28 fromDate:v50];
  id v6 = [v5 day];
  id v7 = [v5 month];
  id v8 = [v5 year];
  id v9 = objc_alloc_init((Class)NSDateComponents);
  [v9 setMinute:30];
  [v9 setHour:23];
  [v9 setDay:v6];
  [v9 setMonth:v7];
  [v9 setYear:v8];
  uint64_t v10 = [v4 dateFromComponents:v9];
  uint64_t v11 = [(ASSettingsOofUIController *)self serverData];
  -[ASSettingsOofUIController setASOutOfOfficeEnabledState:](self, "setASOutOfOfficeEnabledState:", [v11 oofState]);

  if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState] == 2)
  {
    id v12 = [(ASSettingsOofUIController *)self serverData];
    uint64_t v13 = [v12 startTime];
    [(ASSettingsOofUIController *)self setAutoReplyStartDate:v13];

    objc_super v14 = [(ASSettingsOofUIController *)self autoReplyStartDate];
    id v15 = (char *)[v4 compareDate:v50 toDate:v14 toUnitGranularity:64];

    if (v15 == (unsigned char *)&dword_0 + 1)
    {
      [(ASSettingsOofUIController *)self setAutoReplyStartDate:v50];
    }
    else if (v15 == (char *)-1)
    {
      [(ASSettingsOofUIController *)self setASOutOfOfficeEnabledState:0];
    }
    objc_super v16 = [(ASSettingsOofUIController *)self serverData];
    uint64_t v17 = [v16 endTime];
    [(ASSettingsOofUIController *)self setUserSelectedAutoReplyEndDate:v17];
  }
  else
  {
    [(ASSettingsOofUIController *)self setAutoReplyStartDate:v50];
    [(ASSettingsOofUIController *)self setUserSelectedAutoReplyEndDate:v10];
  }
  long long v18 = +[NSRegularExpression regularExpressionWithPattern:@"\r\n" options:0 error:0];
  long long v19 = [(ASSettingsOofUIController *)self serverData];
  unsigned int v20 = [v19 message];

  if (v20)
  {
    id v21 = objc_alloc((Class)NSMutableString);
    objc_super v22 = [(ASSettingsOofUIController *)self serverData];
    id v23 = [v22 message];
    id v24 = [v21 initWithString:v23];

    objc_msgSend(v18, "replaceMatchesInString:options:range:withTemplate:", v24, 0, 0, objc_msgSend(v24, "length"), @"<br>");
  }
  else
  {
    v25 = [(ASSettingsOofUIController *)self serverData];
    [v25 setMessage:&stru_30C50];

    id v24 = 0;
  }
  v26 = [(ASSettingsOofUIController *)self serverData];
  v27 = [v26 message];
  v28 = [(ASSettingsOofUIController *)self trimWhitespaceAndNewlinesFromString:v27];
  id v29 = [v28 length];

  if (v29)
  {
    [(ASSettingsOofUIController *)self setAutoReplyMessage:v24];
  }
  else
  {
    if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState] == 2)
    {
      v30 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      v31 = [(ASSettingsOofUIController *)self _composeNewAutoReplyStringWithDate:v30];
      [(ASSettingsOofUIController *)self setAutoReplyMessage:v31];

      v32 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      [(ASSettingsOofUIController *)self setPreviousUserSelectedAutoReplyEndDate:v32];
    }
    else
    {
      v32 = [(ASSettingsOofUIController *)self _composeNewAutoReplyStringWithDate:0];
      [(ASSettingsOofUIController *)self setAutoReplyMessage:v32];
    }

    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] | 4];
    [(ASSettingsOofUIController *)self enableSaveButton];
  }
  v33 = [(ASSettingsOofUIController *)self serverData];
  -[ASSettingsOofUIController setOooExternalMessageAudience:](self, "setOooExternalMessageAudience:", [v33 externalState]);

  v34 = [(ASSettingsOofUIController *)self serverData];
  v35 = [v34 externalMessage];

  if (v35)
  {
    id v36 = objc_alloc((Class)NSMutableString);
    v37 = [(ASSettingsOofUIController *)self serverData];
    v38 = [v37 externalMessage];
    id v39 = [v36 initWithString:v38];

    objc_msgSend(v18, "replaceMatchesInString:options:range:withTemplate:", v39, 0, 0, objc_msgSend(v39, "length"), @"<br>");
    id v24 = v39;
  }
  else
  {
    v40 = [(ASSettingsOofUIController *)self serverData];
    [v40 setExternalMessage:&stru_30C50];
  }
  v41 = [(ASSettingsOofUIController *)self serverData];
  v42 = [v41 externalMessage];
  v43 = [(ASSettingsOofUIController *)self trimWhitespaceAndNewlinesFromString:v42];
  id v44 = [v43 length];

  if (v44)
  {
    [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v24];
    v45 = v49;
  }
  else
  {
    if ([(ASSettingsOofUIController *)self ASOutOfOfficeEnabledState] == 2)
    {
      v46 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      v47 = [(ASSettingsOofUIController *)self _composeNewAutoReplyStringWithDate:v46];
      [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v47];

      v48 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
      [(ASSettingsOofUIController *)self setPreviousUserSelectedAutoReplyEndDate:v48];
    }
    else
    {
      v48 = [(ASSettingsOofUIController *)self _composeNewAutoReplyStringWithDate:0];
      [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v48];
    }
    v45 = v49;

    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:[(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates] | 8];
    [(ASSettingsOofUIController *)self enableSaveButton];
  }
}

- (void)datePickerCell:(id)a3 changedDate:(id)a4
{
  id v6 = a4;
  [a3 setProperty:v6 forKey:@"kPSOofPickerSelectedDate"];
  [(ASSettingsOofUIController *)self updateSelectedDate:v6];
}

- (void)updateSelectedDate:(id)a3
{
  id v10 = a3;
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSGregorianCalendar];
  [(ASSettingsOofUIController *)self setUserSelectedAutoReplyEndDate:v10];
  id v5 = [(ASSettingsOofUIController *)self userSelectedAutoReplyEndDate];
  id v6 = [(ASSettingsOofUIController *)self serverData];
  id v7 = [v6 endTime];
  id v8 = [v4 compareDate:v5 toDate:v7 toUnitGranularity:64];

  unint64_t v9 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
  if (v8)
  {
    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v9 | 2];
    [(ASSettingsOofUIController *)self _updateAllAutoReplyMessages:v10];
    [(ASSettingsOofUIController *)self reloadSpecifierID:@"kPSOofScheduleEndDate" animated:0];
  }
  else
  {
    [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v9 & 0xFFFFFFFFFFFFFFFDLL];
  }
  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)textContentViewDidChange:(id)a3
{
  id v54 = a3;
  id v4 = [(ASSettingsOofUIController *)self messageSpecifiers];
  id v5 = [v4 objectAtIndexedSubscript:1];

  uint64_t v6 = PSTableCellKey;
  v52 = [v5 propertyForKey:PSTableCellKey];
  id v7 = [v52 textView];
  id v8 = [(ASSettingsOofUIController *)self externalMessageSpecifiers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:1];

  id v10 = [(ASSettingsOofUIController *)self externalMessageSpecifiers];
  uint64_t v11 = [v10 objectAtIndexedSubscript:1];
  id v12 = [v11 propertyForKey:v6];

  id v50 = v12;
  uint64_t v13 = [v12 textView];
  v53 = v5;
  v51 = (void *)v9;
  if (v7 == v54) {
    objc_super v14 = v5;
  }
  else {
    objc_super v14 = (void *)v9;
  }
  uint64_t v48 = v13;
  if (v7 == v54) {
    id v15 = v54;
  }
  else {
    id v15 = (void *)v13;
  }
  id v16 = v14;
  id v17 = v15;
  long long v18 = [v16 propertyForKey:PSTextViewBottomMarginKey];
  if (v18)
  {
    PSTextViewInsets();
    double v20 = v19;
    double v22 = v21;
    id v23 = objc_msgSend(v17, "webView", v48);
    [v23 frame];
    double v24 = v22 + v20 + CGRectGetHeight(v56);
    [v18 floatValue];
    double v26 = v24 + v25;

    *(float *)&double v27 = v26;
    v28 = +[NSNumber numberWithFloat:v27];
    uint64_t v29 = PSTableCellHeightKey;
    v30 = [v16 propertyForKey:PSTableCellHeightKey];
    unsigned __int8 v31 = [v30 isEqual:v28];

    if ((v31 & 1) == 0)
    {
      v32 = [v16 target];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = [v16 target];
        v34 = [v33 table];
      }
      else
      {
        v34 = 0;
      }

      BOOL v35 = +[UIView areAnimationsEnabled];
      +[UIView setAnimationsEnabled:0];
      [v34 beginUpdates];
      [v16 setProperty:v28 forKey:v29];
      [v34 endUpdates];
      +[UIView setAnimationsEnabled:v35];
    }
  }
  id v36 = objc_msgSend(v17, "text", v48);
  v37 = [(ASSettingsOofUIController *)self serverData];
  if (v7 == v54)
  {
    v43 = [v37 message];
    id v44 = [(ASSettingsOofUIController *)self trimWhitespaceAndNewlinesFromString:v43];
    id v45 = [v36 compare:v44];

    unint64_t v46 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
    if (v45)
    {
      [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v46 | 4];
      v42 = [v54 text];
      [(ASSettingsOofUIController *)self setAutoReplyMessage:v42];
      goto LABEL_19;
    }
    unint64_t v47 = v46 & 0xFFFFFFFFFFFFFFFBLL;
  }
  else
  {
    v38 = [v37 externalMessage];
    id v39 = [(ASSettingsOofUIController *)self trimWhitespaceAndNewlinesFromString:v38];
    id v40 = [v36 compare:v39];

    unint64_t v41 = [(ASSettingsOofUIController *)self ASOutOfOfficeDirtyStates];
    if (v40)
    {
      [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v41 | 8];
      v42 = [v54 text];
      [(ASSettingsOofUIController *)self setAutoExternalReplyMessage:v42];
LABEL_19:

      goto LABEL_23;
    }
    unint64_t v47 = v41 & 0xFFFFFFFFFFFFFFF7;
  }
  [(ASSettingsOofUIController *)self setASOutOfOfficeDirtyStates:v47];
LABEL_23:
  [(ASSettingsOofUIController *)self enableSaveButton];
}

- (void)dismissKeyboard
{
  v2 = [(ASSettingsOofUIController *)self table];
  BOOL v3 = [v2 window];
  id v4 = [v3 firstResponder];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 resignFirstResponder];
  }
}

- (void)showKeyboard
{
  v2 = [(ASSettingsOofUIController *)self messageSpecifiers];
  BOOL v3 = [v2 objectAtIndexedSubscript:1];
  id v6 = [v3 propertyForKey:PSTableCellKey];

  id v4 = [v6 textView];
  id v5 = v4;
  if (v4) {
    [v4 becomeFirstResponder];
  }
}

- (id)trimWhitespaceAndNewlinesFromString:(id)a3
{
  BOOL v3 = [(ASSettingsOofUIController *)self serverData];
  id v4 = [v3 message];
  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (PSSpecifier)mailSwitchSpecifier
{
  return self->_mailSwitchSpecifier;
}

- (void)setMailSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)currentEndTimeSpecifier
{
  return self->_currentEndTimeSpecifier;
}

- (void)setCurrentEndTimeSpecifier:(id)a3
{
}

- (NSArray)messageSpecifiers
{
  return self->_messageSpecifiers;
}

- (void)setMessageSpecifiers:(id)a3
{
}

- (void)setExternalMessageGroupSpecifiers:(id)a3
{
}

- (NSArray)externalMessageSpecifiers
{
  return self->_externalMessageSpecifiers;
}

- (void)setExternalMessageSpecifiers:(id)a3
{
}

- (BOOL)datePickerShowing
{
  return self->_datePickerShowing;
}

- (void)setDatePickerShowing:(BOOL)a3
{
  self->_datePickerShowing = a3;
}

- (unint64_t)ASOutOfOfficeDirtyStates
{
  return self->_ASOutOfOfficeDirtyStates;
}

- (void)setASOutOfOfficeDirtyStates:(unint64_t)a3
{
  self->_ASOutOfOfficeDirtyStates = a3;
}

- (int)ASOutOfOfficeEnabledState
{
  return self->_ASOutOfOfficeEnabledState;
}

- (void)setASOutOfOfficeEnabledState:(int)a3
{
  self->_ASOutOfOfficeEnabledState = a3;
}

- (NSDate)previousUserSelectedAutoReplyEndDate
{
  return self->_previousUserSelectedAutoReplyEndDate;
}

- (void)setPreviousUserSelectedAutoReplyEndDate:(id)a3
{
}

- (NSDate)userSelectedAutoReplyEndDate
{
  return self->_userSelectedAutoReplyEndDate;
}

- (void)setUserSelectedAutoReplyEndDate:(id)a3
{
}

- (NSDate)autoReplyStartDate
{
  return self->_autoReplyStartDate;
}

- (void)setAutoReplyStartDate:(id)a3
{
}

- (NSString)autoReplyMessage
{
  return self->_autoReplyMessage;
}

- (void)setAutoReplyMessage:(id)a3
{
}

- (int)oooExternalMessageAudience
{
  return self->_oooExternalMessageAudience;
}

- (void)setOooExternalMessageAudience:(int)a3
{
  self->_oooExternalMessageAudience = a3;
}

- (NSString)autoExternalReplyMessage
{
  return self->_autoExternalReplyMessage;
}

- (void)setAutoExternalReplyMessage:(id)a3
{
}

- (DAOofParams)serverData
{
  return self->_serverData;
}

- (void)setServerData:(id)a3
{
}

- (UIDatePicker)layoutDatePicker
{
  return self->_layoutDatePicker;
}

- (void)setLayoutDatePicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDatePicker, 0);
  objc_storeStrong((id *)&self->_serverData, 0);
  objc_storeStrong((id *)&self->_autoExternalReplyMessage, 0);
  objc_storeStrong((id *)&self->_autoReplyMessage, 0);
  objc_storeStrong((id *)&self->_autoReplyStartDate, 0);
  objc_storeStrong((id *)&self->_userSelectedAutoReplyEndDate, 0);
  objc_storeStrong((id *)&self->_previousUserSelectedAutoReplyEndDate, 0);
  objc_storeStrong((id *)&self->_externalMessageSpecifiers, 0);
  objc_storeStrong((id *)&self->_externalMessageGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_messageSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentEndTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_mailSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_saveButton, 0);
}

@end