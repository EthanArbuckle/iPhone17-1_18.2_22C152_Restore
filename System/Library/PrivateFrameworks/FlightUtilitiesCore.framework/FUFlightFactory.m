@interface FUFlightFactory
+ (Class)flightFactoryClassWithProvider:(id)a3;
+ (void)loadFlightWithIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7;
- (id)parseFlightData:(id)a3 withError:(id *)a4;
@end

@implementation FUFlightFactory

+ (Class)flightFactoryClassWithProvider:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"FUFactoryProvider_Default"] & 1) != 0
    || [v3 isEqualToString:@"FUFactoryProvider_Parsec"])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (id)parseFlightData:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (void)loadFlightWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (v7)
  {
    if (!v6) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    v9 = [v6 componentsSeparatedByString:@"-"];
    if ([v9 count] == 5)
    {
      v10 = [v9 objectAtIndexedSubscript:0];
      v11 = [v9 objectAtIndexedSubscript:1];
      uint64_t v12 = [v11 integerValue];

      v13 = +[FUFlight timeFormatterForIdentifier];
      v14 = [v9 objectAtIndexedSubscript:2];
      v15 = [v13 dateFromString:v14];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __62__FUFlightFactory_loadFlightWithIdentifier_completionHandler___block_invoke;
      v16[3] = &unk_264545DE0;
      id v17 = v9;
      v18 = v8;
      [a1 loadFlightsWithNumber:v12 airlineCode:v10 date:v15 dateType:1 completionHandler:v16];
    }
    else
    {
      NSLog(&cfstr_WrongFlightIde.isa);
      v8[2](v8, 0, 0);
    }
  }
}

void __62__FUFlightFactory_loadFlightWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    if (![v5 count]) {
      goto LABEL_25;
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = v6;
    id obj = v6;
    uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v38;
      uint64_t v34 = a1;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v7;
          v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
          v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 3, v31);
          v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:4];
          v11 = [v8 allLegs];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            unint64_t v13 = 0;
            uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
            do
            {
              v15 = [v8 allLegs];
              v16 = [v15 objectAtIndexedSubscript:v13];

              uint64_t v17 = v14;
              if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_14;
              }
              v18 = [v16 departure];
              v19 = [v18 airport];
              v20 = [v19 IATACode];
              int v21 = [v20 isEqualToString:v9];

              uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
              if (v21)
              {
                uint64_t v17 = v13;
                if (v13 != 0x7FFFFFFFFFFFFFFFLL)
                {
LABEL_14:
                  v22 = [v16 arrival];
                  v23 = [v22 airport];
                  v24 = [v23 IATACode];
                  char v25 = [v24 isEqualToString:v10];

                  if (v25)
                  {

                    if (v17 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL) {
                      break;
                    }
                    [v8 setDepartureLegIndex:v17 arrivalLegIndex:v13];
                    id v28 = v8;

                    id v6 = v31;
                    a1 = v34;
                    if (v28)
                    {
                      (*(void (**)(void))(*(void *)(v34 + 40) + 16))();

                      goto LABEL_26;
                    }
LABEL_25:
                    uint64_t v29 = *(void *)(a1 + 40);
                    v30 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.FlightUtilities.ParseError", 1, 0, v31);
                    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);

                    goto LABEL_26;
                  }
                  uint64_t v14 = v17;
                }
              }

              ++v13;
              v26 = [v8 allLegs];
              unint64_t v27 = [v26 count];
            }
            while (v13 < v27);
          }

          uint64_t v7 = v36 + 1;
          a1 = v34;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v35);
    }

    id v6 = v31;
    goto LABEL_25;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
}

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7
{
}

void __112__FUFlightFactory_Parsec_loadFlightsWithNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v40 = 0;
    id v5 = +[FUUtils convertFlightModel:a2 withError:&v40];
    id v26 = v40;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v5;
    uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v7, "flightNumber", v26) != *(void *)(a1 + 48)) {
            goto LABEL_12;
          }
          v8 = [v7 airline];
          v9 = [v8 IATACode];
          v10 = [*(id *)(a1 + 32) uppercaseString];
          char v11 = [v9 isEqualToString:v10];

          if ((v11 & 1) == 0)
          {
LABEL_12:
            uint64_t v30 = i;
            v31 = v7;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v12 = [v7 codeShares];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v33;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v33 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                  if ([v17 flightNumber] == *(void *)(a1 + 48))
                  {
                    v18 = [v17 airline];
                    v19 = [v18 IATACode];
                    v20 = [*(id *)(a1 + 32) uppercaseString];
                    int v21 = [v19 isEqualToString:v20];

                    if (v21)
                    {
                      objc_msgSend(v31, "setDisplayFlightNumber:", objc_msgSend(v17, "flightNumber"));
                      v22 = [v17 airline];
                      [v31 setDisplayAirline:v22];
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
              }
              while (v14);
            }

            uint64_t i = v30;
            uint64_t v7 = v31;
          }
          v23 = *(void **)(a1 + 32);
          v24 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
          char v25 = [v23 uppercaseStringWithLocale:v24];
          [v7 setQueriedAirlineTitle:v25];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v29);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2)
    {
      if (*(void *)(a1 + 80) == 1)
      {
        id v3 = [NSString stringWithFormat:@"%@%lu", *(void *)(a1 + 32), v2];
        v4 = [MEMORY[0x263F086E0] mainBundle];
        id v5 = [v4 bundleIdentifier];

        id v6 = [MEMORY[0x263F36D58] flightRequestForQuery:v3 date:*(void *)(a1 + 40) appBundleId:v5];
        uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 88)];
        v8 = [v7 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];

        if (![(__CFString *)v8 length])
        {

          v8 = @"1.0";
        }
        v9 = *(void **)(a1 + 48);
        if (v9)
        {
          id v10 = v9;
        }
        else
        {
          id v10 = [NSString stringWithFormat:@"FlightUtilities/%@", v8];
        }
        uint64_t v14 = v10;
        uint64_t v15 = *(__CFString **)(a1 + 56);
        if (!v15) {
          uint64_t v15 = @"com.apple.flightutilities";
        }
        v16 = (objc_class *)MEMORY[0x263F36D70];
        uint64_t v17 = v15;
        v18 = (void *)[[v16 alloc] initWithId:v17 userAgent:v14];
        v19 = [MEMORY[0x263F36D68] sharedPARSessionWithConfiguration:v18];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke_2;
        v22[3] = &unk_264545E58;
        id v23 = *(id *)(a1 + 64);
        v20 = [v19 taskWithRequest:v6 completion:v22];
        [v20 resume];

        return;
      }
      NSLog(&cfstr_TryingToHandle_1.isa);
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = 2;
    }
    else
    {
      NSLog(&cfstr_TryingToHandle_0.isa);
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = 1;
    }
  }
  else
  {
    NSLog(&cfstr_TryingToHandle.isa);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = 0;
  }
  id v21 = [v12 errorWithDomain:@"com.apple.FlightUtilities.QueryError" code:v13 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v21);
}

void __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    uint64_t v6 = [a3 flightResults];
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = (id)v6;
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v6, 0);
    }
    else
    {
      v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.FlightUtilities.NetworkError" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
}

@end