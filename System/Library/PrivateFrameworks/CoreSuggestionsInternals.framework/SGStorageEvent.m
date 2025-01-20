@interface SGStorageEvent
+ (id)_dateForUTCDate:(id)a3 withTimeZone:(id)a4;
+ (id)storageEventFromEntity:(id)a3;
- (BOOL)curated;
- (BOOL)heuristicUpdatingEnabled;
- (BOOL)isAllDay;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStorageEvent:(id)a3;
- (BOOL)isFromDataDetectors;
- (NSArray)locations;
- (NSData)structuredData;
- (NSSet)tags;
- (NSString)content;
- (NSString)description;
- (NSString)opaqueKey;
- (NSString)sourceKey;
- (NSString)title;
- (SGDuplicateKey)duplicateKey;
- (SGRecordId)recordId;
- (SGSimpleTimeRange)when;
- (SGStorageEvent)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 content:(id)a6 title:(id)a7 creationTimestamp:(SGUnixTimestamp_)a8 lastModifiedTimestamp:(SGUnixTimestamp_)a9 tags:(id)a10 when:(id)a11 locations:(id)a12 structuredData:(id)a13 state:(unsigned int)a14 curated:(BOOL)a15;
- (SGUnixTimestamp_)creationTimestamp;
- (SGUnixTimestamp_)lastModifiedTimestamp;
- (id)_adjustLocalDateToUTC:(id)a3;
- (id)_dateWithoutTimezoneFromString:(id)a3;
- (id)attributeSetForEvent;
- (id)convertToEvent:(id)a3;
- (id)convertToEventWithOrigin:(id)a3;
- (id)extraKeyTag;
- (id)fieldsToSaveOnConfirmation;
- (id)geocodeEndDate;
- (id)geocodeEndTimeZone;
- (id)geocodeStartDate;
- (id)geocodeStartTimeZone;
- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7;
- (id)loggingIdentifier;
- (id)poiFilters;
- (id)urlFromTags;
- (unint64_t)geocodingMode;
- (unint64_t)hash;
- (unsigned)state;
@end

@implementation SGStorageEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredData, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

- (BOOL)curated
{
  return self->_curated;
}

- (unsigned)state
{
  return self->_state;
}

- (NSData)structuredData
{
  return self->_structuredData;
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSArray)locations
{
  return self->_locations;
}

- (SGSimpleTimeRange)when
{
  return self->_when;
}

- (SGUnixTimestamp_)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (id)_adjustLocalDateToUTC:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_opt_class();
    v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    v6 = [v4 _dateForUTCDate:v3 withTimeZone:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_dateWithoutTimezoneFromString:(id)a3
{
  if (a3)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1C9D8], "sg_dateComponentsFromISO8601String:");
    v4 = v3;
    if (v3)
    {
      [v3 setTimeZone:0];
      id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      [v6 setTimeZone:v7];

      v8 = [v6 dateFromComponents:v4];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)attributeSetForEvent
{
  uint64_t v919 = *MEMORY[0x1E4F143B8];
  long long v899 = 0u;
  long long v900 = 0u;
  long long v901 = 0u;
  long long v902 = 0u;
  v4 = [(SGStorageEvent *)self tags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v899 objects:v918 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v900;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v900 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v899 + 1) + 8 * i);
        if ([v9 isEventCompletenessTag])
        {
          v10 = [v9 isEventComplete];
          char v11 = [v10 BOOLValue];

          if ((v11 & 1) == 0)
          {
            v28 = sgLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEFAULT, "Event not complete. Not donating events to events bundle.", buf, 2u);
            }
            id v29 = 0;
            goto LABEL_756;
          }
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v899 objects:v918 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  v12 = buf;

  long long v897 = 0u;
  long long v898 = 0u;
  long long v895 = 0u;
  long long v896 = 0u;
  v13 = self;
  v14 = [(SGStorageEvent *)self tags];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v895 objects:v917 count:16];
  v16 = (void *)0x1E4F1C000;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v896;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v896 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v895 + 1) + 8 * j);
        if ([v20 isSchemaOrg])
        {
          v22 = (void *)MEMORY[0x1CB79B230]();
          v23 = (void *)MEMORY[0x1E4F28D90];
          v24 = [v20 value];
          v25 = [v24 dataUsingEncoding:4];
          id v894 = 0;
          v21 = [v23 JSONObjectWithData:v25 options:0 error:&v894];
          id v26 = v894;

          v16 = (void *)0x1E4F1C000;
          if (v26)
          {
            v27 = sgLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v904 = v26;
              _os_log_fault_impl(&dword_1CA650000, v27, OS_LOG_TYPE_FAULT, "JSON decode error loading schemas: %@", buf, 0xCu);
            }

            if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
              abort();
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v21 count])
          {

            v21 = 0;
          }

          goto LABEL_28;
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v895 objects:v917 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    v21 = 0;
LABEL_28:
    v13 = self;
  }
  else
  {
    v21 = 0;
  }

  id v30 = v21;
  v4 = objc_msgSend(v30, "_pas_filteredArrayWithTest:", &__block_literal_global_32221);

  if (![v4 count])
  {
    id v29 = 0;
    goto LABEL_757;
  }
  v814 = v4;
  v815 = [v4 objectAtIndexedSubscript:0];
  v880 = objc_opt_new();
  [v880 setContentType:@"com.apple.spotlight.events"];
  v834 = objc_opt_new();
  v833 = objc_opt_new();
  long long v890 = 0u;
  long long v891 = 0u;
  long long v892 = 0u;
  long long v893 = 0u;
  v31 = [(SGStorageEvent *)v13 tags];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v890 objects:v916 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v891;
    uint64_t v3 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v891 != v34) {
          objc_enumerationMutation(v31);
        }
        v16 = *(void **)(*((void *)&v890 + 1) + 8 * k);
        if ([v16 isForwardedMailTag])
        {
          v36 = [v16 isForwardedMail];
          [v880 setEventSourceIsForwarded:v36];
        }
        if ([v16 isAuthorTag])
        {
          v37 = [v16 value];
          v16 = [v37 dataUsingEncoding:4];

          id v889 = 0;
          v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v889];
          id v38 = v889;
          if (v12)
          {
            v39 = [v12 valueForKey:@"name"];
            [v834 addObject:v39];

            uint64_t v2 = [v12 valueForKey:@"email"];
            [v833 addObject:v2];
          }
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v890 objects:v916 count:16];
    }
    while (v33);
  }

  v40 = [MEMORY[0x1E4F1C978] arrayWithArray:v834];
  v41 = v880;
  [v880 setAuthorNames:v40];

  v42 = [MEMORY[0x1E4F1C978] arrayWithArray:v833];
  [v880 setAuthorEmailAddresses:v42];

  v43 = [(SGStorageEvent *)self when];
  v44 = [v43 startTimeZone];
  v45 = [v44 name];
  v812 = v43;
  v46 = [v43 startDate];
  if (v45)
  {
    [v880 setStartDate:v46];
  }
  else
  {
    v47 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v46];
    [v880 setStartDate:v47];

    v41 = v880;
  }

  v48 = [v812 endTimeZone];
  v49 = [v48 name];
  v50 = [v812 endDate];
  if (v49)
  {
    [v41 setEndDate:v50];
  }
  else
  {
    v51 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v50];
    [v880 setEndDate:v51];

    v41 = v880;
  }

  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[SGStorageEvent isAllDay](self, "isAllDay"));
  [v41 setEventIsAllDay:v52];

  long long v887 = 0u;
  long long v888 = 0u;
  long long v885 = 0u;
  long long v886 = 0u;
  v53 = [(SGStorageEvent *)self tags];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v885 objects:v915 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v886;
    do
    {
      for (uint64_t m = 0; m != v55; ++m)
      {
        if (*(void *)v886 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = *(void **)(*((void *)&v885 + 1) + 8 * m);
        if ([v58 isEventSourceMetadata])
        {
          v59 = [v58 value];
          [v880 setEventSourceMetadata:v59];
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v885 objects:v915 count:16];
    }
    while (v55);
  }

  v60 = [v812 endDate];
  v61 = [v812 startDate];
  [v60 timeIntervalSinceDate:v61];
  double v63 = v62;

  v64 = [(SGStorageEvent *)self tags];
  v65 = (void *)0x1E4F5D000;
  v66 = [MEMORY[0x1E4F5D9F0] extractedFlight];
  int v67 = [v64 containsObject:v66];

  if (v67)
  {
    v863 = +[SGFlightData sharedInstance];
    v68 = v880;
    [v880 setEventType:*MEMORY[0x1E4F228C8]];
    v69 = v815;
    v70 = [v815 objectForKeyedSubscript:@"reservationStatus"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      v66 = [v815 objectForKeyedSubscript:@"reservationStatus"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v880 setFlightStatus:0];
        goto LABEL_82;
      }
      v69 = v815;
      v68 = v880;
    }
    v72 = [v69 objectForKeyedSubscript:@"reservationStatus"];
    v16 = [v72 description];
    [v68 setFlightStatus:v16];

    if (isKindOfClass)
    {
LABEL_83:

      v91 = v815;
      v92 = [v815 objectForKeyedSubscript:@"reservationId"];
      objc_opt_class();
      char v93 = objc_opt_isKindOfClass();
      if ((v93 & 1) == 0)
      {
        v66 = [v815 objectForKeyedSubscript:@"reservationId"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v880 setFlightConfirmationNumber:0];
          goto LABEL_91;
        }
        v91 = v815;
      }
      v91 = [v91 objectForKeyedSubscript:@"reservationId"];
      v16 = [v91 description];
      [v880 setFlightConfirmationNumber:v16];

      if (v93)
      {
LABEL_92:

        v96 = [v815 objectForKeyedSubscript:@"provider"];
        v97 = @"iataCode";
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v98 = [v96 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          char v99 = objc_opt_isKindOfClass();
          if ((v99 & 1) != 0
            || ([v96 objectForKeyedSubscript:@"name"],
                v16 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            v100 = [v96 objectForKeyedSubscript:@"name"];
            v101 = [v100 description];
            [v880 setFlightCarrier:v101];

            if (v99) {
              goto LABEL_100;
            }
          }
          else
          {
            [v880 setFlightCarrier:0];
          }

LABEL_100:
          v68 = [v96 objectForKeyedSubscript:@"iataCode"];
          objc_opt_class();
          char v102 = objc_opt_isKindOfClass();
          if ((v102 & 1) == 0)
          {
            v91 = [v96 objectForKeyedSubscript:@"iataCode"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setFlightCarrierCode:0];
LABEL_105:

              goto LABEL_106;
            }
          }
          v103 = [v96 objectForKeyedSubscript:@"iataCode"];
          v104 = [v103 description];
          [v880 setFlightCarrierCode:v104];

          if ((v102 & 1) == 0) {
            goto LABEL_105;
          }
LABEL_106:

          v96 = 0;
        }

        v105 = [v815 objectForKeyedSubscript:@"reservationFor"];
        v106 = v880;
LABEL_108:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v832 = v105;
          for (n = [v105 objectForKeyedSubscript:@"provider"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v108 = [n objectForKeyedSubscript:@"name"];
            objc_opt_class();
            char v109 = objc_opt_isKindOfClass();
            if ((v109 & 1) != 0
              || ([n objectForKeyedSubscript:@"name"],
                  uint64_t v110 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v850 = (void *)v110,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              v111 = [n objectForKeyedSubscript:@"name"];
              v112 = [v111 description];
              [v880 setFlightCarrier:v112];

              if (v109) {
                goto LABEL_117;
              }
            }
            else
            {
              [v880 setFlightCarrier:0];
            }

LABEL_117:
            v113 = [n objectForKeyedSubscript:@"iataCode"];
            objc_opt_class();
            char v114 = objc_opt_isKindOfClass();
            if ((v114 & 1) == 0)
            {
              uint64_t v115 = [n objectForKeyedSubscript:@"iataCode"];
              objc_opt_class();
              v851 = (void *)v115;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [v880 setFlightCarrierCode:0];
LABEL_122:

                goto LABEL_123;
              }
            }
            v116 = [n objectForKeyedSubscript:@"iataCode"];
            v117 = [v116 description];
            [v880 setFlightCarrierCode:v117];

            if ((v114 & 1) == 0) {
              goto LABEL_122;
            }
LABEL_123:
          }
          v118 = [v832 objectForKeyedSubscript:@"flightDesignator"];
          objc_opt_class();
          char v119 = objc_opt_isKindOfClass();
          if ((v119 & 1) == 0)
          {
            uint64_t v120 = [v832 objectForKeyedSubscript:@"flightDesignator"];
            objc_opt_class();
            v821 = (void *)v120;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setFlightDesignator:0];
LABEL_129:

              goto LABEL_130;
            }
          }
          v121 = [v832 objectForKeyedSubscript:@"flightDesignator"];
          v122 = [v121 description];
          [v880 setFlightDesignator:v122];

          if ((v119 & 1) == 0) {
            goto LABEL_129;
          }
LABEL_130:

          v123 = v880;
          v124 = [v880 flightDesignator];
          v125 = v124;
          if (!v124)
          {
            v127 = [v832 objectForKeyedSubscript:@"flightNumber"];
            objc_opt_class();
            char v128 = objc_opt_isKindOfClass();
            if ((v128 & 1) != 0
              || ([v832 objectForKeyedSubscript:@"flightNumber"],
                  uint64_t v129 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v811 = (void *)v129,
                  (objc_opt_isKindOfClass() & 1) != 0))
            {
              v130 = objc_msgSend(v832, "objectForKeyedSubscript:", @"flightNumber", v811);
              id v126 = [v130 description];

              if (v128) {
                goto LABEL_138;
              }
            }
            else
            {
              id v126 = 0;
            }

LABEL_138:
            v123 = v880;
            goto LABEL_139;
          }
          id v126 = v124;
LABEL_139:

          v131 = (void *)[v126 mutableCopy];
          v132 = [v123 flightCarrierCode];

          if (v132)
          {
            v133 = [v123 flightCarrierCode];
            objc_msgSend(v131, "replaceOccurrencesOfString:withString:options:range:", v133, &stru_1F24EEF20, 10, 0, 2);
          }
          objc_msgSend(v131, "replaceOccurrencesOfString:withString:options:range:", @"[^0-9]", &stru_1F24EEF20, 1026, 0, objc_msgSend(v131, "length", v811));
          id v134 = v131;

          [v123 setFlightNumber:v134];
          uint64_t v135 = [v123 flightCarrierCode];
          if (v135)
          {
            v136 = (void *)v135;
            v137 = [v123 flightNumber];

            if (v137)
            {
              v138 = [v123 flightCarrierCode];
              v139 = [v123 flightNumber];
              v140 = [v138 stringByAppendingString:v139];
              [v123 setFlightDesignator:v140];
            }
          }
          v141 = [v832 objectForKeyedSubscript:@"arrivalAirport"];
          while (2)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v142 = [v141 objectForKeyedSubscript:@"iataCode"];
              objc_opt_class();
              char v143 = objc_opt_isKindOfClass();
              v866 = v141;
              if ((v143 & 1) != 0
                || ([v141 objectForKeyedSubscript:@"iataCode"],
                    uint64_t v144 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    v852 = (void *)v144,
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                v145 = [v141 objectForKeyedSubscript:@"iataCode"];
                id v146 = [v145 description];

                v141 = v866;
                if (v143)
                {
LABEL_152:

                  [v880 setFlightArrivalAirportCode:v146];
                  v864 = v146;
                  if (!v146) {
                    goto LABEL_180;
                  }
                  v147 = v863;
                  v148 = [v863 fieldForIataCode:v146 field:@"City"];
                  [v880 setFlightArrivalAirportLocality:v148];

                  v149 = [v863 fieldForIataCode:v146 field:@"Region"];
                  [v880 setFlightArrivalAirportRegion:v149];

                  v150 = [v863 fieldForIataCode:v146 field:@"Country"];
                  [v880 setFlightArrivalAirportCountry:v150];

                  v151 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                  objc_opt_class();
                  char v152 = objc_opt_isKindOfClass();
                  if ((v152 & 1) == 0)
                  {
                    v846 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                    if (v846)
                    {
                      v857 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                      v153 = [v857 description];
                      [v153 doubleValue];
                      if (v154 == 0.0)
                      {
                        [v880 setFlightArrivalAirportLatitude:0];
                        v141 = v866;
                        v160 = v857;
                      }
                      else
                      {
                        v835 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                        v826 = [v835 description];
                        [v826 doubleValue];
                        if (fabs(v155) == INFINITY)
                        {
                          [v880 setFlightArrivalAirportLatitude:0];
                        }
                        else
                        {
                          v822 = NSNumber;
                          v156 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                          v157 = [v156 description];
                          [v157 doubleValue];
                          v158 = objc_msgSend(v822, "numberWithDouble:");
                          [v880 setFlightArrivalAirportLatitude:v158];

                          v147 = v863;
                        }
                        v141 = v866;
                        v160 = v857;
                      }
LABEL_165:

LABEL_166:
                      v161 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                      objc_opt_class();
                      char v162 = objc_opt_isKindOfClass();
                      if ((v162 & 1) == 0)
                      {
                        v845 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                        if (v845)
                        {
                          v858 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                          v163 = [v858 description];
                          [v163 doubleValue];
                          if (v164 == 0.0)
                          {
                            [v880 setFlightArrivalAirportLongitude:0];
                            v170 = v858;
                          }
                          else
                          {
                            v836 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                            v827 = [v836 description];
                            [v827 doubleValue];
                            if (fabs(v165) == INFINITY)
                            {
                              [v880 setFlightArrivalAirportLongitude:0];
                            }
                            else
                            {
                              v823 = NSNumber;
                              v166 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                              v167 = [v166 description];
                              [v167 doubleValue];
                              v168 = objc_msgSend(v823, "numberWithDouble:");
                              [v880 setFlightArrivalAirportLongitude:v168];

                              v141 = v866;
                            }
                            v170 = v858;
                          }
LABEL_178:

LABEL_179:
                          id v146 = v864;
LABEL_180:
                          v171 = [v141 objectForKeyedSubscript:@"name"];
                          objc_opt_class();
                          char v172 = objc_opt_isKindOfClass();
                          if ((v172 & 1) != 0
                            || ([v141 objectForKeyedSubscript:@"name"],
                                uint64_t v173 = objc_claimAutoreleasedReturnValue(),
                                objc_opt_class(),
                                v849 = (void *)v173,
                                (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v174 = [v141 objectForKeyedSubscript:@"name"];
                            id v175 = [v174 description];

                            if (v172)
                            {
LABEL_186:

                              v859 = v175;
                              if (v175)
                              {
                                id v176 = v175;
                                v177 = v880;
                                [v880 setFlightArrivalAirportName:v176];
                              }
                              else
                              {
                                v177 = v880;
                                if (v146)
                                {
                                  v178 = [v863 bestLocalizedNameForAirport:v146];
                                  [v880 setFlightArrivalAirportName:v178];
                                }
                              }
                              v179 = [v866 objectForKeyedSubscript:@"latitude"];
                              objc_opt_class();
                              char v180 = objc_opt_isKindOfClass();
                              if ((v180 & 1) == 0)
                              {
                                v856 = [v866 objectForKeyedSubscript:@"latitude"];
                                if (v856)
                                {
                                  v837 = [v866 objectForKeyedSubscript:@"latitude"];
                                  v181 = [v837 description];
                                  [v181 doubleValue];
                                  if (v182 == 0.0)
                                  {
                                    [v177 setFlightArrivalAirportLatitude:0];
                                    v189 = v837;
                                  }
                                  else
                                  {
                                    v828 = [v866 objectForKeyedSubscript:@"latitude"];
                                    v183 = [v828 description];
                                    [v183 doubleValue];
                                    if (fabs(v184) == INFINITY)
                                    {
                                      [v880 setFlightArrivalAirportLatitude:0];
                                    }
                                    else
                                    {
                                      v824 = NSNumber;
                                      v185 = [v866 objectForKeyedSubscript:@"latitude"];
                                      v186 = [v185 description];
                                      [v186 doubleValue];
                                      v187 = objc_msgSend(v824, "numberWithDouble:");
                                      [v880 setFlightArrivalAirportLatitude:v187];
                                    }
                                    v189 = v837;
                                  }
LABEL_202:

LABEL_203:
                                  v190 = [v866 objectForKeyedSubscript:@"longitude"];
                                  objc_opt_class();
                                  char v191 = objc_opt_isKindOfClass();
                                  if ((v191 & 1) == 0)
                                  {
                                    v855 = [v866 objectForKeyedSubscript:@"longitude"];
                                    if (v855)
                                    {
                                      v192 = [v866 objectForKeyedSubscript:@"longitude"];
                                      v193 = [v192 description];
                                      [v193 doubleValue];
                                      if (v194 == 0.0)
                                      {
                                        [v880 setFlightArrivalAirportLongitude:0];
                                      }
                                      else
                                      {
                                        v838 = v192;
                                        v829 = [v866 objectForKeyedSubscript:@"longitude"];
                                        v195 = [v829 description];
                                        [v195 doubleValue];
                                        if (fabs(v196) == INFINITY)
                                        {
                                          [v880 setFlightArrivalAirportLongitude:0];
                                        }
                                        else
                                        {
                                          v825 = NSNumber;
                                          v197 = [v866 objectForKeyedSubscript:@"longitude"];
                                          v198 = [v197 description];
                                          [v198 doubleValue];
                                          v199 = objc_msgSend(v825, "numberWithDouble:");
                                          [v880 setFlightArrivalAirportLongitude:v199];
                                        }
                                        v192 = v838;
                                      }

LABEL_215:
LABEL_216:

                                      v201 = [v866 objectForKeyedSubscript:@"address"];
LABEL_217:
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {

                                        for (iuint64_t i = [v866 objectForKeyedSubscript:@"address"];
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                                            break;
                                          }
                                          [v880 setFlightArrivalAirportAddress:ii];
                                        }
                                        v141 = 0;
                                        continue;
                                      }
                                      v202 = [v201 objectForKeyedSubscript:@"streetAddress"];
                                      objc_opt_class();
                                      char v203 = objc_opt_isKindOfClass();
                                      if ((v203 & 1) != 0
                                        || ([v201 objectForKeyedSubscript:@"streetAddress"],
                                            uint64_t v204 = objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            obuint64_t j = (id)v204,
                                            (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v205 = [v201 objectForKeyedSubscript:@"streetAddress"];
                                        v206 = [v205 description];
                                        [v880 setFlightArrivalAirportStreetAddress:v206];

                                        if (v203) {
                                          goto LABEL_224;
                                        }
                                      }
                                      else
                                      {
                                        [v880 setFlightArrivalAirportStreetAddress:0];
                                      }

LABEL_224:
                                      v207 = [v201 objectForKeyedSubscript:@"addressLocality"];
                                      objc_opt_class();
                                      char v208 = objc_opt_isKindOfClass();
                                      if ((v208 & 1) != 0
                                        || ([v201 objectForKeyedSubscript:@"addressLocality"],
                                            uint64_t v209 = objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            v876 = (void *)v209,
                                            (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v210 = [v201 objectForKeyedSubscript:@"addressLocality"];
                                        v211 = [v210 description];
                                        [v880 setFlightArrivalAirportLocality:v211];

                                        if (v208) {
                                          goto LABEL_230;
                                        }
                                      }
                                      else
                                      {
                                        [v880 setFlightArrivalAirportLocality:0];
                                      }

LABEL_230:
                                      v212 = [v201 objectForKeyedSubscript:@"addressRegion"];
                                      objc_opt_class();
                                      char v213 = objc_opt_isKindOfClass();
                                      if ((v213 & 1) != 0
                                        || ([v201 objectForKeyedSubscript:@"addressRegion"],
                                            uint64_t v214 = objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            v875 = (void *)v214,
                                            (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v215 = [v201 objectForKeyedSubscript:@"addressRegion"];
                                        v216 = [v215 description];
                                        [v880 setFlightArrivalAirportRegion:v216];

                                        if (v213)
                                        {
LABEL_236:

                                          for (juint64_t j = [v201 objectForKeyedSubscript:@"addressCountry"];
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {

                                              for (kuint64_t k = [v201 objectForKeyedSubscript:@"addressCountry"];
                                              {
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0) {
                                                  break;
                                                }
                                                [v880 setFlightArrivalAirportCountry:kk];
                                              }
                                              v223 = [v201 objectForKeyedSubscript:@"postalCode"];
                                              objc_opt_class();
                                              char v224 = objc_opt_isKindOfClass();
                                              if ((v224 & 1) == 0)
                                              {
                                                uint64_t v225 = [v201 objectForKeyedSubscript:@"postalCode"];
                                                objc_opt_class();
                                                v874 = (void *)v225;
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  [v880 setFlightArrivalAirportPostalCode:0];
LABEL_253:

                                                  goto LABEL_254;
                                                }
                                              }
                                              v226 = [v201 objectForKeyedSubscript:@"postalCode"];
                                              v227 = [v226 description];
                                              [v880 setFlightArrivalAirportPostalCode:v227];

                                              if ((v224 & 1) == 0) {
                                                goto LABEL_253;
                                              }
LABEL_254:

                                              v201 = 0;
                                              goto LABEL_217;
                                            }
                                            v218 = [jj objectForKeyedSubscript:@"name"];
                                            objc_opt_class();
                                            char v219 = objc_opt_isKindOfClass();
                                            if ((v219 & 1) == 0)
                                            {
                                              v97 = [jj objectForKeyedSubscript:@"name"];
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0) {
                                                break;
                                              }
                                            }
                                            v220 = [jj objectForKeyedSubscript:@"name"];
                                            v221 = [v220 description];
                                            [v880 setFlightArrivalAirportCountry:v221];

                                            if ((v219 & 1) == 0) {
                                              goto LABEL_243;
                                            }
LABEL_244:
                                          }
                                          [v880 setFlightArrivalAirportCountry:0];
LABEL_243:

                                          goto LABEL_244;
                                        }
                                      }
                                      else
                                      {
                                        [v880 setFlightArrivalAirportRegion:0];
                                      }

                                      goto LABEL_236;
                                    }
                                    v855 = 0;
                                  }
                                  v200 = [v866 objectForKeyedSubscript:@"longitude"];
                                  [v880 setFlightArrivalAirportLongitude:v200];

                                  if ((v191 & 1) == 0) {
                                    goto LABEL_215;
                                  }
                                  goto LABEL_216;
                                }
                                v856 = 0;
                              }
                              v188 = [v866 objectForKeyedSubscript:@"latitude"];
                              [v177 setFlightArrivalAirportLatitude:v188];

                              if ((v180 & 1) == 0) {
                                goto LABEL_202;
                              }
                              goto LABEL_203;
                            }
                          }
                          else
                          {
                            id v175 = 0;
                          }

                          goto LABEL_186;
                        }
                        v845 = 0;
                      }
                      v169 = [v147 fieldForIataCode:v864 field:@"Longitude"];
                      [v880 setFlightArrivalAirportLongitude:v169];

                      if ((v162 & 1) == 0) {
                        goto LABEL_178;
                      }
                      goto LABEL_179;
                    }
                    v846 = 0;
                  }
                  v159 = [v863 fieldForIataCode:v146 field:@"Latitude"];
                  [v880 setFlightArrivalAirportLatitude:v159];

                  v147 = v863;
                  v141 = v866;
                  if ((v152 & 1) == 0) {
                    goto LABEL_165;
                  }
                  goto LABEL_166;
                }
              }
              else
              {
                id v146 = 0;
              }

              goto LABEL_152;
            }
            break;
          }

          v229 = v832;
          v230 = [v832 objectForKeyedSubscript:@"arrivalTerminal"];
          objc_opt_class();
          char v231 = objc_opt_isKindOfClass();
          if ((v231 & 1) == 0)
          {
            uint64_t v232 = [v832 objectForKeyedSubscript:@"arrivalTerminal"];
            objc_opt_class();
            v820 = (void *)v232;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setFlightArrivalTerminal:0];
LABEL_265:

LABEL_266:
              for (muint64_t m = [v832 objectForKeyedSubscript:@"departureAirport"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v331 = [v832 objectForKeyedSubscript:@"departureTerminal"];
                  objc_opt_class();
                  char v332 = objc_opt_isKindOfClass();
                  if ((v332 & 1) == 0)
                  {
                    uint64_t v333 = [v832 objectForKeyedSubscript:@"departureTerminal"];
                    objc_opt_class();
                    v819 = (void *)v333;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      [v880 setFlightDepartureTerminal:0];
LABEL_390:

                      goto LABEL_391;
                    }
                  }
                  v334 = [v832 objectForKeyedSubscript:@"departureTerminal"];
                  v335 = [v334 description];
                  [v880 setFlightDepartureTerminal:v335];

                  if ((v332 & 1) == 0) {
                    goto LABEL_390;
                  }
LABEL_391:

                  v336 = objc_opt_new();
                  [v336 setFormatOptions:1907];
                  v337 = v832;
                  v338 = [v832 objectForKeyedSubscript:@"boardingTime"];
                  objc_opt_class();
                  char v339 = objc_opt_isKindOfClass();
                  if (v339) {
                    goto LABEL_394;
                  }
                  uint64_t v340 = [v832 objectForKeyedSubscript:@"boardingTime"];
                  objc_opt_class();
                  v818 = (void *)v340;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v868 = [v336 dateFromString:0];
LABEL_397:

                    goto LABEL_398;
                  }
                  v337 = v832;
LABEL_394:
                  v341 = [v337 objectForKeyedSubscript:@"boardingTime"];
                  v342 = [v341 description];
                  v868 = [v336 dateFromString:v342];

                  if ((v339 & 1) == 0) {
                    goto LABEL_397;
                  }
LABEL_398:

                  v343 = v880;
                  [v880 setFlightBoardingDateTime:v868];
                  v344 = v832;
                  v345 = [v832 objectForKeyedSubscript:@"departureGate"];
                  objc_opt_class();
                  char v346 = objc_opt_isKindOfClass();
                  if (v346) {
                    goto LABEL_401;
                  }
                  uint64_t v347 = [v832 objectForKeyedSubscript:@"departureGate"];
                  objc_opt_class();
                  v817 = (void *)v347;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    [v880 setFlightDepartureGate:0];
LABEL_404:

                    goto LABEL_405;
                  }
                  v343 = v880;
                  v344 = v832;
LABEL_401:
                  v348 = [v344 objectForKeyedSubscript:@"departureGate"];
                  v349 = [v348 description];
                  [v343 setFlightDepartureGate:v349];

                  if ((v346 & 1) == 0) {
                    goto LABEL_404;
                  }
LABEL_405:

                  v350 = v832;
                  v351 = [v832 objectForKeyedSubscript:@"arrivalGate"];
                  objc_opt_class();
                  char v352 = objc_opt_isKindOfClass();
                  if (v352) {
                    goto LABEL_408;
                  }
                  uint64_t v353 = [v832 objectForKeyedSubscript:@"arrivalGate"];
                  objc_opt_class();
                  v816 = (void *)v353;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    [v880 setFlightArrivalGate:0];
LABEL_411:

                    goto LABEL_412;
                  }
                  v350 = v832;
LABEL_408:
                  v354 = [v350 objectForKeyedSubscript:@"arrivalGate"];
                  v355 = [v354 description];
                  [v880 setFlightArrivalGate:v355];

                  if ((v352 & 1) == 0) {
                    goto LABEL_411;
                  }
LABEL_412:

                  v356 = [v832 objectForKeyedSubscript:@"duration"];
                  v106 = v880;
                  while (1)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    [v356 doubleValue];
                    objc_msgSend(v880, "setEventDuration:");

                    v356 = 0;
                  }

                  v105 = 0;
                  goto LABEL_108;
                }
                v236 = [mm objectForKeyedSubscript:@"iataCode"];
                objc_opt_class();
                char v237 = objc_opt_isKindOfClass();
                v867 = mm;
                if ((v237 & 1) == 0)
                {
                  uint64_t v238 = [mm objectForKeyedSubscript:@"iataCode"];
                  objc_opt_class();
                  v848 = (void *)v238;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    id v240 = 0;
LABEL_274:

                    goto LABEL_275;
                  }
                  muint64_t m = v867;
                }
                v239 = [mm objectForKeyedSubscript:@"iataCode"];
                id v240 = [v239 description];

                if ((v237 & 1) == 0) {
                  goto LABEL_274;
                }
LABEL_275:

                v241 = v880;
                [v880 setFlightDepartureAirportCode:v240];
                v865 = v240;
                if (!v240)
                {
                  v255 = v867;
                  goto LABEL_304;
                }
                v242 = [v863 fieldForIataCode:v240 field:@"City"];
                [v880 setFlightDepartureAirportLocality:v242];

                v243 = [v863 fieldForIataCode:v240 field:@"Region"];
                [v880 setFlightDepartureAirportRegion:v243];

                v244 = [v863 fieldForIataCode:v240 field:@"Country"];
                [v880 setFlightDepartureAirportCountry:v244];

                v245 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                objc_opt_class();
                char v246 = objc_opt_isKindOfClass();
                if ((v246 & 1) == 0)
                {
                  v844 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                  if (v844)
                  {
                    v860 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                    v247 = [v860 description];
                    [v247 doubleValue];
                    if (v248 == 0.0)
                    {
                      [v880 setFlightDepartureAirportLatitude:0];
                      v257 = v860;
                    }
                    else
                    {
                      v839 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                      v249 = [v839 description];
                      [v249 doubleValue];
                      if (fabs(v250) == INFINITY)
                      {
                        [v880 setFlightDepartureAirportLatitude:0];
                      }
                      else
                      {
                        v251 = NSNumber;
                        v252 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                        v253 = [v252 description];
                        [v253 doubleValue];
                        v254 = objc_msgSend(v251, "numberWithDouble:");
                        [v880 setFlightDepartureAirportLatitude:v254];
                      }
                      v257 = v860;

                      v241 = v880;
                    }

LABEL_289:
                    goto LABEL_290;
                  }
                  v844 = 0;
                }
                v256 = [v863 fieldForIataCode:v240 field:@"Latitude"];
                [v880 setFlightDepartureAirportLatitude:v256];

                if ((v246 & 1) == 0) {
                  goto LABEL_289;
                }
LABEL_290:

                v258 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                objc_opt_class();
                char v259 = objc_opt_isKindOfClass();
                if (v259) {
                  goto LABEL_296;
                }
                v843 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                if (!v843)
                {
                  v843 = 0;
LABEL_296:
                  v268 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                  [v241 setFlightDepartureAirportLongitude:v268];

                  v255 = v867;
                  if (v259) {
                    goto LABEL_303;
                  }
                  goto LABEL_302;
                }
                v861 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                v260 = [v861 description];
                [v260 doubleValue];
                if (v261 == 0.0)
                {
                  [v241 setFlightDepartureAirportLongitude:0];
                  v255 = v867;
                  v269 = v861;
                }
                else
                {
                  v840 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                  v262 = [v840 description];
                  [v262 doubleValue];
                  if (fabs(v263) == INFINITY)
                  {
                    [v880 setFlightDepartureAirportLongitude:0];
                  }
                  else
                  {
                    v264 = NSNumber;
                    v265 = [v863 fieldForIataCode:v865 field:@"Longitude"];
                    v266 = [v265 description];
                    [v266 doubleValue];
                    v267 = objc_msgSend(v264, "numberWithDouble:");
                    [v880 setFlightDepartureAirportLongitude:v267];
                  }
                  v255 = v867;
                  v269 = v861;
                }
LABEL_302:

LABEL_303:
                id v240 = v865;
LABEL_304:
                v270 = [v255 objectForKeyedSubscript:@"name"];
                objc_opt_class();
                char v271 = objc_opt_isKindOfClass();
                if ((v271 & 1) == 0)
                {
                  uint64_t v272 = [v255 objectForKeyedSubscript:@"name"];
                  objc_opt_class();
                  v847 = (void *)v272;
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    id v274 = 0;
LABEL_310:

                    goto LABEL_311;
                  }
                  v255 = v867;
                }
                v273 = [v255 objectForKeyedSubscript:@"name"];
                id v274 = [v273 description];

                if ((v271 & 1) == 0) {
                  goto LABEL_310;
                }
LABEL_311:

                v862 = v274;
                if (v274)
                {
                  v275 = v880;
                  [v880 setFlightDepartureAirportName:v274];
                }
                else
                {
                  v275 = v880;
                  v276 = v867;
                  if (!v240) {
                    goto LABEL_316;
                  }
                  v277 = [v863 bestLocalizedNameForAirport:v240];
                  [v880 setFlightDepartureAirportName:v277];
                }
                v276 = v867;
LABEL_316:
                v278 = [v276 objectForKeyedSubscript:@"latitude"];
                objc_opt_class();
                char v279 = objc_opt_isKindOfClass();
                if ((v279 & 1) == 0)
                {
                  v854 = [v276 objectForKeyedSubscript:@"latitude"];
                  if (v854)
                  {
                    v280 = [v276 objectForKeyedSubscript:@"latitude"];
                    v281 = [v280 description];
                    [v281 doubleValue];
                    if (v282 == 0.0)
                    {
                      [v275 setFlightDepartureAirportLatitude:0];
                    }
                    else
                    {
                      v841 = [v276 objectForKeyedSubscript:@"latitude"];
                      v283 = [v841 description];
                      [v283 doubleValue];
                      if (fabs(v284) == INFINITY)
                      {
                        [v880 setFlightDepartureAirportLatitude:0];
                      }
                      else
                      {
                        v285 = NSNumber;
                        v286 = [v867 objectForKeyedSubscript:@"latitude"];
                        [v286 description];
                        v287 = v830 = v280;
                        [v287 doubleValue];
                        v288 = objc_msgSend(v285, "numberWithDouble:");
                        [v880 setFlightDepartureAirportLatitude:v288];

                        v276 = v867;
                        v280 = v830;
                      }
                      v275 = v880;
                    }

LABEL_328:
                    goto LABEL_329;
                  }
                  v854 = 0;
                }
                v289 = [v276 objectForKeyedSubscript:@"latitude"];
                [v275 setFlightDepartureAirportLatitude:v289];

                v276 = v867;
                if ((v279 & 1) == 0) {
                  goto LABEL_328;
                }
LABEL_329:

                v290 = [v276 objectForKeyedSubscript:@"longitude"];
                objc_opt_class();
                char v291 = objc_opt_isKindOfClass();
                if (v291) {
                  goto LABEL_335;
                }
                v853 = [v276 objectForKeyedSubscript:@"longitude"];
                if (!v853)
                {
                  v853 = 0;
LABEL_335:
                  v302 = [v276 objectForKeyedSubscript:@"longitude"];
                  [v275 setFlightDepartureAirportLongitude:v302];

                  if (v291) {
                    goto LABEL_342;
                  }
                  goto LABEL_341;
                }
                v292 = [v276 objectForKeyedSubscript:@"longitude"];
                v293 = [v292 description];
                [v293 doubleValue];
                if (v294 == 0.0)
                {
                  [v275 setFlightDepartureAirportLongitude:0];
                }
                else
                {
                  v842 = [v276 objectForKeyedSubscript:@"longitude"];
                  v295 = [v842 description];
                  [v295 doubleValue];
                  if (fabs(v296) == INFINITY)
                  {
                    [v880 setFlightDepartureAirportLongitude:0];
                  }
                  else
                  {
                    v297 = v276;
                    v298 = NSNumber;
                    v299 = [v297 objectForKeyedSubscript:@"longitude"];
                    [v299 description];
                    v300 = v831 = v292;
                    [v300 doubleValue];
                    v301 = objc_msgSend(v298, "numberWithDouble:");
                    [v880 setFlightDepartureAirportLongitude:v301];

                    v292 = v831;
                  }

                  v275 = v880;
                }

LABEL_341:
LABEL_342:

                for (nn = [v867 objectForKeyedSubscript:@"address"];
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    break;
                  }
                  v304 = [nn objectForKeyedSubscript:@"streetAddress"];
                  objc_opt_class();
                  char v305 = objc_opt_isKindOfClass();
                  if ((v305 & 1) != 0
                    || ([nn objectForKeyedSubscript:@"streetAddress"],
                        uint64_t v306 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        v872 = (void *)v306,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v307 = [nn objectForKeyedSubscript:@"streetAddress"];
                    v308 = [v307 description];
                    [v880 setFlightDepartureAirportStreetAddress:v308];

                    if (v305) {
                      goto LABEL_350;
                    }
                  }
                  else
                  {
                    [v880 setFlightDepartureAirportStreetAddress:0];
                  }

LABEL_350:
                  v309 = [nn objectForKeyedSubscript:@"addressLocality"];
                  objc_opt_class();
                  char v310 = objc_opt_isKindOfClass();
                  if ((v310 & 1) != 0
                    || ([nn objectForKeyedSubscript:@"addressLocality"],
                        uint64_t v311 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        v871 = (void *)v311,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v312 = [nn objectForKeyedSubscript:@"addressLocality"];
                    v313 = [v312 description];
                    [v880 setFlightDepartureAirportLocality:v313];

                    if (v310) {
                      goto LABEL_356;
                    }
                  }
                  else
                  {
                    [v880 setFlightDepartureAirportLocality:0];
                  }

LABEL_356:
                  v314 = [nn objectForKeyedSubscript:@"addressRegion"];
                  objc_opt_class();
                  char v315 = objc_opt_isKindOfClass();
                  if ((v315 & 1) != 0
                    || ([nn objectForKeyedSubscript:@"addressRegion"],
                        uint64_t v316 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        v870 = (void *)v316,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v317 = [nn objectForKeyedSubscript:@"addressRegion"];
                    v318 = [v317 description];
                    [v880 setFlightDepartureAirportRegion:v318];

                    if (v315) {
                      goto LABEL_362;
                    }
                  }
                  else
                  {
                    [v880 setFlightDepartureAirportRegion:0];
                  }

LABEL_362:
                  for (i1 = [nn objectForKeyedSubscript:@"addressCountry"];
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    v320 = [i1 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    char v321 = objc_opt_isKindOfClass();
                    if ((v321 & 1) == 0)
                    {
                      v68 = [i1 objectForKeyedSubscript:@"name"];
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        [v880 setFlightDepartureAirportCountry:0];
LABEL_369:

                        goto LABEL_370;
                      }
                    }
                    v322 = [i1 objectForKeyedSubscript:@"name"];
                    v323 = [v322 description];
                    [v880 setFlightDepartureAirportCountry:v323];

                    if ((v321 & 1) == 0) {
                      goto LABEL_369;
                    }
LABEL_370:
                  }
                  for (i2 = [nn objectForKeyedSubscript:@"addressCountry"];
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    [v880 setFlightDepartureAirportCountry:i2];
                  }
                  v325 = [nn objectForKeyedSubscript:@"postalCode"];
                  objc_opt_class();
                  char v326 = objc_opt_isKindOfClass();
                  if ((v326 & 1) == 0)
                  {
                    uint64_t v327 = [nn objectForKeyedSubscript:@"postalCode"];
                    objc_opt_class();
                    v869 = (void *)v327;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      [v880 setFlightDepartureAirportPostalCode:0];
LABEL_379:

                      goto LABEL_380;
                    }
                  }
                  v328 = [nn objectForKeyedSubscript:@"postalCode"];
                  v329 = [v328 description];
                  [v880 setFlightDepartureAirportPostalCode:v329];

                  if ((v326 & 1) == 0) {
                    goto LABEL_379;
                  }
LABEL_380:

                  v275 = v880;
                }

                for (i3 = [v867 objectForKeyedSubscript:@"address"];
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    break;
                  }
                  [v275 setFlightDepartureAirportAddress:i3];
                }
              }
            }
            v229 = v832;
          }
          v233 = [v229 objectForKeyedSubscript:@"arrivalTerminal"];
          v234 = [v233 description];
          [v880 setFlightArrivalTerminal:v234];

          if (v231) {
            goto LABEL_266;
          }
          goto LABEL_265;
        }

        v357 = [v812 startTimeZone];
        v358 = [v357 name];
        v359 = [v812 startDate];
        if (v358)
        {
          [v106 setFlightDepartureDateTime:v359];
        }
        else
        {
          v360 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v359];
          [v880 setFlightDepartureDateTime:v360];

          v106 = v880;
        }

        v361 = [v812 endTimeZone];
        v362 = [v361 name];
        v363 = [v812 endDate];
        if (v362)
        {
          [v106 setFlightArrivalDateTime:v363];
        }
        else
        {
          uint64_t v364 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v363];
          v365 = v106;
          v366 = (void *)v364;
          [v365 setFlightArrivalDateTime:v364];
        }
        v367 = v815;
        v368 = [v815 objectForKeyedSubscript:@"checkinUrl"];
        objc_opt_class();
        char v369 = objc_opt_isKindOfClass();
        if ((v369 & 1) == 0)
        {
          v362 = [v815 objectForKeyedSubscript:@"checkinUrl"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v880 setFlightCheckInUrl:0];
            goto LABEL_428;
          }
          v367 = v815;
        }
        v370 = [v367 objectForKeyedSubscript:@"checkinUrl"];
        v371 = [v370 description];
        [v880 setFlightCheckInUrl:v371];

        if (v369)
        {
LABEL_429:

          v372 = [v815 objectForKeyedSubscript:@"potentialAction"];
          if (!v372)
          {
            for (i4 = [v815 objectForKeyedSubscript:@"reservationFor"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              uint64_t v374 = [i4 objectForKeyedSubscript:@"potentialAction"];

              v372 = (void *)v374;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v375 = v372;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v914 = v372;
              id v375 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v914 count:1];
            }
            else
            {
              id v375 = 0;
            }
          }
          id v376 = v375;

          long long v883 = 0u;
          long long v884 = 0u;
          long long v881 = 0u;
          long long v882 = 0u;
          id obja = v376;
          uint64_t v377 = [obja countByEnumeratingWithState:&v881 objects:v913 count:16];
          if (v377)
          {
            v378 = (void *)v377;
            uint64_t v379 = *(void *)v882;
            do
            {
              for (i5 = 0; i5 != v378; i5 = (char *)i5 + 1)
              {
                if (*(void *)v882 != v379) {
                  objc_enumerationMutation(obja);
                }
                v381 = *(void **)(*((void *)&v881 + 1) + 8 * (void)i5);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v382 = [v381 objectForKeyedSubscript:@"@type"];
                  if (([v382 containsString:@"CheckInAction"] & 1) == 0)
                  {

                    continue;
                  }
                  v383 = [v381 objectForKeyedSubscript:@"target"];
                  while (2)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      for (i6 = [v381 objectForKeyedSubscript:@"target"];
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                          break;
                        }
                        [v880 setFlightCheckInUrl:i6];
                      }
                      goto LABEL_463;
                    }
                    v384 = [v383 objectForKeyedSubscript:@"url"];
                    objc_opt_class();
                    char v385 = objc_opt_isKindOfClass();
                    if ((v385 & 1) != 0
                      || ([v383 objectForKeyedSubscript:@"url"],
                          v378 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v386 = [v383 objectForKeyedSubscript:@"url"];
                      v387 = [v386 description];
                      [v880 setFlightCheckInUrl:v387];

                      if (v385) {
                        goto LABEL_458;
                      }
                    }
                    else
                    {
                      [v880 setFlightCheckInUrl:0];
                    }

LABEL_458:
                    v383 = 0;
                    continue;
                  }
                }
              }
              v378 = (void *)[obja countByEnumeratingWithState:&v881 objects:v913 count:16];
            }
            while (v378);
          }
LABEL_463:

          v389 = objc_msgSend(v814, "_pas_mappedArrayWithTransform:", &__block_literal_global_160_32269);
          if ([v389 count])
          {
            v390 = objc_msgSend(v389, "_pas_mappedArrayWithTransform:", &__block_literal_global_188_32270);
            [v880 setEventCustomerNames:v390];

            v391 = objc_msgSend(v389, "_pas_mappedArrayWithTransform:", &__block_literal_global_190_32271);
            [v880 setEventSeatNumbers:v391];
          }
          v392 = [v812 startTimeZone];
          v393 = [v392 name];
          if (v393)
          {
            [v880 setFlightDepartureTimeZone:v393];
          }
          else
          {
            v394 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v395 = [v394 name];
            [v880 setFlightDepartureTimeZone:v395];
          }
          v396 = [v812 endTimeZone];
          v397 = [v396 name];
          if (v397)
          {
            [v880 setFlightArrivalTimeZone:v397];
          }
          else
          {
            v398 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v399 = [v398 name];
            [v880 setFlightArrivalTimeZone:v399];
          }
          v400 = v815;
          v401 = [v815 objectForKeyedSubscript:@"totalPrice"];
          objc_opt_class();
          uint64_t v402 = objc_opt_isKindOfClass();
          if ((v402 & 1) == 0)
          {
            v397 = [v815 objectForKeyedSubscript:@"totalPrice"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setEventTotalCost:0];
LABEL_477:

LABEL_478:
              for (i7 = [v815 objectForKeyedSubscript:@"broker"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v410 = self;
                  v4 = v814;
                  goto LABEL_754;
                }
                v406 = [i7 objectForKeyedSubscript:@"name"];
                objc_opt_class();
                char v407 = objc_opt_isKindOfClass();
                if ((v407 & 1) == 0)
                {
                  uint64_t v402 = [i7 objectForKeyedSubscript:@"name"];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    break;
                  }
                }
                v408 = [i7 objectForKeyedSubscript:@"name"];
                v409 = [v408 description];
                [v880 setEventProvider:v409];

                if ((v407 & 1) == 0) {
                  goto LABEL_485;
                }
LABEL_486:
              }
              [v880 setEventProvider:0];
LABEL_485:

              goto LABEL_486;
            }
            v400 = v815;
          }
          v403 = [v400 objectForKeyedSubscript:@"totalPrice"];
          v404 = [v403 description];
          [v880 setEventTotalCost:v404];

          if (v402) {
            goto LABEL_478;
          }
          goto LABEL_477;
        }
LABEL_428:

        goto LABEL_429;
      }
LABEL_91:

      goto LABEL_92;
    }
LABEL_82:

    goto LABEL_83;
  }
  v73 = [(SGStorageEvent *)self tags];
  v74 = [MEMORY[0x1E4F5D9F0] extractedHotel];
  int v75 = [v73 containsObject:v74];

  if (v75)
  {
    [v880 setEventType:*MEMORY[0x1E4F228D0]];
    v76 = v880;
    v77 = v815;
    v78 = [v815 objectForKeyedSubscript:@"reservationId"];
    objc_opt_class();
    uint64_t i13 = objc_opt_isKindOfClass();
    if ((i13 & 1) == 0)
    {
      v74 = [v815 objectForKeyedSubscript:@"reservationId"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v880 setHotelReservationId:0];
        goto LABEL_489;
      }
      v77 = v815;
      v76 = v880;
    }
    v80 = [v77 objectForKeyedSubscript:@"reservationId"];
    v81 = [v80 description];
    [v76 setHotelReservationId:v81];

    if (i13)
    {
LABEL_490:

      for (i8 = [v815 objectForKeyedSubscript:@"underName"];
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        v412 = [i8 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        uint64_t v2 = objc_opt_isKindOfClass();
        if ((v2 & 1) == 0)
        {
          uint64_t i13 = [i8 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v880 setHotelUnderName:0];
LABEL_497:

            goto LABEL_498;
          }
        }
        v413 = [i8 objectForKeyedSubscript:@"name"];
        v414 = [v413 description];
        [v880 setHotelUnderName:v414];

        if ((v2 & 1) == 0) {
          goto LABEL_497;
        }
LABEL_498:
      }
      v415 = [v815 objectForKeyedSubscript:@"underName"];
      v416 = v880;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        [v880 setHotelUnderName:v415];

        v415 = 0;
      }

      v417 = [v815 objectForKeyedSubscript:@"reservationFor"];
LABEL_503:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v418 = [v417 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        char v419 = objc_opt_isKindOfClass();
        v873 = v417;
        if (v419) {
          goto LABEL_507;
        }
        uint64_t v420 = [v417 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        v871 = (void *)v420;
        if (objc_opt_isKindOfClass())
        {
          v417 = v873;
LABEL_507:
          v421 = [v417 objectForKeyedSubscript:@"name"];
          uint64_t v3 = [v421 description];
          [v416 setHotelReservationForName:v3];

          if (v419)
          {
LABEL_511:

            v422 = v873;
            v423 = [v873 objectForKeyedSubscript:@"telephone"];
            objc_opt_class();
            char v424 = objc_opt_isKindOfClass();
            if (v424) {
              goto LABEL_514;
            }
            uint64_t v425 = [v873 objectForKeyedSubscript:@"telephone"];
            objc_opt_class();
            v870 = (void *)v425;
            if (objc_opt_isKindOfClass())
            {
              v422 = v873;
LABEL_514:
              v426 = [v422 objectForKeyedSubscript:@"telephone"];
              uint64_t v3 = [v426 description];
              [v416 setHotelReservationForTelephone:v3];

              if (v424)
              {
LABEL_518:

                for (i9 = [v873 objectForKeyedSubscript:@"address"];
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    for (i10 = [v873 objectForKeyedSubscript:@"address"];
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        break;
                      }
                      [v416 setHotelReservationForAddress:i10];
                    }
                    for (i11 = [v873 objectForKeyedSubscript:@"numberOfRooms"];
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        break;
                      }
                      v455 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(i11, "integerValue"));
                      [v416 setEventNumberOfRooms:v455];
                    }
                    for (i12 = [v873 objectForKeyedSubscript:@"allottedRoomNumbers"];
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        break;
                      }
                      v457 = [i12 componentsSeparatedByString:@", "];
                      [v416 setEventRoomNumbers:v457];
                    }
                    for (uint64_t i13 = [v873 objectForKeyedSubscript:@"totalPrice"];
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        break;
                      }
                      [v416 setEventTotalCost:i13];
                    }
                    v417 = 0;
                    goto LABEL_503;
                  }
                  v428 = [i9 objectForKeyedSubscript:@"streetAddress"];
                  objc_opt_class();
                  char v429 = objc_opt_isKindOfClass();
                  if ((v429 & 1) != 0
                    || ([i9 objectForKeyedSubscript:@"streetAddress"],
                        uint64_t v430 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        obuint64_t j = (id)v430,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v431 = [i9 objectForKeyedSubscript:@"streetAddress"];
                    v432 = [v431 description];
                    [v416 setHotelReservationForStreetAddress:v432];

                    if (v429) {
                      goto LABEL_526;
                    }
                  }
                  else
                  {
                    [v416 setHotelReservationForStreetAddress:0];
                  }

LABEL_526:
                  v433 = [i9 objectForKeyedSubscript:@"addressLocality"];
                  objc_opt_class();
                  char v434 = objc_opt_isKindOfClass();
                  if ((v434 & 1) != 0
                    || ([i9 objectForKeyedSubscript:@"addressLocality"],
                        uint64_t v435 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        v876 = (void *)v435,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v436 = [i9 objectForKeyedSubscript:@"addressLocality"];
                    v437 = [v436 description];
                    [v416 setHotelReservationForAddressLocality:v437];

                    if (v434) {
                      goto LABEL_532;
                    }
                  }
                  else
                  {
                    [v416 setHotelReservationForAddressLocality:0];
                  }

LABEL_532:
                  v438 = [i9 objectForKeyedSubscript:@"addressRegion"];
                  objc_opt_class();
                  char v439 = objc_opt_isKindOfClass();
                  if ((v439 & 1) != 0
                    || ([i9 objectForKeyedSubscript:@"addressRegion"],
                        uint64_t v440 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        v875 = (void *)v440,
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v441 = [i9 objectForKeyedSubscript:@"addressRegion"];
                    v442 = [v441 description];
                    [v416 setHotelReservationForAddressRegion:v442];

                    if (v439) {
                      goto LABEL_538;
                    }
                  }
                  else
                  {
                    [v416 setHotelReservationForAddressRegion:0];
                  }

LABEL_538:
                  for (i14 = [i9 objectForKeyedSubscript:@"addressCountry"];
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    v444 = [i14 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    char v445 = objc_opt_isKindOfClass();
                    if ((v445 & 1) == 0)
                    {
                      uint64_t v2 = [i14 objectForKeyedSubscript:@"name"];
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        [v416 setHotelReservationForAddressCountry:0];
LABEL_545:

                        goto LABEL_546;
                      }
                    }
                    v446 = [i14 objectForKeyedSubscript:@"name"];
                    v447 = [v446 description];
                    [v880 setHotelReservationForAddressCountry:v447];

                    v416 = v880;
                    if ((v445 & 1) == 0) {
                      goto LABEL_545;
                    }
LABEL_546:
                  }
                  for (i15 = [i9 objectForKeyedSubscript:@"addressCountry"];
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    [v416 setHotelReservationForAddressCountry:i15];
                  }
                  v449 = [i9 objectForKeyedSubscript:@"postalCode"];
                  objc_opt_class();
                  uint64_t v3 = objc_opt_isKindOfClass();
                  if ((v3 & 1) == 0)
                  {
                    uint64_t v450 = [i9 objectForKeyedSubscript:@"postalCode"];
                    objc_opt_class();
                    v874 = (void *)v450;
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      [v416 setHotelReservationForAddressPostalCode:0];
LABEL_555:

                      goto LABEL_556;
                    }
                  }
                  v451 = [i9 objectForKeyedSubscript:@"postalCode"];
                  v452 = [v451 description];
                  [v416 setHotelReservationForAddressPostalCode:v452];

                  if ((v3 & 1) == 0) {
                    goto LABEL_555;
                  }
LABEL_556:
                }
              }
            }
            else
            {
              [v416 setHotelReservationForTelephone:0];
            }

            goto LABEL_518;
          }
        }
        else
        {
          [v416 setHotelReservationForName:0];
        }

        goto LABEL_511;
      }

      for (i16 = [v815 objectForKeyedSubscript:@"provider"];
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v463 = v815;
          v464 = [v815 objectForKeyedSubscript:@"modifyReservationUrl"];
          objc_opt_class();
          char v465 = objc_opt_isKindOfClass();
          if (v465) {
            goto LABEL_582;
          }
          uint64_t v466 = [v815 objectForKeyedSubscript:@"modifyReservationUrl"];
          objc_opt_class();
          obuint64_t j = (id)v466;
          if (objc_opt_isKindOfClass())
          {
            v463 = v815;
LABEL_582:
            v463 = [v463 objectForKeyedSubscript:@"modifyReservationUrl"];
            uint64_t v467 = [v463 description];
            if (v467)
            {
              v468 = (void *)v467;
              [v880 setHotelModifyReservationUrl:v467];

              v469 = obj;
              if (v465) {
                goto LABEL_604;
              }
LABEL_603:

              goto LABEL_604;
            }
            char v470 = v465 ^ 1;
            char v471 = 1;
          }
          else
          {
            char v471 = 0;
            char v470 = 1;
          }
          v481 = v815;
          v482 = [v815 objectForKeyedSubscript:@"url"];
          objc_opt_class();
          char v483 = objc_opt_isKindOfClass();
          if (v483)
          {
LABEL_596:
            v484 = [v481 objectForKeyedSubscript:@"url"];
            [v484 description];
            v486 = char v485 = v470;
            [v880 setHotelModifyReservationUrl:v486];

            char v470 = v485;
            if ((v483 & 1) == 0) {
              goto LABEL_599;
            }
          }
          else
          {
            uint64_t v3 = [v815 objectForKeyedSubscript:@"url"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v481 = v815;
              goto LABEL_596;
            }
            [v880 setHotelModifyReservationUrl:0];
LABEL_599:
          }
          v469 = obj;
          if (v471) {

          }
          if (v470) {
            goto LABEL_603;
          }
LABEL_604:

          v487 = v815;
          v488 = [v815 objectForKeyedSubscript:@"checkinTime"];
          objc_opt_class();
          char v489 = objc_opt_isKindOfClass();
          if (v489)
          {
LABEL_607:
            v490 = [v487 objectForKeyedSubscript:@"checkinTime"];
            v491 = [v490 description];
            v492 = [(SGStorageEvent *)self _dateWithoutTimezoneFromString:v491];

            if ((v489 & 1) == 0) {
              goto LABEL_610;
            }
          }
          else
          {
            v463 = [v815 objectForKeyedSubscript:@"checkinTime"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v487 = v815;
              goto LABEL_607;
            }
            v492 = [(SGStorageEvent *)self _dateWithoutTimezoneFromString:0];
LABEL_610:
          }
          v493 = [v812 startTimeZone];
          v494 = [v493 name];
          if (v494)
          {
            v495 = objc_opt_class();
            v496 = [v812 startTimeZone];
            v497 = [v495 _dateForUTCDate:v492 withTimeZone:v496];
            [v880 setStartDate:v497];
          }
          else
          {
            v496 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v492];
            [v880 setStartDate:v496];
          }

          v498 = v815;
          v499 = [v815 objectForKeyedSubscript:@"checkoutTime"];
          objc_opt_class();
          char v500 = objc_opt_isKindOfClass();
          v410 = self;
          if (v500)
          {
LABEL_617:
            v501 = [v498 objectForKeyedSubscript:@"checkoutTime"];
            v502 = [v501 description];
            v503 = [(SGStorageEvent *)self _dateWithoutTimezoneFromString:v502];

            if ((v500 & 1) == 0) {
              goto LABEL_620;
            }
          }
          else
          {
            v496 = [v815 objectForKeyedSubscript:@"checkoutTime"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v498 = v815;
              goto LABEL_617;
            }
            v503 = [(SGStorageEvent *)self _dateWithoutTimezoneFromString:0];
LABEL_620:
          }
          v504 = [v812 startTimeZone];
          v505 = [v504 name];
          if (v505)
          {
            v506 = objc_opt_class();
            v507 = [v812 endTimeZone];
            v508 = [v506 _dateForUTCDate:v503 withTimeZone:v507];
            [v880 setEndDate:v508];
          }
          else
          {
            v507 = [(SGStorageEvent *)self _adjustLocalDateToUTC:v503];
            [v880 setEndDate:v507];
          }

          v509 = [v812 startTimeZone];
          v510 = [v509 name];
          if (v510)
          {
            v511 = v880;
            [v880 setHotelTimeZone:v510];
          }
          else
          {
            v512 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v513 = [v512 name];
            v511 = v880;
            [v880 setHotelTimeZone:v513];
          }
          [v511 setEventDuration:v63];
LABEL_628:

          goto LABEL_629;
        }
        v459 = [i16 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        char v460 = objc_opt_isKindOfClass();
        if ((v460 & 1) == 0)
        {
          uint64_t i13 = [i16 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
        }
        v461 = [i16 objectForKeyedSubscript:@"name"];
        v462 = [v461 description];
        [v880 setHotelProvider:v462];

        if ((v460 & 1) == 0) {
          goto LABEL_577;
        }
LABEL_578:
      }
      [v880 setHotelProvider:0];
LABEL_577:

      goto LABEL_578;
    }
LABEL_489:

    goto LABEL_490;
  }
  v82 = [(SGStorageEvent *)self tags];
  v83 = [MEMORY[0x1E4F5D9F0] extractedFood];
  int v84 = [v82 containsObject:v83];

  if (!v84)
  {
    v94 = [(SGStorageEvent *)self tags];
    v95 = [MEMORY[0x1E4F5D9F0] extractedTicket];
    if ([v94 containsObject:v95])
    {

      goto LABEL_587;
    }
    v472 = [(SGStorageEvent *)self tags];
    v473 = [MEMORY[0x1E4F5D9F0] extractedMovie];
    uint64_t v474 = [v472 containsObject:v473];

    v4 = v814;
    if (v474)
    {
LABEL_587:
      v475 = v880;
      [v880 setEventType:*MEMORY[0x1E4F228E8]];
      v476 = v815;
      v477 = [v815 objectForKeyedSubscript:@"reservationId"];
      objc_opt_class();
      uint64_t v478 = objc_opt_isKindOfClass();
      if ((v478 & 1) == 0)
      {
        v95 = [v815 objectForKeyedSubscript:@"reservationId"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v880 setEventReservationID:0];
LABEL_686:

LABEL_687:
          v566 = [v815 objectForKeyedSubscript:@"broker"];
          unint64_t v567 = 0x1E4F1C000uLL;
          while (1)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v568 = [v566 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            char v569 = objc_opt_isKindOfClass();
            if ((v569 & 1) == 0)
            {
              uint64_t v478 = [v566 objectForKeyedSubscript:@"name"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [v880 setEventProvider:0];
LABEL_694:

                goto LABEL_695;
              }
            }
            v475 = [v566 objectForKeyedSubscript:@"name"];
            v12 = [v475 description];
            [v880 setEventProvider:v12];

            if ((v569 & 1) == 0) {
              goto LABEL_694;
            }
LABEL_695:

            v566 = 0;
          }

          for (i17 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i18 = [i17 objectForKeyedSubscript:@"name"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              v572 = [i18 componentsSeparatedByString:@", "];
              [v880 setEventCustomerNames:v572];
            }
          }

          for (i19 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v574 = [i19 componentsSeparatedByString:@", "];
            [v880 setEventCustomerNames:v574];
          }
          v575 = [v815 objectForKeyedSubscript:@"reservationFor"];
LABEL_706:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v576 = v567;
            v577 = [v575 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            char v578 = objc_opt_isKindOfClass();
            id objb = v575;
            if (v578) {
              goto LABEL_710;
            }
            uint64_t v579 = [v575 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            v876 = (void *)v579;
            if (objc_opt_isKindOfClass())
            {
              v575 = objb;
LABEL_710:
              v580 = [v575 objectForKeyedSubscript:@"name"];
              v581 = [v580 description];
              [v880 setEventTicketType:v581];

              if (v578)
              {
LABEL_714:

                for (i20 = [objb objectForKeyedSubscript:@"location"];
                {
                  unint64_t v567 = v576;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    v575 = 0;
                    goto LABEL_706;
                  }
                  v583 = [i20 objectForKeyedSubscript:@"name"];
                  objc_opt_class();
                  char v584 = objc_opt_isKindOfClass();
                  if ((v584 & 1) != 0
                    || ([i20 objectForKeyedSubscript:@"name"],
                        v475 = objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v585 = [i20 objectForKeyedSubscript:@"name"];
                    v586 = [v585 description];
                    [v880 setEventStartLocationName:v586];

                    if (v584) {
                      goto LABEL_722;
                    }
                  }
                  else
                  {
                    [v880 setEventStartLocationName:0];
                  }

LABEL_722:
                  v587 = [i20 objectForKeyedSubscript:@"address"];
                  objc_opt_class();
                  char v588 = objc_opt_isKindOfClass();
                  if ((v588 & 1) == 0)
                  {
                    v12 = [i20 objectForKeyedSubscript:@"address"];
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      [v880 setEventStartLocationAddress:0];
LABEL_727:

                      goto LABEL_728;
                    }
                  }
                  v589 = [i20 objectForKeyedSubscript:@"address"];
                  v590 = [v589 description];
                  [v880 setEventStartLocationAddress:v590];

                  if ((v588 & 1) == 0) {
                    goto LABEL_727;
                  }
LABEL_728:
                }
              }
            }
            else
            {
              [v880 setEventTicketType:0];
            }

            goto LABEL_714;
          }

          for (i21 = [v815 objectForKeyedSubscript:@"reservedTicket"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i22 = [i21 objectForKeyedSubscript:@"ticketedSeat"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              for (i23 = [i22 objectForKeyedSubscript:@"seatNumber"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                v594 = [i23 componentsSeparatedByString:@", "];
                [v880 setEventSeatNumbers:v594];
              }
            }
          }
          v595 = [v812 startTimeZone];
          v596 = [v595 name];
          if (v596)
          {
            v597 = v880;
            [v880 setStartDateTimeZone:v596];
          }
          else
          {
            v598 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v599 = [v598 name];
            v597 = v880;
            [v880 setStartDateTimeZone:v599];
          }
          v600 = [v812 endTimeZone];
          v601 = [v600 name];
          if (v601)
          {
            [v597 setEndDateTimeZone:v601];
          }
          else
          {
            v602 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v603 = [v602 name];
            [v880 setEndDateTimeZone:v603];

            v597 = v880;
          }

          [v597 setEventDuration:v63];
          v604 = v815;
          v605 = [v815 objectForKeyedSubscript:@"totalPrice"];
          objc_opt_class();
          char v606 = objc_opt_isKindOfClass();
          v410 = self;
          if ((v606 & 1) == 0)
          {
            v601 = [v815 objectForKeyedSubscript:@"totalPrice"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setEventTotalCost:0];
              goto LABEL_751;
            }
            v604 = v815;
            v597 = v880;
          }
          v607 = [v604 objectForKeyedSubscript:@"totalPrice"];
          v608 = [v607 description];
          [v597 setEventTotalCost:v608];

          if (v606)
          {
LABEL_752:

            v609 = [(SGStorageEvent *)self tags];
            v610 = [MEMORY[0x1E4F5D9F0] extractedMovie];
            int v611 = [v609 containsObject:v610];

            v4 = v814;
            if (v611) {
              [v880 setEventSubType:@"movie"];
            }
            goto LABEL_754;
          }
LABEL_751:

          goto LABEL_752;
        }
        v476 = v815;
        v475 = v880;
      }
      v479 = [v476 objectForKeyedSubscript:@"reservationId"];
      v480 = [v479 description];
      [v475 setEventReservationID:v480];

      if (v478) {
        goto LABEL_687;
      }
      goto LABEL_686;
    }
    v551 = [(SGStorageEvent *)self tags];
    v552 = [MEMORY[0x1E4F5D9F0] extractedCarRental];
    int v553 = [v551 containsObject:v552];

    if (v553)
    {
      v554 = v880;
      [v880 setEventType:*MEMORY[0x1E4F228C0]];
      v555 = v815;
      v556 = [v815 objectForKeyedSubscript:@"reservationId"];
      objc_opt_class();
      uint64_t v557 = objc_opt_isKindOfClass();
      if ((v557 & 1) == 0)
      {
        v552 = [v815 objectForKeyedSubscript:@"reservationId"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v554 = v880;
          [v880 setEventReservationID:0];
LABEL_825:

LABEL_826:
          for (i24 = [v815 objectForKeyedSubscript:@"provider"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v673 = [v815 objectForKeyedSubscript:@"underName"];
              v674 = @", ";
              while (1)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                for (i25 = [v673 objectForKeyedSubscript:@"name"];
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    break;
                  }
                  uint64_t v474 = [i25 componentsSeparatedByString:@", "];
                  [v880 setEventCustomerNames:v474];
                }
                v673 = 0;
                v554 = v880;
              }

              for (i26 = [v815 objectForKeyedSubscript:@"underName"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                v674 = [i26 componentsSeparatedByString:@", "];
                [v554 setEventCustomerNames:v674];
              }
              v677 = [v815 objectForKeyedSubscript:@"reservationFor"];
              while (2)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v678 = [v677 objectForKeyedSubscript:@"model"];
                  objc_opt_class();
                  uint64_t v474 = objc_opt_isKindOfClass();
                  if ((v474 & 1) != 0
                    || ([v677 objectForKeyedSubscript:@"model"],
                        v674 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                        objc_opt_class(),
                        (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v554 = [v677 objectForKeyedSubscript:@"model"];
                    v12 = [v554 description];
                    [v880 setEventReservationForName:v12];

                    if (v474) {
                      goto LABEL_852;
                    }
                  }
                  else
                  {
                    [v880 setEventReservationForName:0];
                  }

LABEL_852:
                  v677 = 0;
                  continue;
                }
                break;
              }

              v679 = [v815 objectForKeyedSubscript:@"pickupLocation"];
              while (2)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v692 = [v812 startTimeZone];
                  v693 = [v692 name];
                  if (v693)
                  {
                    [v880 setStartDateTimeZone:v693];
                  }
                  else
                  {
                    v694 = [MEMORY[0x1E4F1CAF0] localTimeZone];
                    v695 = [v694 name];
                    [v880 setStartDateTimeZone:v695];
                  }
                  v696 = [v815 objectForKeyedSubscript:@"dropoffLocation"];
                  while (2)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      v709 = [v812 endTimeZone];
                      v710 = [v709 name];
                      if (v710)
                      {
                        [v880 setEndDateTimeZone:v710];
                      }
                      else
                      {
                        v711 = [MEMORY[0x1E4F1CAF0] localTimeZone];
                        v712 = [v711 name];
                        [v880 setEndDateTimeZone:v712];
                      }
                      v713 = v815;
                      v714 = [v815 objectForKeyedSubscript:@"totalPrice"];
                      objc_opt_class();
                      char v715 = objc_opt_isKindOfClass();
                      v410 = self;
                      if (v715)
                      {
LABEL_904:
                        v716 = [v713 objectForKeyedSubscript:@"totalPrice"];
                        v717 = [v716 description];
                        v718 = v880;
                        [v880 setEventTotalCost:v717];

                        if ((v715 & 1) == 0) {
                          goto LABEL_916;
                        }
                      }
                      else
                      {
                        v710 = [v815 objectForKeyedSubscript:@"totalPrice"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v713 = v815;
                          goto LABEL_904;
                        }
                        v718 = v880;
                        [v880 setEventTotalCost:0];
LABEL_916:
                      }
                      [v718 setEventDuration:v63];
LABEL_630:
                      v4 = v814;
                      goto LABEL_754;
                    }
                    v697 = [v696 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    char v698 = objc_opt_isKindOfClass();
                    if ((v698 & 1) != 0
                      || ([v696 objectForKeyedSubscript:@"name"],
                          uint64_t v474 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v699 = [v696 objectForKeyedSubscript:@"name"];
                      v700 = [v699 description];
                      [v880 setEventEndLocationName:v700];

                      if (v698) {
                        goto LABEL_885;
                      }
                    }
                    else
                    {
                      [v880 setEventEndLocationName:0];
                    }

LABEL_885:
                    v701 = [v696 objectForKeyedSubscript:@"telephone"];
                    objc_opt_class();
                    char v702 = objc_opt_isKindOfClass();
                    if ((v702 & 1) != 0
                      || ([v696 objectForKeyedSubscript:@"telephone"],
                          v554 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v703 = [v696 objectForKeyedSubscript:@"telephone"];
                      v704 = [v703 description];
                      [v880 setEventEndLocationTelephone:v704];

                      if (v702) {
                        goto LABEL_891;
                      }
                    }
                    else
                    {
                      [v880 setEventEndLocationTelephone:0];
                    }

LABEL_891:
                    v705 = [v696 objectForKeyedSubscript:@"address"];
                    objc_opt_class();
                    char v706 = objc_opt_isKindOfClass();
                    if ((v706 & 1) != 0
                      || ([v696 objectForKeyedSubscript:@"address"],
                          v12 = objc_claimAutoreleasedReturnValue(),
                          objc_opt_class(),
                          (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v707 = [v696 objectForKeyedSubscript:@"address"];
                      v708 = [v707 description];
                      [v880 setEventEndLocationAddress:v708];

                      if (v706) {
                        goto LABEL_897;
                      }
                    }
                    else
                    {
                      [v880 setEventEndLocationAddress:0];
                    }

LABEL_897:
                    v696 = 0;
                    continue;
                  }
                }
                v680 = [v679 objectForKeyedSubscript:@"name"];
                objc_opt_class();
                char v681 = objc_opt_isKindOfClass();
                if ((v681 & 1) != 0
                  || ([v679 objectForKeyedSubscript:@"name"],
                      uint64_t v474 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v682 = [v679 objectForKeyedSubscript:@"name"];
                  v683 = [v682 description];
                  [v880 setEventStartLocationName:v683];

                  if (v681) {
                    goto LABEL_861;
                  }
                }
                else
                {
                  [v880 setEventStartLocationName:0];
                }

LABEL_861:
                v684 = [v679 objectForKeyedSubscript:@"telephone"];
                objc_opt_class();
                char v685 = objc_opt_isKindOfClass();
                if ((v685 & 1) != 0
                  || ([v679 objectForKeyedSubscript:@"telephone"],
                      v554 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v686 = [v679 objectForKeyedSubscript:@"telephone"];
                  v687 = [v686 description];
                  [v880 setEventStartLocationTelephone:v687];

                  if (v685) {
                    goto LABEL_867;
                  }
                }
                else
                {
                  [v880 setEventStartLocationTelephone:0];
                }

LABEL_867:
                v688 = [v679 objectForKeyedSubscript:@"address"];
                objc_opt_class();
                char v689 = objc_opt_isKindOfClass();
                if ((v689 & 1) != 0
                  || ([v679 objectForKeyedSubscript:@"address"],
                      v12 = objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v690 = [v679 objectForKeyedSubscript:@"address"];
                  v691 = [v690 description];
                  [v880 setEventStartLocationAddress:v691];

                  if (v689) {
                    goto LABEL_873;
                  }
                }
                else
                {
                  [v880 setEventStartLocationAddress:0];
                }

LABEL_873:
                v679 = 0;
                continue;
              }
            }
            v671 = [i24 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            uint64_t v474 = objc_opt_isKindOfClass();
            if ((v474 & 1) == 0)
            {
              uint64_t v557 = [i24 objectForKeyedSubscript:@"name"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
            }
            v672 = [i24 objectForKeyedSubscript:@"name"];
            v12 = [v672 description];
            [v880 setEventProvider:v12];

            if ((v474 & 1) == 0) {
              goto LABEL_833;
            }
LABEL_834:

            v554 = v880;
          }
          [v880 setEventProvider:0];
LABEL_833:

          goto LABEL_834;
        }
        v555 = v815;
        v554 = v880;
      }
      v558 = [v555 objectForKeyedSubscript:@"reservationId"];
      uint64_t v474 = [v558 description];
      [v554 setEventReservationID:v474];

      if (v557) {
        goto LABEL_826;
      }
      goto LABEL_825;
    }
    v617 = [(SGStorageEvent *)self tags];
    v618 = [MEMORY[0x1E4F5D9F0] extractedSocial];
    int v619 = [v617 containsObject:v618];

    if (v619)
    {
      [v880 setEventType:*MEMORY[0x1E4F228D8]];
      for (i27 = [v815 objectForKeyedSubscript:@"reservationFor"];
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v668 = [v812 startTimeZone];
          v669 = [v668 name];
          if (v669)
          {
            [v880 setStartDateTimeZone:v669];
          }
          else
          {
            v728 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v729 = [v728 name];
            [v880 setStartDateTimeZone:v729];

            v4 = v814;
          }

          for (i28 = [v815 objectForKeyedSubscript:@"url"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v731 = [MEMORY[0x1E4F1CB10] URLWithString:i28];
            [v880 setEventURL:v731];
          }
          v560 = [v812 endTimeZone];
          v564 = [v560 name];
          if (v564)
          {
            [v880 setEndDateTimeZone:v564];
          }
          else
          {
            v732 = [MEMORY[0x1E4F1CAF0] localTimeZone];
            v733 = [v732 name];
            [v880 setEndDateTimeZone:v733];

            v4 = v814;
          }
          v410 = self;
          goto LABEL_684;
        }
        v621 = [i27 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        char v622 = objc_opt_isKindOfClass();
        if ((v622 & 1) != 0
          || ([i27 objectForKeyedSubscript:@"name"],
              uint64_t v623 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              obuint64_t j = (id)v623,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          v624 = [i27 objectForKeyedSubscript:@"name"];
          v625 = [v624 description];
          [v880 setEventName:v625];

          if (v622) {
            goto LABEL_769;
          }
        }
        else
        {
          [v880 setEventName:0];
        }

LABEL_769:
        for (i29 = [i27 objectForKeyedSubscript:@"location"];
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v627 = [i27 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          char v628 = objc_opt_isKindOfClass();
          if ((v628 & 1) != 0
            || ([i27 objectForKeyedSubscript:@"name"],
                v65 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                (objc_opt_isKindOfClass() & 1) != 0))
          {
            v629 = [i27 objectForKeyedSubscript:@"name"];
            v630 = [v629 description];
            [v880 setEventStartLocationName:v630];

            if (v628) {
              goto LABEL_777;
            }
          }
          else
          {
            [v880 setEventStartLocationName:0];
          }

LABEL_777:
          v631 = [i27 objectForKeyedSubscript:@"address"];
          objc_opt_class();
          char v632 = objc_opt_isKindOfClass();
          if ((v632 & 1) == 0)
          {
            v12 = [i27 objectForKeyedSubscript:@"address"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v880 setEventStartLocationAddress:0];
LABEL_782:

              goto LABEL_783;
            }
          }
          v633 = [i27 objectForKeyedSubscript:@"address"];
          v634 = [v633 description];
          [v880 setEventStartLocationAddress:v634];

          if ((v632 & 1) == 0) {
            goto LABEL_782;
          }
LABEL_783:

          v4 = v814;
        }
      }
    }
    v635 = [(SGStorageEvent *)self tags];
    v636 = [MEMORY[0x1E4F5D9F0] extractedAppointment];
    int v637 = [v635 containsObject:v636];

    if (!v637)
    {
      v719 = [(SGStorageEvent *)self tags];
      v720 = [MEMORY[0x1E4F5D9F0] extractedBus];
      int v721 = [v719 containsObject:v720];

      if (v721)
      {
        v722 = v880;
        [v880 setEventType:*MEMORY[0x1E4F228F0]];
        for (i30 = [v815 objectForKeyedSubscript:@"underName"];
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          for (i31 = [i30 objectForKeyedSubscript:@"name"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v912 = i31;
            v725 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v912 count:1];
            [v880 setEventCustomerNames:v725];
          }
          v722 = v880;
        }

        for (i32 = [v815 objectForKeyedSubscript:@"underName"];
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v911 = i32;
          v742 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v911 count:1];
          [v722 setEventCustomerNames:v742];
        }
        for (i33 = [v815 objectForKeyedSubscript:@"reservationFor"];
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          for (i34 = [i33 objectForKeyedSubscript:@"departureBusStop"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i35 = [i34 objectForKeyedSubscript:@"name"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              [v880 setEventStartLocationName:i35];
            }
            for (i36 = [i34 objectForKeyedSubscript:@"address"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              [v880 setEventStartLocationAddress:i36];
            }
          }

          for (i37 = [i33 objectForKeyedSubscript:@"arrivalBusStop"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i38 = [i37 objectForKeyedSubscript:@"name"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              [v880 setEventEndLocationName:i38];
            }
            for (i39 = [i37 objectForKeyedSubscript:@"address"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              [v880 setEventEndLocationAddress:i39];
            }
          }
        }
        [v880 setEventSubType:@"bus"];
        v750 = v812;
        v751 = [v812 startTimeZone];
        v752 = [v751 name];
        if (v752)
        {
          [v880 setStartDateTimeZone:v752];
        }
        else
        {
          v780 = [MEMORY[0x1E4F1CAF0] localTimeZone];
          v781 = [v780 name];
          [v880 setStartDateTimeZone:v781];

          v750 = v812;
        }
        v410 = self;

        v782 = [v750 endTimeZone];
        v783 = [v782 name];
        v4 = v814;
        if (v783)
        {
          v784 = v880;
          [v880 setEndDateTimeZone:v783];
        }
        else
        {
          v785 = [MEMORY[0x1E4F1CAF0] localTimeZone];
          v786 = [v785 name];
          v784 = v880;
          [v880 setEndDateTimeZone:v786];

          v4 = v814;
        }
      }
      else
      {
        v734 = [(SGStorageEvent *)self tags];
        v735 = [MEMORY[0x1E4F5D9F0] extractedTrain];
        int v736 = [v734 containsObject:v735];

        if (v736)
        {
          v737 = v880;
          [v880 setEventType:*MEMORY[0x1E4F228F0]];
          for (i40 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i41 = [i40 objectForKeyedSubscript:@"name"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              v910 = i41;
              v740 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v910 count:1];
              [v880 setEventCustomerNames:v740];
            }
            v737 = v880;
          }

          for (i42 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v909 = i42;
            v771 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v909 count:1];
            [v737 setEventCustomerNames:v771];
          }
          for (i43 = [v815 objectForKeyedSubscript:@"reservationFor"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i44 = [i43 objectForKeyedSubscript:@"departureStation"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              for (i45 = [i44 objectForKeyedSubscript:@"name"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventStartLocationName:i45];
              }
              for (i46 = [i44 objectForKeyedSubscript:@"address"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventStartLocationAddress:i46];
              }
            }

            for (i47 = [i43 objectForKeyedSubscript:@"arrivalStation"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              for (i48 = [i47 objectForKeyedSubscript:@"name"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventEndLocationName:i48];
              }
              for (i49 = [i47 objectForKeyedSubscript:@"address"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventEndLocationAddress:i49];
              }
            }
          }
          v779 = @"train";
        }
        else
        {
          v763 = [(SGStorageEvent *)self tags];
          v764 = [MEMORY[0x1E4F5D9F0] extractedBoat];
          int v765 = [v763 containsObject:v764];

          if (!v765)
          {
            v787 = sgLogHandle();
            if (os_log_type_enabled(v787, OS_LOG_TYPE_ERROR))
            {
              v804 = (objc_class *)objc_opt_class();
              v805 = NSStringFromClass(v804);
              v806 = [v815 objectForKeyedSubscript:@"@type"];
              objc_opt_class();
              uint64_t v807 = objc_opt_isKindOfClass();
              if ((v807 & 1) != 0
                || ([v815 objectForKeyedSubscript:@"@type"],
                    v4 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    (objc_opt_isKindOfClass() & 1) != 0))
              {
                char v808 = v807 ^ 1;
                uint64_t v807 = [v815 objectForKeyedSubscript:@"@type"];
                v809 = [(id)v807 description];
                int v810 = 1;
              }
              else
              {
                int v810 = 0;
                v809 = 0;
                char v808 = 1;
              }
              *(_DWORD *)buf = 138412546;
              id v904 = v805;
              __int16 v905 = 2112;
              v906 = v809;
              _os_log_error_impl(&dword_1CA650000, v787, OS_LOG_TYPE_ERROR, "%@: attributeSet not supported for event type: %@", buf, 0x16u);
              if (v810)
              {
              }
              if (v808) {

              }
              v4 = v814;
            }

            id v29 = 0;
            v613 = v880;
            goto LABEL_755;
          }
          v766 = v880;
          [v880 setEventType:*MEMORY[0x1E4F228F0]];
          for (i50 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i51 = [i50 objectForKeyedSubscript:@"name"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              v908 = i51;
              v769 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v908 count:1];
              [v880 setEventCustomerNames:v769];
            }
            v766 = v880;
          }

          for (i52 = [v815 objectForKeyedSubscript:@"underName"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v907 = i52;
            v789 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v907 count:1];
            [v766 setEventCustomerNames:v789];
          }
          for (i53 = [v815 objectForKeyedSubscript:@"reservationFor"];
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            for (i54 = [i53 objectForKeyedSubscript:@"departureBoatTerminal"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              for (i55 = [i54 objectForKeyedSubscript:@"name"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventStartLocationName:i55];
              }
              for (i56 = [i54 objectForKeyedSubscript:@"address"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventStartLocationAddress:i56];
              }
            }

            for (i57 = [i53 objectForKeyedSubscript:@"arrivalBoatTerminal"];
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              for (i58 = [i57 objectForKeyedSubscript:@"name"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventEndLocationName:i58];
              }
              for (i59 = [i57 objectForKeyedSubscript:@"address"];
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                [v880 setEventEndLocationAddress:i59];
              }
            }
          }
          v779 = @"boat";
        }
        [v880 setEventSubType:v779];
        v797 = v812;
        v798 = [v812 startTimeZone];
        v799 = [v798 name];
        if (v799)
        {
          [v880 setStartDateTimeZone:v799];
        }
        else
        {
          v800 = [MEMORY[0x1E4F1CAF0] localTimeZone];
          v801 = [v800 name];
          [v880 setStartDateTimeZone:v801];

          v797 = v812;
        }
        v410 = self;

        v782 = [v797 endTimeZone];
        v783 = [v782 name];
        if (v783)
        {
          v784 = v880;
          [v880 setEndDateTimeZone:v783];
        }
        else
        {
          v802 = [MEMORY[0x1E4F1CAF0] localTimeZone];
          v803 = [v802 name];
          v784 = v880;
          [v880 setEndDateTimeZone:v803];
        }
        v4 = v814;
      }

      [v784 setEventDuration:v63];
      goto LABEL_754;
    }
    v638 = v880;
    [v880 setEventType:*MEMORY[0x1E4F228B8]];
    v639 = [v815 objectForKeyedSubscript:@"reservationFor"];
LABEL_787:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v726 = [v812 startTimeZone];
      v727 = [v726 name];
      if (v727)
      {
        [v638 setStartDateTimeZone:v727];
      }
      else
      {
        v753 = [MEMORY[0x1E4F1CAF0] localTimeZone];
        v754 = [v753 name];
        [v880 setStartDateTimeZone:v754];

        v638 = v880;
      }

      v755 = [v812 endTimeZone];
      v503 = [v755 name];
      if (v503)
      {
        [v638 setEndDateTimeZone:v503];
      }
      else
      {
        v756 = [MEMORY[0x1E4F1CAF0] localTimeZone];
        v757 = [v756 name];
        [v880 setEndDateTimeZone:v757];

        v638 = v880;
      }

      [v638 setEventDuration:v63];
      v758 = v638;
      v759 = v815;
      v492 = [v815 objectForKeyedSubscript:@"totalPrice"];
      objc_opt_class();
      char v760 = objc_opt_isKindOfClass();
      v410 = self;
      if ((v760 & 1) == 0)
      {
        v503 = [v815 objectForKeyedSubscript:@"totalPrice"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v880 setEventTotalCost:0];
          goto LABEL_628;
        }
        v759 = v815;
        v758 = v880;
      }
      v761 = [v759 objectForKeyedSubscript:@"totalPrice"];
      v762 = [v761 description];
      [v758 setEventTotalCost:v762];

      if ((v760 & 1) == 0) {
        goto LABEL_628;
      }
LABEL_629:

      goto LABEL_630;
    }
    v640 = [v639 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    char v641 = objc_opt_isKindOfClass();
    if ((v641 & 1) != 0
      || ([v639 objectForKeyedSubscript:@"name"],
          uint64_t v642 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          obuint64_t j = (id)v642,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v643 = [v639 objectForKeyedSubscript:@"name"];
      v644 = [v643 description];
      [v638 setEventName:v644];

      if (v641) {
        goto LABEL_794;
      }
    }
    else
    {
      [v638 setEventName:0];
    }

LABEL_794:
    for (i60 = [v639 objectForKeyedSubscript:@"location"];
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v656 = [v639 objectForKeyedSubscript:@"telephone"];
        objc_opt_class();
        char v657 = objc_opt_isKindOfClass();
        if ((v657 & 1) != 0
          || ([v639 objectForKeyedSubscript:@"telephone"],
              uint64_t v658 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v876 = (void *)v658,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          v659 = [v639 objectForKeyedSubscript:@"telephone"];
          uint64_t v660 = [v659 description];
          v661 = v638;
          v662 = (void *)v660;
          [v661 setEventStartLocationTelephone:v660];

          if (v657) {
            goto LABEL_815;
          }
        }
        else
        {
          [v638 setEventStartLocationTelephone:0];
        }

LABEL_815:
        v663 = [v639 objectForKeyedSubscript:@"eventSubType"];
        objc_opt_class();
        char v664 = objc_opt_isKindOfClass();
        if ((v664 & 1) != 0
          || ([v639 objectForKeyedSubscript:@"eventSubType"],
              uint64_t v665 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v875 = (void *)v665,
              v638 = v880,
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          v666 = [v639 objectForKeyedSubscript:@"eventSubType"];
          v667 = [v666 description];
          [v880 setEventSubType:v667];

          v638 = v880;
          if (v664)
          {
LABEL_821:

            v639 = 0;
            goto LABEL_787;
          }
        }
        else
        {
          [v880 setEventSubType:0];
        }

        goto LABEL_821;
      }
      v646 = [v639 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      char v647 = objc_opt_isKindOfClass();
      if ((v647 & 1) != 0
        || ([v639 objectForKeyedSubscript:@"name"],
            uint64_t v2 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v648 = [v639 objectForKeyedSubscript:@"name"];
        uint64_t v649 = [v648 description];
        v650 = v638;
        v651 = (void *)v649;
        [v650 setEventStartLocationName:v649];

        if (v647) {
          goto LABEL_802;
        }
      }
      else
      {
        [v638 setEventStartLocationName:0];
      }

LABEL_802:
      v652 = [v639 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      char v653 = objc_opt_isKindOfClass();
      if ((v653 & 1) == 0)
      {
        uint64_t v3 = [v639 objectForKeyedSubscript:@"address"];
        objc_opt_class();
        v638 = v880;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v880 setEventStartLocationAddress:0];
LABEL_807:

          goto LABEL_808;
        }
      }
      v654 = [v639 objectForKeyedSubscript:@"address"];
      v655 = [v654 description];
      v638 = v880;
      [v880 setEventStartLocationAddress:v655];

      if ((v653 & 1) == 0) {
        goto LABEL_807;
      }
LABEL_808:
    }
  }
  [v880 setEventType:*MEMORY[0x1E4F228E0]];
  v85 = v880;
  v86 = v815;
  v87 = [v815 objectForKeyedSubscript:@"reservationId"];
  objc_opt_class();
  char v88 = objc_opt_isKindOfClass();
  if ((v88 & 1) == 0)
  {
    v83 = [v815 objectForKeyedSubscript:@"reservationId"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v880 setEventReservationID:0];
      goto LABEL_632;
    }
    v86 = v815;
    v85 = v880;
  }
  v89 = [v86 objectForKeyedSubscript:@"reservationId"];
  v90 = [v89 description];
  [v85 setEventReservationID:v90];

  if ((v88 & 1) == 0) {
LABEL_632:
  }

  v514 = [v815 objectForKeyedSubscript:@"underName"];
  unint64_t v515 = 0x1E4F1C000uLL;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v516 = [v514 objectForKeyedSubscript:@"name"];
    v517 = [v516 componentsSeparatedByString:@", "];
    [v880 setEventCustomerNames:v517];

    v514 = 0;
  }

  v518 = [v815 objectForKeyedSubscript:@"underName"];
  v519 = v880;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v520 = [v518 componentsSeparatedByString:@", "];
    [v880 setEventCustomerNames:v520];

    v518 = 0;
  }

  for (i61 = [v815 objectForKeyedSubscript:@"broker"];
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    for (i62 = [i61 objectForKeyedSubscript:@"name"];
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v880 setEventProvider:i62];
    }
  }

  v523 = [v812 startTimeZone];
  v524 = [v523 name];
  if (v524)
  {
    [v880 setStartDateTimeZone:v524];
  }
  else
  {
    v525 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    v526 = [v525 name];
    [v880 setStartDateTimeZone:v526];

    v519 = v880;
  }

  v527 = [v815 objectForKeyedSubscript:@"reservationFor"];
  v528 = @"name";
  v529 = @"telephone";
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    unint64_t v530 = v515;
    v531 = [v527 objectForKeyedSubscript:v528];
    objc_opt_class();
    char v532 = objc_opt_isKindOfClass();
    if ((v532 & 1) != 0
      || ([v527 objectForKeyedSubscript:v528],
          uint64_t v533 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          obuint64_t j = (id)v533,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v534 = [v527 objectForKeyedSubscript:v528];
      uint64_t v535 = [v534 description];
      v536 = v519;
      v537 = (void *)v535;
      [v536 setEventStartLocationName:v535];

      if (v532) {
        goto LABEL_656;
      }
    }
    else
    {
      [v519 setEventStartLocationName:0];
    }

LABEL_656:
    v538 = [v527 objectForKeyedSubscript:v529];
    objc_opt_class();
    char v539 = objc_opt_isKindOfClass();
    if ((v539 & 1) != 0
      || ([v527 objectForKeyedSubscript:v529],
          uint64_t v540 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v876 = (void *)v540,
          v519 = v880,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v527 objectForKeyedSubscript:v529];
      v541 = v529;
      v543 = v542 = v528;
      v544 = [v543 description];
      v519 = v880;
      [v880 setEventStartLocationTelephone:v544];

      v528 = v542;
      v529 = v541;
      if (v539) {
        goto LABEL_662;
      }
    }
    else
    {
      [v880 setEventStartLocationTelephone:0];
    }

LABEL_662:
    for (i63 = [v527 objectForKeyedSubscript:@"address"];
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v519 setEventStartLocationAddress:i63];
    }
    v527 = 0;
    unint64_t v515 = v530;
  }

  v546 = v815;
  v547 = [v815 objectForKeyedSubscript:@"partySize"];
  objc_opt_class();
  char v548 = objc_opt_isKindOfClass();
  v410 = self;
  if (v548) {
    goto LABEL_669;
  }
  v528 = [v815 objectForKeyedSubscript:@"partySize"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v880 setRestaurantPartySize:0];
LABEL_678:

    goto LABEL_679;
  }
  v546 = v815;
LABEL_669:
  v549 = [v546 objectForKeyedSubscript:@"partySize"];
  v550 = [v549 description];
  [v880 setRestaurantPartySize:v550];

  if ((v548 & 1) == 0) {
    goto LABEL_678;
  }
LABEL_679:

  id v559 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v560 = (void *)[v559 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v561 = [v812 startTimeZone];
  v4 = v814;
  if (v561)
  {
    [v560 setTimeZone:v561];
  }
  else
  {
    v562 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [v560 setTimeZone:v562];
  }
  v563 = [v812 startDate];
  v564 = [v560 components:32 fromDate:v563];

  unint64_t v565 = [v564 hour] - 6;
  if (v565 <= 0x11) {
    [v880 setRestaurantMealType:off_1E65BBD10[v565]];
  }
LABEL_684:

LABEL_754:
  v612 = [(SGStorageEvent *)v410 title];
  v613 = v880;
  [v880 setTitle:v612];

  [(SGStorageEvent *)v410 creationTimestamp];
  v615 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v614];
  [v880 setContentCreationDate:v615];

  id v29 = v880;
LABEL_755:

  v28 = v815;
LABEL_756:

LABEL_757:
  return v29;
}

uint64_t __38__SGStorageEvent_attributeSetForEvent__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 second];
}

uint64_t __38__SGStorageEvent_attributeSetForEvent__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 first];
}

id __38__SGStorageEvent_attributeSetForEvent__block_invoke_2(uint64_t a1, void *a2)
{
  v53[3] = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  uint64_t v3 = [v38 objectForKeyedSubscript:@"underName"];
  v4 = 0;
  unint64_t v5 = 0x1E4F29000uLL;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v6 = [v3 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v2 = [v3 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v8 = [v3 objectForKeyedSubscript:@"name"];
    uint64_t v9 = [v8 description];

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
LABEL_9:

    uint64_t v3 = 0;
    v4 = (__CFString *)v9;
  }

  for (uint64_t i = [v38 objectForKeyedSubscript:@"underName"];
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }

    v4 = i;
  }

  char v11 = [v38 objectForKeyedSubscript:@"reservedTicket"];
  v12 = 0;
  v39 = v4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v40 = v11;
    for (uint64_t j = [v11 objectForKeyedSubscript:@"ticketedSeat"];
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v14 = [j objectForKeyedSubscript:@"seatSection"];
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();
      v52 = v12;
      if ((v15 & 1) != 0
        || ([j objectForKeyedSubscript:@"seatSection"],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v43 = (void *)v16,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v51 = v15 ^ 1;
        v49 = [j objectForKeyedSubscript:@"seatSection"];
        [v49 description];
        int v50 = 1;
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = v46;
      }
      else
      {
        uint64_t v17 = 0;
        int v50 = 0;
        char v51 = 1;
      }
      if (!v17) {
        uint64_t v17 = &stru_1F24EEF20;
      }
      v53[0] = v17;
      uint64_t v18 = [j objectForKeyedSubscript:@"seatRow"];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();
      if ((v19 & 1) != 0
        || ([j objectForKeyedSubscript:@"seatRow"],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v42 = (void *)v20,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v21 = v19 ^ 1;
        v48 = [j objectForKeyedSubscript:@"seatRow"];
        [v48 description];
        int v22 = 1;
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v23 = v45;
      }
      else
      {
        int v22 = 0;
        v23 = 0;
        char v21 = 1;
      }
      if (!v23) {
        v23 = &stru_1F24EEF20;
      }
      v53[1] = v23;
      v24 = [j objectForKeyedSubscript:@"seatNumber"];
      unint64_t v25 = v5;
      objc_opt_class();
      char v26 = objc_opt_isKindOfClass();
      if ((v26 & 1) != 0
        || ([j objectForKeyedSubscript:@"seatNumber"],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v41 = (void *)v27,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v28 = v26 ^ 1;
        v47 = [j objectForKeyedSubscript:@"seatNumber"];
        [v47 description];
        int v29 = 1;
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v30 = v44;
      }
      else
      {
        int v29 = 0;
        id v30 = 0;
        char v28 = 1;
      }
      if (!v30) {
        id v30 = &stru_1F24EEF20;
      }
      v53[2] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
      if (v29)
      {
      }
      if (v28) {

      }
      if (v22)
      {
      }
      if (v21) {

      }
      if (v50)
      {
      }
      if (v51) {

      }
      uint64_t v32 = objc_msgSend(v31, "_pas_filteredArrayWithTest:", &__block_literal_global_181_32381);

      objc_msgSend(v32, "_pas_componentsJoinedByString:", @" ");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      unint64_t v5 = v25;
    }

    uint64_t v33 = [v40 objectForKeyedSubscript:@"ticketedSeat"];
    v4 = v39;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }

      v12 = v33;
      uint64_t v33 = 0;
    }

    char v11 = 0;
  }

  if ([(__CFString *)v4 length] || [(__CFString *)v12 length])
  {
    if (v4) {
      uint64_t v34 = v4;
    }
    else {
      uint64_t v34 = &stru_1F24EEF20;
    }
    if (v12) {
      v35 = v12;
    }
    else {
      v35 = &stru_1F24EEF20;
    }
    v36 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v34 second:v35];
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

BOOL __38__SGStorageEvent_attributeSetForEvent__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

uint64_t __38__SGStorageEvent_attributeSetForEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)heuristicUpdatingEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  v4 = [MEMORY[0x1E4F5DAF0] disabledEventUpdateCategories];
  if ([v4 count])
  {
    unint64_t v5 = [MEMORY[0x1E4F5D9F0] entityTagToEventCategoryMapping];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->_tags;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v11 && ([v4 containsObject:v11] & 1) != 0)
          {

            BOOL v12 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_14:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)loggingIdentifier
{
  if (self->_duplicateKey) {
    id v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", -[SGDuplicateKey hash](self->_duplicateKey, "hash"));
  }
  else {
    id v2 = &stru_1F24EEF20;
  }
  if ((unint64_t)[(__CFString *)v2 length] > 0xC)
  {
    -[__CFString substringWithRange:](v2, "substringWithRange:", 0, 12);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (id)poiFilters
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_tags;
  uint64_t v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isPOIFilters", (void)v8))
        {
          uint64_t v3 = [v6 value];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)geocodingMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = self->_tags;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v8 = objc_msgSend(MEMORY[0x1E4F5D9F0], "geocodingModeAddressOnly", (void)v16);
        char v9 = [v7 isEqualToEntityTag:v8];

        if (v9)
        {
          unint64_t v14 = 1;
          goto LABEL_16;
        }
        long long v10 = [MEMORY[0x1E4F5D9F0] geocodingModePOIOnly];
        char v11 = [v7 isEqualToEntityTag:v10];

        if (v11)
        {
          unint64_t v14 = 2;
          goto LABEL_16;
        }
        BOOL v12 = [MEMORY[0x1E4F5D9F0] geocodingModeAddressThenPOI];
        char v13 = [v7 isEqualToEntityTag:v12];

        if (v13)
        {
          unint64_t v14 = 3;
          goto LABEL_16;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      unint64_t v14 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((v13 == 0) != (v15 == 0)) {
    __assert_rtn("-[SGStorageEvent geocodedEventWithStartDate:startTimeZone:endDate:endTimeZone:locations:]", "SGStorageEvent.m", 244, "!startTimeZone == !endTimeZone");
  }
  id v17 = v16;
  v39 = v13;
  v40 = v12;
  id v38 = v14;
  v36 = v15;
  if (v12)
  {
    if (v13) {
      [MEMORY[0x1E4F5DB40] rangeWithStartDate:v12 startTimeZone:v13 endDate:v14 endTimeZone:v15];
    }
    else {
    v37 = [MEMORY[0x1E4F5DB40] floatingRangeWithUTCStartDate:v12 endDate:v14];
    }
  }
  else
  {
    v37 = 0;
  }
  long long v18 = [SGStorageEvent alloc];
  v35 = [(SGStorageEvent *)self recordId];
  long long v19 = [(SGStorageEvent *)self duplicateKey];
  uint64_t v20 = [(SGStorageEvent *)self sourceKey];
  uint64_t v21 = [(SGStorageEvent *)self content];
  int v22 = [(SGStorageEvent *)self title];
  [(SGStorageEvent *)self creationTimestamp];
  double v24 = v23;
  [(SGStorageEvent *)self lastModifiedTimestamp];
  double v26 = v25;
  uint64_t v27 = [(SGStorageEvent *)self tags];
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v17];
  int v29 = [(SGStorageEvent *)self structuredData];
  uint64_t v34 = v17;
  unsigned int v30 = [(SGStorageEvent *)self state];
  BYTE4(v33) = [(SGStorageEvent *)self curated];
  LODWORD(v33) = v30;
  v31 = -[SGStorageEvent initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:](v18, "initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:", v35, v19, v20, v21, v22, v27, v24, v26, v37, v28, v29, v33);

  return v31;
}

- (id)geocodeEndTimeZone
{
  id v2 = [(SGStorageEvent *)self when];
  uint64_t v3 = [v2 endTimeZone];

  return v3;
}

- (id)geocodeEndDate
{
  id v2 = [(SGStorageEvent *)self when];
  uint64_t v3 = [v2 endDate];

  return v3;
}

- (id)geocodeStartTimeZone
{
  id v2 = [(SGStorageEvent *)self when];
  uint64_t v3 = [v2 startTimeZone];

  return v3;
}

- (id)geocodeStartDate
{
  id v2 = [(SGStorageEvent *)self when];
  uint64_t v3 = [v2 startDate];

  return v3;
}

- (NSString)description
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"<SGStorageEvent title:%@ dupKey:%@ when:%@>", self->_title, self->_duplicateKey, self->_when];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SGRecordId *)self->_recordId hash];
  unint64_t v4 = [(SGDuplicateKey *)self->_duplicateKey hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_sourceKey hash];
  return (unint64_t)self->_creationTimestamp.secondsFromUnixEpoch
       - (v5
        - v4
        + 32 * v4)
       + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqualToStorageEvent:(id)a3
{
  unint64_t v4 = (id *)a3;
  recordId = self->_recordId;
  uint64_t v6 = (SGRecordId *)v4[2];
  if (recordId == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    long long v8 = recordId;
    char v9 = [(SGRecordId *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_41;
    }
  }
  duplicateKey = self->_duplicateKey;
  char v11 = (SGDuplicateKey *)v4[3];
  if (duplicateKey == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = duplicateKey;
    BOOL v14 = [(SGDuplicateKey *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_41;
    }
  }
  sourceKey = self->_sourceKey;
  id v16 = (NSString *)v4[4];
  if (sourceKey == v16)
  {
  }
  else
  {
    id v17 = v16;
    long long v18 = sourceKey;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_41;
    }
  }
  content = self->_content;
  uint64_t v21 = (NSString *)v4[5];
  if (content == v21)
  {
  }
  else
  {
    int v22 = v21;
    double v23 = content;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_41;
    }
  }
  title = self->_title;
  double v26 = (NSString *)v4[6];
  if (title == v26)
  {
  }
  else
  {
    uint64_t v27 = v26;
    char v28 = title;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_41;
    }
  }
  if (self->_creationTimestamp.secondsFromUnixEpoch != *((double *)v4 + 7)
    || self->_lastModifiedTimestamp.secondsFromUnixEpoch != *((double *)v4 + 8))
  {
    goto LABEL_41;
  }
  when = self->_when;
  v31 = (SGSimpleTimeRange *)v4[9];
  if (when == v31)
  {
  }
  else
  {
    uint64_t v32 = v31;
    uint64_t v33 = when;
    char v34 = [(SGSimpleTimeRange *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_41;
    }
  }
  locations = self->_locations;
  v36 = (NSArray *)v4[10];
  if (locations == v36)
  {
  }
  else
  {
    v37 = v36;
    id v38 = locations;
    char v39 = [(NSArray *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_41;
    }
  }
  tags = self->_tags;
  v41 = (NSSet *)v4[11];
  if (tags == v41)
  {
  }
  else
  {
    v42 = v41;
    v43 = tags;
    char v44 = [(NSSet *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_41;
    }
  }
  structuredData = self->_structuredData;
  v46 = (NSData *)v4[12];
  if (structuredData == v46)
  {
  }
  else
  {
    v47 = v46;
    v48 = structuredData;
    char v49 = [(NSData *)v48 isEqual:v47];

    if ((v49 & 1) == 0) {
      goto LABEL_41;
    }
  }
  if (self->_state != *((_DWORD *)v4 + 3))
  {
LABEL_41:
    BOOL v50 = 0;
    goto LABEL_42;
  }
  BOOL v50 = self->_curated == *((unsigned __int8 *)v4 + 8);
LABEL_42:

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SGStorageEvent *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStorageEvent *)self isEqualToStorageEvent:v5];

  return v6;
}

- (id)fieldsToSaveOnConfirmation
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  unint64_t v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKeyedSubscript:@"summary"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKeyedSubscript:@"description"];
  }
  when = self->_when;
  if (when) {
    [v4 setObject:when forKeyedSubscript:@"when"];
  }
  long long v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SGStorageEvent isCancelled](self, "isCancelled"));
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"cancelled"];
  }

  return v4;
}

- (id)extraKeyTag
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_tags;
  id v3 = (id)[(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isExtraKey", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSSet *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)opaqueKey
{
  id v2 = [(SGDuplicateKey *)self->_duplicateKey pseudoEventKey];
  id v3 = [v2 serialize];

  return (NSString *)v3;
}

- (BOOL)isAllDay
{
  tags = self->_tags;
  id v3 = [MEMORY[0x1E4F5D9F0] allDay];
  LOBYTE(tags) = [(NSSet *)tags containsObject:v3];

  return (char)tags;
}

- (BOOL)isCancelled
{
  tags = self->_tags;
  id v3 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
  LOBYTE(tags) = [(NSSet *)tags containsObject:v3];

  return (char)tags;
}

- (BOOL)isFromDataDetectors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = self->_tags;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "isUrl", (void)v12))
        {
          long long v8 = [v7 value];
          char v9 = [v8 hasPrefix:@"message:"];

          if (v9)
          {
            BOOL v10 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (SGStorageEvent)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 content:(id)a6 title:(id)a7 creationTimestamp:(SGUnixTimestamp_)a8 lastModifiedTimestamp:(SGUnixTimestamp_)a9 tags:(id)a10 when:(id)a11 locations:(id)a12 structuredData:(id)a13 state:(unsigned int)a14 curated:(BOOL)a15
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v43 = a4;
  id v42 = a5;
  id v41 = a6;
  id v40 = a7;
  id v39 = a10;
  id v38 = a11;
  id v24 = a12;
  id v25 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SGStorageEvent;
  double v26 = [(SGStorageEvent *)&v44 init];
  if (v26)
  {
    uint64_t v27 = [v23 copy];
    recordId = v26->_recordId;
    v26->_recordId = (SGRecordId *)v27;

    objc_storeStrong((id *)&v26->_duplicateKey, a4);
    objc_storeStrong((id *)&v26->_sourceKey, a5);
    objc_storeStrong((id *)&v26->_content, a6);
    objc_storeStrong((id *)&v26->_title, a7);
    v26->_creationTimestamp = a8;
    v26->_lastModifiedTimestamp = a9;
    objc_storeStrong((id *)&v26->_tags, a10);
    objc_storeStrong((id *)&v26->_when, a11);
    id v29 = v24;
    if (v29)
    {
      unsigned int v30 = (NSArray *)objc_opt_new();
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v31 = v29;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(v31);
            }
            [(NSArray *)v30 addObject:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v33);
      }

      [(NSArray *)v30 sortUsingComparator:&__block_literal_global_430];
    }
    else
    {
      unsigned int v30 = 0;
    }

    locations = v26->_locations;
    v26->_locations = v30;

    objc_storeStrong((id *)&v26->_structuredData, a13);
    v26->_state = a14;
    v26->_curated = a15;
  }

  return v26;
}

- (id)convertToEvent:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F5DAC8] originForDuplicateKey:self->_duplicateKey sourceKey:self->_sourceKey store:a3];
  uint64_t v5 = [(SGStorageEvent *)self convertToEventWithOrigin:v4];
  BOOL v6 = [(SGStorageEvent *)self attributeSetForEvent];
  [v5 setAttributeSetForEvent:v6];

  return v5;
}

- (id)convertToEventWithOrigin:(id)a3
{
  id v26 = a3;
  id v24 = v26;
  id v16 = sgMap();
  recordId = self->_recordId;
  id v22 = (id)MEMORY[0x1E4F5DA00];
  uint64_t v20 = [(SGDuplicateKey *)self->_duplicateKey serialize];
  id v25 = [(SGDuplicateKey *)self->_duplicateKey entityKey];
  uint64_t v4 = [v25 serialize];
  title = self->_title;
  uint64_t v17 = (void *)v4;
  content = self->_content;
  long long v15 = [(SGSimpleTimeRange *)self->_when startDate];
  uint64_t v5 = [(SGSimpleTimeRange *)self->_when startTimeZone];
  BOOL v6 = [(SGSimpleTimeRange *)self->_when endDate];
  uint64_t v7 = [(SGSimpleTimeRange *)self->_when endTimeZone];
  BOOL v8 = [(SGStorageEvent *)self isAllDay];
  char v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_creationTimestamp.secondsFromUnixEpoch];
  BOOL v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_lastModifiedTimestamp.secondsFromUnixEpoch];
  long long v11 = [(NSSet *)self->_tags allObjects];
  long long v12 = [(SGStorageEvent *)self urlFromTags];
  LOBYTE(v14) = v8;
  id v23 = [v22 eventWithRecordId:recordId origin:v24 uniqueKey:v20 opaqueKey:v17 title:title notes:content start:v15 startTimeZone:v5 end:v6 endTimeZone:v7 isAllDay:v14 creationDate:v9 lastModifiedDate:v10 locations:v16 tags:v11 URL:v12];

  return v23;
}

uint64_t __43__SGStorageEvent_convertToEventWithOrigin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 convertToLocationWithId:*(void *)(*(void *)(a1 + 32) + 16) origin:*(void *)(a1 + 40)];
}

- (id)urlFromTags
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = self->_tags;
  uint64_t v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "isUrl", (void)v10))
        {
          uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
          BOOL v8 = [v6 value];
          uint64_t v3 = [v7 URLWithString:v8];

          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[(NSSet *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)_dateForUTCDate:(id)a3 withTimeZone:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  char v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  long long v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v9 setTimeZone:v10];

  long long v11 = [v9 components:1048828 fromDate:v7];

  [v11 setTimeZone:v6];
  long long v12 = [v9 dateFromComponents:v11];

  return v12;
}

+ (id)storageEventFromEntity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [SGStorageEvent alloc];
  uint64_t v5 = [v3 recordId];
  id v6 = [v3 duplicateKey];
  id v22 = [v3 sourceKey];
  uint64_t v21 = [v3 content];
  uint64_t v20 = [v3 title];
  [v3 creationTimestamp];
  double v8 = v7;
  [v3 lastModifiedTimestamp];
  double v10 = v9;
  long long v11 = [v3 tags];
  long long v12 = [v3 timeRange];
  long long v13 = [v3 locations];
  uint64_t v14 = [v3 structuredData];
  int v15 = [v3 state];
  id v16 = [v3 duplicateKey];

  BYTE4(v18) = [v16 entityType] == 1;
  LODWORD(v18) = v15;
  char v19 = -[SGStorageEvent initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:](v4, "initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:", v5, v6, v22, v21, v20, v11, v8, v10, v12, v13, v14, v18);

  return v19;
}

@end