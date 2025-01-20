@interface NCCompassWaypointGuide
- (NCCompassWaypointGuide)initWithName:(id)a3;
- (id)enabledWaypoints;
- (id)fetchWaypoints;
- (id)guideSymbol;
- (id)iconColor;
- (id)systemWaypoints;
- (void)deleteWaypoint:(id)a3;
- (void)updateWaypoint:(id)a3;
@end

@implementation NCCompassWaypointGuide

- (NCCompassWaypointGuide)initWithName:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_sharedAppManager(NCWaypointManager, v5, v6, v7);
  v8 = (NCWaypointManager *)objc_claimAutoreleasedReturnValue();
  manager = self->_manager;
  self->_manager = v8;

  id v10 = objc_alloc(MEMORY[0x263EFFA40]);
  v13 = objc_msgSend_initWithSuiteName_(v10, v11, @"com.apple.compass", v12);
  v19 = objc_msgSend_objectForKey_(v13, v14, @"CompassGuideUUID", v15);
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x263F08C38]);
    v23 = objc_msgSend_initWithUUIDString_(v20, v21, (uint64_t)v19, v22);
  }
  else
  {
    v23 = objc_msgSend_UUID(MEMORY[0x263F08C38], v16, v17, v18);
    v27 = objc_msgSend_UUIDString(v23, v24, v25, v26);
    objc_msgSend_setObject_forKey_(v13, v28, (uint64_t)v27, @"CompassGuideUUID");

    v29 = NCLogForCategory(9uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend_UUIDString(v23, v30, v31, v32);
      *(_DWORD *)buf = 136315394;
      v38 = "-[NCCompassWaypointGuide initWithName:]";
      __int16 v39 = 2112;
      v40 = v33;
      _os_log_impl(&dword_23759D000, v29, OS_LOG_TYPE_INFO, "%s: created Compass Waypoints guide uuid %@ and saved to defaults.", buf, 0x16u);
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)NCCompassWaypointGuide;
  v34 = [(NCWaypointGuide *)&v36 initWithIdentifier:v23 name:v4 type:0];

  return v34;
}

- (id)guideSymbol
{
  return @"location.pin.point.of.interest.2.fill";
}

- (id)iconColor
{
  return (id)objc_msgSend_idealizedWaypointSymbolColor(NCWaypoint, a2, v2, v3);
}

- (id)systemWaypoints
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_parkedCarWaypoint(self->_manager, v4, v5, v6);
  v11 = objc_msgSend_location(v7, v8, v9, v10);

  if (v11) {
    objc_msgSend_addObject_(v3, v12, (uint64_t)v7, v14);
  }
  uint64_t v15 = objc_msgSend_copy(v3, v12, v13, v14);

  return v15;
}

- (id)fetchWaypoints
{
  return (id)objc_msgSend_fetchCompassWaypoints(self->_manager, a2, v2, v3);
}

- (id)enabledWaypoints
{
  return (id)((uint64_t (*)(NCWaypointManager *, char *))MEMORY[0x270F9A6D0])(self->_manager, sel_fetchEnabledCompassWaypoints);
}

- (void)updateWaypoint:(id)a3
{
}

- (void)deleteWaypoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end