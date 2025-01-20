@interface GEOComposedRouteAnnotation
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteAnnotation)initWithCoder:(id)a3;
- (GEOComposedRouteAnnotation)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 annotation:(id)a6 onRoute:(id)a7;
- (GEOMiniCard)infoCard;
- (GEOPBTransitArtwork)artwork;
- (id)description;
- (id)position;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteAnnotation

- (GEOComposedRouteAnnotation)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 annotation:(id)a6 onRoute:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([v12 type] != 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v27 = MEMORY[0x1E4F14500];
      v28 = "Assertion failed: enrouteNotice.type == GEOEnrouteNotice_Type_ANNOTATION";
      goto LABEL_15;
    }
LABEL_13:
    v25 = 0;
    goto LABEL_7;
  }
  v15 = [v12 routeAnnotation];

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v27 = MEMORY[0x1E4F14500];
      v28 = "Assertion failed: enrouteNotice.routeAnnotation != ((void *)0)";
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v16 = [v12 routeAnnotation];

  if (v16 != v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v27 = MEMORY[0x1E4F14500];
    v28 = "Assertion failed: enrouteNotice.routeAnnotation == annotation";
LABEL_15:
    _os_log_fault_impl(&dword_188D96000, v27, OS_LOG_TYPE_FAULT, v28, buf, 2u);
    goto LABEL_13;
  }
  [v13 offsetMeters];
  uint64_t v18 = [v14 routeCoordinateForDistance:a5 afterStartOfLegIndex:v17];
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteAnnotation;
  v19 = [(GEOComposedEnrouteNotice *)&v29 initWithEnrouteNotice:v12 enrouteNoticeIndex:a4 legIndex:a5 onRoute:v14 withPolylineCoordinate:v18];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_annotation, a6);
    [v14 pointAtRouteCoordinate:v18];
    v23 = [[GEOLatLng alloc] initWithLatitude:v21 longitude:v22];
    derivedPosition = v20->_derivedPosition;
    v20->_derivedPosition = v23;
  }
  self = v20;
  v25 = self;
LABEL_7:

  return v25;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(GEOEnrouteNotice *)self->super._enrouteNotice hasType])
  {
    v4 = NSString;
    uint64_t v5 = [(GEOEnrouteNotice *)self->super._enrouteNotice type];
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53EA5F8[(int)v5];
    }
    v7 = [v4 stringWithFormat:@"[%@]", v6];
    [v3 addObject:v7];
  }
  if ([(GEORouteAnnotation *)self->_annotation hasArtwork])
  {
    v8 = NSString;
    v9 = [(GEORouteAnnotation *)self->_annotation artwork];
    uint64_t v10 = [v9 artworkType];
    if (v10 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E53EA618[(int)v10];
    }
    id v12 = [v8 stringWithFormat:@"[%@]", v11];
    [v3 addObject:v12];
  }
  if ([(GEORouteAnnotation *)self->_annotation hasOffsetMeters])
  {
    id v13 = NSString;
    [(GEORouteAnnotation *)self->_annotation offsetMeters];
    v15 = objc_msgSend(v13, "stringWithFormat:", @"Offset Meters: %g", v14);
    [v3 addObject:v15];
  }
  id v16 = NSString;
  float v17 = [(GEOComposedRouteAnnotation *)self position];
  [v17 lat];
  uint64_t v19 = v18;
  v20 = [(GEOComposedRouteAnnotation *)self position];
  [v20 lng];
  double v22 = [v16 stringWithFormat:@"%f, %f", v19, v21];
  [v3 addObject:v22];

  v23 = [v3 componentsJoinedByString:@" "];

  return v23;
}

- (id)position
{
  return self->_derivedPosition;
}

- (GEOPBTransitArtwork)artwork
{
  return [(GEORouteAnnotation *)self->_annotation artwork];
}

- (GEOMiniCard)infoCard
{
  return [(GEORouteAnnotation *)self->_annotation infoCard];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteAnnotation;
  uint64_t v5 = [(GEOComposedEnrouteNotice *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_annotation"];
    annotation = v5->_annotation;
    v5->_annotation = (GEORouteAnnotation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_derivedPosition"];
    derivedPosition = v5->_derivedPosition;
    v5->_derivedPosition = (GEOLatLng *)v8;

    uint64_t v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedRouteAnnotation;
  id v4 = a3;
  [(GEOComposedEnrouteNotice *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_annotation, @"_annotation", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_derivedPosition forKey:@"_derivedPosition"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedPosition, 0);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end