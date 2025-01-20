@interface FUUtils
+ (id)airportFromSFAirport:(id)a3;
+ (id)convertFlightModel:(id)a3 withError:(id *)a4;
+ (id)testDate;
+ (void)enumerateFlightCodesInString:(id)a3 usingBlock:(id)a4;
+ (void)extractTimeForFlightStep:(id)a3 fromLeg:(id)a4;
+ (void)setTestDate:(id)a3;
@end

@implementation FUUtils

+ (id)testDate
{
  return (id)_testDate;
}

+ (void)setTestDate:(id)a3
{
}

+ (void)enumerateFlightCodesInString:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t, unsigned char *))a4;
  uint64_t v19 = 0;
  uint64_t v7 = DDScannerCreate();
  if (v7)
  {
    v8 = (const void *)v7;
    char v18 = 0;
    if (DDScannerScanString())
    {
      CFArrayRef v9 = (const __CFArray *)DDScannerCopyResultsWithOptions();
      if (v9)
      {
        CFArrayRef v10 = v9;
        CFIndex Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          CFIndex v12 = Count;
          for (CFIndex i = 0; i < v12; ++i)
          {
            CFArrayGetValueAtIndex(v10, i);
            if (DDResultHasType())
            {
              uint64_t SubresultWithType = DDResultGetSubresultWithType();
              uint64_t v15 = DDResultGetSubresultWithType();
              if (SubresultWithType)
              {
                if (v15)
                {
                  uint64_t Value = DDResultGetValue();
                  uint64_t v17 = [(id)DDResultGetValue() integerValue];
                  v6[2](v6, Value, v17, &v18);
                  if (v18) {
                    break;
                  }
                }
              }
            }
          }
        }
        CFRelease(v10);
      }
    }
    CFRelease(v8);
  }
}

+ (id)airportFromSFAirport:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FUAirport);
  id v5 = [v3 location];
  [v5 lat];
  CLLocationDegrees v7 = v6;
  v8 = [v3 location];
  [v8 lng];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);
  -[FUAirport setLocation:](v4, "setLocation:", v10.latitude, v10.longitude);

  v11 = [v3 code];
  [(FUAirport *)v4 setIATACode:v11];

  CFIndex v12 = [v3 name];
  [(FUAirport *)v4 setName:v12];

  v13 = [v3 city];
  [(FUAirport *)v4 setCity:v13];

  v14 = [v3 timezone];

  [(FUAirport *)v4 setTimeZone:v14];
  return v4;
}

+ (void)extractTimeForFlightStep:(id)a3 fromLeg:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  if ([v18 departure])
  {
    double v6 = [v5 departurePublishedTime];
    CLLocationDegrees v7 = [v5 departureActualTime];
    v8 = [v5 departureGateClosedTime];
    [v5 departureRunwayTime];
  }
  else
  {
    double v6 = [v5 arrivalPublishedTime];
    CLLocationDegrees v7 = [v5 arrivalActualTime];
    v8 = [v5 arrivalGateTime];
    [v5 arrivalRunwayTime];
  CLLocationDegrees v9 = };

  [v6 timeIntervalSince1970];
  if (v10 <= 0.0)
  {

    double v6 = 0;
  }
  [v7 timeIntervalSince1970];
  if (v11 <= 0.0)
  {

    CLLocationDegrees v7 = 0;
  }
  [v8 timeIntervalSince1970];
  if (v12 <= 0.0)
  {

    v8 = 0;
  }
  [v9 timeIntervalSince1970];
  if (v13 <= 0.0)
  {

    CLLocationDegrees v9 = 0;
  }
  if (v6)
  {
    v14 = [[FUStepTime alloc] initWithType:1 date:v6];
    [v18 setScheduledTime:v14];
  }
  if (v7)
  {
    uint64_t v15 = [[FUStepTime alloc] initWithType:1 date:v7];
    [v18 setEstimatedTime:v15];
  }
  if (v8)
  {
    v16 = [[FUStepTime alloc] initWithType:1 date:v8];
    [v18 setActualTime:v16];
  }
  if (v9)
  {
    uint64_t v17 = [[FUStepTime alloc] initWithType:2 date:v9];
    [v18 setRunwayTime:v17];
  }
  [v18 setPlannedTime:0];
}

+ (id)convertFlightModel:(id)a3 withError:(id *)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v64 = (id)objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v4;
  uint64_t v65 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v82;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v82 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = v5;
        double v6 = *(void **)(*((void *)&v81 + 1) + 8 * v5);
        id v70 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v66 = v6;
        id v68 = [v6 legs];
        uint64_t v71 = [v68 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v71)
        {
          uint64_t v69 = *(void *)v78;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v78 != v69) {
                objc_enumerationMutation(v68);
              }
              v8 = *(void **)(*((void *)&v77 + 1) + 8 * v7);
              CLLocationDegrees v9 = objc_alloc_init(FUFlightLeg);
              uint64_t v10 = 0;
              int v11 = 0;
              int v12 = [v8 status] - 1;
              v74 = v9;
              uint64_t v75 = v7;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              uint64_t v17 = 0;
              switch(v12)
              {
                case 0:
                  int v11 = 0;
                  int v13 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v14 = 1;
                  uint64_t v10 = 2;
                  uint64_t v17 = 2;
                  break;
                case 1:
                  int v11 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  uint64_t v10 = 6;
                  uint64_t v17 = 6;
                  break;
                case 2:
                  int v11 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 1;
                  uint64_t v10 = 3;
                  uint64_t v17 = 5;
                  break;
                case 4:
                  int v11 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v13 = 1;
                  uint64_t v10 = 4;
                  uint64_t v17 = 4;
                  break;
                case 6:
                  int v11 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v16 = 0;
                  int v15 = 1;
                  uint64_t v10 = 3;
                  uint64_t v17 = 3;
                  break;
                case 7:
                case 8:
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v11 = 1;
                  uint64_t v10 = 1;
                  uint64_t v17 = 1;
                  break;
                default:
                  break;
              }
              int v72 = v16;
              id v18 = objc_alloc_init(FUFlightStep);
              [(FUFlightStep *)v18 setDeparture:1];
              [a1 extractTimeForFlightStep:v18 fromLeg:v8];
              uint64_t v19 = objc_alloc_init(FUFlightStep);
              [(FUFlightStep *)v19 setDeparture:0];
              [a1 extractTimeForFlightStep:v19 fromLeg:v8];
              v20 = [(FUFlightStep *)v18 time];
              [v20 timeIntervalSinceNow];
              double v22 = v21;

              v23 = [(FUFlightStep *)v19 time];
              [v23 timeIntervalSinceNow];
              double v25 = v24;

              if (v25 >= 0.0)
              {
                if (v22 <= 0.0)
                {
                  uint64_t v28 = 2;
                  if (!(v11 | v13)) {
                    uint64_t v28 = v10;
                  }
                  if (v25 < 0.0) {
                    uint64_t v28 = v17;
                  }
                  if (v22 <= 0.0) {
                    uint64_t v27 = v28;
                  }
                  else {
                    uint64_t v27 = v17;
                  }
                }
                else if (v13 | v14 | v15 | v72)
                {
                  uint64_t v27 = 1;
                }
                else
                {
                  uint64_t v27 = v17;
                }
              }
              else
              {
                uint64_t v26 = 5;
                if (!v15) {
                  uint64_t v26 = v17;
                }
                if (v11 | v14) {
                  uint64_t v27 = 4;
                }
                else {
                  uint64_t v27 = v26;
                }
              }
              [(FUFlightLeg *)v74 setStatus:v27];
              [(FUFlightStep *)v18 setLegStatus:v27];
              [(FUFlightStep *)v19 setLegStatus:v27];
              v29 = [v8 departureGate];
              [(FUFlightStep *)v18 setGate:v29];

              v30 = [v8 departureTerminal];
              [(FUFlightStep *)v18 setTerminal:v30];

              v31 = [v8 departureAirport];
              v32 = [a1 airportFromSFAirport:v31];
              [(FUFlightStep *)v18 setAirport:v32];

              [(FUFlightLeg *)v74 setDeparture:v18];
              v33 = [v8 arrivalGate];
              [(FUFlightStep *)v19 setGate:v33];

              v34 = [v8 arrivalTerminal];
              [(FUFlightStep *)v19 setTerminal:v34];

              if (v27 == 5 || v27 == 3)
              {
                v35 = [v8 divertedAirport];
                BOOL v36 = v35 != 0;
              }
              else
              {
                BOOL v36 = 0;
                v35 = v73;
              }
              if (v27 == 5 || v27 == 3) {

              }
              v73 = v35;
              if (v36) {
                [v8 divertedAirport];
              }
              else {
              v37 = [v8 arrivalAirport];
              }
              v38 = [a1 airportFromSFAirport:v37];
              [(FUFlightStep *)v19 setAirport:v38];

              [(FUFlightLeg *)v74 setArrival:v19];
              uint64_t v39 = [(FUFlightStep *)v19 scheduledTime];
              if (v39)
              {
                v40 = (void *)v39;
                v41 = [(FUFlightStep *)v18 scheduledTime];

                if (v41)
                {
                  v42 = [(FUFlightStep *)v19 scheduledTime];
                  v43 = [v42 date];
                  v44 = [(FUFlightStep *)v18 scheduledTime];
LABEL_51:
                  v48 = v44;
                  v49 = [v44 date];
                  [v43 timeIntervalSinceDate:v49];
                  -[FUFlightLeg setDuration:](v74, "setDuration:");

                  goto LABEL_52;
                }
              }
              uint64_t v45 = [(FUFlightStep *)v19 actualTime];
              if (v45)
              {
                v46 = (void *)v45;
                v47 = [(FUFlightStep *)v18 actualTime];

                if (v47)
                {
                  v42 = [(FUFlightStep *)v19 actualTime];
                  v43 = [v42 date];
                  v44 = [(FUFlightStep *)v18 actualTime];
                  goto LABEL_51;
                }
              }
LABEL_52:
              v50 = [v8 baggageClaim];
              [(FUFlightLeg *)v74 setBaggageClaim:v50];

              [v70 addObject:v74];
              uint64_t v7 = v75 + 1;
            }
            while (v71 != v75 + 1);
            uint64_t v71 = [v68 countByEnumeratingWithState:&v77 objects:v85 count:16];
          }
          while (v71);
        }

        v51 = objc_alloc_init(FUFlight);
        [(FUFlight *)v51 setAllLegs:v70];
        v52 = [v66 flightNumber];
        -[FUFlight setFlightNumber:](v51, "setFlightNumber:", [v52 integerValue]);

        [(FUFlight *)v51 setDisplayFlightNumber:[(FUFlight *)v51 flightNumber]];
        v53 = [v66 flightID];
        [(FUFlight *)v51 setFlightIdentifier:v53];

        v54 = [v66 carrierCode];
        if (v54)
        {
          v55 = objc_alloc_init(FUAirline);
          v56 = [v66 carrierCode];
          [(FUAirline *)v55 setIATACode:v56];

          v57 = [v66 carrierName];
          [(FUAirline *)v55 setName:v57];

          [(FUFlight *)v51 setAirline:v55];
          v58 = [(FUFlight *)v51 airline];
          [(FUFlight *)v51 setDisplayAirline:v58];

          v59 = [(FUFlight *)v51 displayAirline];
          v60 = [v59 IATACode];
          [(FUFlight *)v51 setQueriedAirlineTitle:v60];
        }
        [v64 addObject:v51];

        uint64_t v5 = v67 + 1;
      }
      while (v67 + 1 != v65);
      uint64_t v65 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v65);
  }

  return v64;
}

@end