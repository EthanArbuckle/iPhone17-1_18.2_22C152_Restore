@interface NavSignManeuverGuidanceInfo
+ (id)updatedGuidanceWithPreviousGuidance:(id)a3 currentGuidance:(id)a4;
- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4;
- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4 shieldInfo:(id)a5;
- (GuidanceManeuverArtwork)maneuverArtwork;
- (MKServerFormattedString)majorText;
- (MKServerFormattedString)minorText;
- (NSArray)majorTextAlternatives;
- (NSArray)minorTextAlternatives;
- (NSUUID)signID;
- (NavSignManeuverGuidanceInfo)initWithSignID:(id)a3 maneuverArtwork:(id)a4 majorTextAlternatives:(id)a5 minorTextAlternatives:(id)a6 shieldInfo:(id)a7;
- (NavSignShieldInfo)shieldInfo;
- (id)description;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_setNeedsChangeNotification;
- (void)addGuidanceObserver:(id)a3;
- (void)removeGuidanceObserver:(id)a3;
- (void)setMajorText:(id)a3;
- (void)setMajorTextAlternatives:(id)a3;
- (void)setManeuverArtwork:(id)a3;
- (void)setMinorText:(id)a3;
- (void)setMinorTextAlternatives:(id)a3;
- (void)setShieldInfo:(id)a3;
@end

@implementation NavSignManeuverGuidanceInfo

+ (id)updatedGuidanceWithPreviousGuidance:(id)a3 currentGuidance:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 signID];
  v8 = [v6 signID];
  unsigned int v9 = [v7 isEqual:v8];

  v10 = v6;
  if (v9)
  {
    v11 = [v6 maneuverArtwork];
    [v5 setManeuverArtwork:v11];

    v12 = [v6 majorTextAlternatives];
    [v5 setMajorTextAlternatives:v12];

    v13 = [v6 minorTextAlternatives];
    [v5 setMinorTextAlternatives:v13];

    v14 = [v6 shieldInfo];
    [v5 setShieldInfo:v14];

    v10 = v5;
  }
  id v15 = v10;

  return v15;
}

- (NavSignManeuverGuidanceInfo)initWithSignID:(id)a3 maneuverArtwork:(id)a4 majorTextAlternatives:(id)a5 minorTextAlternatives:(id)a6 shieldInfo:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NavSignManeuverGuidanceInfo;
  v18 = [(NavSignManeuverGuidanceInfo *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signID, a3);
    objc_storeStrong((id *)&v19->_maneuverArtwork, a4);
    v20 = (NSArray *)[v15 copy];
    majorTextAlternatives = v19->_majorTextAlternatives;
    v19->_majorTextAlternatives = v20;

    v22 = (NSArray *)[v16 copy];
    minorTextAlternatives = v19->_minorTextAlternatives;
    v19->_minorTextAlternatives = v22;

    objc_storeStrong((id *)&v19->_shieldInfo, a7);
    uint64_t v24 = +[NSHashTable weakObjectsHashTable];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v24;
  }
  return v19;
}

- (MKServerFormattedString)majorText
{
  v2 = [(NavSignManeuverGuidanceInfo *)self majorTextAlternatives];
  v3 = [v2 firstObject];

  return (MKServerFormattedString *)v3;
}

- (MKServerFormattedString)minorText
{
  v2 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
  v3 = [v2 firstObject];

  return (MKServerFormattedString *)v3;
}

- (void)setMajorText:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(NavSignManeuverGuidanceInfo *)self setMajorTextAlternatives:v6];
  }
  else
  {
    [(NavSignManeuverGuidanceInfo *)self setMajorTextAlternatives:0];
  }
}

- (void)setMinorText:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(NavSignManeuverGuidanceInfo *)self setMinorTextAlternatives:v6];
  }
  else
  {
    [(NavSignManeuverGuidanceInfo *)self setMinorTextAlternatives:0];
  }
}

- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4 shieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(NavSignManeuverGuidanceInfo *)self maneuverArtwork];
  unsigned int v11 = [v10 maneuver];

  if (v11 != a3) {
    goto LABEL_7;
  }
  uint64_t v12 = [(NavSignManeuverGuidanceInfo *)self shieldInfo];
  if (!v12)
  {
    if (!v9) {
      goto LABEL_4;
    }
LABEL_7:
    unsigned __int8 v18 = 0;
    goto LABEL_10;
  }
  id v13 = (void *)v12;
  id v14 = [(NavSignManeuverGuidanceInfo *)self shieldInfo];
  unsigned __int8 v15 = [v14 isEqual:v9];

  if ((v15 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  id v16 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
  if ([v16 count])
  {
    id v17 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
    unsigned __int8 v18 = [v17 isEqualToArray:v8];
  }
  else
  {
    unsigned __int8 v18 = [v8 count] == 0;
  }

LABEL_10:
  return v18;
}

- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4
{
  id v6 = a4;
  id v7 = [(NavSignManeuverGuidanceInfo *)self maneuverArtwork];
  unsigned int v8 = [v7 maneuver];

  if (v8 == a3)
  {
    id v9 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
    if ([v9 count])
    {
      v10 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
      unsigned __int8 v11 = [v10 isEqualToArray:v6];
    }
    else
    {
      unsigned __int8 v11 = [v6 count] == 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)addGuidanceObserver:(id)a3
{
}

- (void)removeGuidanceObserver:(id)a3
{
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)NavSignManeuverGuidanceInfo;
  v3 = [(NavSignManeuverGuidanceInfo *)&v17 description];
  id v4 = [(NavSignManeuverGuidanceInfo *)self signID];
  id v16 = [(NavSignManeuverGuidanceInfo *)self maneuverArtwork];
  id v5 = [v16 maneuver];
  id v6 = @"NO_TURN";
  switch((int)v5)
  {
    case 0:
      break;
    case 1:
      id v6 = @"LEFT_TURN";
      break;
    case 2:
      id v6 = @"RIGHT_TURN";
      break;
    case 3:
      id v6 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      id v6 = @"U_TURN";
      break;
    case 5:
      id v6 = @"FOLLOW_ROAD";
      break;
    case 6:
      id v6 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      id v6 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      id v6 = @"OFF_RAMP";
      break;
    case 12:
      id v6 = @"ON_RAMP";
      break;
    case 16:
      id v6 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      id v6 = @"START_ROUTE";
      break;
    case 18:
      id v6 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      id v6 = @"KEEP_LEFT";
      break;
    case 21:
      id v6 = @"KEEP_RIGHT";
      break;
    case 22:
      id v6 = @"ENTER_FERRY";
      break;
    case 23:
      id v6 = @"EXIT_FERRY";
      break;
    case 24:
      id v6 = @"CHANGE_FERRY";
      break;
    case 25:
      id v6 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      id v6 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      id v6 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      id v6 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      id v6 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      id v6 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      id v6 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      id v6 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      id v6 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      id v6 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      id v6 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      id v6 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      id v6 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      id v6 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      id v6 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      id v6 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      id v6 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      id v6 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      id v6 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      id v6 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      id v6 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      id v6 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      id v6 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      id v6 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      id v6 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      id v6 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      id v6 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      id v6 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      id v6 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      id v6 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      id v6 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      id v6 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      id v6 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      id v6 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      id v6 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      id v6 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      id v6 = @"TOLL_STATION";
      break;
    case 81:
      id v6 = @"ENTER_TUNNEL";
      break;
    case 82:
      id v6 = @"WAYPOINT_STOP";
      break;
    case 83:
      id v6 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      id v6 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      id v6 = @"RESUME_ROUTE";
      break;
    case 86:
      id v6 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      id v6 = @"CUSTOM";
      break;
    case 88:
      id v6 = @"TURN_AROUND";
      break;
    default:
      id v6 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
      break;
  }
  id v7 = [(NavSignManeuverGuidanceInfo *)self majorTextAlternatives];
  unsigned int v8 = [v7 firstObject];
  id v9 = [v8 debugDescription];
  v10 = [(NavSignManeuverGuidanceInfo *)self minorTextAlternatives];
  unsigned __int8 v11 = [v10 firstObject];
  uint64_t v12 = [v11 debugDescription];
  id v13 = [(NavSignManeuverGuidanceInfo *)self shieldInfo];
  id v15 = +[NSString stringWithFormat:@"%@ signID: [%@] maneuver: [%@] major: [%@] minor: [%@] shield: [%@]", v3, v4, v6, v9, v12, v13];

  return v15;
}

- (void)_notifyObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setNeedsChangeNotification
{
  if (!self->_willNotify)
  {
    self->_willNotify = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C4B8;
    block[3] = &unk_100080F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setManeuverArtwork:(id)a3
{
  id v5 = (GuidanceManeuverArtwork *)a3;
  maneuverArtwork = self->_maneuverArtwork;
  if (maneuverArtwork != v5 && ![(GuidanceManeuverArtwork *)maneuverArtwork isEqual:v5])
  {
    objc_storeStrong((id *)&self->_maneuverArtwork, a3);
    [(NavSignManeuverGuidanceInfo *)self _setNeedsChangeNotification];
  }

  _objc_release_x1();
}

- (void)setMajorTextAlternatives:(id)a3
{
  id v4 = (NSArray *)a3;
  majorTextAlternatives = self->_majorTextAlternatives;
  if (majorTextAlternatives != v4)
  {
    id v9 = v4;
    if (!v4 || (unsigned __int8 v6 = [(NSArray *)majorTextAlternatives isEqualToArray:v4], v4 = v9, (v6 & 1) == 0))
    {
      id v7 = (NSArray *)[(NSArray *)v4 copy];
      uint64_t v8 = self->_majorTextAlternatives;
      self->_majorTextAlternatives = v7;

      [(NavSignManeuverGuidanceInfo *)self _setNeedsChangeNotification];
    }
  }

  _objc_release_x1();
}

- (void)setMinorTextAlternatives:(id)a3
{
  id v4 = (NSArray *)a3;
  minorTextAlternatives = self->_minorTextAlternatives;
  if (minorTextAlternatives != v4)
  {
    id v9 = v4;
    if (!v4 || (unsigned __int8 v6 = [(NSArray *)minorTextAlternatives isEqualToArray:v4], v4 = v9, (v6 & 1) == 0))
    {
      id v7 = (NSArray *)[(NSArray *)v4 copy];
      uint64_t v8 = self->_minorTextAlternatives;
      self->_minorTextAlternatives = v7;

      [(NavSignManeuverGuidanceInfo *)self _setNeedsChangeNotification];
    }
  }

  _objc_release_x1();
}

- (void)setShieldInfo:(id)a3
{
  id v5 = (NavSignShieldInfo *)a3;
  shieldInfo = self->_shieldInfo;
  if (shieldInfo != v5 && ![(NavSignShieldInfo *)shieldInfo isEqual:v5])
  {
    objc_storeStrong((id *)&self->_shieldInfo, a3);
    [(NavSignManeuverGuidanceInfo *)self _setNeedsChangeNotification];
  }

  _objc_release_x1();
}

- (NSUUID)signID
{
  return self->_signID;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- (NSArray)majorTextAlternatives
{
  return self->_majorTextAlternatives;
}

- (NSArray)minorTextAlternatives
{
  return self->_minorTextAlternatives;
}

- (NavSignShieldInfo)shieldInfo
{
  return self->_shieldInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->_minorTextAlternatives, 0);
  objc_storeStrong((id *)&self->_majorTextAlternatives, 0);
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_signID, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end