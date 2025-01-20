@interface INBusReservation(schema)
+ (id)fromSchema:()schema;
+ (id)schemaFromBusReservation:()schema;
- (uint64_t)schema;
@end

@implementation INBusReservation(schema)

- (uint64_t)schema
{
  return [MEMORY[0x1E4F30308] schemaFromBusReservation:a1];
}

+ (id)schemaFromBusReservation:()schema
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F30638] schemaFromReservation:v3];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:@"http://schema.org/BusReservation" forKeyedSubscript:@"@type"];
  v6 = objc_opt_new();
  [v6 setObject:@"http://schema.org/BusTrip" forKeyedSubscript:@"@type"];
  v7 = [v3 busTrip];
  v8 = [v7 tripDuration];
  v9 = [v8 startDateComponents];

  if (v9)
  {
    v10 = [v3 busTrip];
    v11 = [v10 tripDuration];
    v12 = [v11 startDateComponents];
    v13 = [v12 schema];
    [v6 setObject:v13 forKeyedSubscript:@"departureTime"];
  }
  v14 = [v3 busTrip];
  v15 = [v14 tripDuration];
  v16 = [v15 endDateComponents];

  if (v16)
  {
    v17 = [v3 busTrip];
    v18 = [v17 tripDuration];
    v19 = [v18 endDateComponents];
    v20 = [v19 schema];
    [v6 setObject:v20 forKeyedSubscript:@"arrivalTime"];
  }
  v21 = [v3 busTrip];
  v22 = [v21 busName];

  if (v22)
  {
    v23 = [v3 busTrip];
    v24 = [v23 busName];
    [v6 setObject:v24 forKeyedSubscript:@"busName"];
  }
  v25 = [v3 busTrip];
  v26 = [v25 busNumber];

  if (v26)
  {
    v27 = [v3 busTrip];
    v28 = [v27 busNumber];
    [v6 setObject:v28 forKeyedSubscript:@"busNumber"];
  }
  v29 = objc_opt_new();
  [v29 setObject:@"http://schema.org/BusStation" forKeyedSubscript:@"@type"];
  v30 = [v3 busTrip];
  v31 = [v30 departureBusStopLocation];
  v32 = [v31 name];

  if (v32)
  {
    v33 = [v3 busTrip];
    v34 = [v33 departureBusStopLocation];
    v35 = [v34 name];
    [v29 setObject:v35 forKeyedSubscript:@"name"];
  }
  v36 = [v3 busTrip];
  v37 = [v36 departureBusStopLocation];
  v38 = [v37 postalAddress];

  if (v38)
  {
    v39 = [v3 busTrip];
    v40 = [v39 departureBusStopLocation];
    v41 = [v40 postalAddress];
    v42 = [v41 schema];
    [v29 setObject:v42 forKeyedSubscript:@"address"];
  }
  if ((unint64_t)[v29 count] >= 2) {
    [v6 setObject:v29 forKeyedSubscript:@"departureBusStop"];
  }
  v43 = [v3 busTrip];
  v44 = [v43 departurePlatform];

  if (v44)
  {
    v45 = [v3 busTrip];
    v46 = [v45 departurePlatform];
    [v6 setObject:v46 forKeyedSubscript:@"departurePlatform"];
  }
  v47 = objc_opt_new();
  [v47 setObject:@"http://schema.org/BusStation" forKeyedSubscript:@"@type"];
  v48 = [v3 busTrip];
  v49 = [v48 arrivalBusStopLocation];
  v50 = [v49 name];

  if (v50)
  {
    v51 = [v3 busTrip];
    v52 = [v51 arrivalBusStopLocation];
    v53 = [v52 name];
    [v47 setObject:v53 forKeyedSubscript:@"name"];
  }
  v54 = [v3 busTrip];
  v55 = [v54 arrivalBusStopLocation];
  v56 = [v55 postalAddress];

  if (v56)
  {
    v57 = [v3 busTrip];
    v58 = [v57 arrivalBusStopLocation];
    v59 = [v58 postalAddress];
    v60 = [v59 schema];
    [v47 setObject:v60 forKeyedSubscript:@"address"];
  }
  if ((unint64_t)[v47 count] >= 2) {
    [v6 setObject:v47 forKeyedSubscript:@"arrivalBusStop"];
  }
  v61 = [v3 busTrip];
  v62 = [v61 arrivalPlatform];

  if (v62)
  {
    v63 = [v3 busTrip];
    v64 = [v63 arrivalPlatform];
    [v6 setObject:v64 forKeyedSubscript:@"arrivalPlatform"];
  }
  v65 = [v3 busTrip];
  v66 = [v65 provider];

  if (v66)
  {
    v71[0] = @"@type";
    v71[1] = @"name";
    v72[0] = @"http://schema.org/Organization";
    v67 = [v3 busTrip];
    v68 = [v67 provider];
    v72[1] = v68;
    v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
    [v6 setObject:v69 forKeyedSubscript:@"provider"];
  }
  if ((unint64_t)[v6 count] >= 2) {
    [v5 setObject:v6 forKeyedSubscript:@"reservationFor"];
  }

  return v5;
}

+ (id)fromSchema:()schema
{
  id v3 = (void *)MEMORY[0x1E4F30638];
  id v4 = a3;
  v33 = [v3 reservationNumberFromReservationSchema:v4];
  v32 = [MEMORY[0x1E4F30638] bookingTimeFromReservationSchema:v4];
  uint64_t v31 = [MEMORY[0x1E4F30638] reservationStatusFromReservationSchema:v4];
  v30 = [MEMORY[0x1E4F30638] reservationHolderNameFromReservationSchema:v4];
  v5 = [v4 objectForKeyedSubscript:@"reservationFor"];
  v6 = [v5 objectForKeyedSubscript:@"provider"];
  v34 = [v6 objectForKeyedSubscript:@"name"];

  v29 = [MEMORY[0x1E4F30638] urlFromReservationSchema:v4];

  id v7 = objc_alloc(MEMORY[0x1E4F30310]);
  v25 = [v5 objectForKeyedSubscript:@"busName"];
  v24 = [v5 objectForKeyedSubscript:@"busNumber"];
  v8 = (void *)MEMORY[0x1E4F303D8];
  v28 = [v5 objectForKeyedSubscript:@"departureTime"];
  v26 = [v5 objectForKeyedSubscript:@"arrivalTime"];
  v9 = [v8 fromStartDate:v28 endDate:v26];
  v10 = (void *)MEMORY[0x1E4F1E630];
  v11 = [v5 objectForKeyedSubscript:@"departureBusStop"];
  v12 = [v10 fromSchema:v11];
  v13 = [v5 objectForKeyedSubscript:@"departurePlatform"];
  v14 = (void *)MEMORY[0x1E4F1E630];
  v15 = [v5 objectForKeyedSubscript:@"arrivalBusStop"];
  v16 = [v14 fromSchema:v15];
  v17 = [v5 objectForKeyedSubscript:@"arrivalPlatform"];
  v27 = (void *)[v7 initWithProvider:v34 busName:v25 busNumber:v24 tripDuration:v9 departureBusStopLocation:v12 departurePlatform:v13 arrivalBusStopLocation:v16 arrivalPlatform:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F30750]);
  v19 = objc_opt_new();
  v20 = [v19 UUIDString];
  v21 = (void *)[v18 initWithVocabularyIdentifier:v20 spokenPhrase:@"Bus Trip" pronunciationHint:0];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F30308]) initWithItemReference:v21 reservationNumber:v33 bookingTime:v32 reservationStatus:v31 reservationHolderName:v30 actions:0 URL:v29 reservedSeat:0 busTrip:v27];
  return v22;
}

@end