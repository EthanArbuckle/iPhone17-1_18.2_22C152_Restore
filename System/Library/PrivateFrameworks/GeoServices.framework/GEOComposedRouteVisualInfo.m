@interface GEOComposedRouteVisualInfo
+ (BOOL)supportsSecureCoding;
+ (id)_infosForRouteLineStyleInfos:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 updateable:(BOOL)a6;
+ (id)cameraInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5;
+ (id)cameraInfosForRoute:(id)a3 etaRoute:(id)a4;
+ (id)visualInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5;
+ (id)visualInfosForRoute:(id)a3 etaRoute:(id)a4;
+ (id)visualInfosForRouteLabelsForGeoWaypointRoute:(id)a3 coordinates:(id)a4;
- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate;
- (GEOComposedRouteVisualInfo)initWithCoder:(id)a3;
- (GEOComposedRouteVisualInfo)initWithGeoNameInfo:(id)a3 routeLegRange:(id)a4 pathIndex:(unint64_t)a5 coordinates:(id)a6;
- (GEOComposedRouteVisualInfo)initWithGeoRouteLineStyleInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6;
- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinate:(id)a6 locationCoordinate:(id)a7;
- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinateRange:(GEOPolylineCoordinateRange)a6 startLocationCoordinate:(id)a7 endLocationCoordinate:(id)a8;
- (GEOComposedString)detailString;
- (GEOComposedString)phoneticName;
- (GEOComposedString)titleString;
- (GEOPolylineCoordinateRange)routeCoordinateRange;
- (GEOServerFormattedString)detail;
- (GEOServerFormattedString)title;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitArtworkDataSource)icon;
- (NSArray)laneChangeInfos;
- (NSString)shieldText;
- (id)description;
- (int)shieldType;
- (unint64_t)_typeForStyleAttribute:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteVisualInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteVisualInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GEOComposedRouteVisualInfo;
  v5 = [(GEOComposedRouteVisualInfo *)&v33 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_detail"];
    detail = v5->_detail;
    v5->_detail = (GEOServerFormattedString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleString"];
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_detailString"];
    detailString = v5->_detailString;
    v5->_detailString = (GEOComposedString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_styleAttributes"];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_icon"];
    icon = v5->_icon;
    v5->_icon = (GEOTransitArtworkDataSource *)v16;

    uint64_t v18 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_laneChangeInfos"];
    laneChangeInfos = v5->_laneChangeInfos;
    v5->_laneChangeInfos = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shieldText"];
    shieldText = v5->_shieldText;
    v5->_shieldText = (NSString *)v20;

    v5->_shieldType = [v4 decodeInt32ForKey:@"_shieldType"];
    unint64_t v32 = 0;
    id v22 = v4;
    v23 = (const void *)[v22 decodeBytesForKey:@"_routeCoordinateRange" returnedLength:&v32];
    if (v32 && v23)
    {
      if (v32 >= 0x10) {
        size_t v24 = 16;
      }
      else {
        size_t v24 = v32;
      }
      memcpy(&v5->_routeCoordinateRange, v23, v24);
    }
    unint64_t v32 = 0;
    id v25 = v22;
    v26 = (const void *)[v25 decodeBytesForKey:@"_startCoordinate" returnedLength:&v32];
    if (v32 && v26)
    {
      if (v32 >= 0x18) {
        size_t v27 = 24;
      }
      else {
        size_t v27 = v32;
      }
      memcpy(&v5->_startCoordinate, v26, v27);
    }
    unint64_t v32 = 0;
    v28 = (const void *)[v25 decodeBytesForKey:@"_endCoordinate" returnedLength:&v32];
    if (v32 && v28)
    {
      if (v32 >= 0x18) {
        size_t v29 = 24;
      }
      else {
        size_t v29 = v32;
      }
      memcpy(&v5->_endCoordinate, v28, v29);
    }
    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"_type"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_detail forKey:@"_detail"];
  [v5 encodeObject:self->_titleString forKey:@"_titleString"];
  [v5 encodeObject:self->_detailString forKey:@"_detailString"];
  [v5 encodeObject:self->_styleAttributes forKey:@"_styleAttributes"];
  [v5 encodeObject:self->_icon forKey:@"_icon"];
  [v5 encodeObject:self->_laneChangeInfos forKey:@"_laneChangeInfos"];
  [v5 encodeObject:self->_shieldText forKey:@"_shieldText"];
  [v5 encodeInt32:self->_shieldType forKey:@"_shieldType"];
  [v5 encodeBytes:&self->_routeCoordinateRange length:16 forKey:@"_routeCoordinateRange"];
  [v5 encodeBytes:&self->_startCoordinate length:24 forKey:@"_startCoordinate"];
  [v5 encodeBytes:&self->_endCoordinate length:24 forKey:@"_endCoordinate"];
}

- (id)description
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t start = (uint64_t)self->_routeCoordinateRange.start;
  uint64_t end = (uint64_t)self->_routeCoordinateRange.end;
  double v6 = vabds_f32((float)start + *((float *)&start + 1), (float)end + *((float *)&end + 1));
  v7 = NSString;
  if (v6 >= 0.001)
  {
    uint64_t v8 = GEOPolylineCoordinateRangeAsString(start, end, v6);
    [v7 stringWithFormat:@"[%@] (%f, %f) to (%f, %f)", v8, *(void *)&self->_startCoordinate.latitude, *(void *)&self->_startCoordinate.longitude, *(void *)&self->_endCoordinate.latitude, *(void *)&self->_endCoordinate.longitude];
  }
  else
  {
    uint64_t v8 = GEOPolylineCoordinateAsString(start, 1, 0, v6);
    [v7 stringWithFormat:@"[%@] (%f, %f)", v8, *(void *)&self->_startCoordinate.latitude, *(void *)&self->_startCoordinate.longitude, v35, v36];
  v9 = };

  [v3 addObject:v9];
  uint64_t v10 = NSString;
  int64_t type = self->_type;
  if (type <= 65629)
  {
    if (type)
    {
      if (type == 191)
      {
        uint64_t v12 = @"Travel Direction Arrow";
      }
      else
      {
LABEL_13:
        objc_msgSend(NSString, "stringWithFormat:", @"<unexpected visual info type: %lu>", self->_type);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v12 = @"None";
    }
  }
  else
  {
    switch(type)
    {
      case 65630:
        uint64_t v12 = @"Traffic State";
        break;
      case 65631:
      case 65632:
      case 65633:
      case 65634:
      case 65635:
      case 65637:
      case 65643:
      case 65645:
      case 65646:
        goto LABEL_13;
      case 65636:
        uint64_t v12 = @"Windshield Mode";
        break;
      case 65638:
        uint64_t v12 = @"Bridge";
        break;
      case 65639:
        uint64_t v12 = @"Tunnel";
        break;
      case 65640:
        uint64_t v12 = @"Urban Canyon";
        break;
      case 65641:
        uint64_t v12 = @"Complex Overpass";
        break;
      case 65642:
        uint64_t v12 = @"Complex Intersection";
        break;
      case 65644:
        uint64_t v12 = @"Traffic Camera";
        break;
      case 65647:
        uint64_t v12 = @"Covered";
        break;
      default:
        if (type == 131073)
        {
          uint64_t v12 = @"Exit Number";
        }
        else
        {
          if (type != 131074) {
            goto LABEL_13;
          }
          uint64_t v12 = @"Significant Road Name";
        }
        break;
    }
  }
  v13 = [v10 stringWithFormat:@"[%@]", v12];
  [v3 addObject:v13];

  titleString = self->_titleString;
  if (titleString)
  {
    detailString = self->_detailString;
    uint64_t v16 = NSString;
    uint64_t v17 = [(GEOComposedString *)titleString stringWithDefaultOptions];
    uint64_t v18 = (void *)v17;
    if (detailString)
    {
      v19 = [(GEOComposedString *)self->_detailString stringWithDefaultOptions];
      uint64_t v20 = [v16 stringWithFormat:@"%@ | %@", v18, v19];
    }
    else
    {
      uint64_t v20 = [v16 stringWithFormat:@"%@", v17];
    }
  }
  else
  {
    styleAttributes = self->_styleAttributes;
    if (styleAttributes)
    {
      v37 = v9;
      v39 = v3;
      id v22 = (void *)MEMORY[0x1E4F1CA48];
      v23 = [(GEOStyleAttributes *)styleAttributes attributes];
      size_t v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v38 = self;
      id v25 = [(GEOStyleAttributes *)self->_styleAttributes attributes];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v41 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = objc_msgSend(NSString, "stringWithFormat:", @"{ %u: %u }", objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "key"), objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "value"));
            [v24 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v27);
      }

      uint64_t v20 = [v24 componentsJoinedByString:@" | "];

      self = v38;
      v3 = v39;
      v9 = v37;
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  [v3 addObject:v20];
  if ([(NSArray *)self->_laneChangeInfos count])
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d lane change infos", -[NSArray count](self->_laneChangeInfos, "count"));
    [v3 addObject:v31];
  }
  if ([(NSString *)self->_shieldText length])
  {
    unint64_t v32 = [NSString stringWithFormat:@"(%d: '%@')", self->_shieldType, self->_shieldText];
    [v3 addObject:v32];
  }
  objc_super v33 = [v3 componentsJoinedByString:@" "];

  return v33;
}

- (unint64_t)type
{
  return self->_type;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOServerFormattedString)detail
{
  return self->_detail;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOComposedString)detailString
{
  return self->_detailString;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOTransitArtworkDataSource)icon
{
  return self->_icon;
}

- (NSArray)laneChangeInfos
{
  return self->_laneChangeInfos;
}

- (GEOComposedString)phoneticName
{
  return self->_phoneticName;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (int)shieldType
{
  return self->_shieldType;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end = self->_routeCoordinateRange.end;
  PolylineCoordinate start = self->_routeCoordinateRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate
{
  double latitude = self->_startCoordinate.latitude;
  double longitude = self->_startCoordinate.longitude;
  double altitude = self->_startCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate
{
  double latitude = self->_endCoordinate.latitude;
  double longitude = self->_endCoordinate.longitude;
  double altitude = self->_endCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_laneChangeInfos, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinate:(id)a6 locationCoordinate:(id)a7
{
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v14 = a5;
  id v15 = a4;
  if (a6.var1 >= 0.0) {
    unint64_t v16 = (vcvtms_u32_f32(a6.var1) + a6.var0) | ((unint64_t)COERCE_UNSIGNED_INT(a6.var1 - floorf(a6.var1)) << 32);
  }
  else {
    unint64_t v16 = 0xBF80000000000000;
  }
  uint64_t v17 = -[GEOComposedRouteVisualInfo initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:](self, "initWithType:title:detail:routeCoordinateRange:startLocationCoordinate:endLocationCoordinate:", a3, v15, v14, v16, v16, var0, var1, var2, var0, var1, var2);

  return v17;
}

- (GEOComposedRouteVisualInfo)initWithType:(unint64_t)a3 title:(id)a4 detail:(id)a5 routeCoordinateRange:(GEOPolylineCoordinateRange)a6 startLocationCoordinate:(id)a7 endLocationCoordinate:(id)a8
{
  double var2 = a8.var2;
  double var1 = a8.var1;
  double var0 = a8.var0;
  double v11 = a7.var2;
  double v12 = a7.var1;
  double v13 = a7.var0;
  PolylineCoordinate end = a6.end;
  PolylineCoordinate start = a6.start;
  id v19 = a4;
  id v20 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GEOComposedRouteVisualInfo;
  v21 = [(GEOComposedRouteVisualInfo *)&v33 init];
  id v22 = v21;
  if (v21)
  {
    v21->_int64_t type = a3;
    uint64_t v23 = objc_msgSend(v19, "_geo_formattedString");
    title = v22->_title;
    v22->_title = (GEOServerFormattedString *)v23;

    uint64_t v25 = objc_msgSend(v20, "_geo_formattedString");
    detail = v22->_detail;
    v22->_detail = (GEOServerFormattedString *)v25;

    uint64_t v27 = [[GEOComposedString alloc] initWithString:v19];
    titleString = v22->_titleString;
    v22->_titleString = v27;

    size_t v29 = [[GEOComposedString alloc] initWithString:v20];
    detailString = v22->_detailString;
    v22->_detailString = v29;

    v22->_routeCoordinateRange.PolylineCoordinate start = start;
    v22->_routeCoordinateRange.PolylineCoordinate end = end;
    v22->_startCoordinate.double latitude = v13;
    v22->_startCoordinate.double longitude = v12;
    v22->_startCoordinate.double altitude = v11;
    v22->_endCoordinate.double latitude = var0;
    v22->_endCoordinate.double longitude = var1;
    v22->_endCoordinate.double altitude = var2;
    v31 = v22;
  }

  return v22;
}

- (GEOComposedRouteVisualInfo)initWithGeoRouteLineStyleInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  double v12 = v11;
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_63:
      uint64_t v35 = 0;
      goto LABEL_58;
    }
    *(_WORD *)buf = 0;
    v78 = MEMORY[0x1E4F14500];
    v79 = "Assertion failed: geoRouteLineStyleInfo != ((void *)0)";
LABEL_65:
    _os_log_fault_impl(&dword_188D96000, v78, OS_LOG_TYPE_FAULT, v79, buf, 2u);
    goto LABEL_63;
  }
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    v78 = MEMORY[0x1E4F14500];
    v79 = "Assertion failed: coordinates != ((void *)0)";
    goto LABEL_65;
  }
  v85.receiver = self;
  v85.super_class = (Class)GEOComposedRouteVisualInfo;
  double v13 = [(GEOComposedRouteVisualInfo *)&v85 init];
  if (v13)
  {
    id v14 = v13;
    id v15 = [v10 labelInfo];
    unint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 title];
      uint64_t v18 = [v17 copy];
      title = v14->_title;
      v14->_title = (GEOServerFormattedString *)v18;

      id v20 = [v16 detail];
      uint64_t v21 = [v20 copy];
      detail = v14->_detail;
      v14->_detail = (GEOServerFormattedString *)v21;

      uint64_t v23 = [GEOComposedString alloc];
      size_t v24 = [v16 title];
      uint64_t v25 = [(GEOComposedString *)v23 initWithGeoFormattedString:v24];
      titleString = v14->_titleString;
      v14->_titleString = (GEOComposedString *)v25;

      uint64_t v27 = [GEOComposedString alloc];
      uint64_t v28 = [v16 detail];
      uint64_t v29 = [(GEOComposedString *)v27 initWithGeoFormattedString:v28];
      detailString = v14->_detailString;
      v14->_detailString = (GEOComposedString *)v29;

      uint64_t v31 = [v16 labelStyleAttributes];
      styleAttributes = v14->_styleAttributes;
      v14->_styleAttributes = (GEOStyleAttributes *)v31;

      uint64_t v33 = [v16 iconArtwork];
      icon = v14->_icon;
      v14->_icon = (GEOTransitArtworkDataSource *)v33;
    }
    else
    {
      uint64_t v36 = [v10 styleAttributes];
      icon = v14->_styleAttributes;
      v14->_styleAttributes = (GEOStyleAttributes *)v36;
    }

    v37 = [(GEOStyleAttributes *)v14->_styleAttributes attributes];
    v38 = [v37 firstObject];
    v14->_int64_t type = [(GEOComposedRouteVisualInfo *)v14 _typeForStyleAttribute:v38];

    v39 = [v10 laneChangeInfos];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      long long v41 = (void *)MEMORY[0x1E4F1CA48];
      long long v42 = [v10 laneChangeInfos];
      long long v43 = objc_msgSend(v41, "arrayWithCapacity:", objc_msgSend(v42, "count"));

      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v80 = v10;
      v44 = [v10 laneChangeInfos];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v81 objects:v87 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v82 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = [[GEOComposedRouteLaneChangeInfo alloc] initWithGeoLaneChangeInfo:*(void *)(*((void *)&v81 + 1) + 8 * i) pathIndex:a4 coordinates:v12 distanceOffset:a6];
            if (v49) {
              [v43 addObject:v49];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v81 objects:v87 count:16];
        }
        while (v46);
      }

      uint64_t v50 = [v43 copy];
      laneChangeInfos = v14->_laneChangeInfos;
      v14->_laneChangeInfos = (NSArray *)v50;

      id v10 = v80;
    }
    [v12 distanceFromStartToStartOfPathIndex:a4];
    double v53 = v52;
    uint64_t v54 = [v12 routeCoordinateRangeForPathIndex:a4];
    uint64_t v56 = v55;
    double v57 = v53 + a6;
    double v58 = v53 + a6 + (float)[v10 startOffsetCm] * 0.01;
    float v59 = (float)[v10 endOffsetCm];
    uint64_t v60 = [v12 routeCoordinateForDistanceAfterStart:v58];
    if (v56 == v54)
    {
      uint64_t v61 = v54;
      uint64_t v62 = v56;
      if (*((float *)&v56 + 1) == *((float *)&v54 + 1)
        || (uint64_t v61 = v54, v62 = v56, *((float *)&v56 + 1) >= *((float *)&v54 + 1)))
      {
LABEL_25:
        float v63 = *((float *)&v61 + 1);
        if (v61 == v60)
        {
          BOOL v64 = *((float *)&v61 + 1) != *((float *)&v60 + 1) && *((float *)&v61 + 1) < *((float *)&v60 + 1);
          uint64_t v65 = v61;
          if (!v64)
          {
LABEL_30:
            if (v61 == v62)
            {
              if (v63 == *((float *)&v62 + 1) || v63 >= *((float *)&v62 + 1))
              {
LABEL_38:
                v14->_routeCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)v62;
                uint64_t v66 = [v12 routeCoordinateForDistanceAfterStart:v57 + v59 * 0.01];
                if (v56 == v54)
                {
                  if (*((float *)&v56 + 1) == *((float *)&v54 + 1) || *((float *)&v56 + 1) >= *((float *)&v54 + 1)) {
                    goto LABEL_41;
                  }
                }
                else if (v56 >= v54)
                {
LABEL_41:
                  uint64_t v67 = v54;
                  uint64_t v54 = v56;
                  goto LABEL_44;
                }
                uint64_t v67 = v56;
LABEL_44:
                float v68 = *((float *)&v67 + 1);
                if (v67 == v66)
                {
                  BOOL v69 = *((float *)&v67 + 1) != *((float *)&v66 + 1) && *((float *)&v67 + 1) < *((float *)&v66 + 1);
                  uint64_t v70 = v67;
                  if (!v69)
                  {
LABEL_49:
                    if (v67 == v54)
                    {
                      if (v68 == *((float *)&v54 + 1) || v68 >= *((float *)&v54 + 1)) {
                        goto LABEL_57;
                      }
                    }
                    else if (v67 >= v54)
                    {
LABEL_57:
                      v14->_routeCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)v54;
                      [v12 coordinateForRouteCoordinate:*(void *)&v14->_routeCoordinateRange.start];
                      v14->_startCoordinate.double latitude = v71;
                      v14->_startCoordinate.double longitude = v72;
                      v14->_startCoordinate.double altitude = v73;
                      [v12 coordinateForRouteCoordinate:*(void *)&v14->_routeCoordinateRange.end];
                      v14->_endCoordinate.double latitude = v74;
                      v14->_endCoordinate.double longitude = v75;
                      v14->_endCoordinate.double altitude = v76;
                      self = v14;

                      uint64_t v35 = self;
LABEL_58:

                      goto LABEL_59;
                    }
                    uint64_t v54 = v70;
                    goto LABEL_57;
                  }
                }
                else
                {
                  uint64_t v70 = v67;
                  if (v67 >= v66) {
                    goto LABEL_49;
                  }
                }
                float v68 = *((float *)&v66 + 1);
                LODWORD(v67) = v66;
                uint64_t v70 = v66;
                goto LABEL_49;
              }
            }
            else if (v61 >= v62)
            {
              goto LABEL_38;
            }
            uint64_t v62 = v65;
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v65 = v61;
          if (v61 >= v60) {
            goto LABEL_30;
          }
        }
        float v63 = *((float *)&v60 + 1);
        LODWORD(v61) = v60;
        uint64_t v65 = v60;
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v61 = v54;
      uint64_t v62 = v56;
      if (v56 >= v54) {
        goto LABEL_25;
      }
    }
    uint64_t v61 = v56;
    uint64_t v62 = v54;
    goto LABEL_25;
  }
  uint64_t v35 = 0;
LABEL_59:

  return v35;
}

- (GEOComposedRouteVisualInfo)initWithGeoNameInfo:(id)a3 routeLegRange:(id)a4 pathIndex:(unint64_t)a5 coordinates:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = v12;
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_15:

      id v15 = 0;
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v39 = MEMORY[0x1E4F14500];
    uint64_t v40 = "Assertion failed: geoNameInfo != ((void *)0)";
LABEL_17:
    _os_log_fault_impl(&dword_188D96000, v39, OS_LOG_TYPE_FAULT, v40, buf, 2u);
    goto LABEL_15;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v39 = MEMORY[0x1E4F14500];
    uint64_t v40 = "Assertion failed: coordinates != ((void *)0)";
    goto LABEL_17;
  }
  v41.receiver = self;
  v41.super_class = (Class)GEOComposedRouteVisualInfo;
  id v14 = [(GEOComposedRouteVisualInfo *)&v41 init];
  id v15 = v14;
  if (v14)
  {
    v14->_int64_t type = 131074;
    unint64_t v16 = [v10 name];
    if (v16)
    {
      uint64_t v17 = [GEOComposedString alloc];
      uint64_t v18 = [v10 name];
      uint64_t v19 = [(GEOComposedString *)v17 initWithString:v18];
      titleString = v15->_titleString;
      v15->_titleString = (GEOComposedString *)v19;
    }
    else
    {
      uint64_t v18 = v15->_titleString;
      v15->_titleString = 0;
    }

    uint64_t v21 = [v10 phoneticName];
    if (v21)
    {
      id v22 = [GEOComposedString alloc];
      uint64_t v23 = [v10 phoneticName];
      uint64_t v24 = [(GEOComposedString *)v22 initWithString:v23];
      phoneticName = v15->_phoneticName;
      v15->_phoneticName = (GEOComposedString *)v24;
    }
    else
    {
      uint64_t v23 = v15->_phoneticName;
      v15->_phoneticName = 0;
    }

    uint64_t v26 = [v10 shield];
    shieldText = v15->_shieldText;
    v15->_shieldText = (NSString *)v26;

    v15->_shieldType = [v10 shieldType];
    double v28 = (float)[v11 startValidDistanceOffsetCm] * 0.01;
    double v29 = (float)[v11 endValidDistanceOffsetCm] * 0.01;
    uint64_t v30 = [v13 routeCoordinateForDistance:a5 afterStartOfPathIndex:v28];
    uint64_t v31 = [v13 routeCoordinateForDistance:a5 afterStartOfPathIndex:v29];
    v15->_routeCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)v30;
    v15->_routeCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)v31;
    [v13 coordinateForRouteCoordinate:v30];
    v15->_startCoordinate.double latitude = v32;
    v15->_startCoordinate.double longitude = v33;
    v15->_startCoordinate.double altitude = v34;
    [v13 coordinateForRouteCoordinate:v31];
    v15->_endCoordinate.double latitude = v35;
    v15->_endCoordinate.double longitude = v36;
    v15->_endCoordinate.double altitude = v37;
  }
LABEL_11:

  return v15;
}

- (unint64_t)_typeForStyleAttribute:(id)a3
{
  if (a3) {
    return [a3 key];
  }
  else {
    return 0;
  }
}

+ (id)visualInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 routeLegsCount])
  {
    unint64_t v10 = 0;
    id v11 = 0;
    do
    {
      id v12 = [v8 routeLegs];
      double v13 = [v12 objectAtIndexedSubscript:v10];

      id v14 = [v13 routeLineStyleInfos];
      id v15 = [a1 _infosForRouteLineStyleInfos:v14 pathIndex:v10 coordinates:v9 updateable:v5];

      if ([v15 count])
      {
        if (!v11)
        {
          id v11 = [MEMORY[0x1E4F1CA48] array];
        }
        [v11 addObjectsFromArray:v15];
      }

      ++v10;
    }
    while (v10 < [v8 routeLegsCount]);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)visualInfosForRouteLabelsForGeoWaypointRoute:(id)a3 coordinates:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 routeLegs];
  id v8 = (void *)[v7 count];

  if (v8)
  {
    id v8 = 0;
    unint64_t v9 = 0;
    uint64_t v24 = v5;
    do
    {
      unint64_t v10 = objc_msgSend(v5, "routeLegs", v24);
      id v11 = [v10 objectAtIndexedSubscript:v9];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v25 = v11;
      id obj = [v11 routeNames];
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v28)
      {
        uint64_t v27 = *(void *)v35;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = v12;
            double v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
            id v14 = [v13 nameInfo];
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v15 = [v13 nameRanges];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v31 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = [[GEOComposedRouteVisualInfo alloc] initWithGeoNameInfo:v14 routeLegRange:*(void *)(*((void *)&v30 + 1) + 8 * i) pathIndex:v9 coordinates:v6];
                  if (!v8)
                  {
                    id v8 = [MEMORY[0x1E4F1CA48] array];
                  }
                  [v8 addObject:v20];
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v17);
            }

            uint64_t v12 = v29 + 1;
          }
          while (v29 + 1 != v28);
          uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v28);
      }

      ++v9;
      id v5 = v24;
      uint64_t v21 = [v24 routeLegs];
      unint64_t v22 = [v21 count];
    }
    while (v9 < v22);
  }

  return v8;
}

+ (id)cameraInfosForGeoWaypointRoute:(id)a3 coordinates:(id)a4 updateable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 routeLegsCount])
  {
    unint64_t v10 = 0;
    id v11 = 0;
    do
    {
      uint64_t v12 = [v8 routeLegs];
      double v13 = [v12 objectAtIndexedSubscript:v10];

      id v14 = [v13 routeCameraInputInfos];
      id v15 = [a1 _infosForRouteLineStyleInfos:v14 pathIndex:v10 coordinates:v9 updateable:v5];

      if ([v15 count])
      {
        if (!v11)
        {
          id v11 = [MEMORY[0x1E4F1CA48] array];
        }
        [v11 addObjectsFromArray:v15];
      }

      ++v10;
    }
    while (v10 < [v8 routeLegsCount]);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)visualInfosForRoute:(id)a3 etaRoute:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  uint64_t v50 = v5;
  if (!v5 || !v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route != ((void *)0) && etaRoute != ((void *)0)", buf, 2u);
    }
    goto LABEL_26;
  }
  id v8 = [v6 geoETAWaypointRoute];
  id v9 = [v8 routeLegs];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
LABEL_26:
    uint64_t v12 = 0;
    goto LABEL_27;
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  *(void *)&long long v11 = 67109376;
  long long v46 = v11;
  uint64_t v47 = v7;
  do
  {
    id v14 = objc_msgSend(v7, "legs", v46);
    id v15 = [v14 objectAtIndexedSubscript:v13];

    unint64_t v16 = [v15 originalLegIndex];
    uint64_t v17 = [v50 legs];
    unint64_t v18 = [v17 count];

    if (v16 >= v18)
    {
      v38 = GEOGetGEOComposedRouteLog_0();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        int v39 = [v15 originalLegIndex];
        uint64_t v40 = [v50 legs];
        int v41 = [v40 count];
        *(_DWORD *)buf = v46;
        int v57 = v39;
        __int16 v58 = 1024;
        int v59 = v41;
        _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_FAULT, "ETA route leg's original leg index (%d) is beyond bounds of route's leg count (%d). This likely means an error creating the ETA route.", buf, 0xEu);
      }
    }
    else
    {
      double v19 = 0.0;
      if (!v13)
      {
        id v20 = [v50 legs];
        uint64_t v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v15, "originalLegIndex"));

        [v21 distance];
        double v23 = v22;
        [v15 length];
        double v19 = v23 - v24;
      }
      uint64_t v25 = [v7 geoETAWaypointRoute];
      uint64_t v26 = [v25 routeLegs];
      unint64_t v49 = v13;
      uint64_t v27 = [v26 objectAtIndexedSubscript:v13];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v48 = v27;
      uint64_t v28 = [v27 routeLineStyleInfos];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v52 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            long long v34 = [GEOComposedRouteVisualInfo alloc];
            uint64_t v35 = [v15 originalLegIndex];
            long long v36 = [v50 coordinates];
            long long v37 = [(GEOComposedRouteVisualInfo *)v34 initWithGeoRouteLineStyleInfo:v33 pathIndex:v35 coordinates:v36 distanceOffset:v19];

            if (v37)
            {
              if (!v12)
              {
                uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
              }
              [v12 addObject:v37];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v30);
      }

      v7 = v47;
      v38 = v48;
      unint64_t v13 = v49;
    }

    ++v13;
    long long v42 = [v7 geoETAWaypointRoute];
    long long v43 = [v42 routeLegs];
    unint64_t v44 = [v43 count];
  }
  while (v13 < v44);
LABEL_27:

  return v12;
}

+ (id)cameraInfosForRoute:(id)a3 etaRoute:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  long long v53 = v5;
  if (!v5
    || !v6
    || ([v5 uniqueRouteID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v7 uniqueRouteID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqual:v9],
        v9,
        v8,
        !v10))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route != ((void *)0) && etaRoute != ((void *)0) && [route.uniqueRouteID isEqual:etaRoute.uniqueRouteID]", buf, 2u);
    }
    goto LABEL_27;
  }
  long long v11 = [v7 geoETAWaypointRoute];
  uint64_t v12 = [v11 routeLegs];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
LABEL_27:
    unint64_t v16 = 0;
    goto LABEL_28;
  }
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  *(void *)&long long v14 = 67109376;
  long long v49 = v14;
  uint64_t v50 = v7;
  do
  {
    uint64_t v17 = objc_msgSend(v7, "legs", v49);
    unint64_t v18 = [v17 objectAtIndexedSubscript:v15];

    unint64_t v19 = [v18 originalLegIndex];
    id v20 = [v53 legs];
    unint64_t v21 = [v20 count];

    if (v19 >= v21)
    {
      int v41 = GEOGetGEOComposedRouteLog_0();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        int v42 = [v18 originalLegIndex];
        long long v43 = [v53 legs];
        int v44 = [v43 count];
        *(_DWORD *)buf = v49;
        int v60 = v42;
        __int16 v61 = 1024;
        int v62 = v44;
        _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_FAULT, "ETA route leg's original leg index (%d) is beyond bounds of route's leg count (%d). This likely means an error creating the ETA route.", buf, 0xEu);
      }
    }
    else
    {
      double v22 = 0.0;
      if (!v15)
      {
        double v23 = [v53 legs];
        double v24 = objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v18, "originalLegIndex"));

        [v24 distance];
        double v26 = v25;
        [v18 length];
        double v22 = v26 - v27;
      }
      uint64_t v28 = [v7 geoETAWaypointRoute];
      uint64_t v29 = [v28 routeLegs];
      unint64_t v52 = v15;
      uint64_t v30 = [v29 objectAtIndexedSubscript:v15];

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v51 = v30;
      uint64_t v31 = [v30 routeCameraInputInfos];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v55 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            long long v37 = [GEOComposedRouteVisualInfo alloc];
            uint64_t v38 = [v18 originalLegIndex];
            int v39 = [v53 coordinates];
            uint64_t v40 = [(GEOComposedRouteVisualInfo *)v37 initWithGeoRouteLineStyleInfo:v36 pathIndex:v38 coordinates:v39 distanceOffset:v22];

            if (v40)
            {
              if (!v16)
              {
                unint64_t v16 = [MEMORY[0x1E4F1CA48] array];
              }
              [v16 addObject:v40];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v33);
      }

      v7 = v50;
      int v41 = v51;
      unint64_t v15 = v52;
    }

    ++v15;
    uint64_t v45 = [v7 geoETAWaypointRoute];
    long long v46 = [v45 routeLegs];
    unint64_t v47 = [v46 count];
  }
  while (v15 < v47);
LABEL_28:

  return v16;
}

+ (id)_infosForRouteLineStyleInfos:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 updateable:(BOOL)a6
{
  int v6 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v9);
        }
        unint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 preserveStyleInUpdates] != v6)
        {
          uint64_t v17 = [[GEOComposedRouteVisualInfo alloc] initWithGeoRouteLineStyleInfo:v16 pathIndex:a4 coordinates:v10 distanceOffset:0.0];
          if (v17)
          {
            if (!v13)
            {
              uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
            }
            [v13 addObject:v17];
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end