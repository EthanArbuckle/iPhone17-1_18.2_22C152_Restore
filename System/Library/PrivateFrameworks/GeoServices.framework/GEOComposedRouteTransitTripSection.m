@interface GEOComposedRouteTransitTripSection
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fromNodeID;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)toNodeID;
- (BOOL)_MapsCarPlay_isEqual:(id)a3;
- (BOOL)isTransfer;
- (Color<float,)lineColor;
- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 decoderData:(id)a14;
- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 fallbackStartCoordinate:(id)a14 fallbackEndCoordinate:(id)a15;
- (NSString)description;
- (id)_hallForStop:(id)a3 withDecoderData:(id)a4;
- (id)_stationForHall:(id)a3 withDecoderData:(id)a4;
- (int)toNodeSignificance;
- (unint64_t)lineID;
- (void)_initSupportWithDecoderData:(id)a3 step:(id)a4 toNodeSignificance:(int)a5 transitLineColor:(id)a6;
@end

@implementation GEOComposedRouteTransitTripSection

- (BOOL)isTransfer
{
  return 0;
}

- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 decoderData:(id)a14
{
  uint64_t v16 = *(void *)&a7;
  id v42 = a3;
  id v41 = a4;
  id v21 = a6;
  id v40 = a11;
  id v39 = a14;
  v22 = [v21 objectAtIndexedSubscript:a9];
  v23 = [v22 originStop];
  v24 = [v23 latLng];
  [v24 coordinate];
  double v26 = v25;
  double v28 = v27;
  v29 = [v22 destinationStop];
  v30 = [v29 latLng];
  [v30 coordinate];
  v43.receiver = self;
  v43.super_class = (Class)GEOComposedRouteTransitTripSection;
  int v37 = 1;
  v33 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:transportType:finalStepIndex:fallbackStartCoordinate:fallbackEndCoordinate:startDistance:lengthScaleFactor:](&v43, sel_initWithCoordinates_segment_segmentIndex_steps_startCoordinateIndex_coordinateCount_transportType_finalStepIndex_fallbackStartCoordinate_fallbackEndCoordinate_startDistance_lengthScaleFactor_, v42, v41, a5, v21, v16, a8, v26, v28, v31, v32, a12, a13, v37, a9);

  if (v33)
  {
    [v33 _initSupportWithDecoderData:v39 step:v22 toNodeSignificance:a10 transitLineColor:v40];
    long long v34 = *((_OWORD *)v33 + 5);
    *((_OWORD *)v33 + 17) = *(_OWORD *)(v33 + 56);
    *((_OWORD *)v33 + 18) = v34;
    v35 = v33;
  }

  return (GEOComposedRouteTransitTripSection *)v33;
}

- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 fallbackStartCoordinate:(id)a14 fallbackEndCoordinate:(id)a15
{
  uint64_t v15 = *(void *)&a8;
  uint64_t v16 = *(void *)&a7;
  double var1 = a15.var1;
  double var0 = a15.var0;
  double v21 = a14.var1;
  double v22 = a14.var0;
  id v27 = a6;
  id v28 = a11;
  v35.receiver = self;
  v35.super_class = (Class)GEOComposedRouteTransitTripSection;
  int v34 = 1;
  v29 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:transportType:finalStepIndex:fallbackStartCoordinate:fallbackEndCoordinate:startDistance:lengthScaleFactor:](&v35, sel_initWithCoordinates_segment_segmentIndex_steps_startCoordinateIndex_coordinateCount_transportType_finalStepIndex_fallbackStartCoordinate_fallbackEndCoordinate_startDistance_lengthScaleFactor_, a3, a4, a5, v27, v16, v15, v22, v21, var0, var1, a12, a13, v34, a9);
  if (v29)
  {
    v30 = [v27 objectAtIndexedSubscript:a9];
    [v29 _initSupportWithDecoderData:0 step:v30 toNodeSignificance:a10 transitLineColor:v28];
    long long v31 = *((_OWORD *)v29 + 5);
    *((_OWORD *)v29 + 17) = *(_OWORD *)(v29 + 56);
    *((_OWORD *)v29 + 18) = v31;
    double v32 = v29;
  }
  return (GEOComposedRouteTransitTripSection *)v29;
}

- (void)_initSupportWithDecoderData:(id)a3 step:(id)a4 toNodeSignificance:(int)a5 transitLineColor:(id)a6
{
  v7 = *(void **)&a5;
  id v44 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 originStop];
  v13 = [(GEOComposedRouteTransitTripSection *)self _hallForStop:v12 withDecoderData:v44];

  v14 = [(GEOComposedRouteTransitTripSection *)self _stationForHall:v13 withDecoderData:v44];
  uint64_t v15 = [v10 originStop];
  unint64_t v16 = [v15 muid];
  unint64_t v17 = [v13 muid];
  unint64_t v18 = [v14 muid];
  self->_fromNodeID.stopID = v16;
  self->_fromNodeID.hallID = v17;
  self->_fromNodeID.stationID = v18;

  v19 = [v10 destinationStop];
  v20 = [(GEOComposedRouteTransitTripSection *)self _hallForStop:v19 withDecoderData:v44];

  double v21 = [(GEOComposedRouteTransitTripSection *)self _stationForHall:v20 withDecoderData:v44];

  double v22 = [v10 destinationStop];
  unint64_t v23 = [v22 muid];
  unint64_t v24 = [v20 muid];
  unint64_t v25 = [v21 muid];
  self->_toNodeID.stopID = v23;
  self->_toNodeID.hallID = v24;
  self->_toNodeID.stationID = v25;

  double v26 = [v10 transitLine];
  self->_lineID = [v26 muid];

  id v27 = [v10 originStop];
  id v28 = [v27 latLng];
  [v28 coordinate];
  self->_fromNodeLocation.latitude = v29;
  self->_fromNodeLocation.longitude = v30;

  long long v31 = [v10 destinationStop];
  double v32 = [v31 latLng];
  [v32 coordinate];
  self->_toNodeLocation.latitude = v33;
  self->_toNodeLocation.longitude = v34;

  self->_toNodeSignificance = (int)v7;
  objc_super v35 = v11;
  if (!v11)
  {
    v7 = [v10 transitLine];
    objc_super v35 = [v7 lineColorString];
  }
  v36 = (char *)[v35 UTF8String];
  int v37 = v36;
  if (v36)
  {
    if (*v36 == 35) {
      int v37 = v36 + 1;
    }
    geo::_colorWithHexString<float,4,(geo::ColorSpace)2>((uint64_t)v45, v37);
    if (!v11) {
      goto LABEL_7;
    }
  }
  else
  {
    v45[0] = 0;
    if (!v11)
    {
LABEL_7:
    }
  }
  if (v45[0])
  {
    float v38 = v47;
    float v40 = v48;
    float v39 = v49;
    if (v46 >= 0.04045) {
      float v41 = powf((float)(v46 + 0.055) / 1.055, 2.4);
    }
    else {
      float v41 = v46 / 12.92;
    }
    if (v38 >= 0.04045) {
      float v42 = powf((float)(v38 + 0.055) / 1.055, 2.4);
    }
    else {
      float v42 = v38 / 12.92;
    }
    if (v40 >= 0.04045) {
      float v43 = powf((float)(v40 + 0.055) / 1.055, 2.4);
    }
    else {
      float v43 = v40 / 12.92;
    }
    self->_lineColor._backing._e[0] = v41;
    self->_lineColor._backing._e[1] = v42;
    self->_lineColor._backing._e[2] = v43;
    self->_lineColor._backing._e[3] = v39;
  }
}

- (id)_hallForStop:(id)a3 withDecoderData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasHallIndex]
    && (unsigned int v7 = [v5 hallIndex], objc_msgSend(v6, "hallsCount") > (unint64_t)v7))
  {
    v8 = objc_msgSend(v6, "hallAtIndex:", objc_msgSend(v5, "hallIndex"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_stationForHall:(id)a3 withDecoderData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasStationIndex]
    && (unsigned int v7 = [v5 stationIndex], objc_msgSend(v6, "stationsCount") > (unint64_t)v7))
  {
    v8 = objc_msgSend(v6, "stationAtIndex:", objc_msgSend(v5, "stationIndex"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_MapsCarPlay_isEqual:(id)a3
{
  v4 = (GEOComposedRouteTransitTripSection *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_14;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    unsigned int v7 = v4;
    v16.receiver = self;
    v16.super_class = (Class)GEOComposedRouteTransitTripSection;
    if (![(GEOComposedRouteSection *)&v16 _MapsCarPlay_isEqual:v7]
      || self->_lineID != v7->_lineID
      || self->_toNodeSignificance != v7->_toNodeSignificance)
    {
      goto LABEL_12;
    }
    if (*(void *)self->_lineColor._backing._e != *(void *)v7->_lineColor._backing._e
      || *(void *)&self->_lineColor._backing._e[2] != *(void *)&v7->_lineColor._backing._e[2])
    {
      goto LABEL_12;
    }
    char v6 = 0;
    if (self->_fromNodeID.stopID != v7->_fromNodeID.stopID) {
      goto LABEL_13;
    }
    if (self->_fromNodeID.hallID != v7->_fromNodeID.hallID) {
      goto LABEL_13;
    }
    if (self->_fromNodeID.stationID != v7->_fromNodeID.stationID) {
      goto LABEL_13;
    }
    char v6 = 0;
    if (self->_toNodeID.stopID != v7->_toNodeID.stopID
      || self->_toNodeID.hallID != v7->_toNodeID.hallID
      || self->_toNodeID.stationID != v7->_toNodeID.stationID)
    {
      goto LABEL_13;
    }
    float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL);
    int32x2_t v11 = vmovn_s64(vcgtq_f64(v10, vabdq_f64((float64x2_t)self->_fromNodeLocation, (float64x2_t)v7->_fromNodeLocation)));
    if ((v11.i32[0] & v11.i32[1] & 1) != 0
      && (int32x2_t v12 = vmovn_s64(vcgtq_f64(v10, vabdq_f64((float64x2_t)self->_toNodeLocation, (float64x2_t)v7->_toNodeLocation))),
          (v12.i32[0] & v12.i32[1] & 1) != 0)
      && (float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x3E45798EE2308C3AuLL),
          int32x2_t v14 = vmovn_s64(vcgtq_f64(v13, vabdq_f64((float64x2_t)self->_originalBounds.origin, (float64x2_t)v7->_originalBounds.origin))), (v14.i32[0] & v14.i32[1] & 1) != 0))
    {
      int32x2_t v15 = vmovn_s64(vcgtq_f64(v13, vabdq_f64((float64x2_t)self->_originalBounds.size, (float64x2_t)v7->_originalBounds.size)));
      char v6 = v15.i8[0] & v15.i8[4];
    }
    else
    {
LABEL_12:
      char v6 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  char v6 = 0;
LABEL_14:

  return v6 & 1;
}

- (NSString)description
{
  long double v3 = GEOCoordinateRegionForMapRect(self->super._bounds.origin.x, self->super._bounds.origin.y, self->super._bounds.size.width, self->super._bounds.size.height);
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"p:[%u:%u] stops:[%llu:%llu] (%f,%f)±(%f,%f)", self->super._startPointIndex, -[GEOComposedRouteSection endPointIndex](self, "endPointIndex"), self->_fromNodeID.stopID, self->_toNodeID.stopID, *(void *)&v3, v4, v5, v6);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fromNodeID
{
  *($371C1E790C2F9CD427EBE083D2037053 *)retstr = *($371C1E790C2F9CD427EBE083D2037053 *)((char *)self + 160);
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)toNodeID
{
  *($371C1E790C2F9CD427EBE083D2037053 *)retstr = *($371C1E790C2F9CD427EBE083D2037053 *)((char *)self + 184);
  return self;
}

- (unint64_t)lineID
{
  return self->_lineID;
}

- (int)toNodeSignificance
{
  return self->_toNodeSignificance;
}

- (Color<float,)lineColor
{
  Color<float, 4, geo::ColorSpace::Linear> lineColor = self->_lineColor;
  Color<float, 4, geo::ColorSpace::Linear> *v2 = lineColor;
  result._backing._e[0] = lineColor._backing._e[0];
  return result;
}

@end