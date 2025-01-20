@interface GEOMultiSectionFeature
- (BOOL)displaySpeedIsLimited;
- (BOOL)displaySpeedLimitIsMPH;
- (BOOL)isRoadSegmentReversed;
- (BOOL)reverseDirectionDisplaySpeedIsLimited;
- (BOOL)reverseDirectionDisplaySpeedLimitIsMPH;
- (GEOFeature)feature;
- (GEOMultiSectionFeature)initWithRoad:(void *)a3 withVectorTile:(id)a4;
- (GeoCodecsAddressRange)addressRange;
- (GeoCodecsLaneGeometry)laneGeometry;
- (GeoCodecsVectorTileRect)bounds;
- (id)init:(void *)a3 withVectorTile:(id)a4;
- (int)formOfWay;
- (int)roadClass;
- (int)travelDirection;
- (int)type;
- (unint64_t)muid;
- (unint64_t)roadPointCount;
- (unint64_t)roadPointIndex;
- (unint64_t)sectionCount;
- (unint64_t)sectionOffset;
- (unsigned)displaySpeedLimit;
- (unsigned)lineCrossingCount;
- (unsigned)lineCrossingIndex;
- (unsigned)reverseDirectionDisplaySpeedLimit;
- (unsigned)roadWidth;
- (unsigned)speedLimit;
- (unsigned)speedLimitShieldId;
- (void)get;
- (void)getRoad;
@end

@implementation GEOMultiSectionFeature

- (void)get
{
  return self->_multiSectionFeature;
}

- (void)getRoad
{
  return self->_roadFeature;
}

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOMultiSectionFeature;
    v7 = [(GEOMultiSectionFeature *)&v12 init];
    v8 = v7;
    if (v7)
    {
      v7->_multiSectionFeature = a3;
      v9 = [[GEOFeature alloc] init:a3 withVectorTile:v6];
      feature = v8->_feature;
      v8->_feature = v9;
    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (GEOMultiSectionFeature)initWithRoad:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOMultiSectionFeature;
    v7 = [(GEOMultiSectionFeature *)&v12 init];
    v8 = v7;
    if (v7)
    {
      v7->_multiSectionFeature = a3;
      v7->_roadFeature = a3;
      v9 = [[GEOFeature alloc] init:a3 withVectorTile:v6];
      feature = v8->_feature;
      v8->_feature = v9;

      [(GEOFeature *)v8->_feature _setType:*((unsigned __int8 *)v8->_roadFeature + 154)];
    }
    self = v8;
    a3 = self;
  }

  return (GEOMultiSectionFeature *)a3;
}

- (int)type
{
  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[154];
  }
  else {
    return 0;
  }
}

- (GEOFeature)feature
{
  return self->_feature;
}

- (unint64_t)sectionOffset
{
  multiSectionFeature = (unsigned int *)self->_multiSectionFeature;
  if (multiSectionFeature) {
    return multiSectionFeature[24];
  }
  else {
    return 0;
  }
}

- (unint64_t)sectionCount
{
  multiSectionFeature = (unsigned int *)self->_multiSectionFeature;
  if (multiSectionFeature) {
    return multiSectionFeature[25];
  }
  else {
    return 0;
  }
}

- (int)roadClass
{
  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[151];
  }
  else {
    return 0;
  }
}

- (int)formOfWay
{
  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[152];
  }
  else {
    return 0;
  }
}

- (int)travelDirection
{
  roadFeature = (unsigned __int8 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[153];
  }
  else {
    return 0;
  }
}

- (unint64_t)roadPointIndex
{
  roadFeature = (unsigned int *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[33];
  }
  else {
    return 0;
  }
}

- (unint64_t)roadPointCount
{
  roadFeature = (unsigned __int16 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[72];
  }
  else {
    return 0;
  }
}

- (unsigned)lineCrossingIndex
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[34];
  }
  else {
    return 0;
  }
}

- (unsigned)lineCrossingCount
{
  roadFeature = (unsigned __int16 *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature[73];
  }
  else {
    return 0;
  }
}

- (GeoCodecsVectorTileRect)bounds
{
  multiSectionFeature = (GeoCodecsVectorTileRect *)self->_multiSectionFeature;
  if (multiSectionFeature) {
    return multiSectionFeature + 5;
  }
  else {
    return 0;
  }
}

- (GeoCodecsLaneGeometry)laneGeometry
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return (GeoCodecsLaneGeometry *)*((void *)roadFeature + 14);
  }
  else {
    return 0;
  }
}

- (GeoCodecsAddressRange)addressRange
{
  roadFeature = (GeoCodecsAddressRange *)self->_roadFeature;
  if (roadFeature) {
    return roadFeature + 15;
  }
  else {
    return 0;
  }
}

- (unsigned)speedLimit
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[156];
  }
  else {
    return 0;
  }
}

- (BOOL)displaySpeedIsLimited
{
  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[157] != 0;
}

- (unsigned)displaySpeedLimit
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[158];
  }
  else {
    return 0;
  }
}

- (BOOL)displaySpeedLimitIsMPH
{
  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[159] != 0;
}

- (BOOL)reverseDirectionDisplaySpeedIsLimited
{
  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[160] != 0;
}

- (unsigned)reverseDirectionDisplaySpeedLimit
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[161];
  }
  else {
    return 0;
  }
}

- (BOOL)reverseDirectionDisplaySpeedLimitIsMPH
{
  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[162] != 0;
}

- (unsigned)roadWidth
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[74];
  }
  else {
    return 0;
  }
}

- (unsigned)speedLimitShieldId
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[32];
  }
  else {
    return 0;
  }
}

- (unint64_t)muid
{
  roadFeature = self->_roadFeature;
  if (roadFeature) {
    return roadFeature[13];
  }
  else {
    return 0;
  }
}

- (BOOL)isRoadSegmentReversed
{
  roadFeature = self->_roadFeature;
  return roadFeature && roadFeature[155] != 0;
}

- (void).cxx_destruct
{
}

@end