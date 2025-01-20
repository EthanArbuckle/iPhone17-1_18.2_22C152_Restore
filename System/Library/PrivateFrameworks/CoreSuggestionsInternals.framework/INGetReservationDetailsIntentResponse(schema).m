@interface INGetReservationDetailsIntentResponse(schema)
+ (id)fromSchemas:()schema;
+ (id)reservationClassForSchema:()schema;
- (id)toSchemas;
- (uint64_t)reservationsContainUniqueItemReferences;
@end

@implementation INGetReservationDetailsIntentResponse(schema)

- (uint64_t)reservationsContainUniqueItemReferences
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [a1 reservations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {
    uint64_t v17 = 1;
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v9 = [v8 itemReference];
      v10 = [v9 vocabularyIdentifier];
      uint64_t v11 = [v10 length];

      if (!v11)
      {
        v18 = sgDeveloperLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          v19 = "Failed to process event suggestion – INReservation.itemReference.vocabularyIdentifier property is nil.";
LABEL_16:
          _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
        }
LABEL_17:

        uint64_t v17 = 0;
        goto LABEL_18;
      }
      v12 = [v8 itemReference];
      v13 = [v12 vocabularyIdentifier];
      char v14 = [v2 containsObject:v13];

      if (v14)
      {
        v18 = sgDeveloperLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          v19 = "Failed to process event suggestion – two or more INReservation objects share the same INReservation.item"
                "Reference.vocabularyIdentifier.";
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      v15 = [v8 itemReference];
      v16 = [v15 vocabularyIdentifier];
      [v2 addObject:v16];
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v17 = 1;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_18:

  return v17;
}

- (id)toSchemas
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a1 reservationsContainUniqueItemReferences])
  {
    v2 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = objc_msgSend(a1, "reservations", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            v9 = [v8 performSelector:sel_schema];
            v10 = v9;
            if (v9 && [v9 count]) {
              [v2 addObject:v10];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)reservationClassForSchema:()schema
{
  v3 = [a3 objectForKeyedSubscript:@"@type"];
  if (v3
    && (+[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/FlightReservation")|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/TrainReservation")|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/RentalCarReservation")|| +[SGSchemaKeys schemaURLString:v3 isEqualTo:@"http://schema.org/FoodEstablishmentReservation"]
     || +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/LodgingReservation")|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/EventReservation")|| +[SGSchemaKeys schemaURLString:isEqualTo:](SGSchemaKeys, "schemaURLString:isEqualTo:", v3, @"http://schema.org/BusReservation")|| +[SGSchemaKeys schemaURLString:v3 isEqualTo:@"http://schema.org/BoatReservation"]))
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)fromSchemas:()schema
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F30478]) initWithCode:3 userActivity:0];
  uint64_t v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = (void *)[MEMORY[0x1E4F30478] reservationClassForSchema:v10];
        if (objc_opt_respondsToSelector())
        {
          long long v12 = [v11 performSelector:sel_fromSchema_ withObject:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v14 setReservations:v4];
  return v14;
}

@end