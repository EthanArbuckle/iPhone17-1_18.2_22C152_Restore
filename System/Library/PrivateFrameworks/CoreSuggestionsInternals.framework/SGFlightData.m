@interface SGFlightData
+ (id)airportNameNoiseKeywords;
+ (id)iataCodeToCityDatabaseDict;
+ (id)sanitizeAirportName:(id)a3;
+ (id)sharedInstance;
- (SGFlightData)init;
- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 otherKnownFlightsToAirport:(id)a6 outputInfos:(id)a7;
- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 outputInfos:(id)a6;
- (id)airportIataCodes;
- (id)airportIataCodesForDataOffset:(id)a3;
- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4;
- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4 withDataOffset:(id)a5 andFileHandle:(id)a6;
- (id)bestLocalizedNameForAirport:(id)a3;
- (id)carrierIataCodeForCarrierName:(id)a3;
- (id)carrierIataCodes;
- (id)cityForIataCode:(id)a3;
- (id)fieldForIataCode:(id)a3 field:(id)a4;
- (id)latitudeAndLongitudeForAirport:(id)a3;
- (id)latitudeAndLongitudeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5;
- (id)nameForCarrier:(id)a3;
- (id)namesForAirport:(id)a3;
- (id)namesForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5;
- (id)timezoneOlsonCodeForAirport:(id)a3;
- (id)timezoneOlsonCodeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5;
- (void)dealloc;
- (void)updateAirports;
- (void)updateCarriers;
- (void)updateFlights;
@end

@implementation SGFlightData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierUpdateCodesByName, 0);
  objc_storeStrong((id *)&self->_carrierUpdateNames, 0);
  objc_storeStrong((id *)&self->_carrierCodesByName, 0);
  objc_storeStrong((id *)&self->_carrierNames, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_airportUpdateDataOffsets, 0);
  objc_storeStrong((id *)&self->_airportsUpdateFh, 0);
  objc_storeStrong((id *)&self->_airportDataOffsets, 0);
  objc_storeStrong((id *)&self->_airportsFh, 0);
  objc_storeStrong((id *)&self->_flightUpdateDataOffsets, 0);
  objc_storeStrong((id *)&self->_flightsUpdateFh, 0);
  objc_storeStrong((id *)&self->_flightDataOffsets, 0);
  objc_storeStrong((id *)&self->_flightsFh, 0);
}

- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 otherKnownFlightsToAirport:(id)a6 outputInfos:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v88 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = [NSNumber numberWithUnsignedShort:v9];
  LOBYTE(a6) = [v13 containsObject:v15];

  v87 = v14;
  if ((a6 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1CB79B230]();
    v17 = [NSNumber numberWithUnsignedShort:v9];
    uint64_t v18 = [v13 arrayByAddingObject:v17];

    id v13 = (id)v18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = objc_opt_class();
    v20 = (void *)MEMORY[0x1CB79B230]();
    v21 = [v12 lowercaseString];
    v22 = [v19 sanitizeAirportName:v21];

    v98 = v22;
    uint64_t v23 = [v22 length];
    if (![v13 count])
    {
      v85 = [MEMORY[0x1E4F28B00] currentHandler];
      [v85 handleFailureInMethod:a2, self, @"SGFlightData.m", 610, @"Invalid parameter not satisfying: %@", @"flightCodes.count > 0" object file lineNumber description];
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v86 = v13;
    id v24 = v13;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v108 objects:v122 count:16];
    unint64_t v26 = 0x1E4F28000;
    if (v25)
    {
      uint64_t v27 = v25;
      v89 = 0;
      uint64_t v28 = *(void *)v109;
      uint64_t v29 = v9;
      while (2)
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v109 != v28) {
            objc_enumerationMutation(v24);
          }
          v31 = *(void **)(*((void *)&v108 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v33 = [v31 unsignedIntegerValue];
          v34 = [(SGFlightData *)self airportsServicedByCarrier:v88 flightNumber:(unsigned __int16)v33];
          v35 = v34;
          if (v33 == v29 || [v34 count])
          {
            if (v89)
            {
              [v89 intersectSet:v35];
              v36 = v89;
            }
            else
            {
              v36 = (void *)[v35 mutableCopy];
            }
            unint64_t v26 = 0x1E4F28000;
            v89 = v36;
            if (![v36 count])
            {
              v41 = sgLogHandle();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_INFO, "No airports found in common", buf, 2u);
              }

              v42 = sgLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                v81 = objc_msgSend(v24, "_pas_componentsJoinedByString:", @", ");
                *(_DWORD *)buf = 138740483;
                v115 = v98;
                __int16 v116 = 2117;
                uint64_t v117 = (uint64_t)v81;
                __int16 v118 = 2117;
                id v119 = v88;
                _os_log_debug_impl(&dword_1CA650000, v42, OS_LOG_TYPE_DEBUG, "Could not get airport code for airport \"%{sensitive}@\" from flights %{sensitive}@ on carrier %{sensitive}@ because they do not have at least 1 airport in common", buf, 0x20u);

                unint64_t v26 = 0x1E4F28000;
              }

              goto LABEL_32;
            }
          }
          else
          {
            unint64_t v26 = 0x1E4F28000;
          }

          ++v30;
        }
        while (v27 != v30);
        uint64_t v37 = [v24 countByEnumeratingWithState:&v108 objects:v122 count:16];
        uint64_t v27 = v37;
        if (v37) {
          continue;
        }
        break;
      }
    }
    else
    {
      v89 = 0;
    }
LABEL_32:

    if ([v89 count] == 1)
    {
      v43 = sgLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v82 = (void *)MEMORY[0x1CB79B230]();
        v83 = objc_msgSend(v24, "_pas_componentsJoinedByString:", @", ");
        v84 = [v89 anyObject];
        *(_DWORD *)buf = 138740739;
        v115 = v98;
        __int16 v116 = 2117;
        uint64_t v117 = (uint64_t)v83;
        __int16 v118 = 2117;
        id v119 = v88;
        __int16 v120 = 2117;
        v121 = v84;
        _os_log_debug_impl(&dword_1CA650000, v43, OS_LOG_TYPE_DEBUG, "Skipping levenshtein for airport \"%{sensitive}@\" flights %{sensitive}@ on carrier %{sensitive}@ because they have exactly one airport in common: %{sensitive}@", buf, 0x2Au);
      }
      v44 = v89;
      v97 = [v89 anyObject];
      uint64_t v23 = 0;
    }
    else
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id obj = v89;
      uint64_t v92 = [obj countByEnumeratingWithState:&v104 objects:v113 count:16];
      if (v92)
      {
        v97 = 0;
        uint64_t v91 = *(void *)v105;
        do
        {
          uint64_t v45 = 0;
          do
          {
            if (*(void *)v105 != v91) {
              objc_enumerationMutation(obj);
            }
            uint64_t v94 = v45;
            v46 = *(void **)(*((void *)&v104 + 1) + 8 * v45);
            context = (void *)MEMORY[0x1CB79B230]();
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v95 = v46;
            id v96 = [(SGFlightData *)self namesForAirport:v46];
            uint64_t v47 = [v96 countByEnumeratingWithState:&v100 objects:v112 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v101;
              do
              {
                for (uint64_t i = 0; i != v48; ++i)
                {
                  unint64_t v51 = v23;
                  if (*(void *)v101 != v49) {
                    objc_enumerationMutation(v96);
                  }
                  v52 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                  v53 = (void *)MEMORY[0x1CB79B230]();
                  v54 = objc_opt_class();
                  v55 = [v52 second];
                  v56 = [v55 lowercaseString];
                  v57 = [v54 sanitizeAirportName:v56];
                  unint64_t v58 = +[SGLevenshtein distanceBetweenStrings:v57 and:v98];

                  if (v58 >= v51)
                  {
                    uint64_t v23 = v51;
                  }
                  else
                  {
                    id v59 = v95;

                    v97 = v59;
                    uint64_t v23 = v58;
                  }
                }
                uint64_t v48 = [v96 countByEnumeratingWithState:&v100 objects:v112 count:16];
              }
              while (v48);
            }

            uint64_t v45 = v94 + 1;
          }
          while (v94 + 1 != v92);
          uint64_t v92 = [obj countByEnumeratingWithState:&v104 objects:v113 count:16];
        }
        while (v92);
      }
      else
      {
        v97 = 0;
      }

      unint64_t v26 = 0x1E4F28000uLL;
      v44 = v89;
    }
    v60 = (void *)[@"airportCodeCandidats_" mutableCopy];
    uint64_t v61 = +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2, (double)(unint64_t)[v44 count]);
    unint64_t v63 = (unint64_t)v62;
    v64 = (void *)MEMORY[0x1CB79B230](v61);
    v65 = [*(id *)(v26 + 3792) numberWithUnsignedLong:v63];
    v66 = [v65 stringValue];

    [v60 appendString:v66];

    v67 = (void *)[@"airportInitScore_" mutableCopy];
    unint64_t v68 = +[SGRTCLogging bucketizeInteger:withBucketSize:limit:](SGRTCLogging, "bucketizeInteger:withBucketSize:limit:", [v98 length], 5, 60);
    v69 = (void *)MEMORY[0x1CB79B230]();
    v70 = [*(id *)(v26 + 3792) numberWithUnsignedLong:v68];
    v71 = [v70 stringValue];

    [v67 appendString:v71];

    v72 = (void *)[@"airportBestScore_" mutableCopy];
    v73 = (void *)MEMORY[0x1CB79B230]();
    v74 = [*(id *)(v26 + 3792) numberWithUnsignedLong:v23];
    v75 = v74;
    if (!v74) {
      v74 = &unk_1F2535928;
    }
    v76 = [v74 stringValue];

    [v72 appendString:v76];

    v40 = v87;
    if (v60) {
      [v87 addObject:v60];
    }
    if (v67) {
      [v87 addObject:v67];
    }
    if (v72) {
      [v87 addObject:v72];
    }
    id v39 = v97;

    id v13 = v86;
    id v12 = v98;
  }
  else
  {
    v38 = sgLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      v78 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v78);
      v80 = +[SGAsset asset];
      *(_DWORD *)buf = 138412546;
      v115 = v79;
      __int16 v116 = 2048;
      uint64_t v117 = [v80 assetVersion];
      _os_log_fault_impl(&dword_1CA650000, v38, OS_LOG_TYPE_FAULT, "Expecting NSString for airportName but found something else: %@. Asset version = %lu", buf, 0x16u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    id v39 = 0;
    v40 = v87;
  }

  return v39;
}

- (id)airportCodeForAirportName:(id)a3 flightCarrier:(id)a4 flightNumber:(unsigned __int16)a5 outputInfos:(id)a6
{
  uint64_t v6 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  v10 = NSNumber;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 numberWithUnsignedShort:v6];
  v18[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v16 = [(SGFlightData *)self airportCodeForAirportName:v13 flightCarrier:v12 flightNumber:v6 otherKnownFlightsToAirport:v15 outputInfos:v11];

  return v16;
}

- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  flightUpdateDataOffsets = self->_flightUpdateDataOffsets;
  id v7 = a3;
  v8 = [(_PASLazyPurgeableResult *)flightUpdateDataOffsets result];
  uint64_t v9 = [(SGFlightData *)self airportsServicedByCarrier:v7 flightNumber:v4 withDataOffset:v8 andFileHandle:self->_flightsUpdateFh];
  v10 = [(_PASLazyPurgeableResult *)self->_flightDataOffsets result];
  id v11 = [(SGFlightData *)self airportsServicedByCarrier:v7 flightNumber:v4 withDataOffset:v10 andFileHandle:self->_flightsFh];

  id v12 = [v9 setByAddingObjectsFromSet:v11];

  return v12;
}

- (id)airportsServicedByCarrier:(id)a3 flightNumber:(unsigned __int16)a4 withDataOffset:(id)a5 andFileHandle:(id)a6
{
  unsigned int v8 = a4;
  id v9 = a3;
  v10 = a5;
  id v11 = a6;
  id v12 = v9;
  uint64_t v13 = objc_msgSend(v10, "seekLocationForKey:", objc_msgSend(v12, "UTF8String"));
  if (v13
    && ([v11 seekToFileOffset:v13],
        int v14 = objc_msgSend(v10, "payloadCountForKey:", objc_msgSend(v12, "UTF8String")),
        int v15 = v14 - 1,
        v14 >= 1))
  {
    unsigned __int16 v16 = 0;
    while (1)
    {
      id v17 = v11;
      unsigned int v18 = bswap32(*(unsigned __int16 *)[v17 dataOfLength:2]) >> 16;
      id v19 = v17;
      unsigned int v20 = *(unsigned __int16 *)[v19 dataOfLength:2];
      id v21 = v19;
      v22 = (unsigned __int8 *)[v21 dataOfLength:1];

      v16 += v18;
      if (v16 == v8) {
        break;
      }
      if (v16 > v8 || v15-- == 0) {
        goto LABEL_10;
      }
    }
    [v21 seekToFileOffset:(*v22 | ((unint64_t)__rev16(v20) << 8)) + v10[4] + v10[5]];
    id v26 = v21;
    uint64_t v27 = *(unsigned __int8 *)[v26 dataOfLength:1];
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v27];
    if (v27)
    {
      unsigned int v28 = 0;
      do
      {
        uint64_t v29 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v26, "dataOfLength:", 3), 3, 1);
        [v24 addObject:v29];

        ++v28;
      }
      while (v28 < v27);
    }
  }
  else
  {
LABEL_10:
    id v24 = objc_opt_new();
  }

  return v24;
}

- (id)nameForCarrier:(id)a3
{
  id v4 = a3;
  v5 = [(_PASLazyPurgeableResult *)self->_carrierUpdateNames result];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(_PASLazyPurgeableResult *)self->_carrierNames result];
    id v8 = [v9 objectForKeyedSubscript:v4];
  }
  return v8;
}

- (id)carrierIataCodeForCarrierName:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v6 = [v4 lowercaseString];
  id v7 = [(_PASLazyPurgeableResult *)self->_carrierUpdateCodesByName result];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(_PASLazyPurgeableResult *)self->_carrierCodesByName result];
    id v10 = [v11 objectForKeyedSubscript:v6];
  }
  return v10;
}

- (id)carrierIataCodes
{
  v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  id v4 = [(_PASLazyPurgeableResult *)self->_carrierUpdateNames result];
  v5 = [v4 allKeys];
  uint64_t v6 = [(_PASLazyPurgeableResult *)self->_carrierNames result];
  id v7 = [v6 allKeys];
  id v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)fieldForIataCode:(id)a3 field:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1CB79B230]();
  id v8 = [(id)objc_opt_class() iataCodeToCityDatabaseDict];
  id v9 = [v8 objectForKeyedSubscript:v5];
  id v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (id)cityForIataCode:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  id v5 = [(id)objc_opt_class() iataCodeToCityDatabaseDict];
  id v6 = [v5 objectForKeyedSubscript:v3];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"City"];

  if (v7) {
    id v8 = (__CFString *)v7;
  }
  else {
    id v8 = &stru_1F24EEF20;
  }

  return v8;
}

- (id)latitudeAndLongitudeForAirport:(id)a3
{
  id v4 = a3;
  id v5 = [(_PASLazyPurgeableResult *)self->_airportUpdateDataOffsets result];
  id v6 = [(SGFlightData *)self latitudeAndLongitudeForAirport:v4 withDataOffset:v5 andFileHandle:self->_airportsUpdateFh];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(_PASLazyPurgeableResult *)self->_airportDataOffsets result];
    id v7 = [(SGFlightData *)self latitudeAndLongitudeForAirport:v4 withDataOffset:v8 andFileHandle:self->_airportsFh];
  }
  return v7;
}

- (id)latitudeAndLongitudeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v9, "seekLocationForKey:", objc_msgSend(v8, "UTF8String"));

  if (v10)
  {
    [v7 seekToFileOffset:v10];
    id v11 = readLengthPrefixedString(v7);
    id v12 = readLengthPrefixedString(v7);
    id v13 = v7;
    double v14 = (double)(int)bswap32(*(_DWORD *)[v13 dataOfLength:4]) / 10000000.0;
    double v15 = (double)(int)bswap32(*(_DWORD *)[v13 dataOfLength:4]) / 10000000.0;
    if (v14 == 0.0 && v15 == 0.0)
    {
      id v10 = 0;
    }
    else
    {
      unsigned __int16 v16 = (void *)MEMORY[0x1E4F93BB8];
      id v17 = [NSNumber numberWithDouble:v14];
      unsigned int v18 = [NSNumber numberWithDouble:v15];
      id v10 = [v16 tupleWithFirst:v17 second:v18];
    }
  }

  return v10;
}

- (id)timezoneOlsonCodeForAirport:(id)a3
{
  id v4 = a3;
  id v5 = [(_PASLazyPurgeableResult *)self->_airportUpdateDataOffsets result];
  id v6 = [(SGFlightData *)self timezoneOlsonCodeForAirport:v4 withDataOffset:v5 andFileHandle:self->_airportsUpdateFh];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(_PASLazyPurgeableResult *)self->_airportDataOffsets result];
    id v7 = [(SGFlightData *)self timezoneOlsonCodeForAirport:v4 withDataOffset:v8 andFileHandle:self->_airportsFh];
  }
  return v7;
}

- (id)timezoneOlsonCodeForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v9, "seekLocationForKey:", objc_msgSend(v8, "UTF8String"));

  if (v10)
  {
    [v7 seekToFileOffset:v10];
    id v11 = readLengthPrefixedString(v7);
    id v10 = readLengthPrefixedString(v7);
  }

  return v10;
}

- (id)bestLocalizedNameForAirport:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = -[SGFlightData namesForAirport:](self, "namesForAirport:");
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  id v5 = 0;
  if (!v30) {
    goto LABEL_25;
  }
  uint64_t v29 = *(void *)v39;
  uint64_t v27 = v4;
  uint64_t v28 = *MEMORY[0x1E4F1C438];
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v39 != v29) {
        objc_enumerationMutation(obj);
      }
      id v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * v6)];
      id v8 = [v7 objectForKeyedSubscript:v28];

      if (v5)
      {

        goto LABEL_25;
      }
      uint64_t v31 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v33 = v4;
      uint64_t v9 = [v33 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v9)
      {
        id v5 = 0;
        goto LABEL_21;
      }
      uint64_t v10 = v9;
      id v5 = 0;
      uint64_t v11 = *(void *)v35;
      do
      {
        uint64_t v12 = 0;
        uint64_t v32 = v10;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v33);
          }
          id v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
          double v14 = [v13 second];
          double v15 = [v13 first];
          if (![v8 hasPrefix:v15]) {
            goto LABEL_15;
          }
          unint64_t v16 = [v14 length];
          [v5 second];
          unsigned int v18 = v17 = v5;
          unint64_t v19 = [v18 length];

          if (v16 > v19)
          {
            id v5 = v13;
            double v15 = v17;
            uint64_t v10 = v32;
LABEL_15:

            goto LABEL_17;
          }
          id v5 = v17;
          uint64_t v10 = v32;
LABEL_17:

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v33 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v10);
LABEL_21:

      uint64_t v6 = v31 + 1;
      id v4 = v27;
    }
    while (v31 + 1 != v30);
    uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  }
  while (v30);
LABEL_25:

  unsigned int v20 = [v5 second];
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    uint64_t v23 = [v4 firstObject];
    id v22 = [v23 second];
  }
  return v22;
}

- (id)namesForAirport:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v6 = [(_PASLazyPurgeableResult *)self->_airportUpdateDataOffsets result];
  id v7 = [(SGFlightData *)self namesForAirport:v4 withDataOffset:v6 andFileHandle:self->_airportsUpdateFh];
  id v8 = [(_PASLazyPurgeableResult *)self->_airportDataOffsets result];
  uint64_t v9 = [(SGFlightData *)self namesForAirport:v4 withDataOffset:v8 andFileHandle:self->_airportsFh];
  uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];

  return v10;
}

- (id)namesForAirport:(id)a3 withDataOffset:(id)a4 andFileHandle:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v8, "seekLocationForKey:", objc_msgSend(v10, "UTF8String"));
  if (v11)
  {
    id v28 = v10;
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]([v9 seekToFileOffset:v11]);
    id v13 = readLengthPrefixedString(v9);
    double v14 = [v13 componentsSeparatedByString:@"|"];

    double v15 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((unint64_t)[v21 length] >= 3)
          {
            id v22 = (void *)MEMORY[0x1E4F93BB8];
            uint64_t v23 = [v21 substringToIndex:2];
            id v24 = [v21 substringFromIndex:2];
            id v25 = [v22 tupleWithFirst:v23 second:v24];
            [v15 addObject:v25];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v18);
    }

    id v26 = (void *)[v15 copy];
    id v10 = v28;
  }
  else
  {
    id v26 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

- (id)airportIataCodes
{
  id v3 = [(_PASLazyPurgeableResult *)self->_airportDataOffsets result];
  id v4 = [(_PASLazyPurgeableResult *)self->_airportUpdateDataOffsets result];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4[4] + (unint64_t)v3[4]];
  uint64_t v6 = [(SGFlightData *)self airportIataCodesForDataOffset:v4];
  [v5 addObjectsFromArray:v6];

  id v7 = [(SGFlightData *)self airportIataCodesForDataOffset:v3];
  [v5 addObjectsFromArray:v7];

  return v5;
}

- (id)airportIataCodesForDataOffset:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned __int16 *)v3 + 4)];
  if (*((_WORD *)v3 + 4))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 10;
    do
    {
      id v7 = objCStringForCarrierKey(v3[2] + v6);
      [v4 setObject:v7 atIndexedSubscript:v5];

      ++v5;
      v6 += 16;
    }
    while (v5 < *((unsigned __int16 *)v3 + 4));
  }

  return v4;
}

- (void)updateCarriers
{
  id v3 = +[SGAsset asset];
  id v4 = [v3 filesystemPathForAssetDataRelativePath:@"carrierNamesUpdate.dat"];

  unint64_t v5 = [[SGSeekableData alloc] initWithMemoryMappedPath:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F93B60]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__SGFlightData_updateCarriers__block_invoke;
  v15[3] = &unk_1E65B7A70;
  id v16 = v5;
  id v7 = v5;
  id v8 = (void *)[v6 initWithBlock:v15];
  objc_storeStrong((id *)&self->_carrierUpdateNames, v8);
  id v9 = objc_alloc(MEMORY[0x1E4F93B60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __30__SGFlightData_updateCarriers__block_invoke_2;
  v13[3] = &unk_1E65B7A70;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = (_PASLazyPurgeableResult *)[v9 initWithBlock:v13];
  carrierUpdateCodesByName = self->_carrierUpdateCodesByName;
  self->_carrierUpdateCodesByName = v11;
}

id __30__SGFlightData_updateCarriers__block_invoke(uint64_t a1)
{
  v2 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:1 keyLength:3 singleByteOffset:1];
  id v3 = [(SGOffsetDictionary *)v2 fullMappingFromFile:*(void *)(a1 + 32)];

  return v3;
}

id __30__SGFlightData_updateCarriers__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) result];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SGFlightData_updateCarriers__block_invoke_3;
  v6[3] = &unk_1E65B7A98;
  id v7 = v2;
  id v3 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)[v3 copy];

  return v4;
}

void __30__SGFlightData_updateCarriers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 lowercaseString];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (void)updateAirports
{
  id v3 = +[SGAsset asset];
  id v4 = [v3 filesystemPathForAssetDataRelativePath:@"airportsUpdate.dat"];

  id v5 = [[SGSeekableData alloc] initWithMemoryMappedPath:v4];
  objc_storeStrong((id *)&self->_airportsUpdateFh, v5);
  id v6 = objc_alloc(MEMORY[0x1E4F93B60]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__SGFlightData_updateAirports__block_invoke;
  v10[3] = &unk_1E65B7A48;
  uint64_t v11 = v5;
  id v7 = v5;
  id v8 = (_PASLazyPurgeableResult *)[v6 initWithBlock:v10];
  airportUpdateDataOffsets = self->_airportUpdateDataOffsets;
  self->_airportUpdateDataOffsets = v8;
}

SGOffsetDictionary *__30__SGFlightData_updateAirports__block_invoke(uint64_t a1)
{
  v1 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:1 keyLength:3 singleByteOffset:0];
  return v1;
}

- (void)updateFlights
{
  id v3 = +[SGAsset asset];
  id v4 = [v3 filesystemPathForAssetDataRelativePath:@"flightsUpdate.dat"];

  id v5 = [[SGSeekableData alloc] initWithMemoryMappedPath:v4];
  objc_storeStrong((id *)&self->_flightsUpdateFh, v5);
  id v6 = objc_alloc(MEMORY[0x1E4F93B60]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__SGFlightData_updateFlights__block_invoke;
  v10[3] = &unk_1E65B7A48;
  uint64_t v11 = v5;
  id v7 = v5;
  id v8 = (_PASLazyPurgeableResult *)[v6 initWithBlock:v10];
  flightUpdateDataOffsets = self->_flightUpdateDataOffsets;
  self->_flightUpdateDataOffsets = v8;
}

SGOffsetDictionary *__29__SGFlightData_updateFlights__block_invoke(uint64_t a1)
{
  v1 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:5 keyLength:3 singleByteOffset:0];
  return v1;
}

- (void)dealloc
{
  id v3 = +[SGAsset asset];
  [v3 deregisterUpdateHandlerAsyncWithToken:self->_assetUpdateToken];

  v4.receiver = self;
  v4.super_class = (Class)SGFlightData;
  [(SGFlightData *)&v4 dealloc];
}

- (SGFlightData)init
{
  v51.receiver = self;
  v51.super_class = (Class)SGFlightData;
  v2 = [(SGFlightData *)&v51 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v4 = [SGSeekableData alloc];
    id v5 = [v3 pathForResource:@"flights" ofType:@"dat"];
    id v6 = [(SGSeekableData *)v4 initWithMemoryMappedPath:v5];

    objc_storeStrong((id *)&v2->_flightsFh, v6);
    id v7 = objc_alloc(MEMORY[0x1E4F93B60]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __20__SGFlightData_init__block_invoke;
    v49[3] = &unk_1E65B7A48;
    id v8 = v6;
    v50 = v8;
    uint64_t v9 = [v7 initWithBlock:v49];
    flightDataOffsets = v2->_flightDataOffsets;
    v2->_flightDataOffsets = (_PASLazyPurgeableResult *)v9;

    [(SGFlightData *)v2 updateFlights];
    uint64_t v11 = [SGSeekableData alloc];
    uint64_t v12 = [v3 pathForResource:@"airports" ofType:@"dat"];
    id v13 = [(SGSeekableData *)v11 initWithMemoryMappedPath:v12];

    objc_storeStrong((id *)&v2->_airportsFh, v13);
    id v14 = objc_alloc(MEMORY[0x1E4F93B60]);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __20__SGFlightData_init__block_invoke_2;
    v47[3] = &unk_1E65B7A48;
    double v15 = v13;
    uint64_t v48 = v15;
    uint64_t v16 = [v14 initWithBlock:v47];
    airportDataOffsets = v2->_airportDataOffsets;
    v2->_airportDataOffsets = (_PASLazyPurgeableResult *)v16;

    [(SGFlightData *)v2 updateAirports];
    uint64_t v18 = [SGSeekableData alloc];
    uint64_t v19 = [v3 pathForResource:@"carrierNames" ofType:@"dat"];
    unsigned int v20 = [(SGSeekableData *)v18 initWithMemoryMappedPath:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F93B60]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __20__SGFlightData_init__block_invoke_3;
    v45[3] = &unk_1E65B7A70;
    id v22 = v20;
    v46 = v22;
    uint64_t v23 = (void *)[v21 initWithBlock:v45];
    objc_storeStrong((id *)&v2->_carrierNames, v23);
    id v24 = objc_alloc(MEMORY[0x1E4F93B60]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __20__SGFlightData_init__block_invoke_4;
    v43[3] = &unk_1E65B7A70;
    id v25 = v23;
    id v44 = v25;
    uint64_t v26 = [v24 initWithBlock:v43];
    carrierCodesByName = v2->_carrierCodesByName;
    v2->_carrierCodesByName = (_PASLazyPurgeableResult *)v26;

    [(SGFlightData *)v2 updateCarriers];
    id location = 0;
    objc_initWeak(&location, v2);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __20__SGFlightData_init__block_invoke_6;
    v40[3] = &unk_1E65C0018;
    objc_copyWeak(&v41, &location);
    id v28 = (void *)MEMORY[0x1CB79B4C0](v40);
    long long v29 = +[SGAsset asset];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    long long v37 = __20__SGFlightData_init__block_invoke_7;
    long long v38 = &unk_1E65B7AC0;
    id v30 = v28;
    id v39 = v30;
    uint64_t v31 = [v29 registerUpdateHandler:&v35];
    assetUpdateToken = v2->_assetUpdateToken;
    v2->_assetUpdateToken = (_PASNotificationToken *)v31;

    id v33 = +[SGAsset notificationQueue];
    dispatch_sync(v33, v30);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v2;
}

SGOffsetDictionary *__20__SGFlightData_init__block_invoke(uint64_t a1)
{
  v1 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:5 keyLength:3 singleByteOffset:0];
  return v1;
}

SGOffsetDictionary *__20__SGFlightData_init__block_invoke_2(uint64_t a1)
{
  v1 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:1 keyLength:3 singleByteOffset:0];
  return v1;
}

id __20__SGFlightData_init__block_invoke_3(uint64_t a1)
{
  v2 = [[SGOffsetDictionary alloc] initWithFilehandle:*(void *)(a1 + 32) sizeFactor:1 keyLength:3 singleByteOffset:1];
  id v3 = [(SGOffsetDictionary *)v2 fullMappingFromFile:*(void *)(a1 + 32)];

  return v3;
}

id __20__SGFlightData_init__block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) result];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __20__SGFlightData_init__block_invoke_5;
  v6[3] = &unk_1E65B7A98;
  id v7 = v2;
  id v3 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v6];
  objc_super v4 = (void *)[v3 copy];

  return v4;
}

void __20__SGFlightData_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFlights];
  [WeakRetained updateAirports];
  [WeakRetained updateCarriers];
}

uint64_t __20__SGFlightData_init__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __20__SGFlightData_init__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 lowercaseString];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

+ (id)iataCodeToCityDatabaseDict
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (iataCodeToCityDatabaseDict_onceToken != -1) {
    dispatch_once(&iataCodeToCityDatabaseDict_onceToken, block);
  }
  pthread_mutex_lock(&iataCodeToCityDatabaseDict_lock);
  objc_super v4 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  if (!iataCodeToCityDatabaseDict_iataCodeDatabaseDict)
  {
    id v5 = +[SGAsset asset];
    id v6 = [v5 filesystemPathForAssetDataRelativePath:@"IataCodeToCity.plplist"];

    if (!v6)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:a1 file:@"SGFlightData.m" lineNumber:257 description:@"failed to get asset path for IATA_CITY_DB_IDENT."];
    }
    id v13 = 0;
    uint64_t v7 = [MEMORY[0x1E4F93B58] dictionaryWithPath:v6 error:&v13];
    id v8 = v13;
    id v9 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
    iataCodeToCityDatabaseDict_iataCodeDatabaseDict = v7;

    objc_super v4 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  }
  id v10 = v4;
  pthread_mutex_unlock(&iataCodeToCityDatabaseDict_lock);
  return v10;
}

void __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke(uint64_t a1)
{
  v2 = +[SGAsset asset];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke_2;
  v4[3] = &__block_descriptor_48_e20_v16__0___PASAsset2_8l;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v3 = (id)[v2 registerUpdateHandler:v4];
}

void __42__SGFlightData_iataCodeToCityDatabaseDict__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&iataCodeToCityDatabaseDict_lock);
  objc_super v4 = [v3 filesystemPathForAssetDataRelativePath:@"IataCodeToCity.plplist"];

  if (!v4)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGFlightData.m" lineNumber:245 description:@"failed to get asset path for IATA_CITY_DB_IDENT."];
  }
  id v9 = 0;
  uint64_t v5 = [MEMORY[0x1E4F93B58] dictionaryWithPath:v4 error:&v9];
  id v6 = v9;
  uint64_t v7 = (void *)iataCodeToCityDatabaseDict_iataCodeDatabaseDict;
  iataCodeToCityDatabaseDict_iataCodeDatabaseDict = v5;

  pthread_mutex_unlock(&iataCodeToCityDatabaseDict_lock);
}

+ (id)airportNameNoiseKeywords
{
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __40__SGFlightData_airportNameNoiseKeywords__block_invoke;
  double v15 = &__block_descriptor_48_e5_v8__0l;
  SEL v16 = a2;
  id v17 = a1;
  if (airportNameNoiseKeywords_onceToken != -1) {
    dispatch_once(&airportNameNoiseKeywords_onceToken, &v12);
  }
  pthread_mutex_lock(&airportNameNoiseKeywords_lock);
  objc_super v4 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  if (!airportNameNoiseKeywords_airportNameNoiseKeywords)
  {
    uint64_t v5 = +[SGAsset asset];
    id v6 = [v5 filesystemPathForAssetDataRelativePath:@"AirportNameNoise.plist"];

    if (!v6)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"SGFlightData.m" lineNumber:220 description:@"failed to get asset path for AIRPORT_NAME_IDENT."];
    }
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v6];
    id v8 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
    airportNameNoiseKeywords_airportNameNoiseKeywords = v7;

    objc_super v4 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  }
  id v9 = v4;
  pthread_mutex_unlock(&airportNameNoiseKeywords_lock);
  return v9;
}

void __40__SGFlightData_airportNameNoiseKeywords__block_invoke(uint64_t a1)
{
  v2 = +[SGAsset asset];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SGFlightData_airportNameNoiseKeywords__block_invoke_2;
  v4[3] = &__block_descriptor_48_e20_v16__0___PASAsset2_8l;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v3 = (id)[v2 registerUpdateHandler:v4];
}

void __40__SGFlightData_airportNameNoiseKeywords__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&airportNameNoiseKeywords_lock);
  id v8 = [v3 filesystemPathForAssetDataRelativePath:@"AirportNameNoise.plist"];

  id v4 = v8;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGFlightData.m" lineNumber:209 description:@"failed to get asset path for AIRPORT_NAME_IDENT."];

    id v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v4];
  id v6 = (void *)airportNameNoiseKeywords_airportNameNoiseKeywords;
  airportNameNoiseKeywords_airportNameNoiseKeywords = v5;

  pthread_mutex_unlock(&airportNameNoiseKeywords_lock);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_12278 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_12278, &__block_literal_global_12279);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_12280;
  return v2;
}

void __30__SGFlightData_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12280;
  sharedInstance__pasExprOnceResult_12280 = v1;
}

+ (id)sanitizeAirportName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = [(id)objc_opt_class() airportNameNoiseKeywords];
  id v6 = [v3 lowercaseString];
  uint64_t v7 = (void *)[v6 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", *(void *)(*((void *)&v15 + 1) + 8 * i), @" ", 0, 0, objc_msgSend(v7, "length", (void)v15));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v13 = _PASCollapseWhitespaceAndStrip();

  return v13;
}

@end