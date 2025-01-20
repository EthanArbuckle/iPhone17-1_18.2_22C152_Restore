@interface INBoatReservation(schema)
+ (id)fromSchema:()schema;
+ (id)schemaFromBoatReservation:()schema;
- (uint64_t)schema;
@end

@implementation INBoatReservation(schema)

- (uint64_t)schema
{
  return [MEMORY[0x1E4F302E8] schemaFromBoatReservation:a1];
}

+ (id)schemaFromBoatReservation:()schema
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F30638] schemaFromReservation:v3];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:@"http://schema.org/BoatReservation" forKeyedSubscript:@"@type"];
  v6 = objc_opt_new();
  [v6 setObject:@"http://schema.org/BoatTrip" forKeyedSubscript:@"@type"];
  v7 = [v3 boatTrip];
  v8 = [v7 tripDuration];
  v9 = [v8 startDateComponents];

  if (v9)
  {
    v10 = [v3 boatTrip];
    v11 = [v10 tripDuration];
    v12 = [v11 startDateComponents];
    v13 = [v12 schema];
    [v6 setObject:v13 forKeyedSubscript:@"departureTime"];
  }
  v14 = [v3 boatTrip];
  v15 = [v14 tripDuration];
  v16 = [v15 endDateComponents];

  if (v16)
  {
    v17 = [v3 boatTrip];
    v18 = [v17 tripDuration];
    v19 = [v18 endDateComponents];
    v20 = [v19 schema];
    [v6 setObject:v20 forKeyedSubscript:@"arrivalTime"];
  }
  v21 = [v3 boatTrip];
  v22 = [v21 boatName];

  if (v22)
  {
    v23 = [v3 boatTrip];
    v24 = [v23 boatName];
    [v6 setObject:v24 forKeyedSubscript:@"name"];
  }
  v25 = [v3 boatTrip];
  v26 = [v25 boatNumber];

  if (v26)
  {
    v27 = [v3 boatTrip];
    v28 = [v27 boatNumber];
    [v6 setObject:v28 forKeyedSubscript:@"identifier"];
  }
  v29 = objc_opt_new();
  [v29 setObject:@"http://schema.org/BoatTerminal" forKeyedSubscript:@"@type"];
  v30 = [v3 boatTrip];
  v31 = [v30 departureBoatTerminalLocation];
  v32 = [v31 name];

  if (v32)
  {
    v33 = [v3 boatTrip];
    v34 = [v33 departureBoatTerminalLocation];
    v35 = [v34 name];
    [v29 setObject:v35 forKeyedSubscript:@"name"];
  }
  v36 = [v3 boatTrip];
  v37 = [v36 departureBoatTerminalLocation];
  v38 = [v37 postalAddress];

  if (v38)
  {
    v39 = [v3 boatTrip];
    v40 = [v39 departureBoatTerminalLocation];
    v41 = [v40 postalAddress];
    v42 = [v41 schema];
    [v29 setObject:v42 forKeyedSubscript:@"address"];
  }
  if ((unint64_t)[v29 count] >= 2) {
    [v6 setObject:v29 forKeyedSubscript:@"departureBoatTerminal"];
  }
  v43 = objc_opt_new();
  [v43 setObject:@"http://schema.org/BoatTerminal" forKeyedSubscript:@"@type"];
  v44 = [v3 boatTrip];
  v45 = [v44 arrivalBoatTerminalLocation];
  v46 = [v45 name];

  if (v46)
  {
    v47 = [v3 boatTrip];
    v48 = [v47 arrivalBoatTerminalLocation];
    v49 = [v48 name];
    [v43 setObject:v49 forKeyedSubscript:@"name"];
  }
  v50 = [v3 boatTrip];
  v51 = [v50 arrivalBoatTerminalLocation];
  v52 = [v51 postalAddress];

  if (v52)
  {
    v53 = [v3 boatTrip];
    v54 = [v53 arrivalBoatTerminalLocation];
    v55 = [v54 postalAddress];
    v56 = [v55 schema];
    [v43 setObject:v56 forKeyedSubscript:@"address"];
  }
  if ((unint64_t)[v43 count] >= 2) {
    [v6 setObject:v43 forKeyedSubscript:@"arrivalBoatTerminal"];
  }
  v57 = [v3 boatTrip];
  v58 = [v57 provider];

  if (v58)
  {
    v63[0] = @"@type";
    v63[1] = @"name";
    v64[0] = @"http://schema.org/Organization";
    v59 = [v3 boatTrip];
    v60 = [v59 provider];
    v64[1] = v60;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    [v6 setObject:v61 forKeyedSubscript:@"provider"];
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
  v32 = [v3 reservationNumberFromReservationSchema:v4];
  v31 = [MEMORY[0x1E4F30638] bookingTimeFromReservationSchema:v4];
  uint64_t v30 = [MEMORY[0x1E4F30638] reservationStatusFromReservationSchema:v4];
  v29 = [MEMORY[0x1E4F30638] reservationHolderNameFromReservationSchema:v4];
  v5 = [v4 objectForKeyedSubscript:@"reservationFor"];
  v6 = [v5 objectForKeyedSubscript:@"provider"];
  v27 = [v6 objectForKeyedSubscript:@"name"];

  v28 = [MEMORY[0x1E4F30638] urlFromReservationSchema:v4];

  id v25 = objc_alloc(MEMORY[0x1E4F302F0]);
  v7 = [v5 objectForKeyedSubscript:@"name"];
  v24 = [v5 objectForKeyedSubscript:@"identifier"];
  v8 = (void *)MEMORY[0x1E4F303D8];
  v9 = [v5 objectForKeyedSubscript:@"departureTime"];
  v10 = [v5 objectForKeyedSubscript:@"arrivalTime"];
  v11 = [v8 fromStartDate:v9 endDate:v10];
  v12 = (void *)MEMORY[0x1E4F1E630];
  v13 = [v5 objectForKeyedSubscript:@"departureBoatTerminal"];
  v14 = [v12 fromSchema:v13];
  v15 = (void *)MEMORY[0x1E4F1E630];
  v16 = [v5 objectForKeyedSubscript:@"arrivalBoatTerminal"];
  v17 = [v15 fromSchema:v16];
  v26 = (void *)[v25 initWithProvider:v27 boatName:v7 boatNumber:v24 tripDuration:v11 departureBoatTerminalLocation:v14 arrivalBoatTerminalLocation:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F30750]);
  v19 = objc_opt_new();
  v20 = [v19 UUIDString];
  v21 = (void *)[v18 initWithVocabularyIdentifier:v20 spokenPhrase:@"Boat Trip" pronunciationHint:0];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F302E8]) initWithItemReference:v21 reservationNumber:v32 bookingTime:v31 reservationStatus:v30 reservationHolderName:v29 actions:0 URL:v28 reservedSeat:0 boatTrip:v26];
  return v22;
}

@end