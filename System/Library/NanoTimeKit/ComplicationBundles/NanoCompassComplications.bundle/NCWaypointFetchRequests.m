@interface NCWaypointFetchRequests
+ (id)fetchRequestForAllWaypoints;
+ (id)fetchRequestForCompassWaypoints;
+ (id)fetchRequestForCompassWaypointsWithAltitude:(BOOL)a3;
+ (id)fetchRequestForCountOfMissingElevationForWaypointsOfType:(int64_t)a3;
+ (id)fetchRequestForCountOfWaypointsInElevationTableOfType:(int64_t)a3;
+ (id)fetchRequestForEnabledCompassWaypoints;
+ (id)fetchRequestForWaypointContainingKeyword:(id)a3;
+ (id)fetchRequestForWaypointWithUUID:(id)a3;
+ (id)fetchRequestForWaypointsOfType:(int64_t)a3 withAltitude:(BOOL)a4;
@end

@implementation NCWaypointFetchRequests

+ (id)fetchRequestForAllWaypoints
{
  v3 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v2);
  id v4 = objc_alloc(MEMORY[0x263F08B30]);
  v6 = objc_msgSend_initWithKey_ascending_(v4, v5, @"timeOfCreation", 0);
  v9 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v7, (uint64_t)v6, v8);
  objc_msgSend_setSortDescriptors_(v3, v10, (uint64_t)v9, v11);

  return v3;
}

+ (id)fetchRequestForCompassWaypoints
{
  v3 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v2);
  v6 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v4, @"type == %d or type == %d", v5, 4, 0);
  objc_msgSend_setPredicate_(v3, v7, (uint64_t)v6, v8);

  id v9 = objc_alloc(MEMORY[0x263F08B30]);
  uint64_t v11 = objc_msgSend_initWithKey_ascending_(v9, v10, @"timeOfCreation", 0);
  v14 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v12, (uint64_t)v11, v13);
  objc_msgSend_setSortDescriptors_(v3, v15, (uint64_t)v14, v16);

  return v3;
}

+ (id)fetchRequestForEnabledCompassWaypoints
{
  v3 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v2);
  v6 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v4, @"enabled == YES and (type == %d or type == %d)", v5, 4, 0);
  objc_msgSend_setPredicate_(v3, v7, (uint64_t)v6, v8);

  id v9 = objc_alloc(MEMORY[0x263F08B30]);
  uint64_t v11 = objc_msgSend_initWithKey_ascending_(v9, v10, @"label", 1);
  v14 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v12, (uint64_t)v11, v13);
  objc_msgSend_setSortDescriptors_(v3, v15, (uint64_t)v14, v16);

  return v3;
}

+ (id)fetchRequestForWaypointWithUUID:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  v7 = objc_msgSend_fetchRequestWithEntityName_(v3, v5, @"Waypoint", v6);
  v10 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v8, @"uuid == %@", v9, v4);

  objc_msgSend_setPredicate_(v7, v11, (uint64_t)v10, v12);
  objc_msgSend_setFetchLimit_(v7, v13, 1, v14);

  return v7;
}

+ (id)fetchRequestForWaypointContainingKeyword:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  v7 = objc_msgSend_fetchRequestWithEntityName_(v3, v5, @"Waypoint", v6);
  v10 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v8, @"label CONTAINS[cd] %@", v9, v4);

  objc_msgSend_setPredicate_(v7, v11, (uint64_t)v10, v12);

  return v7;
}

+ (id)fetchRequestForCountOfMissingElevationForWaypointsOfType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v3);
  uint64_t v8 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v6, @"type == %d and altitudePopulated == 0", v7, a3);
  objc_msgSend_setPredicate_(v5, v9, (uint64_t)v8, v10);

  return v5;
}

+ (id)fetchRequestForCountOfWaypointsInElevationTableOfType:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v3);
  uint64_t v8 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v6, @"type == %d", v7, a3);
  objc_msgSend_setPredicate_(v5, v9, (uint64_t)v8, v10);

  return v5;
}

+ (id)fetchRequestForCompassWaypointsWithAltitude:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", v3);
  uint64_t v8 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v6, @"(type == %d or type == %d) and altitudePopulated == %d", v7, 4, 0, v4);
  objc_msgSend_setPredicate_(v5, v9, (uint64_t)v8, v10);

  return v5;
}

+ (id)fetchRequestForWaypointsOfType:(int64_t)a3 withAltitude:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"Waypoint", a4);
  uint64_t v9 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v7, @"type == %d and altitudePopulated == %d", v8, a3, v4);
  objc_msgSend_setPredicate_(v6, v10, (uint64_t)v9, v11);

  return v6;
}

@end