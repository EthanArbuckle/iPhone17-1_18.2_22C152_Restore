@interface NCMapsUserGuide
- (NCMapsUserGuide)initWithIdentifier:(id)a3 name:(id)a4 waypoints:(id)a5;
- (id)fetchWaypoints;
- (unint64_t)waypointCount;
- (void)deleteWaypoint:(id)a3;
- (void)updateWaypoint:(id)a3;
@end

@implementation NCMapsUserGuide

- (NCMapsUserGuide)initWithIdentifier:(id)a3 name:(id)a4 waypoints:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NCMapsUserGuide;
  v10 = [(NCWaypointGuide *)&v13 initWithIdentifier:a3 name:a4 type:1];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_waypoints, a5);
  }

  return v11;
}

- (id)fetchWaypoints
{
  return self->_waypoints;
}

- (unint64_t)waypointCount
{
  return objc_msgSend_count(self->_waypoints, a2, v2, v3);
}

- (void)updateWaypoint:(id)a3
{
  id v4 = a3;
  v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_2375D970C(v4, (char *)self, (uint64_t)v5, v6);
  }
}

- (void)deleteWaypoint:(id)a3
{
  id v4 = a3;
  v5 = NCLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_2375D97B0(v4, (char *)self, (uint64_t)v5, v6);
  }
}

- (void).cxx_destruct
{
}

@end