@interface INRestaurantReservation(schema)
+ (id)fromSchema:()schema;
+ (id)partySizeFromReservationSchema:()schema;
+ (id)schemaFromRestaurantReservation:()schema;
- (uint64_t)schema;
@end

@implementation INRestaurantReservation(schema)

- (uint64_t)schema
{
  return [MEMORY[0x1E4F30650] schemaFromRestaurantReservation:a1];
}

+ (id)partySizeFromReservationSchema:()schema
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"partySize"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 objectForKeyedSubscript:@"partySize"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)schemaFromRestaurantReservation:()schema
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F30638] schemaFromReservation:v3];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:@"http://schema.org/FoodEstablishmentReservation" forKeyedSubscript:@"@type"];
  v6 = [v3 reservationDuration];

  if (v6)
  {
    v7 = [v3 reservationDuration];
    v8 = [v7 startDateComponents];

    if (v8)
    {
      v9 = [v8 schema];
      [v5 setObject:v9 forKeyedSubscript:@"startTime"];
    }
    v10 = [v3 reservationDuration];
    v11 = [v10 endDateComponents];

    if (v11)
    {
      v12 = [v11 schema];
      [v5 setObject:v12 forKeyedSubscript:@"endTime"];
    }
  }
  v13 = [v3 partySize];

  if (v13)
  {
    v14 = [v3 partySize];
    [v5 setObject:v14 forKeyedSubscript:@"partySize"];
  }
  v15 = objc_opt_new();
  [v15 setObject:@"http://schema.org/FoodEstablishment" forKeyedSubscript:@"@type"];
  v16 = [v3 restaurantLocation];
  v17 = [v16 name];

  if (v17)
  {
    v18 = [v3 restaurantLocation];
    v19 = [v18 name];
    [v15 setObject:v19 forKeyedSubscript:@"name"];
  }
  v20 = [v3 restaurantLocation];

  if (v20)
  {
    v21 = [v3 restaurantLocation];
    v22 = [v21 postalAddress];

    if (v22)
    {
      v23 = [v3 restaurantLocation];
      v24 = [v23 postalAddress];
      v25 = [v24 schema];
      [v15 setObject:v25 forKeyedSubscript:@"address"];
    }
    v26 = [v3 restaurantLocation];
    v27 = [v26 location];

    if (v27)
    {
      v28 = [v3 restaurantLocation];
      v29 = [v28 location];
      v30 = [v29 schema];
      [v15 setObject:v30 forKeyedSubscript:@"geo"];
    }
  }
  [v5 setObject:v15 forKeyedSubscript:@"reservationFor"];

  return v5;
}

+ (id)fromSchema:()schema
{
  id v3 = (void *)MEMORY[0x1E4F30638];
  id v4 = a3;
  v5 = [v3 reservationNumberFromReservationSchema:v4];
  v22 = [MEMORY[0x1E4F30638] bookingTimeFromReservationSchema:v4];
  uint64_t v21 = [MEMORY[0x1E4F30638] reservationStatusFromReservationSchema:v4];
  v19 = [MEMORY[0x1E4F30638] reservationHolderNameFromReservationSchema:v4];
  v6 = [MEMORY[0x1E4F30638] urlFromReservationSchema:v4];
  v20 = [v4 objectForKeyedSubscript:@"startTime"];
  v18 = [v4 objectForKeyedSubscript:@"endTime"];
  v7 = [MEMORY[0x1E4F303D8] fromStartDate:v20 endDate:v18];
  v8 = [v4 objectForKeyedSubscript:@"reservationFor"];
  v9 = [MEMORY[0x1E4F1E630] fromSchema:v8];
  id v10 = objc_alloc(MEMORY[0x1E4F30750]);
  v11 = objc_opt_new();
  v12 = [v11 UUIDString];
  v13 = (void *)[v10 initWithVocabularyIdentifier:v12 spokenPhrase:@"Restaurant" pronunciationHint:0];

  id v14 = objc_alloc(MEMORY[0x1E4F30650]);
  v15 = [MEMORY[0x1E4F30650] partySizeFromReservationSchema:v4];

  v16 = (void *)[v14 initWithItemReference:v13 reservationNumber:v5 bookingTime:v22 reservationStatus:v21 reservationHolderName:v19 actions:0 URL:v6 reservationDuration:v7 partySize:v15 restaurantLocation:v9];
  return v16;
}

@end