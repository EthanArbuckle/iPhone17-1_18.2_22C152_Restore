@interface SRPhotoplethysmogramSample
- (id)sr_dictionaryRepresentation;
@end

@implementation SRPhotoplethysmogramSample

- (id)sr_dictionaryRepresentation
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(-[SRPhotoplethysmogramSample opticalSamples](self, "opticalSamples"), "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(SRPhotoplethysmogramSample *)self opticalSamples];
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "sr_dictionaryRepresentation");
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v6);
  }
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(-[SRPhotoplethysmogramSample accelerometerSamples](self, "accelerometerSamples"), "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = [(SRPhotoplethysmogramSample *)self accelerometerSamples];
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)j), "sr_dictionaryRepresentation");
        if (v16) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v13);
  }
  v32[0] = @"startDate";
  objc_msgSend(-[SRPhotoplethysmogramSample startDate](self, "startDate"), "timeIntervalSinceReferenceDate");
  if (fabs(v17) == INFINITY) {
    CFStringRef v18 = @"INF";
  }
  else {
    CFStringRef v18 = +[NSString stringWithFormat:@"%f", *(void *)&v17];
  }
  v33[0] = v18;
  v32[1] = @"nanosecondsSinceStart";
  v33[1] = +[NSNumber numberWithLongLong:[(SRPhotoplethysmogramSample *)self nanosecondsSinceStart]];
  v32[2] = @"usage";
  v33[2] = [(SRPhotoplethysmogramSample *)self usage];
  v33[3] = v3;
  v32[3] = @"opticalSamples";
  v32[4] = @"accelerometerSamples";
  v33[4] = v10;
  v32[5] = @"temperature";
  id v19 = [(SRPhotoplethysmogramSample *)self temperature];
  if (v19)
  {
    [v19 doubleValue];
    if (fabs(v20) == INFINITY) {
      CFStringRef v21 = @"INF";
    }
    else {
      CFStringRef v21 = +[NSString stringWithFormat:@"%f", *(void *)&v20];
    }
  }
  else
  {
    CFStringRef v21 = @"(null)";
  }
  v33[5] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];

  return v22;
}

@end