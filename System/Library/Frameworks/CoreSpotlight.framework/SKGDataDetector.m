@interface SKGDataDetector
+ (id)sharedDetector;
- (BOOL)enumerateDataInString:(id)a3 locale:(id)a4 referenceDate:(id)a5 referenceTimezone:(id)a6 entityBlock:(id)a7 rangeBlock:(id)a8;
- (SKGDataDetector)init;
- (id)_addressFromResult:(id)a3;
- (id)_currencyFromResult:(id)a3;
- (id)_dateFromResult:(id)a3 referenceDate:(id)a4 referenceTimezone:(id)a5;
- (id)_emailAddressFromResult:(id)a3;
- (id)_flightFromResult:(id)a3;
- (id)_linkFromResult:(id)a3;
- (id)_locationsFromAddress:(id)a3 locale:(id)a4;
- (id)_phoneNumberDigitsFromResult:(id)a3;
- (id)_trackingNumberFromResult:(id)a3;
- (void)dealloc;
@end

@implementation SKGDataDetector

+ (id)sharedDetector
{
  if (qword_1000F91E0 != -1) {
    dispatch_once(&qword_1000F91E0, &stru_1000DC258);
  }
  v2 = (void *)qword_1000F91D8;

  return v2;
}

- (SKGDataDetector)init
{
  v10.receiver = self;
  v10.super_class = (Class)SKGDataDetector;
  v2 = [(SKGDataDetector *)&v10 init];
  if (v2)
  {
    v3 = (DDScannerServiceConfiguration *)[objc_alloc((Class)DDScannerServiceConfiguration) initWithScannerType:0 passiveIntent:1];
    config = v2->_config;
    v2->_config = v3;

    uint64_t v5 = +[NSCharacterSet characterSetWithCharactersInString:@"-()[]"];
    punctuation = v2->_punctuation;
    v2->_punctuation = (NSCharacterSet *)v5;

    v7 = +[SKGSystemListener sharedProcessorListener];
    v8 = [v7 geoIndexResourcesURL];

    v2->_geoIndex = (_SIGeoIndex *)SIGeoIndexCreateWithOptions();
  }
  return v2;
}

- (id)_addressFromResult:(id)a3
{
  id v3 = a3;
  v4 = [(SKGEntity *)[SKGAddress alloc] initWithScore:1.0];
  uint64_t v5 = [v3 value];
  [(SKGAddress *)v4 setAddress:v5];

  sub_10007EFD8(v3, v4);
  [(SKGEntity *)v4 score];
  if (v6 <= 1.0) {
    v7 = 0;
  }
  else {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)_locationsFromAddress:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  v33 = self;
  v30 = v6;
  if (!self->_geoIndex)
  {
    v28 = 0;
    goto LABEL_51;
  }
  id v7 = [v6 city];

  if (v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = [v6 city];
    [v7 addObject:v8];
  }
  v9 = objc_msgSend(v30, "state", v30);

  if (v9)
  {
    if (!v7) {
      id v7 = objc_alloc_init((Class)NSMutableArray);
    }
    objc_super v10 = [v30 state];
    [v7 addObject:v10];
  }
  v11 = [v30 country];

  if (v11)
  {
    if (!v7) {
      id v7 = objc_alloc_init((Class)NSMutableArray);
    }
    v12 = [v30 country];
    [v7 addObject:v12];
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v7;
  id v34 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (!v34)
  {

    v28 = 0;
    id v13 = 0;
    goto LABEL_50;
  }
  id v13 = 0;
  uint64_t v32 = *(void *)v63;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v63 != v32)
      {
        uint64_t v15 = v14;
        objc_enumerationMutation(obj);
        uint64_t v14 = v15;
      }
      uint64_t v36 = v14;
      v16 = [*(id *)(*((void *)&v62 + 1) + 8 * v14) lowercaseString];
      v17 = [v16 stringByReplacingOccurrencesOfString:@"-" withString:@" "];

      v38 = [v17 stringByReplacingOccurrencesOfString:@"." withString:&stru_1000DD7E8];

      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x3032000000;
      v59 = sub_100012704;
      v60 = sub_1000125A0;
      id v61 = 0;
      v49 = _NSConcreteStackBlock;
      uint64_t v50 = 3221225472;
      v51 = sub_10007F828;
      v52 = &unk_1000DC280;
      v53 = v33;
      id v54 = v35;
      v55 = &v56;
      SIGeoIndexEnumerateGeoIDForString();
      id v37 = [v13 count];
      if (v37)
      {
        id v18 = objc_alloc_init((Class)NSMutableArray);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v39 = (id)v57[5];
        id v19 = [v39 countByEnumeratingWithState:&v45 objects:v67 count:16];
        if (v19)
        {
          uint64_t v40 = *(void *)v46;
LABEL_20:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(v39);
            }
            v21 = *(void **)(*((void *)&v45 + 1) + 8 * v20);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v22 = v13;
            id v23 = v13;
            id v24 = [v23 countByEnumeratingWithState:&v41 objects:v66 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v42;
              while (2)
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                  if ([v21 relatedTo:v27])
                  {
                    [v18 addObject:v27];
                    goto LABEL_33;
                  }
                }
                id v24 = [v23 countByEnumeratingWithState:&v41 objects:v66 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }
LABEL_33:

            id v13 = v22;
            if ([v18 count]) {
              break;
            }
            if ((id)++v20 == v19)
            {
              id v19 = [v39 countByEnumeratingWithState:&v45 objects:v67 count:16];
              if (v19) {
                goto LABEL_20;
              }
              break;
            }
          }
        }

        [v13 removeAllObjects];
        [v13 addObjectsFromArray:v18];
        goto LABEL_41;
      }
      if (!v13) {
        id v13 = objc_alloc_init((Class)NSMutableSet);
      }
      if ([(id)v57[5] count])
      {
        id v18 = [(id)v57[5] allObjects];
        [v13 addObjectsFromArray:v18];
LABEL_41:
      }
      _Block_object_dispose(&v56, 8);

      if (v37) {
        goto LABEL_45;
      }
      uint64_t v14 = v36 + 1;
    }
    while ((id)(v36 + 1) != v34);
    id v34 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  }
  while (v34);
LABEL_45:

  if (v13)
  {
    v28 = [v13 allObjects];
  }
  else
  {
    v28 = 0;
  }
LABEL_50:

LABEL_51:

  return v28;
}

- (id)_dateFromResult:(id)a3 referenceDate:(id)a4 referenceTimezone:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v18 = 1.0;
  char v17 = 0;
  objc_super v10 = [v7 type];
  unsigned int v11 = [v10 hasPrefix:@"Date"];

  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = [v7 dateFromReferenceDate:v8 referenceTimezone:v9 timezoneRef:0 allDayRef:&v17];
  id v13 = (void *)v12;
  if (v17) {
    double v18 = 2.0;
  }
  if (v12)
  {
    sub_10007FA20(v7, &v18);
    uint64_t v14 = [SKGDate alloc];
    uint64_t v15 = [(SKGEntity *)v14 initWithScore:v18];
    [(SKGDate *)v15 setDate:v13];
  }
  else
  {
LABEL_6:
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_emailAddressFromResult:(id)a3
{
  id v9 = 0;
  id v10 = 0;
  unsigned int v3 = [a3 getMailValue:&v10 label:&v9];
  id v4 = v10;
  id v5 = v9;
  id v6 = 0;
  if (v3)
  {
    id v6 = [(SKGEntity *)[SKGEmailAddress alloc] initWithScore:1.0];
    [(SKGEmailAddress *)v6 setEmail:v4];
    id v7 = [v4 componentsSeparatedByString:@"@"];
    [(SKGEmailAddress *)v6 setComponents:v7];
  }

  return v6;
}

- (id)_phoneNumberDigitsFromResult:(id)a3
{
  id v24 = 0;
  id v25 = 0;
  unsigned int v4 = [a3 getPhoneValue:&v25 label:&v24];
  id v5 = v25;
  id v6 = v24;
  id v7 = 0;
  if (v4)
  {
    id v8 = +[CNPhoneNumber phoneNumberWithStringValue:v5];
    if (v8)
    {
      if (v6)
      {
        if ([v6 isEqualToString:@"Other"]) {
          double v9 = 1.0;
        }
        else {
          double v9 = 2.0;
        }
      }
      else
      {
        double v9 = 1.0;
      }
      id v10 = [v8 countryCode];
      if (v10)
      {
        unsigned int v11 = [v8 countryCode];
        uint64_t v12 = +[CNPhoneNumber dialingCodeForISOCountryCode:v11];
      }
      else
      {
        uint64_t v12 = 0;
      }

      id v13 = [v8 unformattedInternationalStringValue];
      uint64_t v14 = [v13 stringByRemovingCharactersFromSet:self->_punctuation];

      uint64_t v15 = [v14 stringByRemovingWhitespace];

      uint64_t v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v12 && v15)
      {
        uint64_t v17 = (uint64_t)[v15 rangeOfString:v12];
        uint64_t v16 = v18;
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = v15;
      }
      else
      {
        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:options:range:", v12, &stru_1000DD7E8, 8, v17, v16);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v20 = v19;
      id v7 = [(SKGEntity *)[SKGPhoneNumber alloc] initWithScore:v9];
      v21 = [v12 stringByReplacingOccurrencesOfString:@"+" withString:&stru_1000DD7E8];
      -[SKGPhoneNumber setCountryCodeValue:](v7, "setCountryCodeValue:", [v21 integerValue]);

      [(SKGPhoneNumber *)v7 setPhoneNumberValue:v15];
      if (v20)
      {
        v26 = v20;
        id v22 = +[NSArray arrayWithObjects:&v26 count:1];
        [(SKGPhoneNumber *)v7 setSynonyms:v22];
      }
      else
      {
        [(SKGPhoneNumber *)v7 setSynonyms:0];
      }
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_flightFromResult:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v12 = 0;
  unsigned int v4 = [v3 getFlightNumber:&v12 airline:&v11];
  id v5 = v12;
  id v6 = v11;
  id v7 = 0;
  if (v4)
  {
    id v7 = [(SKGEntity *)[SKGFlight alloc] initWithScore:1.0];
    id v8 = [v3 value];
    [(SKGFlight *)v7 setFlight:v8];

    if (v5)
    {
      if (v6)
      {
        double v9 = +[NSString stringWithFormat:@"%@%@", v6, v5];
        [(SKGFlight *)v7 addComponent:v9];
      }
    }
  }

  return v7;
}

- (id)_linkFromResult:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 type];
  unsigned int v5 = [&off_1000E7458 containsObject:v4];

  if (v5)
  {
    id v6 = [v3 value];
    id v7 = +[NSURL URLWithString:v6];

    id v8 = [v7 host];
    if (v8)
    {
      double v9 = [v7 host];
      unsigned int v10 = [v9 containsString:@"."];

      if (v10)
      {
        id v8 = [(SKGEntity *)[SKGLink alloc] initWithScore:1.0];
        id v11 = [v3 value];
        [(SKGLink *)v8 setLink:v11];

        id v12 = [v7 host];
        [(SKGLink *)v8 setDomain:v12];
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_trackingNumberFromResult:(id)a3
{
  id v10 = 0;
  id v11 = 0;
  unsigned int v3 = [a3 getTrackingNumber:&v11 carrier:&v10];
  id v4 = v11;
  id v5 = v10;
  id v6 = v5;
  id v7 = 0;
  if (v3)
  {
    if (v4) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(SKGEntity *)[SKGTrackingNumber alloc] initWithScore:1.0];
      [(SKGTrackingNumber *)v7 setTrackingNumber:v4];
      [(SKGTrackingNumber *)v7 setCarrier:v6];
    }
  }

  return v7;
}

- (id)_currencyFromResult:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  double v13 = 0.0;
  unsigned int v4 = [v3 getMoneyAmount:&v13 currency:&v12];
  id v5 = v12;
  id v6 = v5;
  id v7 = 0;
  if (v4 && v5)
  {
    uint64_t CurrencyCode = SICurrenciesGetCurrencyCode();
    if (CurrencyCode)
    {
      uint64_t v9 = CurrencyCode;
      id v7 = [(SKGEntity *)[SKGCurrency alloc] initWithScore:1.0];
      id v10 = [v3 value];
      [(SKGCurrency *)v7 setAmount:v10];

      [(SKGCurrency *)v7 setValue:v13];
      [(SKGCurrency *)v7 setCode:v9];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (BOOL)enumerateDataInString:(id)a3 locale:(id)a4 referenceDate:(id)a5 referenceTimezone:(id)a6 entityBlock:(id)a7 rangeBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v46 = a5;
  id v45 = a6;
  uint64_t v15 = (void (**)(id, void *, unsigned char *))a7;
  uint64_t v16 = (void (**)(id, id, uint64_t, void *, char *))a8;
  if (!v13 || ![v13 length])
  {
    BOOL v38 = 1;
    goto LABEL_53;
  }
  id v44 = v14;
  char v57 = 0;
  +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", v13, 0, [v13 length], self->_config);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (!v17) {
    goto LABEL_51;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v54;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v54 != v19) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v20);
      if ([v21 category] == 4)
      {
        if (v15)
        {
          uint64_t v23 = [(SKGDataDetector *)self _dateFromResult:v21 referenceDate:v46 referenceTimezone:v45];
          goto LABEL_37;
        }
LABEL_40:
        id v33 = [v21 range];
        uint64_t v35 = v34;
        uint64_t v36 = [v21 type];
        v16[2](v16, v33, v35, v36, &v57);

        goto LABEL_41;
      }
      if ([v21 category] == 1)
      {
        if (!v15) {
          goto LABEL_40;
        }
        id v24 = [v21 type];
        unsigned int v25 = [v24 containsString:@"Email"];

        if (v25) {
          [(SKGDataDetector *)self _emailAddressFromResult:v21];
        }
        else {
        uint64_t v23 = [(SKGDataDetector *)self _linkFromResult:v21];
        }
        goto LABEL_37;
      }
      if ([v21 category] == 2)
      {
        if (v15)
        {
          uint64_t v23 = [(SKGDataDetector *)self _phoneNumberDigitsFromResult:v21];
          goto LABEL_37;
        }
        goto LABEL_40;
      }
      if ([v21 category] == 3)
      {
        if (!v15) {
          goto LABEL_40;
        }
        v26 = [(SKGDataDetector *)self _addressFromResult:v21];
        if (v26)
        {
          v15[2](v15, v26, &v57);
          if (v44)
          {
            long long v41 = v22;
            id v42 = v13;
            uint64_t v40 = v26;
            uint64_t v27 = [(SKGDataDetector *)self _locationsFromAddress:v26 locale:v44];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v28 = v27;
            id v29 = [v28 countByEnumeratingWithState:&v49 objects:v58 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v50;
LABEL_25:
              uint64_t v32 = 0;
              while (1)
              {
                if (*(void *)v50 != v31) {
                  objc_enumerationMutation(v28);
                }
                v15[2](v15, *(void **)(*((void *)&v49 + 1) + 8 * v32), &v57);
                if (v57) {
                  break;
                }
                if (v30 == (id)++v32)
                {
                  id v30 = [v28 countByEnumeratingWithState:&v49 objects:v58 count:16];
                  if (v30) {
                    goto LABEL_25;
                  }
                  break;
                }
              }
            }

            id v22 = v41;
            id v13 = v42;
            v26 = v40;
          }
        }
LABEL_39:

        goto LABEL_40;
      }
      [v21 coreResult];
      if ((DDResultHasType() & 1) != 0 || ([v21 coreResult], DDResultHasType()))
      {
        if (!v15) {
          goto LABEL_41;
        }
        uint64_t v23 = [(SKGDataDetector *)self _flightFromResult:v21];
LABEL_37:
        v26 = (void *)v23;
        if (v23) {
          v15[2](v15, (void *)v23, &v57);
        }
        goto LABEL_39;
      }
      if ([v21 category] == 6)
      {
        if (v15)
        {
          uint64_t v23 = [(SKGDataDetector *)self _currencyFromResult:v21];
          goto LABEL_37;
        }
        goto LABEL_40;
      }
      if ([v21 category] == 5)
      {
        if (v15)
        {
          uint64_t v23 = [(SKGDataDetector *)self _trackingNumberFromResult:v21];
          goto LABEL_37;
        }
        goto LABEL_40;
      }
LABEL_41:
      if (v57) {
        goto LABEL_51;
      }
      uint64_t v20 = (char *)v20 + 1;
    }
    while (v20 != v18);
    id v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    id v18 = v37;
  }
  while (v37);
LABEL_51:

  BOOL v38 = v57 == 0;
  id v14 = v44;
LABEL_53:

  return v38;
}

- (void)dealloc
{
  if (self->_geoIndex) {
    SIGeoIndexRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)SKGDataDetector;
  [(SKGDataDetector *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuation, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end