@interface GEOComposedGuidanceEvent
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)coordinateForDistanceStrings;
- ($212C09783140BCCD23384160D545CE0D)endValidRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)startValidRouteCoordinate;
- (BOOL)hasArGuidance;
- (BOOL)hasHaptics;
- (BOOL)hasJunctionView;
- (BOOL)hasSignGuidance;
- (BOOL)hasSpokenGuidance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImportant;
- (BOOL)isLaneGuidanceForManeuver;
- (BOOL)isSpecial;
- (BOOL)isSticky;
- (BOOL)isValidForSpeed:(double)a3;
- (GEOComposedGuidanceEvent)initWithCoder:(id)a3;
- (GEOComposedGuidanceEvent)initWithGeoGuidanceEvent:(id)a3 step:(id)a4 legIndex:(unint64_t)a5 coordinates:(id)a6;
- (GEOComposedString)arInstructionString;
- (GEOComposedString)navTrayDetailString;
- (GEOComposedString)navTrayTitleString;
- (GEOJunction)maneuverJunction;
- (GEOJunctionView)junctionView;
- (GEONameInfo)shieldInfo;
- (GEOServerFormattedString)arInstruction;
- (GEOTransitArtworkDataSource)artworkOverride;
- (NSArray)announcements;
- (NSArray)gapRanges;
- (NSArray)laneInstructions;
- (NSArray)laneTitles;
- (NSArray)lanes;
- (NSArray)primaryLaneStrings;
- (NSArray)primarySignStrings;
- (NSArray)secondaryLaneStrings;
- (NSArray)secondarySignStrings;
- (NSArray)signDetails;
- (NSArray)signTitles;
- (NSArray)spokenStrings;
- (NSData)serverRouteID;
- (NSString)arArrowLabel;
- (NSString)exclusiveSetIdentifier;
- (NSString)roadName;
- (NSUUID)uniqueID;
- (double)desiredTimeGapToEvent:(id)a3 chained:(BOOL)a4;
- (double)distance;
- (double)distanceForStrings;
- (double)endDistanceForSpeed:(double)a3;
- (double)endValidDistance;
- (double)repetitionInterval;
- (double)startDistanceForSpeed:(double)a3;
- (double)startValidDistance;
- (double)triggerDistanceForSpeed:(double)a3 andDuration:(id)a4;
- (id)description;
- (int)arType;
- (int)composedGuidanceEventType;
- (int)drivingSide;
- (int)maneuverType;
- (int)transportType;
- (int64_t)compare:(id)a3;
- (int64_t)compareFactoringInSpeed:(id)a3 speed:(double)a4;
- (int64_t)comparePriority:(id)a3;
- (unint64_t)_junctionViewIDForData:(id)a3;
- (unint64_t)enrouteNoticeIndex;
- (unint64_t)hash;
- (unint64_t)legIndex;
- (unint64_t)numChainedAnnouncements;
- (unint64_t)source;
- (unint64_t)sourceIndex;
- (unint64_t)stackRanking;
- (unint64_t)stepIndex;
- (unsigned)stepID;
- (void)encodeWithCoder:(id)a3;
- (void)setEnrouteNoticeIndex:(unint64_t)a3;
- (void)setSource:(unint64_t)a3;
- (void)setSourceIndex:(unint64_t)a3;
@end

@implementation GEOComposedGuidanceEvent

- (GEOComposedGuidanceEvent)initWithGeoGuidanceEvent:(id)a3 step:(id)a4 legIndex:(unint64_t)a5 coordinates:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v100.receiver = self;
  v100.super_class = (Class)GEOComposedGuidanceEvent;
  v14 = [(GEOComposedGuidanceEvent *)&v100 init];
  if (!v14) {
    goto LABEL_58;
  }
  v15 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  uniqueID = v14->_uniqueID;
  v14->_uniqueID = v15;

  v14->_creationOrder = ++initWithGeoGuidanceEvent_step_legIndex_coordinates__count;
  p_guidanceEvent = (id *)&v14->_guidanceEvent;
  objc_storeStrong((id *)&v14->_guidanceEvent, a3);
  if (v12) {
    uint64_t v18 = [v12 stepIndex];
  }
  else {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14->_stepIndex = v18;
  v14->_legIndex = a5;
  v19 = [v12 composedRoute];
  v20 = [v19 serverRouteID];
  uint64_t v21 = [v20 copy];
  serverRouteID = v14->_serverRouteID;
  v14->_serverRouteID = (NSData *)v21;

  v14->_stepID = [v12 stepID];
  v14->_transportType = [v12 transportType];
  v23 = [v12 maneuverRoadName];
  uint64_t v24 = [v23 copy];
  roadName = v14->_roadName;
  v14->_roadName = (NSString *)v24;

  [v12 distance];
  v14->_distance = v26;
  *(int64x2_t *)&v14->_sourceIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if ([(GEOGuidanceEvent *)v14->_guidanceEvent hasStartValidDistanceOffsetCm])
  {
    uint64_t v27 = [v13 routeIndexForLocalIndex:0 onPath:v14->_legIndex];
    v14->_$604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent startValidDistanceOffsetCm](v14->_guidanceEvent, "startValidDistanceOffsetCm")* 0.01);
    v14->_$604ECB7A8067A7300F159AE8ED6889F8 endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent endValidDistanceOffsetCm](v14->_guidanceEvent, "endValidDistanceOffsetCm")* 0.01);
    if ([(GEOGuidanceEvent *)v14->_guidanceEvent distanceReferenceEndpointOffsetCm]) {
      uint64_t v28 = objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", v27, (float)-[GEOGuidanceEvent distanceReferenceEndpointOffsetCm](v14->_guidanceEvent, "distanceReferenceEndpointOffsetCm")* 0.01);
    }
    else {
      uint64_t v28 = [v12 endRouteCoordinate];
    }
    v14->_coordinateForDistanceStrings = ($604ECB7A8067A7300F159AE8ED6889F8)v28;
    if (!v12) {
      goto LABEL_30;
    }
LABEL_18:
    if (([*p_guidanceEvent hasJunctionView] & 1) != 0
      || [(GEOComposedGuidanceEvent *)v14 isSpecial])
    {
      goto LABEL_30;
    }
    uint64_t v30 = [v12 startRouteCoordinate];
    $604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate = v14->_startValidRouteCoordinate;
    if (startValidRouteCoordinate.index == v30)
    {
      LODWORD(v31) = HIDWORD(v30);
      LODWORD(v32) = HIDWORD(*(void *)&v14->_startValidRouteCoordinate);
      if (startValidRouteCoordinate.offset >= *((float *)&v30 + 1))
      {
LABEL_25:
        uint64_t v34 = objc_msgSend(v12, "endRouteCoordinate", v31, v32);
        $604ECB7A8067A7300F159AE8ED6889F8 endValidRouteCoordinate = v14->_endValidRouteCoordinate;
        if (v34 == endValidRouteCoordinate.index)
        {
          if (*((float *)&v34 + 1) >= endValidRouteCoordinate.offset) {
            goto LABEL_30;
          }
        }
        else if (v34 >= endValidRouteCoordinate.index)
        {
          goto LABEL_30;
        }
        v14->_$604ECB7A8067A7300F159AE8ED6889F8 endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)[v12 endRouteCoordinate];
        goto LABEL_30;
      }
    }
    else if (startValidRouteCoordinate.index >= v30)
    {
      goto LABEL_25;
    }
    v14->_$604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v12, "startRouteCoordinate", v31, v32);
    goto LABEL_25;
  }
  if ([*p_guidanceEvent hasDistanceZilchIndex] && v14->_legIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v29 = objc_msgSend(v13, "routeIndexForLocalIndex:onPath:", -[GEOGuidanceEvent distanceZilchIndex](v14->_guidanceEvent, "distanceZilchIndex"), v14->_legIndex);
  }
  else if (v12)
  {
    unsigned int v29 = [v12 maneuverStartPointIndex];
  }
  else
  {
    unsigned int v29 = 0;
  }
  v14->_coordinateForDistanceStrings = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent offsetForDistanceString](v14->_guidanceEvent, "offsetForDistanceString"));
  v14->_$604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent startValidDistance](v14->_guidanceEvent, "startValidDistance"));
  v14->_$604ECB7A8067A7300F159AE8ED6889F8 endValidRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v13, "routeCoordinateForDistance:beforeRouteCoordinate:", v29, (double)-[GEOGuidanceEvent endValidDistance](v14->_guidanceEvent, "endValidDistance"));
  if (v12) {
    goto LABEL_18;
  }
LABEL_30:
  $604ECB7A8067A7300F159AE8ED6889F8 v37 = v14->_startValidRouteCoordinate;
  $604ECB7A8067A7300F159AE8ED6889F8 v36 = v14->_endValidRouteCoordinate;
  if (v36.index != v37.index)
  {
    if (v36.index >= v37.index) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (v36.offset < v37.offset) {
LABEL_34:
  }
    v14->_$604ECB7A8067A7300F159AE8ED6889F8 startValidRouteCoordinate = v36;
LABEL_35:
  [v13 distanceToEndFromRouteCoordinate:*(void *)&v14->_coordinateForDistanceStrings];
  v14->_distanceForStrings = v38;
  [v13 distanceToEndFromRouteCoordinate:*(void *)&v14->_startValidRouteCoordinate];
  v14->_startValidDistance = v39;
  [v13 distanceToEndFromRouteCoordinate:*(void *)&v14->_endValidRouteCoordinate];
  v14->_endValidDistance = v40;
  v41 = [(GEOGuidanceEvent *)v14->_guidanceEvent signGuidance];
  if ([v41 secondarySignsCount])
  {
    id v42 = [v12 getNextStep];
  }
  else
  {
    id v42 = v12;
  }
  v43 = v42;

  v44 = [*p_guidanceEvent signGuidance];
  if ([v44 hasManeuverArrowOverride])
  {
    v45 = -[GEOJunction initWithManeuverType:drivingSide:]([GEOJunction alloc], "initWithManeuverType:drivingSide:", [v44 maneuverArrowOverride], objc_msgSend(v43, "drivingSide"));
LABEL_43:
    maneuverJunction = v14->_maneuverJunction;
    v14->_maneuverJunction = v45;
    goto LABEL_44;
  }
  int v46 = [v44 hasJunctionInfo];
  v47 = [GEOJunction alloc];
  v48 = v47;
  if (!v46)
  {
    v45 = [(GEOJunction *)v47 initWithStep:v43];
    goto LABEL_43;
  }
  maneuverJunction = [v44 junctionInfo];
  uint64_t v50 = [(GEOJunction *)v48 initWithJunctionInfo:maneuverJunction];
  v51 = v14->_maneuverJunction;
  v14->_maneuverJunction = (GEOJunction *)v50;

LABEL_44:
  v52 = [*p_guidanceEvent signGuidance];
  int v53 = [v52 hasManeuverArrowOverride];

  if (v53)
  {
    v54 = [(GEOGuidanceEvent *)v14->_guidanceEvent signGuidance];
    v14->_maneuverType = [v54 maneuverArrowOverride];
  }
  else
  {
    v14->_maneuverType = [v43 maneuverType];
  }
  v55 = [v11 signGuidance];
  uint64_t v56 = [v55 artworkOverride];
  artworkOverride = v14->_artworkOverride;
  v14->_artworkOverride = (GEOTransitArtworkDataSource *)v56;

  v58 = [v11 signGuidance];

  if (v58)
  {
    v59 = [v11 signGuidance];
    v60 = [v59 signTitles];
    uint64_t v61 = objc_msgSend(v60, "_geo_map:", &__block_literal_global_74);
    primarySignStrings = v14->_primarySignStrings;
    v14->_primarySignStrings = (NSArray *)v61;

    v63 = [v11 signGuidance];
    v64 = [v63 signDetails];
    uint64_t v65 = objc_msgSend(v64, "_geo_map:", &__block_literal_global_4_0);
    secondarySignStrings = v14->_secondarySignStrings;
    v14->_secondarySignStrings = (NSArray *)v65;
  }
  v67 = [v11 spokenGuidance];

  if (v67)
  {
    v68 = [v11 spokenGuidance];
    v69 = [v68 announcements];
    uint64_t v70 = objc_msgSend(v69, "_geo_map:", &__block_literal_global_6);
    spokenStrings = v14->_spokenStrings;
    v14->_spokenStrings = (NSArray *)v70;
  }
  v72 = [v11 laneGuidance];

  if (v72)
  {
    v73 = [v11 laneGuidance];
    v74 = [v73 titles];
    uint64_t v75 = objc_msgSend(v74, "_geo_map:", &__block_literal_global_8_1);
    primaryLaneStrings = v14->_primaryLaneStrings;
    v14->_primaryLaneStrings = (NSArray *)v75;

    v77 = [v11 laneGuidance];
    v78 = [v77 instructions];
    uint64_t v79 = objc_msgSend(v78, "_geo_map:", &__block_literal_global_10);
    secondaryLaneStrings = v14->_secondaryLaneStrings;
    v14->_secondaryLaneStrings = (NSArray *)v79;
  }
  v81 = [v11 navTrayGuidance];

  if (v81)
  {
    v82 = [GEOComposedString alloc];
    v83 = [v11 navTrayGuidance];
    v84 = [v83 title];
    uint64_t v85 = [(GEOComposedString *)v82 initWithGeoFormattedString:v84];
    navTrayTitleString = v14->_navTrayTitleString;
    v14->_navTrayTitleString = (GEOComposedString *)v85;

    v87 = [GEOComposedString alloc];
    v88 = [v11 navTrayGuidance];
    v89 = [v88 detail];
    uint64_t v90 = [(GEOComposedString *)v87 initWithGeoFormattedString:v89];
    navTrayDetailString = v14->_navTrayDetailString;
    v14->_navTrayDetailString = (GEOComposedString *)v90;
  }
  v92 = [v11 arGuidance];

  if (v92)
  {
    v93 = [GEOComposedString alloc];
    v94 = [v11 arGuidance];
    v95 = [v94 instruction];
    uint64_t v96 = [(GEOComposedString *)v93 initWithGeoFormattedString:v95];
    arInstructionString = v14->_arInstructionString;
    v14->_arInstructionString = (GEOComposedString *)v96;
  }
  v14->_drivingSide = [v43 drivingSide];
  v98 = v14;

LABEL_58:
  return v14;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

GEOComposedString *__79__GEOComposedGuidanceEvent_initWithGeoGuidanceEvent_step_legIndex_coordinates___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedString alloc] initWithGeoFormattedString:v2];

  return v3;
}

- (unint64_t)_junctionViewIDForData:(id)a3
{
  id v3 = a3;
  unint64_t v7 = 0;
  if ((unint64_t)[v3 length] <= 8) {
    uint64_t v4 = [v3 length];
  }
  else {
    uint64_t v4 = 8;
  }
  [v3 getBytes:&v7 length:v4];
  unint64_t v5 = v7;

  return v5;
}

- (BOOL)hasSignGuidance
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent hasSignGuidance];
}

- (BOOL)hasSpokenGuidance
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent hasSpokenGuidance];
}

- (BOOL)hasJunctionView
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent hasJunctionView];
}

- (BOOL)hasArGuidance
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent hasArGuidance];
}

- (unint64_t)stackRanking
{
  id v3 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  int v4 = [v3 hasStackRanking];

  unint64_t v5 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  v6 = v5;
  if (v4)
  {
    unint64_t v7 = [v5 stackRanking];
  }
  else
  {
    uint64_t v8 = [v5 secondarySignsCount];

    if (v8) {
      return 3;
    }
    else {
      return 2;
    }
  }
  return v7;
}

- (NSArray)signTitles
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  id v3 = [v2 signTitles];

  return (NSArray *)v3;
}

- (NSArray)signDetails
{
  id v3 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  int v4 = [v3 signDetails];

  unint64_t v5 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 signDetails];
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_6;
  }
  uint64_t v8 = [v5 secondarySignsCount];

  if (v8)
  {
    v6 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
    uint64_t v7 = [v6 secondarySigns];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:

  return (NSArray *)v9;
}

- (GEONameInfo)shieldInfo
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent signGuidance];
  id v3 = [v2 shieldName];

  return (GEONameInfo *)v3;
}

- (GEOJunctionView)junctionView
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent junctionView];
}

- (NSString)exclusiveSetIdentifier
{
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasSpokenGuidance]
    && ([(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 hasExclusiveSetIdentifier],
        v3,
        v4))
  {
    unint64_t v5 = NSString;
    v6 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"%lu", objc_msgSend(v6, "exclusiveSetIdentifier"));
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSString *)v7;
}

- (NSArray)announcements
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  id v3 = [v2 announcements];

  return (NSArray *)v3;
}

- (double)repetitionInterval
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  double v3 = (double)[v2 repetitionInterval];

  return v3;
}

- (BOOL)hasHaptics
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  char v3 = [v2 tapBeforeAnnouncement];

  return v3;
}

- (BOOL)isSticky
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent sticky];
}

- (BOOL)isImportant
{
  if (![(GEOGuidanceEvent *)self->_guidanceEvent hasImportanceInfo]) {
    return 0;
  }
  char v3 = [(GEOGuidanceEvent *)self->_guidanceEvent importanceInfo];
  if ([v3 guidancePreferenceTypesCount])
  {
    unint64_t v4 = 0;
    do
    {
      int v5 = [v3 guidancePreferenceTypeAtIndex:v4];
      BOOL v6 = v5 == 1;
      if (v5 == 1) {
        break;
      }
      ++v4;
    }
    while (v4 < [v3 guidancePreferenceTypesCount]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isSpecial
{
  unsigned int v2 = [(GEOGuidanceEvent *)self->_guidanceEvent eventType];
  return (v2 < 0xF) & (0x780Eu >> v2);
}

- (NSArray)lanes
{
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasLaneGuidance] && !self->_lanes)
  {
    char v3 = [(GEOGuidanceEvent *)self->_guidanceEvent laneGuidance];
    unint64_t v4 = [v3 laneInfos];
    int v5 = objc_msgSend(v4, "_geo_map:", &__block_literal_global_15);
    BOOL v6 = (NSArray *)[v5 copy];
    lanes = self->_lanes;
    self->_lanes = v6;
  }
  uint64_t v8 = self->_lanes;

  return v8;
}

GEOComposedRouteLaneInfo *__33__GEOComposedGuidanceEvent_lanes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [[GEOComposedRouteLaneInfo alloc] initWithLaneInfo:v2];

  return v3;
}

- (NSArray)laneTitles
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent laneGuidance];
  char v3 = [v2 titles];

  return (NSArray *)v3;
}

- (NSArray)laneInstructions
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent laneGuidance];
  char v3 = [v2 instructions];

  return (NSArray *)v3;
}

- (int)composedGuidanceEventType
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent eventType];
}

- (BOOL)isLaneGuidanceForManeuver
{
  return [(GEOGuidanceEvent *)self->_guidanceEvent eventType] == 10;
}

- (unint64_t)numChainedAnnouncements
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  unint64_t v3 = [v2 numChainedVariants];

  return v3;
}

- (GEOServerFormattedString)arInstruction
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent arGuidance];
  unint64_t v3 = [v2 instruction];

  return (GEOServerFormattedString *)v3;
}

- (NSString)arArrowLabel
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent arGuidance];
  unint64_t v3 = [v2 arrowLabel];

  return (NSString *)v3;
}

- (int)arType
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent arGuidance];
  int v3 = [v2 type];

  return v3;
}

- (NSArray)gapRanges
{
  id v2 = [(GEOGuidanceEvent *)self->_guidanceEvent arGuidance];
  int v3 = [v2 gapRanges];

  return (NSArray *)v3;
}

- (BOOL)isValidForSpeed:(double)a3
{
  BOOL result = 0;
  if (![(GEOGuidanceEvent *)self->_guidanceEvent hasMinSpeed]
    || ([(GEOGuidanceEvent *)self->_guidanceEvent minSpeed], v5 < a3))
  {
    if (![(GEOGuidanceEvent *)self->_guidanceEvent hasMaxSpeed]) {
      return 1;
    }
    [(GEOGuidanceEvent *)self->_guidanceEvent maxSpeed];
    if (v6 >= a3) {
      return 1;
    }
  }
  return result;
}

- (double)startDistanceForSpeed:(double)a3
{
  double startValidDistance = self->_startValidDistance;
  double v6 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  int v7 = [v6 hasStartDesiredTime];

  if (v7)
  {
    uint64_t v8 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    double v9 = self->_endValidDistance + a3 * (double)[v8 startDesiredTime];

    if (startValidDistance >= v9) {
      return v9;
    }
  }
  return startValidDistance;
}

- (double)endDistanceForSpeed:(double)a3
{
  double endValidDistance = self->_endValidDistance;
  double v6 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  int v7 = [v6 hasEndDesiredTime];

  if (v7)
  {
    uint64_t v8 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    double v9 = self->_endValidDistance + a3 * (double)[v8 endDesiredTime];

    if (self->_startValidDistance >= v9) {
      return v9;
    }
    else {
      return self->_startValidDistance;
    }
  }
  return endValidDistance;
}

- (double)triggerDistanceForSpeed:(double)a3 andDuration:(id)a4
{
  double v6 = (double (**)(void))a4;
  if (![(GEOComposedGuidanceEvent *)self hasSpokenGuidance]) {
    goto LABEL_7;
  }
  int v7 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  int v8 = [v7 alignment];

  if (v8 != 3)
  {
    v10 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    int v11 = [v10 alignment];

    if (v11 == 4)
    {
      double startValidDistance = -1.79769313e308;
      goto LABEL_12;
    }
LABEL_7:
    [(GEOComposedGuidanceEvent *)self startDistanceForSpeed:a3];
    double startValidDistance = v13;
    goto LABEL_12;
  }
  if (v6) {
    double v9 = v6[2](v6) + 1.0;
  }
  else {
    double v9 = 1.0;
  }
  [(GEOComposedGuidanceEvent *)self endDistanceForSpeed:a3];
  double v15 = v14 + a3 * v9;
  if (self->_startValidDistance >= v15) {
    double startValidDistance = v15;
  }
  else {
    double startValidDistance = self->_startValidDistance;
  }
LABEL_12:

  return startValidDistance;
}

- (double)desiredTimeGapToEvent:(id)a3 chained:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v6 = (id *)a3;
  double v7 = 0.0;
  if ([(GEOComposedGuidanceEvent *)self hasSpokenGuidance]
    && [v6 hasSpokenGuidance])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v8 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    double v9 = [v8 timeGaps];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          int v15 = [v14 subsequentEventId];
          if (v15 == [v6[3] identifier]
            && (a4 || ![v14 ifChained]))
          {
            double v7 = (double)[v14 seconds];
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v7;
}

- (unint64_t)hash
{
  id v2 = [(GEOComposedGuidanceEvent *)self uniqueID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(GEOComposedGuidanceEvent *)self uniqueID];
    double v6 = [v4 uniqueID];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unsigned int index = self->_startValidRouteCoordinate.index;
  unsigned int v6 = *((_DWORD *)v4 + 38);
  BOOL v7 = index >= v6;
  if (index != v6) {
    goto LABEL_10;
  }
  float offset = self->_startValidRouteCoordinate.offset;
  float v9 = *((float *)v4 + 39);
  BOOL v10 = offset < v9;
  if (offset != v9) {
    goto LABEL_12;
  }
  uint64_t v11 = *((void *)v4 + 4);
  if (self->_stepIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
  }
  else if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_13;
  }
  unsigned int v12 = self->_endValidRouteCoordinate.index;
  unsigned int v13 = *((_DWORD *)v4 + 40);
  BOOL v7 = v12 >= v13;
  if (v12 != v13)
  {
LABEL_10:
    if (!v7) {
      goto LABEL_11;
    }
LABEL_13:
    int64_t v16 = 1;
    goto LABEL_14;
  }
  float v14 = self->_endValidRouteCoordinate.offset;
  float v15 = *((float *)v4 + 41);
  BOOL v10 = v14 < v15;
  if (v14 != v15)
  {
LABEL_12:
    if (!v10) {
      goto LABEL_13;
    }
LABEL_11:
    int64_t v16 = -1;
    goto LABEL_14;
  }
  int64_t v16 = 0;
LABEL_14:

  return v16;
}

- (int64_t)compareFactoringInSpeed:(id)a3 speed:(double)a4
{
  unsigned int v6 = (id *)a3;
  [(GEOComposedGuidanceEvent *)self startDistanceForSpeed:a4];
  double v8 = v7;
  [(GEOComposedGuidanceEvent *)self endDistanceForSpeed:a4];
  double v10 = v9;
  [v6 startDistanceForSpeed:a4];
  double v12 = v11;
  [v6 endDistanceForSpeed:a4];
  BOOL v14 = v8 <= v12;
  if (v8 == v12 && (BOOL v14 = v10 <= v13, v10 == v13))
  {
    float v15 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
    if ([v15 hasAlignment])
    {
      int64_t v16 = [v6[3] spokenGuidance];
      int v17 = [v16 hasAlignment];

      if (v17)
      {
        long long v18 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
        int v19 = [v18 alignment];
        long long v20 = [v6[3] spokenGuidance];
        int v21 = [v20 alignment];

        if (v19 < v21)
        {
          int64_t v22 = -1;
          goto LABEL_14;
        }
        uint64_t v24 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
        int v25 = [v24 alignment];
        double v26 = [v6[3] spokenGuidance];
        int v27 = [v26 alignment];

        if (v25 > v27)
        {
          int64_t v22 = 1;
          goto LABEL_14;
        }
      }
    }
    else
    {
    }
    if (self->_creationOrder < (unint64_t)v6[2]) {
      int64_t v22 = -1;
    }
    else {
      int64_t v22 = 1;
    }
  }
  else if (v14)
  {
    int64_t v22 = 1;
  }
  else
  {
    int64_t v22 = -1;
  }
LABEL_14:

  return v22;
}

- (int64_t)comparePriority:(id)a3
{
  id v4 = (id *)a3;
  double v5 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  if (([v5 hasPriority] & 1) == 0)
  {

LABEL_8:
    int64_t v16 = 0;
    goto LABEL_9;
  }
  unsigned int v6 = [v4[3] spokenGuidance];
  int v7 = [v6 hasPriority];

  if (!v7) {
    goto LABEL_8;
  }
  double v8 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  int v9 = [v8 priority];
  double v10 = [v4[3] spokenGuidance];
  int v11 = [v10 priority];

  if (v9 == v11) {
    goto LABEL_8;
  }
  double v12 = [(GEOGuidanceEvent *)self->_guidanceEvent spokenGuidance];
  unsigned int v13 = [v12 priority];
  BOOL v14 = [v4[3] spokenGuidance];
  unsigned int v15 = [v14 priority];

  if (v13 > v15) {
    int64_t v16 = -1;
  }
  else {
    int64_t v16 = 1;
  }
LABEL_9:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedGuidanceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)GEOComposedGuidanceEvent;
  double v5 = [(GEOComposedGuidanceEvent *)&v52 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v5->_creationOrder = [v4 decodeIntegerForKey:@"_creationOrder"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_guidanceEvent"];
    guidanceEvent = v5->_guidanceEvent;
    v5->_guidanceEvent = (GEOGuidanceEvent *)v8;

    v5->_stepIndex = [v4 decodeIntegerForKey:@"_stepIndex"];
    v5->_legIndex = [v4 decodeIntegerForKey:@"_legIndex"];
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_lanes"];
    lanes = v5->_lanes;
    v5->_lanes = (NSArray *)v10;

    [v4 decodeDoubleForKey:@"_startValidDistance"];
    v5->_double startValidDistance = v12;
    [v4 decodeDoubleForKey:@"_endValidDistance"];
    v5->_double endValidDistance = v13;
    [v4 decodeDoubleForKey:@"_distanceForStrings"];
    v5->_distanceForStrings = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maneuverJunction"];
    maneuverJunction = v5->_maneuverJunction;
    v5->_maneuverJunction = (GEOJunction *)v15;

    v5->_maneuverType = [v4 decodeIntegerForKey:@"_maneuverType"];
    v5->_drivingSide = [v4 decodeIntegerForKey:@"_drivingSide"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverRouteID"];
    serverRouteID = v5->_serverRouteID;
    v5->_serverRouteID = (NSData *)v17;

    v5->_stepID = [v4 decodeIntegerForKey:@"_stepID"];
    v5->_transportType = [v4 decodeIntegerForKey:@"_transportType"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_roadName"];
    roadName = v5->_roadName;
    v5->_roadName = (NSString *)v19;

    [v4 decodeDoubleForKey:@"_distance"];
    v5->_distance = v21;
    uint64_t v22 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_primarySignStrings"];
    primarySignStrings = v5->_primarySignStrings;
    v5->_primarySignStrings = (NSArray *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_secondarySignStrings"];
    secondarySignStrings = v5->_secondarySignStrings;
    v5->_secondarySignStrings = (NSArray *)v24;

    uint64_t v26 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_spokenStrings"];
    spokenStrings = v5->_spokenStrings;
    v5->_spokenStrings = (NSArray *)v26;

    uint64_t v28 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_primaryLaneStrings"];
    primaryLaneStrings = v5->_primaryLaneStrings;
    v5->_primaryLaneStrings = (NSArray *)v28;

    uint64_t v30 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_secondaryLaneStrings"];
    secondaryLaneStrings = v5->_secondaryLaneStrings;
    v5->_secondaryLaneStrings = (NSArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_navTrayTitleString"];
    navTrayTitleString = v5->_navTrayTitleString;
    v5->_navTrayTitleString = (GEOComposedString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_navTrayDetailString"];
    navTrayDetailString = v5->_navTrayDetailString;
    v5->_navTrayDetailString = (GEOComposedString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arInstructionString"];
    arInstructionString = v5->_arInstructionString;
    v5->_arInstructionString = (GEOComposedString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_artworkOverride"];
    artworkOverride = v5->_artworkOverride;
    v5->_artworkOverride = (GEOTransitArtworkDataSource *)v38;

    unint64_t v51 = 0;
    id v40 = v4;
    v41 = (const void *)[v40 decodeBytesForKey:@"_startValidRouteCoordinate" returnedLength:&v51];
    if (v51 && v41)
    {
      if (v51 >= 8) {
        size_t v42 = 8;
      }
      else {
        size_t v42 = v51;
      }
      memcpy(&v5->_startValidRouteCoordinate, v41, v42);
    }
    unint64_t v51 = 0;
    id v43 = v40;
    v44 = (const void *)[v43 decodeBytesForKey:@"_endValidRouteCoordinate" returnedLength:&v51];
    if (v51 && v44)
    {
      if (v51 >= 8) {
        size_t v45 = 8;
      }
      else {
        size_t v45 = v51;
      }
      memcpy(&v5->_endValidRouteCoordinate, v44, v45);
    }
    unint64_t v51 = 0;
    id v46 = v43;
    v47 = (const void *)[v46 decodeBytesForKey:@"_coordinateForDistanceStrings" returnedLength:&v51];
    if (v51 && v47)
    {
      if (v51 >= 8) {
        size_t v48 = 8;
      }
      else {
        size_t v48 = v51;
      }
      memcpy(&v5->_coordinateForDistanceStrings, v47, v48);
    }
    v5->_source = [v46 decodeIntegerForKey:@"_source"];
    v5->_sourceIndex = [v46 decodeIntegerForKey:@"_sourceIndex"];
    v5->_enrouteNoticeIndex = [v46 decodeIntegerForKey:@"_enrouteNoticeIndex"];
    v49 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"_uniqueID"];
  [v5 encodeInteger:self->_creationOrder forKey:@"_creationOrder"];
  [v5 encodeObject:self->_guidanceEvent forKey:@"_guidanceEvent"];
  [v5 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeObject:self->_lanes forKey:@"_lanes"];
  [v5 encodeDouble:@"_startValidDistance" forKey:self->_startValidDistance];
  [v5 encodeDouble:@"_endValidDistance" forKey:self->_endValidDistance];
  [v5 encodeDouble:@"_distanceForStrings" forKey:self->_distanceForStrings];
  [v5 encodeObject:self->_maneuverJunction forKey:@"_maneuverJunction"];
  [v5 encodeInteger:self->_maneuverType forKey:@"_maneuverType"];
  [v5 encodeInteger:self->_drivingSide forKey:@"_drivingSide"];
  [v5 encodeObject:self->_serverRouteID forKey:@"_serverRouteID"];
  [v5 encodeInteger:self->_stepID forKey:@"_stepID"];
  [v5 encodeInteger:self->_transportType forKey:@"_transportType"];
  [v5 encodeObject:self->_roadName forKey:@"_roadName"];
  [v5 encodeDouble:@"_distance" forKey:self->_distance];
  [v5 encodeObject:self->_primarySignStrings forKey:@"_primarySignStrings"];
  [v5 encodeObject:self->_secondarySignStrings forKey:@"_secondarySignStrings"];
  [v5 encodeObject:self->_spokenStrings forKey:@"_spokenStrings"];
  [v5 encodeObject:self->_primaryLaneStrings forKey:@"_primaryLaneStrings"];
  [v5 encodeObject:self->_secondaryLaneStrings forKey:@"_secondaryLaneStrings"];
  [v5 encodeObject:self->_navTrayTitleString forKey:@"_navTrayTitleString"];
  [v5 encodeObject:self->_navTrayDetailString forKey:@"_navTrayDetailString"];
  [v5 encodeObject:self->_arInstructionString forKey:@"_arInstructionString"];
  [v5 encodeObject:self->_artworkOverride forKey:@"_artworkOverride"];
  [v5 encodeBytes:&self->_startValidRouteCoordinate length:8 forKey:@"_startValidRouteCoordinate"];
  [v5 encodeBytes:&self->_endValidRouteCoordinate length:8 forKey:@"_endValidRouteCoordinate"];
  [v5 encodeBytes:&self->_coordinateForDistanceStrings length:8 forKey:@"_coordinateForDistanceStrings"];
  [v5 encodeInteger:self->_source forKey:@"_source"];
  [v5 encodeInteger:self->_sourceIndex forKey:@"_sourceIndex"];
  [v5 encodeInteger:self->_enrouteNoticeIndex forKey:@"_enrouteNoticeIndex"];
}

- (id)description
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(GEOGuidanceEvent *)self->_guidanceEvent eventType])
  {
    id v5 = NSString;
    uint64_t v6 = [(GEOGuidanceEvent *)self->_guidanceEvent eventType];
    if (v6 >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v7 = off_1E53E14A8[(int)v6];
    }
    uint64_t v8 = [v5 stringWithFormat:@"[%@]", v7];
    [v4 addObject:v8];
  }
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasSpokenGuidance])
  {
    [v3 addObject:@"Spoken"];
    int v9 = [(NSArray *)self->_spokenStrings firstObject];
    uint64_t v10 = [v9 stringWithOptions:0];

    if ([(GEOComposedGuidanceEvent *)self hasHaptics]) {
      [v4 addObject:@"[TAP]"];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasSignGuidance])
  {
    [v3 addObject:@"Sign"];
    int v11 = [(NSArray *)self->_secondarySignStrings firstObject];
    uint64_t v12 = [v11 stringWithOptions:0];

    uint64_t v10 = (void *)v12;
  }
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasLaneGuidance])
  {
    [v3 addObject:@"Lane"];
    double v13 = [(GEOComposedGuidanceEvent *)self lanes];
    uint64_t v14 = descriptionForLaneInfos(v13);

    uint64_t v10 = (void *)v14;
  }
  uint64_t v15 = [(GEOGuidanceEvent *)self->_guidanceEvent navTrayGuidance];

  if (v15)
  {
    [v3 addObject:@"NavTray"];
    int64_t v16 = NSString;
    uint64_t v17 = [(GEOComposedString *)self->_navTrayTitleString stringWithDefaultOptions];
    long long v18 = [(GEOComposedString *)self->_navTrayDetailString stringWithDefaultOptions];
    uint64_t v19 = [v16 stringWithFormat:@"%@ | %@", v17, v18];

    uint64_t v10 = (void *)v19;
  }
  size_t v48 = v4;
  v49 = v3;
  if ([(GEOGuidanceEvent *)self->_guidanceEvent hasJunctionView])
  {
    [v3 addObject:@"Junction view"];
    long long v20 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v21 = [(GEOGuidanceEvent *)self->_guidanceEvent junctionView];
    uint64_t v22 = [v21 imageIds];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v22);
          }
          unint64_t v27 = [(GEOComposedGuidanceEvent *)self _junctionViewIDForData:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          uint64_t v28 = [NSNumber numberWithUnsignedInteger:v27];
          unsigned int v29 = [v28 description];
          [v20 addObject:v29];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v24);
    }

    uint64_t v30 = NSString;
    double v31 = [v20 componentsJoinedByString:@", "];
    uint64_t v32 = [v30 stringWithFormat:@"IDs: %@", v31];

    uint64_t v10 = (void *)v32;
    id v3 = v49;
  }
  if (![(GEOGuidanceEvent *)self->_guidanceEvent hasArGuidance])
  {
    uint64_t v50 = v10;
    goto LABEL_32;
  }
  [v3 addObject:@"AR guidance"];
  uint64_t v50 = [(GEOComposedString *)self->_arInstructionString stringWithOptions:0];

  if ([(GEOComposedGuidanceEvent *)self arType] == 1)
  {
    v33 = @"[CONTINUE]";
  }
  else
  {
    if ([(GEOComposedGuidanceEvent *)self arType] != 2) {
      goto LABEL_32;
    }
    v33 = @"[MANEUVER]";
  }
  [v4 addObject:v33];
LABEL_32:
  uint64_t v34 = [(GEOComposedGuidanceEvent *)self artworkOverride];

  if (v34) {
    [v4 addObject:@"[ARTWORK]"];
  }
  if ([(GEOComposedGuidanceEvent *)self isSticky]) {
    [v4 addObject:@"[STICKY]"];
  }
  v35 = [(GEOComposedGuidanceEvent *)self exclusiveSetIdentifier];
  if (v35)
  {
    uint64_t v36 = [NSString stringWithFormat:@"[group: %@]", v35];
    [v4 addObject:v36];
  }
  $604ECB7A8067A7300F159AE8ED6889F8 v37 = [v3 componentsJoinedByString:@" & "];
  uint64_t v38 = &stru_1ED51F370;
  double v39 = [v4 componentsJoinedByString:&stru_1ED51F370];
  v41 = NSString;
  unint64_t stepIndex = self->_stepIndex;
  if (stepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%d) ", self->_stepIndex);
    uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v43 = GEOPolylineCoordinateAsString(*(void *)&self->_startValidRouteCoordinate, 1, 0, v40);
  size_t v45 = GEOPolylineCoordinateAsString(*(void *)&self->_endValidRouteCoordinate, 1, 0, v44);
  id v46 = [v41 stringWithFormat:@"%@ event %@[%@] to [%@], %@ %@", v37, v38, v43, v45, v39, v50];

  if (stepIndex != 0x7FFFFFFFFFFFFFFFLL) {

  }
  return v46;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (GEOJunction)maneuverJunction
{
  return self->_maneuverJunction;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (NSData)serverRouteID
{
  return self->_serverRouteID;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (double)distance
{
  return self->_distance;
}

- (NSArray)primarySignStrings
{
  return self->_primarySignStrings;
}

- (NSArray)secondarySignStrings
{
  return self->_secondarySignStrings;
}

- (NSArray)spokenStrings
{
  return self->_spokenStrings;
}

- (NSArray)primaryLaneStrings
{
  return self->_primaryLaneStrings;
}

- (NSArray)secondaryLaneStrings
{
  return self->_secondaryLaneStrings;
}

- (GEOComposedString)navTrayTitleString
{
  return self->_navTrayTitleString;
}

- (GEOComposedString)navTrayDetailString
{
  return self->_navTrayDetailString;
}

- (GEOComposedString)arInstructionString
{
  return self->_arInstructionString;
}

- ($212C09783140BCCD23384160D545CE0D)startValidRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startValidRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)endValidRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endValidRouteCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)coordinateForDistanceStrings
{
  return ($212C09783140BCCD23384160D545CE0D)self->_coordinateForDistanceStrings;
}

- (double)startValidDistance
{
  return self->_startValidDistance;
}

- (double)endValidDistance
{
  return self->_endValidDistance;
}

- (double)distanceForStrings
{
  return self->_distanceForStrings;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)sourceIndex
{
  return self->_sourceIndex;
}

- (void)setSourceIndex:(unint64_t)a3
{
  self->_sourceIndex = a3;
}

- (unint64_t)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unint64_t)a3
{
  self->_enrouteNoticeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navTrayDetailString, 0);
  objc_storeStrong((id *)&self->_navTrayTitleString, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_maneuverJunction, 0);
  objc_storeStrong((id *)&self->_arInstructionString, 0);
  objc_storeStrong((id *)&self->_secondaryLaneStrings, 0);
  objc_storeStrong((id *)&self->_primaryLaneStrings, 0);
  objc_storeStrong((id *)&self->_spokenStrings, 0);
  objc_storeStrong((id *)&self->_secondarySignStrings, 0);
  objc_storeStrong((id *)&self->_primarySignStrings, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_serverRouteID, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_guidanceEvent, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end