@interface MUISearchInstantAnswer
+ (id)log;
+ (id)utcFormatter;
- (NSDateComponents)flightArrivalDateComponents;
- (NSDateComponents)flightDepartureDateComponents;
- (NSDateComponents)hotelCheckinDateComponents;
- (NSDateComponents)hotelCheckoutDateComponents;
- (NSNumber)flightInfoIsLive;
- (NSString)bodyCardSectionID;
- (NSString)buttonsCardSectionID;
- (NSString)fallbackGroupId;
- (NSString)flightArrivalAirportCode;
- (NSString)flightArrivalAirportGate;
- (NSString)flightArrivalAirportTerminal;
- (NSString)flightCarrier;
- (NSString)flightCarrierCode;
- (NSString)flightConfirmationNumber;
- (NSString)flightDepartureAirportCode;
- (NSString)flightDepartureAirportGate;
- (NSString)flightDepartureAirportTerminal;
- (NSString)flightDivertedAirport;
- (NSString)flightNumber;
- (NSString)flightStatus;
- (NSString)groupId;
- (NSString)hotelReservationForAddress;
- (NSString)hotelReservationForAddressLocality;
- (NSString)hotelReservationForName;
- (NSString)hotelReservationForTelephone;
- (NSString)hotelReservationId;
- (NSString)hotelUnderName;
- (NSString)messageId;
- (NSTimeZone)flightArrivalTimeZone;
- (NSTimeZone)flightDepartureTimeZone;
- (NSTimeZone)hotelTimeZone;
- (NSURL)flightBookingInfoUrl;
- (NSURL)flightCheckInUrl;
- (id)initFlightAnswerWithCSInstantAnswer:(id)a3;
- (id)initHotelAnswerWithCSInstantAnswer:(id)a3;
- (int64_t)instantAnswersKind;
- (void)initSearchInstantAnswer:(void *)a1;
- (void)initWithInstantAnswerKind:(void *)a1;
- (void)initWithMessageId:(void *)a3 groupId:(void *)a4 fallbackGroupId:(uint64_t)a5 instantAnswerKind:;
@end

@implementation MUISearchInstantAnswer

+ (id)log
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MUISearchInstantAnswer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v1 = (void *)log_log_8;
  return v1;
}

void __29__MUISearchInstantAnswer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

- (void)initSearchInstantAnswer:(void *)a1
{
  id v9 = a2;
  if (a1)
  {
    id v3 = NSSelectorFromString(&cfstr_Messageid.isa);
    v4 = NSSelectorFromString(&cfstr_Groupid.isa);
    v5 = NSSelectorFromString(&cfstr_Fallbackgroupi.isa);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = [v9 v3];
      v7 = [v9 v4];
      v8 = [v9 v5];
      -[MUISearchInstantAnswer initWithMessageId:groupId:fallbackGroupId:instantAnswerKind:]((uint64_t)a1, v6, v7, v8, [v9 instantAnswersKind]);
    }
    else
    {
      -[MUISearchInstantAnswer initWithInstantAnswerKind:](a1, [v9 instantAnswersKind]);
    }
  }
}

- (void)initWithMessageId:(void *)a3 groupId:(void *)a4 fallbackGroupId:(uint64_t)a5 instantAnswerKind:
{
  id v18 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 240), a2);
    objc_storeStrong((id *)(a1 + 248), a3);
    objc_storeStrong((id *)(a1 + 256), a4);
    *(void *)(a1 + 232) = a5;
    v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];
    v14 = *(void **)(a1 + 264);
    *(void *)(a1 + 264) = v13;

    v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    v17 = *(void **)(a1 + 272);
    *(void *)(a1 + 272) = v16;
  }
}

- (void)initWithInstantAnswerKind:(void *)a1
{
  if (a1)
  {
    a1[29] = a2;
    id v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    v5 = (void *)a1[33];
    a1[33] = v4;

    id v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v8 UUIDString];
    v7 = (void *)a1[34];
    a1[34] = v6;
  }
}

+ (id)utcFormatter
{
  self;
  if (utcFormatter_onceToken != -1) {
    dispatch_once(&utcFormatter_onceToken, &__block_literal_global_30);
  }
  uint64_t v0 = (void *)utcFormatter_utcFormatter;
  return v0;
}

uint64_t __38__MUISearchInstantAnswer_utcFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v1 = utcFormatter_utcFormatter;
  utcFormatter_utcFormatter = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
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

- (NSString)bodyCardSectionID
{
  return self->_bodyCardSectionID;
}

- (NSString)buttonsCardSectionID
{
  return self->_buttonsCardSectionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsCardSectionID, 0);
  objc_storeStrong((id *)&self->_bodyCardSectionID, 0);
  objc_storeStrong((id *)&self->_fallbackGroupId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddressLocality, 0);
  objc_storeStrong((id *)&self->_hotelReservationForAddress, 0);
  objc_storeStrong((id *)&self->_hotelReservationForTelephone, 0);
  objc_storeStrong((id *)&self->_hotelReservationForName, 0);
  objc_storeStrong((id *)&self->_hotelTimeZone, 0);
  objc_storeStrong((id *)&self->_hotelCheckoutDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelCheckinDateComponents, 0);
  objc_storeStrong((id *)&self->_hotelUnderName, 0);
  objc_storeStrong((id *)&self->_hotelReservationId, 0);
  objc_storeStrong((id *)&self->_flightInfoIsLive, 0);
  objc_storeStrong((id *)&self->_flightStatus, 0);
  objc_storeStrong((id *)&self->_flightDivertedAirport, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportGate, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportGate, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportTerminal, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportTerminal, 0);
  objc_storeStrong((id *)&self->_flightConfirmationNumber, 0);
  objc_storeStrong((id *)&self->_flightCarrier, 0);
  objc_storeStrong((id *)&self->_flightBookingInfoUrl, 0);
  objc_storeStrong((id *)&self->_flightArrivalTimeZone, 0);
  objc_storeStrong((id *)&self->_flightDepartureTimeZone, 0);
  objc_storeStrong((id *)&self->_flightCheckInUrl, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_flightDepartureAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalAirportCode, 0);
  objc_storeStrong((id *)&self->_flightArrivalDateComponents, 0);
  objc_storeStrong((id *)&self->_flightDepartureDateComponents, 0);
  objc_storeStrong((id *)&self->_flightCarrierCode, 0);
}

- (id)initFlightAnswerWithCSInstantAnswer:(id)a3
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v164.receiver = self;
  v164.super_class = (Class)MUISearchInstantAnswer;
  v5 = [(MUISearchInstantAnswer *)&v164 init];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_93;
  }
  -[MUISearchInstantAnswer initSearchInstantAnswer:](v5, v4);
  v7 = [v4 flightDepartureDateComponents];
  if (!v7) {
    goto LABEL_94;
  }
  v151 = v6;
  uint64_t v8 = [v4 flightArrivalDateComponents];
  if (!v8) {
    goto LABEL_13;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v4 flightArrivalAirportCode];
  if (!v10)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  id v11 = (void *)v10;
  v12 = [v4 flightArrivalAirportCode];
  if ((unint64_t)[v12 length] < 2
    || ([v4 flightDepartureAirportCode], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_12;
  }
  v14 = (void *)v13;
  v15 = [v4 flightDepartureAirportCode];
  unint64_t v16 = [v15 length];

  if (v16 < 2)
  {
LABEL_14:
    v7 = 0;
    uint64_t v6 = v151;
    goto LABEL_94;
  }
  uint64_t v17 = [v4 flightCarrierCode];
  uint64_t v6 = v151;
  flightCarrierCode = v151->_flightCarrierCode;
  v151->_flightCarrierCode = (NSString *)v17;

  uint64_t v19 = [v4 flightDepartureDateComponents];
  flightDepartureDateComponents = v151->_flightDepartureDateComponents;
  v151->_flightDepartureDateComponents = (NSDateComponents *)v19;

  uint64_t v21 = [v4 flightArrivalDateComponents];
  flightArrivalDateComponents = v151->_flightArrivalDateComponents;
  v151->_flightArrivalDateComponents = (NSDateComponents *)v21;

  uint64_t v23 = [v4 flightArrivalAirportCode];
  flightArrivalAirportCode = v151->_flightArrivalAirportCode;
  v151->_flightArrivalAirportCode = (NSString *)v23;

  uint64_t v25 = [v4 flightDepartureAirportCode];
  flightDepartureAirportCode = v151->_flightDepartureAirportCode;
  v151->_flightDepartureAirportCode = (NSString *)v25;

  uint64_t v27 = [v4 flightNumber];
  flightNumber = v151->_flightNumber;
  v151->_flightNumber = (NSString *)v27;

  uint64_t v29 = [v4 flightCheckInUrl];
  flightCheckInUrl = v151->_flightCheckInUrl;
  v151->_flightCheckInUrl = (NSURL *)v29;

  uint64_t v31 = [v4 flightDepartureTimeZone];
  flightDepartureTimeZone = v151->_flightDepartureTimeZone;
  v151->_flightDepartureTimeZone = (NSTimeZone *)v31;

  uint64_t v33 = [v4 flightArrivalTimeZone];
  flightArrivalTimeZone = v151->_flightArrivalTimeZone;
  v151->_flightArrivalTimeZone = (NSTimeZone *)v33;

  uint64_t v35 = [v4 flightBookingInfoUrl];
  flightBookingInfoUrl = v151->_flightBookingInfoUrl;
  v151->_flightBookingInfoUrl = (NSURL *)v35;

  uint64_t v37 = [v4 flightCarrier];
  flightCarrier = v151->_flightCarrier;
  v151->_flightCarrier = (NSString *)v37;

  uint64_t v39 = [v4 flightConfirmationNumber];
  flightConfirmationNumber = v151->_flightConfirmationNumber;
  v151->_flightConfirmationNumber = (NSString *)v39;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v45 = [NSNumber numberWithBool:0];
    flightInfoIsLive = v151->_flightInfoIsLive;
    v151->_flightInfoIsLive = (NSNumber *)v45;

    uint64_t v47 = [v4 flightDepartureDateComponents];
    v48 = v151->_flightDepartureDateComponents;
    v151->_flightDepartureDateComponents = (NSDateComponents *)v47;

    uint64_t v49 = [v4 flightArrivalDateComponents];
    v50 = v151->_flightArrivalDateComponents;
    v151->_flightArrivalDateComponents = (NSDateComponents *)v49;

LABEL_93:
    v7 = v6;
    goto LABEL_94;
  }
  p_flightArrivalDateComponents = (id *)&v151->_flightArrivalDateComponents;
  id v41 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v136 = *MEMORY[0x1E4F1C318];
  v42 = objc_msgSend(v41, "initWithCalendarIdentifier:");
  v43 = [v4 flightDepartureTimeZone];

  if (v43)
  {
    uint64_t v44 = [v4 flightDepartureTimeZone];
  }
  else
  {
    v51 = +[MUISearchInstantAnswer log]();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDCDB000, v51, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] Received nil flightDepartureTimeZone, using UTC timeZone to initialize Calendar", buf, 2u);
    }

    uint64_t v44 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  }
  v52 = (void *)v44;
  [v42 setTimeZone:v44];

  v53 = [v4 flightDepartureDateComponents];
  uint64_t v54 = [v42 dateFromComponents:v53];

  v55 = (void *)MEMORY[0x1E4F73E60];
  v56 = [v4 flightCarrierCode];
  v57 = [v4 flightNumber];
  v140 = (void *)v54;
  v58 = [v55 flightInformationWithAirlineCode:v56 flightNumber:v57 flightDate:v54];

  v59 = +[MUISearchInstantAnswer log]();
  BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
  if (v58)
  {
    p_flightCheckInUrl = (id *)&v151->_flightCheckInUrl;
    location = (id *)&v151->_flightDepartureDateComponents;
    v138 = v42;
    v139 = v4;
    uint64_t v6 = v151;
    if (v60)
    {
      uint64_t v61 = [v58 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v169 = v61;
      _os_log_impl(&dword_1DDCDB000, v59, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found %lu events from flights api response", buf, 0xCu);
    }

    id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    v137 = v58;
    obuint64_t j = v58;
    uint64_t v145 = [obj countByEnumeratingWithState:&v160 objects:v167 count:16];
    if (v145)
    {
      uint64_t v143 = *(void *)v161;
      do
      {
        uint64_t v62 = 0;
        do
        {
          if (*(void *)v161 != v143) {
            objc_enumerationMutation(obj);
          }
          uint64_t v147 = v62;
          v63 = objc_msgSend(*(id *)(*((void *)&v160 + 1) + 8 * v62), "objectForKey:", @"legs", p_flightCheckInUrl, location, p_flightArrivalDateComponents);
          v64 = v63;
          if (v63)
          {
            long long v158 = 0u;
            long long v159 = 0u;
            long long v156 = 0u;
            long long v157 = 0u;
            uint64_t v65 = [v63 countByEnumeratingWithState:&v156 objects:v166 count:16];
            if (v65)
            {
              uint64_t v66 = v65;
              uint64_t v67 = *(void *)v157;
              do
              {
                for (uint64_t i = 0; i != v66; ++i)
                {
                  if (*(void *)v157 != v67) {
                    objc_enumerationMutation(v64);
                  }
                  v69 = *(void **)(*((void *)&v156 + 1) + 8 * i);
                  v70 = [v69 objectForKey:@"departureAirport"];
                  v71 = v70;
                  if (v70)
                  {
                    v72 = [v70 objectForKey:@"code"];
                    v73 = v72;
                    if (v72)
                    {
                      if ([v72 isEqualToString:v6->_flightDepartureAirportCode])
                      {
                        uint64_t v74 = [v69 objectForKey:@"departureActualTime"];
                        if (v74)
                        {
                          v75 = (void *)v74;
                          v76 = [v69 objectForKey:@"arrivalActualTime"];

                          if (v76) {
                            [v149 addObject:v69];
                          }
                          uint64_t v6 = v151;
                        }
                      }
                    }
                    else
                    {
                      v77 = +[MUISearchInstantAnswer log]();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1DDCDB000, v77, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found flight leg with no departure airport code", buf, 2u);
                      }
                    }
                  }
                  else
                  {
                    v73 = +[MUISearchInstantAnswer log]();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1DDCDB000, v73, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found flight leg with no departure airport", buf, 2u);
                    }
                  }
                }
                uint64_t v66 = [v64 countByEnumeratingWithState:&v156 objects:v166 count:16];
              }
              while (v66);
            }
          }

          uint64_t v62 = v147 + 1;
        }
        while (v147 + 1 != v145);
        uint64_t v145 = [obj countByEnumeratingWithState:&v160 objects:v167 count:16];
      }
      while (v145);
    }

    v78 = +[MUISearchInstantAnswer log]();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v79 = [v149 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v169 = v79;
      _os_log_impl(&dword_1DDCDB000, v78, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] found %lu flight legs with same departure airport and date", buf, 0xCu);
    }

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v80 = v149;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v152 objects:v165 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      v83 = 0;
      uint64_t v84 = *(void *)v153;
      double v85 = 1.79769313e308;
      do
      {
        for (uint64_t j = 0; j != v82; ++j)
        {
          if (*(void *)v153 != v84) {
            objc_enumerationMutation(v80);
          }
          v87 = *(void **)(*((void *)&v152 + 1) + 8 * j);
          v88 = objc_msgSend(v87, "objectForKey:", @"departurePublishedTime", p_flightCheckInUrl);
          if (v88)
          {
            objc_opt_class();
            v89 = +[MUISearchInstantAnswer utcFormatter]();
            v90 = [v89 dateFromString:v88];

            if (v90 && ([v90 timeIntervalSinceDate:v140], double v92 = fabs(v91), v92 <= v85))
            {
              id v93 = v87;

              v83 = v93;
            }
            else
            {
              double v92 = v85;
            }

            double v85 = v92;
          }
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v152 objects:v165 count:16];
      }
      while (v82);

      if (v80)
      {
        v42 = v138;
        id v4 = v139;
        uint64_t v6 = v151;
        v58 = v137;
        if (v83)
        {
          uint64_t v94 = [v83 objectForKey:@"departureActualTime"];
          uint64_t v95 = [v83 objectForKey:@"arrivalActualTime"];
          objc_opt_class();
          v96 = +[MUISearchInstantAnswer utcFormatter]();
          id obja = (id)v94;
          uint64_t v97 = [v96 dateFromString:v94];

          objc_opt_class();
          v98 = +[MUISearchInstantAnswer utcFormatter]();
          v99 = [v98 dateFromString:v95];

          v100 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v136];
          v101 = [v139 flightDepartureTimeZone];
          [v100 setTimeZone:v101];

          id v150 = [v100 components:252 fromDate:v97];
          v102 = [v139 flightArrivalTimeZone];
          [v100 setTimeZone:v102];

          v144 = v100;
          v103 = [v100 components:252 fromDate:v99];
          v104 = +[MUISearchInstantAnswer log]();
          BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT);
          v146 = (void *)v97;
          v148 = (void *)v95;
          if (v97 && v99)
          {
            if (v105)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DDCDB000, v104, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] successfully updated flight instant answer with live info.", buf, 2u);
            }

            uint64_t v106 = [NSNumber numberWithBool:1];
            v107 = v151->_flightInfoIsLive;
            v151->_flightInfoIsLive = (NSNumber *)v106;

            objc_storeStrong(location, v150);
            objc_storeStrong(p_flightArrivalDateComponents, v103);
            uint64_t v108 = [v83 objectForKey:@"departureTerminal"];
            flightDepartureAirportTerminal = v151->_flightDepartureAirportTerminal;
            v151->_flightDepartureAirportTerminal = (NSString *)v108;

            uint64_t v110 = [v83 objectForKey:@"arrivalTerminal"];
            flightArrivalAirportTerminal = v151->_flightArrivalAirportTerminal;
            v151->_flightArrivalAirportTerminal = (NSString *)v110;

            uint64_t v112 = [v83 objectForKey:@"departureGate"];
            flightDepartureAirportGate = v151->_flightDepartureAirportGate;
            v151->_flightDepartureAirportGate = (NSString *)v112;

            uint64_t v114 = [v83 objectForKey:@"arrivalGate"];
            flightArrivalAirportGate = v151->_flightArrivalAirportGate;
            v151->_flightArrivalAirportGate = (NSString *)v114;

            uint64_t v116 = [v83 objectForKey:@"divertedAirport"];
            flightDivertedAirport = v151->_flightDivertedAirport;
            v151->_flightDivertedAirport = (NSString *)v116;

            uint64_t v118 = [v83 objectForKey:@"status"];
            flightStatus = v151->_flightStatus;
            v151->_flightStatus = (NSString *)v118;

            v120 = [v83 objectForKey:@"carrierWebsite"];
            v121 = obja;
            if (v120 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v122 = [MEMORY[0x1E4F1CB10] URLWithString:v120];
              if (v122 && !*p_flightCheckInUrl) {
                objc_storeStrong(p_flightCheckInUrl, v122);
              }
            }
            else
            {
              v122 = 0;
            }
          }
          else
          {
            if (v105)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DDCDB000, v104, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] flightDepartureActualDate or flightArrivalActualDate is nil, skipping live info. update", buf, 2u);
            }

            uint64_t v131 = [NSNumber numberWithBool:0];
            v122 = v151->_flightInfoIsLive;
            v151->_flightInfoIsLive = (NSNumber *)v131;
            v121 = obja;
          }

          int v126 = 0;
          uint64_t v6 = v151;
LABEL_91:

          goto LABEL_92;
        }
LABEL_82:
        v127 = +[MUISearchInstantAnswer log]();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDCDB000, v127, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] no matching leg was found from flights api response", buf, 2u);
        }

        uint64_t v128 = [NSNumber numberWithBool:0];
        v129 = v6->_flightInfoIsLive;
        v6->_flightInfoIsLive = (NSNumber *)v128;

        v130 = v6;
        int v126 = 1;
        goto LABEL_91;
      }
      id v4 = v139;
      uint64_t v6 = v151;
    }
    else
    {

      v83 = 0;
      id v4 = v139;
    }
    v58 = v137;
    v42 = v138;
    goto LABEL_82;
  }
  uint64_t v6 = v151;
  if (v60)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDCDB000, v59, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] flights api response is nil, skipping live info. update", buf, 2u);
  }

  uint64_t v123 = [NSNumber numberWithBool:0];
  v124 = v151->_flightInfoIsLive;
  v151->_flightInfoIsLive = (NSNumber *)v123;

  v125 = v151;
  v83 = 0;
  int v126 = 1;
LABEL_92:

  v7 = v6;
  if (!v126) {
    goto LABEL_93;
  }
LABEL_94:

  return v7;
}

- (NSString)flightCarrierCode
{
  return self->_flightCarrierCode;
}

- (NSDateComponents)flightDepartureDateComponents
{
  return self->_flightDepartureDateComponents;
}

- (NSDateComponents)flightArrivalDateComponents
{
  return self->_flightArrivalDateComponents;
}

- (NSString)flightArrivalAirportCode
{
  return self->_flightArrivalAirportCode;
}

- (NSString)flightDepartureAirportCode
{
  return self->_flightDepartureAirportCode;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSURL)flightCheckInUrl
{
  return self->_flightCheckInUrl;
}

- (NSTimeZone)flightDepartureTimeZone
{
  return self->_flightDepartureTimeZone;
}

- (NSTimeZone)flightArrivalTimeZone
{
  return self->_flightArrivalTimeZone;
}

- (NSURL)flightBookingInfoUrl
{
  return self->_flightBookingInfoUrl;
}

- (NSString)flightCarrier
{
  return self->_flightCarrier;
}

- (NSString)flightConfirmationNumber
{
  return self->_flightConfirmationNumber;
}

- (NSString)flightDepartureAirportTerminal
{
  return self->_flightDepartureAirportTerminal;
}

- (NSString)flightArrivalAirportTerminal
{
  return self->_flightArrivalAirportTerminal;
}

- (NSString)flightDepartureAirportGate
{
  return self->_flightDepartureAirportGate;
}

- (NSString)flightArrivalAirportGate
{
  return self->_flightArrivalAirportGate;
}

- (NSString)flightDivertedAirport
{
  return self->_flightDivertedAirport;
}

- (NSString)flightStatus
{
  return self->_flightStatus;
}

- (NSNumber)flightInfoIsLive
{
  return self->_flightInfoIsLive;
}

- (id)initHotelAnswerWithCSInstantAnswer:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MUISearchInstantAnswer;
  v5 = [(MUISearchInstantAnswer *)&v32 init];
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_11:
    v7 = v6;
    goto LABEL_12;
  }
  -[MUISearchInstantAnswer initSearchInstantAnswer:](v5, v4);
  v7 = [v4 hotelCheckinDateComponents];
  if (v7)
  {
    uint64_t v8 = [v4 hotelReservationForName];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [v4 hotelReservationForName];
      unint64_t v11 = [v10 length];

      if (v11 >= 2)
      {
        uint64_t v12 = [v4 hotelReservationId];
        hotelReservationId = v6->_hotelReservationId;
        v6->_hotelReservationId = (NSString *)v12;

        uint64_t v14 = [v4 hotelUnderName];
        hotelUnderName = v6->_hotelUnderName;
        v6->_hotelUnderName = (NSString *)v14;

        uint64_t v16 = [v4 hotelCheckinDateComponents];
        hotelCheckinDateComponents = v6->_hotelCheckinDateComponents;
        v6->_hotelCheckinDateComponents = (NSDateComponents *)v16;

        uint64_t v18 = [v4 hotelCheckoutDateComponents];
        hotelCheckoutDateComponents = v6->_hotelCheckoutDateComponents;
        v6->_hotelCheckoutDateComponents = (NSDateComponents *)v18;

        uint64_t v20 = [v4 hotelTimeZone];
        hotelTimeZone = v6->_hotelTimeZone;
        v6->_hotelTimeZone = (NSTimeZone *)v20;

        uint64_t v22 = [v4 hotelReservationForName];
        hotelReservationForName = v6->_hotelReservationForName;
        v6->_hotelReservationForName = (NSString *)v22;

        uint64_t v24 = [v4 hotelReservationForTelephone];
        hotelReservationForTelephone = v6->_hotelReservationForTelephone;
        v6->_hotelReservationForTelephone = (NSString *)v24;

        uint64_t v26 = [v4 hotelReservationForAddress];
        hotelReservationForAddress = v6->_hotelReservationForAddress;
        v6->_hotelReservationForAddress = (NSString *)v26;

        v28 = NSSelectorFromString(&cfstr_Hotelreservati.isa);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v29 = [v4 v28];
          hotelReservationForAddressLocality = v6->_hotelReservationForAddressLocality;
          v6->_hotelReservationForAddressLocality = (NSString *)v29;
        }
        else
        {
          hotelReservationForAddressLocality = v6->_hotelReservationForAddressLocality;
          v6->_hotelReservationForAddressLocality = (NSString *)&stru_1F39CB5D8;
        }

        goto LABEL_11;
      }
    }
    else
    {
    }
    v7 = 0;
  }
LABEL_12:

  return v7;
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

- (NSString)hotelReservationForTelephone
{
  return self->_hotelReservationForTelephone;
}

- (NSString)hotelReservationForAddress
{
  return self->_hotelReservationForAddress;
}

- (NSString)hotelReservationForAddressLocality
{
  return self->_hotelReservationForAddressLocality;
}

@end