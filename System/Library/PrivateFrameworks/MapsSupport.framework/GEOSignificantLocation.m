@interface GEOSignificantLocation
+ (id)signifcantLocationWithAddressFromRTLocationOfInterest:(id)a3;
+ (id)significantLocationFromRTLocationOfInterest:(id)a3 numberOfVisitsBucketSize:(unsigned int)a4;
@end

@implementation GEOSignificantLocation

+ (id)significantLocationFromRTLocationOfInterest:(id)a3 numberOfVisitsBucketSize:(unsigned int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)GEOSignificantLocation);
  id v7 = objc_alloc((Class)GEOLocation);
  v8 = [v5 location];
  [v8 latitude];
  double v10 = v9;
  v11 = [v5 location];
  [v11 longitude];
  id v13 = [v7 initWithLatitude:v10 longitude:v12];

  v14 = [v5 location];
  [v14 horizontalUncertainty];
  objc_msgSend(v13, "setHorizontalAccuracy:");

  [v6 setLocation:v13];
  v15 = [v5 identifier];
  v16 = [v15 UUIDString];
  [v6 setIdentifier:v16];

  [v5 confidence];
  objc_msgSend(v6, "setConfidence:");
  if (a4)
  {
    v17 = [v5 visits];
    LODWORD(v18) = vcvtmd_u64_f64((double)(unint64_t)[v17 count] / (double)a4);
    [v6 setNumberOfVisitsBucket:v18];
  }

  return v6;
}

+ (id)signifcantLocationWithAddressFromRTLocationOfInterest:(id)a3
{
  id v4 = a3;
  id v5 = [a1 significantLocationFromRTLocationOfInterest:v4 numberOfVisitsBucketSize:1];
  [v5 setHasNumberOfVisitsBucket:0];
  id v6 = objc_alloc((Class)GEOStructuredAddress);
  id v7 = [v4 mapItem];

  v8 = [v7 address];
  id v9 = [v6 initWithRTAddress:v8];

  [v5 setAddress:v9];

  return v5;
}

@end