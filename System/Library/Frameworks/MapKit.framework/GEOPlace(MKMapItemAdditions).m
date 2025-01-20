@interface GEOPlace(MKMapItemAdditions)
- (id)clLocation;
- (id)clRegion;
- (void)initWithCLLocation:()MKMapItemAdditions;
- (void)initWithPlacemark:()MKMapItemAdditions;
@end

@implementation GEOPlace(MKMapItemAdditions)

- (void)initWithCLLocation:()MKMapItemAdditions
{
  id v4 = a3;
  [v4 coordinate];
  v5 = objc_msgSend(a1, "initWithLatitude:longitude:");
  if (v5)
  {
    int v6 = [v4 referenceFrame];
    if (v6 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2 * (v6 == 2);
    }
    [v5 setReferenceFrame:v7];
    id v8 = v5;
  }

  return v5;
}

- (void)initWithPlacemark:()MKMapItemAdditions
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  v9 = [v4 mkPostalAddressDictionary];
  v10 = (void *)[a1 initWithLatitude:v9 longitude:v6 addressDictionary:v8];
  if (v10)
  {
    v11 = [v4 location];
    int v12 = [v11 referenceFrame];
    if (v12 == 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2 * (v12 == 2);
    }
    [v10 setReferenceFrame:v13];

    v14 = [v4 region];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        [v15 center];
        double v17 = v16;
        [v15 center];
        double v19 = v18;
        [v15 radius];
        double v21 = v20;

        double v22 = MKMapRectMakeWithRadialDistance(v17, v19, v21);
        v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v22, v23, v24, v25);
        [v10 setMapRegion:v26];
      }
    }
    id v27 = v10;
  }
  return v10;
}

- (id)clLocation
{
  if ([a1 hasCenter])
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    v3 = [a1 center];
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
    double v8 = [MEMORY[0x1E4F1C9C8] date];
    int v9 = [a1 referenceFrame];
    if (v9 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (v9 == 2);
    }
    v11 = objc_msgSend(v2, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v8, v10, v5, v7, 0.0, 0.0, -1.0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)clRegion
{
  if ([a1 hasMapRegion])
  {
    id v2 = (void *)MEMORY[0x1E4F1E5A8];
    v3 = [a1 mapRegion];
    double v4 = [v2 circularRegionFromMapRegion:v3];

    int v5 = [a1 referenceFrame];
    if (v5 == 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2 * (v5 == 2);
    }
    [v4 setGeoReferenceFrame:v6];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

@end