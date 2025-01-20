@interface CBLocationController
+ (id)sharedLocationController;
- (CBLanguageComposite)languageComposite;
- (CBLocationController)init;
- (NSArray)firstGuessedLanguages;
- (NSArray)guessedCountries;
- (NSDate)wirelessScanStartDate;
- (id)_checkForAliases:(id)a3;
- (id)_checkForAliasesOrInvalid:(id)a3;
- (id)_checkedArrayForString:(id)a3;
- (id)aliasDict;
- (id)guessedLanguages;
- (void)_closeWifiConnection;
- (void)_scanComplete:(id)a3;
- (void)_scanWifiList;
- (void)_startWifiScan;
- (void)dealloc;
- (void)reset;
- (void)selectLanguage:(id)a3 restartAfterCompletion:(id)a4;
- (void)setFirstGuessedLanguages:(id)a3;
- (void)setGuessedCountries:(id)a3;
- (void)setLanguageComposite:(id)a3;
- (void)setWirelessScanStartDate:(id)a3;
- (void)updateLanguageComposite;
@end

@implementation CBLocationController

+ (id)sharedLocationController
{
  v2 = (void *)qword_10008FDE0;
  if (!qword_10008FDE0)
  {
    v3 = objc_alloc_init(CBLocationController);
    v4 = (void *)qword_10008FDE0;
    qword_10008FDE0 = (uint64_t)v3;

    v2 = (void *)qword_10008FDE0;
  }

  return v2;
}

- (id)aliasDict
{
  aliasDict = self->_aliasDict;
  if (!aliasDict)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"CountryAlias" ofType:@"plist"];
    v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];
    v7 = self->_aliasDict;
    self->_aliasDict = v6;

    aliasDict = self->_aliasDict;
  }

  return aliasDict;
}

- (id)_checkForAliases:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CBLocationController *)self aliasDict];
    v6 = [v5 objectForKey:@"countryAlias"];

    id v7 = [v4 count];
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7;
      unint64_t v9 = 0;
      do
      {
        v10 = [v4 objectAtIndexedSubscript:v9];
        v11 = [v6 objectForKey:v10];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
          }
          else
          {
            v16 = v11;
            id v12 = +[NSArray arrayWithObjects:&v16 count:1];
          }
          v14 = v12;
          [v4 replaceObjectsInRange:v9 withObjectsFromArray:v12];
          uint64_t v13 = (uint64_t)[v14 count];
        }
        else
        {
          uint64_t v13 = 1;
        }
        v9 += v13;
      }
      while (v9 < v8);
    }
  }

  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v24 = v4;
  if (!self->_validCountries)
  {
    v6 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = +[NSLocale availableLocaleIdentifiers];
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = +[NSLocale canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          uint64_t v13 = +[NSLocale componentsFromLocaleIdentifier:v12];

          v14 = [v13 objectForKey:NSLocaleCountryCode];
          if (v14) {
            [(NSSet *)v6 addObject:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    id v4 = v24;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v16 = [(CBLocationController *)self _checkForAliases:v4];
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        if ([(NSSet *)self->_validCountries containsObject:v21])
        {
          [v5 addObject:v21];
        }
        else
        {
          v22 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Location: Found country '%@', but this is not a valid country code, ignoring", buf, 0xCu);
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v18);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  if (a3)
  {
    id v4 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:");
    v5 = [(CBLocationController *)self _checkForAliases:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CBLocationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBLocationController;
  v2 = [(CBLocationController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CBLanguageComposite);
    languageComposite = v2->_languageComposite;
    v2->_languageComposite = v3;

    if (!v2->_guessedCountries)
    {
      if (+[CBUtilities isRunningOnPhysicalHardware]) {
        [(CBLocationController *)v2 _startWifiScan];
      }
      else {
        [(CBLocationController *)v2 _scanComplete:&__NSArray0__struct];
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  [(CBLocationController *)self _closeWifiConnection];
  v3.receiver = self;
  v3.super_class = (Class)CBLocationController;
  [(CBLocationController *)&v3 dealloc];
}

- (id)guessedLanguages
{
  v2 = self;
  if ([(NSArray *)self->_guessedCountries count])
  {
    objc_super v3 = +[NSMutableArray array];
    id v4 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = v2;
    v5 = v2->_guessedCountries;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[IntlUtility preferredLanguagesForRegion:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          v11 = [v10 reverseObjectEnumerator];
          id v12 = [v11 allObjects];

          [v4 addObject:v12];
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v7);
    }

    while (1)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = v4;
      id v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (!v14) {
        break;
      }
      id v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
          v20 = [v19 lastObject];
          if (v20)
          {
            if (([v3 containsObject:v20] & 1) == 0) {
              [v3 addObject:v20];
            }
            [v19 removeLastObject];
            char v16 = 1;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v15);

      if ((v16 & 1) == 0) {
        goto LABEL_25;
      }
    }

LABEL_25:
    v2 = v24;
  }
  else
  {
    objc_super v3 = 0;
  }
  uint64_t v21 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    guessedCountries = v2->_guessedCountries;
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = guessedCountries;
    __int16 v35 = 2112;
    v36 = v3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Language Location: Languages for countries %@ = %@", buf, 0x16u);
  }

  if (!v2->_firstGuessedLanguages) {
    [(CBLocationController *)v2 setFirstGuessedLanguages:v3];
  }

  return v3;
}

- (void)_startWifiScan
{
  objc_super v3 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
  cwInterface = self->cwInterface;
  self->cwInterface = v3;

  v5 = self->cwInterface;
  if (!v5)
  {
    id v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Language Location: CWFInterface failed", v7, 2u);
    }

    v5 = self->cwInterface;
  }
  [(CWFInterface *)v5 activate];
  [(CBLocationController *)self _scanWifiList];
}

- (void)_scanWifiList
{
  objc_super v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Language Location: started wifi scan", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)CWFScanParameters);
  v5 = +[NSSet setWithArray:&off_10007CF68];
  [v4 setIncludeProperties:v5];

  id v6 = +[NSDate date];
  [(CBLocationController *)self setWirelessScanStartDate:v6];

  cwInterface = self->cwInterface;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000160C4;
  v8[3] = &unk_100079990;
  v8[4] = self;
  [(CWFInterface *)cwInterface performScanWithParameters:v4 reply:v8];
}

- (void)_scanComplete:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_guessedCountries) {
    goto LABEL_44;
  }
  id v6 = (char *)[v4 count];
  if (!v6) {
    goto LABEL_44;
  }
  id v7 = v6;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSCountedSet);
  for (i = 0; i != v7; ++i)
  {
    v11 = [v5 objectAtIndexedSubscript:i];
    id v12 = [v11 countryCode];

    if (v12)
    {
      id v13 = [v11 countryCode];
      [v8 addObject:v13];
    }
  }
  v37 = v8;
  id v14 = [(CBLocationController *)self _checkForAliasesOrInvalid:v8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        [v9 addObject:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
      }
      id v16 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v16);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v19 = v9;
  id v20 = [v19 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v20)
  {
    v36 = self;
    id v21 = 0;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [v19 countForObject:*((void *)&v42 + 1) + 8 * k];
        if (v24 > v21) {
          id v21 = v24;
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v20);

    if (!v21)
    {
      id v20 = 0;
      self = v36;
      goto LABEL_36;
    }
    id v20 = +[NSMutableArray array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v25 = v19;
    id v26 = [v25 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * (void)m);
          if ([v25 countForObject:v30] == v21) {
            [v20 addObject:v30];
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v27);
    }
    self = v36;
  }

LABEL_36:
  id v31 = [v20 count];
  long long v32 = CheckerBoardLogHandleForCategory();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v33)
    {
      id v34 = [v20 count];
      *(_DWORD *)buf = 134217984;
      id v51 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Language Location: Adding %lu countries from Wifi scan.", buf, 0xCu);
    }

    [(CBLocationController *)self setGuessedCountries:v20];
  }
  else
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Language Location: No valid countries in Wifi scan.", buf, 2u);
    }
  }
LABEL_44:
  [(CBLocationController *)self _closeWifiConnection];
  [(CBLocationController *)self updateLanguageComposite];
  __int16 v35 = +[NSNotificationCenter defaultCenter];
  [v35 postNotificationName:@"CBLanguageCompositeWifiScanComplete" object:0];
}

- (void)_closeWifiConnection
{
  cwInterface = self->cwInterface;
  if (cwInterface)
  {
    [(CWFInterface *)cwInterface invalidate];
    id v4 = self->cwInterface;
    self->cwInterface = 0;
  }
}

- (void)reset
{
}

- (void)updateLanguageComposite
{
  v2 = +[NSLocale baseSystemLanguages];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v11 = +[NSLocale localeWithLocaleIdentifier:v10];
        id v12 = [v11 localizedStringForLanguage:v10 context:4];
        if (!v12) {
          id v12 = v10;
        }
        [v3 setValue:v12 forKey:v10];
        [v4 setValue:v11 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  id v13 = [(CBLocationController *)self guessedLanguages];
  id v14 = +[NSMutableOrderedSet orderedSet];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = +[NSLocale baseLanguageFromLanguage:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
        [v14 addObject:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  [v14 addObjectsFromArray:v5];
  id v21 = [v14 array];
  uint64_t v22 = [(CBLocationController *)self languageComposite];
  [v22 setLanguageCodes:v21];

  v23 = [(CBLocationController *)self languageComposite];
  [v23 setLanguageStrings:v3];

  id v24 = [(CBLocationController *)self languageComposite];
  [v24 setLocales:v4];
}

- (void)selectLanguage:(id)a3 restartAfterCompletion:(id)a4
{
  id v14 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = +[NSLocale currentLocale];
  id v7 = [v6 languageCode];

  if (v7 != v14)
  {
    uint64_t v8 = +[CBLocationController sharedLocationController];
    id v9 = [v8 guessedCountries];
    uint64_t v10 = [v9 firstObject];

    id v11 = v14;
    if ([v10 length])
    {
      uint64_t v12 = +[NSLocale languageFromLanguage:v11 byReplacingRegion:v10];

      id v11 = (id)v12;
    }
    +[NSLocale setLocaleAfterLanguageChange:v11];
    +[NSLocale setPreferredLanguageAndUpdateLocale:v11];
    if (v5) {
      v5[2](v5);
    }
    id v13 = +[FBSystemService sharedInstance];
    [v13 exitAndRelaunch:1];
  }
}

- (NSArray)guessedCountries
{
  return self->_guessedCountries;
}

- (void)setGuessedCountries:(id)a3
{
}

- (NSArray)firstGuessedLanguages
{
  return self->_firstGuessedLanguages;
}

- (void)setFirstGuessedLanguages:(id)a3
{
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
}

- (CBLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (void)setLanguageComposite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageComposite, 0);
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->cwInterface, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_aliasDict, 0);

  objc_storeStrong((id *)&self->_guessedCountries, 0);
}

@end