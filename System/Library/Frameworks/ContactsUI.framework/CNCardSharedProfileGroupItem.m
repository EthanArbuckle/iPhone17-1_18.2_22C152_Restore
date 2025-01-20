@interface CNCardSharedProfileGroupItem
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (id)contactDisplayName;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (id)sharedByDisplayString;
- (int64_t)sharedPhotoDisplayPreference;
- (int64_t)sharedPhotoDisplayPreferenceForValue:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
@end

@implementation CNCardSharedProfileGroupItem

- (void).cxx_destruct
{
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (int64_t)sharedPhotoDisplayPreference
{
  v3 = [(CNPropertyGroupItem *)self labeledValue];
  v4 = [v3 value];
  int64_t v5 = [(CNCardSharedProfileGroupItem *)self sharedPhotoDisplayPreferenceForValue:v4];

  return v5;
}

- (int64_t)sharedPhotoDisplayPreferenceForValue:(id)a3
{
  return [a3 integerValue];
}

- (id)sharedByDisplayString
{
  v3 = NSString;
  v4 = CNContactsUIBundle();
  int64_t v5 = [v4 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_VALUE_ALWAYS_UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
  v6 = [(CNCardSharedProfileGroupItem *)self contactDisplayName];
  v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)displayStringForValue:(id)a3
{
  v4 = [(CNCardSharedProfileGroupItem *)self sharedProfileStateOracle];
  uint64_t v5 = [v4 effectiveStateForContact];

  if (v5 != 1)
  {
    if (v5 != 3)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v6 = [(CNPropertyGroupItem *)self contact];
    uint64_t v7 = [v6 sharedPhotoDisplayPreference];

    v8 = [(CNCardSharedProfileGroupItem *)self sharedProfileStateOracle];
    v9 = [v8 pendingNickname];
    if (v9)
    {
      BOOL v10 = 0;
    }
    else
    {
      v12 = [(CNCardSharedProfileGroupItem *)self sharedProfileStateOracle];
      v13 = [v12 currentNickname];
      BOOL v10 = v13 == 0;
    }
    v11 = 0;
    if (!v7 || v10) {
      goto LABEL_10;
    }
  }
  v11 = [(CNCardSharedProfileGroupItem *)self sharedByDisplayString];
LABEL_10:

  return v11;
}

- (id)contactDisplayName
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v3 setStyle:1000];
  [v3 setFallbackStyle:-1];
  v4 = [(CNPropertyGroupItem *)self contact];
  uint64_t v5 = [v3 stringFromContact:v4];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_1ED8AC728;
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)displayLabel
{
  return &stru_1ED8AC728;
}

@end