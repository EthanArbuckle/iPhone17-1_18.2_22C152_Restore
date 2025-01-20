@interface NSError(MKErrorPrivate)
- (BOOL)_mapkit_isDirectionsError;
- (BOOL)_mapkit_isLocationAuthorizationError;
- (id)_mapkit_errorWithDirectionsError:()MKErrorPrivate stringTokens:;
- (id)_mapkit_transitIncident;
- (uint64_t)_mapkit_directionsErrorCode;
- (uint64_t)_mapkit_errorWithDirectionsError:()MKErrorPrivate;
- (uint64_t)_mapkit_underlyingGEOError;
@end

@implementation NSError(MKErrorPrivate)

- (uint64_t)_mapkit_errorWithDirectionsError:()MKErrorPrivate
{
  return objc_msgSend(a1, "_mapkit_errorWithDirectionsError:stringTokens:", a3, 0);
}

- (id)_mapkit_errorWithDirectionsError:()MKErrorPrivate stringTokens:
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 domain];
  v9 = GEOErrorDomain();
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v45 = a1;
    goto LABEL_39;
  }
  uint64_t v11 = [a1 code];
  uint64_t v12 = [v6 firstDirectionsErrorCode];
  if (!v6 || (uint64_t v13 = v12, v12 == 1))
  {
    if (v11 <= -29)
    {
      if (v11 == -402)
      {
        uint64_t v13 = 5;
        goto LABEL_4;
      }
      if (v11 == -401)
      {
        uint64_t v13 = 4;
        goto LABEL_4;
      }
    }
    else
    {
      switch(v11)
      {
        case -28:
          uint64_t v13 = 17;
          goto LABEL_4;
        case -9:
          uint64_t v13 = 2;
          goto LABEL_4;
        case -8:
          uint64_t v13 = 1;
          goto LABEL_4;
      }
    }
    uint64_t v13 = 3;
  }
LABEL_4:
  uint64_t v14 = [v6 title];
  if (!v14) {
    goto LABEL_6;
  }
  v15 = (void *)v14;
  v16 = NSString;
  v17 = [v6 title];
  *((void *)&v56 + 1) = 0;
  uint64_t v55 = 1;
  *(_DWORD *)((char *)&v56 + 7) = 0;
  uint64_t v57 = 0;
  *(void *)&long long v56 = 0;
  objc_msgSend(v16, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v17, &v55, v7);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_6:
    v18 = [v6 localizedTitle];
  }
  uint64_t v19 = [v6 content];
  if (!v19) {
    goto LABEL_9;
  }
  v20 = (void *)v19;
  v21 = NSString;
  v22 = [v6 content];
  *((void *)&v53 + 1) = 0;
  uint64_t v52 = 1;
  *(_DWORD *)((char *)&v53 + 7) = 0;
  uint64_t v54 = 0;
  *(void *)&long long v53 = 0;
  objc_msgSend(v21, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v22, &v52, v7);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_9:
    v23 = [v6 localizedDescription];
  }
  id v51 = v7;
  if ([(__CFString *)v18 length] || [(__CFString *)v23 length])
  {
    v24 = v18;
  }
  else
  {
    _MKLocalizedStringFromThisBundle(@"Directions Not Available");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v47 = &stru_1ED919588;
    v48 = @"Cannot locate the start location.";
    switch(v13)
    {
      case 0:
      case 1:
      case 16:
        v48 = @"A route could not be determined between these locations.";
        goto LABEL_68;
      case 2:
      case 22:
        v48 = @"Route information is not available at this moment. An internet connection is required.";
        goto LABEL_68;
      case 3:
        v48 = @"Route information is not available at this moment.";
        goto LABEL_68;
      case 4:
        goto LABEL_68;
      case 5:
        v48 = @"Cannot locate the end location.";
        goto LABEL_68;
      case 6:
        v48 = @"A route to the nearest road cannot be determined.";
        goto LABEL_68;
      case 7:
        v48 = @"A route to the destination from its nearest road cannot be determined";
        goto LABEL_68;
      case 8:
        v48 = @"A route cannot be determined from this start location.";
        goto LABEL_68;
      case 9:
        v48 = @"A route cannot be determined to this destination.";
        goto LABEL_68;
      case 10:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(@"Walking Directions Not Available");

        v48 = @"A walking route cannot be determined. Walking is not allowed at the start location.";
        goto LABEL_67;
      case 11:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(@"Walking Directions Not Available");

        v48 = @"A walking route cannot be determined. Walking is not allowed at the destination.";
        goto LABEL_67;
      case 12:
      case 15:
        goto LABEL_69;
      case 13:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(@"Walking Directions Not Available");

        v48 = @"A walking route cannot be determined for this distance.";
        goto LABEL_67;
      case 14:
        v48 = @"A route is currently not available due to road conditions.";
        goto LABEL_68;
      case 18:
        v50 = @"EV directions aren't yet available here.";
        goto LABEL_65;
      case 19:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(@"EV Directions Not Available");

        v48 = @"We could not find a route based on the range of the selected vehicle. You can view driving directions without EV information.";
        goto LABEL_67;
      case 20:
        v50 = @"EV Directions Not Available";
LABEL_65:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(v50);

        v48 = @"You can view driving directions without EV information.";
        goto LABEL_67;
      case 21:
        uint64_t v49 = _MKLocalizedStringFromThisBundle(@"LPR Directions Not Available");

        v48 = @"You can view driving directions without LPR information.";
LABEL_67:
        v24 = (__CFString *)v49;
LABEL_68:
        v47 = v24;
        _MKLocalizedStringFromThisBundle(v48);
        v24 = v23;
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_69:

        v24 = v47;
        break;
      default:
        break;
    }
  }
  v25 = objc_opt_new();
  v26 = [a1 userInfo];

  if (v26)
  {
    v27 = [a1 userInfo];
    [v25 setObject:v27 forKeyedSubscript:@"MKErrorGEOErrorUserInfo"];
  }
  uint64_t v28 = [(__CFString *)v24 length];
  v29 = (void *)MEMORY[0x1E4F28568];
  if (v28) {
    [v25 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  uint64_t v30 = [(__CFString *)v23 length];
  v31 = (void *)MEMORY[0x1E4F28588];
  if (v30) {
    [v25 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  v32 = [v6 incidentMessage];

  if (v32)
  {
    v33 = [v6 incidentMessage];
    [v25 setObject:v33 forKeyedSubscript:@"MKErrorGEOTransitIncidentKey"];
  }
  if (v6) {
    [v25 setObject:v6 forKeyedSubscript:@"MKErrorDirectionsErrorInfoKey"];
  }
  v58[0] = @"MKDirectionsErrorCode";
  v34 = [NSNumber numberWithInteger:v13];
  v58[1] = @"MKErrorGEOError";
  v59[0] = v34;
  v35 = [NSNumber numberWithInteger:v11];
  v59[1] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  [v25 addEntriesFromDictionary:v36];

  if ([(__CFString *)v24 length]) {
    [v25 setObject:v24 forKeyedSubscript:*v29];
  }
  if ([(__CFString *)v23 length]) {
    [v25 setObject:v23 forKeyedSubscript:*v31];
  }
  v37 = [v6 internalServerErrors];

  if (v37)
  {
    v38 = [v6 internalServerErrors];
    v39 = [v38 componentsJoinedByString:@" | "];

    v40 = [NSString stringWithFormat:@"%@\n(internal error: %@)", v23, v39];
    [v25 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  v41 = objc_msgSend(a1, "_mapkit_error");
  v42 = [v41 domain];
  int v43 = [v42 isEqualToString:MKErrorDomain];

  if (v43) {
    uint64_t v44 = [v41 code];
  }
  else {
    uint64_t v44 = 5;
  }
  id v45 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:v44 userInfo:v25];

  id v7 = v51;
LABEL_39:

  return v45;
}

- (BOOL)_mapkit_isDirectionsError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"MKDirectionsErrorCode"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (uint64_t)_mapkit_directionsErrorCode
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"MKDirectionsErrorCode"];

  if (v2) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_mapkit_isLocationAuthorizationError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:MKLocationErrorDomain];

  return v3 && [a1 code] < 3;
}

- (uint64_t)_mapkit_underlyingGEOError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"MKErrorGEOError"];

  if (v2) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_mapkit_transitIncident
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"MKErrorGEOTransitIncidentKey"];

  return v2;
}

@end