@interface AFSiriRingtone
- (AFSiriRingtone)init;
- (AFSiriRingtone)initWithContacts:(id)a3;
- (AFVoiceInfo)voiceInfo;
- (NSArray)contacts;
- (NSString)callDestinationID;
- (NSString)callServiceSpeakableName;
- (NSString)displayedCallerID;
- (NSString)textToSpeak;
- (id)_addPhoneticEscapeIfNotEmptyNotNil:(id)a3 withStartEscape:(id)a4 withEndEscape:(id)a5;
- (id)_bestVoiceInfoWithCurrentLocale:(id)a3;
- (id)_escapeCallDestinationIDString:(id)a3 forType:(int64_t)a4;
- (id)_escapeCallerIDString:(id)a3 forType:(int64_t)a4;
- (id)_generateSpokenTextForContacts:(id)a3 voiceLanguage:(id)a4 displayedCallerID:(id)a5 callerIDType:(int64_t)a6 callDestinationID:(id)a7 callDestinationIDType:(int64_t)a8 callServiceSpeakableName:(id)a9;
- (id)_phoneticNamesForContact:(id)a3 languageCode:(id)a4;
- (id)_spokenTextForCallDestinationID:(id)a3 ofType:(int64_t)a4 callServiceSpeakableName:(id)a5 languageCode:(id)a6;
- (id)_spokenTextForCallerID:(id)a3 ofType:(int64_t)a4 rawCaller:(id)a5 rawCallerType:(int64_t)a6 languageCode:(id)a7;
- (id)_spokenTextForContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5;
- (id)_spokenTextForOneContact:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5;
- (id)_spokenTextForThreeContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5;
- (id)_spokenTextForTwoContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5;
- (int64_t)callDestinationIDType;
- (int64_t)callerIDType;
- (void)_phoneticInfoForContact:(id)a3 languageCode:(id)a4 firstName:(id *)a5 middleName:(id *)a6 lastName:(id *)a7 nickname:(id *)a8;
- (void)setCallDestinationID:(id)a3;
- (void)setCallDestinationIDType:(int64_t)a3;
- (void)setCallServiceSpeakableName:(id)a3;
- (void)setCallerIDType:(int64_t)a3;
- (void)setContacts:(id)a3;
- (void)setDisplayedCallerID:(id)a3;
@end

@implementation AFSiriRingtone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceInfo, 0);
  objc_storeStrong((id *)&self->_callDestinationID, 0);
  objc_storeStrong((id *)&self->_callServiceSpeakableName, 0);
  objc_storeStrong((id *)&self->_displayedCallerID, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

- (AFVoiceInfo)voiceInfo
{
  return self->_voiceInfo;
}

- (void)setCallDestinationIDType:(int64_t)a3
{
  self->_callDestinationIDType = a3;
}

- (int64_t)callDestinationIDType
{
  return self->_callDestinationIDType;
}

- (void)setCallDestinationID:(id)a3
{
}

- (NSString)callDestinationID
{
  return self->_callDestinationID;
}

- (void)setCallServiceSpeakableName:(id)a3
{
}

- (NSString)callServiceSpeakableName
{
  return self->_callServiceSpeakableName;
}

- (void)setCallerIDType:(int64_t)a3
{
  self->_callerIDType = a3;
}

- (int64_t)callerIDType
{
  return self->_callerIDType;
}

- (void)setDisplayedCallerID:(id)a3
{
}

- (NSString)displayedCallerID
{
  return self->_displayedCallerID;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (id)_escapeCallDestinationIDString:(id)a3 forType:(int64_t)a4
{
  v5 = (__CFString *)a3;
  v6 = v5;
  if (a4 == 1)
  {
    if (softLinkIMStringIsPhoneNumber(v5))
    {
      v7 = @"\x1B\\tn=phone\\%@\x1B\\tn=normal\\"";
      goto LABEL_7;
    }
  }
  else
  {
    if (a4 != 2)
    {
LABEL_8:
      v6 = v6;
      v9 = v6;
      goto LABEL_10;
    }
    if (softLinkIMStringIsEmail(v5))
    {
      v7 = @"\x1B\\tn=email\\%@\x1B\\tn=normal\\"";
LABEL_7:
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", v7, v6);

      v6 = (__CFString *)v8;
      goto LABEL_8;
    }
  }
  v9 = &stru_1EEE35D28;
LABEL_10:

  return v9;
}

- (id)_escapeCallerIDString:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  if ((unint64_t)(a4 - 1) <= 2)
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", off_1E5924B50[a4 - 1], v5);

    id v5 = (id)v6;
  }
  return v5;
}

- (id)_addPhoneticEscapeIfNotEmptyNotNil:(id)a3 withStartEscape:(id)a4 withEndEscape:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && [v7 length])
  {
    v10 = [NSString stringWithFormat:@"%@%@%@", v8, v7, v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_phoneticNamesForContact:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v40 = 0;
    id v41 = 0;
    id v38 = 0;
    id v39 = 0;
    [(AFSiriRingtone *)self _phoneticInfoForContact:v6 languageCode:v7 firstName:&v41 middleName:&v40 lastName:&v39 nickname:&v38];
    id v8 = v41;
    id v9 = v40;
    id v10 = v39;
    id v11 = v38;
    if ([v7 isEqualToString:@"en-IN"])
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 27);
      [NSString stringWithFormat:@"%@\\toi=x-sampa-internal\\"", v12];
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"%@\\toi=orth\\"", v12];
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = @"\x1B/+";
      v36 = @"\x1B/+";
    }
    id v37 = v7;
    v14 = [[AFPhonemeMapper alloc] initWithLanguageCode:v7];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [(AFPhonemeMapper *)v14 stringByReplacingPhonemesInString:v8];

      uint64_t v17 = [(AFPhonemeMapper *)v15 stringByReplacingPhonemesInString:v9];

      uint64_t v18 = [(AFPhonemeMapper *)v15 stringByReplacingPhonemesInString:v10];

      uint64_t v19 = [(AFPhonemeMapper *)v15 stringByReplacingPhonemesInString:v11];

      id v9 = (id)v17;
      id v10 = (id)v18;
      id v11 = (id)v19;
      id v8 = (id)v16;
    }
    v20 = [(AFSiriRingtone *)self _addPhoneticEscapeIfNotEmptyNotNil:v8 withStartEscape:v36 withEndEscape:v35];

    v21 = [(AFSiriRingtone *)self _addPhoneticEscapeIfNotEmptyNotNil:v9 withStartEscape:v36 withEndEscape:v35];

    v22 = [(AFSiriRingtone *)self _addPhoneticEscapeIfNotEmptyNotNil:v10 withStartEscape:v36 withEndEscape:v35];

    v23 = [(AFSiriRingtone *)self _addPhoneticEscapeIfNotEmptyNotNil:v11 withStartEscape:v36 withEndEscape:v35];

    if (![v20 length])
    {
      uint64_t v24 = [v6 pronunciationGivenName];

      v20 = (void *)v24;
    }
    if (![v22 length])
    {
      uint64_t v25 = [v6 pronunciationFamilyName];

      v22 = (void *)v25;
    }
    if (![v20 length])
    {
      uint64_t v26 = [v6 phoneticGivenName];

      v20 = (void *)v26;
    }
    if (![v21 length])
    {
      uint64_t v27 = [v6 phoneticMiddleName];

      v21 = (void *)v27;
    }
    if (![v22 length])
    {
      uint64_t v28 = [v6 phoneticFamilyName];

      v22 = (void *)v28;
    }
    v13 = objc_alloc_init(AFSiriPhoneticContactNames);
    [(AFSiriPhoneticContactNames *)v13 setLanguageCode:v37];
    if ([v20 length])
    {
      [(AFSiriPhoneticContactNames *)v13 setGivenName:v20];
    }
    else
    {
      v29 = [v6 givenName];
      [(AFSiriPhoneticContactNames *)v13 setGivenName:v29];
    }
    if ([v21 length])
    {
      [(AFSiriPhoneticContactNames *)v13 setMiddleName:v21];
    }
    else
    {
      v30 = [v6 middleName];
      [(AFSiriPhoneticContactNames *)v13 setMiddleName:v30];
    }
    if ([v22 length])
    {
      [(AFSiriPhoneticContactNames *)v13 setFamilyName:v22];
    }
    else
    {
      v31 = [v6 familyName];
      [(AFSiriPhoneticContactNames *)v13 setFamilyName:v31];
    }
    if ([v23 length])
    {
      [(AFSiriPhoneticContactNames *)v13 setNickname:v23];
    }
    else
    {
      v32 = [v6 nickname];
      [(AFSiriPhoneticContactNames *)v13 setNickname:v32];
    }
    v33 = [v6 organizationName];
    [(AFSiriPhoneticContactNames *)v13 setOrganizationName:v33];

    id v7 = v37;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_phoneticInfoForContact:(id)a3 languageCode:(id)a4 firstName:(id *)a5 middleName:(id *)a6 lastName:(id *)a7 nickname:(id *)a8
{
  id v9 = (void (__cdecl *)())getCNContactPhonemeDataKey;
  id v10 = a4;
  id v11 = a3;
  v12 = v9();
  v13 = [v11 valueForKey:v12];

  id v38 = v13;
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F28D90];
    v15 = [v13 dataUsingEncoding:4];
    uint64_t v16 = [v14 JSONObjectWithData:v15 options:0 error:0];

    objc_opt_class();
    id v17 = 0;
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
  }
  else
  {
    id v17 = 0;
  }
  uint64_t v18 = [v17 objectForKey:@"phonemeInformation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  v20 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  v21 = [v19 objectForKey:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    if (v21)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __94__AFSiriRingtone__phoneticInfoForContact_languageCode_firstName_middleName_lastName_nickname___block_invoke;
      v39[3] = &unk_1E5924B30;
      id v22 = v21;
      id v40 = v22;
      id v33 = v19;
      v23 = (void (**)(void, void))MEMORY[0x19F3A50D0](v39);
      uint64_t v24 = (void *)*MEMORY[0x1E4F96BC8];
      uint64_t v25 = (void *)*MEMORY[0x1E4F96BD0];
      uint64_t v26 = _FullyQualifiedDomainObjectProperty((void *)*MEMORY[0x1E4F96BC8], (void *)*MEMORY[0x1E4F96BD0], (void *)*MEMORY[0x1E4F97518]);
      uint64_t v27 = ((void (**)(void, void *))v23)[2](v23, v26);

      uint64_t v28 = _FullyQualifiedDomainObjectProperty(v24, v25, (void *)*MEMORY[0x1E4F97528]);
      v29 = ((void (**)(void, void *))v23)[2](v23, v28);

      v30 = _FullyQualifiedDomainObjectProperty(v24, v25, (void *)*MEMORY[0x1E4F97520]);
      v21 = ((void (**)(void, void *))v23)[2](v23, v30);

      v31 = _FullyQualifiedDomainObjectProperty(v24, v25, (void *)*MEMORY[0x1E4F97530]);
      v32 = ((void (**)(void, void *))v23)[2](v23, v31);

      id v19 = v33;
      goto LABEL_15;
    }
    id v22 = 0;
    uint64_t v27 = 0;
    v29 = 0;
  }
  else
  {

    id v22 = 0;
    uint64_t v27 = 0;
    v29 = 0;
    v21 = 0;
  }
  v32 = 0;
LABEL_15:
  if (a5) {
    *a5 = v27;
  }
  if (a6) {
    *a6 = v29;
  }
  if (a7) {
    *a7 = v21;
  }
  if (a8) {
    *a8 = v32;
  }
}

id __94__AFSiriRingtone__phoneticInfoForContact_languageCode_firstName_middleName_lastName_nickname___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = [v3 objectForKey:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if ([v6 length]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_spokenTextForCallDestinationID:(id)a3 ofType:(int64_t)a4 callServiceSpeakableName:(id)a5 languageCode:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [(AFSiriRingtone *)self _escapeCallDestinationIDString:a3 forType:a4];
  if ([v10 length])
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      v14 = AFRingtoneLocalizedString(@"RAW_CALLER_WITH_SERVICE", v11);
      id v13 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v14, v12, v10);

      if (v13) {
        goto LABEL_7;
      }
    }
    else
    {
      id v13 = v10;
      if (v13) {
        goto LABEL_7;
      }
    }
  }
  id v13 = v12;
LABEL_7:

  return v13;
}

- (id)_spokenTextForCallerID:(id)a3 ofType:(int64_t)a4 rawCaller:(id)a5 rawCallerType:(int64_t)a6 languageCode:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  v14 = [(AFSiriRingtone *)self _escapeCallerIDString:a3 forType:a4];
  v15 = [(AFSiriRingtone *)self _escapeCallDestinationIDString:v13 forType:a6];

  if (![v15 length]
    || (AFRingtoneLocalizedString(@"CALLER_ID_WITH_RAW_CALLER", v12),
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v16, v14, v15),
        v16,
        !v17))
  {
    id v17 = v14;
  }
  id v18 = v17;

  return v18;
}

- (id)_spokenTextForContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] > 3)
  {
    id v12 = [v8 objectAtIndex:0];
    id v13 = [(AFSiriRingtone *)self _phoneticNamesForContact:v12 languageCode:v10];
    v14 = [v13 spokenName];
    v15 = [v8 objectAtIndex:1];
    v30 = [(AFSiriRingtone *)self _phoneticNamesForContact:v15 languageCode:v10];
    uint64_t v16 = [v30 spokenName];
    id v17 = (void *)v16;
    id v11 = 0;
    if (v14 && v16)
    {
      uint64_t v27 = AFRingtoneLocalizedString(@"MORE_THAN_THREE_CONTACTS", v10);
      v29 = v12;
      id v18 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      uint64_t v26 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      id v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v26];
      uint64_t v25 = v18;
      [v18 setLocale:v19];

      id v20 = [NSString alloc];
      uint64_t v28 = v15;
      v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - 2);
      [v18 stringFromNumber:v21];
      v23 = id v22 = v13;
      id v11 = objc_msgSend(v20, "initWithFormat:", v27, v14, v17, v23);

      id v13 = v22;
      v15 = v28;

      id v12 = v29;
    }
    if (v14 && !v11)
    {
      id v11 = [(AFSiriRingtone *)self _spokenTextForOneContact:v12 callServiceSpeakableName:v9 languageCode:v10];
    }
    if (!v11 && v17)
    {
      id v11 = [(AFSiriRingtone *)self _spokenTextForOneContact:v15 callServiceSpeakableName:v9 languageCode:v10];
    }
  }
  else
  {
    id v11 = [(AFSiriRingtone *)self _spokenTextForThreeContacts:v8 callServiceSpeakableName:v9 languageCode:v10];
  }

  return v11;
}

- (id)_spokenTextForThreeContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] > 2)
  {
    id v12 = [v8 objectAtIndex:0];
    id v13 = [(AFSiriRingtone *)self _phoneticNamesForContact:v12 languageCode:v10];
    v14 = [v13 spokenName];
    v15 = [v8 objectAtIndex:1];
    v29 = [(AFSiriRingtone *)self _phoneticNamesForContact:v15 languageCode:v10];
    uint64_t v16 = [v29 spokenName];
    id v17 = (void *)v16;
    id v11 = 0;
    if (v14 && v16)
    {
      uint64_t v27 = AFRingtoneLocalizedString(@"THREE_CONTACTS", v10);
      uint64_t v28 = v12;
      id v18 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      uint64_t v26 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      id v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v26];
      uint64_t v25 = v18;
      [v18 setLocale:v19];

      id v20 = [NSString alloc];
      [v18 stringFromNumber:&unk_1EEE963F8];
      v21 = v15;
      v23 = id v22 = v13;
      id v11 = objc_msgSend(v20, "initWithFormat:", v27, v14, v17, v23);

      id v13 = v22;
      v15 = v21;

      id v12 = v28;
    }
    if (v14 && !v11)
    {
      id v11 = [(AFSiriRingtone *)self _spokenTextForOneContact:v12 callServiceSpeakableName:v9 languageCode:v10];
    }
    if (!v11 && v17)
    {
      id v11 = [(AFSiriRingtone *)self _spokenTextForOneContact:v15 callServiceSpeakableName:v9 languageCode:v10];
    }
  }
  else
  {
    id v11 = [(AFSiriRingtone *)self _spokenTextForTwoContacts:v8 callServiceSpeakableName:v9 languageCode:v10];
  }

  return v11;
}

- (id)_spokenTextForTwoContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v8 count];
  id v12 = [v8 firstObject];
  if (v11 > 1)
  {
    v14 = [(AFSiriRingtone *)self _phoneticNamesForContact:v12 languageCode:v10];
    v15 = [v14 givenName];
    uint64_t v26 = [v14 familyName];
    uint64_t v25 = [v14 spokenName];
    v23 = [v8 lastObject];
    uint64_t v16 = -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:");
    uint64_t v24 = [v16 familyName];
    uint64_t v17 = [v16 spokenName];
    id v18 = (void *)v17;
    if (!v15
      || !v17
      || !v26
      || !v24
      || ![v26 isEqualToString:v24]
      || (AFRingtoneLocalizedString(@"TWO_CONTACTS_SHARED_FAMILY_NAME", v10),
          v21 = objc_claimAutoreleasedReturnValue(),
          id v13 = objc_msgSend([NSString alloc], "initWithFormat:", v21, v15, v18),
          v21,
          !v13))
    {
      if (!v25
        || !v18
        || (AFRingtoneLocalizedString(@"TWO_CONTACTS", v10),
            id v22 = v15,
            id v19 = objc_claimAutoreleasedReturnValue(),
            id v13 = objc_msgSend([NSString alloc], "initWithFormat:", v19, v25, v18),
            v19,
            v15 = v22,
            !v13))
      {
        id v13 = [(AFSiriRingtone *)self _spokenTextForOneContact:v12 callServiceSpeakableName:v9 languageCode:v10];
        if (!v13)
        {
          id v13 = [(AFSiriRingtone *)self _spokenTextForOneContact:v23 callServiceSpeakableName:v9 languageCode:v10];
        }
      }
    }
  }
  else
  {
    id v13 = [(AFSiriRingtone *)self _spokenTextForOneContact:v12 callServiceSpeakableName:v9 languageCode:v10];
  }

  return v13;
}

- (id)_spokenTextForOneContact:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AFSiriRingtone *)self _phoneticNamesForContact:a3 languageCode:v9];
  unint64_t v11 = [v10 spokenName];
  id v12 = v11;
  if (v11)
  {
    if (v8)
    {
      id v13 = AFRingtoneLocalizedString(@"CONTACT_WITH_TYPE", v9);
      id v14 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v13, v12, v8);
    }
    else
    {
      id v14 = v11;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_generateSpokenTextForContacts:(id)a3 voiceLanguage:(id)a4 displayedCallerID:(id)a5 callerIDType:(int64_t)a6 callDestinationID:(id)a7 callDestinationIDType:(int64_t)a8 callServiceSpeakableName:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  if (![v15 count]
    || ([(AFSiriRingtone *)self _spokenTextForContacts:v15 callServiceSpeakableName:v19 languageCode:v16], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![v19 length] && ((unint64_t)(a6 - 3) < 2 || a8 == 1))
    {
      uint64_t v21 = AFRingtoneLocalizedString(@"UNKNOWN_CALLER", v16);
      goto LABEL_11;
    }
    if (v17)
    {
      uint64_t v21 = [(AFSiriRingtone *)self _spokenTextForCallerID:v17 ofType:a6 rawCaller:v18 rawCallerType:a8 languageCode:v16];
LABEL_11:
      id v20 = (void *)v21;
      goto LABEL_12;
    }
    if (v18)
    {
      uint64_t v21 = [(AFSiriRingtone *)self _spokenTextForCallDestinationID:v18 ofType:a8 callServiceSpeakableName:v19 languageCode:v16];
      goto LABEL_11;
    }
    id v20 = 0;
  }
LABEL_12:

  return v20;
}

- (NSString)textToSpeak
{
  return (NSString *)[(AFSiriRingtone *)self _generateSpokenTextForContacts:self->_contacts voiceLanguage:self->_voiceLanguage displayedCallerID:self->_displayedCallerID callerIDType:self->_callerIDType callDestinationID:self->_callDestinationID callDestinationIDType:self->_callDestinationIDType callServiceSpeakableName:self->_callServiceSpeakableName];
}

- (AFSiriRingtone)initWithContacts:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AFSiriRingtone;
  id v5 = [(AFSiriRingtone *)&v21 init];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 copy];
  contacts = v5->_contacts;
  v5->_contacts = (NSArray *)v6;

  id v8 = +[AFConnection outputVoice];
  id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = [v9 objectForKey:*MEMORY[0x1E4F1C438]];
  unint64_t v11 = [(AFVoiceInfo *)v8 languageCode];
  v5->_languageMismatch = [v11 hasPrefix:v10] ^ 1;

  if (v5->_languageMismatch)
  {
    id v12 = +[AFPreferences sharedPreferences];
    int v13 = [v12 assistantIsEnabled] ^ 1;

    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    int v13 = 0;
    if (!v8)
    {
LABEL_7:
      uint64_t v14 = [(AFSiriRingtone *)v5 _bestVoiceInfoWithCurrentLocale:v9];

      id v8 = (AFVoiceInfo *)v14;
      goto LABEL_8;
    }
  }
  if (v13) {
    goto LABEL_7;
  }
LABEL_8:
  voiceInfo = v5->_voiceInfo;
  v5->_voiceInfo = v8;
  id v16 = v8;

  uint64_t v17 = [(AFVoiceInfo *)v5->_voiceInfo languageCode];
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = @"en-US";
  }
  objc_storeStrong((id *)&v5->_voiceLanguage, v19);

LABEL_12:
  return v5;
}

- (id)_bestVoiceInfoWithCurrentLocale:(id)a3
{
  id v3 = a3;
  id v4 = (void *)VSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  if (![v4 length])
  {
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F1C438]];
    uint64_t v6 = (void *)v5;
    id v7 = @"en";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    id v8 = v7;

    uint64_t v9 = [v3 objectForKey:*MEMORY[0x1E4F1C400]];
    id v10 = (void *)v9;
    unint64_t v11 = @"US";
    if (v9) {
      unint64_t v11 = (__CFString *)v9;
    }
    id v12 = v11;

    uint64_t v13 = [[NSString alloc] initWithFormat:@"%@-%@", v8, v12];
    id v4 = (void *)v13;
  }
  uint64_t v14 = [[AFVoiceInfo alloc] initWithLanguageCode:v4];

  return v14;
}

- (AFSiriRingtone)init
{
  return 0;
}

@end