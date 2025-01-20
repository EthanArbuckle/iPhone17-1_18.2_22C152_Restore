@interface GEOMapFeatureRoad
- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate;
- (BOOL)isBridge;
- (BOOL)isDrivable;
- (BOOL)isFlipped;
- (BOOL)isRail;
- (BOOL)isRoadPedestrianNavigable;
- (BOOL)isTunnel;
- (BOOL)isValidTravelDirection;
- (BOOL)isWalkable;
- (BOOL)speedLimitIsMPH;
- (GEOMapFeatureJunction)endJunction;
- (GEOMapFeatureJunction)startJunction;
- (GEOMapFeatureRoad)initWithFeature:(id)a3;
- (GEOMultiSectionFeature)endFeature;
- (GEOMultiSectionFeature)feature;
- (GEOMultiSectionFeature)startFeature;
- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (NSString)internalRoadName;
- (double)roadWidth;
- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (id)_attributes;
- (id)_containingTile;
- (id)_junctionA;
- (id)_junctionB;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)flippedCopy;
- (id)localizedRoadName:(id *)a3;
- (int)_flippedBikeLaneSideFor:(int)a3;
- (int)_flippedBikeableSideFor:(int)a3;
- (int)_flippedSidewalkSideFor:(int)a3;
- (int)_flippedWalkableSideFor:(int)a3;
- (int)bikeLaneSide;
- (int)bikeableSide;
- (int)formOfWay;
- (int)rampType;
- (int)roadClass;
- (int)sidewalkSide;
- (int)travelDirection;
- (int)walkableSide;
- (int64_t)laneCount;
- (int64_t)signedMuid;
- (uint64_t)tileKey;
- (unint64_t)_diagnosticsOnly_forwardSpeedLimit;
- (unint64_t)_diagnosticsOnly_reverseSpeedLimit;
- (unint64_t)featureIndex;
- (unint64_t)muid;
- (unint64_t)roadID;
- (unint64_t)speedLimit;
- (void)flip;
- (void)updateForDesiredRoadDirectionality:(unint64_t)a3 isOutboundRoad:(BOOL)a4;
@end

@implementation GEOMapFeatureRoad

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(GEOMapFeatureRoad *)self description];
  [v3 addObject:v4];

  uint64_t v5 = [(GEOMapFeatureRoad *)self formOfWay];
  if v5 < 0x17 && ((0x7EDDDFu >> v5))
  {
    v6 = off_1E53DA5E0[(int)v5];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v6];
  [v3 addObject:v7];

  uint64_t v8 = [(GEOMapFeatureRoad *)self walkableSide];
  if (v8 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53DA698[(int)v8];
  }
  v10 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v9];
  [v3 addObject:v10];

  uint64_t v11 = [(GEOMapFeatureRoad *)self bikeableSide];
  if (v11 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E53DA6B8[(int)v11];
  }
  v13 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v12];
  [v3 addObject:v13];

  uint64_t v14 = [(GEOMapFeatureRoad *)self bikeLaneSide];
  if (v14 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E53DA6D8[(int)v14];
  }
  v16 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v15];
  [v3 addObject:v16];

  *(void *)v28 = [(GEOMapFeatureRoad *)self tileKey];
  v28[8] = v17;
  if ((v28[0] & 0x7F) == 0xC)
  {
    *((void *)&v18 + 1) = (unsigned __int16)(v17 >> 8) | ((unint64_t)BYTE3(v17) << 16);
    *(void *)&long long v18 = *(void *)&v28[1];
    uint64_t v23 = v18 >> 6;
    unint64_t v24 = v28[1] & 0x3F;
    uint64_t v25 = (DWORD2(v18) >> 6) & 0x3FFF;
    v19 = @"%llu_%d_type_%d";
  }
  else
  {
    uint64_t v26 = v28[0] & 0x7F;
    uint64_t v27 = (unsigned __int16)(HIDWORD(v17) >> 8) >> 2;
    uint64_t v23 = ((*(void *)&v28[1] >> 46) | ((v17 >> 8) << 18)) & 0x3FFFFFF;
    unint64_t v24 = (((v17 >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v17) >> 8) | (HIBYTE(v17) << 16)) << 32)) >> 8) & 0x3FFFFFF;
    uint64_t v25 = (*(void *)&v28[1] >> 40) & 0x3FLL;
    v19 = @"%d.%d.%d_provider_%d_type_%d";
  }
  v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v23, v24, v25, v26, v27, *(void *)v28);
  [v3 addObject:v20];

  v21 = [v3 componentsJoinedByString:@" | "];

  return v21;
}

- (unint64_t)roadID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_roadKey = &self->_roadKey;
  unint64_t result = self->_roadKey.roadID;
  if (!result)
  {
    *(void *)&long long v9 = [(GEOMapFeatureRoad *)self tileKey];
    *((void *)&v9 + 1) = v5;
    unint64_t v6 = (v5 >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v5) >> 8) | (HIBYTE(v5) << 16)) << 32);
    unint64_t v7 = *(void *)((char *)&v9 + 1);
    if (*(void *)((unsigned char *)&v9 + 1) & 0xC000000000000000 | BYTE1(v5)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: tileKey.standard.x < (1 << kGEOMapFeatureRoadKeyTileXSize)", v8, 2u);
    }
    if ((v6 & 0x3FF000000) != 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: tileKey.standard.y < (1 << kGEOMapFeatureRoadKeyTileYSize)", v8, 2u);
    }
    if ([(GEOMapFeatureRoad *)self featureIndex] >= 0x4000
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: self.featureIndex < (1 << kGEOMapFeatureRoadKeyFeatureIndexSize)", v8, 2u);
    }
    *(_DWORD *)((char *)&p_roadKey->var0 + 2) = (v7 >> 30) & 0xFFFF0000 | (unsigned __int16)(v6 >> 8);
    LOWORD(p_roadKey->roadID) = (2 * ([(GEOMapFeatureRoad *)self featureIndex] & 0x3FFF)) | p_roadKey->roadID & 0x8001;
    LOWORD(p_roadKey->roadID) = p_roadKey->roadID & 0xFFFE | [(GEOMapFeatureRoad *)self isFlipped];
    return p_roadKey->roadID;
  }
  return result;
}

- (unint64_t)muid
{
  v2 = [(GEOMapFeatureRoad *)self feature];
  unint64_t v3 = [v2 muid];

  return v3;
}

- (int64_t)signedMuid
{
  int64_t v3 = [(GEOMapFeatureRoad *)self muid];
  v4 = [(GEOMapFeatureRoad *)self feature];
  int v5 = [v4 isRoadSegmentReversed];

  if (v5 != [(GEOMapFeatureRoad *)self isFlipped]) {
    return -v3;
  }
  else {
    return v3;
  }
}

- (GEOMapFeatureJunction)startJunction
{
  if (self->super._isFlipped) {
    [(GEOMapFeatureRoad *)self _junctionB];
  }
  else {
  v2 = [(GEOMapFeatureRoad *)self _junctionA];
  }

  return (GEOMapFeatureJunction *)v2;
}

- (GEOMapFeatureJunction)endJunction
{
  if (self->super._isFlipped) {
    [(GEOMapFeatureRoad *)self _junctionA];
  }
  else {
  v2 = [(GEOMapFeatureRoad *)self _junctionB];
  }

  return (GEOMapFeatureJunction *)v2;
}

- (int)roadClass
{
  int64_t v3 = [(GEOMapFeatureRoad *)self feature];
  if (v3)
  {
    v4 = [(GEOMapFeatureRoad *)self feature];
    int v5 = [v4 roadClass];
  }
  else
  {
    int v5 = 9;
  }

  return v5;
}

- (int)formOfWay
{
  int64_t v3 = [(GEOMapFeatureRoad *)self feature];
  if (v3)
  {
    v4 = [(GEOMapFeatureRoad *)self feature];
    int v5 = [v4 formOfWay];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)travelDirection
{
  int64_t v3 = [(GEOMapFeatureRoad *)self feature];

  if (!v3) {
    return 255;
  }
  v4 = [(GEOMapFeatureRoad *)self feature];
  int v5 = [v4 travelDirection];

  if (v5 == 1)
  {
    if (self->super._isFlipped) {
      return 2;
    }
  }
  else if (v5 == 2 && self->super._isFlipped)
  {
    return 1;
  }
  unint64_t v7 = [(GEOMapFeatureRoad *)self feature];
  int v8 = [v7 travelDirection];

  return v8;
}

- (BOOL)isValidTravelDirection
{
  return [(GEOMapFeatureRoad *)self travelDirection] < 2;
}

- (int64_t)laneCount
{
  uint64_t v5 = 0;
  v2 = [(GEOMapFeatureRoad *)self feature];
  int64_t v3 = GEOMultiSectionFeatureCharacteristicPoints(v2, (GeoCodecsRoadFeature *)&v5);

  if (v3) {
    return *((unsigned int *)v3 + 4);
  }
  else {
    return -1;
  }
}

- (double)roadWidth
{
  v2 = [(GEOMapFeatureRoad *)self feature];
  double v3 = (double)[v2 roadWidth] * 0.01;

  return v3;
}

- (unint64_t)speedLimit
{
  if (self->super._isFlipped) {
    return [(GEOMapFeatureRoad *)self _diagnosticsOnly_reverseSpeedLimit];
  }
  else {
    return [(GEOMapFeatureRoad *)self _diagnosticsOnly_forwardSpeedLimit];
  }
}

- (BOOL)speedLimitIsMPH
{
  v2 = [(GEOMapFeatureRoad *)self feature];
  char v3 = [v2 displaySpeedLimitIsMPH];

  return v3;
}

- (BOOL)isDrivable
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isDrivable];

  return v3;
}

- (BOOL)isWalkable
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isWalkable];

  return v3;
}

- (BOOL)isRoadPedestrianNavigable
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isRoadPedestrianNavigable];

  return v3;
}

- (int)walkableSide
{
  char v3 = [(GEOMapFeatureRoad *)self _attributes];
  uint64_t v4 = [v3 walkableSide];

  if (!self->super._isFlipped) {
    return v4;
  }

  return [(GEOMapFeatureRoad *)self _flippedWalkableSideFor:v4];
}

- (int)sidewalkSide
{
  char v3 = [(GEOMapFeatureRoad *)self _attributes];
  uint64_t v4 = [v3 sidewalkSide];

  if (!self->super._isFlipped) {
    return v4;
  }

  return [(GEOMapFeatureRoad *)self _flippedSidewalkSideFor:v4];
}

- (int)bikeableSide
{
  char v3 = [(GEOMapFeatureRoad *)self _attributes];
  uint64_t v4 = [v3 bikeableSide];

  if (!self->super._isFlipped) {
    return v4;
  }

  return [(GEOMapFeatureRoad *)self _flippedBikeableSideFor:v4];
}

- (int)bikeLaneSide
{
  char v3 = [(GEOMapFeatureRoad *)self _attributes];
  uint64_t v4 = [v3 bikeLaneSide];

  if (!self->super._isFlipped) {
    return v4;
  }

  return [(GEOMapFeatureRoad *)self _flippedBikeLaneSideFor:v4];
}

- (BOOL)isTunnel
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isTunnel];

  return v3;
}

- (BOOL)isBridge
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isBridge];

  return v3;
}

- (BOOL)isRail
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  char v3 = [v2 isRailway];

  return v3;
}

- (int)rampType
{
  v2 = [(GEOMapFeatureRoad *)self _attributes];
  int v3 = [v2 rampType];

  return v3;
}

- (NSString)internalRoadName
{
  int v3 = [(GEOMapFeatureRoad *)self feature];
  uint64_t v4 = [v3 feature];
  if ([v4 name])
  {
    uint64_t v5 = NSString;
    unint64_t v6 = [(GEOMapFeatureRoad *)self feature];
    unint64_t v7 = [v6 feature];
    int v8 = objc_msgSend(v5, "stringWithUTF8String:", objc_msgSend(v7, "name"));
  }
  else
  {
    int v8 = 0;
  }

  return (NSString *)v8;
}

- (void)flip
{
  self->super._isFlipped ^= 1u;
  if (self->super._tempCoordinates2d)
  {
    unint64_t coordinateCount = self->super._coordinateCount;
    if (coordinateCount >= 2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      uint64_t v5 = -(uint64_t)(coordinateCount >> 1);
      do
      {
        tempCoordinates2d = self->super._tempCoordinates2d;
        $F24F406B2B787EFB06265DBA3D28CBD5 v7 = tempCoordinates2d[v3];
        unint64_t v8 = 16 * (v4 + self->super._coordinateCount) - 16;
        tempCoordinates2d[v3] = *($F24F406B2B787EFB06265DBA3D28CBD5 *)((char *)tempCoordinates2d + v8);
        *($F24F406B2B787EFB06265DBA3D28CBD5 *)((char *)self->super._tempCoordinates2d + v8) = v7;
        --v4;
        ++v3;
      }
      while (v5 != v4);
    }
  }
  if (self->super._coordinates3d)
  {
    unint64_t v9 = self->super._coordinateCount;
    if (v9 >= 2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = -(uint64_t)(v9 >> 1);
      do
      {
        coordinates3d = self->super._coordinates3d;
        uint64_t v14 = &coordinates3d[v10];
        double var2 = coordinates3d[v10].var2;
        long long v16 = *(_OWORD *)&coordinates3d[v10].var0;
        unint64_t v17 = 24 * (v11 + self->super._coordinateCount) - 24;
        long long v18 = (double *)((char *)&coordinates3d->var0 + v17);
        double v19 = v18[2];
        *(_OWORD *)&v14->var0 = *(_OWORD *)v18;
        v14->double var2 = v19;
        v20 = (double *)((char *)&self->super._coordinates3d->var0 + v17);
        *(_OWORD *)v20 = v16;
        v20[2] = var2;
        --v11;
        ++v10;
      }
      while (v12 != v11);
    }
  }
  unint64_t roadID = self->_roadKey.roadID;
  if (roadID) {
    LOWORD(self->_roadKey.roadID) = roadID & 0xFFFE | self->super._isFlipped;
  }
}

- (id)flippedCopy
{
  v2 = (void *)[(GEOMapFeatureRoad *)self copy];
  [v2 flip];

  return v2;
}

- (id)localizedRoadName:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(GEOMapFeatureRoad *)self feature];

  if (v5)
  {
    unint64_t v6 = [(GEOMapFeatureRoad *)self feature];
    $F24F406B2B787EFB06265DBA3D28CBD5 v7 = [v6 feature];

    unint64_t v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t LocalizedLabelCount = GEOFeatureGetLocalizedLabelCount(v7);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:LocalizedLabelCount];
    if (LocalizedLabelCount)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        unint64_t v31 = 0;
        unint64_t v32 = 0;
        GEOFeatureGetLocalizedLabel(v7, 0, &v32, &v31);
        if (v32) {
          BOOL v13 = v31 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:");
          v15 = [NSString stringWithUTF8String:v31];
          [v10 setObject:v14 forKeyedSubscript:v15];
        }
        if (!v11)
        {
          uint64_t v16 = [NSString stringWithUTF8String:v31];

          uint64_t v12 = (void *)v16;
        }
        ++v11;
      }
      while (LocalizedLabelCount != v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          unint64_t v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend(v10, "objectForKeyedSubscript:", v24, (void)v27);
          if (v25)
          {
            long long v18 = (void *)v25;
            id v17 = v24;

            goto LABEL_27;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    if (v12)
    {
      long long v18 = [v10 objectForKeyedSubscript:v12];
      id v17 = v12;
    }
    else
    {
      id v17 = 0;
      long long v18 = 0;
    }
LABEL_27:

    if (a3) {
      goto LABEL_28;
    }
  }
  else
  {
    id v17 = 0;
    long long v18 = 0;
    if (a3) {
LABEL_28:
    }
      *a3 = v17;
  }

  return v18;
}

- (id)_junctionA
{
  if (!self->_checkedJunctionA)
  {
    uint64_t v3 = +[GEOMapFeatureJunction junctionForRoadFeature:self->_feature startJunction:1];
    junctionA = self->_junctionA;
    self->_junctionA = v3;

    self->_checkedJunctionA = 1;
  }
  uint64_t v5 = self->_junctionA;

  return v5;
}

- (id)_junctionB
{
  if (!self->_checkedJunctionB)
  {
    uint64_t v3 = +[GEOMapFeatureJunction junctionForRoadFeature:self->_feature startJunction:0];
    junctionB = self->_junctionB;
    self->_junctionB = v3;

    self->_checkedJunctionB = 1;
  }
  uint64_t v5 = self->_junctionB;

  return v5;
}

- (int)_flippedWalkableSideFor:(int)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = a3;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v3;
  }
}

- (int)_flippedSidewalkSideFor:(int)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = a3;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v3;
  }
}

- (int)_flippedBikeableSideFor:(int)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = a3;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v3;
  }
}

- (int)_flippedBikeLaneSideFor:(int)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = a3;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v3;
  }
}

- (id)_containingTile
{
  return self->_tile;
}

- (id)_attributes
{
  v2 = [(GEOMapFeatureRoad *)self feature];
  int v3 = [v2 feature];
  uint64_t v4 = [v3 attributes];

  return v4;
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v41 = 0;
  unint64_t v6 = (GeoCodecsVectorTilePoint *)GEOMultiSectionFeaturePoints(self->_feature, a3, &v41);
  if (a4)
  {
    unint64_t v7 = v41;
    *a4 = v41;
    if (v7 <= 1)
    {
      unint64_t v8 = [(GEOMapFeatureRoad *)self _containingTile];
      uint64_t v9 = [v8 tileKey];
      unsigned __int8 v10 = *(unsigned char *)(v9 + 10);
      uint64_t v11 = *(void *)v9;
      uint64_t v12 = *(void *)v9 << 32;
      unint64_t v13 = BYTE4(*(void *)v9) | ((((*(void *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34);
      *(void *)&buf[1] = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v9 >> 8) & 0x3F) << 40);
      buf[0] = v11;
      char v14 = v11;
      *((void *)&v15 + 1) = (v13 | ((unint64_t)(v10 & 0xF) << 48)) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v10 >> 4) << 52);
      *(void *)&long long v15 = v12;
      *(void *)&long long v48 = *(void *)buf;
      *((void *)&v48 + 1) = v15 >> 56;
      feature = self->_feature;
      id v17 = [v8 lines];
      long long v18 = [v17 objectAtIndex:0];
      int IndexforMultiSectionFeature = getIndexforMultiSectionFeature(feature, v18);

      uint64_t v20 = GEOGetGEOMapFeatureAccessLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        if ((v14 & 0x7F) == 0xC)
        {
          *((void *)&v21 + 1) = *(unsigned __int16 *)((char *)&v48 + 9) | ((unint64_t)BYTE11(v48) << 16);
          *(void *)&long long v21 = *(void *)((char *)&v48 + 1);
          objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v21 >> 6), BYTE1(v48) & 0x3F, ((*(unsigned __int16 *)((char *)&v48 + 9) | (BYTE11(v48) << 16)) >> 6) & 0x3FFF, v39, v40);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)((char *)&v48 + 1) >> 46) | (*(_DWORD *)((char *)&v48 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v48 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v48 + 13) | (HIBYTE(v48) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)((char *)&v48 + 1) >> 40) & 0x3FLL, v14 & 0x7F, *(unsigned __int16 *)((char *)&v48 + 13) >> 2);
        uint64_t v22 = };
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v22;
        __int16 v43 = 1024;
        *(_DWORD *)v44 = IndexforMultiSectionFeature;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v7;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Tile %@ contains a road at index (%u) with fewer than two points (%d)", buf, 0x18u);
      }
      double v23 = GEOMapRectForGEOTileKey((uint64_t)&v48);
      if (v7)
      {
        double v27 = v23;
        double v28 = v24;
        double v29 = v25;
        double v30 = v26;
        float var0 = v6->var0;
        float var1 = v6->var1;
        v33 = GEOGetGEOMapFeatureAccessLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          long double v34 = exp(((v28 + (float)(1.0 - var1) * v30) * 0.0078125 + -1048576.0) / 333772.107);
          long double v35 = atan(v34);
          double v36 = v6->var0;
          double v37 = v6->var1;
          *(_DWORD *)buf = 134218752;
          *(double *)&buf[4] = v36;
          __int16 v43 = 2048;
          *(double *)v44 = v37;
          *(_WORD *)&v44[8] = 2048;
          double v45 = (v35 * -2.0 + 1.57079633) * 57.2957795;
          __int16 v46 = 2048;
          double v47 = (v27 + var0 * v29) * 0.0078125 * 0.000171661377 + -180.0;
          _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_ERROR, "[%0.5f, %0.5f] (%0.9f, %0.9f)", buf, 0x2Au);
        }
      }
    }
  }
  return v6;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  unint64_t v6 = 0;
  unint64_t result = (float *)GEOMultiSectionFeatureElevations(self->_feature, a3, &v6);
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOMapFeatureRoad;
  uint64_t v4 = [(GEOMapFeatureLine *)&v10 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 6, self->_feature);
  objc_storeStrong((id *)v4 + 12, self->_tile);
  *($6366EE65C6D470F280F0091217CA7A4B *)(v4 + 56) = self->_roadKey;
  uint64_t v5 = [(GEOMapFeatureJunction *)self->_junctionA copy];
  unint64_t v6 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v5;

  uint64_t v7 = [(GEOMapFeatureJunction *)self->_junctionB copy];
  unint64_t v8 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v7;

  v4[88] = self->_checkedJunctionA;
  v4[89] = self->_checkedJunctionB;
  return v4;
}

- (GEOMapFeatureRoad)initWithFeature:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 feature];
  uint64_t v7 = [v6 containingTile];

  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOMapFeatureRoad;
    unint64_t v8 = [(GEOMapFeatureLine *)&v16 init];
    uint64_t v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_feature, a3);
      objc_super v10 = [v5 feature];
      uint64_t v11 = [v10 containingTile];
      tile = v9->_tile;
      v9->_tile = (GEOVectorTile *)v11;

      v9->super._isFlipped = [v5 isRoadSegmentReversed];
    }
    self = v9;
    unint64_t v13 = self;
  }
  else
  {
    char v14 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Cannot create GEOMapFeatureRoad because incoming feature has no backing vector tile", buf, 2u);
    }

    unint64_t v13 = 0;
  }

  return v13;
}

- (uint64_t)tileKey
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v1 = [a1 _containingTile];
  v2 = (uint64_t *)[v1 tileKey];

  if (v2)
  {
    uint64_t v3 = *v2;
    *(void *)((char *)v6 + 1) = (*v2 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*v2 >> 8) & 0x3F) << 40);
    LOBYTE(v6[0]) = v3;
    return v6[0];
  }
  else
  {
    id v5 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Error getting tile key from backing vector tile", (uint8_t *)v6, 2u);
    }

    return 1;
  }
}

- (GEOMultiSectionFeature)feature
{
  return self->_feature;
}

- (unint64_t)featureIndex
{
  feature = self->_feature;
  uint64_t v3 = [(GEOMapFeatureRoad *)self _containingTile];
  uint64_t v4 = [v3 lines];
  id v5 = [v4 objectAtIndex:0];
  unint64_t IndexforMultiSectionFeature = getIndexforMultiSectionFeature(feature, v5);

  return IndexforMultiSectionFeature;
}

- (BOOL)isFlipped
{
  return self->super._isFlipped;
}

- (GEOMultiSectionFeature)startFeature
{
  return self->_feature;
}

- (GEOMultiSectionFeature)endFeature
{
  return self->_feature;
}

- (unint64_t)_diagnosticsOnly_forwardSpeedLimit
{
  return [(GEOMultiSectionFeature *)self->_feature displaySpeedLimit];
}

- (unint64_t)_diagnosticsOnly_reverseSpeedLimit
{
  return [(GEOMultiSectionFeature *)self->_feature reverseDirectionDisplaySpeedLimit];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(GEOMapFeatureRoad *)self internalRoadName];
  id v5 = (void *)v4;
  unint64_t v6 = @"No name";
  if (v4) {
    unint64_t v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;

  unint64_t v8 = [NSString stringWithFormat:@"%@ (%d)", v7, -[GEOMapFeatureRoad featureIndex](self, "featureIndex")];

  [v3 addObject:v8];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad muid](self, "muid"));
  [v3 addObject:v9];

  objc_super v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad roadID](self, "roadID"));
  [v3 addObject:v10];

  if ([(GEOMapFeatureLine *)self coordinateCount] >= 2)
  {
    uint64_t v11 = [(GEOMapFeatureLine *)self coordinates];
    double var0 = v11->var0;
    double var1 = v11->var1;
    char v14 = [(GEOMapFeatureLine *)self coordinates];
    long long v15 = &v14[[(GEOMapFeatureLine *)self coordinateCount]];
    objc_super v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d coordinates (%0.6f,%0.6f) to (%0.6f,%0.6f)", -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"), *(void *)&var0, *(void *)&var1, *(void *)&v15[-1].var0, *(void *)&v15[-1].var1);
    [v3 addObject:v16];
  }
  uint64_t v17 = [(GEOMapFeatureRoad *)self travelDirection];
  long long v18 = @"VALID_IN_BOTH_DIRECTIONS";
  switch((int)v17)
  {
    case 0:
      break;
    case 1:
      long long v18 = @"VALID_IN_POSITIVE_LINE_DIRECTION";
      break;
    case 2:
      long long v18 = @"VALID_IN_NEGATIVE_LINE_DIRECTION";
      break;
    case 3:
    case 4:
    case 5:
      goto LABEL_9;
    case 6:
      long long v18 = @"INVALID_IN_BOTH_DIRECTIONS";
      break;
    default:
      if (v17 == 255)
      {
        long long v18 = @"UNKNOWN";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  id v19 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v18];
  [v3 addObject:v19];

  uint64_t v20 = [v3 componentsJoinedByString:@" | "];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tile, 0);
  objc_storeStrong((id *)&self->_junctionB, 0);
  objc_storeStrong((id *)&self->_junctionA, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate
{
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    uint64_t v3 = [(GEOMapFeatureLine *)self coordinates3d];
    double var0 = v3->var0;
    double var1 = v3->var1;
  }
  else
  {
    double var0 = -180.0;
    double var1 = -180.0;
  }
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- (void)updateForDesiredRoadDirectionality:(unint64_t)a3 isOutboundRoad:(BOOL)a4
{
  if (a3 - 2 >= 2)
  {
    if (a3 != 1 || [(GEOMapFeatureRoad *)self travelDirection] != 2) {
      return;
    }
  }
  else if (((a3 != 2) ^ a4))
  {
    return;
  }

  [(GEOMapFeatureRoad *)self flip];
}

@end