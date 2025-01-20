@interface INReservation(schema)
+ (__CFString)reservationStatusToSchema:()schema;
+ (id)bookingTimeFromReservationSchema:()schema;
+ (id)reservationHolderNameFromReservationSchema:()schema;
+ (id)reservationNumberFromReservationSchema:()schema;
+ (id)schemaFromReservation:()schema;
+ (id)urlFromReservationSchema:()schema;
+ (uint64_t)reservationStatusFromReservationSchema:()schema;
@end

@implementation INReservation(schema)

+ (__CFString)reservationStatusToSchema:()schema
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E65BB6C8[a3 - 1];
  }
}

+ (id)schemaFromReservation:()schema
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  [v5 setObject:@"http://schema.org" forKeyedSubscript:@"@context"];
  v6 = [v3 reservationNumber];

  if (v6)
  {
    v7 = [v3 reservationNumber];
    [v5 setObject:v7 forKeyedSubscript:@"reservationId"];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F30638], "reservationStatusToSchema:", objc_msgSend(v3, "reservationStatus"));
  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"reservationStatus"];
  }
  v9 = [v3 bookingTime];

  if (v9)
  {
    v10 = [v3 bookingTime];
    v11 = [v4 stringFromDate:v10];
    [v5 setObject:v11 forKeyedSubscript:@"bookingTime"];
  }
  v12 = [v3 reservationHolderName];

  if (v12)
  {
    v24[0] = @"@type";
    v24[1] = @"name";
    v25[0] = @"http://schema.org/Person";
    v13 = [v3 reservationHolderName];
    v25[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v5 setObject:v14 forKeyedSubscript:@"underName"];
  }
  v15 = [v3 URL];

  if (v15)
  {
    v16 = [v3 URL];
    v17 = [v16 absoluteString];
    [v5 setObject:v17 forKeyedSubscript:@"url"];
  }
  v18 = [v3 itemReference];

  if (v18)
  {
    v19 = [v3 itemReference];
    v20 = [v19 spokenPhrase];
    [v5 setObject:v20 forKeyedSubscript:@"itemReferenceName"];

    v21 = [v3 itemReference];
    v22 = [v21 vocabularyIdentifier];
    [v5 setObject:v22 forKeyedSubscript:@"itemReferenceIdentifier"];
  }
  return v5;
}

+ (id)urlFromReservationSchema:()schema
{
  id v3 = [a3 objectForKeyedSubscript:@"url"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)reservationHolderNameFromReservationSchema:()schema
{
  id v3 = [a3 objectForKeyedSubscript:@"underName"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"name"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)reservationStatusFromReservationSchema:()schema
{
  id v3 = [a3 objectForKeyedSubscript:@"reservationStatus"];
  if ([v3 isEqualToString:@"http://schema.org/ReservationHold"])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"http://schema.org/ReservationPending"])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"http://schema.org/ReservationCancelled"])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"http://schema.org/ReservationConfirmed"])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)bookingTimeFromReservationSchema:()schema
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"bookingTime"];

  v6 = [v4 dateFromString:v5];

  return v6;
}

+ (id)reservationNumberFromReservationSchema:()schema
{
  id v3 = a3;
  uint64_t v4 = @"reservationId";
  v5 = [v3 objectForKeyedSubscript:@"reservationId"];

  if (v5
    || (uint64_t v4 = @"reservationNumber",
        [v3 objectForKeyedSubscript:@"reservationNumber"],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end