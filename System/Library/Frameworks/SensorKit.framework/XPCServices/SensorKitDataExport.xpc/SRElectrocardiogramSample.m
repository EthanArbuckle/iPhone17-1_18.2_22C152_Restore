@interface SRElectrocardiogramSample
- (id)sr_dictionaryRepresentation;
@end

@implementation SRElectrocardiogramSample

- (id)sr_dictionaryRepresentation
{
  id v3 = objc_msgSend(-[SRElectrocardiogramSample session](self, "session"), "sr_dictionaryRepresentation");
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(-[SRElectrocardiogramSample data](self, "data"), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(SRElectrocardiogramSample *)self data];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "sr_dictionaryRepresentation");
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }
  v22[0] = @"timestamp";
  objc_msgSend(-[SRElectrocardiogramSample date](self, "date"), "timeIntervalSinceReferenceDate");
  if (fabs(v11) == INFINITY) {
    CFStringRef v12 = @"INF";
  }
  else {
    CFStringRef v12 = +[NSString stringWithFormat:@"%f", *(void *)&v11];
  }
  v23[0] = v12;
  v22[1] = @"frequency";
  objc_msgSend(-[SRElectrocardiogramSample frequency](self, "frequency"), "doubleValue");
  if (fabs(v13) == INFINITY) {
    CFStringRef v14 = @"INF";
  }
  else {
    CFStringRef v14 = +[NSString stringWithFormat:@"%f", *(void *)&v13];
  }
  v15 = &__NSDictionary0__struct;
  if (v3) {
    v15 = v3;
  }
  v23[1] = v14;
  v23[2] = v15;
  v22[2] = @"session";
  v22[3] = @"data";
  v23[3] = v4;
  v22[4] = @"lead";
  v23[4] = +[NSNumber numberWithInteger:[(SRElectrocardiogramSample *)self lead]];
  v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

  return v16;
}

@end