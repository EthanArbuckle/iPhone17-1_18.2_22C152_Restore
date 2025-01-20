@interface CSPersonalAnswers
+ (id)attributeIntentsFromQU:(id)a3;
+ (id)attributesFromIntent:(id)a3;
+ (id)fetchAttributes;
+ (id)personalAnswersEventIntentForQUOutput:(id)a3;
+ (id)personalAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 searchString:(id)a5 answerAttributeIntents:(id)a6 isShortQuery:(BOOL)a7 locale:(id)a8;
+ (id)structuredFreeTextQueryForTokens:(id)a3 searchString:(id)a4 searchStringTokens:(id)a5 categoryIntents:(id)a6;
+ (id)structuredIntentQueryForCategoryIntents:(id)a3;
@end

@implementation CSPersonalAnswers

+ (id)fetchAttributes
{
  if (fetchAttributes_onceAttributesToken != -1) {
    dispatch_once(&fetchAttributes_onceAttributesToken, &__block_literal_global_34);
  }
  v2 = (void *)fetchAttributes_cachedAttributes;

  return v2;
}

void __36__CSPersonalAnswers_fetchAttributes__block_invoke()
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA80] set];
  v13[0] = @"kMDItemEventMessageIdentifier";
  v13[1] = @"kMDItemEventType";
  v13[2] = @"kMDItemEventIsAllDay";
  v13[3] = @"kMDItemStartDate";
  v13[4] = @"kMDItemEndDate";
  v13[5] = @"com_apple_mail_messageID";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
  v2 = (void *)_block_invoke_commonEventAttributes;
  _block_invoke_commonEventAttributes = v1;

  v12[0] = @"kMDItemEventFlightNumber";
  v12[1] = @"kMDItemEventFlightCarrier";
  v12[2] = @"kMDItemEventFlightCarrierCode";
  v12[3] = @"kMDItemEventFlightArrivalDateTime";
  v12[4] = @"kMDItemEventFlightArrivalTimeZone";
  v12[5] = @"kMDItemEventFlightDepartureDateTime";
  v12[6] = @"kMDItemEventFlightDepartureTimeZone";
  v12[7] = @"kMDItemEventFlightArrivalAirportCode";
  v12[8] = @"kMDItemEventFlightDepartureAirportCode";
  v12[9] = @"kMDItemEventFlightConfirmationNumber";
  v12[10] = @"kMDItemEventFlightArrivalAirportName";
  v12[11] = @"kMDItemEventFlightDepartureAirportName";
  v12[12] = @"kMDItemEventFlightPassengerNames";
  v12[13] = @"kMDItemEventFlightPassengerSeatNumbers";
  v12[14] = @"kMDItemEventFlightArrivalTerminal";
  v12[15] = @"kMDItemEventFlightDepartureTerminal";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:16];
  v4 = (void *)_block_invoke_flightEventAttributes;
  _block_invoke_flightEventAttributes = v3;

  v11[0] = @"kMDItemEventHotelReservationId";
  v11[1] = @"kMDItemEventHotelUnderName";
  v11[2] = @"kMDItemEventHotelProvider";
  v11[3] = @"kMDItemEventHotelCheckinDate";
  v11[4] = @"kMDItemEventHotelCheckinTime";
  v11[5] = @"kMDItemEventHotelCheckoutDate";
  v11[6] = @"kMDItemEventHotelCheckoutTime";
  v11[7] = @"kMDItemEventHotelTimeZone";
  v11[8] = @"kMDItemEventHotelReservationForName";
  v11[9] = @"kMDItemEventHotelReservationForAddress";
  v11[10] = @"kMDItemEventHotelReservationForStreetAddress";
  v11[11] = @"kMDItemEventHotelReservationForAddressLocality";
  v11[12] = @"kMDItemEventHotelReservationForAddressRegion";
  v11[13] = @"kMDItemEventHotelReservationForAddressPostalCode";
  v11[14] = @"kMDItemEventHotelReservationForAddressCountry";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:15];
  v6 = (void *)_block_invoke_hotelEventAttributes;
  _block_invoke_hotelEventAttributes = v5;

  v10[0] = @"kMDItemEventRestaurantReservationId";
  v10[1] = @"kMDItemEventRestaurantUnderName";
  v10[2] = @"kMDItemEventRestaurantStartDate";
  v10[3] = @"kMDItemEventRestaurantStartTime";
  v10[4] = @"kMDItemEventRestaurantTimeZone";
  v10[5] = @"kMDItemEventRestaurantReservationForName";
  v10[6] = @"kMDItemEventRestaurantReservationForAddress";
  v10[7] = @"kMDItemEventRestaurantReservationForStreetAddress";
  v10[8] = @"kMDItemEventRestaurantReservationForAddressLocality";
  v10[9] = @"kMDItemEventRestaurantReservationForAddressRegion";
  v10[10] = @"kMDItemEventRestaurantReservationForAddressPostalCode";
  v10[11] = @"kMDItemEventRestaurantReservationForAddressCountry";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:12];
  v8 = (void *)_block_invoke_restaurantEventAttributes;
  _block_invoke_restaurantEventAttributes = v7;

  [v0 addObjectsFromArray:_block_invoke_commonEventAttributes];
  [v0 addObjectsFromArray:_block_invoke_flightEventAttributes];
  [v0 addObjectsFromArray:_block_invoke_hotelEventAttributes];
  [v0 addObjectsFromArray:_block_invoke_restaurantEventAttributes];
  v9 = (void *)fetchAttributes_cachedAttributes;
  fetchAttributes_cachedAttributes = (uint64_t)v0;
}

+ (id)personalAnswersEventIntentForQUOutput:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  uint64_t v5 = logForCSLogCategoryQuery();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "[debug][personal answers][query] queryUnderstandingOutput = %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    +[CSPersonalAnswers personalAnswersEventIntentForQUOutput:]((uint64_t)v3, v6);
  }

  if ([v3 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v3;
    uint64_t v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v12 isEqualToString:@"kQPQUIntentLabels"])
          {
            v13 = [v7 objectForKeyedSubscript:v12];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
            {
              v14 = [v13 objectAtIndexedSubscript:0];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v15 = v14;
                if (([v15 hasPrefix:@"INTENT_FLIGHT"] & 1) != 0
                  || ([v15 hasPrefix:@"INTENT_HOTEL"] & 1) != 0
                  || ([v15 hasPrefix:@"INTENT_RESTAURANT"] & 1) != 0
                  || ([v15 hasPrefix:@"QUPP_INTENT_RESERVATION_SEARCH"] & 1) != 0
                  || ([v15 hasPrefix:@"QUPP_INTENT_EVENT_SEARCH"] & 1) != 0)
                {
                  v16 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v25 = v15;
                    _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "[personal answers][query] queryUnderstandingOutput has event intent, kQPQUIntentLabels = %@", buf, 0xCu);
                  }

                  goto LABEL_35;
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "[personal answers][query] No event Intent detected in queryUnderstandingOutput", buf, 2u);
    }
    id v15 = 0;
LABEL_35:
    id v3 = v18;
  }
  else
  {
    uint64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "[personal answers][query] queryUnderstandingOutput dictionary is empty", buf, 2u);
    }
    id v15 = 0;
  }

  return v15;
}

+ (id)attributeIntentsFromQU:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (attributeIntentsFromQU__onceToken[0] != -1) {
    dispatch_once(attributeIntentsFromQU__onceToken, &__block_literal_global_22_0);
  }
  int v4 = [(id)attributeIntentsFromQU__mapQUIntentToAttributes objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 count];
    uint64_t v7 = logForCSLogCategoryDefault();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8) {
        goto LABEL_13;
      }
      int v13 = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      v16 = v5;
      uint64_t v9 = "[personal answers][query] For personalAnswersQUIntent: %@, assigning answer attributes: %@";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
      goto LABEL_12;
    }
    if (!v8) {
      goto LABEL_13;
    }
    int v13 = 138412290;
    id v14 = v3;
    uint64_t v9 = "[personal answers][query] For personalAnswersQUIntent: %@, assigning no answer attributes";
  }
  else
  {
    uint64_t v7 = logForCSLogCategoryDefault();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v13 = 138412290;
    id v14 = v3;
    uint64_t v9 = "[personal answers][query] Unrecognized personalAnswersQUIntent found from QU: %@";
  }
  uint64_t v10 = v7;
  uint32_t v11 = 12;
LABEL_12:
  _os_log_impl(&dword_18D0E3000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
LABEL_13:

  return v5;
}

void __44__CSPersonalAnswers_attributeIntentsFromQU___block_invoke()
{
  v0 = (void *)attributeIntentsFromQU__mapQUIntentToAttributes;
  attributeIntentsFromQU__mapQUIntentToAttributes = (uint64_t)&unk_1EDBD6BB0;
}

+ (id)personalAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 searchString:(id)a5 answerAttributeIntents:(id)a6 isShortQuery:(BOOL)a7 locale:(id)a8
{
  BOOL v9 = a7;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  if ((unint64_t)[v12 count] <= 1)
  {
    v16 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "[personal answers][fallback qp]: No fallback query triggered for query with < 2 tokens";
LABEL_7:
      _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    v16 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = "[personal answers][fallback qp]: No fallback query triggered for short query";
      goto LABEL_7;
    }
LABEL_8:
    id v18 = 0;
    goto LABEL_24;
  }
  v16 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = [MEMORY[0x1E4F1CA48] array];
  +[CSPersonalAnswersUtils intentsForStringTokens:v12 filteredTokens:v19 categoryIntents:v16 attributeIntents:v14 locale:v15];
  if ([v16 count])
  {
    long long v20 = +[CSPersonalAnswers structuredIntentQueryForCategoryIntents:v16];
    long long v21 = +[CSPersonalAnswers structuredFreeTextQueryForTokens:v19 searchString:v13 searchStringTokens:v12 categoryIntents:v16];
    long long v22 = [MEMORY[0x1E4F28E78] string];
    if (v20 && [v20 length])
    {
      if (v21 && [v21 length])
      {
        [v22 appendFormat:@"(%@)", v20];
        [v22 appendString:@" && "];
        [v22 appendString:v21];
      }
      else
      {
        [v22 appendFormat:@"%@", v20];
      }
    }
    if ([v22 length])
    {
      v24 = v22;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    long long v20 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = [v16 count];
      __int16 v27 = 2048;
      uint64_t v28 = [v14 count];
      _os_log_impl(&dword_18D0E3000, v20, OS_LOG_TYPE_DEFAULT, "[personal answers][fallback qp]: No fallback query triggered for query with categoryIntents.count =  %ld and attributeIntents.count=%ld", buf, 0x16u);
    }
    id v18 = 0;
  }

LABEL_24:

  return v18;
}

+ (id)attributesFromIntent:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  uint64_t v5 = [v3 set];
  uint64_t v6 = +[CSPersonalAnswers fetchAttributes];
  [v5 unionSet:v6];

  uint64_t v7 = [v4 allObjects];

  [v5 addObjectsFromArray:v7];

  return v5;
}

+ (id)structuredFreeTextQueryForTokens:(id)a3 searchString:(id)a4 searchStringTokens:(id)a5 categoryIntents:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 rangeOfString:@" to "];
  uint64_t v14 = [v10 rangeOfString:@" from "];
  v45 = v12;
  int v15 = [v12 containsObject:&unk_1EDBD6AC0];
  v48 = [MEMORY[0x1E4F28E78] string];
  uint64_t v16 = [MEMORY[0x1E4F28E78] string];
  uint64_t v17 = (void *)v16;
  BOOL v18 = v14 == 0x7FFFFFFFFFFFFFFFLL && v13 == 0x7FFFFFFFFFFFFFFFLL;
  id v46 = v11;
  v47 = (void *)v16;
  if (!v18 && v15)
  {
    v43 = v9;
    id v44 = v10;
    v49 = (void *)[v9 mutableCopy];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (!v20) {
      goto LABEL_25;
    }
    uint64_t v21 = v20;
    char v22 = 0;
    char v23 = 0;
    uint64_t v24 = *(void *)v55;
    while (1)
    {
      uint64_t v25 = 0;
      do
      {
        char v26 = v22;
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v19);
        }
        __int16 v27 = *(void **)(*((void *)&v54 + 1) + 8 * v25);
        char v22 = [v27 isEqualToString:@"to"];
        if (v22)
        {
LABEL_12:
          char v23 = 0;
          goto LABEL_19;
        }
        if ([v27 isEqualToString:@"from"])
        {
          char v23 = 1;
          goto LABEL_19;
        }
        if ((v26 & 1) == 0)
        {
          if ((v23 & 1) == 0) {
            goto LABEL_12;
          }
          uint64_t v28 = v47;
          char v23 = 0;
          if (![v47 length]) {
            goto LABEL_18;
          }
LABEL_17:
          [v28 appendString:@" "];
          goto LABEL_18;
        }
        uint64_t v28 = v48;
        if ([v48 length]) {
          goto LABEL_17;
        }
LABEL_18:
        [v28 appendString:v27];
        [v49 removeObject:v27];
LABEL_19:
        ++v25;
      }
      while (v21 != v25);
      uint64_t v29 = [v19 countByEnumeratingWithState:&v54 objects:v59 count:16];
      uint64_t v21 = v29;
      if (!v29)
      {
LABEL_25:

        id v10 = v44;
        id v11 = v46;
        uint64_t v17 = v47;
        id v9 = v49;
        break;
      }
    }
  }
  if ([v9 count] || objc_msgSend(v48, "length") || objc_msgSend(v17, "length"))
  {
    v30 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v31 = v9;
    id v32 = v9;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [NSString stringWithFormat:@"(** = '%@*'cdwt)", *(void *)(*((void *)&v50 + 1) + 8 * i)];
          [v30 addObject:v37];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v34);
    }

    v38 = v48;
    if ([v48 length])
    {
      v39 = [NSString stringWithFormat:@"(kMDItemEventFlightArrivalAirportCode=\"%@*\"cwd || kMDItemEventFlightArrivalAirportName=\"%@*\"cwd || kMDItemEventFlightArrivalTerminal=\"%@*\"cwd || kMDItemEventFlightArrivalAirportAddress=\"%@*\"cwd || kMDItemEventFlightArrivalAirportStreetAddress=\"%@*\"cwd || kMDItemEventFlightArrivalAirportLocality=\"%@*\"cwd || kMDItemEventFlightArrivalAirportRegion=\"%@*\"cwd || kMDItemEventFlightArrivalAirportCountry=\"%@*\"cwd)", v48, v48, v48, v48, v48, v48, v48, v48];
      [v30 addObject:v39];
    }
    uint64_t v17 = v47;
    id v9 = v31;
    if ([v47 length])
    {
      v40 = [NSString stringWithFormat:@"(kMDItemEventFlightDepartureAirportCode=\"%@*\"cwd || kMDItemEventFlightDepartureAirportName=\"%@*\"cwd || kMDItemEventFlightDepartureTerminal=\"%@*\"cwd || kMDItemEventFlightDepartureAirportAddress=\"%@*\"cwd || kMDItemEventFlightDepartureAirportStreetAddress=\"%@*\"cwd || kMDItemEventFlightDepartureAirportLocality=\"%@*\"cwd || kMDItemEventFlightDepartureAirportRegion=\"%@*\"cwd || kMDItemEventFlightDepartureAirportCountry=\"%@*\"cwd)", v47, v47, v47, v47, v47, v47, v47, v47];
      [v30 addObject:v40];
    }
    v41 = [v30 componentsJoinedByString:@" && "];

    id v11 = v46;
  }
  else
  {
    v41 = 0;
    v38 = v48;
  }

  return v41;
}

+ (id)structuredIntentQueryForCategoryIntents:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1) {
    int v4 = [v3 containsObject:&unk_1EDBD6AD8];
  }
  else {
    int v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 appendString:@"kMDItemEventType=\"flight\" || kMDItemEventType=\"hotel\" || kMDItemEventType=\"restaurant\""];
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EDBD6AF0, &unk_1EDBD6B08, &unk_1EDBD6B20, 0);
    int v8 = [v3 intersectsSet:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_8:
      uint64_t v13 = 0;
      while (2)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        switch([*(id *)(*((void *)&v18 + 1) + 8 * v13) integerValue])
        {
          case 0:
            uint64_t v14 = @"kMDItemEventType=\"flight\"";
            if ([v6 length]) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 1:
            uint64_t v14 = @"kMDItemEventType=\"hotel\"";
            if (![v6 length]) {
              goto LABEL_19;
            }
            goto LABEL_18;
          case 2:
            if (v8) {
              goto LABEL_20;
            }
            uint64_t v14 = @"kMDItemEventType=\"restaurant\"";
            if ([v6 length]) {
LABEL_18:
            }
              [v6 appendString:@" || "];
LABEL_19:
            [v6 appendString:v14];
LABEL_20:
            if (v11 != ++v13) {
              continue;
            }
            uint64_t v15 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
            uint64_t v11 = v15;
            if (!v15) {
              goto LABEL_29;
            }
            goto LABEL_8;
          case 3:
            uint64_t v14 = @"kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"breakfast\"";
            if (![v6 length]) {
              goto LABEL_19;
            }
            goto LABEL_18;
          case 4:
            uint64_t v14 = @"kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"lunch\"";
            if ([v6 length]) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 5:
            uint64_t v14 = @"kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"dinner\"";
            if (![v6 length]) {
              goto LABEL_19;
            }
            goto LABEL_18;
          default:
            goto LABEL_20;
        }
      }
    }
LABEL_29:

    id v3 = v17;
  }

  return v6;
}

+ (void)personalAnswersEventIntentForQUOutput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] queryUnderstandingOutput = %@", (uint8_t *)&v2, 0xCu);
}

@end