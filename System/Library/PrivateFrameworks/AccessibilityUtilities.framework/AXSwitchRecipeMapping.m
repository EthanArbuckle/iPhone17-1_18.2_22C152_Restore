@interface AXSwitchRecipeMapping
+ (id)recipeMappingWithDictionaryRepresentation:(id)a3;
- (AXReplayableGesture)gesture;
- (AXReplayableGesture)longPressGesture;
- (AXSwitchGameControlButtonPress)gameControlButtonPress;
- (AXSwitchGameControlButtonPress)longPressGameControlButtonPress;
- (AXSwitchRecipeMapping)init;
- (BOOL)isOptional;
- (CGPoint)holdPoint;
- (NSString)action;
- (NSString)longPressAction;
- (NSUUID)switchUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)switchOriginalAction;
- (void)setAction:(id)a3;
- (void)setGameControlButtonPress:(id)a3;
- (void)setGesture:(id)a3;
- (void)setHoldPoint:(CGPoint)a3;
- (void)setLongPressAction:(id)a3;
- (void)setLongPressGameControlButtonPress:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setSwitchOriginalAction:(int64_t)a3;
- (void)setSwitchUUID:(id)a3;
@end

@implementation AXSwitchRecipeMapping

+ (id)recipeMappingWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"Action"];
  [v5 setAction:v6];

  v7 = [v4 objectForKeyedSubscript:@"LongPressAction"];
  [v5 setLongPressAction:v7];

  v8 = [v4 objectForKeyedSubscript:@"Gesture"];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:0];
    [v5 setGesture:v9];
  }
  v10 = [v4 objectForKeyedSubscript:@"LongPressGesture"];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
    [v5 setLongPressGesture:v11];
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"HoldPointX"];
  uint64_t v13 = [v4 objectForKeyedSubscript:@"HoldPointY"];
  v14 = (void *)v13;
  if (v12 | v13)
  {
    if (v12 && v13)
    {
      [(id)v12 doubleValue];
      double v16 = v15;
      [v14 doubleValue];
      objc_msgSend(v5, "setHoldPoint:", v16, v17);
    }
    else
    {
      uint64_t v31 = v12;
      uint64_t v32 = v13;
      _AXAssert();
    }
  }
  v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"Optional", v31, v32);
  objc_msgSend(v5, "setOptional:", objc_msgSend(v18, "BOOLValue"));

  v19 = [v4 objectForKeyedSubscript:@"SwitchUUID"];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F29128]);
    v21 = [v4 objectForKeyedSubscript:@"SwitchUUID"];
    v22 = (void *)[v20 initWithUUIDString:v21];

    [v5 setSwitchUUID:v22];
  }
  v23 = [v4 objectForKeyedSubscript:@"SwitchOriginalAction"];

  if (!v23) {
    _AXAssert();
  }
  v24 = [v4 objectForKeyedSubscript:@"SwitchOriginalAction"];

  if (v24)
  {
    v25 = [v4 objectForKeyedSubscript:@"SwitchOriginalAction"];
    objc_msgSend(v5, "setSwitchOriginalAction:", objc_msgSend(v25, "integerValue"));
  }
  else
  {
    [v5 setSwitchOriginalAction:103];
  }
  v26 = [v4 objectForKeyedSubscript:@"ButtonPress"];
  if (v26)
  {
    v27 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v26 error:0];
    [v5 setGameControlButtonPress:v27];
  }
  v28 = [v4 objectForKeyedSubscript:@"LongPressButtonPress"];
  if (v28)
  {
    v29 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v28 error:0];
    [v5 setLongPressGameControlButtonPress:v29];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  id v4 = [(AXSwitchRecipeMapping *)self action];

  if (!v4) {
    _AXAssert();
  }
  id v5 = [(AXSwitchRecipeMapping *)self action];

  if (v5)
  {
    v6 = [(AXSwitchRecipeMapping *)self action];
    [v3 setObject:v6 forKeyedSubscript:@"Action"];
  }
  v7 = [(AXSwitchRecipeMapping *)self longPressAction];

  if (v7)
  {
    v8 = [(AXSwitchRecipeMapping *)self longPressAction];
    [v3 setObject:v8 forKeyedSubscript:@"LongPressAction"];
  }
  v9 = [(AXSwitchRecipeMapping *)self gesture];
  if (v9)
  {
  }
  else
  {
    v10 = [(AXSwitchRecipeMapping *)self action];
    int v11 = [v10 isEqualToString:@"Gesture"];

    if (v11) {
      _AXAssert();
    }
  }
  [(AXSwitchRecipeMapping *)self holdPoint];
  if (v13 == -1.0 && v12 == -1.0)
  {
    v14 = [(AXSwitchRecipeMapping *)self action];
    int v15 = [v14 isEqualToString:@"HoldAtPoint"];

    if (v15) {
      _AXAssert();
    }
  }
  id v16 = [(AXSwitchRecipeMapping *)self gesture];

  if (v16)
  {
    double v17 = (void *)MEMORY[0x1E4F28DB0];
    v18 = [(AXSwitchRecipeMapping *)self gesture];
    id v55 = 0;
    v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v55];
    id v16 = v55;
    [v3 setObject:v19 forKeyedSubscript:@"Gesture"];
  }
  id v20 = [(AXSwitchRecipeMapping *)self longPressGesture];

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E4F28DB0];
    v22 = [(AXSwitchRecipeMapping *)self longPressGesture];
    id v54 = v16;
    v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v54];
    id v24 = v54;

    [v3 setObject:v23 forKeyedSubscript:@"LongPressGesture"];
    id v16 = v24;
  }
  v25 = [(AXSwitchRecipeMapping *)self gameControlButtonPress];
  if (v25)
  {
    id v53 = v16;
    v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v25 requiringSecureCoding:1 error:&v53];
    id v27 = v53;

    [v3 setObject:v26 forKeyedSubscript:@"ButtonPress"];
    id v16 = v27;
  }
  v28 = [(AXSwitchRecipeMapping *)self longPressGameControlButtonPress];
  if (v28)
  {
    id v52 = v16;
    v29 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v28 requiringSecureCoding:1 error:&v52];
    id v30 = v52;

    [v3 setObject:v29 forKeyedSubscript:@"LongPressButtonPress"];
    id v16 = v30;
  }
  if (v16)
  {
    uint64_t v31 = [MEMORY[0x1E4F48398] sharedInstance];
    char v32 = [v31 ignoreLogging];

    if ((v32 & 1) == 0)
    {
      v33 = [MEMORY[0x1E4F48398] identifier];
      v34 = AXLoggerForFacility();

      os_log_type_t v35 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = AXColorizeFormatLog();
        id v51 = v16;
        v37 = _AXStringForArgs();
        if (os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v37;
          _os_log_impl(&dword_18D308000, v34, v35, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  [(AXSwitchRecipeMapping *)self holdPoint];
  if (v39 != -1.0 || v38 != -1.0)
  {
    v40 = NSNumber;
    [(AXSwitchRecipeMapping *)self holdPoint];
    v41 = objc_msgSend(v40, "numberWithDouble:");
    [v3 setObject:v41 forKeyedSubscript:@"HoldPointX"];

    v42 = NSNumber;
    [(AXSwitchRecipeMapping *)self holdPoint];
    v44 = [v42 numberWithDouble:v43];
    [v3 setObject:v44 forKeyedSubscript:@"HoldPointY"];
  }
  v45 = [(AXSwitchRecipeMapping *)self switchUUID];

  if (v45)
  {
    v46 = [(AXSwitchRecipeMapping *)self switchUUID];
    v47 = [v46 UUIDString];
    [v3 setObject:v47 forKeyedSubscript:@"SwitchUUID"];
  }
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSwitchRecipeMapping isOptional](self, "isOptional"));
  [v3 setObject:v48 forKeyedSubscript:@"Optional"];

  v49 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXSwitchRecipeMapping switchOriginalAction](self, "switchOriginalAction"));
  [v3 setObject:v49 forKeyedSubscript:@"SwitchOriginalAction"];

  return v3;
}

- (AXSwitchRecipeMapping)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSwitchRecipeMapping;
  result = [(AXSwitchRecipeMapping *)&v3 init];
  if (result) {
    result->_holdPoint = (CGPoint)AXSwitchRecipeHoldPointNone;
  }
  return result;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)AXSwitchRecipeMapping;
  objc_super v3 = [(AXSwitchRecipeMapping *)&v10 description];
  id v4 = [(AXSwitchRecipeMapping *)self action];
  id v5 = [(AXSwitchRecipeMapping *)self gesture];
  v6 = [(AXSwitchRecipeMapping *)self switchUUID];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[AXSwitchRecipeMapping switchOriginalAction](self, "switchOriginalAction"));
  v8 = [v3 stringByAppendingFormat:@"\nAction: %@\nGesture: %@\nSwitch UUID: %@\nSwitch Original Action: %@", v4, v5, v6, v7];

  return v8;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)longPressAction
{
  return self->_longPressAction;
}

- (void)setLongPressAction:(id)a3
{
}

- (AXReplayableGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (AXReplayableGesture)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
}

- (CGPoint)holdPoint
{
  double x = self->_holdPoint.x;
  double y = self->_holdPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHoldPoint:(CGPoint)a3
{
  self->_holdPoint = a3;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (AXSwitchGameControlButtonPress)gameControlButtonPress
{
  return self->_gameControlButtonPress;
}

- (void)setGameControlButtonPress:(id)a3
{
}

- (AXSwitchGameControlButtonPress)longPressGameControlButtonPress
{
  return self->_longPressGameControlButtonPress;
}

- (void)setLongPressGameControlButtonPress:(id)a3
{
}

- (NSUUID)switchUUID
{
  return self->_switchUUID;
}

- (void)setSwitchUUID:(id)a3
{
}

- (int64_t)switchOriginalAction
{
  return self->_switchOriginalAction;
}

- (void)setSwitchOriginalAction:(int64_t)a3
{
  self->_switchOriginalAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchUUID, 0);
  objc_storeStrong((id *)&self->_longPressGameControlButtonPress, 0);
  objc_storeStrong((id *)&self->_gameControlButtonPress, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
  objc_storeStrong((id *)&self->_longPressAction, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end