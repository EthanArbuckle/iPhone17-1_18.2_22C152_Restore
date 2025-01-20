@interface GEOMapFeatureRunningTrack
- (GEOMapFeatureRunningTrack)initWithVMP4Track:(const void *)a3 boundingBox:(id)a4;
- (GEOMapRegion)boundingBox;
- (GEOMapRegion)orientedBoundingRegion;
- (NSArray)lanes;
- (id)description;
- (unint64_t)features;
- (unint64_t)trackId;
- (unint64_t)type;
- (unsigned)reliabilityScore;
@end

@implementation GEOMapFeatureRunningTrack

- (GEOMapFeatureRunningTrack)initWithVMP4Track:(const void *)a3 boundingBox:(id)a4
{
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)GEOMapFeatureRunningTrack;
  v8 = [(GEOMapFeatureRunningTrack *)&v38 init];
  v9 = v8;
  if (v8)
  {
    v8->_trackId = *(void *)a3;
    objc_storeStrong((id *)&v8->_boundingBox, a4);
    unint64_t v10 = *((unsigned int *)a3 + 3);
    v9->_type = *((unsigned __int8 *)a3 + 8);
    v9->_features = v10;
    v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 13) - *((void *)a3 + 12)) >> 4)];
    char v12 = *((unsigned char *)a3 + 80);
    [v7 eastLng];
    double v14 = v13;
    [v7 westLng];
    double v16 = v15;
    [v7 northLat];
    double v18 = v17;
    [v7 southLat];
    double v19 = (double)~(-1 << v12);
    double v20 = (v14 - v16) / v19;
    double v22 = (v18 - v21) / v19;
    if ((v9->_features & 4) != 0)
    {
      v23 = objc_alloc_init(GEOMapRegion);
      orientedBoundingRegion = v9->_orientedBoundingRegion;
      v9->_orientedBoundingRegion = v23;

      v25 = pointsToCoordinates(v9->_boundingBox, (void *)a3 + 6, v22, v20);
      [(GEOMapRegion *)v9->_orientedBoundingRegion setVertexs:v25];

      v26 = [(GEOMapRegion *)v9->_orientedBoundingRegion vertexs];
      uint64_t v27 = [v26 count];

      if (v27 == 4)
      {
        v28 = [(GEOMapRegion *)v9->_orientedBoundingRegion vertexs];
        v29 = [(GEOMapRegion *)v9->_orientedBoundingRegion vertexs];
        v30 = [v29 firstObject];
        [v28 addObject:v30];
      }
    }
    uint64_t v31 = *((void *)a3 + 12);
    for (uint64_t i = *((void *)a3 + 13); v31 != i; v31 += 48)
    {
      v33 = pointsToCoordinates(v9->_boundingBox, (void *)(v31 + 8), v22, v20);
      v34 = [[GEOMapFeatureRunningTrackLane alloc] initWithVMP4Lane:v31 coordinates:v33];
      [v11 addObject:v34];
    }
    uint64_t v35 = [v11 copy];
    lanes = v9->_lanes;
    v9->_lanes = (NSArray *)v35;
  }
  return v9;
}

- (unsigned)reliabilityScore
{
  return 0;
}

- (id)description
{
  v3 = [(NSArray *)self->_lanes _geo_map:&__block_literal_global_120];
  unint64_t features = self->_features;
  if (features) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  if ((features & 2) != 0) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  if ((features & 4) != 0) {
    id v7 = "YES";
  }
  else {
    id v7 = "NO";
  }
  v8 = NSString;
  double v20 = v3;
  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  unint64_t trackId = self->_trackId;
  unint64_t type = self->_type;
  double v19 = (void *)v10;
  if (type >= 3)
  {
    double v13 = objc_msgSend(NSString, "stringWithFormat:", @"<Invalid Track Type (%u)>", type);
  }
  else
  {
    double v13 = (void *)*((void *)&off_1E53E8180 + type);
  }
  boundingBox = self->_boundingBox;
  orientedBoundingRegion = self->_orientedBoundingRegion;
  double v16 = [v3 componentsJoinedByString:@"\n"];
  double v17 = [v8 stringWithFormat:@"<%@ %p: %llu '%@' hasWidth: %s hasFlowLineOffsets: %s bbox: %@ hasOrientedBounds: %s oriented: %@> lanes: [%@]", v19, self, trackId, v13, v5, v6, boundingBox, v7, orientedBoundingRegion, v16];

  return v17;
}

id __40__GEOMapFeatureRunningTrack_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 description];

  return v2;
}

- (unint64_t)trackId
{
  return self->_trackId;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)features
{
  return self->_features;
}

- (GEOMapRegion)boundingBox
{
  return self->_boundingBox;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (GEOMapRegion)orientedBoundingRegion
{
  return self->_orientedBoundingRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_orientedBoundingRegion, 0);

  objc_storeStrong((id *)&self->_boundingBox, 0);
}

@end