@interface GEOQuickETARequest(MKDirections)
- (id)initWithDirectionsRequest:()MKDirections origin:destination:automobileOptions:;
@end

@implementation GEOQuickETARequest(MKDirections)

- (id)initWithDirectionsRequest:()MKDirections origin:destination:automobileOptions:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v57.receiver = a1;
  v57.super_class = (Class)&off_1EDA2C138;
  id v14 = objc_msgSendSuper2(&v57, sel_init);
  if (v14)
  {
    v15 = v14;
    uint64_t v16 = [v10 _arrivalDate];
    uint64_t v17 = [v10 _departureDate];
    if (v16 | v17)
    {
      uint64_t v18 = v17;
      if (!v16 || !v17)
      {
LABEL_9:
        uint64_t v20 = [v10 transportType];
        v21 = [MEMORY[0x1E4F1CA48] array];
        if (v20 == 0xFFFFFFF)
        {
          unint64_t v22 = GEOGetUserTransportTypePreference();
          if (v22 < 5) {
            [v21 addObject:qword_1E54BE9E8[v22]];
          }
        }
        else if ((v20 & 1) == 0)
        {
          goto LABEL_15;
        }
        if (([v21 containsObject:&unk_1ED97EE80] & 1) == 0) {
          [v21 addObject:&unk_1ED97EE80];
        }
LABEL_15:
        if ((v20 & 2) != 0 && ([v21 containsObject:&unk_1ED97EE50] & 1) == 0) {
          [v21 addObject:&unk_1ED97EE50];
        }
        if ((v20 & 4) != 0 && ([v21 containsObject:&unk_1ED97EE68] & 1) == 0) {
          [v21 addObject:&unk_1ED97EE68];
        }
        if ((v20 & 8) != 0 && ([v21 containsObject:&unk_1ED97EE38] & 1) == 0) {
          [v21 addObject:&unk_1ED97EE38];
        }
        if (![v21 count]) {
          [v21 addObject:&unk_1ED97EE80];
        }
        v23 = (void *)[v21 mutableCopy];

        v24 = [v23 firstObject];
        uint64_t v50 = [v24 integerValue];

        if ([v23 count]) {
          [v23 removeObjectAtIndex:0];
        }
        v25 = +[MKLocationManager sharedLocationManager];
        v52 = v25;
        v53 = v23;
        if ([v25 hasLocation] && (objc_msgSend(v25, "isLastLocationStale") & 1) == 0)
        {
          v55 = [v25 currentLocation];
        }
        else
        {
          v55 = 0;
        }
        v26 = [v10 _automobileOptions];

        v27 = [v10 _automobileOptions];
        v28 = v27;
        if (v13 && v26)
        {
          v29 = (void *)[v27 copy];

          id v56 = v29;
          [v29 mergeFrom:v13];
        }
        else
        {
          if (v27) {
            v30 = v27;
          }
          else {
            v30 = v13;
          }
          id v56 = v30;
        }
        uint64_t v31 = [v10 _includeDistanceInETA];
        uint64_t v32 = [v10 _additionalTransportTypesRequested];
        v33 = (void *)v32;
        id v51 = v13;
        if (v16)
        {
          v49 = (void *)v18;
          uint64_t v34 = v31;
          v35 = (void *)v16;
          if (v32)
          {
            v54 = [v10 _additionalTransportTypesRequested];
          }
          else
          {
            v54 = v53;
          }
          v39 = [v10 _transitOptions];
          v40 = [v10 _walkingOptions];
          v41 = [v10 _cyclingOptions];
          v42 = v15;
          v43 = v35;
          v44 = (void *)[v42 initWithSource:v11 toDestination:v12 arrivalDate:v35 transportType:v50 currentLocation:v55 includeDistance:v34 additionalTransportTypesRequested:v54 automobileOptions:v56 transitOptions:v39 walkingOptions:v40 cyclingOptions:v41];

          id v13 = v51;
          v36 = v49;
          if (!v33) {
            goto LABEL_47;
          }
        }
        else
        {
          v36 = (void *)v18;
          id v37 = v12;
          id v38 = v11;
          if (v32)
          {
            v54 = [v10 _additionalTransportTypesRequested];
          }
          else
          {
            v54 = v53;
          }
          v46 = [v10 _transitOptions];
          v47 = [v10 _walkingOptions];
          v48 = [v10 _cyclingOptions];
          v44 = (void *)[v15 initWithSource:v38 toDestination:v37 departureDate:v36 transportType:v50 currentLocation:v55 includeDistance:v31 additionalTransportTypesRequested:v54 automobileOptions:v56 transitOptions:v46 walkingOptions:v47 cyclingOptions:v48];

          id v12 = v37;
          id v11 = v38;
          id v13 = v51;
          v43 = 0;
          if (!v33) {
            goto LABEL_47;
          }
        }

LABEL_47:
        id v19 = v44;

        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  id v19 = 0;
LABEL_48:

  return v19;
}

@end