@interface _GEOWalkingRouteMatcherTurnAroundManeuverInfo
- (_GEOWalkingRouteMatcherTurnAroundManeuverInfo)initWithStep:(id)a3;
@end

@implementation _GEOWalkingRouteMatcherTurnAroundManeuverInfo

- (_GEOWalkingRouteMatcherTurnAroundManeuverInfo)initWithStep:(id)a3
{
  id v5 = a3;
  if ([v5 maneuverType] != 88 && objc_msgSend(v5, "maneuverType") != 35) {
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)_GEOWalkingRouteMatcherTurnAroundManeuverInfo;
  v6 = [(_GEOWalkingRouteMatcherTurnAroundManeuverInfo *)&v10 init];
  v7 = v6;
  if (!v6)
  {
    self = 0;
LABEL_7:
    v8 = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->_step, a3);
  self = v7;
  v8 = self;
LABEL_5:

  return v8;
}

- (void).cxx_destruct
{
}

@end