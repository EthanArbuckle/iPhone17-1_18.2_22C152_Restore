@interface NavSignLaneGuidanceInfo
+ (_NSRange)highlightedLaneRangeForLanes:(id)a3;
+ (id)_createFakeLanes;
+ (id)fakeInfoForManeuver:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForManeuver;
- (BOOL)isForMidStep;
- (NSArray)lanes;
- (NSArray)midStepTitles;
- (NSArray)textAlternatives;
- (NSUUID)laneInfoId;
- (NavSignLaneGuidanceInfo)initWithGuidanceLaneInfo:(id)a3;
- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4;
- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4 forManeuver:(BOOL)a5 midStepTitles:(id)a6 details:(id)a7;
- (_NSRange)highlightedLaneRange;
- (id)description;
- (id)highlightedLanes;
@end

@implementation NavSignLaneGuidanceInfo

+ (id)fakeInfoForManeuver:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSUUID UUID];
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    v7 = [@"Continue straight [DEBUG]" mkServerFormattedString];
    v11 = v7;
    v6 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  v8 = [a1 _createFakeLanes];
  v9 = [[NavSignLaneGuidanceInfo alloc] initWithLaneInfoId:v5 lanes:v8 forManeuver:v3 midStepTitles:0 details:v6];

  return v9;
}

+ (id)_createFakeLanes
{
  uint32_t v2 = arc4random_uniform(9u);
  uint64_t v3 = v2 + 2;
  uint32_t v4 = arc4random_uniform(v2 + 2);
  unint64_t v5 = v4;
  uint32_t v6 = arc4random_uniform(v3 - v4 + 1);
  unint64_t v7 = v6 + (unint64_t)v4;
  v8 = +[NSMutableArray arrayWithCapacity:v3];
  unint64_t v9 = 0;
  do
  {
    if (v9 < v5 || v9 > v7)
    {
      uint64_t v10 = +[GEOComposedRouteLaneInfo _debug_straightLane];
    }
    else
    {
      uint64_t v10 = +[GEOComposedRouteLaneInfo _debug_laneWithDirections:&off_4A9B0 good:1 preferred:v6 == 0];
    }
    v11 = (void *)v10;
    [v8 addObject:v10];

    ++v9;
  }
  while (v3 != v9);

  return v8;
}

- (NavSignLaneGuidanceInfo)initWithGuidanceLaneInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc((Class)MKServerFormattedStringParameters);
    id v6 = [v4 distanceDetailLevel];
    unint64_t v7 = [v4 variableOverrides];
    id v8 = [v5 initWithInstructionsDistanceDetailLevel:v6 variableOverrides:v7];

    unint64_t v9 = [v4 secondaryStrings];
    id v10 = [v9 count];

    if (v10)
    {
      v11 = [v4 secondaryStrings];
      v12 = MapsMap(v11, &stru_41680);
    }
    else
    {
      v14 = [v4 instructions];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_11BE0;
      v25[3] = &unk_416A8;
      id v26 = v8;
      v12 = MapsMap(v14, v25);
    }
    v15 = [v4 primaryStrings];
    id v16 = [v15 count];

    if (v16)
    {
      v17 = [v4 primaryStrings];
      v18 = MapsMap(v17, &stru_416C8);
    }
    else
    {
      v19 = [v4 titles];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11CA0;
      v23[3] = &unk_416A8;
      id v24 = v8;
      v18 = MapsMap(v19, v23);

      v17 = v24;
    }

    v20 = [v4 uniqueID];
    v21 = [v4 lanes];
    self = -[NavSignLaneGuidanceInfo initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:](self, "initWithLaneInfoId:lanes:forManeuver:midStepTitles:details:", v20, v21, [v4 isForManeuver], v18, v12);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4
{
  return [(NavSignLaneGuidanceInfo *)self initWithLaneInfoId:a3 lanes:a4 forManeuver:1 midStepTitles:0 details:0];
}

- (NavSignLaneGuidanceInfo)initWithLaneInfoId:(id)a3 lanes:(id)a4 forManeuver:(BOOL)a5 midStepTitles:(id)a6 details:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v21.receiver = self;
    v21.super_class = (Class)NavSignLaneGuidanceInfo;
    v17 = [(NavSignLaneGuidanceInfo *)&v21 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_laneInfoId, a3);
      objc_storeStrong((id *)&v18->_lanes, a4);
      v18->_isForManeuver = a5;
      objc_storeStrong((id *)&v18->_textAlternatives, a7);
      objc_storeStrong((id *)&v18->_midStepTitles, a6);
    }
    self = v18;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(NavSignLaneGuidanceInfo *)self laneInfoId];
    unint64_t v7 = [v5 laneInfoId];

    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = [(NavSignLaneGuidanceInfo *)self laneInfoId];
  id v4 = [(NavSignLaneGuidanceInfo *)self lanes];
  id v5 = [v4 count];
  BOOL v6 = [(NavSignLaneGuidanceInfo *)self isForManeuver];
  unint64_t v7 = [(NavSignLaneGuidanceInfo *)self textAlternatives];
  if ([v7 count])
  {
    unsigned __int8 v8 = [(NavSignLaneGuidanceInfo *)self textAlternatives];
    unint64_t v9 = +[NSString stringWithFormat:@"laneInfoID: [%@] %d lanes (forManeuver:%d) %@", v3, v5, v6, v8];
  }
  else
  {
    unint64_t v9 = +[NSString stringWithFormat:@"laneInfoID: [%@] %d lanes (forManeuver:%d) %@", v3, v5, v6, &stru_48710];
  }

  return v9;
}

- (BOOL)isForMidStep
{
  return ![(NavSignLaneGuidanceInfo *)self isForManeuver];
}

- (_NSRange)highlightedLaneRange
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(NavSignLaneGuidanceInfo *)self lanes];
  id v5 = [v3 highlightedLaneRangeForLanes:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

+ (_NSRange)highlightedLaneRangeForLanes:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSMutableArray array];
    id v5 = +[NSMutableArray array];
    if ([v3 count])
    {
      uint64_t v6 = 0;
      while (1)
      {
        NSUInteger v7 = [v3 objectAtIndexedSubscript:v6];
        if ([v7 isPreferredLaneForManeuver]) {
          break;
        }
        if ([v7 isLaneForManeuver])
        {
          NSUInteger v8 = +[NSNumber numberWithUnsignedInteger:v6];
          NSUInteger v9 = v5;
          goto LABEL_8;
        }
LABEL_9:

        if (++v6 >= (unint64_t)[v3 count]) {
          goto LABEL_10;
        }
      }
      NSUInteger v8 = +[NSNumber numberWithUnsignedInteger:v6];
      NSUInteger v9 = v4;
LABEL_8:
      [v9 addObject:v8];

      goto LABEL_9;
    }
LABEL_10:
    id v10 = [v4 count];
    v11 = v4;
    if (!v10)
    {
      if ([v5 count]) {
        v11 = v5;
      }
      else {
        v11 = 0;
      }
    }
    id v12 = v11;
    if ([v12 count])
    {
      id v13 = [v12 objectAtIndexedSubscript:0];
      uint64_t v14 = (uint64_t)[v13 unsignedIntegerValue];
    }
    else
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ([v12 count])
    {
      id v16 = [v12 lastObject];
      uint64_t v17 = (uint64_t)[v16 unsignedIntegerValue];
    }
    else
    {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v18 = v14 != 0x7FFFFFFFFFFFFFFFLL;
    BOOL v19 = v17 != 0x7FFFFFFFFFFFFFFFLL;
    if (v18 && v19) {
      uint64_t v15 = v17 - v14 + 1;
    }
    else {
      uint64_t v15 = 0;
    }
    if (!v18 || !v19) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v20 = v14;
  NSUInteger v21 = v15;
  result.length = v21;
  result.location = v20;
  return result;
}

- (id)highlightedLanes
{
  lanes = self->_lanes;
  id v4 = [(NavSignLaneGuidanceInfo *)self highlightedLaneRange];

  return -[NSArray subarrayWithRange:](lanes, "subarrayWithRange:", v4, v3);
}

- (NSUUID)laneInfoId
{
  return self->_laneInfoId;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (NSArray)textAlternatives
{
  return self->_textAlternatives;
}

- (NSArray)midStepTitles
{
  return self->_midStepTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midStepTitles, 0);
  objc_storeStrong((id *)&self->_textAlternatives, 0);
  objc_storeStrong((id *)&self->_lanes, 0);

  objc_storeStrong((id *)&self->_laneInfoId, 0);
}

@end