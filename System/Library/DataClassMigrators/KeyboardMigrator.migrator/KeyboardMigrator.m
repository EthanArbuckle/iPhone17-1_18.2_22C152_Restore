uint64_t _KBLogger()
{
  if (qword_10400 != -1) {
    dispatch_once(&qword_10400, &stru_C280);
  }
  return qword_10408;
}

void sub_4C6C(id a1)
{
  qword_10408 = (uint64_t)os_log_create("com.apple.keyboard", "KeyboardMigrator");
}

BOOL TIKeyboardMigratorIsCurrentDevicePhone()
{
  return MGGetSInt32Answer() == 1;
}

BOOL TIKeyboardMigratorIsCurrentDevicePad()
{
  return MGGetSInt32Answer() == 3;
}

BOOL TIKeyboardMigratorIsCurrentDevice12InchPad()
{
  unsigned int v0 = MGGetSInt32Answer();
  unsigned int v1 = MGGetSInt32Answer();
  MGGetFloat32Answer();
  double v3 = v2;
  if (v0 >= v1) {
    unsigned int v4 = v1;
  }
  else {
    unsigned int v4 = v0;
  }
  return v3 * 834.0 < (double)(unint64_t)(int)v4;
}

void TIKeyboardMigratorTest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  qword_10410 = a1;
  qword_10418 = +[NSNumber numberWithBool:a2];
  qword_10420 = a3;
  sub_7478();
  qword_10410 = 0;
  qword_10418 = 0;
  qword_10420 = 0;
}

NSMutableDictionary *sub_714C()
{
  if (!os_variant_has_internal_ui()) {
    return 0;
  }
  unsigned int v0 = +[NSMutableDictionary dictionaryWithCapacity:3];
  CFStringRef v1 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v1)
  {
    CFStringRef v2 = v1;
    CFArrayRef v3 = CFPreferencesCopyKeyList(v1, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          CFStringRef v8 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
          CFPropertyListRef v9 = CFPreferencesCopyAppValue(v8, v2);
          if (v9)
          {
            v10 = v9;
            [(NSMutableDictionary *)v0 setObject:v9 forKeyedSubscript:v8];
            CFRelease(v10);
          }
        }
        id v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    CFRelease(v2);
  }
  CFStringRef v11 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v11)
  {
    CFStringRef v12 = v11;
    CFPropertyListRef v13 = CFPreferencesCopyAppValue(@"AppleKeyboards", v11);
    if (v13)
    {
      v14 = v13;
      [(NSMutableDictionary *)v0 setObject:v13 forKeyedSubscript:@"AppleKeyboards"];
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  return v0;
}

void sub_7320(uint64_t a1)
{
  +[NSString stringWithFormat:@"com.apple.Preferences.%@", a1];
  CFStringRef v2 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"FuzzyPinyin", v2);
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    CFStringRef v6 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
    if (v6)
    {
      CFStringRef v7 = v6;
      if ((id)CFPreferencesCopyAppValue(@"FuzzyPinyin", v6))
      {
        CFStringRef v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
        [(NSMutableDictionary *)v8 setValue:v4 forKey:a1];
      }
      else
      {
        CFStringRef v8 = +[NSMutableDictionary dictionaryWithObject:v4 forKey:a1];
      }
      CFPreferencesSetAppValue(@"FuzzyPinyin", v8, v7);
      CFPreferencesAppSynchronize(v7);
      CFPreferencesSetAppValue(@"FuzzyPinyin", 0, v2);
      CFPreferencesAppSynchronize(v2);
      CFRelease(v7);
    }
LABEL_16:
    CFRelease(v2);
    if (!v4) {
      return;
    }
    goto LABEL_8;
  }
  if (v2) {
    goto LABEL_16;
  }
  if (!v3) {
    return;
  }
LABEL_8:

  CFRelease(v4);
}

void sub_7478()
{
  CFStringRef v0 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (!v0) {
    return;
  }
  CFStringRef v1 = v0;
  CFStringRef v2 = (void *)CFPreferencesCopyAppValue(@"AppleLanguages", v0);
  if (v2)
  {
    CFPropertyListRef v3 = v2;
    id v4 = [v2 firstObject];
    CFRelease(v3);
  }
  else
  {
    id v4 = 0;
  }
  int v5 = MGGetSInt32Answer();
  int v6 = MGGetSInt32Answer();
  BOOL IsCurrentDevice12InchPad = TIKeyboardMigratorIsCurrentDevice12InchPad();
  unint64_t v8 = sub_974C();
  unsigned int v188 = 0;
  BOOL v9 = v8 <= 0xB || v8 == 0x7FFFFFFFFFFFFFFFLL;
  CFStringRef applicationID = v1;
  if (v9 && v6 == 3) {
    unsigned int v188 = [v4 isEqualToString:@"ja"];
  }
  unint64_t v10 = sub_974C();
  BOOL v12 = v10 == 0x7FFFFFFFFFFFFFFFLL || v10 < 0xD;
  unint64_t v13 = sub_974C();
  unint64_t v14 = sub_974C();
  BOOL v16 = v14 == 0x7FFFFFFFFFFFFFFFLL || v14 < 0x10;
  unint64_t v17 = sub_974C();
  BOOL v19 = v17 == 0x7FFFFFFFFFFFFFFFLL || v17 < 0x11;
  unint64_t v20 = sub_974C();
  BOOL v22 = v20 == 0x7FFFFFFFFFFFFFFFLL || v20 < 0x13;
  BOOL v200 = v22;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v13 <= 0xE)
  {
    int v23 = !IsCurrentDevice12InchPad;
    if (v6 != 3) {
      int v23 = 0;
    }
    int v198 = v23;
  }
  else
  {
    int v198 = 0;
  }
  id obj = (id)CFPreferencesCopyAppValue(@"AppleKeyboards", applicationID);
  if (!obj)
  {
    CFStringRef v28 = applicationID;
    if (v188)
    {
      id v29 = +[NSMutableArray array];
      long long v218 = 0u;
      long long v219 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v30 = objc_msgSend(+[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController"), "defaultEnabledInputModesForCurrentLocale");
      id v31 = [v30 countByEnumeratingWithState:&v218 objects:v274 count:16];
      if (v31)
      {
        id v32 = v31;
        char v33 = 0;
        uint64_t v34 = *(void *)v219;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v219 != v34) {
              objc_enumerationMutation(v30);
            }
            v36 = *(__CFString **)(*((void *)&v218 + 1) + 8 * i);
            unsigned int v37 = [(__CFString *)v36 isEqualToString:@"ja_JP-Kana"];
            v33 |= v37;
            if (v37) {
              CFStringRef v38 = @"ja_JP-Kana@sw=Kana";
            }
            else {
              CFStringRef v38 = v36;
            }
            [v29 addObject:v38];
          }
          id v32 = [v30 countByEnumeratingWithState:&v218 objects:v274 count:16];
        }
        while (v32);
        CFStringRef v28 = applicationID;
        if (v33)
        {
          CFPreferencesSetAppValue(@"AppleKeyboards", v29, applicationID);
          CFPreferencesSetAppValue(@"AppleKeyboardsExpanded", &__kCFBooleanTrue, applicationID);
          CFPreferencesAppSynchronize(applicationID);
        }
      }
    }
    goto LABEL_344;
  }
  id v24 = +[NSMutableArray array];
  CFStringRef v25 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v25)
  {
    CFStringRef v26 = v25;
    v27 = (id)CFPreferencesCopyAppValue(@"SuchengCangjie", v25);
    if (v27)
    {
      unsigned int v185 = objc_msgSend(objc_msgSend(v27, "objectForKey:", @"zh_Hant-Cangjie"), "BOOLValue");
      CFPreferencesSetAppValue(@"SuchengCangjie", 0, v26);
    }
    else
    {
      unsigned int v185 = 0;
    }
    CFRelease(v26);
  }
  else
  {
    unsigned int v185 = 0;
  }
  v39 = (NSLocale *)qword_10410;
  if (!qword_10410) {
    v39 = +[NSLocale currentLocale];
  }
  unsigned int v40 = [(NSString *)[(NSLocale *)v39 countryCode] isEqualToString:@"JP"];
  if (v5 == 1) {
    int v41 = v16 & v40;
  }
  else {
    int v41 = 0;
  }
  v42 = (NSLocale *)qword_10410;
  if (!qword_10410) {
    v42 = +[NSLocale currentLocale];
  }
  if ([(NSString *)[(NSLocale *)v42 countryCode] isEqualToString:@"HK"])
  {
    unsigned int v43 = 1;
  }
  else
  {
    v44 = (NSLocale *)qword_10410;
    if (!qword_10410) {
      v44 = +[NSLocale currentLocale];
    }
    unsigned int v43 = [(NSString *)[(NSLocale *)v44 countryCode] isEqualToString:@"MO"];
  }
  long long v239 = 0u;
  long long v240 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  id v191 = v24;
  id v202 = [obj countByEnumeratingWithState:&v237 objects:v278 count:16];
  if (!v202) {
    goto LABEL_147;
  }
  int v183 = v41;
  int v194 = 0;
  int v196 = v43 & v19;
  uint64_t v192 = *(void *)v238;
  BOOL v186 = v12;
  int v187 = v6;
  do
  {
    uint64_t v45 = 0;
    do
    {
      if (*(void *)v238 != v192) {
        objc_enumerationMutation(obj);
      }
      uint64_t v206 = v45;
      id v46 = [*(id *)(*((void *)&v237 + 1) + 8 * v45) stringByReplacingOccurrencesOfString:@"ja_JP-50On" withString:@"ja_JP-Kana"];
      if ([v46 hasPrefix:@"ko_KO"]) {
        id v46 = [v46 stringByReplacingOccurrencesOfString:@"ko_KO" withString:@"ko_KR"];
      }
      if (v200) {
        id v46 = [v46 stringByReplacingOccurrencesOfString:@"vi_VN" withString:@"vi_VN-Telex"];
      }
      if (v6 != 3)
      {
        id v49 = [v46 stringByReplacingOccurrencesOfString:@"Japanese3x3Flick" withString:@"Kana-Flick"];
        CFStringRef v50 = @"Kana";
LABEL_90:
        v48 = (__CFString *)objc_msgSend(objc_msgSend(v49, "stringByReplacingOccurrencesOfString:withString:", @"Japanese3x3", v50), "stringByReplacingOccurrencesOfString:withString:", @"Japanese-50On", v50);
        goto LABEL_91;
      }
      if (!v188)
      {
        id v49 = [v46 stringByReplacingOccurrencesOfString:@"Japanese3x3Flick" withString:@"Kana-RTL-Flick"];
        CFStringRef v50 = @"Kana-RTL";
        goto LABEL_90;
      }
      v47 = (__CFString *)objc_msgSend(objc_msgSend(objc_msgSend(v46, "stringByReplacingOccurrencesOfString:withString:", @"Japanese3x3Flick", @"Kana-Flick"), "stringByReplacingOccurrencesOfString:withString:", @"Japanese3x3", @"Kana"), "stringByReplacingOccurrencesOfString:withString:", @"Japanese-50On", @"Kana");
      if ([(__CFString *)v47 isEqualToString:@"ja_JP-Kana"]) {
        v48 = @"ja_JP-Kana@sw=Kana";
      }
      else {
        v48 = v47;
      }
LABEL_91:
      if ([(__CFString *)v48 hasPrefix:@"zh_Han"])
      {
        if ((([(__CFString *)v48 hasPrefix:@"zh_Hans-Pinyin"] & 1) != 0
           || [(__CFString *)v48 hasPrefix:@"zh_Hant-Pinyin"])
          && [sub_92D4(v48) hasPrefix:@"AZERTY"])
        {
          if ([(__CFString *)v48 hasPrefix:@"zh_Hans-Pinyin"]) {
            CFStringRef v51 = @"AZERTY-Pinyin-Simplified";
          }
          else {
            CFStringRef v51 = @"AZERTY-Pinyin-Traditional";
          }
          v48 = (__CFString *)sub_9410(v48, (uint64_t)v51);
        }
        long long v235 = 0u;
        long long v236 = 0u;
        long long v233 = 0u;
        long long v234 = 0u;
        id v213 = [&off_D8E8 countByEnumeratingWithState:&v233 objects:v277 count:16];
        if (v213)
        {
          uint64_t v210 = *(void *)v234;
          do
          {
            uint64_t v52 = 0;
            do
            {
              if (*(void *)v234 != v210) {
                objc_enumerationMutation(&off_D8E8);
              }
              uint64_t v216 = v52;
              uint64_t v53 = *(void *)(*((void *)&v233 + 1) + 8 * v52);
              long long v229 = 0u;
              long long v230 = 0u;
              long long v231 = 0u;
              long long v232 = 0u;
              id v54 = [&off_D990 countByEnumeratingWithState:&v229 objects:v276 count:16];
              if (v54)
              {
                id v55 = v54;
                uint64_t v56 = *(void *)v230;
                do
                {
                  for (j = 0; j != v55; j = (char *)j + 1)
                  {
                    if (*(void *)v230 != v56) {
                      objc_enumerationMutation(&off_D990);
                    }
                    uint64_t v58 = *(void *)(*((void *)&v229 + 1) + 8 * (void)j);
                    v59 = +[NSString stringWithFormat:@"zh_%@-%@", v58, v53];
                    id v60 = sub_92D4(v48);
                    if ([(__CFString *)v48 hasPrefix:v59]
                      && [v60 isEqualToString:v53])
                    {
                      v48 = (__CFString *)sub_9410(v48, (uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%@", v53, [&off_D990 objectForKey:v58]));
                    }
                  }
                  id v55 = [&off_D990 countByEnumeratingWithState:&v229 objects:v276 count:16];
                }
                while (v55);
              }
              uint64_t v52 = v216 + 1;
            }
            while ((id)(v216 + 1) != v213);
            id v213 = [&off_D8E8 countByEnumeratingWithState:&v233 objects:v277 count:16];
          }
          while (v213);
        }
        if ([(__CFString *)v48 hasPrefix:@"zh_Hant-Cangjie"])
        {
          v61 = (__CFString *)[(__CFString *)v48 stringByReplacingOccurrencesOfString:@"sw=Pinyin" withString:@"sw=Cangjie-QWERTY"];
          v48 = v61;
          id v24 = v191;
          BOOL v12 = v186;
          int v6 = v187;
          if (v185) {
            v48 = (__CFString *)objc_msgSend(-[__CFString stringByReplacingOccurrencesOfString:withString:](v61, "stringByReplacingOccurrencesOfString:withString:", @"sw=Cangjie", @"sw=Sucheng"), "stringByReplacingOccurrencesOfString:withString:", @"zh_Hant-Cangjie", @"zh_Hant-Sucheng");
          }
          if ([(__CFString *)v48 rangeOfString:@"sw=Sucheng"] != (id)0x7FFFFFFFFFFFFFFFLL) {
            v48 = (__CFString *)[(__CFString *)v48 stringByReplacingOccurrencesOfString:@"zh_Hant-Cangjie" withString:@"zh_Hant-Sucheng"];
          }
        }
        else
        {
          id v24 = v191;
          BOOL v12 = v186;
          int v6 = v187;
        }
      }
      if ([(__CFString *)v48 hasPrefix:@"Cherokee"]) {
        v48 = (__CFString *)[(__CFString *)v48 stringByReplacingOccurrencesOfString:@"US" withString:@"Cherokee-Nation"];
      }
      if (v12
        && (([(__CFString *)v48 isEqualToString:@"hi"] & 1) != 0
         || [(__CFString *)v48 hasPrefix:@"hi@"]))
      {
        [v24 addObject:@"hi-Translit"];
      }
      if (v196)
      {
        if ([(__CFString *)v48 hasPrefix:@"zh_Hant"])
        {
          long long v227 = 0u;
          long long v228 = 0u;
          long long v225 = 0u;
          long long v226 = 0u;
          id v62 = [&off_D900 countByEnumeratingWithState:&v225 objects:v275 count:16];
          if (v62)
          {
            id v63 = v62;
            uint64_t v64 = *(void *)v226;
            do
            {
              for (k = 0; k != v63; k = (char *)k + 1)
              {
                if (*(void *)v226 != v64) {
                  objc_enumerationMutation(&off_D900);
                }
                if ([(__CFString *)v48 hasPrefix:*(void *)(*((void *)&v225 + 1) + 8 * (void)k)])v48 = (__CFString *)[(__CFString *)v48 stringByReplacingOccurrencesOfString:@"zh_Hant-" withString:@"yue_Hant-"]; {
              }
                }
              id v63 = [&off_D900 countByEnumeratingWithState:&v225 objects:v275 count:16];
            }
            while (v63);
          }
        }
      }
      [v24 addObject:v48];
      if (v198)
      {
        unsigned int v66 = [(__CFString *)v48 hasPrefix:@"ja_JP-Romaji"];
        char v67 = v66 | v194;
        v194 |= v66;
      }
      else
      {
        char v67 = 0;
      }
      uint64_t v45 = v206 + 1;
    }
    while ((id)(v206 + 1) != v202);
    id v202 = [obj countByEnumeratingWithState:&v237 objects:v278 count:16];
  }
  while (v202);
  int v41 = v183;
  if (v67)
  {
    uint64_t v302 = 0;
    v303 = &v302;
    uint64_t v304 = 0x3052000000;
    v305 = sub_94D4;
    v306 = sub_94E4;
    uint64_t v307 = 0;
    v223[0] = _NSConcreteStackBlock;
    v223[1] = 3221225472;
    v223[2] = sub_94F0;
    v223[3] = &unk_C2A8;
    char v224 = v40;
    v223[4] = &v302;
    id v68 = [v24 indexesOfObjectsPassingTest:v223];
    if ([v68 count])
    {
      [v24 removeObjectsAtIndexes:v68];
      id v69 = [v68 firstIndex];
    }
    else
    {
      id v69 = [v24 count];
    }
    id v74 = v69;
    CFStringRef v28 = applicationID;
    if (v303[5]) {
      CFStringRef v75 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"en_JP@hw=%@;sw=QWERTY-JIS",
    }
              v303[5]);
    else {
      CFStringRef v75 = @"en_JP@sw=QWERTY-JIS";
    }
    [v24 insertObject:v75 atIndex:v74];
    goto LABEL_163;
  }
LABEL_147:
  CFStringRef v28 = applicationID;
  if (v41)
  {
    uint64_t v302 = 0;
    v303 = &v302;
    uint64_t v304 = 0x3052000000;
    v305 = sub_94D4;
    v306 = sub_94E4;
    uint64_t v307 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v298 = 0x3052000000;
    v299 = sub_94D4;
    v300 = sub_94E4;
    uint64_t v301 = 0;
    v222[0] = _NSConcreteStackBlock;
    v222[1] = 3221225472;
    v222[2] = sub_96D8;
    v222[3] = &unk_C2D0;
    v222[4] = &v302;
    v222[5] = &buf;
    id v70 = [v24 indexesOfObjectsPassingTest:v222];
    if ([v70 count])
    {
      [v24 removeObjectsAtIndexes:v70];
      id v71 = [v70 firstIndex];
      id v72 = +[NSMutableArray array];
      if ([(id)v303[5] length]) {
        [v72 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"hw=%@", v303[5])];
      }
      if ([*(id *)(*((void *)&buf + 1) + 40) length]) {
        [v72 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"sw=%@", *(void *)(*((void *)&buf + 1) + 40))];
      }
      if ([v72 count]) {
        CFStringRef v73 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"en_JP@%@", [v72 componentsJoinedByString:@";"]);
      }
      else {
        CFStringRef v73 = @"en_JP";
      }
      [v24 insertObject:v73 atIndex:v71];
    }
    _Block_object_dispose(&buf, 8);
LABEL_163:
    _Block_object_dispose(&v302, 8);
  }
  if (_os_feature_enabled_impl())
  {
    CFPropertyListRef v76 = (id)CFPreferencesCopyAppValue(@"MultilingualSetsMigrationVersion", @"com.apple.migration");
    if (!v76
      || (v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ![v77 unsignedIntegerValue])
    {
      long long v273 = 0u;
      long long v272 = 0u;
      long long v271 = 0u;
      long long v270 = 0u;
      v78 = (char *)[v24 countByEnumeratingWithState:&v270 objects:&v302 count:16];
      if (!v78) {
        goto LABEL_176;
      }
      v79 = v78;
      uint64_t v80 = *(void *)v271;
      do
      {
        for (m = 0; m != v79; ++m)
        {
          if (*(void *)v271 != v80) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend(objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", @"ml"), "length"))
          {
            CFStringRef v28 = applicationID;
            goto LABEL_343;
          }
        }
        v79 = (char *)[v24 countByEnumeratingWithState:&v270 objects:&v302 count:16];
      }
      while (v79);
LABEL_176:
      CFPreferencesSetAppValue(@"MultilingualSetsMigrationVersion", &off_DA08, @"com.apple.migration");
      CFPreferencesAppSynchronize(@"com.apple.migration");
      if (qword_10400 != -1) {
        dispatch_once(&qword_10400, &stru_C280);
      }
      v82 = qword_10408;
      if (os_log_type_enabled((os_log_t)qword_10408, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_0, v82, OS_LOG_TYPE_DEFAULT, "Beginning migration to multilingual sets with previous input modes %@", (uint8_t *)&buf, 0xCu);
      }
      id v211 = +[NSMutableArray array];
      id v217 = +[NSMutableDictionary dictionary];
      id v214 = +[NSMutableDictionary dictionary];
      long long v266 = 0u;
      long long v267 = 0u;
      long long v268 = 0u;
      long long v269 = 0u;
      id v83 = objc_msgSend(+[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController"), "supportedInputModeIdentifiers");
      id v84 = [v83 countByEnumeratingWithState:&v266 objects:&buf count:16];
      if (v84)
      {
        id v85 = v84;
        uint64_t v86 = *(void *)v267;
        uint64_t v87 = TIInputModePropertiesSupportsMultilingual;
        uint64_t v88 = TIInputModePropertiesMultilingualOnly;
        uint64_t v207 = TIInputModePropertiesRequiredMultilingualInputModes;
        uint64_t v203 = TIInputModePropertiesPairedMultilingualInputMode;
        do
        {
          for (n = 0; n != v85; n = (char *)n + 1)
          {
            if (*(void *)v267 != v86) {
              objc_enumerationMutation(v83);
            }
            v90 = *(void **)(*((void *)&v266 + 1) + 8 * (void)n);
            if (objc_msgSend(objc_msgSend((id)TIGetInputModeProperties(), "objectForKeyedSubscript:", v87), "BOOLValue"))
            {
              if (objc_msgSend(objc_msgSend((id)TIGetInputModeProperties(), "objectForKeyedSubscript:", v88), "BOOLValue"))
              {
                id v91 = [(id)TIGetInputModeProperties() objectForKeyedSubscript:v207];
                v92 = (__CFString *)[(id)TIGetInputModeProperties() objectForKeyedSubscript:v203];
                if ([v91 count])
                {
                  v295[0] = @"required";
                  v295[1] = @"paired";
                  CFStringRef v93 = &stru_CED0;
                  if (v92) {
                    CFStringRef v93 = v92;
                  }
                  v296[0] = v91;
                  v296[1] = v93;
                  objc_msgSend(v217, "setObject:forKeyedSubscript:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v296, v295, 2), v90);
                }
                if ([(__CFString *)v92 length]) {
                  [v214 setObject:v90 forKeyedSubscript:v92];
                }
              }
              else if (([v90 isEqualToString:@"ko_KR"] & 1) == 0)
              {
                [v211 addObject:v90];
              }
            }
          }
          id v85 = [v83 countByEnumeratingWithState:&v266 objects:&buf count:16];
        }
        while (v85);
      }
      id v94 = +[NSMutableArray array];
      id v95 = +[NSMutableDictionary dictionary];
      long long v262 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      long long v265 = 0u;
      id v96 = [v191 countByEnumeratingWithState:&v262 objects:v294 count:16];
      if (v96)
      {
        id v97 = v96;
        uint64_t v98 = *(void *)v263;
        do
        {
          for (ii = 0; ii != v97; ii = (char *)ii + 1)
          {
            if (*(void *)v263 != v98) {
              objc_enumerationMutation(v191);
            }
            uint64_t v100 = *(void *)(*((void *)&v262 + 1) + 8 * (void)ii);
            id NormalizedIdentifier = (id)TIInputModeGetNormalizedIdentifier();
            id v102 = v94;
            if (([v211 containsObject:NormalizedIdentifier] & 1) == 0)
            {
              if (![v217 objectForKey:NormalizedIdentifier])
              {
                if (![v214 objectForKey:NormalizedIdentifier]) {
                  continue;
                }
                id NormalizedIdentifier = [v214 objectForKeyedSubscript:NormalizedIdentifier];
              }
              id v102 = [v95 objectForKeyedSubscript:NormalizedIdentifier];
              if (!v102)
              {
                id v102 = +[NSMutableArray array];
                [v95 setObject:v102 forKeyedSubscript:NormalizedIdentifier];
              }
            }
            [v102 addObject:v100];
          }
          id v97 = [v191 countByEnumeratingWithState:&v262 objects:v294 count:16];
        }
        while (v97);
      }
      id v201 = v95;
      id v103 = +[NSMutableDictionary dictionary];
      long long v258 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      id v104 = [v94 countByEnumeratingWithState:&v258 objects:v293 count:16];
      if (v104)
      {
        id v105 = v104;
        uint64_t v106 = *(void *)v259;
        do
        {
          for (jj = 0; jj != v105; jj = (char *)jj + 1)
          {
            if (*(void *)v259 != v106) {
              objc_enumerationMutation(v94);
            }
            uint64_t v108 = *(void *)(*((void *)&v258 + 1) + 8 * (void)jj);
            uint64_t v109 = TIInputModeGetNormalizedIdentifier();
            if (qword_10420) {
              id v110 = [(id)qword_10420 objectForKeyedSubscript:TIInputModeGetNormalizedIdentifier()];
            }
            else {
              id v110 = (id)UIKeyboardSimulatedImplicitInputModeDetectionForPrimaryInputMode();
            }
            v111 = v110;
            if ([v110 count])
            {
              v257[0] = _NSConcreteStackBlock;
              v257[1] = 3221225472;
              v257[2] = sub_97A0;
              v257[3] = &unk_C2F8;
              v257[4] = v109;
              v257[5] = v211;
              id v112 = [v111 indexesOfObjectsPassingTest:v257];
              if ([v112 count]) {
                objc_msgSend(v103, "setObject:forKeyedSubscript:", objc_msgSend(v111, "objectsAtIndexes:", v112), v108);
              }
            }
          }
          id v105 = [v94 countByEnumeratingWithState:&v258 objects:v293 count:16];
        }
        while (v105);
      }
      id v212 = [v191 mutableCopy];
      if ([v103 count])
      {
        long long v291 = 0u;
        long long v290 = 0u;
        long long v289 = 0u;
        long long v288 = 0u;
        id v113 = [v103 countByEnumeratingWithState:&v288 objects:v292 count:16];
        if (v113)
        {
          id v114 = v113;
          uint64_t v115 = *(void *)v289;
          uint64_t v116 = 1;
          do
          {
            for (kk = 0; kk != v114; kk = (char *)kk + 1)
            {
              if (*(void *)v289 != v115) {
                objc_enumerationMutation(v103);
              }
              v118 = *(void **)(*((void *)&v288 + 1) + 8 * (void)kk);
              id v119 = objc_msgSend(objc_msgSend(v103, "objectForKeyedSubscript:", v118), "firstObject");
              if ([v119 length])
              {
                v120 = +[NSString stringWithFormat:@"%u", v116];
                id v121 = sub_97FC(v118, (uint64_t)v120);
                id v122 = sub_97FC(v119, (uint64_t)v120);
                v123 = (char *)[v212 indexOfObject:v118];
                if (v123 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v124 = v123;
                  [v212 replaceObjectAtIndex:v123 withObject:v121];
                  [v212 insertObject:v122 atIndex:v124 + 1];
                }
                uint64_t v116 = (v116 + 1);
              }
            }
            id v114 = [v103 countByEnumeratingWithState:&v288 objects:v292 count:16];
          }
          while (v114);
        }
        goto LABEL_319;
      }
      v125 = v201;
      if (![v201 count] && objc_msgSend(v94, "count") == (char *)&dword_0 + 2)
      {
        id v126 = [v94 objectAtIndexedSubscript:0];
        id v127 = [v94 objectAtIndexedSubscript:1];
        Language = (void *)TIInputModeGetLanguage();
        if (([Language isEqualToString:TIInputModeGetLanguage()] & 1) == 0)
        {
          id v129 = sub_92D4(v126);
          id v130 = sub_92D4(v127);
          if (v129)
          {
            id v131 = v130;
            if (v130)
            {
              v215 = v126;
              long long v291 = 0u;
              long long v290 = 0u;
              long long v289 = 0u;
              long long v288 = 0u;
              id v132 = [v94 countByEnumeratingWithState:&v288 objects:v292 count:16];
              id v204 = v131;
              v208 = v129;
              if (v132)
              {
                id v133 = v132;
                uint64_t v134 = *(void *)v289;
                uint64_t v135 = 0x7FFFFFFFFFFFFFFFLL;
                do
                {
                  for (mm = 0; mm != v133; mm = (char *)mm + 1)
                  {
                    if (*(void *)v289 != v134) {
                      objc_enumerationMutation(v94);
                    }
                    v137 = *(void **)(*((void *)&v288 + 1) + 8 * (void)mm);
                    id v138 = sub_97FC(v137, @"1");
                    id v139 = [v212 indexOfObject:v137];
                    if (v139 != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      id v140 = v139;
                      [v212 replaceObjectAtIndex:v139 withObject:v138];
                      uint64_t v135 = (uint64_t)v140 + 1;
                    }
                  }
                  id v133 = [v94 countByEnumeratingWithState:&v288 objects:v292 count:16];
                }
                while (v133);
              }
              else
              {
                uint64_t v135 = 0x7FFFFFFFFFFFFFFFLL;
              }
              uint64_t Variant = TIInputModeGetVariant();
              uint64_t v168 = TIInputModeGetVariant();
              if (![v208 isEqualToString:v204]
                || (v168 ? (CFStringRef v169 = (const __CFString *)v168) : (CFStringRef v169 = &stru_CED0),
                    Variant ? (v170 = (__CFString *)Variant) : (v170 = &stru_CED0),
                    ([(__CFString *)v170 isEqualToString:v169] & 1) == 0))
              {
                if (v135 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  id v171 = sub_97FC(v127, @"2");
                  id v172 = sub_97FC(v215, @"2");
                  [v212 insertObject:v171 atIndex:v135];
                  [v212 insertObject:v172 atIndex:v135 + 1];
                }
              }
            }
          }
        }
        goto LABEL_319;
      }
      if (![v201 count] || objc_msgSend(v94, "count") != (char *)&dword_0 + 1) {
        goto LABEL_319;
      }
      id v195 = +[NSMutableSet set];
      id v193 = +[NSMutableArray array];
      id v189 = +[NSMutableArray array];
      long long v253 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      id v199 = [v201 countByEnumeratingWithState:&v253 objects:v292 count:16];
      if (v199)
      {
        uint64_t v197 = *(void *)v254;
        do
        {
          uint64_t v141 = 0;
          do
          {
            if (*(void *)v254 != v197) {
              objc_enumerationMutation(v125);
            }
            v205 = *(void **)(*((void *)&v253 + 1) + 8 * v141);
            uint64_t v209 = v141;
            id v142 = objc_msgSend(v125, "objectForKeyedSubscript:");
            long long v249 = 0u;
            long long v250 = 0u;
            long long v251 = 0u;
            long long v252 = 0u;
            v143 = (char *)[v142 countByEnumeratingWithState:&v249 objects:&v288 count:16];
            if (v143)
            {
              v144 = v143;
              uint64_t v145 = *(void *)v250;
              while (2)
              {
                for (nn = 0; nn != v144; ++nn)
                {
                  if (*(void *)v250 != v145) {
                    objc_enumerationMutation(v142);
                  }
                  uint64_t v147 = TIInputModeGetNormalizedIdentifier();
                  id v148 = [v217 objectForKeyedSubscript:v147];
                  if (v148
                    || (id v148 = objc_msgSend(v217, "objectForKeyedSubscript:", objc_msgSend(v214, "objectForKeyedSubscript:", v147))) != 0)
                  {
                    id v149 = [v148 objectForKeyedSubscript:@"required"];
                    long long v245 = 0u;
                    long long v246 = 0u;
                    long long v247 = 0u;
                    long long v248 = 0u;
                    id v150 = [v94 countByEnumeratingWithState:&v245 objects:v287 count:16];
                    if (v150)
                    {
                      id v151 = v150;
                      uint64_t v152 = *(void *)v246;
LABEL_269:
                      uint64_t v153 = 0;
                      while (1)
                      {
                        if (*(void *)v246 != v152) {
                          objc_enumerationMutation(v94);
                        }
                        uint64_t v154 = *(void *)(*((void *)&v245 + 1) + 8 * v153);
                        if ([v149 containsObject:TIInputModeGetNormalizedIdentifier()]) {
                          break;
                        }
                        if (v151 == (id)++v153)
                        {
                          id v151 = [v94 countByEnumeratingWithState:&v245 objects:v287 count:16];
                          if (v151) {
                            goto LABEL_269;
                          }
                          goto LABEL_277;
                        }
                      }
                      if (!v154) {
                        continue;
                      }
                      [v195 addObject:v154];
                      v155 = v205;
                      goto LABEL_281;
                    }
                  }
LABEL_277:
                  ;
                }
                v144 = (char *)[v142 countByEnumeratingWithState:&v249 objects:&v288 count:16];
                if (v144) {
                  continue;
                }
                break;
              }
            }
            v155 = v205;
            [v193 addObject:v205];
LABEL_281:
            v125 = v201;
            if (([v155 isEqualToString:@"hi_Latn"] & 1) == 0
              && ([v155 isEqualToString:@"hi-Translit"] & 1) == 0)
            {
              [v189 addObject:v155];
            }
            uint64_t v141 = v209 + 1;
          }
          while ((id)(v209 + 1) != v199);
          id v199 = [v201 countByEnumeratingWithState:&v253 objects:v292 count:16];
        }
        while (v199);
      }
      [v125 removeObjectsForKeys:v193];
      if (qword_10418)
      {
        if (([(id)qword_10418 BOOLValue] & 1) == 0) {
          goto LABEL_288;
        }
      }
      else if ((isH13ANEPresentOnIOS() & 1) == 0)
      {
LABEL_288:
        [v125 removeObjectsForKeys:v189];
      }
      if ([v195 count] == (char *)&dword_0 + 1
        && [v125 count]
        && (unint64_t)[v125 count] <= 2)
      {
        id v156 = [v195 anyObject];
        v157 = +[NSMutableArray arrayWithObject:v156];
        v158 = +[NSMutableArray arrayWithObject:sub_97FC(v156, @"1")];
        long long v241 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        long long v244 = 0u;
        id v159 = [v125 countByEnumeratingWithState:&v241 objects:v286 count:16];
        if (v159)
        {
          id v160 = v159;
          uint64_t v161 = *(void *)v242;
          do
          {
            for (i1 = 0; i1 != v160; i1 = (char *)i1 + 1)
            {
              if (*(void *)v242 != v161) {
                objc_enumerationMutation(v201);
              }
              v163 = *(void **)(*((void *)&v241 + 1) + 8 * (void)i1);
              -[NSMutableArray addObjectsFromArray:](v157, "addObjectsFromArray:", [v201 objectForKeyedSubscript:v163]);
              [(NSMutableArray *)v158 addObject:sub_97FC(v163, @"1")];
              id v164 = objc_msgSend(objc_msgSend(v217, "objectForKeyedSubscript:", v163), "objectForKeyedSubscript:", @"paired");
              if ([v164 length]) {
                [(NSMutableArray *)v158 addObject:sub_97FC(v164, @"1")];
              }
            }
            id v160 = [v201 countByEnumeratingWithState:&v241 objects:v286 count:16];
          }
          while (v160);
        }
        if ((unint64_t)[(NSMutableArray *)v157 count] >= 2)
        {
          unint64_t v165 = 1;
          do
            objc_msgSend(v212, "removeObject:", -[NSMutableArray objectAtIndexedSubscript:](v157, "objectAtIndexedSubscript:", v165++));
          while (v165 < (unint64_t)[(NSMutableArray *)v157 count]);
        }
        id v166 = objc_msgSend(v212, "indexOfObject:", -[NSMutableArray objectAtIndexedSubscript:](v157, "objectAtIndexedSubscript:", 0));
        if (v166 != (id)0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v212, "replaceObjectsInRange:withObjectsFromArray:", v166, 1, v158);
        }
      }
LABEL_319:
      id v24 = v212;
      CFStringRef v28 = applicationID;
      id v173 = v191;
      if ([v212 count])
      {
        uint64_t v174 = 0;
        while (1)
        {
          id v175 = [v212 objectAtIndexedSubscript:v174];
          if ([(id)TIInputModeGetNormalizedIdentifier() isEqualToString:@"hi_Latn"])
          {
            if (([v175 containsString:@"ml="] & 1) == 0) {
              break;
            }
          }
          if (++v174 >= (unint64_t)[v212 count]) {
            goto LABEL_339;
          }
        }
        if (![v212 count]) {
          goto LABEL_332;
        }
        uint64_t v176 = 0;
        while (1)
        {
          id v177 = objc_msgSend(objc_msgSend(v217, "objectForKeyedSubscript:", @"hi_Latn"), "objectForKeyedSubscript:", @"required");
          [v212 objectAtIndexedSubscript:v176];
          if ([v177 containsObject:TIInputModeGetNormalizedIdentifier()])
          {
            if (!objc_msgSend(objc_msgSend(v212, "objectAtIndexedSubscript:", v176), "containsString:", @"ml="))break; {
          }
            }
          if (++v176 >= (unint64_t)[v212 count]) {
            goto LABEL_332;
          }
        }
        if (v176 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v283 = sub_97FC([v212 objectAtIndexedSubscript:v176], @"1");
          id v284 = sub_97FC(@"hi_Latn", @"1");
          id v285 = sub_97FC(@"hi-Translit", @"1");
          objc_msgSend(v212, "replaceObjectsInRange:withObjectsFromArray:", v176, 1, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v283, 3));
          [v212 removeObject:v175];
        }
        else
        {
LABEL_332:
          CFStringRef v178 = (const __CFString *)sub_92D4(v175);
          if (v178) {
            CFStringRef v179 = v178;
          }
          else {
            CFStringRef v179 = @"QWERTY";
          }
          CFStringRef v180 = (const __CFString *)sub_959C(v175);
          CFStringRef v181 = @"Automatic";
          if (v180) {
            CFStringRef v181 = v180;
          }
          id v283 = sub_97FC(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"en_IN@sw=%@;hw=%@",
                     v179,
                     v181),
                   @"1");
          id v284 = sub_97FC(@"hi_Latn", @"1");
          id v285 = sub_97FC(@"hi-Translit", @"1");
          objc_msgSend(v212, "replaceObjectsInRange:withObjectsFromArray:", v174, 1, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v283, 3));
        }
        id v173 = v191;
      }
LABEL_339:
      if (qword_10400 != -1) {
        dispatch_once(&qword_10400, &stru_C280);
      }
      v182 = qword_10408;
      if (os_log_type_enabled((os_log_t)qword_10408, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v279 = 138412546;
        id v280 = v173;
        __int16 v281 = 2112;
        id v282 = v212;
        _os_log_impl(&dword_0, v182, OS_LOG_TYPE_DEFAULT, "Completed migration to multilingual sets with previous input modes %@ and new input modes %@", v279, 0x16u);
      }
    }
  }
LABEL_343:
  CFPreferencesSetAppValue(@"AppleKeyboards", v24, v28);
  CFPreferencesAppSynchronize(v28);
  CFRelease(obj);
  objc_msgSend(+[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController"), "migrateInputModes:", v24);
LABEL_344:
  CFRelease(v28);
}

id sub_92D4(void *a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"@;",
           0));
  id result = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      int v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        int v6 = *(void **)(*((void *)&v7 + 1) + 8 * (void)v5);
        if ([v6 hasPrefix:@"sw="]) {
          return [v6 substringFromIndex:objc_msgSend(@"sw=", "length")];
        }
        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id result = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v3 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

id sub_9410(void *a1, uint64_t a2)
{
  uint64_t v4 = [a1 rangeOfString:@"sw="];
  if (v4 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
    return a1;
  }
  int v6 = v4;
  long long v7 = (char *)objc_msgSend(a1, "rangeOfString:options:range:", @";",
                 0,
                 v6,
                 (unsigned char *)[a1 length] - v6);
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    long long v7 = (char *)[a1 length];
  }
  long long v8 = (char *)(v7 - v6);
  id v9 = [@"sw=" stringByAppendingString:a2];

  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v6, v8, v9);
}

void sub_94D4(uint64_t a1, uint64_t a2)
{
}

void sub_94E4(uint64_t a1)
{
}

id sub_94F0(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id result = [(id)TIInputModeGetBaseLanguage() isEqualToString:@"en"];
    if (!result) {
      return result;
    }
    if (([sub_92D4(a2) isEqualToString:@"QWERTY"] & 1) == 0) {
      return 0;
    }
    goto LABEL_7;
  }
  id result = [(id)TIInputModeGetLanguageWithRegion() isEqualToString:@"en_JP"];
  if (result)
  {
    id result = [sub_92D4(a2) isEqualToString:@"QWERTY"];
    if (result)
    {
LABEL_7:
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_959C(a2);
      return &dword_0 + 1;
    }
  }
  return result;
}

id sub_959C(void *a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"@;",
           0));
  id result = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      int v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        int v6 = *(void **)(*((void *)&v7 + 1) + 8 * (void)v5);
        if ([v6 hasPrefix:@"hw="]) {
          return [v6 substringFromIndex:objc_msgSend(@"hw=", "length")];
        }
        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id result = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v3 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

id sub_96D8(uint64_t a1, void *a2)
{
  id v4 = [(id)TIInputModeGetLanguageWithRegion() isEqualToString:@"en_US"];
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_959C(a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = sub_92D4(a2);
  }
  return v4;
}

uint64_t sub_974C()
{
  CFStringRef v0 = (void *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.migration");
  if (!v0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v1 = v0;
  id v2 = [v0 integerValue];
  CFRelease(v1);
  return (uint64_t)v2;
}

id sub_97A0(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)]) {
    return 0;
  }
  int v5 = *(void **)(a1 + 40);

  return [v5 containsObject:a2];
}

id sub_97FC(void *a1, uint64_t a2)
{
  if (objc_msgSend(objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", @"ml"), "length"))
  {
    return a1;
  }
  if ([a1 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL) {
    CFStringRef v5 = @"@ml=%@";
  }
  else {
    CFStringRef v5 = @";ml=%@";
  }
  return objc_msgSend(a1, "stringByAppendingFormat:", v5, a2);
}

uint64_t sub_9880(void *a1)
{
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryRecent"])
  {
    id v2 = &EMFEmojiCategoryRecents;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryPeople"])
  {
    id v2 = &EMFEmojiCategoryPeople;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryNature"])
  {
    id v2 = &EMFEmojiCategoryNature;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryFoodAndDrink"])
  {
    id v2 = &EMFEmojiCategoryFoodAndDrink;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryActivity"])
  {
    id v2 = &EMFEmojiCategoryActivity;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryTravelAndPlaces"])
  {
    id v2 = &EMFEmojiCategoryTravelAndPlaces;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryFlags"])
  {
    id v2 = &EMFEmojiCategoryFlags;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategoryObjects"])
  {
    id v2 = &EMFEmojiCategoryObjects;
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"UIKeyboardEmojiCategorySymbols"]) {
    return EMFEmojiCategorySymbols;
  }
  else {
    return 0;
  }
}

id sub_99C4(uint64_t a1, void *a2, void *a3)
{
  id result = (id)sub_9880(a2);
  if (result)
  {
    id v6 = result;
    id result = [a3 objectForKey:@"LastViewedIndexKey"];
    if (result)
    {
      id v7 = result;
      long long v8 = *(void **)(a1 + 32);
      return [v8 setObject:v7 forKey:v6];
    }
  }
  return result;
}

id sub_9A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) migrateInRecentEmoji:a2 usages:a3 typingNames:0];
}

id sub_9A54(uint64_t a1, void *a2, uint64_t a3)
{
  id result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    id result = [*(id *)(a1 + 40) isEqualToArray:a3];
    if (result)
    {
      id v6 = +[TIPreferencesController sharedPreferencesController];
      return [v6 setAutocorrectionEnabled:1];
    }
  }
  return result;
}

uint64_t sub_9AC4()
{
  id v0 = (id)DMCopyCurrentBuildVersion();
  if (!v0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (uint64_t)[v0 integerValue];
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return _CFStringTransform(string, range, transform, reverse);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return _CPCopySharedResourcesPreferencesDomainForDomain();
}

uint64_t DMCopyCurrentBuildVersion()
{
  return _DMCopyCurrentBuildVersion();
}

uint64_t MGGetFloat32Answer()
{
  return _MGGetFloat32Answer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t TIGetInputModeProperties()
{
  return _TIGetInputModeProperties();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return _TIInputModeGetBaseLanguage();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return _TIInputModeGetComponentsFromIdentifier();
}

uint64_t TIInputModeGetLanguage()
{
  return _TIInputModeGetLanguage();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return _TIInputModeGetLanguageWithRegion();
}

uint64_t TIInputModeGetNormalizedIdentifier()
{
  return _TIInputModeGetNormalizedIdentifier();
}

uint64_t TIInputModeGetVariant()
{
  return _TIInputModeGetVariant();
}

uint64_t UIKeyboardSimulatedImplicitInputModeDetectionForPrimaryInputMode()
{
  return _UIKeyboardSimulatedImplicitInputModeDetectionForPrimaryInputMode();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t isH13ANEPresentOnIOS()
{
  return _isH13ANEPresentOnIOS();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultEnabledInputModesForCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 defaultEnabledInputModesForCurrentLocale];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enabledInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 enabledInputModeIdentifiers];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_migrateAllPreferencesToNewDomain(void *a1, const char *a2, ...)
{
  return [a1 migrateAllPreferencesToNewDomain];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_readEmojiDefaults(void *a1, const char *a2, ...)
{
  return [a1 readEmojiDefaults];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return [a1 sharedInputModeController];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_supportedInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 supportedInputModeIdentifiers];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_writeEmojiDefaults(void *a1, const char *a2, ...)
{
  return [a1 writeEmojiDefaults];
}