@interface CNPropertyGroupAlertItem
+ (id)emptyValueForLabel:(id)a3;
- (BOOL)canRemove;
- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4;
- (BOOL)isValidValue:(id)a3;
- (id)_toneManager;
- (id)_vibrationManager;
- (id)description;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (id)labeledValue;
- (id)replacementForInvalidValue:(id)a3;
- (void)setLabeledValue:(id)a3;
@end

@implementation CNPropertyGroupAlertItem

+ (id)emptyValueForLabel:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B8B0]);

  return v3;
}

- (id)_vibrationManager
{
  Class v2 = (Class)getTLVibrationManagerClass[0]();

  return (id)[(objc_class *)v2 sharedVibrationManager];
}

- (id)_toneManager
{
  Class v2 = (Class)getTLToneManagerClass[0]();

  return (id)[(objc_class *)v2 sharedToneManager];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CNPropertyGroupItem *)self property];
  v6 = [(CNPropertyGroupAlertItem *)self labeledValue];
  v7 = [v6 value];
  v8 = [v3 stringWithFormat:@"<%@ %p> [%@] %@", v4, self, v5, v7];

  return v8;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5 = a3;
  v6 = [(CNPropertyGroupItem *)self property];
  v7 = [v5 property];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(CNPropertyGroupAlertItem *)self labeledValue];
    v9 = [v8 value];
    v10 = [v5 labeledValue];
    v11 = [v10 value];
    char v12 = [v9 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)canRemove
{
  return 0;
}

- (id)replacementForInvalidValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sound];
  v6 = [v4 vibration];
  if (v4)
  {
    if (v5)
    {
      v7 = [(CNPropertyGroupAlertItem *)self _toneManager];
      v8 = [v4 sound];
      char v9 = [v7 toneWithIdentifierIsValid:v8];

      if ((v9 & 1) == 0)
      {

        id v5 = 0;
      }
    }
    if (v6)
    {
      v10 = [(CNPropertyGroupAlertItem *)self _vibrationManager];
      v11 = [v4 vibration];
      char v12 = [v10 vibrationWithIdentifierIsValid:v11];

      if ((v12 & 1) == 0)
      {

        v6 = 0;
      }
    }
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1B8B0]), "initWithSound:vibration:ignoreMute:", v5, v6, objc_msgSend(v4, "ignoreMute"));

  return v13;
}

- (BOOL)isValidValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 sound];

    if (v6)
    {
      v7 = [(CNPropertyGroupAlertItem *)self _toneManager];
      v8 = [v5 sound];
      int v9 = [v7 toneWithIdentifierIsValid:v8];
    }
    else
    {
      int v9 = 1;
    }
    v10 = [v5 vibration];

    if (v10)
    {
      v11 = [(CNPropertyGroupAlertItem *)self _vibrationManager];
      char v12 = [v5 vibration];
      v9 &= [v11 vibrationWithIdentifierIsValid:v12];
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (id)displayStringForValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_25;
  }
  v6 = [v4 sound];
  if (v6)
  {
    v7 = NSString;
    v8 = CNContactsUIBundle();
    int v9 = [v8 localizedStringForKey:@"ALERT_SOUND_LABEL_AND_VALUE" value:&stru_1ED8AC728 table:@"Localized"];
    v10 = [(CNPropertyGroupAlertItem *)self _toneManager];
    v11 = [v5 sound];
    char v12 = [v10 nameForToneIdentifier:v11];
    v13 = objc_msgSend(v7, "stringWithFormat:", v9, v12);
  }
  else
  {
    v13 = 0;
  }

  v14 = [v5 vibration];
  if (v14)
  {
    v15 = NSString;
    v16 = CNContactsUIBundle();
    v17 = [v16 localizedStringForKey:@"ALERT_VIBRATION_LABEL_AND_VALUE" value:&stru_1ED8AC728 table:@"Localized"];
    v18 = [(CNPropertyGroupAlertItem *)self _vibrationManager];
    v19 = [v5 vibration];
    v20 = [v18 nameOfVibrationWithIdentifier:v19];
    v21 = objc_msgSend(v15, "stringWithFormat:", v17, v20);
  }
  else
  {
    v21 = 0;
  }

  if ([v5 ignoreMute])
  {
    v22 = CNContactsUIBundle();
    v23 = [v22 localizedStringForKey:@"ALERT_IGNORE_MUTE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  }
  else
  {
    v23 = 0;
  }
  v24 = [MEMORY[0x1E4F28E78] string];
  v25 = v24;
  if (v13) {
    [v24 appendString:v13];
  }
  if (v21)
  {
    if ([v25 length]) {
      [v25 appendString:@"\n"];
    }
    [v25 appendString:v21];
  }
  if (v23)
  {
    if ([v25 length]) {
      [v25 appendString:@"\n"];
    }
    [v25 appendString:v23];
  }
  id v26 = [v25 length] ? v25 : 0;

  if (!v26)
  {
LABEL_25:
    v27 = CNContactsUIBundle();
    id v26 = [v27 localizedStringForKey:@"RINGTONE_CARD_ITEM_DEFAULT_VALUE" value:&stru_1ED8AC728 table:@"Localized"];
  }

  return v26;
}

- (id)displayLabel
{
  Class v2 = [(CNPropertyGroupItem *)self property];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F1ADA0]];

  id v4 = CNContactsUIBundle();
  id v5 = v4;
  if (v3) {
    v6 = @"RINGTONE_CARD_ITEM_LABEL";
  }
  else {
    v6 = @"TEXTTONE_CARD_ITEM_LABEL";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized"];

  return v7;
}

- (void)setLabeledValue:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupItem *)self group];
  [v5 setLabeledValue:v4];
}

- (id)labeledValue
{
  Class v2 = [(CNPropertyGroupItem *)self group];
  int v3 = [v2 labeledValue];

  return v3;
}

@end