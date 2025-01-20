@interface WalkPreferences
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHills;
- (BOOL)avoidStairs;
- (BOOL)hasAnyNonStandardPreferences;
- (WalkPreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 avoidStairs:(BOOL)a5 defaults:(id)a6;
- (WalkPreferences)initWithCopy:(id)a3;
- (WalkPreferences)initWithDefaults:(id)a3;
- (WalkPreferences)initWithWalkingOptions:(id)a3 defaults:(id)a4;
- (id)_keys;
- (id)_values;
- (id)walkingOptions;
- (void)loadValuesFromDefaults;
- (void)setAvoidBusyRoads:(BOOL)a3;
- (void)setAvoidHills:(BOOL)a3;
- (void)setAvoidStairs:(BOOL)a3;
@end

@implementation WalkPreferences

- (WalkPreferences)initWithAvoidHills:(BOOL)a3 avoidBusyRoads:(BOOL)a4 avoidStairs:(BOOL)a5 defaults:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)WalkPreferences;
  result = [(WatchSyncedPreferences *)&v10 initWithDefaults:a6];
  if (result)
  {
    result->_avoidHills = a3;
    result->_avoidBusyRoads = a4;
    result->_avoidStairs = a5;
  }
  return result;
}

- (WalkPreferences)initWithWalkingOptions:(id)a3 defaults:(id)a4
{
  id v6 = a4;
  v7 = [a3 walkingUserPreferences];
  v8 = -[WalkPreferences initWithAvoidHills:avoidBusyRoads:avoidStairs:defaults:](self, "initWithAvoidHills:avoidBusyRoads:avoidStairs:defaults:", [v7 avoidHills], objc_msgSend(v7, "avoidBusyRoads"), objc_msgSend(v7, "avoidStairs"), v6);

  return v8;
}

- (WalkPreferences)initWithDefaults:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WalkPreferences;
  return [(WatchSyncedPreferences *)&v4 initWithDefaults:a3];
}

- (WalkPreferences)initWithCopy:(id)a3
{
  objc_super v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WalkPreferences;
  v5 = [(WatchSyncedPreferences *)&v8 initWithCopy:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass)
      {
        v5->_avoidHills = v4[24];
        v5->_avoidBusyRoads = v4[25];
        v5->_avoidStairs = v4[26];
      }
    }
  }

  return v5;
}

- (id)walkingOptions
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "setAvoidHills:", -[WalkPreferences avoidHills](self, "avoidHills"));
  objc_msgSend(v3, "setAvoidBusyRoads:", -[WalkPreferences avoidBusyRoads](self, "avoidBusyRoads"));
  objc_msgSend(v3, "setAvoidStairs:", -[WalkPreferences avoidStairs](self, "avoidStairs"));
  objc_super v4 = objc_opt_new();
  [v4 setWalkingUserPreferences:v3];

  return v4;
}

- (BOOL)hasAnyNonStandardPreferences
{
  if ([(WalkPreferences *)self avoidHills] || [(WalkPreferences *)self avoidBusyRoads]) {
    return 1;
  }

  return [(WalkPreferences *)self avoidStairs];
}

- (void)loadValuesFromDefaults
{
  v3 = [(WatchSyncedPreferences *)self defaults];
  -[WalkPreferences setAvoidHills:](self, "setAvoidHills:", [v3 BOOLForKey:@"MapsDefaultWalkingAvoidHillsKey"]);

  objc_super v4 = [(WatchSyncedPreferences *)self defaults];
  -[WalkPreferences setAvoidBusyRoads:](self, "setAvoidBusyRoads:", [v4 BOOLForKey:@"MapsDefaultWalkingAvoidBusyRoadsKey"]);

  id v5 = [(WatchSyncedPreferences *)self defaults];
  -[WalkPreferences setAvoidStairs:](self, "setAvoidStairs:", [v5 BOOLForKey:@"MapsDefaultWalkingAvoidStairsKey"]);
}

- (id)_keys
{
  return &off_100088668;
}

- (id)_values
{
  v3 = +[NSNumber numberWithBool:self->_avoidHills];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidBusyRoads, v3);
  v8[1] = v4;
  id v5 = +[NSNumber numberWithBool:self->_avoidStairs];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  self->_avoidHills = a3;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  self->_avoidBusyRoads = a3;
}

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  self->_avoidStairs = a3;
}

@end