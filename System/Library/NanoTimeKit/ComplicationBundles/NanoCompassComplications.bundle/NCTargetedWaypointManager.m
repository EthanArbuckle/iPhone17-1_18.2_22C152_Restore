@interface NCTargetedWaypointManager
+ (id)sharedManager;
- (NCTargetedWaypointManager)init;
- (NSUUID)targetedWaypointUUID;
- (id)fetchTargetedWaypointUUID;
- (void)_loadTargetedWaypointUUID;
- (void)setTargetedWaypointUUID:(id)a3;
@end

@implementation NCTargetedWaypointManager

+ (id)sharedManager
{
  if (qword_268920C08 != -1) {
    dispatch_once(&qword_268920C08, &unk_26EA488C0);
  }
  v2 = (void *)qword_268920C00;

  return v2;
}

- (NCTargetedWaypointManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCTargetedWaypointManager;
  v2 = [(NCTargetedWaypointManager *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend__loadTargetedWaypointUUID(v2, v3, v4, v5);
  }
  return v6;
}

- (void)setTargetedWaypointUUID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSUUID *)a3;
  objc_super v8 = v5;
  targetedWaypointUUID = self->_targetedWaypointUUID;
  p_targetedWaypointUUID = &self->_targetedWaypointUUID;
  uint64_t v9 = (uint64_t)targetedWaypointUUID;
  if (targetedWaypointUUID != v5 && (objc_msgSend_isEqual_(v5, v6, v9, v7) & 1) == 0)
  {
    objc_storeStrong((id *)p_targetedWaypointUUID, a3);
    id v12 = objc_alloc(MEMORY[0x263EFFA40]);
    v15 = objc_msgSend_initWithSuiteName_(v12, v13, @"com.apple.compass", v14);
    v16 = *p_targetedWaypointUUID;
    v17 = NCLogForCategory(7uLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = *p_targetedWaypointUUID;
        int v27 = 136315394;
        v28 = "-[NCTargetedWaypointManager setTargetedWaypointUUID:]";
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_23759D000, v17, OS_LOG_TYPE_DEFAULT, "%s: setting target waypoint default to %@.", (uint8_t *)&v27, 0x16u);
      }

      v23 = objc_msgSend_UUIDString(*p_targetedWaypointUUID, v20, v21, v22);
      objc_msgSend_setObject_forKey_(v15, v24, (uint64_t)v23, @"TargetedWaypointUUID");
    }
    else
    {
      if (v18)
      {
        int v27 = 136315138;
        v28 = "-[NCTargetedWaypointManager setTargetedWaypointUUID:]";
        _os_log_impl(&dword_23759D000, v17, OS_LOG_TYPE_DEFAULT, "%s: target waypoint uuid is nil, removing from defaults.", (uint8_t *)&v27, 0xCu);
      }

      objc_msgSend_removeObjectForKey_(v15, v25, @"TargetedWaypointUUID", v26);
    }
  }
}

- (id)fetchTargetedWaypointUUID
{
  objc_msgSend__loadTargetedWaypointUUID(self, a2, v2, v3);
  targetedWaypointUUID = self->_targetedWaypointUUID;

  return targetedWaypointUUID;
}

- (void)_loadTargetedWaypointUUID
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v17 = (id)objc_msgSend_initWithSuiteName_(v3, v4, @"com.apple.compass", v5);
  objc_msgSend_synchronize(v17, v6, v7, v8);
  v11 = objc_msgSend_objectForKey_(v17, v9, @"TargetedWaypointUUID", v10);
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F08C38]);
    v15 = (NSUUID *)objc_msgSend_initWithUUIDString_(v12, v13, (uint64_t)v11, v14);
    targetedWaypointUUID = self->_targetedWaypointUUID;
    self->_targetedWaypointUUID = v15;
  }
  else
  {
    targetedWaypointUUID = self->_targetedWaypointUUID;
    self->_targetedWaypointUUID = 0;
  }
}

- (NSUUID)targetedWaypointUUID
{
  return self->_targetedWaypointUUID;
}

- (void).cxx_destruct
{
}

@end