@interface MSParsecSearchSessionInstantAnswers
+ (id)dictionaryFromTimezone:(id)a3;
+ (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5;
+ (id)formattedDate:(id)a3 withTimezone:(id)a4;
+ (id)log;
+ (id)sfAirportToDictionnary:(id)a3;
+ (id)sfFlightStatusToString:(int)a3;
+ (id)sfFlightsToDictionary:(id)a3;
@end

@implementation MSParsecSearchSessionInstantAnswers

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSParsecSearchSessionInstantAnswers_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return v2;
}

void __42__MSParsecSearchSessionInstantAnswers_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

+ (id)sfFlightStatusToString:(int)a3
{
  if ((a3 - 1) > 8) {
    return @"unknown";
  }
  else {
    return off_1E63FECB8[a3 - 1];
  }
}

+ (id)dictionaryFromTimezone:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 name];

  if (v5)
  {
    v6 = [v3 name];
    [v4 setObject:v6 forKeyedSubscript:@"name"];
  }
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "secondsFromGMT"));
  [v4 setObject:v7 forKeyedSubscript:@"secondsFromGMT"];

  return v4;
}

+ (id)formattedDate:(id)a3 withTimezone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1C18A7DD0]();
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MSParsecSearchSessionInstantAnswers.m", 78, @"Can't create formattedDate, date is nil" object file lineNumber description];
  }
  v10 = objc_opt_new();
  v11 = v10;
  if (v8)
  {
    [v10 setTimeZone:v8];
    unint64_t v12 = [v11 formatOptions] | 0x40;
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v11 setTimeZone:v13];

    unint64_t v12 = [v11 formatOptions] & 0xFFFFFFFFFFFFFFBFLL;
  }
  [v11 setFormatOptions:v12];
  v14 = [v11 stringFromDate:v7];

  return v14;
}

+ (id)sfAirportToDictionnary:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C18A7DD0]();
  v6 = objc_opt_new();
  id v7 = [v4 code];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v8 forKeyedSubscript:@"code"];
  if (!v7) {

  }
  v9 = [v4 timezone];
  v10 = [a1 dictionaryFromTimezone:v9];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v11 forKeyedSubscript:@"timezone"];
  if (!v10) {

  }
  unint64_t v12 = [v4 name];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  [v6 setObject:v13 forKeyedSubscript:@"name"];
  if (!v12) {

  }
  v14 = (void *)[v6 copy];

  return v14;
}

+ (id)sfFlightsToDictionary:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  v67 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v61;
  uint64_t v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16, v61);
  if (v3)
  {
    uint64_t v66 = *(void *)v96;
    do
    {
      uint64_t v4 = 0;
      uint64_t v65 = v3;
      do
      {
        if (*(void *)v96 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v70 = v4;
        v5 = *(void **)(*((void *)&v95 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1C18A7DD0]();
        v71 = objc_opt_new();
        v6 = [v5 flightNumber];
        id v7 = v6;
        if (!v6)
        {
          v64 = [MEMORY[0x1E4F1CA98] null];
          id v7 = v64;
        }
        [v71 setObject:v7 forKeyedSubscript:@"flightNumber"];
        if (!v6) {

        }
        id v8 = [v5 carrierCode];
        v9 = v8;
        if (!v8)
        {
          v63 = [MEMORY[0x1E4F1CA98] null];
          v9 = v63;
        }
        [v71 setObject:v9 forKeyedSubscript:@"carrierCode"];
        if (!v8) {

        }
        v10 = NSSelectorFromString(&cfstr_Carrierwebsite.isa);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v5 v10];
        }
        else
        {
          id v11 = 0;
        }
        v88 = objc_opt_new();
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        unint64_t v12 = [v5 legs];
        uint64_t v89 = [v12 countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (v89)
        {
          uint64_t v87 = *(void *)v92;
          id v72 = v12;
          do
          {
            for (uint64_t i = 0; i != v89; ++i)
            {
              if (*(void *)v92 != v87) {
                objc_enumerationMutation(v72);
              }
              v14 = *(void **)(*((void *)&v91 + 1) + 8 * i);
              v15 = objc_opt_new();
              v16 = +[MSParsecSearchSessionInstantAnswers sfFlightStatusToString:](MSParsecSearchSessionInstantAnswers, "sfFlightStatusToString:", [v14 status]);
              v17 = v16;
              if (!v16)
              {
                v85 = [MEMORY[0x1E4F1CA98] null];
                v17 = v85;
              }
              [v15 setObject:v17 forKeyedSubscript:@"status"];
              if (!v16) {

              }
              v18 = [v14 title];
              v19 = v18;
              if (!v18)
              {
                v84 = [MEMORY[0x1E4F1CA98] null];
                v19 = v84;
              }
              [v15 setObject:v19 forKeyedSubscript:@"title"];
              if (!v18) {

              }
              v20 = [v14 departurePublishedTime];
              v21 = [v14 departureAirport];
              v22 = [v21 timezone];
              v23 = +[MSParsecSearchSessionInstantAnswers formattedDate:v20 withTimezone:v22];
              v24 = v23;
              if (!v23)
              {
                v83 = [MEMORY[0x1E4F1CA98] null];
                v24 = v83;
              }
              [v15 setObject:v24 forKeyedSubscript:@"departurePublishedTime"];
              if (!v23) {

              }
              v25 = [v14 departureActualTime];
              v26 = [v14 departureAirport];
              v27 = [v26 timezone];
              v28 = +[MSParsecSearchSessionInstantAnswers formattedDate:v25 withTimezone:v27];
              v29 = v28;
              if (!v28)
              {
                v82 = [MEMORY[0x1E4F1CA98] null];
                v29 = v82;
              }
              [v15 setObject:v29 forKeyedSubscript:@"departureActualTime"];
              if (!v28) {

              }
              v30 = [v14 departureTerminal];
              v31 = v30;
              if (!v30)
              {
                v81 = [MEMORY[0x1E4F1CA98] null];
                v31 = v81;
              }
              [v15 setObject:v31 forKeyedSubscript:@"departureTerminal"];
              if (!v30) {

              }
              v32 = [v14 departureGate];
              v33 = v32;
              if (!v32)
              {
                v80 = [MEMORY[0x1E4F1CA98] null];
                v33 = v80;
              }
              [v15 setObject:v33 forKeyedSubscript:@"departureGate"];
              if (!v32) {

              }
              v34 = [v14 arrivalPublishedTime];
              v35 = [v14 arrivalAirport];
              v36 = [v35 timezone];
              v37 = +[MSParsecSearchSessionInstantAnswers formattedDate:v34 withTimezone:v36];
              v38 = v37;
              if (!v37)
              {
                v79 = [MEMORY[0x1E4F1CA98] null];
                v38 = v79;
              }
              [v15 setObject:v38 forKeyedSubscript:@"arrivalPublishedTime"];
              if (!v37) {

              }
              v39 = [v14 arrivalActualTime];
              v40 = [v14 arrivalAirport];
              v41 = [v40 timezone];
              v42 = +[MSParsecSearchSessionInstantAnswers formattedDate:v39 withTimezone:v41];
              v43 = v42;
              if (!v42)
              {
                v78 = [MEMORY[0x1E4F1CA98] null];
                v43 = v78;
              }
              [v15 setObject:v43 forKeyedSubscript:@"arrivalActualTime"];
              if (!v42) {

              }
              v44 = [v14 arrivalTerminal];
              v45 = v44;
              if (!v44)
              {
                v77 = [MEMORY[0x1E4F1CA98] null];
                v45 = v77;
              }
              [v15 setObject:v45 forKeyedSubscript:@"arrivalTerminal"];
              if (!v44) {

              }
              v46 = [v14 arrivalGate];
              v47 = v46;
              if (!v46)
              {
                v76 = [MEMORY[0x1E4F1CA98] null];
                v47 = v76;
              }
              [v15 setObject:v47 forKeyedSubscript:@"arrivalGate"];
              if (!v46) {

              }
              v48 = [v14 departureAirport];
              v49 = +[MSParsecSearchSessionInstantAnswers sfAirportToDictionnary:v48];
              v50 = v49;
              if (!v49)
              {
                v75 = [MEMORY[0x1E4F1CA98] null];
                v50 = v75;
              }
              [v15 setObject:v50 forKeyedSubscript:@"departureAirport"];
              if (!v49) {

              }
              v51 = [v14 arrivalAirport];
              v52 = +[MSParsecSearchSessionInstantAnswers sfAirportToDictionnary:v51];
              v53 = v52;
              if (!v52)
              {
                v74 = [MEMORY[0x1E4F1CA98] null];
                v53 = v74;
              }
              [v15 setObject:v53 forKeyedSubscript:@"arrivalAirport"];
              if (!v52) {

              }
              v54 = [v14 divertedAirport];
              v55 = [a1 sfAirportToDictionnary:v54];
              v56 = v55;
              if (!v55)
              {
                v73 = [MEMORY[0x1E4F1CA98] null];
                v56 = v73;
              }
              [v15 setObject:v56 forKeyedSubscript:@"divertedAirport"];
              if (!v55) {

              }
              id v57 = v11;
              if (!v11)
              {
                v90 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", 0);
                id v57 = v90;
              }
              [v15 setObject:v57 forKeyedSubscript:@"carrierWebsite"];
              if (!v11) {

              }
              [v88 addObject:v15];
            }
            unint64_t v12 = v72;
            uint64_t v89 = [v72 countByEnumeratingWithState:&v91 objects:v99 count:16];
          }
          while (v89);
        }

        v58 = v88;
        if (!v88)
        {
          v68 = [MEMORY[0x1E4F1CA98] null];
          v58 = v68;
        }
        [v71 setObject:v58 forKeyedSubscript:@"legs"];
        if (!v88) {

        }
        [v67 addObject:v71];
        uint64_t v4 = v70 + 1;
      }
      while (v70 + 1 != v65);
      uint64_t v3 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
    }
    while (v3);
  }

  v59 = (void *)[v67 copy];
  return v59;
}

+ (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = v11;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  id v54 = 0;
  if (!v9)
  {
    v13 = +[MSParsecSearchSessionInstantAnswers log];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v25 = "[instant answers][flights api] Can't get flightInformation, airlineCode is nil";
LABEL_21:
    _os_log_impl(&dword_1BF36E000, v13, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    goto LABEL_22;
  }
  if (!v10)
  {
    v13 = +[MSParsecSearchSessionInstantAnswers log];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v25 = "[instant answers][flights api] Can't get flightInformation, flightNumber is nil";
    goto LABEL_21;
  }
  if (!v11)
  {
    v13 = +[MSParsecSearchSessionInstantAnswers log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "[instant answers][flights api] Can't get flightInformation, flightDate is nil";
      goto LABEL_21;
    }
LABEL_22:
    id v24 = 0;
    goto LABEL_34;
  }
  v13 = [NSString stringWithFormat:@"%@%@", v9, v10];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 bundleIdentifier];

    if (!v15)
    {
      v16 = +[MSParsecSearchSessionInstantAnswers log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BF36E000, v16, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] bundleIdentifier is undefined.", buf, 2u);
      }

      v15 = @"com.apple.undefined";
    }
    v37 = v15;
    v38 = [MEMORY[0x1E4F5CBB0] flightRequestForQuery:v13 date:v12 appBundleId:v15];
    if (!v38)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2, a1, @"MSParsecSearchSessionInstantAnswers.m", 164, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
    }
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.mail" userAgent:@"mail/1"];
    [v17 setParsecEnabled:1];
    [v17 setDontPreloadImages:1];
    v18 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:v17];
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    id v48 = 0;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    dispatch_time_t v20 = dispatch_time(0, 500000000);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __96__MSParsecSearchSessionInstantAnswers_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
    v39[3] = &unk_1E63FEC98;
    v41 = &v49;
    v42 = buf;
    v21 = v19;
    v40 = v21;
    v22 = [v18 taskWithRequest:v38 completion:v39];
    [v22 resume];
    if (dispatch_semaphore_wait(v21, v20))
    {
      v23 = +[MSParsecSearchSessionInstantAnswers log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 67109120;
        LODWORD(v59) = 500;
        _os_log_impl(&dword_1BF36E000, v23, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] coreparsec request timed out (timeout = %d ms)", v58, 8u);
      }

      id v24 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v27 = +[MSParsecSearchSessionInstantAnswers log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [(id)v50[5] count];
        *(_DWORD *)v58 = 134217984;
        uint64_t v59 = v28;
        _os_log_impl(&dword_1BF36E000, v27, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] coreparsec results count = %lu", v58, 0xCu);
      }

      if (![(id)v50[5] count])
      {
        v29 = (void *)*((void *)v44 + 5);
        if (v29)
        {
          v56[0] = @"error";
          v55[0] = @"type";
          v55[1] = @"errorCode";
          v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v29, "code"));
          v56[1] = v30;
          v55[2] = @"userInfo";
          v36 = [*((id *)v44 + 5) userInfo];
          v56[2] = v36;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
          id v57 = v31;
          uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          v33 = (void *)v50[5];
          v50[5] = v32;
        }
      }
      id v24 = (id)v50[5];
    }

    _Block_object_dispose(buf, 8);
    v26 = v37;
  }
  else
  {
    v26 = +[MSParsecSearchSessionInstantAnswers log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BF36E000, v26, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] Can't get flightInformation, query is malformed", buf, 2u);
    }
    id v24 = 0;
  }

LABEL_34:
  _Block_object_dispose(&v49, 8);

  return v24;
}

void __96__MSParsecSearchSessionInstantAnswers_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 flightResults];
  if (!v8)
  {
    id v9 = +[MSParsecSearchSessionInstantAnswers log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1BF36E000, v9, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] empty coreparsec response for flight", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v10 = +[MSParsecSearchSessionInstantAnswers sfFlightsToDictionary:v8];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    v13 = +[MSParsecSearchSessionInstantAnswers log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1BF36E000, v13, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] error when calling coreparsec : %@", (uint8_t *)&v14, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end