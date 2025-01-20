@interface CSInstantAnswers
+ (BOOL)_isNoInstantAnswerQuery:(id)a3;
+ (BOOL)eventHasValidRequiredFields:(id)a3;
+ (BOOL)eventIsInFarFuture:(id)a3 queryDate:(id)a4;
+ (BOOL)isInstantAnswerTriggerQuery:(id)a3 isCJK:(BOOL)a4 isSearchTool:(BOOL)a5;
+ (BOOL)isInstantAnswersTriggeringQuery:(id)a3 isCJK:(BOOL)a4 instantAnswerQueryMinLengthNonCJK:(int64_t)a5 instantAnswerQueryMinLengthCJK:(int64_t)a6 isSearchTool:(BOOL)a7;
+ (BOOL)overrideParsedQuery:(id)a3;
+ (id)_extractEventDateToCompare:(id)a3;
+ (id)_parseSearchStringWithTriggerPhrases:(id)a3;
+ (id)_removeStopWordsInQueryTokens:(id)a3 stopWords:(id)a4;
+ (id)commonStopWords;
+ (id)commonTriggerPhrases;
+ (id)flightIntentTokens;
+ (id)flightStopWords;
+ (id)flightTriggerPhrases;
+ (id)hotelIntentTokens;
+ (id)hotelStopWords;
+ (id)hotelTriggerPhrases;
+ (id)instantAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 isCJK:(BOOL)a5;
+ (id)instantAnswersMailboxes:(id)a3;
+ (id)noInstantAnswersQueries;
+ (id)overrideTokens;
+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3;
+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3 forDate:(id)a4 isSearchToolQuery:(BOOL)a5;
+ (int64_t)_compareEventsWithFirstDateTime:(id)a3 secondDateTime:(id)a4;
+ (void)_intentForSearchStringTokens:(id)a3 hasFlightIntent:(BOOL *)a4 hasHotelIntent:(BOOL *)a5;
- (CSInstantAnswers)initWithMessageId:(id)a3 groupId:(id)a4 fallbackGroupId:(id)a5 mailMessageId:(id)a6 answerAttributes:(id)a7;
- (NSArray)answerAttributes;
- (NSArray)flightPassengerNames;
- (NSArray)flightPassengerSeatNumbers;
- (NSDateComponents)flightArrivalDateComponents;
- (NSDateComponents)flightDepartureDateComponents;
- (NSDateComponents)hotelCheckinDateComponents;
- (NSDateComponents)hotelCheckoutDateComponents;
- (NSDateComponents)restaurantStartDateComponents;
- (NSString)fallbackGroupId;
- (NSString)flightArrivalAirportCode;
- (NSString)flightArrivalAirportName;
- (NSString)flightArrivalTerminal;
- (NSString)flightCarrier;
- (NSString)flightCarrierCode;
- (NSString)flightConfirmationNumber;
- (NSString)flightDepartureAirportCode;
- (NSString)flightDepartureAirportName;
- (NSString)flightDepartureTerminal;
- (NSString)flightNumber;
- (NSString)groupId;
- (NSString)hotelModifyReservationUrl;
- (NSString)hotelReservationForAddress;
- (NSString)hotelReservationForAddressCountry;
- (NSString)hotelReservationForAddressLocality;
- (NSString)hotelReservationForAddressPostalCode;
- (NSString)hotelReservationForAddressRegion;
- (NSString)hotelReservationForName;
- (NSString)hotelReservationForStreetAddress;
- (NSString)hotelReservationForTelephone;
- (NSString)hotelReservationId;
- (NSString)hotelUnderName;
- (NSString)mailMessageId;
- (NSString)messageId;
- (NSString)restaurantPartySize;
- (NSString)restaurantReservationForAddress;
- (NSString)restaurantReservationForName;
- (NSString)restaurantReservationForTelephone;
- (NSString)restaurantReservationId;
- (NSString)restaurantUnderName;
- (NSTimeZone)flightArrivalTimeZone;
- (NSTimeZone)flightDepartureTimeZone;
- (NSTimeZone)hotelTimeZone;
- (NSTimeZone)restaurantTimeZone;
- (NSURL)flightBookingInfoUrl;
- (NSURL)flightCheckInUrl;
- (id)flightArrivalAirportAddress;
- (id)flightArrivalAirportAddressSynonyms;
- (id)flightArrivalAirportCountry;
- (id)flightArrivalAirportInternationalNames;
- (id)flightArrivalAirportLatitude;
- (id)flightArrivalAirportLocality;
- (id)flightArrivalAirportLongitude;
- (id)flightArrivalAirportPostalCode;
- (id)flightArrivalAirportRegion;
- (id)flightArrivalAirportStreetAddress;
- (id)flightDepartureAirportAddress;
- (id)flightDepartureAirportAddressSynonyms;
- (id)flightDepartureAirportCountry;
- (id)flightDepartureAirportInternationalNames;
- (id)flightDepartureAirportLatitude;
- (id)flightDepartureAirportLocality;
- (id)flightDepartureAirportLongitude;
- (id)flightDepartureAirportPostalCode;
- (id)flightDepartureAirportRegion;
- (id)flightDepartureAirportStreetAddress;
- (id)flightStatus;
- (id)hotelReservationForAddressSynonyms;
- (id)initFlightAnswerWithItem:(id)a3 answerAttributes:(id)a4;
- (id)initHotelAnswerWithItem:(id)a3 answerAttributes:(id)a4;
- (id)initRestaurantAnswerWithItem:(id)a3 answerAttributes:(id)a4;
- (id)restaurantReservationForAddressCountry;
- (id)restaurantReservationForAddressLocality;
- (id)restaurantReservationForAddressPostalCode;
- (id)restaurantReservationForAddressRegion;
- (id)restaurantReservationForAddressSynonyms;
- (id)restaurantReservationForStreetAddress;
- (int64_t)instantAnswersKind;
@end

@implementation CSInstantAnswers

- (CSInstantAnswers)initWithMessageId:(id)a3 groupId:(id)a4 fallbackGroupId:(id)a5 mailMessageId:(id)a6 answerAttributes:(id)a7
{
  v12 = (NSString *)a3;
  v13 = (NSString *)a4;
  v14 = (NSString *)a5;
  v15 = (NSString *)a6;
  v16 = (NSArray *)a7;
  messageId = self->_messageId;
  self->_messageId = v12;
  v26 = v12;

  groupId = self->_groupId;
  self->_groupId = v13;
  v19 = v13;

  fallbackGroupId = self->_fallbackGroupId;
  self->_fallbackGroupId = v14;
  v21 = v14;

  mailMessageId = self->_mailMessageId;
  self->_mailMessageId = v15;
  v23 = v15;

  answerAttributes = self->_answerAttributes;
  self->_answerAttributes = v16;

  return result;
}

+ (id)_extractEventDateToCompare:(id)a3
{
  v3 = [a3 attributeSet];
  v4 = [v3 startDate];

  return v4;
}

+ (int64_t)_compareEventsWithFirstDateTime:(id)a3 secondDateTime:(id)a4
{
  return [a3 compare:a4];
}

+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [a1 selectInstantAnswersEventsWithFoundEvents:v5 forDate:v6 isSearchToolQuery:0];

  return v7;
}

+ (BOOL)eventHasValidRequiredFields:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 attributeSet];
  id v5 = [v4 eventType];
  int v6 = [v5 isEqualToString:@"hotel"];

  v7 = [v3 attributeSet];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 eventMessageIdentifier];
    v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v11 = [v9 stringByTrimmingCharactersInSet:v10];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v3 attributeSet];
      uint64_t v14 = [v13 startDate];
      if (v14)
      {
        v15 = (void *)v14;
        v73 = [v3 attributeSet];
        v16 = [v73 hotelReservationForName];
        v17 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v18 = [v16 stringByTrimmingCharactersInSet:v17];
        if (v18)
        {

LABEL_32:
          BOOL v64 = 1;
          goto LABEL_33;
        }
        v72 = [v3 attributeSet];
        v68 = [v72 hotelProvider];
        v70 = v16;
        v62 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v63 = objc_msgSend(v68, "stringByTrimmingCharactersInSet:");

        if (v63) {
          goto LABEL_32;
        }
LABEL_18:
        v52 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v3 attributeSet];
          v54 = [v53 eventMessageIdentifier];
          v55 = [v3 attributeSet];
          v56 = [v55 startDate];
          v57 = [v3 attributeSet];
          v58 = [v57 hotelUnderName];
          v59 = [v3 attributeSet];
          v60 = [v59 hotelProvider];
          *(_DWORD *)buf = 138413058;
          v77 = v54;
          __int16 v78 = 2112;
          v79 = v56;
          __int16 v80 = 2112;
          v81 = v58;
          __int16 v82 = 2112;
          v83 = v60;
          v61 = "[instant answers] Found hotel event does not have all valid required fields. (Required Fields: (eventMes"
                "sageIdentifier=%@, hotelCheckinDate=%@, hotelUnderName=%@, hotelProvider=%@)";
LABEL_28:
          _os_log_impl(&dword_18D0E3000, v52, OS_LOG_TYPE_DEFAULT, v61, buf, 0x2Au);

LABEL_29:
          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    goto LABEL_18;
  }
  v19 = [v7 eventType];
  int v20 = [v19 isEqualToString:@"flight"];

  v21 = [v3 attributeSet];
  v22 = v21;
  if (v20)
  {
    v23 = [v21 eventMessageIdentifier];
    v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v25 = [v23 stringByTrimmingCharactersInSet:v24];
    if (v25)
    {
      v26 = (void *)v25;
      v27 = [v3 attributeSet];
      v28 = [v27 flightDepartureAirportCode];
      v29 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v30 = [v28 stringByTrimmingCharactersInSet:v29];
      if (v30)
      {
        v31 = (void *)v30;
        v71 = v28;
        v74 = v27;
        v69 = [v3 attributeSet];
        v32 = [v69 flightArrivalAirportCode];
        v33 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v67 = v32;
        v34 = [v32 stringByTrimmingCharactersInSet:v33];
        if (v34)
        {
          v35 = [v3 attributeSet];
          v36 = [v35 startDate];
          BOOL v66 = v36 == 0;

          char v37 = v66;
        }
        else
        {
          char v37 = 1;
        }

        if ((v37 & 1) == 0) {
          goto LABEL_32;
        }
LABEL_26:
        v52 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v3 attributeSet];
          v54 = [v53 eventMessageIdentifier];
          v55 = [v3 attributeSet];
          v56 = [v55 flightDepartureAirportCode];
          v57 = [v3 attributeSet];
          v58 = [v57 flightArrivalAirportCode];
          v59 = [v3 attributeSet];
          v60 = [v59 startDate];
          *(_DWORD *)buf = 138413058;
          v77 = v54;
          __int16 v78 = 2112;
          v79 = v56;
          __int16 v80 = 2112;
          v81 = v58;
          __int16 v82 = 2112;
          v83 = v60;
          v61 = "[instant answers] Found flight event does not have all valid required fields. (Required Fields: (eventMe"
                "ssageIdentifier=%@, flightDepartureAirportCode=%@, flightArrivalAirportCode=%@, flightDepartureDateTime=%@)";
          goto LABEL_28;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    goto LABEL_26;
  }
  v38 = [v21 eventType];
  int v39 = [v38 isEqualToString:@"restaurant"];

  if (v39)
  {
    v40 = [v3 attributeSet];
    v41 = [v40 eventMessageIdentifier];
    v42 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v43 = [v41 stringByTrimmingCharactersInSet:v42];
    if (v43)
    {
      v44 = (void *)v43;
      v45 = [v3 attributeSet];
      uint64_t v46 = [v45 startDate];
      if (v46)
      {
        v47 = (void *)v46;
        v48 = [v3 attributeSet];
        v49 = [v48 restaurantReservationForName];
        v50 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        [v49 stringByTrimmingCharactersInSet:v50];
        v51 = v75 = v40;

        if (v51) {
          goto LABEL_32;
        }
        goto LABEL_36;
      }
    }
LABEL_36:
    v52 = logForCSLogCategoryDefault();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v53 = [v3 attributeSet];
    v54 = [v53 eventMessageIdentifier];
    v55 = [v3 attributeSet];
    v56 = [v55 startDate];
    v57 = [v3 attributeSet];
    v58 = [v57 restaurantUnderName];
    *(_DWORD *)buf = 138412802;
    v77 = v54;
    __int16 v78 = 2112;
    v79 = v56;
    __int16 v80 = 2112;
    v81 = v58;
    _os_log_impl(&dword_18D0E3000, v52, OS_LOG_TYPE_DEFAULT, "[instant answers] Found restaurant event does not have all valid required fields. (Required Fields: (eventMessageIdentifier=%@, restaurantStartDate=%@, restaurantUnderName=%@)", buf, 0x20u);
    goto LABEL_29;
  }
LABEL_31:
  BOOL v64 = 0;
LABEL_33:

  return v64;
}

+ (BOOL)eventIsInFarFuture:(id)a3 queryDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_7;
  }
  v7 = [v5 attributeSet];
  v8 = [v7 eventType];
  int v9 = [v8 isEqualToString:@"hotel"];

  v10 = [v5 attributeSet];
  uint64_t v11 = v10;
  if (!v9)
  {
    v12 = [v10 eventType];
    int v13 = [v12 isEqualToString:@"flight"];

    if (!v13)
    {
LABEL_7:
      BOOL v17 = 0;
      goto LABEL_8;
    }
    v10 = [v5 attributeSet];
    uint64_t v11 = v10;
  }
  uint64_t v14 = [v10 startDate];
  [v14 timeIntervalSinceDate:v6];
  double v16 = v15;

  if (v16 <= 5184000.0) {
    goto LABEL_7;
  }
  BOOL v17 = 1;
LABEL_8:

  return v17;
}

+ (BOOL)isInstantAnswerTriggerQuery:(id)a3 isCJK:(BOOL)a4 isSearchTool:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  int v9 = [v7 stringByTrimmingCharactersInSet:v8];
  v10 = [v9 lowercaseString];

  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v12 = [v10 componentsSeparatedByCharactersInSet:v11];

  if ((unint64_t)[v12 count] >= 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 3;
  }
  BOOL v14 = +[CSInstantAnswers isInstantAnswersTriggeringQuery:v12 isCJK:v6 instantAnswerQueryMinLengthNonCJK:v13 instantAnswerQueryMinLengthCJK:2 isSearchTool:v5];
  double v15 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = CSRedactString(v7, 1);
    int v18 = 138412546;
    v19 = v16;
    __int16 v20 = 1024;
    BOOL v21 = v14;
    _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_DEFAULT, "[instant answers][query] For searchString = %@, isInstantAnswersTriggeringQuery = %d", (uint8_t *)&v18, 0x12u);
  }
  return v14;
}

+ (id)overrideTokens
{
  if (overrideTokens_onceToken != -1) {
    dispatch_once(&overrideTokens_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)overrideTokens_overrideTriggerPhraseSet;

  return v2;
}

uint64_t __34__CSInstantAnswers_overrideTokens__block_invoke()
{
  overrideTokens_overrideTriggerPhraseSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"delta", @"motel", @"inn", @"resort", @"date:", @"subject:", @"from:", @"to:", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)flightTriggerPhrases
{
  if (flightTriggerPhrases_onceToken != -1) {
    dispatch_once(&flightTriggerPhrases_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)flightTriggerPhrases_flightTriggerPhraseSet;

  return v2;
}

uint64_t __40__CSInstantAnswers_flightTriggerPhrases__block_invoke()
{
  flightTriggerPhrases_flightTriggerPhraseSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"upcoming flight", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)hotelTriggerPhrases
{
  if (hotelTriggerPhrases_onceToken != -1) {
    dispatch_once(&hotelTriggerPhrases_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)hotelTriggerPhrases_hotelTriggerPhraseSet;

  return v2;
}

uint64_t __39__CSInstantAnswers_hotelTriggerPhrases__block_invoke()
{
  hotelTriggerPhrases_hotelTriggerPhraseSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"stay", @"upcoming stay", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)commonTriggerPhrases
{
  if (commonTriggerPhrases_onceToken != -1) {
    dispatch_once(&commonTriggerPhrases_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)commonTriggerPhrases_commonTriggerPhraseSet;

  return v2;
}

uint64_t __40__CSInstantAnswers_commonTriggerPhrases__block_invoke()
{
  commonTriggerPhrases_commonTriggerPhraseSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"checkin", @"check-in", @"check in", @"reservation", @"booking", @"confirmation", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)noInstantAnswersQueries
{
  if (noInstantAnswersQueries_onceToken != -1) {
    dispatch_once(&noInstantAnswersQueries_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)noInstantAnswersQueries_noInstantAnswersQueriesSet;

  return v2;
}

uint64_t __43__CSInstantAnswers_noInstantAnswersQueries__block_invoke()
{
  noInstantAnswersQueries_noInstantAnswersQueriesSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"from", @"to", @"date", @"subject", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)flightIntentTokens
{
  if (flightIntentTokens_onceToken != -1) {
    dispatch_once(&flightIntentTokens_onceToken, &__block_literal_global_76);
  }
  v2 = (void *)flightIntentTokens_flightIntentTokensSet;

  return v2;
}

uint64_t __38__CSInstantAnswers_flightIntentTokens__block_invoke()
{
  flightIntentTokens_flightIntentTokensSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"flight", @"airline", @"airport", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)hotelIntentTokens
{
  if (hotelIntentTokens_onceToken != -1) {
    dispatch_once(&hotelIntentTokens_onceToken, &__block_literal_global_87);
  }
  v2 = (void *)hotelIntentTokens_hotelIntentTokensSet;

  return v2;
}

uint64_t __37__CSInstantAnswers_hotelIntentTokens__block_invoke()
{
  hotelIntentTokens_hotelIntentTokensSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hotel", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)flightStopWords
{
  if (flightStopWords_onceToken != -1) {
    dispatch_once(&flightStopWords_onceToken, &__block_literal_global_92_0);
  }
  v2 = (void *)flightStopWords_flightStopWordsSet;

  return v2;
}

uint64_t __35__CSInstantAnswers_flightStopWords__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"checkin", @"check-in", @"reservation", @"time", @"info", @"information", @"departure", @"departing", @"itinerary", @"arrival", @"arriving", @"ticket", @"eticket", @"booking", @"depart", @"book", @"confirm",
    @"confirmation",
    @"modify",
    @"status",
  flightStopWords_flightStopWordsSet = 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)hotelStopWords
{
  if (hotelStopWords_onceToken != -1) {
    dispatch_once(&hotelStopWords_onceToken, &__block_literal_global_139);
  }
  v2 = (void *)hotelStopWords_hotelStopWordsSet;

  return v2;
}

uint64_t __34__CSInstantAnswers_hotelStopWords__block_invoke()
{
  hotelStopWords_hotelStopWordsSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"checkin", @"check-in", @"reservation", @"time", @"info", @"information", @"booking", @"stay", @"book", @"confirm", @"confirmation", @"modify", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)commonStopWords
{
  if (commonStopWords_onceToken != -1) {
    dispatch_once(&commonStopWords_onceToken, &__block_literal_global_141);
  }
  v2 = (void *)commonStopWords_commonStopWordsSet;

  return v2;
}

uint64_t __35__CSInstantAnswers_commonStopWords__block_invoke()
{
  commonStopWords_commonStopWordsSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"checkin", @"check-in", @"reservation", @"departure", @"departing", @"itinerary", @"arrival", @"arriving", @"ticket", @"eticket", @"booking", @"depart", @"book", @"confirm", @"confirmation", @"stay", 0);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isInstantAnswersTriggeringQuery:(id)a3 isCJK:(BOOL)a4 instantAnswerQueryMinLengthNonCJK:(int64_t)a5 instantAnswerQueryMinLengthCJK:(int64_t)a6 isSearchTool:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = [v11 valueForKeyPath:@"@max.length"];
  int64_t v13 = [v12 integerValue];

  BOOL v14 = [v11 valueForKeyPath:@"@min.length"];
  uint64_t v15 = [v14 integerValue];

  double v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"length <= %d AND NOT SELF MATCHES %@", v15, @"[&$@_,.]+"];
  BOOL v17 = [v11 filteredArrayUsingPredicate:v16];

  uint64_t v18 = [v17 count];
  v19 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v23 = v10;
    __int16 v24 = 2048;
    int64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = v15;
    __int16 v28 = 1024;
    BOOL v29 = v18 == 0;
    _os_log_impl(&dword_18D0E3000, v19, OS_LOG_TYPE_DEFAULT, "[instant answers][query] triggering condition values: isCJK=%d, maxTokenLength=%ld, minTokenLength=%ld, allMinLengthTokensAreSymbols=%d", buf, 0x22u);
  }

  if (v10)
  {
    BOOL v20 = v13 < a6 || v15 <= 0;
  }
  else
  {
    if (v7) {
      return v13 >= a5;
    }
    if (v13 < a5) {
      return 0;
    }
    if (v18) {
      BOOL v20 = v15 <= 1;
    }
    else {
      BOOL v20 = 0;
    }
  }
  return !v20;
}

+ (id)selectInstantAnswersEventsWithFoundEvents:(id)a3 forDate:(id)a4 isSearchToolQuery:(BOOL)a5
{
  BOOL v215 = a5;
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  v213 = v7;
  v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v229 = (uint64_t)v213;
    _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selecting Instant Answers for query date %@", buf, 0xCu);
  }

  id v211 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v207 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v210 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v204 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v209 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v205 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v208 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v223 objects:v236 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v224;
    v203 = &v233;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v224 != v11) {
          objc_enumerationMutation(obj);
        }
        int64_t v13 = *(void **)(*((void *)&v223 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "attributeSet", v203);
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v15 = (void *)v14;
        double v16 = [v13 attributeSet];
        BOOL v17 = [v16 eventType];
        int v18 = [v17 isEqualToString:@"flight"];

        if (v18)
        {
          v19 = [v13 attributeSet];
          BOOL v20 = [v19 flightDepartureDateTime];

          if (v20)
          {
            BOOL v21 = [v13 attributeSet];
            uint64_t v22 = [v21 flightDepartureDateTime];
            BOOL v23 = [v13 attributeSet];
            [v23 setStartDate:v22];
          }
          __int16 v24 = [v13 attributeSet];
          int64_t v25 = [v24 flightArrivalDateTime];

          if (v25)
          {
            __int16 v26 = [v13 attributeSet];
            uint64_t v27 = [v26 flightArrivalDateTime];
            __int16 v28 = [v13 attributeSet];
            [v28 setEndDate:v27];
          }
          if (!+[CSInstantAnswers eventHasValidRequiredFields:v13])
          {
            __int16 v82 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = [v13 attributeSet];
              uint64_t v84 = [v83 flightNumber];
              v85 = CSRedactString(v84, 1);
              *(_DWORD *)buf = 138412290;
              uint64_t v229 = (uint64_t)v85;
              _os_log_impl(&dword_18D0E3000, v82, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved flight event for flightNumber = %@  was not added to candidate events", buf, 0xCu);
            }
            BOOL v29 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:]((uint64_t)v235, (uint64_t)v13);
            }
            goto LABEL_62;
          }
          BOOL v29 = [v13 attributeSet];
          uint64_t v30 = [v29 startDate];
          if (v30)
          {
            v31 = (void *)v30;
            v32 = [v13 attributeSet];
            v33 = [v32 startDate];
            if ([v33 compare:v213] == 1)
            {
              BOOL v34 = +[CSInstantAnswers eventIsInFarFuture:v13 queryDate:v213];

              if (v34) {
                goto LABEL_63;
              }
              v35 = v211;
LABEL_49:
              [v35 addObject:v13];
              goto LABEL_63;
            }
            goto LABEL_60;
          }
        }
        else
        {
LABEL_21:
          uint64_t v36 = [v13 attributeSet];
          if (!v36) {
            goto LABEL_167;
          }
          char v37 = (void *)v36;
          v38 = [v13 attributeSet];
          int v39 = [v38 eventType];
          int v40 = [v39 isEqualToString:@"hotel"];

          if (v40)
          {
            v41 = [v13 attributeSet];
            v42 = [v41 hotelCheckinDate];

            if (v42)
            {
              uint64_t v43 = [v13 attributeSet];
              v44 = [v43 hotelCheckinDate];
              v45 = [v13 attributeSet];
              [v45 setStartDate:v44];
            }
            uint64_t v46 = [v13 attributeSet];
            v47 = [v46 hotelCheckinTime];

            if (v47)
            {
              v48 = [v13 attributeSet];
              v49 = [v48 hotelCheckinTime];
              v50 = [v13 attributeSet];
              [v50 setStartDate:v49];
            }
            v51 = [v13 attributeSet];
            v52 = [v51 hotelCheckoutDate];

            if (v52)
            {
              v53 = [v13 attributeSet];
              v54 = [v53 hotelCheckoutDate];
              v55 = [v13 attributeSet];
              [v55 setEndDate:v54];
            }
            v56 = [v13 attributeSet];
            v57 = [v56 hotelCheckoutTime];

            if (v57)
            {
              v58 = [v13 attributeSet];
              v59 = [v58 hotelCheckoutTime];
              v60 = [v13 attributeSet];
              [v60 setEndDate:v59];
            }
            if (!+[CSInstantAnswers eventHasValidRequiredFields:v13])
            {
              v86 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                v87 = [v13 attributeSet];
                v88 = [v87 hotelReservationId];
                v89 = CSRedactString(v88, 1);
                *(_DWORD *)buf = 138412290;
                uint64_t v229 = (uint64_t)v89;
                _os_log_impl(&dword_18D0E3000, v86, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved hotel event for reservationID = %@ was not added to candidate events", buf, 0xCu);
              }
              BOOL v29 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:]((uint64_t)v234, (uint64_t)v13);
              }
              goto LABEL_62;
            }
            BOOL v29 = [v13 attributeSet];
            uint64_t v61 = [v29 startDate];
            if (v61)
            {
              v31 = (void *)v61;
              v32 = [v13 attributeSet];
              v33 = [v32 startDate];
              if ([v33 compare:v213] != -1)
              {
                BOOL v62 = +[CSInstantAnswers eventIsInFarFuture:v13 queryDate:v213];

                if (v62) {
                  goto LABEL_63;
                }
                v35 = v210;
                goto LABEL_49;
              }
LABEL_60:

LABEL_61:
            }
          }
          else
          {
            if (!_os_feature_enabled_impl()) {
              goto LABEL_50;
            }
            if (!v215) {
              goto LABEL_50;
            }
            uint64_t v63 = [v13 attributeSet];
            if (!v63) {
              goto LABEL_50;
            }
LABEL_167:
            BOOL v64 = (void *)v63;
            v65 = [v13 attributeSet];
            BOOL v66 = [v65 eventType];
            int v67 = [v66 isEqualToString:@"restaurant"];

            if (v67)
            {
              v68 = [v13 attributeSet];
              v69 = [v68 restaurantStartDate];

              if (v69)
              {
                v70 = [v13 attributeSet];
                v71 = [v70 restaurantStartDate];
                v72 = [v13 attributeSet];
                [v72 setStartDate:v71];
              }
              v73 = [v13 attributeSet];
              v74 = [v73 restaurantStartTime];

              if (v74)
              {
                v75 = [v13 attributeSet];
                v76 = [v75 restaurantStartTime];
                v77 = [v13 attributeSet];
                [v77 setStartDate:v76];
              }
              if (!+[CSInstantAnswers eventHasValidRequiredFields:v13])
              {
                v90 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  v91 = [v13 attributeSet];
                  v92 = [v91 restaurantReservationId];
                  v93 = CSRedactString(v92, 1);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v229 = (uint64_t)v93;
                  _os_log_impl(&dword_18D0E3000, v90, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved restaurant event for reservationID = %@ was not added to candidate events", buf, 0xCu);
                }
                BOOL v29 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                  +[CSInstantAnswers selectInstantAnswersEventsWithFoundEvents:forDate:isSearchToolQuery:]((uint64_t)v232, (uint64_t)v13);
                }
                goto LABEL_62;
              }
              BOOL v29 = [v13 attributeSet];
              uint64_t v78 = [v29 startDate];
              if (v78)
              {
                v31 = (void *)v78;
                v32 = [v13 attributeSet];
                v33 = [v32 startDate];
                if ([v33 compare:v213] != -1)
                {
                  BOOL v79 = +[CSInstantAnswers eventIsInFarFuture:v13 queryDate:v213];

                  if (v79) {
                    goto LABEL_63;
                  }
                  v35 = v209;
                  goto LABEL_49;
                }
                goto LABEL_60;
              }
            }
            else
            {
LABEL_50:
              BOOL v29 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v80 = [v13 attributeSet];
                v81 = [v80 eventType];
                v31 = CSRedactString(v81, 1);
                *(_DWORD *)buf = 138412290;
                uint64_t v229 = (uint64_t)v31;
                _os_log_impl(&dword_18D0E3000, v29, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Retrieved unsupported event of type = %@", buf, 0xCu);

                goto LABEL_61;
              }
            }
          }
        }
LABEL_62:

LABEL_63:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v94 = [obj countByEnumeratingWithState:&v223 objects:v236 count:16];
      uint64_t v10 = v94;
    }
    while (v94);
  }

  v95 = logForCSLogCategoryDefault();
  v96 = v210;
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v97 = [v211 count];
    uint64_t v98 = [v210 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v229 = v97;
    __int16 v230 = 2048;
    uint64_t v231 = v98;
    _os_log_impl(&dword_18D0E3000, v95, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Post-filtering, received %lu flight candidate and %lu hotel candidate events", buf, 0x16u);
  }

  v99 = v204;
  v100 = v209;
  if (v215)
  {
    v101 = [MEMORY[0x1E4F1CA48] arrayWithArray:v210];
    [v101 addObjectsFromArray:v211];
    [v101 addObjectsFromArray:v209];
    [v101 sortUsingComparator:&__block_literal_global_159];
    v102 = logForCSLogCategoryDefault();
    v103 = v208;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v104 = [v101 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v229 = v104;
      _os_log_impl(&dword_18D0E3000, v102, OS_LOG_TYPE_DEFAULT, "[personal answers][ranking]: SearchTool Query detected. Filtered %lu combined candidate events", buf, 0xCu);
    }

    unint64_t v105 = [v101 count];
    if (v105 >= 0xA) {
      uint64_t v106 = 10;
    }
    else {
      uint64_t v106 = v105;
    }
    objc_msgSend(v101, "subarrayWithRange:", 0, v106);
    id v107 = (id)objc_claimAutoreleasedReturnValue();

    v108 = v207;
    goto LABEL_162;
  }
  if ((unint64_t)[v210 count] < 2)
  {
    unint64_t v109 = 0;
  }
  else
  {
    unint64_t v109 = 0;
    unint64_t v110 = 1;
    do
    {
      v111 = [v210 objectAtIndex:v110];
      v112 = [v111 attributeSet];
      v113 = [v112 startDate];

      v114 = [v210 objectAtIndex:v109];
      v115 = [v114 attributeSet];
      v116 = [v115 startDate];

      v117 = [v210 objectAtIndex:v110];
      v118 = [v117 attributeSet];
      v119 = [v118 hotelReservationId];

      v120 = [v210 objectAtIndex:v109];
      v121 = [v120 attributeSet];
      v122 = [v121 hotelReservationId];

      int64_t v123 = +[CSInstantAnswers _compareEventsWithFirstDateTime:v116 secondDateTime:v113];
      if (v123 == 1 || !v123 && [v119 compare:v122] == -1) {
        unint64_t v109 = v110;
      }

      ++v110;
    }
    while (v110 < [v210 count]);
  }
  if ([v210 count])
  {
    v124 = [v210 objectAtIndex:v109];
    [v204 addObject:v124];
  }
  v125 = v209;
  if ((unint64_t)[v209 count] < 2)
  {
    unint64_t v126 = 0;
  }
  else
  {
    unint64_t v126 = 0;
    unint64_t v127 = 1;
    do
    {
      v128 = [v125 objectAtIndex:v127];
      v129 = [v128 attributeSet];
      v130 = [v129 startDate];

      v131 = [v125 objectAtIndex:v126];
      v132 = [v131 attributeSet];
      v133 = [v132 startDate];

      v134 = [v125 objectAtIndex:v127];
      v135 = [v134 attributeSet];
      v136 = [v135 restaurantReservationId];

      v137 = [v125 objectAtIndex:v126];
      v138 = [v137 attributeSet];
      v139 = [v138 restaurantReservationId];

      int64_t v140 = +[CSInstantAnswers _compareEventsWithFirstDateTime:v133 secondDateTime:v130];
      if (v140 == 1 || !v140 && [v136 compare:v139] == -1) {
        unint64_t v126 = v127;
      }

      ++v127;
      v125 = v209;
    }
    while (v127 < [v209 count]);
  }
  if ([v125 count])
  {
    v141 = [v125 objectAtIndex:v126];
    [v205 addObject:v141];
  }
  [v211 sortUsingComparator:&__block_literal_global_162];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v142 = v211;
  uint64_t v143 = [v142 countByEnumeratingWithState:&v219 objects:v227 count:16];
  v144 = v207;
  v103 = v208;
  if (v143)
  {
    uint64_t v145 = v143;
    uint64_t v146 = *(void *)v220;
    id v206 = v142;
LABEL_103:
    uint64_t v147 = 0;
    while (1)
    {
      if (*(void *)v220 != v146) {
        objc_enumerationMutation(v142);
      }
      v148 = *(void **)(*((void *)&v219 + 1) + 8 * v147);
      if ((unint64_t)[v144 count] > 6) {
        break;
      }
      if (![v144 count]) {
        goto LABEL_110;
      }
      v217 = [v144 lastObject];
      v216 = [v217 attributeSet];
      v149 = [v216 flightArrivalAirportCode];
      v150 = [v148 attributeSet];
      v151 = [v150 flightDepartureAirportCode];
      if (![v149 isEqualToString:v151])
      {

        v103 = v208;
        goto LABEL_112;
      }
      v214 = [v148 attributeSet];
      [v214 startDate];
      v152 = v212 = v149;
      v153 = [v144 lastObject];
      v154 = [v153 attributeSet];
      [v154 endDate];
      uint64_t v155 = v145;
      v157 = uint64_t v156 = v146;
      [v152 timeIntervalSinceDate:v157];
      double v159 = v158;

      uint64_t v146 = v156;
      uint64_t v145 = v155;

      id v142 = v206;
      v144 = v207;

      v96 = v210;
      v103 = v208;
      if (v159 < 86400.0) {
LABEL_110:
      }
        [v144 addObject:v148];
LABEL_112:
      if (v145 == ++v147)
      {
        uint64_t v145 = [v142 countByEnumeratingWithState:&v219 objects:v227 count:16];
        if (v145) {
          goto LABEL_103;
        }
        break;
      }
    }
  }

  v160 = logForCSLogCategoryDefault();
  v99 = v204;
  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v161 = [v207 count];
    uint64_t v162 = [v204 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v229 = v161;
    __int16 v230 = 2048;
    uint64_t v231 = v162;
    _os_log_impl(&dword_18D0E3000, v160, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight and %lu hotel events as candidate Instant Answers", buf, 0x16u);
  }

  uint64_t v163 = [v207 count];
  uint64_t v164 = [v204 count];
  if (v163) {
    uint64_t v165 = (v164 != 0) + 1;
  }
  else {
    uint64_t v165 = v164 != 0;
  }
  if ([v205 count]) {
    unint64_t v166 = v165 + 1;
  }
  else {
    unint64_t v166 = v165;
  }
  if (v166 < 2)
  {
    v108 = v207;
    v100 = v209;
    if ([v207 count])
    {
      v178 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v179 = [v207 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v179;
        _os_log_impl(&dword_18D0E3000, v178, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      v108 = v207;
      [v103 addObjectsFromArray:v207];
    }
    if ([v204 count])
    {
      v180 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v181 = [v204 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v181;
        _os_log_impl(&dword_18D0E3000, v180, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu hotel candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      [v103 addObjectsFromArray:v204];
      v108 = v207;
    }
    if ([v205 count])
    {
      v182 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v183 = [v205 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v183;
        _os_log_impl(&dword_18D0E3000, v182, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu restaurant candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      [v103 addObjectsFromArray:v205];
      v108 = v207;
    }
  }
  else
  {
    id v167 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v207 count])
    {
      v168 = [v207 firstObject];
      [v167 addObject:v168];
    }
    if ([v204 count])
    {
      v169 = [v204 firstObject];
      [v167 addObject:v169];
    }
    if ([v205 count])
    {
      v170 = [v205 firstObject];
      [v167 addObject:v170];
    }
    if ((unint64_t)[v167 count] < 2)
    {
      unint64_t v171 = 0;
    }
    else
    {
      unint64_t v171 = 0;
      unint64_t v172 = 1;
      do
      {
        v173 = [v167 objectAtIndex:v171];
        v174 = +[CSInstantAnswers _extractEventDateToCompare:v173];
        v175 = [v167 objectAtIndex:v172];
        v176 = +[CSInstantAnswers _extractEventDateToCompare:v175];
        int64_t v177 = +[CSInstantAnswers _compareEventsWithFirstDateTime:v174 secondDateTime:v176];

        if (v177 == 1) {
          unint64_t v171 = v172;
        }
        ++v172;
      }
      while (v172 < [v167 count]);
    }
    v184 = [v167 objectAtIndex:v171];
    v185 = [v184 attributeSet];
    v186 = [v185 eventType];
    char v187 = [v186 isEqualToString:@"flight"];

    v103 = v208;
    if (v187)
    {
      v188 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v189 = [v207 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v189;
        _os_log_impl(&dword_18D0E3000, v188, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu flight candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      [v208 addObjectsFromArray:v207];
    }
    v190 = [v167 objectAtIndex:v171];
    v191 = [v190 attributeSet];
    v192 = [v191 eventType];
    int v193 = [v192 isEqualToString:@"hotel"];

    if (v193)
    {
      v194 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v195 = [v204 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v195;
        _os_log_impl(&dword_18D0E3000, v194, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu hotel candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      [v208 addObjectsFromArray:v204];
    }
    v196 = [v167 objectAtIndex:v171];
    v197 = [v196 attributeSet];
    v198 = [v197 eventType];
    int v199 = [v198 isEqualToString:@"restaurant"];

    v100 = v209;
    if (v199)
    {
      v200 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v201 = [v205 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v229 = v201;
        _os_log_impl(&dword_18D0E3000, v200, OS_LOG_TYPE_DEFAULT, "[instant answers][ranking]: Selected %lu restaurant candidate instant answers as final Instant Answers", buf, 0xCu);
      }

      [v208 addObjectsFromArray:v205];
    }

    v108 = v207;
    v99 = v204;
  }
  id v107 = v103;
LABEL_162:

  return v107;
}

uint64_t __88__CSInstantAnswers_selectInstantAnswersEventsWithFoundEvents_forDate_isSearchToolQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 attributeSet];
  id v6 = [v5 startDate];
  id v7 = [v4 attributeSet];

  v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __88__CSInstantAnswers_selectInstantAnswersEventsWithFoundEvents_forDate_isSearchToolQuery___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 attributeSet];
  id v6 = [v5 startDate];
  id v7 = [v4 attributeSet];

  v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

+ (void)_intentForSearchStringTokens:(id)a3 hasFlightIntent:(BOOL *)a4 hasHotelIntent:(BOOL *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = +[CSInstantAnswers flightIntentTokens];
  uint64_t v9 = +[CSInstantAnswers hotelIntentTokens];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (void)v16)) {
          *a4 = 1;
        }
        if ([v9 containsObject:v15]) {
          *a5 = 1;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

+ (id)_removeStopWordsInQueryTokens:(id)a3 stopWords:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v6 containsObject:v13])
        {
          uint64_t v14 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = CSRedactString(v13, 1);
            *(_DWORD *)buf = 138412290;
            int64_t v25 = v15;
            _os_log_impl(&dword_18D0E3000, v14, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: stopWord = %@ skipped", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v14 = [NSString stringWithFormat:@" %@", v13];
          [v7 appendString:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  long long v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  long long v17 = [v7 stringByTrimmingCharactersInSet:v16];

  if ([v17 length]) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)_isNoInstantAnswerQuery:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CSInstantAnswers noInstantAnswersQueries];
  id v5 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  id v6 = [v3 stringByTrimmingCharactersInSet:v5];

  int v7 = [v4 containsObject:v6];
  if (v7)
  {
    id v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = CSRedactString(v3, 1);
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ recognized as a noInstantAnswersQuery", (uint8_t *)&v11, 0xCu);
    }
  }

  return v7;
}

+ (id)_parseSearchStringWithTriggerPhrases:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CSInstantAnswers commonTriggerPhrases];
  if ([v4 containsObject:v3])
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:@"kMDItemEventType=\"flight\" || kMDItemEventType=\"hotel\""];
    id v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = CSRedactString(v3, 1);
      int v18 = 138412546;
      long long v19 = v7;
      __int16 v20 = 2112;
      long long v21 = v5;
      _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched commonTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);
    }
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = +[CSInstantAnswers flightTriggerPhrases];
    if ([v9 containsObject:v3])
    {
      uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"kMDItemEventType=\"flight\""];
      int v11 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = CSRedactString(v3, 1);
        int v18 = 138412546;
        long long v19 = v12;
        __int16 v20 = 2112;
        long long v21 = v10;
        _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched flightTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);
      }
      id v8 = v10;
    }
    else
    {
      uint64_t v13 = +[CSInstantAnswers hotelTriggerPhrases];
      if ([v13 containsObject:v3])
      {
        uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"kMDItemEventType=\"hotel\""];
        uint64_t v15 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = CSRedactString(v3, 1);
          int v18 = 138412546;
          long long v19 = v16;
          __int16 v20 = 2112;
          long long v21 = v14;
          _os_log_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString = %@ matched hotelTriggerPhrase, using %@ as fallback query", (uint8_t *)&v18, 0x16u);
        }
        id v8 = v14;
      }
      else
      {
        id v8 = 0;
      }
    }
  }

  return v8;
}

+ (id)instantAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 isCJK:(BOOL)a5
{
  BOOL v5 = a5;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v10 = [v7 stringByTrimmingCharactersInSet:v9];
  int v11 = [v10 lowercaseString];

  uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v13 = [v11 componentsSeparatedByCharactersInSet:v12];

  unint64_t v14 = [v13 count];
  if (v5)
  {
    BOOL v15 = (unint64_t)[v11 length] < 3;
  }
  else
  {
    if (v14 >= 2) {
      unint64_t v16 = 2;
    }
    else {
      unint64_t v16 = 3;
    }
    BOOL v15 = [v11 length] <= v16;
  }
  if (+[CSInstantAnswers _isNoInstantAnswerQuery:v7])
  {
    long long v17 = 0;
    goto LABEL_21;
  }
  int v18 = +[CSInstantAnswers _parseSearchStringWithTriggerPhrases:v7];
  if (v18)
  {
    long long v19 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = CSRedactString(v18, 1);
      *(_DWORD *)buf = 138412290;
      v53 = v20;
      _os_log_impl(&dword_18D0E3000, v19, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString matched Trigger Phrase, using %@ as fallback", buf, 0xCu);
    }
    v56[0] = v18;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    goto LABEL_13;
  }
  if (v15)
  {
    uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"kMDItemEventFlightDepartureAirportCode=\"%@\"cwd || kMDItemEventFlightArrivalAirportCode=\"%@\"cwd || kMDItemEventFlightCarrier=\"%@\"cwd", v7, v7, v7];
    long long v23 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = CSRedactString(v7, 1);
      int64_t v25 = CSRedactString(v22, 1);
      *(_DWORD *)buf = 138412546;
      v53 = v24;
      __int16 v54 = 2112;
      v55 = v25;
      _os_log_impl(&dword_18D0E3000, v23, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: searchString %@ identified as shortQuery, using %@ as fallback", buf, 0x16u);
    }
    v51 = v22;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    goto LABEL_18;
  }
  unint64_t v28 = [v13 count];
  if (v8 && v28 <= 1)
  {
    BOOL v29 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = CSRedactStringArray(v8, 1);
      *(_DWORD *)buf = 138412290;
      v53 = v30;
      v31 = "[instant answers][fallback query]: searchStringTokens contains < 2 tokens, using  queryComponents = %@ as fallback";
LABEL_32:
      _os_log_impl(&dword_18D0E3000, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    }
  }
  else
  {
    __int16 v49 = 0;
    +[CSInstantAnswers _intentForSearchStringTokens:v13 hasFlightIntent:(char *)&v49 + 1 hasHotelIntent:&v49];
    int v32 = v49;
    if (!HIBYTE(v49) || !(_BYTE)v49)
    {
      if (HIBYTE(v49))
      {
        v33 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D0E3000, v33, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: Flight intent detected", buf, 2u);
        }

        BOOL v34 = +[CSInstantAnswers flightStopWords];
        uint64_t v22 = +[CSInstantAnswers _removeStopWordsInQueryTokens:v13 stopWords:v34];

        int v32 = v49;
      }
      else
      {
        uint64_t v22 = 0;
      }
      if (v32)
      {
        v35 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D0E3000, v35, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: Hotel intent detected", buf, 2u);
        }

        uint64_t v36 = +[CSInstantAnswers hotelStopWords];
        uint64_t v37 = +[CSInstantAnswers _removeStopWordsInQueryTokens:v13 stopWords:v36];

        BOOL v38 = (_BYTE)v49 == 0;
        uint64_t v22 = (void *)v37;
      }
      else
      {
        BOOL v38 = 1;
      }
      if (!HIBYTE(v49) && v38)
      {
        int v39 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D0E3000, v39, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: No intent detected. Checking for common stopwords", buf, 2u);
        }

        int v40 = +[CSInstantAnswers commonStopWords];
        uint64_t v41 = +[CSInstantAnswers _removeStopWordsInQueryTokens:v13 stopWords:v40];

        uint64_t v22 = (void *)v41;
      }
      if (!v8 || v22)
      {
        v44 = (void *)[[NSString alloc] initWithFormat:@"(** = '%@*'cdwt)", v22];
        id v45 = [NSString alloc];
        uint64_t v46 = CSRedactString(v22, 1);
        v47 = (void *)[v45 initWithFormat:@"(** = '%@*'cdwt)", v46];

        v48 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v47;
          _os_log_impl(&dword_18D0E3000, v48, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: fallbackQueryString = %@", buf, 0xCu);
        }

        v50 = v44;
        long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];

        goto LABEL_19;
      }
      v42 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = CSRedactStringArray(v8, 1);
        *(_DWORD *)buf = 138412290;
        v53 = v43;
        _os_log_impl(&dword_18D0E3000, v42, OS_LOG_TYPE_DEFAULT, "[instant answers][fallback query]: modifiedSearchString is nil, Using  queryComponents = %@ as fallback", buf, 0xCu);
      }
      id v26 = v8;
LABEL_18:
      long long v17 = v26;
LABEL_19:

      goto LABEL_20;
    }
    BOOL v29 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = CSRedactStringArray(v8, 1);
      *(_DWORD *)buf = 138412290;
      v53 = v30;
      v31 = "[instant answers][fallback query]: Multiple intents detected. Using  queryComponents = %@ as fallback";
      goto LABEL_32;
    }
  }

  id v21 = v8;
LABEL_13:
  long long v17 = v21;
LABEL_20:

LABEL_21:

  return v17;
}

+ (BOOL)overrideParsedQuery:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v5 = [v3 stringByTrimmingCharactersInSet:v4];
  id v6 = [v5 lowercaseString];

  id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

  uint64_t v9 = +[CSInstantAnswers overrideTokens];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  int v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = ((char *)i + 1))
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v14, (void)v17))
        {
          int v11 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v15 = CSRedactString(v14, 1);
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v15;
            _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEFAULT, "[instant answers][override query]: token = %@ found in overrideTokenSet", buf, 0xCu);
          }
          LOBYTE(v11) = 1;
          goto LABEL_13;
        }
      }
      int v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v11;
}

+ (id)instantAnswersMailboxes:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  BOOL v5 = [v3 predicateWithFormat:@"SELF CONTAINS 'kMDItemMailboxes ='"];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

- (int64_t)instantAnswersKind
{
  return self->_instantAnswersKind;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)fallbackGroupId
{
  return self->_fallbackGroupId;
}

- (NSString)mailMessageId
{
  return self->_mailMessageId;
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantReservationForAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressCountry, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressPostalCode, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressRegion, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForStreetAddress, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForAddress, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_restaurantReservationForName, 0);
  objc_storeStrong((id *)&self->_restaurantTimeZone, 0);
  objc_storeStrong((id *)&self->_restaurantPartySize, 0);
  objc_storeStrong((id *)&self->_restaurantStartDateComponents, 0);
  objc_storeStrong((id *)&self->_restaurantUnderName, 0);
  objc_storeStrong((id *)&self->_restaurantReservationId, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressCountry, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressPostalCode, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressRegion, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_hotelReservationForStreetAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_hotelModifyReservationUrl, 0);
  objc_storeStrong((id *)&self->_hotelReservationForName, 0);
  objc_storeStrong((id *)&self->_hotelTimeZone, 0);
  objc_storeStrong((id *)&self->_hotelCheckoutDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelCheckinDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelUnderName, 0);
  objc_storeStrong((id *)&self->_hotelReservationId, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportAddressSynonyms, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportPostalCode, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCountry, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportRegion, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLocality, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportStreetAddress, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportAddress, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportPostalCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCountry, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportRegion, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLocality, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportStreetAddress, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportAddress, 0);
  objc_storeStrong((id *)&self->_flightConfirmationNumber, 0);
  objc_storeStrong((id *)&self->_flightDepartureTerminal, 0);
  objc_storeStrong((id *)&self->_flightArrivalTerminal, 0);
  objc_storeStrong((id *)&self->_flightPassengerSeatNumbers, 0);
  objc_storeStrong((id *)&self->_flightPassengerNames, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportInternationalNames, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportInternationalNames, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLongitude, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLongitude, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportLatitude, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportLatitude, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportName, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportName, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalTimeZone, 0);
  objc_storeStrong((id *)&self->_flightArrivalDateComponents, 0);
  objc_storeStrong((id *)&self->_flightDepartureTimeZone, 0);
  objc_storeStrong((id *)&self->_flightDepartureDateComponents, 0);
  objc_storeStrong((id *)&self->_flightCarrierCode, 0);
  objc_storeStrong((id *)&self->_flightCarrier, 0);
  objc_storeStrong((id *)&self->_flightStatus, 0);
  objc_storeStrong((id *)&self->_flightBookingInfoUrl, 0);
  objc_storeStrong((id *)&self->_flightCheckInUrl, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_mailMessageId, 0);
  objc_storeStrong((id *)&self->_fallbackGroupId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);

  objc_storeStrong((id *)&self->_messageId, 0);
}

- (id)initFlightAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 attributeSet];

    if (v8)
    {
      v116.receiver = self;
      v116.super_class = (Class)CSInstantAnswers;
      uint64_t v9 = [(CSInstantAnswers *)&v116 init];
      if (v9)
      {
        id v10 = [v6 attributeSet];
        int v11 = [v10 eventMessageIdentifier];
        uint64_t v12 = [v10 eventGroupIdentifier];
        uint64_t v13 = [v10 eventFallbackGroupIdentifier];
        unint64_t v14 = [v10 mailMessageID];
        [(CSInstantAnswers *)v9 initWithMessageId:v11 groupId:v12 fallbackGroupId:v13 mailMessageId:v14 answerAttributes:v7];

        BOOL v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        unint64_t v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
        [v15 setTimeZone:v16];

        uint64_t v17 = [v10 flightNumber];
        flightNumber = v9->_flightNumber;
        v9->_flightNumber = (NSString *)v17;

        long long v19 = (void *)MEMORY[0x1E4F1CB10];
        long long v20 = [v10 flightCheckInUrl];
        uint64_t v21 = [v19 URLWithString:v20];
        flightCheckInUrl = v9->_flightCheckInUrl;
        v9->_flightCheckInUrl = (NSURL *)v21;

        long long v23 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v24 = [v10 flightBookingInfoUrl];
        uint64_t v25 = [v23 URLWithString:v24];
        flightBookingInfoUrl = v9->_flightBookingInfoUrl;
        v9->_flightBookingInfoUrl = (NSURL *)v25;

        uint64_t v27 = [v10 flightStatus];
        flightStatus = v9->_flightStatus;
        v9->_flightStatus = (NSString *)v27;

        uint64_t v29 = [v10 flightCarrier];
        flightCarrier = v9->_flightCarrier;
        v9->_flightCarrier = (NSString *)v29;

        uint64_t v31 = [v10 flightCarrierCode];
        flightCarrierCode = v9->_flightCarrierCode;
        v9->_flightCarrierCode = (NSString *)v31;

        v33 = [v10 flightDepartureTimeZone];

        if (v33)
        {
          BOOL v34 = (void *)MEMORY[0x1E4F1CAF0];
          v35 = [v10 flightDepartureTimeZone];
          uint64_t v36 = [v34 timeZoneWithName:v35];
          flightDepartureTimeZone = v9->_flightDepartureTimeZone;
          v9->_flightDepartureTimeZone = (NSTimeZone *)v36;

          [v15 setTimeZone:v9->_flightDepartureTimeZone];
        }
        BOOL v38 = [v10 startDate];

        if (v38)
        {
          int v39 = [v10 startDate];
          uint64_t v40 = [v15 components:252 fromDate:v39];
          flightDepartureDateComponents = v9->_flightDepartureDateComponents;
          v9->_flightDepartureDateComponents = (NSDateComponents *)v40;
        }
        v42 = [v10 flightArrivalTimeZone];

        if (v42)
        {
          uint64_t v43 = (void *)MEMORY[0x1E4F1CAF0];
          v44 = [v10 flightArrivalTimeZone];
          uint64_t v45 = [v43 timeZoneWithName:v44];
          flightArrivalTimeZone = v9->_flightArrivalTimeZone;
          v9->_flightArrivalTimeZone = (NSTimeZone *)v45;

          [v15 setTimeZone:v9->_flightArrivalTimeZone];
        }
        v47 = [v10 endDate];

        if (v47)
        {
          v48 = [v10 endDate];
          uint64_t v49 = [v15 components:252 fromDate:v48];
          flightArrivalDateComponents = v9->_flightArrivalDateComponents;
          v9->_flightArrivalDateComponents = (NSDateComponents *)v49;
        }
        uint64_t v51 = [v10 flightArrivalAirportCode];
        flightArrivalAirportCode = v9->_flightArrivalAirportCode;
        v9->_flightArrivalAirportCode = (NSString *)v51;

        uint64_t v53 = [v10 flightDepartureAirportCode];
        flightDepartureAirportCode = v9->_flightDepartureAirportCode;
        v9->_flightDepartureAirportCode = (NSString *)v53;

        uint64_t v55 = [v10 flightArrivalAirportName];
        flightArrivalAirportName = v9->_flightArrivalAirportName;
        v9->_flightArrivalAirportName = (NSString *)v55;

        uint64_t v57 = [v10 flightDepartureAirportName];
        flightDepartureAirportName = v9->_flightDepartureAirportName;
        v9->_flightDepartureAirportName = (NSString *)v57;

        uint64_t v59 = [v10 flightArrivalAirportLatitude];
        flightArrivalAirportLatitude = v9->_flightArrivalAirportLatitude;
        v9->_flightArrivalAirportLatitude = (NSNumber *)v59;

        uint64_t v61 = [v10 flightDepartureAirportLatitude];
        flightDepartureAirportLatitude = v9->_flightDepartureAirportLatitude;
        v9->_flightDepartureAirportLatitude = (NSNumber *)v61;

        uint64_t v63 = [v10 flightArrivalAirportLongitude];
        flightArrivalAirportLongitude = v9->_flightArrivalAirportLongitude;
        v9->_flightArrivalAirportLongitude = (NSNumber *)v63;

        uint64_t v65 = [v10 flightDepartureAirportLongitude];
        flightDepartureAirportLongitude = v9->_flightDepartureAirportLongitude;
        v9->_flightDepartureAirportLongitude = (NSNumber *)v65;

        int v67 = [v10 flightArrivalAirportInternationalNames];
        uint64_t v68 = [v67 copy];
        flightArrivalAirportInternationalNames = v9->_flightArrivalAirportInternationalNames;
        v9->_flightArrivalAirportInternationalNames = (NSArray *)v68;

        v70 = [v10 flightDepartureAirportInternationalNames];
        uint64_t v71 = [v70 copy];
        flightDepartureAirportInternationalNames = v9->_flightDepartureAirportInternationalNames;
        v9->_flightDepartureAirportInternationalNames = (NSArray *)v71;

        v73 = [v10 flightPassengerNames];
        uint64_t v74 = [v73 copy];
        flightPassengerNames = v9->_flightPassengerNames;
        v9->_flightPassengerNames = (NSArray *)v74;

        v76 = [v10 flightPassengerSeatNumbers];
        uint64_t v77 = [v76 copy];
        flightPassengerSeatNumbers = v9->_flightPassengerSeatNumbers;
        v9->_flightPassengerSeatNumbers = (NSArray *)v77;

        uint64_t v79 = [v10 flightArrivalTerminal];
        flightArrivalTerminal = v9->_flightArrivalTerminal;
        v9->_flightArrivalTerminal = (NSString *)v79;

        uint64_t v81 = [v10 flightDepartureTerminal];
        flightDepartureTerminal = v9->_flightDepartureTerminal;
        v9->_flightDepartureTerminal = (NSString *)v81;

        uint64_t v83 = [v10 flightConfirmationNumber];
        flightConfirmationNumber = v9->_flightConfirmationNumber;
        v9->_flightConfirmationNumber = (NSString *)v83;

        uint64_t v85 = [v10 flightArrivalAirportAddress];
        flightArrivalAirportAddress = v9->_flightArrivalAirportAddress;
        v9->_flightArrivalAirportAddress = (NSString *)v85;

        uint64_t v87 = [v10 flightArrivalAirportStreetAddress];
        flightArrivalAirportStreetAddress = v9->_flightArrivalAirportStreetAddress;
        v9->_flightArrivalAirportStreetAddress = (NSString *)v87;

        uint64_t v89 = [v10 flightArrivalAirportLocality];
        flightArrivalAirportLocality = v9->_flightArrivalAirportLocality;
        v9->_flightArrivalAirportLocality = (NSString *)v89;

        uint64_t v91 = [v10 flightArrivalAirportRegion];
        flightArrivalAirportRegion = v9->_flightArrivalAirportRegion;
        v9->_flightArrivalAirportRegion = (NSString *)v91;

        uint64_t v93 = [v10 flightArrivalAirportPostalCode];
        flightArrivalAirportPostalCode = v9->_flightArrivalAirportPostalCode;
        v9->_flightArrivalAirportPostalCode = (NSString *)v93;

        uint64_t v95 = [v10 flightArrivalAirportCountry];
        flightArrivalAirportCountry = v9->_flightArrivalAirportCountry;
        v9->_flightArrivalAirportCountry = (NSString *)v95;

        uint64_t v97 = [v10 flightDepartureAirportAddress];
        flightDepartureAirportAddress = v9->_flightDepartureAirportAddress;
        v9->_flightDepartureAirportAddress = (NSString *)v97;

        uint64_t v99 = [v10 flightDepartureAirportStreetAddress];
        flightDepartureAirportStreetAddress = v9->_flightDepartureAirportStreetAddress;
        v9->_flightDepartureAirportStreetAddress = (NSString *)v99;

        uint64_t v101 = [v10 flightDepartureAirportLocality];
        flightDepartureAirportLocality = v9->_flightDepartureAirportLocality;
        v9->_flightDepartureAirportLocality = (NSString *)v101;

        uint64_t v103 = [v10 flightDepartureAirportRegion];
        flightDepartureAirportRegion = v9->_flightDepartureAirportRegion;
        v9->_flightDepartureAirportRegion = (NSString *)v103;

        uint64_t v105 = [v10 flightDepartureAirportPostalCode];
        flightDepartureAirportPostalCode = v9->_flightDepartureAirportPostalCode;
        v9->_flightDepartureAirportPostalCode = (NSString *)v105;

        uint64_t v107 = [v10 flightDepartureAirportCountry];
        flightDepartureAirportCountry = v9->_flightDepartureAirportCountry;
        v9->_flightDepartureAirportCountry = (NSString *)v107;

        unint64_t v109 = [v10 flightArrivalAirportAddressSynonyms];
        uint64_t v110 = [v109 copy];
        flightArrivalAirportAddressSynonyms = v9->_flightArrivalAirportAddressSynonyms;
        v9->_flightArrivalAirportAddressSynonyms = (NSArray *)v110;

        v112 = [v10 flightDepartureAirportAddressSynonyms];
        uint64_t v113 = [v112 copy];
        flightDepartureAirportAddressSynonyms = v9->_flightDepartureAirportAddressSynonyms;
        v9->_flightDepartureAirportAddressSynonyms = (NSArray *)v113;

        v9->_instantAnswersKind = 0;
      }
      self = v9;
      id v8 = self;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSURL)flightCheckInUrl
{
  return self->_flightCheckInUrl;
}

- (NSURL)flightBookingInfoUrl
{
  return self->_flightBookingInfoUrl;
}

- (id)flightStatus
{
  return self->_flightStatus;
}

- (NSString)flightCarrier
{
  return self->_flightCarrier;
}

- (NSString)flightCarrierCode
{
  return self->_flightCarrierCode;
}

- (NSDateComponents)flightDepartureDateComponents
{
  return self->_flightDepartureDateComponents;
}

- (NSTimeZone)flightDepartureTimeZone
{
  return self->_flightDepartureTimeZone;
}

- (NSDateComponents)flightArrivalDateComponents
{
  return self->_flightArrivalDateComponents;
}

- (NSTimeZone)flightArrivalTimeZone
{
  return self->_flightArrivalTimeZone;
}

- (NSString)flightArrivalAirportCode
{
  return self->_flightArrivalAirportCode;
}

- (NSString)flightDepartureAirportCode
{
  return self->_flightDepartureAirportCode;
}

- (NSString)flightArrivalAirportName
{
  return self->_flightArrivalAirportName;
}

- (NSString)flightDepartureAirportName
{
  return self->_flightDepartureAirportName;
}

- (id)flightArrivalAirportLatitude
{
  return self->_flightArrivalAirportLatitude;
}

- (id)flightDepartureAirportLatitude
{
  return self->_flightDepartureAirportLatitude;
}

- (id)flightArrivalAirportLongitude
{
  return self->_flightArrivalAirportLongitude;
}

- (id)flightDepartureAirportLongitude
{
  return self->_flightDepartureAirportLongitude;
}

- (id)flightArrivalAirportInternationalNames
{
  return self->_flightArrivalAirportInternationalNames;
}

- (id)flightDepartureAirportInternationalNames
{
  return self->_flightDepartureAirportInternationalNames;
}

- (NSArray)flightPassengerNames
{
  return self->_flightPassengerNames;
}

- (NSArray)flightPassengerSeatNumbers
{
  return self->_flightPassengerSeatNumbers;
}

- (NSString)flightArrivalTerminal
{
  return self->_flightArrivalTerminal;
}

- (NSString)flightDepartureTerminal
{
  return self->_flightDepartureTerminal;
}

- (NSString)flightConfirmationNumber
{
  return self->_flightConfirmationNumber;
}

- (id)flightArrivalAirportAddress
{
  return self->_flightArrivalAirportAddress;
}

- (id)flightArrivalAirportStreetAddress
{
  return self->_flightArrivalAirportStreetAddress;
}

- (id)flightArrivalAirportLocality
{
  return self->_flightArrivalAirportLocality;
}

- (id)flightArrivalAirportRegion
{
  return self->_flightArrivalAirportRegion;
}

- (id)flightArrivalAirportPostalCode
{
  return self->_flightArrivalAirportPostalCode;
}

- (id)flightArrivalAirportCountry
{
  return self->_flightArrivalAirportCountry;
}

- (id)flightDepartureAirportAddress
{
  return self->_flightDepartureAirportAddress;
}

- (id)flightDepartureAirportStreetAddress
{
  return self->_flightDepartureAirportStreetAddress;
}

- (id)flightDepartureAirportLocality
{
  return self->_flightDepartureAirportLocality;
}

- (id)flightDepartureAirportRegion
{
  return self->_flightDepartureAirportRegion;
}

- (id)flightDepartureAirportPostalCode
{
  return self->_flightDepartureAirportPostalCode;
}

- (id)flightDepartureAirportCountry
{
  return self->_flightDepartureAirportCountry;
}

- (id)flightArrivalAirportAddressSynonyms
{
  return self->_flightArrivalAirportAddressSynonyms;
}

- (id)flightDepartureAirportAddressSynonyms
{
  return self->_flightDepartureAirportAddressSynonyms;
}

- (id)initHotelAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 attributeSet];

    if (v8)
    {
      v85.receiver = self;
      v85.super_class = (Class)CSInstantAnswers;
      uint64_t v9 = [(CSInstantAnswers *)&v85 init];
      if (v9)
      {
        id v80 = v6;
        id v10 = [v6 attributeSet];
        int v11 = [v10 eventMessageIdentifier];
        uint64_t v12 = [v10 eventGroupIdentifier];
        uint64_t v13 = [v10 eventFallbackGroupIdentifier];
        unint64_t v14 = [v10 mailMessageID];
        [(CSInstantAnswers *)v9 initWithMessageId:v11 groupId:v12 fallbackGroupId:v13 mailMessageId:v14 answerAttributes:v7];

        BOOL v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        unint64_t v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
        [v15 setTimeZone:v16];

        uint64_t v17 = [v10 hotelReservationId];
        hotelReservationId = v9->_hotelReservationId;
        v9->_hotelReservationId = (NSString *)v17;

        uint64_t v19 = [v10 hotelUnderName];
        hotelUnderName = v9->_hotelUnderName;
        v9->_hotelUnderName = (NSString *)v19;

        uint64_t v21 = [v10 hotelTimeZone];

        if (v21)
        {
          uint64_t v22 = (void *)MEMORY[0x1E4F1CAF0];
          long long v23 = [v10 hotelTimeZone];
          uint64_t v24 = [v22 timeZoneWithName:v23];
          hotelTimeZone = v9->_hotelTimeZone;
          v9->_hotelTimeZone = (NSTimeZone *)v24;

          [v15 setTimeZone:v9->_hotelTimeZone];
        }
        id v26 = [v10 startDate];

        if (v26)
        {
          uint64_t v27 = [v10 startDate];
          uint64_t v28 = [v15 components:252 fromDate:v27];
          hotelCheckinDateComponents = v9->_hotelCheckinDateComponents;
          v9->_hotelCheckinDateComponents = (NSDateComponents *)v28;
        }
        uint64_t v30 = [v10 endDate];

        if (v30)
        {
          uint64_t v31 = [v10 endDate];
          uint64_t v32 = [v15 components:252 fromDate:v31];
          hotelCheckoutDateComponents = v9->_hotelCheckoutDateComponents;
          v9->_hotelCheckoutDateComponents = (NSDateComponents *)v32;
        }
        BOOL v34 = [v10 hotelReservationForName];

        uint64_t v78 = v15;
        id v79 = v7;
        if (v34)
        {
          uint64_t v35 = [v10 hotelReservationForName];
        }
        else
        {
          uint64_t v36 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = [v10 hotelProvider];
            *(_DWORD *)buf = 138412290;
            uint64_t v93 = v37;
            _os_log_impl(&dword_18D0E3000, v36, OS_LOG_TYPE_DEFAULT, "[instant answers][csinstantanswers]: hotelReservationForName is nil, using hotelProvider (= %@) to populate hotelReservationForName", buf, 0xCu);
          }
          uint64_t v35 = [v10 hotelProvider];
        }
        hotelReservationForName = v9->_hotelReservationForName;
        v9->_hotelReservationForName = (NSString *)v35;

        uint64_t v39 = [v10 hotelModifyReservationUrl];
        hotelModifyReservationUrl = v9->_hotelModifyReservationUrl;
        v9->_hotelModifyReservationUrl = (NSString *)v39;

        uint64_t v41 = [v10 hotelReservationForTelephone];
        hotelReservationForTelephone = v9->_hotelReservationForTelephone;
        v9->_hotelReservationForTelephone = (NSString *)v41;

        uint64_t v43 = [v10 hotelReservationForStreetAddress];
        v44 = (void *)v43;
        if (v43) {
          uint64_t v45 = (__CFString *)v43;
        }
        else {
          uint64_t v45 = &stru_1EDBB3A50;
        }
        objc_storeStrong((id *)&v9->_hotelReservationForStreetAddress, v45);

        uint64_t v46 = [v10 hotelReservationForAddressLocality];
        v47 = (void *)v46;
        if (v46) {
          v48 = (__CFString *)v46;
        }
        else {
          v48 = &stru_1EDBB3A50;
        }
        objc_storeStrong((id *)&v9->_hotelReservationForAddressLocality, v48);

        uint64_t v49 = [v10 hotelReservationForAddressRegion];
        v50 = (void *)v49;
        if (v49) {
          uint64_t v51 = (__CFString *)v49;
        }
        else {
          uint64_t v51 = &stru_1EDBB3A50;
        }
        objc_storeStrong((id *)&v9->_hotelReservationForAddressRegion, v51);

        uint64_t v52 = [v10 hotelReservationForAddressPostalCode];
        uint64_t v53 = (void *)v52;
        if (v52) {
          __int16 v54 = (__CFString *)v52;
        }
        else {
          __int16 v54 = &stru_1EDBB3A50;
        }
        objc_storeStrong((id *)&v9->_hotelReservationForAddressPostalCode, v54);

        uint64_t v55 = [v10 hotelReservationForAddressCountry];
        v56 = (void *)v55;
        if (v55) {
          uint64_t v57 = (__CFString *)v55;
        }
        else {
          uint64_t v57 = &stru_1EDBB3A50;
        }
        objc_storeStrong((id *)&v9->_hotelReservationForAddressCountry, v57);

        v58 = [v10 hotelReservationForAddress];

        if (v58)
        {
          v91[0] = v9->_hotelReservationForName;
          uint64_t v59 = [v10 hotelReservationForAddress];
          v91[1] = v59;
          v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];

          uint64_t v61 = [v10 hotelReservationForAddress];
          hotelReservationForAddress = v9->_hotelReservationForAddress;
          v9->_hotelReservationForAddress = (NSString *)v61;
        }
        else if ([(NSString *)v9->_hotelReservationForStreetAddress isEqualToString:&stru_1EDBB3A50]|| [(NSString *)v9->_hotelReservationForAddressLocality isEqualToString:&stru_1EDBB3A50])
        {
          v60 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          hotelReservationForStreetAddress = v9->_hotelReservationForStreetAddress;
          v87[0] = v9->_hotelReservationForName;
          v87[1] = hotelReservationForStreetAddress;
          long long v88 = *(_OWORD *)&v9->_hotelReservationForAddressLocality;
          hotelReservationForAddressPostalCode = v9->_hotelReservationForAddressPostalCode;
          hotelReservationForAddressCountry = v9->_hotelReservationForAddressCountry;
          v90 = hotelReservationForAddressPostalCode;
          v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:6];
        }
        uint64_t v65 = (NSString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EDBB3A50];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v66 = v60;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v81 objects:v86 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v68; ++i)
            {
              if (*(void *)v82 != v69) {
                objc_enumerationMutation(v66);
              }
              uint64_t v71 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              if (![(NSString *)v65 isEqualToString:&stru_1EDBB3A50])
              {
                if ([v71 isEqualToString:&stru_1EDBB3A50]) {
                  continue;
                }
                [(NSString *)v65 appendString:@","];
              }
              [(NSString *)v65 appendString:v71];
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v81 objects:v86 count:16];
          }
          while (v68);
        }

        v72 = v9->_hotelReservationForAddress;
        v9->_hotelReservationForAddress = v65;
        v73 = v65;

        uint64_t v74 = [v10 hotelReservationForAddressSynonyms];
        uint64_t v75 = [v74 copy];
        hotelReservationForAddressSynonyms = v9->_hotelReservationForAddressSynonyms;
        v9->_hotelReservationForAddressSynonyms = (NSArray *)v75;

        v9->_instantAnswersKind = 1;
        id v7 = v79;
        id v6 = v80;
      }
      self = v9;
      id v8 = self;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)hotelReservationId
{
  return self->_hotelReservationId;
}

- (NSString)hotelUnderName
{
  return self->_hotelUnderName;
}

- (NSDateComponents)hotelCheckinDateComponents
{
  return self->_hotelCheckinDateComponents;
}

- (NSDateComponents)hotelCheckoutDateComponents
{
  return self->_hotelCheckoutDateComponents;
}

- (NSTimeZone)hotelTimeZone
{
  return self->_hotelTimeZone;
}

- (NSString)hotelReservationForName
{
  return self->_hotelReservationForName;
}

- (NSString)hotelModifyReservationUrl
{
  return self->_hotelModifyReservationUrl;
}

- (NSString)hotelReservationForTelephone
{
  return self->_hotelReservationForTelephone;
}

- (NSString)hotelReservationForAddress
{
  return self->_hotelReservationForAddress;
}

- (NSString)hotelReservationForStreetAddress
{
  return self->_hotelReservationForStreetAddress;
}

- (NSString)hotelReservationForAddressLocality
{
  return self->_hotelReservationForAddressLocality;
}

- (NSString)hotelReservationForAddressRegion
{
  return self->_hotelReservationForAddressRegion;
}

- (NSString)hotelReservationForAddressPostalCode
{
  return self->_hotelReservationForAddressPostalCode;
}

- (NSString)hotelReservationForAddressCountry
{
  return self->_hotelReservationForAddressCountry;
}

- (id)hotelReservationForAddressSynonyms
{
  return self->_hotelReservationForAddressSynonyms;
}

- (id)initRestaurantAnswerWithItem:(id)a3 answerAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 attributeSet];

    if (v8)
    {
      v52.receiver = self;
      v52.super_class = (Class)CSInstantAnswers;
      uint64_t v9 = [(CSInstantAnswers *)&v52 init];
      if (v9)
      {
        id v10 = [v6 attributeSet];
        int v11 = [v10 eventMessageIdentifier];
        uint64_t v12 = [v10 eventGroupIdentifier];
        uint64_t v13 = [v10 eventFallbackGroupIdentifier];
        unint64_t v14 = [v10 mailMessageID];
        [(CSInstantAnswers *)v9 initWithMessageId:v11 groupId:v12 fallbackGroupId:v13 mailMessageId:v14 answerAttributes:v7];

        BOOL v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        unint64_t v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
        [v15 setTimeZone:v16];

        uint64_t v17 = [v10 restaurantReservationId];
        restaurantReservationId = v9->_restaurantReservationId;
        v9->_restaurantReservationId = (NSString *)v17;

        uint64_t v19 = [v10 restaurantUnderName];
        restaurantUnderName = v9->_restaurantUnderName;
        v9->_restaurantUnderName = (NSString *)v19;

        uint64_t v21 = [v10 restaurantTimeZone];

        if (v21)
        {
          uint64_t v22 = (void *)MEMORY[0x1E4F1CAF0];
          long long v23 = [v10 restaurantTimeZone];
          uint64_t v24 = [v22 timeZoneWithName:v23];
          restaurantTimeZone = v9->_restaurantTimeZone;
          v9->_restaurantTimeZone = (NSTimeZone *)v24;

          [v15 setTimeZone:v9->_restaurantTimeZone];
        }
        id v26 = [v10 startDate];

        if (v26)
        {
          uint64_t v27 = [v10 startDate];
          uint64_t v28 = [v15 components:252 fromDate:v27];
          restaurantStartDateComponents = v9->_restaurantStartDateComponents;
          v9->_restaurantStartDateComponents = (NSDateComponents *)v28;
        }
        uint64_t v30 = [v10 restaurantPartySize];
        restaurantPartySize = v9->_restaurantPartySize;
        v9->_restaurantPartySize = (NSString *)v30;

        uint64_t v32 = [v10 restaurantReservationForName];
        restaurantReservationForName = v9->_restaurantReservationForName;
        v9->_restaurantReservationForName = (NSString *)v32;

        uint64_t v34 = [v10 restaurantReservationForTelephone];
        restaurantReservationForTelephone = v9->_restaurantReservationForTelephone;
        v9->_restaurantReservationForTelephone = (NSString *)v34;

        uint64_t v36 = [v10 restaurantReservationForAddress];
        restaurantReservationForAddress = v9->_restaurantReservationForAddress;
        v9->_restaurantReservationForAddress = (NSString *)v36;

        uint64_t v38 = [v10 restaurantReservationForStreetAddress];
        restaurantReservationForStreetAddress = v9->_restaurantReservationForStreetAddress;
        v9->_restaurantReservationForStreetAddress = (NSString *)v38;

        uint64_t v40 = [v10 restaurantReservationForAddressLocality];
        restaurantReservationForAddressLocality = v9->_restaurantReservationForAddressLocality;
        v9->_restaurantReservationForAddressLocality = (NSString *)v40;

        uint64_t v42 = [v10 restaurantReservationForAddressRegion];
        restaurantReservationForAddressRegion = v9->_restaurantReservationForAddressRegion;
        v9->_restaurantReservationForAddressRegion = (NSString *)v42;

        uint64_t v44 = [v10 restaurantReservationForAddressPostalCode];
        restaurantReservationForAddressPostalCode = v9->_restaurantReservationForAddressPostalCode;
        v9->_restaurantReservationForAddressPostalCode = (NSString *)v44;

        uint64_t v46 = [v10 restaurantReservationForAddressCountry];
        restaurantReservationForAddressCountry = v9->_restaurantReservationForAddressCountry;
        v9->_restaurantReservationForAddressCountry = (NSString *)v46;

        v48 = [v10 restaurantReservationForAddressSynonyms];
        uint64_t v49 = [v48 copy];
        restaurantReservationForAddressSynonyms = v9->_restaurantReservationForAddressSynonyms;
        v9->_restaurantReservationForAddressSynonyms = (NSArray *)v49;

        v9->_instantAnswersKind = 2;
      }
      self = v9;
      id v8 = self;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)restaurantReservationId
{
  return self->_restaurantReservationId;
}

- (NSString)restaurantUnderName
{
  return self->_restaurantUnderName;
}

- (NSDateComponents)restaurantStartDateComponents
{
  return self->_restaurantStartDateComponents;
}

- (NSString)restaurantPartySize
{
  return self->_restaurantPartySize;
}

- (NSTimeZone)restaurantTimeZone
{
  return self->_restaurantTimeZone;
}

- (NSString)restaurantReservationForName
{
  return self->_restaurantReservationForName;
}

- (NSString)restaurantReservationForTelephone
{
  return self->_restaurantReservationForTelephone;
}

- (NSString)restaurantReservationForAddress
{
  return self->_restaurantReservationForAddress;
}

- (id)restaurantReservationForStreetAddress
{
  return self->_restaurantReservationForStreetAddress;
}

- (id)restaurantReservationForAddressLocality
{
  return self->_restaurantReservationForAddressLocality;
}

- (id)restaurantReservationForAddressRegion
{
  return self->_restaurantReservationForAddressRegion;
}

- (id)restaurantReservationForAddressPostalCode
{
  return self->_restaurantReservationForAddressPostalCode;
}

- (id)restaurantReservationForAddressCountry
{
  return self->_restaurantReservationForAddressCountry;
}

- (id)restaurantReservationForAddressSynonyms
{
  return self->_restaurantReservationForAddressSynonyms;
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_0_6(a1, a2), "attributeSet");
  BOOL v5 = [v4 restaurantReservationId];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  OUTLINED_FUNCTION_1_8(&dword_18D0E3000, v6, v7, "[debug][instant answers][ranking]: Retrieved restaurant event for reservationID = %@ was not added to candidate events");
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_0_6(a1, a2), "attributeSet");
  BOOL v5 = [v4 hotelReservationId];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  OUTLINED_FUNCTION_1_8(&dword_18D0E3000, v6, v7, "[debug][instant answers][ranking]: Retrieved hotel event for reservationID = %@ was not added to candidate events");
}

+ (void)selectInstantAnswersEventsWithFoundEvents:(uint64_t)a1 forDate:(uint64_t)a2 isSearchToolQuery:.cold.3(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_0_6(a1, a2), "attributeSet");
  BOOL v5 = [v4 flightNumber];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  OUTLINED_FUNCTION_1_8(&dword_18D0E3000, v6, v7, "[debug][instant answers][ranking]: Retrieved flight event for flightNumber = %@  was not added to candidate events");
}

@end