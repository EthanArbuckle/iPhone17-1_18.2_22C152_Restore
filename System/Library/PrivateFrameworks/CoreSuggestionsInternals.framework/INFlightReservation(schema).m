@interface INFlightReservation(schema)
+ (id)airlineFromFlightSchema:()schema;
+ (id)airportFromAirportSchema:()schema;
+ (id)arrivalAirporGateFromFlightSchema:()schema;
+ (id)departureAirportGateFromFlightSchema:()schema;
+ (id)flightFromReservationSchema:()schema;
+ (id)fromSchema:()schema;
+ (id)schemaFromAirline:()schema;
+ (id)schemaFromAirport:()schema;
+ (id)schemaFromFlight:()schema;
+ (id)schemaFromFlightReservation:()schema;
+ (uint64_t)flightNumberFromFlightSchema:()schema;
- (uint64_t)schema;
@end

@implementation INFlightReservation(schema)

- (uint64_t)schema
{
  return [MEMORY[0x1E4F30430] schemaFromFlightReservation:a1];
}

+ (id)schemaFromFlight:()schema
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:@"http://schema.org/Flight" forKeyedSubscript:@"@type"];
  v5 = [v3 airline];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F30430];
    v7 = [v3 airline];
    v8 = [v6 schemaFromAirline:v7];
    [v4 setObject:v8 forKeyedSubscript:@"airline"];
  }
  v9 = [v3 flightNumber];

  if (v9)
  {
    v10 = [v3 flightNumber];
    [v4 setObject:v10 forKeyedSubscript:@"flightNumber"];
  }
  v11 = [v3 boardingTime];
  v12 = [v11 startDateComponents];

  if (v12)
  {
    v13 = [v3 boardingTime];
    v14 = [v13 startDateComponents];
    v15 = [v14 schema];
    [v4 setObject:v15 forKeyedSubscript:@"boardingTime"];
  }
  v16 = [v3 flightDuration];

  if (v16)
  {
    v17 = [v3 flightDuration];
    v18 = [v17 startDateComponents];

    if (v18)
    {
      v19 = [v3 flightDuration];
      v20 = [v19 startDateComponents];
      v21 = [v20 schema];
      [v4 setObject:v21 forKeyedSubscript:@"departureTime"];
    }
    v22 = [v3 flightDuration];
    v23 = [v22 endDateComponents];

    if (v23)
    {
      v24 = [v3 flightDuration];
      v25 = [v24 endDateComponents];
      v26 = [v25 schema];
      [v4 setObject:v26 forKeyedSubscript:@"arrivalTime"];
    }
  }
  v27 = [v3 departureAirportGate];
  v28 = v27;
  if (v27)
  {
    v29 = [v27 airport];

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E4F30430];
      v31 = [v28 airport];
      v32 = [v30 schemaFromAirport:v31];
      [v4 setObject:v32 forKeyedSubscript:@"departureAirport"];
    }
    v33 = [v28 terminal];

    if (v33)
    {
      v34 = [v28 terminal];
      [v4 setObject:v34 forKeyedSubscript:@"departureTerminal"];
    }
    v35 = [v28 gate];

    if (v35)
    {
      v36 = [v28 gate];
      [v4 setObject:v36 forKeyedSubscript:@"departureGate"];
    }
  }
  v37 = [v3 arrivalAirportGate];
  v38 = v37;
  if (v37)
  {
    v39 = [v37 airport];

    if (v39)
    {
      v40 = (void *)MEMORY[0x1E4F30430];
      v41 = [v38 airport];
      v42 = [v40 schemaFromAirport:v41];
      [v4 setObject:v42 forKeyedSubscript:@"arrivalAirport"];
    }
    v43 = [v38 terminal];

    if (v43)
    {
      v44 = [v38 terminal];
      [v4 setObject:v44 forKeyedSubscript:@"arrivalTerminal"];
    }
    v45 = [v38 gate];

    if (v45)
    {
      v46 = [v38 gate];
      [v4 setObject:v46 forKeyedSubscript:@"arrivalGate"];
    }
  }

  return v4;
}

+ (id)schemaFromAirport:()schema
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:@"http://schema.org/Airport" forKeyedSubscript:@"@type"];
  v5 = [v3 name];

  if (v5)
  {
    v6 = [v3 name];
    [v4 setObject:v6 forKeyedSubscript:@"name"];
  }
  v7 = [v3 iataCode];

  if (v7)
  {
    v8 = [v3 iataCode];
    [v4 setObject:v8 forKeyedSubscript:@"iataCode"];
  }
  v9 = [v3 icaoCode];

  if (v9)
  {
    v10 = [v3 icaoCode];
    [v4 setObject:v10 forKeyedSubscript:@"icaoCode"];
  }
  return v4;
}

+ (id)schemaFromAirline:()schema
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:@"http://schema.org/Airline" forKeyedSubscript:@"@type"];
  v5 = [v3 name];

  if (v5)
  {
    v6 = [v3 name];
    [v4 setObject:v6 forKeyedSubscript:@"name"];
  }
  v7 = [v3 iataCode];

  if (v7)
  {
    v8 = [v3 iataCode];
    [v4 setObject:v8 forKeyedSubscript:@"iataCode"];
  }
  v9 = [v3 icaoCode];

  if (v9)
  {
    v10 = [v3 icaoCode];
    [v4 setObject:v10 forKeyedSubscript:@"icaoCode"];
  }
  return v4;
}

+ (id)schemaFromFlightReservation:()schema
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F30638] schemaFromReservation:v3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [v3 reservedSeat];

  if (v6)
  {
    v7 = [v3 reservedSeat];
    v8 = [v7 schema];

    if (v8)
    {
      v14[0] = @"@type";
      v14[1] = @"ticketedSeat";
      v15[0] = @"http://schema.org/Ticket";
      v15[1] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [v5 setObject:v9 forKeyedSubscript:@"reservedTicket"];
    }
  }
  [v5 setObject:@"http://schema.org/FlightReservation" forKeyedSubscript:@"@type"];
  v10 = (void *)MEMORY[0x1E4F30430];
  v11 = [v3 flight];
  v12 = [v10 schemaFromFlight:v11];
  [v5 setObject:v12 forKeyedSubscript:@"reservationFor"];

  return v5;
}

+ (id)flightFromReservationSchema:()schema
{
  id v3 = [a3 objectForKeyedSubscript:@"reservationFor"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F30430] airlineFromFlightSchema:v3];
    v5 = [MEMORY[0x1E4F30430] flightNumberFromFlightSchema:v3];
    v6 = (void *)MEMORY[0x1E4F303D8];
    v7 = [v3 objectForKeyedSubscript:@"boardingTime"];
    v8 = [v6 fromStartDate:v7];

    v9 = (void *)MEMORY[0x1E4F303D8];
    v10 = [v3 objectForKeyedSubscript:@"departureTime"];
    v11 = [v3 objectForKeyedSubscript:@"arrivalTime"];
    v12 = [v9 fromStartDate:v10 endDate:v11];

    v13 = [MEMORY[0x1E4F30430] departureAirportGateFromFlightSchema:v3];
    v14 = [MEMORY[0x1E4F30430] arrivalAirporGateFromFlightSchema:v3];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F30428]) initWithAirline:v4 flightNumber:v5 boardingTime:v8 flightDuration:v12 departureAirportGate:v13 arrivalAirportGate:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)arrivalAirporGateFromFlightSchema:()schema
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"arrivalAirport"];
  v5 = [MEMORY[0x1E4F30430] airportFromAirportSchema:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F302A0]);
  v7 = [v3 objectForKeyedSubscript:@"arrivalTerminal"];
  v8 = [v3 objectForKeyedSubscript:@"arrivalGate"];

  v9 = (void *)[v6 initWithAirport:v5 terminal:v7 gate:v8];
  return v9;
}

+ (id)departureAirportGateFromFlightSchema:()schema
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"departureAirport"];
  v5 = [MEMORY[0x1E4F30430] airportFromAirportSchema:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F302A0]);
  v7 = [v3 objectForKeyedSubscript:@"departureTerminal"];
  v8 = [v3 objectForKeyedSubscript:@"departureGate"];

  v9 = (void *)[v6 initWithAirport:v5 terminal:v7 gate:v8];
  return v9;
}

+ (id)airportFromAirportSchema:()schema
{
  id v3 = (objc_class *)MEMORY[0x1E4F30298];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 objectForKeyedSubscript:@"name"];
  v7 = [v4 objectForKeyedSubscript:@"iataCode"];
  v8 = [v4 objectForKeyedSubscript:@"icaoCode"];

  v9 = (void *)[v5 initWithName:v6 iataCode:v7 icaoCode:v8];
  return v9;
}

+ (uint64_t)flightNumberFromFlightSchema:()schema
{
  return [a3 objectForKeyedSubscript:@"flightNumber"];
}

+ (id)airlineFromFlightSchema:()schema
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"airline"];

  if (v4)
  {
    id v5 = @"airline";
LABEL_5:
    v7 = [v3 objectForKeyedSubscript:v5];
    id v8 = objc_alloc(MEMORY[0x1E4F30290]);
    v9 = [v7 objectForKeyedSubscript:@"name"];
    v10 = [v7 objectForKeyedSubscript:@"iataCode"];
    v11 = [v7 objectForKeyedSubscript:@"icaoCode"];
    v12 = (void *)[v8 initWithName:v9 iataCode:v10 icaoCode:v11];

    goto LABEL_6;
  }
  id v6 = [v3 objectForKeyedSubscript:@"provider"];

  if (v6)
  {
    id v5 = @"provider";
    goto LABEL_5;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

+ (id)fromSchema:()schema
{
  id v3 = (void *)MEMORY[0x1E4F30638];
  id v4 = a3;
  id v5 = [v3 reservationNumberFromReservationSchema:v4];
  id v6 = [MEMORY[0x1E4F30638] bookingTimeFromReservationSchema:v4];
  uint64_t v17 = [MEMORY[0x1E4F30638] reservationStatusFromReservationSchema:v4];
  v7 = [MEMORY[0x1E4F30638] reservationHolderNameFromReservationSchema:v4];
  id v8 = [MEMORY[0x1E4F30638] urlFromReservationSchema:v4];
  v9 = [MEMORY[0x1E4F306C8] fromSchema:v4];
  v10 = [MEMORY[0x1E4F30430] flightFromReservationSchema:v4];

  id v11 = objc_alloc(MEMORY[0x1E4F30750]);
  v12 = objc_opt_new();
  v13 = [v12 UUIDString];
  v14 = (void *)[v11 initWithVocabularyIdentifier:v13 spokenPhrase:@"Flight" pronunciationHint:0];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F30430]) initWithItemReference:v14 reservationNumber:v5 bookingTime:v6 reservationStatus:v17 reservationHolderName:v7 actions:0 URL:v8 reservedSeat:v9 flight:v10];
  return v15;
}

@end