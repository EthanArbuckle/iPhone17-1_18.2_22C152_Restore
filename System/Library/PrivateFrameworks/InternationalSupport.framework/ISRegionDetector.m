@interface ISRegionDetector
+ (id)sharedRegionDetector;
- (BOOL)fakeMode;
- (BOOL)getCountryFromTelephony;
- (ISRegionDetector)init;
- (NSArray)firstGuessedLanguages;
- (NSArray)guessedCountries;
- (NSDate)wirelessScanStartDate;
- (id)_checkForAliases:(id)a3;
- (id)_checkForAliasesOrInvalid:(id)a3;
- (id)_checkedArrayForString:(id)a3;
- (id)_countryFromTelephony;
- (id)guessedCountryFromTelephony;
- (id)guessedLanguages;
- (unint64_t)numberOfWiFiScanAttemptsRemaining;
- (void)_closeWifiConnection;
- (void)_getWifiDevice;
- (void)_scanComplete:(id)a3 error:(BOOL)a4;
- (void)_scanWifiList;
- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3;
- (void)_startWifiScan;
- (void)dealloc;
- (void)reset;
- (void)setFakeMode:(BOOL)a3;
- (void)setFirstGuessedLanguages:(id)a3;
- (void)setGuessedCountries:(id)a3;
- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3;
- (void)setWirelessScanStartDate:(id)a3;
@end

@implementation ISRegionDetector

+ (id)sharedRegionDetector
{
  v2 = (void *)sharedRegionDetector_sharedInstance;
  if (!sharedRegionDetector_sharedInstance)
  {
    v3 = objc_alloc_init(ISRegionDetector);
    v4 = (void *)sharedRegionDetector_sharedInstance;
    sharedRegionDetector_sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedRegionDetector_sharedInstance;
  }

  return v2;
}

- (id)_countryFromTelephony
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
  id v14 = 0;
  v3 = [v2 getSubscriptionInfoWithError:&v14];
  id v4 = v14;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v7 = [v3 subscriptionsInUse];
    id v5 = (id)[v7 count];

    if (v5)
    {
      v8 = [v3 subscriptionsInUse];
      v9 = [v8 objectAtIndexedSubscript:0];
      id v13 = 0;
      v10 = (void *)[v2 copyMobileCountryCode:v9 error:&v13];
      id v5 = v13;

      if (v5)
      {
        v6 = 0;
      }
      else
      {
        id v12 = 0;
        v6 = (void *)[v2 copyMobileSubscriberIsoCountryCode:v10 error:&v12];
        id v5 = v12;
      }

      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)_checkForAliases:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 count];
    if (v5)
    {
      unint64_t v6 = v5;
      unint64_t v7 = 0;
      do
      {
        v8 = [v4 objectAtIndexedSubscript:v7];
        v9 = [&unk_1F3FC0EE0 objectForKey:v8];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
          }
          else
          {
            v14[0] = v9;
            id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
          }
          id v12 = v10;
          objc_msgSend(v4, "replaceObjectsInRange:withObjectsFromArray:", v7, 1, v10);
          uint64_t v11 = [v12 count];
        }
        else
        {
          uint64_t v11 = 1;
        }
        v7 += v11;
      }
      while (v7 < v6);
    }
  }

  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_validCountries)
  {
    id v25 = v4;
    unint64_t v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unint64_t v7 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      uint64_t v11 = *MEMORY[0x1E4F1C400];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = (void *)MEMORY[0x1E4F1CA20];
          id v14 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          v15 = [v13 componentsFromLocaleIdentifier:v14];

          v16 = [v15 objectForKey:v11];
          if (v16) {
            [(NSSet *)v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    id v4 = v25;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = [(ISRegionDetector *)self _checkForAliases:v4];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        if ([(NSSet *)self->_validCountries containsObject:v23]) {
          [v5 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
    uint64_t v5 = [(ISRegionDetector *)self _checkForAliases:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (ISRegionDetector)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISRegionDetector;
  v2 = [(ISRegionDetector *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2->_numberOfWiFiScanAttemptsRemaining = 5;
    if (!v2->_guessedCountries)
    {
      [(ISRegionDetector *)v2 getCountryFromTelephony];
      if (!v3->_guessedCountries) {
        [(ISRegionDetector *)v3 _startWifiScan];
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  [(ISRegionDetector *)self _closeWifiConnection];
  v3.receiver = self;
  v3.super_class = (Class)ISRegionDetector;
  [(ISRegionDetector *)&v3 dealloc];
}

- (id)guessedCountryFromTelephony
{
  return self->_guessedCountryFromTelephony;
}

- (BOOL)getCountryFromTelephony
{
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  if (!guessedCountryFromTelephony)
  {
    id v4 = [(ISRegionDetector *)self _countryFromTelephony];
    objc_super v5 = self->_guessedCountryFromTelephony;
    self->_guessedCountryFromTelephony = v4;

    NSUInteger v6 = [(NSString *)self->_guessedCountryFromTelephony length];
    guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    if (v6)
    {
      unint64_t v7 = [(NSString *)guessedCountryFromTelephony uppercaseString];
      uint64_t v8 = [(ISRegionDetector *)self _checkedArrayForString:v7];
      [(ISRegionDetector *)self setGuessedCountries:v8];

      guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    }
  }
  return guessedCountryFromTelephony != 0;
}

- (id)guessedLanguages
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_guessedCountries count])
  {
    objc_super v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v22 = v2;
    objc_super v5 = v2->_guessedCountries;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [MEMORY[0x1E4F1CA20] languagesForRegion:*(void *)(*((void *)&v27 + 1) + 8 * i) subdivision:0 withThreshold:1 filter:0];
          uint64_t v11 = [v10 reverseObjectEnumerator];
          id v12 = [v11 allObjects];

          [v4 addObject:v12];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    while (1)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v4;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (!v14) {
        break;
      }
      uint64_t v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          uint64_t v20 = [v19 lastObject];
          if (v20)
          {
            if (([v3 containsObject:v20] & 1) == 0) {
              [v3 addObject:v20];
            }
            [v19 removeLastObject];
            char v16 = 1;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);

      if ((v16 & 1) == 0) {
        goto LABEL_25;
      }
    }

LABEL_25:
    v2 = v22;
  }
  else
  {
    objc_super v3 = 0;
  }
  if (!v2->_firstGuessedLanguages) {
    [(ISRegionDetector *)v2 setFirstGuessedLanguages:v3];
  }

  return v3;
}

- (void)_startWifiScan
{
  dlerror();
  uint64_t v0 = abort_report_np();
  +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:](v0);
}

- (void)_getWifiDevice
{
  fWifiManager = self->fWifiManager;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v4 = (uint64_t (*)(__WiFiManagerClient *))getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  uint64_t v15 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  if (!getWiFiManagerClientCopyDevicesSymbolLoc_ptr)
  {
    objc_super v5 = (void *)MobileWiFiLibrary();
    v13[3] = (uint64_t)dlsym(v5, "WiFiManagerClientCopyDevices");
    getWiFiManagerClientCopyDevicesSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    id v4 = (uint64_t (*)(__WiFiManagerClient *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v4) {
    -[ISRegionDetector _startWifiScan]();
  }
  CFArrayRef v6 = (const __CFArray *)v4(fWifiManager);
  if (v6)
  {
    CFArrayRef v7 = v6;
    if (CFArrayGetCount(v6))
    {
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v7, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex)
      {
        CFTypeID v9 = CFGetTypeID(ValueAtIndex);
        uint64_t v12 = 0;
        id v13 = &v12;
        uint64_t v14 = 0x2020000000;
        uint64_t v10 = (uint64_t (*)(void))getWiFiDeviceClientGetTypeIDSymbolLoc_ptr;
        uint64_t v15 = getWiFiDeviceClientGetTypeIDSymbolLoc_ptr;
        if (!getWiFiDeviceClientGetTypeIDSymbolLoc_ptr)
        {
          uint64_t v11 = (void *)MobileWiFiLibrary();
          v13[3] = (uint64_t)dlsym(v11, "WiFiDeviceClientGetTypeID");
          getWiFiDeviceClientGetTypeIDSymbolLoc_ptr = (_UNKNOWN *)v13[3];
          uint64_t v10 = (uint64_t (*)(void))v13[3];
        }
        _Block_object_dispose(&v12, 8);
        if (!v10) {
          -[ISRegionDetector _startWifiScan]();
        }
        if (v9 == v10()) {
          CFRetain(self->fWifiDevice);
        }
      }
    }
    CFRelease(v7);
  }
}

- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    self->fWifiDevice = a3;
    CFRetain(a3);
    [(ISRegionDetector *)self _scanWifiList];
  }
  else
  {
    [(ISRegionDetector *)self _closeWifiConnection];
  }
}

- (void)_scanWifiList
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [(ISRegionDetector *)self setWirelessScanStartDate:v4];

  fWifiDevice = self->fWifiDevice;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  CFArrayRef v6 = (unsigned int (*)(__WiFiDeviceClient *, void *, void, ISRegionDetector *))getWiFiDeviceClientScanAsyncSymbolLoc_ptr;
  uint64_t v14 = getWiFiDeviceClientScanAsyncSymbolLoc_ptr;
  if (!getWiFiDeviceClientScanAsyncSymbolLoc_ptr)
  {
    v9[5] = MEMORY[0x1E4F143A8];
    v9[6] = 3221225472;
    v9[7] = __getWiFiDeviceClientScanAsyncSymbolLoc_block_invoke;
    v9[8] = &unk_1E6E3C300;
    uint64_t v10 = &v11;
    CFArrayRef v7 = (void *)MobileWiFiLibrary();
    v12[3] = (uint64_t)dlsym(v7, "WiFiDeviceClientScanAsync");
    getWiFiDeviceClientScanAsyncSymbolLoc_ptr = *(_UNKNOWN **)(v10[1] + 24);
    CFArrayRef v6 = (unsigned int (*)(__WiFiDeviceClient *, void *, void, ISRegionDetector *))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6) {
    -[ISRegionDetector _startWifiScan]();
  }
  if (v6(fWifiDevice, v3, scanComplete, self))
  {
    if ([(ISRegionDetector *)self numberOfWiFiScanAttemptsRemaining])
    {
      [(ISRegionDetector *)self setNumberOfWiFiScanAttemptsRemaining:[(ISRegionDetector *)self numberOfWiFiScanAttemptsRemaining] - 1];
      dispatch_time_t v8 = dispatch_time(0, 500000000);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __33__ISRegionDetector__scanWifiList__block_invoke;
      v9[3] = &unk_1E6E3C2D8;
      v9[4] = self;
      dispatch_after(v8, MEMORY[0x1E4F14428], v9);
    }
    else
    {
      [(ISRegionDetector *)self _closeWifiConnection];
    }
  }
}

void *__33__ISRegionDetector__scanWifiList__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2])
  {
    if (result[5]) {
      return (void *)[result _scanWifiList];
    }
  }
  return result;
}

- (void)_scanComplete:(id)a3 error:(BOOL)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFArrayRef v7 = v6;
  if (!a4 && !self->_guessedCountries)
  {
    uint64_t v33 = self;
    uint64_t v8 = [v6 count];
    if (!v8)
    {
LABEL_43:
      long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v32 postNotificationName:@"BYCountryScanCompletedNotification" object:0];

      self = v33;
      goto LABEL_44;
    }
    uint64_t v9 = v8;
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v11 = 0;
    unsigned int v47 = 3;
    do
    {
      uint64_t v12 = [v7 objectAtIndexedSubscript:v11];

      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v13 = (unsigned int (*)(void *, unsigned char *, unsigned int *))getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr;
      v57 = getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr;
      if (!getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr)
      {
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        v51 = __getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_block_invoke;
        v52 = &unk_1E6E3C300;
        v53 = &v54;
        uint64_t v14 = (void *)MobileWiFiLibrary();
        uint64_t v15 = dlsym(v14, "WiFiNetworkGet11dCountryCodeFromIe");
        *(void *)(v53[1] + 24) = v15;
        getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr = *(_UNKNOWN **)(v53[1] + 24);
        uint64_t v13 = (unsigned int (*)(void *, unsigned char *, unsigned int *))v55[3];
      }
      _Block_object_dispose(&v54, 8);
      if (!v13) {
        -[ISRegionDetector _startWifiScan]();
      }
      if (v13(v12, v48, &v47) && v47 >= 2)
      {
        char v16 = (void *)[[NSString alloc] initWithBytes:v48 length:2 encoding:1];
        [v34 addObject:v16];
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v17 = [(ISRegionDetector *)self _checkForAliasesOrInvalid:v34];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v60 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v17);
          }
          [v10 addObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v60 count:16];
      }
      while (v18);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v10;
    v22 = (void *)[v21 countByEnumeratingWithState:&v39 objects:v59 count:16];
    if (v22)
    {
      unint64_t v23 = 0;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v22; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          unint64_t v26 = [v21 countForObject:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
          if (v26 > v23) {
            unint64_t v23 = v26;
          }
        }
        v22 = (void *)[v21 countByEnumeratingWithState:&v39 objects:v59 count:16];
      }
      while (v22);

      if (!v23)
      {
        v22 = 0;
        goto LABEL_40;
      }
      v22 = [MEMORY[0x1E4F1CA48] array];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v27 = v21;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v58 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v36;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v35 + 1) + 8 * k);
            if ([v27 countForObject:v31] == v23) {
              [v22 addObject:v31];
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v58 count:16];
        }
        while (v28);
      }
    }

LABEL_40:
    if ([v22 count]) {
      [(ISRegionDetector *)v33 setGuessedCountries:v22];
    }

    goto LABEL_43;
  }
LABEL_44:
  [(ISRegionDetector *)self _closeWifiConnection];
}

- (void)_closeWifiConnection
{
  fWifiManager = self->fWifiManager;
  if (fWifiManager)
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    objc_super v5 = (void (*)(__WiFiManagerClient *, CFRunLoopRef, void))getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
    uint64_t v11 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
    if (!getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr)
    {
      id v6 = (void *)MobileWiFiLibrary();
      v9[3] = (uint64_t)dlsym(v6, "WiFiManagerClientUnscheduleFromRunLoop");
      getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = (_UNKNOWN *)v9[3];
      objc_super v5 = (void (*)(__WiFiManagerClient *, CFRunLoopRef, void))v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5) {
      -[ISRegionDetector _startWifiScan]();
    }
    v5(fWifiManager, Current, *MEMORY[0x1E4F1D410]);
    CFRelease(self->fWifiManager);
    self->fWifiManager = 0;
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    CFRelease(fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)reset
{
  [(ISRegionDetector *)self setGuessedCountries:0];
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  self->_guessedCountryFromTelephony = 0;
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

- (BOOL)fakeMode
{
  return self->_fakeMode;
}

- (void)setFakeMode:(BOOL)a3
{
  self->_fakeMode = a3;
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
}

- (unint64_t)numberOfWiFiScanAttemptsRemaining
{
  return self->_numberOfWiFiScanAttemptsRemaining;
}

- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3
{
  self->_numberOfWiFiScanAttemptsRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_guessedCountries, 0);

  objc_storeStrong((id *)&self->_guessedCountryFromTelephony, 0);
}

@end