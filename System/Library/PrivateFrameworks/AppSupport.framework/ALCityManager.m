@interface ALCityManager
+ (BOOL)willApplyTimeZoneChanges1;
+ (__CFArray)legacyCityForCity:(id)a3;
+ (id)_localeDictionaryFromSQLRow:(char *)a3;
+ (id)newCitiesByIdentifierMap:(id)a3;
+ (id)sharedManager;
- (ALCityManager)init;
- (BOOL)_shouldUseTablesAlternate1;
- (CPSearchMatcher)citySearchMatcher;
- (id)_cityForClassicIdentifier:(id)a3 commaSearchOptions:(unint64_t)a4;
- (id)_cityForTimeZone:(id)a3 localeCode:(id)a4;
- (id)_defaultCityForTimeZone:(id)a3 localeCode:(id)a4;
- (id)_whileDatabaseLocked_localeCodesMatchingQualifier:(id)a3;
- (id)allCities;
- (id)allLocales;
- (id)bestCityForLegacyCity:(__CFArray *)a3;
- (id)citiesMatchingName:(id)a3;
- (id)citiesMatchingName:(id)a3 localized:(BOOL)a4;
- (id)citiesMatchingQualifier:(id)a3;
- (id)citiesWithIdentifiers:(id)a3;
- (id)citiesWithTimeZone:(id)a3;
- (id)cityForClassicIdentifier:(id)a3;
- (id)defaultCitiesForLocaleCode:(id)a3;
- (id)defaultCitiesForLocaleCode:(id)a3 options:(int)a4;
- (id)defaultCitiesShownInWorldClock;
- (id)defaultCityForTimeZone:(id)a3;
- (id)defaultCityForTimeZone:(id)a3 localeCode:(id)a4;
- (id)localeWithCode:(id)a3;
- (void)_whileDatabaseLocked_ensureGreenKeyValueCaches;
- (void)_whileDatabaseLocked_modifyCityForGreen:(id)a3;
- (void)dealloc;
- (void)init;
- (void)localizeCities:(id)a3;
@end

@implementation ALCityManager

- (ALCityManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ALCityManager;
  v2 = [(ALCityManager *)&v11 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v2->_databaseAccessRecursiveLock = v3;
    [(NSRecursiveLock *)v3 setName:@"com.apple.AppSupport.ALCityManager.databaseAccessLock"];
    v4 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppSupport"];
    int v5 = sqlite3_open_v2((const char *)objc_msgSend((id)objc_msgSend(v4, "pathForResource:ofType:", @"CityInfo", @"db"), "UTF8String"), &v2->_db, 1, "unix-none");
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ALCityManager init](v6);
      }
      v2->_db = 0;

      return 0;
    }
    else
    {
      v7 = (void *)[v4 pathForResource:@"Localizable_Places" ofType:@"db"];
      if ([v7 length])
      {
        int v8 = sqlite3_open_v2((const char *)[v7 UTF8String], &v2->_localizedDb, 1, "unix-none");
        if (v8)
        {
          int v9 = v8;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[ALCityManager init](v9);
          }
          v2->_localizedDb = 0;
        }
        else
        {
          sqlite3_create_function(v2->_localizedDb, "CDLIKE", 1, 1, v2, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ALBasicDiacriticMatch, 0, 0);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[ALCityManager init]();
        }
        v2->_localizedDb = 0;
      }
      sqlite3_create_function(v2->_db, "CDLIKE", 1, 1, v2, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ALBasicDiacriticMatch, 0, 0);
    }
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  }
  return (id)sharedManager__sharedManager;
}

ALCityManager *__30__ALCityManager_sharedManager__block_invoke()
{
  result = objc_alloc_init(ALCityManager);
  sharedManager__sharedManager = (uint64_t)result;
  return result;
}

- (id)allCities
{
  id v3 = [(ALCityManager *)self citiesMatchingQualifier:@"identifier IS NOT NULL"];
  if (self->_localizedDb) {
    [(ALCityManager *)self localizeCities:v3];
  }
  return v3;
}

- (id)citiesMatchingName:(id)a3
{
  return [(ALCityManager *)self citiesMatchingName:a3 localized:1];
}

- (id)citiesMatchingName:(id)a3 localized:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];

  self->_citySearchMatcher = [[CPSearchMatcher alloc] initWithSearchString:a3];
  unint64_t v7 = 0x1E5668000uLL;
  id v8 = +[ALCityManager newCitiesByIdentifierMap:[(ALCityManager *)self citiesMatchingQualifier:@"CDLIKE(name) = 1 OR CDLIKE(country_name) = 1"]];
  [(ALCityManager *)self _whileDatabaseLocked_ensureGreenKeyValueCaches];
  if (self->_greenKey2ValueCache
    && objc_msgSend(-[ALCityManager _whileDatabaseLocked_localeCodesMatchingQualifier:](self, "_whileDatabaseLocked_localeCodesMatchingQualifier:", @"CDLIKE(country_name) = 1 AND code = \"CN\"), "count"") == 1&& self->_greenKey2ValueCache)
  {
    id v9 = +[ALCityManager newCitiesByIdentifierMap:[(ALCityManager *)self citiesMatchingQualifier:@"locale_code = \"TW\""]];
    [v8 addEntriesFromDictionary:v9];
  }
  if (!v4 || (localizedDb = self->_localizedDb) == 0)
  {

    self->_citySearchMatcher = 0;
    [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
    v19 = (void *)[v8 allValues];

    return v19;
  }
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (sqlite3_get_table(localizedDb, (const char *)[@"SELECT code FROM locale_names WHERE CDLIKE(name) = 1" UTF8String], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg)|| (int v11 = pnColumn[1], pnColumn[1] < 1))
  {
    if (pzErrmsg)
    {
      v21 = (const char *)[a3 UTF8String];
      printf("Error fetching locales matching %s: %s\n", v21, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
    goto LABEL_33;
  }
  pazResult += pnColumn[0];
  if (!self->_greenKey2ValueCache)
  {
    BOOL v18 = 1;
    goto LABEL_27;
  }
  LOBYTE(v12) = 0;
  int v13 = 0;
  int v14 = 1;
  do
  {
    v15 = (void *)[NSString stringWithUTF8String:pazResult[pnColumn[0] * v13]];
    v16 = v15;
    if (v12)
    {
      int v12 = 1;
      if ((v14 & 1) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      int v12 = [v15 isEqualToString:@"CN"];
      if ((v14 & 1) == 0) {
        goto LABEL_17;
      }
    }
    if ([v16 isEqualToString:@"TW"]) {
      int v14 = 0;
    }
LABEL_17:
    ++v13;
  }
  while (v13 < pnColumn[1]);
  int v17 = v14;
  if (!v12) {
    int v17 = 0;
  }
  v11 += v17;
  BOOL v18 = v17 == 0;
  unint64_t v7 = 0x1E5668000;
LABEL_27:
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:22 * v11 - 4];
  [v22 appendFormat:@"locale_code = \"%@\", objc_msgSend(NSString, "stringWithUTF8String:"", *pazResult)];
  if (pnColumn[1] >= 2)
  {
    int v23 = 1;
    do
      [v22 appendFormat:@" OR locale_code = \"%@\", objc_msgSend(NSString, "stringWithUTF8String:"", pazResult[pnColumn[0] * v23++])];
    while (v23 < pnColumn[1]);
  }
  if (!v18) {
    [v22 appendString:@" OR locale_code = \"TW\""];
  }
  id v24 = [(ALCityManager *)self citiesMatchingQualifier:v22];

  pazResult -= pnColumn[0];
  sqlite3_free_table(pazResult);
  v25 = (void *)[*(id *)(v7 + 2104) newCitiesByIdentifierMap:v24];
  [v8 addEntriesFromDictionary:v25];

LABEL_33:
  if (sqlite3_get_table(self->_localizedDb, (const char *)[@"SELECT id FROM city_names WHERE CDLIKE(name) = 1 OR CDLIKE(country_name) = 1" UTF8String], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      printf("Error getting city names: %s\n", pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
  }
  else
  {
    pazResult += pnColumn[0];
    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v27 = (void *)[v26 initWithCapacity:pnColumn[1]];
    if (pnColumn[1] >= 1)
    {
      int v28 = 0;
      do
      {
        v29 = (void *)[[NSString alloc] initWithUTF8String:pazResult[pnColumn[0] * v28]];
        [v27 addObject:v29];

        ++v28;
      }
      while (v28 < pnColumn[1]);
    }
    id v30 = [(ALCityManager *)self citiesWithIdentifiers:v27];

    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
    v31 = (void *)[*(id *)(v7 + 2104) newCitiesByIdentifierMap:v30];
    [v8 addEntriesFromDictionary:v31];
  }
  v32 = (void *)[v8 allValues];
  [(ALCityManager *)self localizeCities:v32];

  self->_citySearchMatcher = 0;
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
  return v32;
}

- (void)localizeCities:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (self->_localizedDb && [a3 count])
  {
    *(void *)pnColumn = 0;
    pazResult = 0;
    pzErrmsg = 0;
    [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
    int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", (unint64_t)(objc_msgSend(a3, "count") + 1) >> 1);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v60 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          uint64_t v11 = [v10 localeCode];
          if (v11)
          {
            uint64_t v12 = v11;
            int v13 = (void *)[v5 objectForKey:v11];
            if (!v13)
            {
              int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
              [v5 setObject:v13 forKey:v12];
            }
            [v13 addObject:v10];
          }
          else
          {
            [v10 setCountryName:&stru_1EDF24210];
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v7);
    }
    int v14 = (void *)[v5 allKeys];
    if (![v14 count])
    {
LABEL_48:

      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 16 * objc_msgSend(a3, "count") + 40);
      objc_msgSend(v35, "appendFormat:", @"SELECT id,name,country_name FROM city_names WHERE id IN(%d"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "identifier");
      uint64_t v36 = [a3 objectAtIndex:0];
      objc_msgSend(v34, "setObject:forKey:", v36, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "identifier")));
      if ((unint64_t)[a3 count] >= 2)
      {
        unint64_t v37 = 1;
        do
        {
          v38 = (void *)[a3 objectAtIndex:v37];
          uint64_t v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v38, "identifier"));
          [v35 appendFormat:@",%@", v39];
          [v34 setObject:v38 forKey:v39];
          ++v37;
        }
        while ([a3 count] > v37);
      }
      [v35 appendString:@""]);
      if (sqlite3_get_table(self->_localizedDb, (const char *)[v35 UTF8String], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
      {
        if (pzErrmsg)
        {
          v40 = (const char *)[v35 UTF8String];
          printf("Error getting city localizations from query \"%s\": %s\n", v40, pzErrmsg);
          sqlite3_free(pzErrmsg);
        }
        v41 = pazResult;
        if (!pazResult) {
          goto LABEL_65;
        }
      }
      else
      {
        uint64_t v42 = pnColumn[0];
        v43 = &pazResult[pnColumn[0]];
        pazResult = v43;
        if (pnColumn[1] >= 1)
        {
          int v44 = 0;
          do
          {
            v45 = objc_msgSend(v34, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", atoi(pazResult[pnColumn[0] * v44])));
            if (v45)
            {
              v46 = v45;
              objc_msgSend(v45, "setName:", objc_msgSend(NSString, "stringWithUTF8String:", pazResult[pnColumn[0] * v44 + 1]));
              if (pazResult[pnColumn[0] * v44 + 2]) {
                objc_msgSend(v46, "setCountryOverride:", objc_msgSend(NSString, "stringWithUTF8String:"));
              }
            }
            ++v44;
          }
          while (v44 < pnColumn[1]);
          uint64_t v42 = pnColumn[0];
          v43 = pazResult;
        }
        v41 = &v43[-v42];
        pazResult = v41;
      }
      sqlite3_free_table(v41);
LABEL_65:

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v47 = [a3 countByEnumeratingWithState:&v51 objects:v70 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v52 != v49) {
              objc_enumerationMutation(a3);
            }
            [(ALCityManager *)self _whileDatabaseLocked_modifyCityForGreen:*(void *)(*((void *)&v51 + 1) + 8 * j)];
          }
          uint64_t v48 = [a3 countByEnumeratingWithState:&v51 objects:v70 count:16];
        }
        while (v48);
      }
      goto LABEL_72;
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 16 * objc_msgSend(v5, "count") + 40);
    objc_msgSend(v15, "appendFormat:", @"SELECT code,name FROM locale_names WHERE code IN (\"%@\"), objc_msgSend(v14, "objectAtIndex:"", 0);
    if ((unint64_t)[v14 count] >= 2)
    {
      unint64_t v16 = 1;
      do
        [v15 appendFormat:@",\"%@\", objc_msgSend(v14, "objectAtIndex:"", v16++)];
      while ([v14 count] > v16);
    }
    [v15 appendString:@""]);
    if (sqlite3_get_table(self->_localizedDb, (const char *)[v15 UTF8String], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
    {
      if (pzErrmsg)
      {
        int v17 = (const char *)[v15 UTF8String];
        printf("Error getting locale localizations from query \"%s\": %s\n", v17, pzErrmsg);
        sqlite3_free(pzErrmsg);
      }
      BOOL v18 = pazResult;
      if (!pazResult) {
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v23 = pnColumn[0];
      id v24 = &pazResult[pnColumn[0]];
      pazResult = v24;
      if (pnColumn[1] >= 1)
      {
        int v25 = 0;
        do
        {
          id v26 = [NSString alloc];
          v27 = (void *)[v26 initWithUTF8String:pazResult[pnColumn[0] * v25 + 1]];
          int v28 = objc_msgSend(v5, "objectForKey:", objc_msgSend(NSString, "stringWithUTF8String:", pazResult[pnColumn[0] * v25]));
          if (v28)
          {
            v29 = v28;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v71 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v56;
              do
              {
                for (uint64_t k = 0; k != v31; ++k)
                {
                  if (*(void *)v56 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  [*(id *)(*((void *)&v55 + 1) + 8 * k) setCountryName:v27];
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v71 count:16];
              }
              while (v31);
            }
          }

          ++v25;
        }
        while (v25 < pnColumn[1]);
        uint64_t v23 = pnColumn[0];
        id v24 = pazResult;
      }
      BOOL v18 = &v24[-v23];
      pazResult = v18;
    }
    sqlite3_free_table(v18);
LABEL_47:

    goto LABEL_48;
  }
  if (![a3 count]) {
    return;
  }
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v19 = [a3 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v67 != v21) {
          objc_enumerationMutation(a3);
        }
        [(ALCityManager *)self _whileDatabaseLocked_modifyCityForGreen:*(void *)(*((void *)&v66 + 1) + 8 * m)];
      }
      uint64_t v20 = [a3 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v20);
  }
LABEL_72:
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
}

+ (id)newCitiesByIdentifierMap:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v9, "identifier"));
        [v4 setObject:v9 forKey:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)citiesWithIdentifiers:(id)a3
{
  id v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 4 * objc_msgSend(v3, "count"));
    objc_msgSend(v5, "appendString:", objc_msgSend(v3, "objectAtIndex:", 0));
    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v6 = 1;
      do
        [v5 appendFormat:@",%@", objc_msgSend(v3, "objectAtIndex:", v6++)];
      while ([v3 count] > v6);
    }
    id v7 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", [NSString stringWithFormat:@"identifier IN (%@)", v5]);
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = v3;
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v11);
          }
          int v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) intValue];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v14 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v7);
                }
                BOOL v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                if (v13 == [v18 identifier])
                {
                  [v21 addObject:v18];
                  goto LABEL_20;
                }
              }
              uint64_t v15 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_20:
          ;
        }
        id v3 = v11;
        uint64_t v9 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }
    return v21;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v20 array];
  }
}

- (id)_cityForClassicIdentifier:(id)a3 commaSearchOptions:(unint64_t)a4
{
  uint64_t v6 = [a3 rangeOfString:@", ", a4 options];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v8 = v6;
  uint64_t v9 = [a3 substringToIndex:v6];
  uint64_t v10 = (void *)[a3 substringFromIndex:v8 + 2];
  uint64_t v11 = [v10 length]
      ? [NSString stringWithFormat:@"name = \"%@\" and country_name = \"%@\", v9, v10]: objc_msgSend(NSString, "stringWithFormat:", @"name = \"%@\", v9, v16);
  id v12 = [(ALCityManager *)self citiesMatchingQualifier:v11];
  if (!v12 || (int v13 = v12, ![v12 count]))
  {
    uint64_t v14 = [v10 length]
        ? [NSString stringWithFormat:@"name LIKE \"%%%@%%\" and country_name LIKE \"%%%@%%\", v9, v10]: objc_msgSend(NSString, "stringWithFormat:", @"name LIKE \"%%%@%%\", v9, v17);
    id v15 = [(ALCityManager *)self citiesMatchingQualifier:v14];
    if (!v15) {
      return 0;
    }
    int v13 = v15;
    if (![v15 count]) {
      return 0;
    }
  }
  return (id)[v13 objectAtIndex:0];
}

- (id)cityForClassicIdentifier:(id)a3
{
  id result = [(ALCityManager *)self _cityForClassicIdentifier:a3 commaSearchOptions:4];
  if (!result)
  {
    return [(ALCityManager *)self _cityForClassicIdentifier:a3 commaSearchOptions:0];
  }
  return result;
}

- (id)bestCityForLegacyCity:(__CFArray *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (CFArrayGetCount(a3) > 9)
  {
    Identifier = CPCityGetIdentifier(a3);
    if (Identifier)
    {
      id v6 = [(ALCityManager *)self cityForClassicIdentifier:Identifier];
      if (v6) {
        return v6;
      }
    }
  }
  if (CFArrayGetCount(a3) <= 6) {
    return 0;
  }
  id v7 = [(ALCityManager *)self citiesMatchingName:CPCityGetLocalizedCityName(a3)];
  if ([v7 count] == 1) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [[CPSearchMatcher alloc] initWithSearchString:CPCityGetLocalizedCountryName(a3)];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_12:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v7);
      }
      id v6 = *(id *)(*((void *)&v14 + 1) + 8 * v12);
      if (!v8
        || -[CPSearchMatcher matches:](v8, "matches:", [*(id *)(*((void *)&v14 + 1) + 8 * v12) countryName]))
      {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v6 = 0;
        if (v10) {
          goto LABEL_12;
        }
        break;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (__CFArray)legacyCityForCity:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 unlocalizedName];
  uint64_t v5 = [a3 unlocalizedCountryName];
  uint64_t v6 = [a3 localeCode];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  uint64_t v8 = NSNumber;
  [a3 latitude];
  objc_msgSend(v7, "addObject:", objc_msgSend(v8, "numberWithFloat:"));
  uint64_t v9 = NSNumber;
  [a3 longitude];
  objc_msgSend(v7, "addObject:", objc_msgSend(v9, "numberWithFloat:"));
  objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "identifier")));
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "timeZone"));
  if (v6) {
    uint64_t v10 = (__CFString *)v6;
  }
  else {
    uint64_t v10 = &stru_1EDF24210;
  }
  [v7 addObject:v10];
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "name"));
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "countryName"));
  [v7 addObject:v4];
  [v7 addObject:v5];
  [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@, %@", v4, v5)];
  return (__CFArray *)v7;
}

- (id)citiesMatchingQualifier:(id)a3
{
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
  BOOL v5 = [(ALCityManager *)self _shouldUseTablesAlternate1];
  uint64_t v6 = @"cities";
  if (v5) {
    uint64_t v6 = @"cities_alternate_1";
  }
  if (sqlite3_get_table(self->_db, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"SELECT name,country_name,country_override,longitude,latitude,timezonename,yahoocode,identifier,code FROM %@ LEFT OUTER JOIN locales ON %@.locale_code = locales.code WHERE %@ ORDER BY name,country_name", v6, v6, a3), "UTF8String"], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      id v7 = (const char *)[a3 UTF8String];
      printf("error getting cities matching \"%s\" - %s\n", v7, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
    uint64_t v8 = 0;
  }
  else
  {
    pazResult += pnColumn[0];
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = (void *)[v9 initWithCapacity:pnColumn[1]];
    if (pnColumn[1] >= 1)
    {
      int v10 = 0;
      do
      {
        uint64_t v11 = [ALCity alloc];
        uint64_t v12 = [(ALCity *)v11 initWithSQLRow:&pazResult[pnColumn[0] * v10]];
        [v8 addObject:v12];

        ++v10;
      }
      while (v10 < pnColumn[1]);
    }
    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
  }
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
  return v8;
}

- (id)_whileDatabaseLocked_localeCodesMatchingQualifier:(id)a3
{
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (sqlite3_get_table(self->_db, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"SELECT code FROM locales WHERE %@", a3), "UTF8String"], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      uint64_t v4 = (const char *)[a3 UTF8String];
      printf("error getting locale codes matching \"%s\" - %s\n", v4, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
    BOOL v5 = 0;
  }
  else
  {
    pazResult += pnColumn[0];
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    BOOL v5 = (void *)[v6 initWithCapacity:pnColumn[1]];
    if (pnColumn[1] >= 1)
    {
      int v7 = 0;
      do
      {
        id v8 = [NSString alloc];
        id v9 = (void *)[v8 initWithUTF8String:pazResult[pnColumn[0] * v7]];
        [v5 addObject:v9];

        ++v7;
      }
      while (v7 < pnColumn[1]);
    }
    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
  }
  return v5;
}

- (void)_whileDatabaseLocked_ensureGreenKeyValueCaches
{
  if (!self->_greenKeyValueCacheExpirationDate
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "now"), "timeIntervalSinceDate:", self->_greenKeyValueCacheExpirationDate), v3 <= 0.0))
  {
    p_greenClient = &self->_greenClient;
    if (self->_greenClient) {
      return;
    }
    goto LABEL_6;
  }

  self->_greenKeyValueCacheExpirationDate = 0;
  p_greenClient = &self->_greenClient;
  greenClient = (ALSCGreenClient *)self->_greenClient;
  if (!greenClient)
  {
LABEL_6:
    greenClient = objc_alloc_init(ALSCGreenClient);
    *p_greenClient = (ALSCGreenClientProtocol *)greenClient;
  }
  if (![(ALSCGreenClient *)greenClient valuesFinalized]) {
    self->_greenKeyValueCacheExpirationDate = (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
  }
  self->_greenKey1ValueCache = [(ALSCGreenClientProtocol *)self->_greenClient key1Value];
  self->_greenKey2ValueCache = [(ALSCGreenClientProtocol *)self->_greenClient key2Value];
  self->_greenKey3ValueCache = [(ALSCGreenClientProtocol *)self->_greenClient key3Value];
}

- (void)_whileDatabaseLocked_modifyCityForGreen:(id)a3
{
  [(ALCityManager *)self _whileDatabaseLocked_ensureGreenKeyValueCaches];
  if (*(_WORD *)&self->_greenKey1ValueCache
    && objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", @"CN")
    && [a3 identifier] != 118)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AppSupport"), "localizedStringForKey:value:table:", @"CHINA", &stru_1EDF24210, @"Localizable");
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (self->_greenKey2ValueCache
    && objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", @"TW"))
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AppSupport"), "localizedStringForKey:value:table:", @"TAIPEI_TAIWAN_CHINA", &stru_1EDF24210, @"Localizable");
    [a3 setDisplayNameIncludingCountryShowsOnlyCountry:1];
  }
  if (self->_greenKey3ValueCache)
  {
    if ([a3 identifier] == 118)
    {
      id v6 = @"HONG_KONG";
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", @"MO")) {
        goto LABEL_15;
      }
      id v6 = @"MACAO";
    }
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AppSupport"), "localizedStringForKey:value:table:", v6, &stru_1EDF24210, @"Localizable");
  }
LABEL_15:
  if (v5)
  {
    [a3 setUnlocalizedCountryOverride:v5];
    [a3 setCountryOverride:v5];
  }
}

- (id)_cityForTimeZone:(id)a3 localeCode:(id)a4
{
  if ([a3 length])
  {
    if (!a4) {
      a4 = &stru_1EDF24210;
    }
    [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
    uint64_t v7 = [NSString stringWithFormat:@"timezonename = \"%@\" and locale_code = \"%@\"", a3, a4];
    BOOL v8 = [(ALCityManager *)self _shouldUseTablesAlternate1];
    id v9 = @"timezone_locale_to_city_map";
    if (v8) {
      id v9 = @"timezone_locale_to_city_map_alternate_1";
    }
    *(void *)pnColumn = 0;
    pazResult = 0;
    pzErrmsg = 0;
    if (sqlite3_get_table(self->_db, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"SELECT city_id FROM %@ WHERE %@", v9, v7), "UTF8String"], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
    {
      if (pzErrmsg) {
        sqlite3_free(pzErrmsg);
      }
      if (pazResult) {
        sqlite3_free_table(pazResult);
      }
    }
    else
    {
      uint64_t v11 = pazResult;
      if (pnColumn[1] < 1) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = atoi(pazResult[pnColumn[0]]);
      }
      sqlite3_free_table(v11);
      if (pnColumn[1] >= 1)
      {
        id v13 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", objc_msgSend(NSString, "stringWithFormat:", @"identifier = %d", v12));
        if ([v13 count])
        {
          int v10 = (void *)[v13 objectAtIndexedSubscript:0];
LABEL_19:
          [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
          return v10;
        }
      }
    }
    int v10 = 0;
    goto LABEL_19;
  }
  return 0;
}

+ (id)_localeDictionaryFromSQLRow:(char *)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", *a3), @"code");
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", a3[1]), @"name");
  if (a3[2]) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:"), @"mainCity");
  }
  if (a3[3])
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:"), @"mapLongitude");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", a3[4]), @"mapLatitude");
    if (a3[5])
    {
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:"), @"mapWidth");
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", a3[6]), @"mapHeight");
    }
  }
  return v4;
}

- (id)allLocales
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
  if (!sqlite3_get_table(self->_db, (const char *)[@"select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales" UTF8String], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pnColumn[1] >= 1)
    {
      int v5 = 0;
      do
      {
        ++v5;
        objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_opt_class(), "_localeDictionaryFromSQLRow:", &pazResult[pnColumn[0] * v5]));
      }
      while (v5 < pnColumn[1]);
    }
    uint64_t v4 = pazResult;
    goto LABEL_10;
  }
  if (pzErrmsg)
  {
    printf("couldn't get all locales: \"%s\"\n", pzErrmsg);
    sqlite3_free(pzErrmsg);
  }
  uint64_t v4 = pazResult;
  if (pazResult) {
LABEL_10:
  }
    sqlite3_free_table(v4);
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
  return v3;
}

- (id)localeWithCode:(id)a3
{
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
  if (sqlite3_get_table(self->_db, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales where code = \"%@\", a3), "UTF8String""], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      int v5 = (const char *)[a3 UTF8String];
      printf("couldn't get locale with code %s: \"%s\"\n", v5, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
    goto LABEL_6;
  }
  if (pnColumn[1]) {
    goto LABEL_8;
  }
  sqlite3_free_table(pazResult);
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", a3), "regionCode");
  if (!v8)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = 0;
  if (!sqlite3_get_table(self->_db, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales where code = \"%@\", v8), "UTF8String""], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pnColumn[1])
    {
LABEL_8:
      id v6 = (void *)[(id)objc_opt_class() _localeDictionaryFromSQLRow:&pazResult[pnColumn[0]]];
      sqlite3_free_table(pazResult);
    }
  }
LABEL_9:
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
  return v6;
}

- (id)defaultCitiesForLocaleCode:(id)a3 options:(int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = -[ALCityManager localeWithCode:](self, "localeWithCode:");
  *(void *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = a3;
    __int16 v34 = 1024;
    int v35 = a4;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCitiesForLocaleCode: %@ options: %x", buf, 0x12u);
  }
  [(NSRecursiveLock *)self->_databaseAccessRecursiveLock lock];
  db = self->_db;
  id v9 = NSString;
  id v10 = a3;
  if (v7) {
    id v10 = (id)[v7 objectForKey:@"code"];
  }
  if (sqlite3_get_table(db, (const char *)[(id)objc_msgSend(v9 stringWithFormat:@"select city_id from defaults where locale_code = \"%@\", v10), "UTF8String""], &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      uint64_t v11 = (const char *)[a3 UTF8String];
      printf("couldn't get default cities for locale %s: \"%s\"\n", v11, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult) {
      sqlite3_free_table(pazResult);
    }
    [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ALCityManager defaultCitiesForLocaleCode:options:]();
    }
    return 0;
  }
  else
  {
    ++pazResult;
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v14 = (id)[v13 initWithCapacity:pnColumn[1]];
    long long v15 = (void *)[v7 objectForKey:@"mainCity"];
    if (pnColumn[1] >= 1)
    {
      uint64_t v16 = 0;
      do
        objc_msgSend(v14, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", pazResult[v16++]));
      while (v16 < pnColumn[1]);
    }
    sqlite3_free_table(--pazResult);
    id v17 = [(ALCityManager *)self citiesWithIdentifiers:v14];
    uint64_t v12 = v17;
    if (v15 && [v17 count])
    {
      unint64_t v18 = 0;
      uint64_t v19 = 0;
      do
      {
        uint64_t v20 = (void *)[v12 objectAtIndex:v18];
        int v21 = [v15 intValue];
        int v22 = [v20 identifier];
        if ((a4 & 1) != 0 && v21 == v22)
        {
          id v23 = v20;
          [v12 removeObjectAtIndex:v18];
          [v12 insertObject:v20 atIndex:0];

          uint64_t v19 = v20;
        }
        ++v18;
      }
      while ([v12 count] > v18);
      if ((a4 & 2) != 0)
      {
        if (v19)
        {
          uint64_t v24 = [v19 timeZone];
          if ([v12 count])
          {
            uint64_t v25 = 0;
            int v26 = 0;
            do
            {
              long long v27 = (void *)[v12 objectAtIndex:v25];
              if (v27 != v19 && objc_msgSend((id)objc_msgSend(v27, "timeZone"), "isEqualToString:", v24))
              {
                [v12 removeObjectAtIndex:v25];
                --v26;
              }
              uint64_t v25 = ++v26;
            }
            while ([v12 count] > (unint64_t)v26);
          }
        }
      }
    }
    [(NSRecursiveLock *)self->_databaseAccessRecursiveLock unlock];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v12;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCitiesForLocaleCode: returning %@", buf, 0xCu);
    }
  }
  return v12;
}

- (id)defaultCitiesForLocaleCode:(id)a3
{
  return [(ALCityManager *)self defaultCitiesForLocaleCode:a3 options:1];
}

- (id)defaultCitiesShownInWorldClock
{
  return [(ALCityManager *)self citiesWithIdentifiers:&unk_1EDF2A2B8];
}

- (id)defaultCityForTimeZone:(id)a3
{
  CFLocaleRef v5 = CFLocaleCopyCurrent();
  id v6 = [(ALCityManager *)self _defaultCityForTimeZone:a3 localeCode:MEMORY[0x192FBE440]()];
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

- (id)defaultCityForTimeZone:(id)a3 localeCode:(id)a4
{
  if (a4)
  {
    return -[ALCityManager _defaultCityForTimeZone:localeCode:](self, "_defaultCityForTimeZone:localeCode:");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ALCityManager defaultCityForTimeZone:localeCode:]((uint64_t)a3);
    }
    return 0;
  }
}

- (id)_defaultCityForTimeZone:(id)a3 localeCode:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = a3;
    __int16 v30 = 2112;
    id v31 = a4;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCityForTimeZone: %@ localeCode: %@", buf, 0x16u);
  }
  if (!a3
    || (!a4
     || (id v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", [a3 name], a4)) == 0&& (id v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", objc_msgSend(a3, "name"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", a4), "regionCode"))) == 0)&& (id v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", objc_msgSend(a3, "name"), &stru_1EDF24210)) == 0)
  {
    id v8 = [(ALCityManager *)self citiesWithTimeZone:a3];
    id v9 = objc_msgSend((id)objc_msgSend(a3, "name"), "componentsSeparatedByString:", @"/");
    if ((unint64_t)[v9 count] >= 2)
    {
      uint64_t v10 = [v9 objectAtIndex:1];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
LABEL_11:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v8);
          }
          id v7 = *(id *)(*((void *)&v23 + 1) + 8 * v14);
          if (objc_msgSend((id)objc_msgSend(v7, "name"), "isEqualToString:", v10)) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v12) {
              goto LABEL_11;
            }
            goto LABEL_19;
          }
        }
        if (v7) {
          goto LABEL_33;
        }
      }
    }
LABEL_19:
    if ([v8 count])
    {
      id v7 = (id)[v8 objectAtIndex:0];
      if (!a3) {
        goto LABEL_33;
      }
    }
    else
    {
      id v7 = 0;
      if (!a3) {
        goto LABEL_33;
      }
    }
    if (a4 && !v7)
    {
      id v15 = [(ALCityManager *)self defaultCitiesForLocaleCode:a4 options:1];
      if (v15
        && (uint64_t v16 = v15, [v15 count])
        && (id v17 = (void *)[v16 objectAtIndexedSubscript:0],
            (CFTimeZoneRef v18 = CFTimeZoneCreateWithName((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)[v17 timeZone], 1u)) != 0))
      {
        CFTimeZoneRef v19 = v18;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double SecondsFromGMT = CFTimeZoneGetSecondsFromGMT((CFTimeZoneRef)a3, Current);
        if (SecondsFromGMT == CFTimeZoneGetSecondsFromGMT(v19, Current)) {
          id v7 = (id)[v16 objectAtIndexedSubscript:0];
        }
        else {
          id v7 = 0;
        }
        CFRelease(v19);
      }
      else
      {
        id v7 = 0;
      }
    }
  }
LABEL_33:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v7;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCityForTimeZone: returning %@", buf, 0xCu);
  }
  return v7;
}

- (id)citiesWithTimeZone:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"timezonename = \"%@\", objc_msgSend(a3, "name"")];
  return [(ALCityManager *)self citiesMatchingQualifier:v4];
}

- (void)dealloc
{
  db = self->_db;
  if (db) {
    sqlite3_close(db);
  }
  localizedDb = self->_localizedDb;
  if (localizedDb) {
    sqlite3_close(localizedDb);
  }

  [(ALSCGreenClientProtocol *)self->_greenClient release];
  v5.receiver = self;
  v5.super_class = (Class)ALCityManager;
  [(ALCityManager *)&v5 dealloc];
}

- (BOOL)_shouldUseTablesAlternate1
{
  return +[ALCityManager willApplyTimeZoneChanges1];
}

+ (BOOL)willApplyTimeZoneChanges1
{
  if (willApplyTimeZoneChanges1_onceToken != -1) {
    dispatch_once(&willApplyTimeZoneChanges1_onceToken, &__block_literal_global_218);
  }
  return willApplyTimeZoneChanges1_shouldUseTablesAlternate1;
}

void __42__ALCityManager_willApplyTimeZoneChanges1__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v0 = (id)MGCopyAnswer();
  if ([v0 isEqualToString:@"CH"]) {
    goto LABEL_2;
  }
  willApplyTimeZoneChanges1_shouldUseTablesAlternate1 = [v0 isEqualToString:@"ZA"];
  if ((willApplyTimeZoneChanges1_shouldUseTablesAlternate1 & 1) != 0
    || ![v0 isEqualToString:@"ZP"])
  {
    goto LABEL_9;
  }
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), "countryCode");
  if (([v2 isEqualToString:@"CN"] & 1) != 0
    || ([v2 isEqualToString:@"HK"] & 1) != 0)
  {
LABEL_2:
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"MO"];
  }
  willApplyTimeZoneChanges1_shouldUseTablesAlternate1 = v1;
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = [NSNumber numberWithBool:willApplyTimeZoneChanges1_shouldUseTablesAlternate1];
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ALCityManager _shouldUseTablesAlternate1 %@", (uint8_t *)&v3, 0xCu);
  }
}

- (CPSearchMatcher)citySearchMatcher
{
  return self->_citySearchMatcher;
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ALCityManager couldn't open main database: error %i", (uint8_t *)v1, 8u);
}

- (void)defaultCitiesForLocaleCode:options:.cold.1()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ALCityManager defaultCitiesForLocaleCode: returning nil", v0, 2u);
}

- (void)defaultCityForTimeZone:(uint64_t)a1 localeCode:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = a1;
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ALCityManager defaultCityForTimeZone: %@ localeCode: %@ returning nil", (uint8_t *)&v1, 0x16u);
}

@end