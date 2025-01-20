@interface CMPedometerData
- (id)sr_dictionaryRepresentation;
@end

@implementation CMPedometerData

- (id)sr_dictionaryRepresentation
{
  v36[0] = @"startDate";
  v3 = [(NSDate *)[(CMPedometerData *)self startDate] description];
  if (v3) {
    CFStringRef v4 = (const __CFString *)v3;
  }
  else {
    CFStringRef v4 = &stru_1000106F8;
  }
  v37[0] = v4;
  v36[1] = @"endDate";
  v5 = [(NSDate *)[(CMPedometerData *)self endDate] description];
  if (v5) {
    CFStringRef v6 = (const __CFString *)v5;
  }
  else {
    CFStringRef v6 = &stru_1000106F8;
  }
  v37[1] = v6;
  v36[2] = @"numberOfSteps";
  v7 = [(CMPedometerData *)self numberOfSteps];
  if (v7)
  {
    v8 = v7;
    [(NSNumber *)v7 doubleValue];
    if (fabs(v9) == INFINITY) {
      CFStringRef v10 = @"INFINITY";
    }
    else {
      CFStringRef v10 = (const __CFString *)v8;
    }
  }
  else
  {
    CFStringRef v10 = (const __CFString *)&off_1000117E0;
  }
  v37[2] = v10;
  v36[3] = @"distance";
  v11 = [(CMPedometerData *)self distance];
  if (v11)
  {
    v12 = v11;
    [(NSNumber *)v11 doubleValue];
    if (fabs(v13) == INFINITY) {
      CFStringRef v14 = @"INFINITY";
    }
    else {
      CFStringRef v14 = (const __CFString *)v12;
    }
  }
  else
  {
    CFStringRef v14 = (const __CFString *)&off_1000117E0;
  }
  v37[3] = v14;
  v36[4] = @"floorsAscended";
  v15 = [(CMPedometerData *)self floorsAscended];
  if (v15)
  {
    v16 = v15;
    [(NSNumber *)v15 doubleValue];
    if (fabs(v17) == INFINITY) {
      CFStringRef v18 = @"INFINITY";
    }
    else {
      CFStringRef v18 = (const __CFString *)v16;
    }
  }
  else
  {
    CFStringRef v18 = (const __CFString *)&off_1000117E0;
  }
  v37[4] = v18;
  v36[5] = @"floorsDescended";
  v19 = [(CMPedometerData *)self floorsDescended];
  if (v19)
  {
    v20 = v19;
    [(NSNumber *)v19 doubleValue];
    if (fabs(v21) == INFINITY) {
      CFStringRef v22 = @"INFINITY";
    }
    else {
      CFStringRef v22 = (const __CFString *)v20;
    }
  }
  else
  {
    CFStringRef v22 = (const __CFString *)&off_1000117E0;
  }
  v37[5] = v22;
  v36[6] = @"currentPace";
  v23 = [(CMPedometerData *)self currentPace];
  if (v23)
  {
    v24 = v23;
    [(NSNumber *)v23 doubleValue];
    if (fabs(v25) == INFINITY) {
      CFStringRef v26 = @"INFINITY";
    }
    else {
      CFStringRef v26 = (const __CFString *)v24;
    }
  }
  else
  {
    CFStringRef v26 = (const __CFString *)&off_1000117E0;
  }
  v37[6] = v26;
  v36[7] = @"currentCadence";
  v27 = [(CMPedometerData *)self currentCadence];
  if (v27)
  {
    v28 = v27;
    [(NSNumber *)v27 doubleValue];
    if (fabs(v29) == INFINITY) {
      CFStringRef v30 = @"INFINITY";
    }
    else {
      CFStringRef v30 = (const __CFString *)v28;
    }
  }
  else
  {
    CFStringRef v30 = (const __CFString *)&off_1000117E0;
  }
  v37[7] = v30;
  v36[8] = @"averageActivePace";
  v31 = [(CMPedometerData *)self averageActivePace];
  if (v31)
  {
    v32 = v31;
    [(NSNumber *)v31 doubleValue];
    if (fabs(v33) == INFINITY) {
      CFStringRef v34 = @"INFINITY";
    }
    else {
      CFStringRef v34 = (const __CFString *)v32;
    }
  }
  else
  {
    CFStringRef v34 = (const __CFString *)&off_1000117E0;
  }
  v37[8] = v34;
  return +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:9];
}

@end