@interface INLodgingReservation(schema)
+ (id)fromSchema:()schema;
+ (id)reservationDurationFromReservationSchema:()schema;
+ (id)schemaFromLodgingReservation:()schema;
- (uint64_t)schema;
@end

@implementation INLodgingReservation(schema)

- (uint64_t)schema
{
  return [MEMORY[0x1E4F30538] schemaFromLodgingReservation:a1];
}

+ (id)reservationDurationFromReservationSchema:()schema
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"checkinDate"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"checkinTime"];
  }
  v7 = v6;

  v8 = [v3 objectForKeyedSubscript:@"checkoutDate"];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v3 objectForKeyedSubscript:@"checkoutTime"];
  }
  v11 = v10;

  if (v7)
  {
    v12 = [MEMORY[0x1E4F303D8] fromStartDate:v7 endDate:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)schemaFromLodgingReservation:()schema
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F30638] schemaFromReservation:v3];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:@"http://schema.org/LodgingReservation" forKeyedSubscript:@"@type"];
  id v6 = [v3 reservationDuration];

  if (v6)
  {
    v7 = [v3 reservationDuration];
    v8 = [v7 startDateComponents];

    if (v8)
    {
      v9 = [v8 schema];
      [v5 setObject:v9 forKeyedSubscript:@"checkinDate"];
    }
    id v10 = [v3 reservationDuration];
    v11 = [v10 endDateComponents];

    if (v11)
    {
      v12 = [v11 schema];
      [v5 setObject:v12 forKeyedSubscript:@"checkoutDate"];
    }
  }
  v13 = objc_opt_new();
  [v13 setObject:@"http://schema.org/LodgingBusiness" forKeyedSubscript:@"@type"];
  v14 = [v3 lodgingBusinessLocation];
  v15 = [v14 name];

  if (v15)
  {
    v16 = [v3 lodgingBusinessLocation];
    v17 = [v16 name];
    [v13 setObject:v17 forKeyedSubscript:@"name"];
  }
  v18 = [v3 lodgingBusinessLocation];
  v19 = [v18 postalAddress];

  if (v19)
  {
    v20 = [v3 lodgingBusinessLocation];
    v21 = [v20 postalAddress];
    v22 = [v21 schema];
    [v13 setObject:v22 forKeyedSubscript:@"address"];
  }
  v23 = [v3 lodgingBusinessLocation];
  v24 = [v23 location];

  if (v24)
  {
    v25 = [v3 lodgingBusinessLocation];
    v26 = [v25 location];
    v27 = [v26 schema];
    [v13 setObject:v27 forKeyedSubscript:@"geo"];
  }
  [v5 setObject:v13 forKeyedSubscript:@"reservationFor"];

  return v5;
}

+ (id)fromSchema:()schema
{
  id v3 = (void *)MEMORY[0x1E4F30638];
  id v4 = a3;
  v5 = [v3 reservationNumberFromReservationSchema:v4];
  id v6 = [MEMORY[0x1E4F30638] bookingTimeFromReservationSchema:v4];
  uint64_t v19 = [MEMORY[0x1E4F30638] reservationStatusFromReservationSchema:v4];
  v7 = [MEMORY[0x1E4F30638] reservationHolderNameFromReservationSchema:v4];
  v8 = [MEMORY[0x1E4F30638] urlFromReservationSchema:v4];
  v9 = [v4 objectForKeyedSubscript:@"reservationFor"];
  id v10 = [MEMORY[0x1E4F1E630] fromSchema:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F30750]);
  v12 = objc_opt_new();
  v13 = [v12 UUIDString];
  v14 = (void *)[v11 initWithVocabularyIdentifier:v13 spokenPhrase:@"Train" pronunciationHint:0];

  id v15 = objc_alloc(MEMORY[0x1E4F30538]);
  v16 = [MEMORY[0x1E4F30538] reservationDurationFromReservationSchema:v4];

  v17 = (void *)[v15 initWithItemReference:v14 reservationNumber:v5 bookingTime:v6 reservationStatus:v19 reservationHolderName:v7 actions:0 URL:v8 lodgingBusinessLocation:v10 reservationDuration:v16 numberOfAdults:0 numberOfChildren:0];
  return v17;
}

@end