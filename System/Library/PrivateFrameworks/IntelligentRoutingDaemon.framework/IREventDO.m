@interface IREventDO
+ (BOOL)supportsSecureCoding;
+ (IREventDO)eventDOWithAppleTVControlType:(int64_t)a3;
+ (IREventDO)eventDOWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9;
+ (IREventDO)eventDOWithMediaType:(int64_t)a3;
+ (IREventDO)eventDOWithMediaType:(int64_t)a3 bundleID:(id)a4;
+ (id)atvUserInteractionEvents;
+ (id)mediaBrokeredDeviceEvents;
+ (id)mediaUserInteractionEvents;
+ (id)pickerChoiceEvents;
- (BOOL)isBannerEvent;
- (BOOL)isEligibleApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventDO:(id)a3;
- (BOOL)isOutsideApp;
- (BOOL)isPickerChoiceEvent;
- (BOOL)isUserIntentionEvent;
- (IREventDO)initWithCoder:(id)a3;
- (IREventDO)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9;
- (NSString)bundleID;
- (NSString)contextIdentifier;
- (NSString)name;
- (id)copyWithReplacementBundleID:(id)a3;
- (id)copyWithReplacementContextIdentifier:(id)a3;
- (id)copyWithReplacementEventSubType:(int64_t)a3;
- (id)copyWithReplacementEventType:(int64_t)a3;
- (id)copyWithReplacementIsEligibleApp:(BOOL)a3;
- (id)copyWithReplacementIsOutsideApp:(BOOL)a3;
- (id)copyWithReplacementName:(id)a3;
- (id)description;
- (id)exportAsDictionary;
- (int64_t)eventSubType;
- (int64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IREventDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)mediaBrokeredDeviceEvents
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[IREventDO eventDOWithMediaType:9];
  v4 = +[IREventDO eventDOWithMediaType:10];
  v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)mediaUserInteractionEvents
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[IREventDO eventDOWithMediaType:5];
  v4 = +[IREventDO eventDOWithMediaType:0];
  v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, 0);

  return v5;
}

+ (IREventDO)eventDOWithMediaType:(int64_t)a3 bundleID:(id)a4
{
  id v5 = a4;
  v6 = [IREventDO alloc];
  LOBYTE(v9) = 0;
  v7 = [(IREventDO *)v6 initWithEventType:a3 eventSubType:0 name:*MEMORY[0x263F50118] bundleID:v5 contextIdentifier:0 isOutsideApp:0 isEligibleApp:v9];

  return v7;
}

- (IREventDO)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IREventDO;
  v19 = [(IREventDO *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->_eventType = a3;
    v19->_eventSubType = a4;
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v20->_bundleID, a6);
    objc_storeStrong((id *)&v20->_contextIdentifier, a7);
    v20->_isOutsideApp = a8;
    v20->_isEligibleApp = a9;
  }

  return v20;
}

+ (IREventDO)eventDOWithMediaType:(int64_t)a3
{
  return +[IREventDO eventDOWithMediaType:a3 bundleID:0];
}

- (unint64_t)hash
{
  int64_t v2 = self->_eventSubType - self->_eventType + 32 * self->_eventType;
  return [(NSString *)self->_name hash] - v2 + 32 * v2;
}

- (int64_t)eventType
{
  return self->_eventType;
}

+ (IREventDO)eventDOWithAppleTVControlType:(int64_t)a3
{
  v4 = [IREventDO alloc];
  LOBYTE(v7) = 0;
  id v5 = [(IREventDO *)v4 initWithEventType:a3 eventSubType:0 name:*MEMORY[0x263F50110] bundleID:0 contextIdentifier:0 isOutsideApp:0 isEligibleApp:v7];

  return v5;
}

+ (id)atvUserInteractionEvents
{
  int64_t v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[IREventDO eventDOWithAppleTVControlType:0];
  v4 = +[IREventDO eventDOWithAppleTVControlType:3];
  id v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)pickerChoiceEvents
{
  int64_t v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[IREventDO eventDOWithAppleTVControlType:0];
  v4 = +[IREventDO eventDOWithMediaType:0];
  id v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, 0);

  return v5;
}

- (id)exportAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [MEMORY[0x263F500D8] eventTypeStringEventDO:self];
  [v3 setObject:v4 forKeyedSubscript:@"eventType"];

  id v5 = [MEMORY[0x263F500D8] eventSubTypeStringEventDO:self];
  [v3 setObject:v5 forKeyedSubscript:@"eventSubType"];

  v6 = [(IREventDO *)self name];
  [v3 setObject:v6 forKeyedSubscript:@"name"];

  uint64_t v7 = [(IREventDO *)self bundleID];
  [v3 setObject:v7 forKeyedSubscript:@"bundleID"];

  v8 = [(IREventDO *)self contextIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"contextIdentifier"];

  return v3;
}

- (BOOL)isUserIntentionEvent
{
  id v3 = +[IREventDO mediaUserInteractionEvents];
  if ([v3 containsObject:self])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = +[IREventDO atvUserInteractionEvents];
    if ([v5 containsObject:self])
    {
      char v4 = 1;
    }
    else
    {
      v6 = +[IREventDO mediaBrokeredDeviceEvents];
      char v4 = [v6 containsObject:self];
    }
  }

  return v4;
}

- (BOOL)isPickerChoiceEvent
{
  id v3 = +[IREventDO pickerChoiceEvents];
  LOBYTE(self) = [v3 containsObject:self];

  return (char)self;
}

- (BOOL)isBannerEvent
{
  v16[5] = *MEMORY[0x263EF8340];
  char v3 = 1;
  char v4 = +[IREventDO eventDOWithMediaType:1];
  v16[0] = v4;
  id v5 = +[IREventDO eventDOWithMediaType:2];
  v16[1] = v5;
  v6 = +[IREventDO eventDOWithMediaType:3];
  v16[2] = v6;
  uint64_t v7 = +[IREventDO eventDOWithMediaType:4];
  v16[3] = v7;
  v8 = +[IREventDO eventDOWithMediaType:8];
  v16[4] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:5];

  v10 = +[IREventDO eventDOWithAppleTVControlType:4];
  v15[0] = v10;
  v11 = +[IREventDO eventDOWithAppleTVControlType:5];
  v15[1] = v11;
  v12 = +[IREventDO eventDOWithAppleTVControlType:2];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  if (([v9 containsObject:self] & 1) == 0) {
    char v3 = [v13 containsObject:self];
  }

  return v3;
}

+ (IREventDO)eventDOWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  LOBYTE(v20) = a9;
  id v18 = (void *)[objc_alloc((Class)a1) initWithEventType:a3 eventSubType:a4 name:v17 bundleID:v16 contextIdentifier:v15 isOutsideApp:v9 isEligibleApp:v20];

  return (IREventDO *)v18;
}

- (id)copyWithReplacementEventType:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)[v5 initWithEventType:a3 eventSubType:self->_eventSubType name:self->_name bundleID:self->_bundleID contextIdentifier:self->_contextIdentifier isOutsideApp:self->_isOutsideApp isEligibleApp:v7];
}

- (id)copyWithReplacementEventSubType:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)[v5 initWithEventType:self->_eventType eventSubType:a3 name:self->_name bundleID:self->_bundleID contextIdentifier:self->_contextIdentifier isOutsideApp:self->_isOutsideApp isEligibleApp:v7];
}

- (id)copyWithReplacementName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)[v5 initWithEventType:self->_eventType eventSubType:self->_eventSubType name:v4 bundleID:self->_bundleID contextIdentifier:self->_contextIdentifier isOutsideApp:self->_isOutsideApp isEligibleApp:v8];

  return v6;
}

- (id)copyWithReplacementBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)[v5 initWithEventType:self->_eventType eventSubType:self->_eventSubType name:self->_name bundleID:v4 contextIdentifier:self->_contextIdentifier isOutsideApp:self->_isOutsideApp isEligibleApp:v8];

  return v6;
}

- (id)copyWithReplacementContextIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)[v5 initWithEventType:self->_eventType eventSubType:self->_eventSubType name:self->_name bundleID:self->_bundleID contextIdentifier:v4 isOutsideApp:self->_isOutsideApp isEligibleApp:v8];

  return v6;
}

- (id)copyWithReplacementIsOutsideApp:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)[v5 initWithEventType:self->_eventType eventSubType:self->_eventSubType name:self->_name bundleID:self->_bundleID contextIdentifier:self->_contextIdentifier isOutsideApp:v3 isEligibleApp:v7];
}

- (id)copyWithReplacementIsEligibleApp:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithEventType:self->_eventType eventSubType:self->_eventSubType name:self->_name bundleID:self->_bundleID contextIdentifier:self->_contextIdentifier isOutsideApp:self->_isOutsideApp isEligibleApp:v4];
}

- (BOOL)isEqualToEventDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (int64_t eventType = self->_eventType, eventType == [v4 eventType])
    && (int64_t eventSubType = self->_eventSubType, eventSubType == [v5 eventSubType])
    && (int v8 = self->_name != 0,
        [v5 name],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = v9 == 0,
        v9,
        v8 != v10))
  {
    name = self->_name;
    if (name)
    {
      v12 = [v5 name];
      char v13 = [(NSString *)name isEqual:v12];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IREventDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IREventDO *)self isEqualToEventDO:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IREventDO)initWithCoder:(id)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"eventType"];
  if (!v5)
  {
    id v15 = [v4 error];

    if (v15) {
      goto LABEL_10;
    }
    if (([v4 containsValueForKey:@"eventType"] & 1) == 0)
    {
      uint64_t v51 = *MEMORY[0x263F08320];
      v52[0] = @"Missing serialized value for IREventDO.eventType";
      id v16 = NSDictionary;
      id v17 = (__CFString **)v52;
      id v18 = &v51;
      goto LABEL_18;
    }
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"eventSubType"];
  if (v6)
  {
LABEL_3:
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v8 = (objc_class *)objc_opt_class();
        BOOL v9 = NSStringFromClass(v8);
        int v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IREventDO key \"name\" (expected %@, decoded %@)", v9, v11, 0];
        uint64_t v47 = *MEMORY[0x263F08320];
        v48 = v12;
        char v13 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IREventDOOCNTErrorDomain" code:3 userInfo:v13];
        [v4 failWithError:v14];
LABEL_25:

LABEL_26:
LABEL_27:
        uint64_t v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      v21 = [v4 error];

      if (v21)
      {
        uint64_t v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v22 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v22);
        v23 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v23);
        char v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IREventDO key \"bundleID\" (expected %@, decoded %@)", v11, v12, 0];
        uint64_t v45 = *MEMORY[0x263F08320];
        v46 = v13;
        v14 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v24 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IREventDOOCNTErrorDomain" code:3 userInfo:v14];
        [v4 failWithError:v24];
LABEL_24:

        goto LABEL_25;
      }
LABEL_21:
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v26);
          v27 = (objc_class *)objc_opt_class();
          char v13 = NSStringFromClass(v27);
          v14 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IREventDO key \"contextIdentifier\" (expected %@, decoded %@)", v12, v13, 0];
          uint64_t v43 = *MEMORY[0x263F08320];
          v44 = v14;
          v24 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          v28 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IREventDOOCNTErrorDomain" code:3 userInfo:v24];
          [v4 failWithError:v28];

          goto LABEL_24;
        }
      }
      else
      {
        v30 = [v4 error];

        if (v30) {
          goto LABEL_27;
        }
      }
      uint64_t v31 = [v4 decodeInt64ForKey:@"isOutsideApp"];
      if (v31) {
        goto LABEL_34;
      }
      v33 = [v4 error];

      if (v33) {
        goto LABEL_27;
      }
      if ([v4 containsValueForKey:@"isOutsideApp"])
      {
LABEL_34:
        uint64_t v32 = [v4 decodeInt64ForKey:@"isEligibleApp"];
        if (v32) {
          goto LABEL_35;
        }
        v37 = [v4 error];

        if (v37) {
          goto LABEL_27;
        }
        if ([v4 containsValueForKey:@"isEligibleApp"])
        {
LABEL_35:
          LOBYTE(v38) = v32 != 0;
          self = [(IREventDO *)self initWithEventType:v5 eventSubType:v6 name:v7 bundleID:v9 contextIdentifier:v11 isOutsideApp:v31 != 0 isEligibleApp:v38];
          uint64_t v20 = self;
          goto LABEL_28;
        }
        uint64_t v39 = *MEMORY[0x263F08320];
        v40 = @"Missing serialized value for IREventDO.isEligibleApp";
        v34 = NSDictionary;
        v35 = &v40;
        v36 = &v39;
      }
      else
      {
        uint64_t v41 = *MEMORY[0x263F08320];
        v42 = @"Missing serialized value for IREventDO.isOutsideApp";
        v34 = NSDictionary;
        v35 = &v42;
        v36 = &v41;
      }
      v12 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
      char v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IREventDOOCNTErrorDomain" code:1 userInfo:v12];
      [v4 failWithError:v13];
      goto LABEL_26;
    }
    v25 = [v4 error];

    if (!v25) {
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v20 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v19 = [v4 error];

  if (!v19)
  {
    if ([v4 containsValueForKey:@"eventSubType"]) {
      goto LABEL_3;
    }
    uint64_t v49 = *MEMORY[0x263F08320];
    v50 = @"Missing serialized value for IREventDO.eventSubType";
    id v16 = NSDictionary;
    id v17 = &v50;
    id v18 = &v49;
LABEL_18:
    uint64_t v7 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IREventDOOCNTErrorDomain" code:1 userInfo:v7];
    [v4 failWithError:v9];
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v20 = 0;
LABEL_31:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInt64:self->_eventType forKey:@"eventType"];
  [v8 encodeInt64:self->_eventSubType forKey:@"eventSubType"];
  name = self->_name;
  if (name) {
    [v8 encodeObject:name forKey:@"name"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v8 encodeObject:bundleID forKey:@"bundleID"];
  }
  contextIdentifier = self->_contextIdentifier;
  uint64_t v7 = v8;
  if (contextIdentifier)
  {
    [v8 encodeObject:contextIdentifier forKey:@"contextIdentifier"];
    uint64_t v7 = v8;
  }
  [v7 encodeInt64:self->_isOutsideApp forKey:@"isOutsideApp"];
  [v8 encodeInt64:self->_isEligibleApp forKey:@"isEligibleApp"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithLongLong:self->_eventType];
  uint64_t v5 = [NSNumber numberWithLongLong:self->_eventSubType];
  long long v11 = *(_OWORD *)&self->_name;
  contextIdentifier = self->_contextIdentifier;
  uint64_t v7 = [NSNumber numberWithBool:self->_isOutsideApp];
  id v8 = [NSNumber numberWithBool:self->_isEligibleApp];
  BOOL v9 = (void *)[v3 initWithFormat:@"<IREventDO | eventType:%@ eventSubType:%@ name:%@ bundleID:%@ contextIdentifier:%@ isOutsideApp:%@ isEligibleApp:%@>", v4, v5, v11, contextIdentifier, v7, v8];

  return v9;
}

- (int64_t)eventSubType
{
  return self->_eventSubType;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (BOOL)isOutsideApp
{
  return self->_isOutsideApp;
}

- (BOOL)isEligibleApp
{
  return self->_isEligibleApp;
}

@end