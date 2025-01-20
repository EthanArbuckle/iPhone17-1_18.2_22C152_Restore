@interface GEOURLDirectionsOptions
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHighways;
- (BOOL)avoidHills;
- (BOOL)avoidStairs;
- (BOOL)avoidTolls;
- (BOOL)hasDrivingPreferences;
- (BOOL)hasTransitPreferences;
- (BOOL)hasWalkingOrCyclingPreferences;
- (BOOL)transitPreferBus;
- (BOOL)transitPreferCommuter;
- (BOOL)transitPreferFerry;
- (BOOL)transitPreferSubway;
- (NSNumber)navigationAutoLaunchDelay;
- (id)avoidOptionsString;
- (id)transitOptionsString;
- (void)setAvoidOptions:(id)a3;
- (void)setNavigationAutoLaunchDelay:(id)a3;
- (void)setTransitOptions:(id)a3;
@end

@implementation GEOURLDirectionsOptions

- (void)setAvoidOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = [v9 isEqualToString:@"tolls"];
        p_avoidTolls = &self->_avoidTolls;
        if (v10) {
          goto LABEL_11;
        }
        char v12 = [v9 isEqualToString:@"highways"];
        p_avoidTolls = &self->_avoidHighways;
        if ((v12 & 1) == 0)
        {
          char v13 = [v9 isEqualToString:@"hills"];
          p_avoidTolls = &self->_avoidHills;
          if ((v13 & 1) == 0)
          {
            char v14 = [v9 isEqualToString:@"busy-roads"];
            p_avoidTolls = &self->_avoidBusyRoads;
            if ((v14 & 1) == 0)
            {
              int v15 = [v9 isEqualToString:@"stairs"];
              p_avoidTolls = &self->_avoidStairs;
              if (!v15) {
                continue;
              }
            }
          }
        }
LABEL_11:
        BOOL *p_avoidTolls = 1;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)setTransitOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    p_transitPreferFerry = &self->_transitPreferFerry;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "isEqualToString:", @"bus", p_transitPreferFerry);
        p_transitPreferBus = &self->_transitPreferBus;
        if ((v10 & 1) == 0)
        {
          char v12 = [v9 isEqualToString:@"subway"];
          p_transitPreferBus = &self->_transitPreferSubway;
          if ((v12 & 1) == 0)
          {
            char v13 = [v9 isEqualToString:@"commuter"];
            p_transitPreferBus = &self->_transitPreferCommuter;
            if ((v13 & 1) == 0)
            {
              int v14 = [v9 isEqualToString:@"ferry"];
              p_transitPreferBus = p_transitPreferFerry;
              if (!v14) {
                continue;
              }
            }
          }
        }
        BOOL *p_transitPreferBus = 1;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (BOOL)hasDrivingPreferences
{
  return self->_avoidTolls || self->_avoidHighways;
}

- (BOOL)hasWalkingOrCyclingPreferences
{
  return self->_avoidStairs || self->_avoidHills || self->_avoidBusyRoads;
}

- (BOOL)hasTransitPreferences
{
  return self->_transitPreferBus
      || self->_transitPreferSubway
      || self->_transitPreferCommuter
      || self->_transitPreferFerry;
}

- (id)avoidOptionsString
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_avoidBusyRoads) {
    [v3 addObject:@"busy-roads"];
  }
  if (self->_avoidHighways) {
    [v4 addObject:@"highways"];
  }
  if (self->_avoidHills) {
    [v4 addObject:@"hills"];
  }
  if (self->_avoidStairs) {
    [v4 addObject:@"stairs"];
  }
  if (self->_avoidTolls) {
    [v4 addObject:@"tolls"];
  }
  uint64_t v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

- (id)transitOptionsString
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_transitPreferBus) {
    [v3 addObject:@"bus"];
  }
  if (self->_transitPreferCommuter) {
    [v4 addObject:@"commuter"];
  }
  if (self->_transitPreferFerry) {
    [v4 addObject:@"ferry"];
  }
  if (self->_transitPreferSubway) {
    [v4 addObject:@"subway"];
  }
  uint64_t v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (BOOL)transitPreferBus
{
  return self->_transitPreferBus;
}

- (BOOL)transitPreferSubway
{
  return self->_transitPreferSubway;
}

- (BOOL)transitPreferCommuter
{
  return self->_transitPreferCommuter;
}

- (BOOL)transitPreferFerry
{
  return self->_transitPreferFerry;
}

- (NSNumber)navigationAutoLaunchDelay
{
  return self->_navigationAutoLaunchDelay;
}

- (void)setNavigationAutoLaunchDelay:(id)a3
{
}

- (void).cxx_destruct
{
}

@end