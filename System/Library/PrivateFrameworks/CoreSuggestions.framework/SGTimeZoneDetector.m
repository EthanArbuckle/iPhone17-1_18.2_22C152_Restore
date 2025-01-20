@interface SGTimeZoneDetector
+ (id)_normalizedCountryString:(id)a3;
+ (id)_normalizedString:(id)a3;
+ (id)_regularExpressionForPostalCodeFormat:(id)a3;
- (SGTimeZoneDetector)init;
- (_NSRange)_airportCodeRangeForAddress:(id)a3;
- (id)_acronymForAddress:(id)a3 airportCodeRange:(_NSRange)a4 airportCodeNames:(id)a5;
- (id)_countryCodeByCountryNameFromNormalizedAddressWords:(id)a3;
- (id)_countryCodeByRegionAbbreviationFromNormalizedAddress:(id)a3;
- (id)_countryCodeByRegionNameFromNormalizedAddress:(id)a3 withWords:(id)a4;
- (id)_countryCodeByRegularExpressionFromNormalizedAddress:(id)a3;
- (id)_getCountryCodeForCountryName;
- (id)_getPostalCodeFormats;
- (id)_getRegionAbbreviations;
- (id)_getRegionNames;
- (id)_getTimeZoneAbbreviations;
- (id)_getTimeZoneForCountryCode;
- (id)_getTimeZoneForCountryCodeDictionarySupplement;
- (id)_getTimeZoneForPostalCode;
- (id)_getUniquePostalCodeFormats;
- (id)_postalCodeForAddress:(id)a3 withCountryCode:(id)a4;
- (id)_timeZoneNameForPostalCode:(id)a3 withPostalCodeTable:(id)a4;
- (id)countryCodeForAddress:(id)a3;
- (id)timeZoneFromAiportCodeForAddress:(id)a3;
- (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4;
- (void)_handleMemoryPressureStatus;
- (void)_readPlistRegionAbbreviationsData;
- (void)cleanupCache;
@end

@implementation SGTimeZoneDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_postalCodeFormats, 0);
  objc_storeStrong((id *)&self->_uniquePostalCodeFormats, 0);
  objc_storeStrong((id *)&self->_timeZoneAbbreviations, 0);
  objc_storeStrong((id *)&self->_timeZoneForPostalCode, 0);
  objc_storeStrong((id *)&self->_regionAbbreviations, 0);
  objc_storeStrong((id *)&self->_timeZoneForCountryCodeDictionarySupplement, 0);
  objc_storeStrong((id *)&self->_timeZoneForCountryCode, 0);

  objc_storeStrong((id *)&self->_countryCodeForCountryName, 0);
}

- (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(id)objc_opt_class() _normalizedString:v6];

  v10 = [(SGTimeZoneDetector *)v8 _getTimeZoneForPostalCode];
  v11 = [v10 objectForKey:v7];
  if (v11)
  {
    v12 = [(SGTimeZoneDetector *)v8 _postalCodeForAddress:v9 withCountryCode:v7];
    id v13 = [(SGTimeZoneDetector *)v8 _timeZoneNameForPostalCode:v12 withPostalCodeTable:v11];
  }
  else
  {
    v12 = [(SGTimeZoneDetector *)v8 _getTimeZoneForCountryCodeDictionarySupplement];
    v14 = [v12 objectForKey:v7];
    if (v14)
    {
      id v13 = v14;
    }
    else
    {
      v15 = [(SGTimeZoneDetector *)v8 _getTimeZoneForCountryCode];
      id v13 = [v15 objectForKey:v7];
    }
  }

  objc_sync_exit(v8);

  return v13;
}

- (id)_timeZoneNameForPostalCode:(id)a3 withPostalCodeTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
LABEL_6:
    v14 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    while (1)
    {
      v10 = (void *)MEMORY[0x1A6265250]();
      v11 = [v6 substringToIndex:v9];
      v12 = [v7 objectForKey:v11];
      if (v12) {
        break;
      }

      if (v9-- <= 1) {
        goto LABEL_6;
      }
    }
    v14 = v12;
    if ((unint64_t)[v12 length] <= 2)
    {
      v15 = [(SGTimeZoneDetector *)self _getTimeZoneAbbreviations];
      uint64_t v16 = [v15 objectForKey:v14];

      v14 = (void *)v16;
    }
  }

  return v14;
}

- (id)countryCodeForAddress:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(id)objc_opt_class() _normalizedString:v4];
  id v7 = [v6 uppercaseString];
  uint64_t v8 = [(SGTimeZoneDetector *)v5 _countryCodeByRegionAbbreviationFromNormalizedAddress:v7];
  if (v8
    || ([(SGTimeZoneDetector *)v5 _countryCodeByRegularExpressionFromNormalizedAddress:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
  }
  else
  {
    v11 = [v6 capitalizedString];
    v12 = [v11 componentsSeparatedByString:@" "];
    id v13 = [(SGTimeZoneDetector *)v5 _countryCodeByRegionNameFromNormalizedAddress:v7 withWords:v12];
    if (!v13)
    {
      id v13 = [(SGTimeZoneDetector *)v5 _countryCodeByCountryNameFromNormalizedAddressWords:v12];
    }
    id v9 = v13;
  }
  objc_sync_exit(v5);

  return v9;
}

- (id)timeZoneFromAiportCodeForAddress:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SGTimeZoneDetector *)self _airportCodeRangeForAddress:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v11 = (void *)MEMORY[0x1A6265250]();
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v13 = [v12 pathForResource:@"TimeZoneAirportCodes" ofType:@"plist"];

    if (!v13)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"SGTimeZone.m", 504, @"Invalid parameter not satisfying: %@", @"tzAirportCodesDataPath" object file lineNumber description];
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v13];
    v15 = [v14 objectForKeyedSubscript:@"Airport Codes"];
    uint64_t v16 = [v14 objectForKeyedSubscript:@"Airport Code Names"];
    v17 = -[SGTimeZoneDetector _acronymForAddress:airportCodeRange:airportCodeNames:](self, "_acronymForAddress:airportCodeRange:airportCodeNames:", v5, v9, v10, v16);
    v18 = objc_msgSend(v5, "substringWithRange:", v9, v10);
    v19 = v18;
    if (v17 && ([v18 isEqualToString:v17] & 1) != 0)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [v15 objectForKeyedSubscript:v19];
    }
  }

  return v8;
}

- (id)_countryCodeByCountryNameFromNormalizedAddressWords:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SGTimeZoneDetector *)self _getCountryCodeForCountryName];
  uint64_t v6 = [v4 count];
  uint64_t v7 = v6 - 1;
  uint64_t v8 = v6 + 5;
  do
  {
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    if (v7 < 0) {
      break;
    }
    v11 = [v4 objectAtIndex:v7];
    v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v13 = [v11 rangeOfCharacterFromSet:v12];

    uint64_t v7 = v9 - 1;
    uint64_t v8 = v10 - 1;
  }
  while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  v14 = objc_opt_new();
  uint64_t v15 = 5;
  if (v9 > 5) {
    uint64_t v15 = v9;
  }
  if (v15 - 5 <= v9)
  {
    uint64_t v16 = 5;
    if (v9 > 5) {
      uint64_t v16 = v9;
    }
    uint64_t v17 = v16 - 6;
    uint64_t v18 = v10 - v16;
    do
    {
      v19 = objc_msgSend(v4, "subarrayWithRange:", ++v17, v18);
      v20 = objc_msgSend(v19, "_pas_componentsJoinedByString:", @" ");

      [v14 addObject:v20];
      --v18;
    }
    while (v17 < v9);
  }
  if (v9 >= 1)
  {
    if (v9 >= 6) {
      uint64_t v9 = 6;
    }
    do
    {
      v21 = objc_msgSend(v4, "subarrayWithRange:", 0, v9);
      v22 = objc_msgSend(v21, "_pas_componentsJoinedByString:", @" ");

      [v14 addObject:v22];
    }
    while ((unint64_t)v9-- > 1);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
        if (v29)
        {
          v30 = (void *)v29;
          goto LABEL_25;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (id)_countryCodeByRegionNameFromNormalizedAddress:(id)a3 withWords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SGTimeZoneDetector *)self _getRegionNames];
  uint64_t v18 = [v7 count];
  uint64_t v9 = v18 - 2;
  unint64_t v10 = 3;
  while (1)
  {
    context = (void *)MEMORY[0x1A6265250]();
    if (v18 >= (uint64_t)v10) {
      break;
    }
LABEL_10:
    ++v9;
    if (v10-- <= 1)
    {
      v14 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  while (1)
  {
    if (v10 == 1)
    {
      v12 = [v7 objectAtIndex:v11];
    }
    else
    {
      uint64_t v13 = objc_msgSend(v7, "subarrayWithRange:", v11, v10);
      v12 = objc_msgSend(v13, "_pas_componentsJoinedByString:", @" ");
    }
    v14 = objc_msgSend(v8, "objectForKey:", v12, v18);
    if (v14)
    {
      uint64_t v15 = [(SGTimeZoneDetector *)self _postalCodeForAddress:v6 withCountryCode:v14];
      if (v15) {
        break;
      }
    }

    if (v9 == ++v11) {
      goto LABEL_10;
    }
  }

LABEL_13:

  return v14;
}

- (id)_countryCodeByRegularExpressionFromNormalizedAddress:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(SGTimeZoneDetector *)self _getUniquePostalCodeFormats];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    id v7 = (id)v6;
    if (v6)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
          uint64_t v11 = (void *)MEMORY[0x1A6265250](v6);
          v12 = objc_msgSend(v5, "objectForKey:", v10, (void)v15);
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v12 options:0 error:0];
          if (objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v7 = v10;

            goto LABEL_12;
          }

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v7 = (id)v6;
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_countryCodeByRegionAbbreviationFromNormalizedAddress:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SGTimeZoneDetector *)self _getRegionAbbreviations];
  uint64_t v6 = (void *)MEMORY[0x1A6265250]();
  id v7 = [v4 componentsSeparatedByString:@" "];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    id v29 = v8;
    v30 = v5;
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v10;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1A6265250]();
        long long v15 = [v5 objectForKey:v13];
        if (v15)
        {
          context = v14;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v28 = v15;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v33;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                v22 = objc_msgSend(v16, "objectForKey:", v21, v26);
                v23 = [(id)objc_opt_class() _regularExpressionForPostalCodeFormat:v22];
                if (objc_msgSend(v23, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  id v24 = v21;

                  id v8 = v29;
                  id v5 = v30;
                  goto LABEL_21;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v8 = v29;
          id v5 = v30;
          uint64_t v11 = v26;
          uint64_t v10 = v27;
          v14 = context;
          long long v15 = v28;
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      id v24 = 0;
    }
    while (v10);
  }
  else
  {
    id v24 = 0;
  }
LABEL_21:

  return v24;
}

- (id)_acronymForAddress:(id)a3 airportCodeRange:(_NSRange)a4 airportCodeNames:(id)a5
{
  NSUInteger location = a4.location;
  id v7 = a5;
  id v8 = [a3 substringToIndex:location - 1];
  uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = [v10 count];
  if (v12 - 1 >= 0)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x1E4F14390];
    do
    {
      id v16 = [v10 objectAtIndexedSubscript:--v13];
      if ([v16 length])
      {
        uint64_t v17 = [v10 objectAtIndexedSubscript:v13];
        unsigned int v18 = [v17 characterAtIndex:0];
        if (v18 > 0x7F) {
          int v19 = __maskrune(v18, 0x8000uLL);
        }
        else {
          int v19 = *(_DWORD *)(v15 + 4 * v18 + 60) & 0x8000;
        }

        if (v19)
        {
          uint64_t v20 = [v10 objectAtIndexedSubscript:v13];
          [v11 insertObject:v20 atIndex:0];

          if (v14 > 1)
          {
            v23 = objc_msgSend(v11, "_pas_componentsJoinedByString:", @" ");
            id v24 = [v7 objectForKeyedSubscript:v23];

            if (v24)
            {
              v21 = 0;
            }
            else
            {
              v21 = objc_opt_new();
              for (uint64_t i = 0; i != 3; ++i)
              {
                uint64_t v26 = [v10 objectAtIndexedSubscript:i];
                objc_msgSend(v21, "appendFormat:", @"%c", objc_msgSend(v26, "characterAtIndex:", 0));
              }
            }

            goto LABEL_13;
          }
          ++v14;
        }
      }
      else
      {
      }
    }
    while (v13 > 0);
  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (_NSRange)_airportCodeRangeForAddress:(id)a3
{
  id v5 = (objc_class *)MEMORY[0x1E4F28FD8];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithPattern:@"\\([A-Z][A-Z][A-Z]\\)" options:0 error:0];
  uint64_t v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  NSUInteger v10 = v9;

  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10 != 5)
    {
      unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SGTimeZone.m", 361, @"Invalid parameter not satisfying: %@", @"rangeOfFirstMatch.length == 5" object file lineNumber description];
    }
    uint64_t v11 = v8 + 1;
    v10 -= 2;
  }

  NSUInteger v12 = v11;
  NSUInteger v13 = v10;
  result.length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (id)_postalCodeForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SGTimeZoneDetector *)self _getPostalCodeFormats];
  NSUInteger v9 = [v8 objectForKey:v7];
  if (v9)
  {
    NSUInteger v10 = (void *)MEMORY[0x1A6265250]();
    uint64_t v11 = [(id)objc_opt_class() _regularExpressionForPostalCodeFormat:v9];
    NSUInteger v12 = objc_msgSend(v11, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    if ([v12 count])
    {
      context = (void *)MEMORY[0x1A6265250]();
      NSUInteger v13 = [v12 lastObject];
      uint64_t v14 = [v13 range];
      uint64_t v16 = v15;

      uint64_t v17 = objc_msgSend(v6, "substringWithRange:", v14, v16);
      unsigned int v18 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      int v19 = [v18 invertedSet];
      [v17 componentsSeparatedByCharactersInSet:v19];
      id v29 = v12;
      id v20 = v6;
      v21 = v8;
      id v22 = v7;
      id v24 = v23 = v10;
      objc_msgSend(v24, "_pas_componentsJoinedByString:", &stru_1EF915628);
      uint64_t v25 = v30 = v11;

      NSUInteger v10 = v23;
      id v7 = v22;
      uint64_t v8 = v21;
      id v6 = v20;
      NSUInteger v12 = v29;

      uint64_t v26 = [v25 uppercaseString];

      uint64_t v11 = v30;
    }
    else
    {
      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)_getRegionNames
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 pathForResource:@"TimeZoneRegionNames" ofType:@"plist"];

  if (!v5)
  {
    NSUInteger v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGTimeZone.m", 289, @"Invalid parameter not satisfying: %@", @"tzNamesDataPath" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v5];
  id v7 = [v6 objectForKey:@"Region Name Dictionary"];

  return v7;
}

- (id)_getPostalCodeFormats
{
  postalCodeFormats = self->_postalCodeFormats;
  if (!postalCodeFormats)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    postalCodeFormats = self->_postalCodeFormats;
  }

  return postalCodeFormats;
}

- (id)_getUniquePostalCodeFormats
{
  uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  if (!uniquePostalCodeFormats)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  }

  return uniquePostalCodeFormats;
}

- (id)_getTimeZoneAbbreviations
{
  timeZoneAbbreviations = self->_timeZoneAbbreviations;
  if (!timeZoneAbbreviations)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    timeZoneAbbreviations = self->_timeZoneAbbreviations;
  }

  return timeZoneAbbreviations;
}

- (id)_getTimeZoneForPostalCode
{
  timeZoneForPostalCode = self->_timeZoneForPostalCode;
  if (!timeZoneForPostalCode)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    timeZoneForPostalCode = self->_timeZoneForPostalCode;
  }

  return timeZoneForPostalCode;
}

- (id)_getRegionAbbreviations
{
  regionAbbreviations = self->_regionAbbreviations;
  if (!regionAbbreviations)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    regionAbbreviations = self->_regionAbbreviations;
  }

  return regionAbbreviations;
}

- (id)_getTimeZoneForCountryCodeDictionarySupplement
{
  timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  if (!timeZoneForCountryCodeDictionarySupplement)
  {
    [(SGTimeZoneDetector *)self _readPlistRegionAbbreviationsData];
    timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  }

  return timeZoneForCountryCodeDictionarySupplement;
}

- (void)cleanupCache
{
  obj = self;
  objc_sync_enter(obj);
  timeZoneForCountryCodeDictionarySupplement = obj->_timeZoneForCountryCodeDictionarySupplement;
  obj->_timeZoneForCountryCodeDictionarySupplement = 0;

  regionAbbreviations = obj->_regionAbbreviations;
  obj->_regionAbbreviations = 0;

  timeZoneForPostalCode = obj->_timeZoneForPostalCode;
  obj->_timeZoneForPostalCode = 0;

  timeZoneAbbreviations = obj->_timeZoneAbbreviations;
  obj->_timeZoneAbbreviations = 0;

  uniquePostalCodeFormats = obj->_uniquePostalCodeFormats;
  obj->_uniquePostalCodeFormats = 0;

  postalCodeFormats = obj->_postalCodeFormats;
  obj->_postalCodeFormats = 0;

  objc_sync_exit(obj);
}

- (void)_readPlistRegionAbbreviationsData
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v19 = [v4 pathForResource:@"TimeZoneRegionAbbreviations" ofType:@"plist"];

  if (!v19)
  {
    unsigned int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGTimeZone.m", 216, @"Invalid parameter not satisfying: %@", @"tzAbbreviationsDataPath" object file lineNumber description];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v19];
  id v6 = [v5 objectForKey:@"Time Zone Dictionary Supplement"];
  timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  self->_timeZoneForCountryCodeDictionarySupplement = v6;

  uint64_t v8 = [v5 objectForKey:@"Region Abbreviation Dictionary"];
  regionAbbreviations = self->_regionAbbreviations;
  self->_regionAbbreviations = v8;

  NSUInteger v10 = [v5 objectForKey:@"Postal Code Time Zone Dictionary"];
  timeZoneForPostalCode = self->_timeZoneForPostalCode;
  self->_timeZoneForPostalCode = v10;

  NSUInteger v12 = [v5 objectForKey:@"Time Zone Abbreviations"];
  timeZoneAbbreviations = self->_timeZoneAbbreviations;
  self->_timeZoneAbbreviations = v12;

  uint64_t v14 = [v5 objectForKey:@"Unique Postal Code Formats"];
  uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  self->_uniquePostalCodeFormats = v14;

  uint64_t v16 = [v5 objectForKey:@"Postal Code Formats"];
  postalCodeFormats = self->_postalCodeFormats;
  self->_postalCodeFormats = v16;
}

- (id)_getTimeZoneForCountryCode
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  timeZoneForCountryCode = self->_timeZoneForCountryCode;
  if (timeZoneForCountryCode)
  {
    obj = timeZoneForCountryCode;
    goto LABEL_23;
  }
  NSUInteger location = (id *)&self->_timeZoneForCountryCode;
  obj = (NSDictionary *)objc_opt_new();
  [MEMORY[0x1E4F1CAF0] knownTimeZoneNames];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
      NSUInteger v9 = (void *)MEMORY[0x1A6265250]();
      NSUInteger v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v8];
      uint64_t v11 = [MEMORY[0x1E4F1CA20] systemLocale];
      NSUInteger v12 = [v10 localizedName:5 locale:v11];

      if ([v12 length] == 2)
      {
        unsigned int v13 = [v12 characterAtIndex:0];
        if (v13 > 0x7F)
        {
          if (!__maskrune(v13, 0x8000uLL)) {
            goto LABEL_18;
          }
        }
        else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v13 + 60) & 0x8000) == 0)
        {
          goto LABEL_18;
        }
        unsigned int v14 = [v12 characterAtIndex:1];
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x8000uLL)) {
            goto LABEL_18;
          }
LABEL_17:
          [(NSDictionary *)obj setValue:v8 forKey:v12];
          goto LABEL_18;
        }
        if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v14 + 60) & 0x8000) != 0) {
          goto LABEL_17;
        }
      }
LABEL_18:
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v5);
LABEL_20:

  if (self->_keepData) {
    objc_storeStrong(location, obj);
  }

LABEL_23:

  return obj;
}

- (id)_getCountryCodeForCountryName
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  countryCodeForCountryName = self->_countryCodeForCountryName;
  if (countryCodeForCountryName)
  {
    id v3 = countryCodeForCountryName;
  }
  else
  {
    uint64_t v5 = self;
    NSUInteger location = (id *)&self->_countryCodeForCountryName;
    id v3 = (NSDictionary *)objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 pathForResource:@"TimeZoneCountryNames" ofType:@"plist"];

    if (!v7)
    {
      long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2, v5, @"SGTimeZone.m", 161, @"Invalid parameter not satisfying: %@", @"tzCountryNamesDataPath" object file lineNumber description];
    }
    long long v38 = (void *)v7;
    long long v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v7];
    uint64_t v8 = [v37 objectForKey:@"Country Code Dictionary Supplement"];
    [(NSDictionary *)v3 addEntriesFromDictionary:v8];

    NSUInteger v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1EF92F8B8];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    NSUInteger v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v53;
      uint64_t v14 = MEMORY[0x1E4F14390];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if ((unint64_t)[v16 length] < 3)
          {
            uint64_t v19 = 2;
          }
          else
          {
            unsigned int v17 = [v16 characterAtIndex:2];
            if (v17 > 0x7F) {
              int v18 = __maskrune(v17, 0x1000uLL);
            }
            else {
              int v18 = *(_DWORD *)(v14 + 4 * v17 + 60) & 0x1000;
            }
            if (v18) {
              uint64_t v19 = 3;
            }
            else {
              uint64_t v19 = 2;
            }
          }
          long long v20 = [v16 substringToIndex:v19];
          [v9 addObject:v20];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v12);
    }

    long long v36 = v9;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
    uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v49;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = v21;
          long long v22 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v48 + 1) + 8 * v21)];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v43 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
          uint64_t v23 = [v43 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v45 != v25) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                id v28 = [v22 localizedStringForCountryCode:v27];
                id v29 = [(id)objc_opt_class() _normalizedCountryString:v28];
                if ([v29 length])
                {
                  [(NSDictionary *)v3 setObject:v27 forKeyedSubscript:v29];
                }
                else
                {
                  v30 = v5;
                  v31 = v3;
                  long long v32 = sgLogHandle();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v57 = v27;
                    _os_log_error_impl(&dword_1A4D8C000, v32, OS_LOG_TYPE_ERROR, "SGTimeZoneDetector-_getCountryCodeForCountryName: nil or empty normalizedLocalizedCountry for country code %@", buf, 0xCu);
                  }

                  id v3 = v31;
                  uint64_t v5 = v30;
                }
              }
              uint64_t v24 = [v43 countByEnumeratingWithState:&v44 objects:v58 count:16];
            }
            while (v24);
          }

          uint64_t v21 = v42 + 1;
        }
        while (v42 + 1 != v41);
        uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v41);
    }

    if (v5->_keepData) {
      objc_storeStrong(location, v3);
    }
  }

  return v3;
}

- (void)_handleMemoryPressureStatus
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  unint64_t memoryPressureStatus = obj->_memoryPressureStatus;
  if (memoryPressureStatus != 1)
  {
    if (memoryPressureStatus != 4 && memoryPressureStatus != 2) {
      goto LABEL_9;
    }
    LOBYTE(memoryPressureStatus) = 0;
  }
  obj->_keepData = memoryPressureStatus;
LABEL_9:
  objc_sync_exit(obj);
}

- (SGTimeZoneDetector)init
{
  v15.receiver = self;
  v15.super_class = (Class)SGTimeZoneDetector;
  v2 = [(SGTimeZoneDetector *)&v15 init];
  id v3 = v2;
  if (v2)
  {
    v2->_keepData = 1;
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.proactive.SGTimeZone", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, (dispatch_queue_t)v3->_queue);
    memoryPressureSource = v3->_memoryPressureSource;
    v3->_memoryPressureSource = (OS_dispatch_source *)v7;

    id location = 0;
    objc_initWeak(&location, v3);
    NSUInteger v9 = v3->_memoryPressureSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __26__SGTimeZoneDetector_init__block_invoke;
    handler[3] = &unk_1E5B8FE38;
    objc_copyWeak(&v13, &location);
    uint64_t v12 = v3;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)v3->_memoryPressureSource);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __26__SGTimeZoneDetector_init__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    WeakRetained[12] = (dispatch_source_t)dispatch_source_get_data(WeakRetained[11]);
    [*(id *)(a1 + 32) _handleMemoryPressureStatus];
    WeakRetained = v3;
  }
}

+ (id)_regularExpressionForPostalCodeFormat:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v4 appendString:@"\\b"];
  [v4 appendString:v3];

  [v4 appendString:@"\\b"];
  dispatch_queue_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v4 options:1 error:0];

  return v5;
}

+ (id)_normalizedString:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1A6265250](a1, a2);
  dispatch_queue_t v5 = [a3 decomposedStringWithCompatibilityMapping];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:@" "];

  dispatch_source_t v7 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@" "];

  uint64_t v8 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  NSUInteger v9 = [v7 componentsSeparatedByCharactersInSet:v8];
  NSUInteger v10 = objc_msgSend(v9, "_pas_componentsJoinedByString:", &stru_1EF915628);

  uint64_t v11 = [MEMORY[0x1E4F28B88] nonBaseCharacterSet];
  uint64_t v12 = [v10 componentsSeparatedByCharactersInSet:v11];
  id v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", &stru_1EF915628);

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 688, 64);
  objc_super v15 = [v13 componentsSeparatedByCharactersInSet:v14];
  uint64_t v16 = objc_msgSend(v15, "_pas_componentsJoinedByString:", &stru_1EF915628);

  unsigned int v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
  int v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v19 = [v16 componentsSeparatedByCharactersInSet:v18];

  long long v20 = [v19 filteredArrayUsingPredicate:v17];
  uint64_t v21 = objc_msgSend(v20, "_pas_componentsJoinedByString:", @" ");

  id v22 = v21;

  return v22;
}

+ (id)_normalizedCountryString:(id)a3
{
  uint64_t v4 = trimAfterDelimiter(a3, @" -");
  dispatch_queue_t v5 = trimAfterDelimiter(v4, @" (");

  id v6 = v5;
  uint64_t v7 = [v6 rangeOfString:@" & "];
  uint64_t v8 = v6;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v6 substringFromIndex:objc_msgSend(@" & ", "length") + v7];
  }
  NSUInteger v9 = [v8 stringByReplacingOccurrencesOfString:@"St. " withString:@"Saint "];

  NSUInteger v10 = [v9 stringByReplacingOccurrencesOfString:@"So. " withString:@"South "];

  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"No. " withString:@"North "];

  uint64_t v12 = [a1 _normalizedString:v11];

  id v13 = [v12 capitalizedString];

  return v13;
}

@end