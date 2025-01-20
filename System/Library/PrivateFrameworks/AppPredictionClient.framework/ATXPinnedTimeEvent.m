@interface ATXPinnedTimeEvent
+ (BOOL)supportsSecureCoding;
+ (UTType)uniformType;
- (ATXPinnedTimeEvent)initWithCoder:(id)a3;
- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8;
- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8 date:(id)a9 label:(id)a10;
- (ATXPinnedTimeEvent)initWithURL:(id)a3 sourceBundleIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 summary:(id)a7 location:(id)a8 siteName:(id)a9 durationHint:(double)a10 actions:(id)a11;
- (ATXTimeEventIcon)icon;
- (ATXTimeEventLocation)location;
- (NSArray)actions;
- (NSData)iconData;
- (NSDate)date;
- (NSString)label;
- (NSString)siteName;
- (NSString)sourceBundleIdentifier;
- (NSString)summary;
- (NSString)title;
- (NSURL)url;
- (NSUUID)uuid;
- (double)durationHint;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXPinnedTimeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UTType)uniformType
{
  return (UTType *)[MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.proactive.pinnedTimeEvent" conformingToType:*MEMORY[0x1E4F44408]];
}

- (ATXPinnedTimeEvent)initWithURL:(id)a3 sourceBundleIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 summary:(id)a7 location:(id)a8 siteName:(id)a9 durationHint:(double)a10 actions:(id)a11
{
  id v43 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a11;
  v44.receiver = self;
  v44.super_class = (Class)ATXPinnedTimeEvent;
  v26 = [(ATXPinnedTimeEvent *)&v44 init];
  if (v26)
  {
    uint64_t v27 = [MEMORY[0x1E4F29128] UUID];
    uuid = v26->_uuid;
    v26->_uuid = (NSUUID *)v27;

    v26->_eventType = 0;
    objc_storeStrong((id *)&v26->_url, a3);
    uint64_t v29 = [v21 copy];
    title = v26->_title;
    v26->_title = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    sourceBundleIdentifier = v26->_sourceBundleIdentifier;
    v26->_sourceBundleIdentifier = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    iconData = v26->_iconData;
    v26->_iconData = (NSData *)v33;

    uint64_t v35 = [v22 copy];
    summary = v26->_summary;
    v26->_summary = (NSString *)v35;

    objc_storeStrong((id *)&v26->_location, a8);
    uint64_t v37 = [v24 copy];
    siteName = v26->_siteName;
    v26->_siteName = (NSString *)v37;

    v26->_durationHint = a10;
    uint64_t v39 = [v25 copy];
    actions = v26->_actions;
    v26->_actions = (NSArray *)v39;

    v41 = v26;
  }

  return v26;
}

- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ATXPinnedTimeEvent;
  id v19 = [(ATXPinnedTimeEvent *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    v19->_eventType = 1;
    uint64_t v22 = [v14 copy];
    title = v19->_title;
    v19->_title = (NSString *)v22;

    objc_storeStrong((id *)&v19->_icon, a4);
    objc_storeStrong((id *)&v19->_location, a5);
    uint64_t v24 = [v17 copy];
    sourceBundleIdentifier = v19->_sourceBundleIdentifier;
    v19->_sourceBundleIdentifier = (NSString *)v24;

    v19->_durationHint = a7;
    uint64_t v26 = [v18 copy];
    actions = v19->_actions;
    v19->_actions = (NSArray *)v26;

    v28 = v19;
  }

  return v19;
}

- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8 date:(id)a9 label:(id)a10
{
  id v17 = a3;
  id v38 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)ATXPinnedTimeEvent;
  id v23 = [(ATXPinnedTimeEvent *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [MEMORY[0x1E4F29128] UUID];
    uuid = v23->_uuid;
    v23->_uuid = (NSUUID *)v24;

    v23->_eventType = 2;
    uint64_t v26 = [v17 copy];
    title = v23->_title;
    v23->_title = (NSString *)v26;

    objc_storeStrong((id *)&v23->_icon, a4);
    objc_storeStrong((id *)&v23->_location, a5);
    uint64_t v28 = [v19 copy];
    sourceBundleIdentifier = v23->_sourceBundleIdentifier;
    v23->_sourceBundleIdentifier = (NSString *)v28;

    v23->_durationHint = a7;
    uint64_t v30 = [v20 copy];
    actions = v23->_actions;
    v23->_actions = (NSArray *)v30;

    uint64_t v32 = [v21 copy];
    date = v23->_date;
    v23->_date = (NSDate *)v32;

    uint64_t v34 = [v22 copy];
    label = v23->_label;
    v23->_label = (NSString *)v34;

    v36 = v23;
  }

  return v23;
}

- (ATXPinnedTimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"eventType"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceBundleIdentifier"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [v4 decodeDoubleForKey:@"durationHint"];
    if (v9 == 0.0) {
      double v10 = 1800.0;
    }
    else {
      double v10 = v9;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
    v13 = (void *)v12;
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      id v14 = (void *)v12;
    }
    id v15 = v14;

    if (v6 == 2)
    {
      uint64_t v29 = v7;
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
      uuid = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
      if (v24)
      {
        id v25 = [(ATXPinnedTimeEvent *)self initWithTitle:v8 icon:v24 location:v11 sourceBundleIdentifier:v29 durationHint:v15 actions:uuid date:v10 label:v16];
        self = v25;
        if (v25) {
          objc_storeStrong((id *)&v25->_uuid, v5);
        }
        id v23 = self;
      }
      else
      {
        id v23 = 0;
      }

      goto LABEL_27;
    }
    if (v6 == 1)
    {
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
      if (v16)
      {
        self = [(ATXPinnedTimeEvent *)self initWithTitle:v8 icon:v16 location:v11 sourceBundleIdentifier:v7 durationHint:v15 actions:v10];
        if (!self)
        {
          id v23 = 0;
          goto LABEL_28;
        }
        uint64_t v29 = v7;
        uint64_t v26 = v5;
        uuid = self->_uuid;
        self->_uuid = v26;
        goto LABEL_22;
      }
    }
    else
    {
      if (v6)
      {
        id v23 = 0;
LABEL_29:

        goto LABEL_30;
      }
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
      if (v16)
      {
        [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
        uint64_t v28 = v8;
        uuid = id v17 = v7;
        id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summary"];
        id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siteName"];
        uint64_t v29 = v17;
        id v21 = v17;
        v8 = v28;
        id v22 = [(ATXPinnedTimeEvent *)self initWithURL:v16 sourceBundleIdentifier:v21 iconData:uuid title:v28 summary:v19 location:v11 siteName:v10 durationHint:v20 actions:v15];
        self = v22;
        if (v22) {
          objc_storeStrong((id *)&v22->_uuid, v5);
        }

LABEL_22:
        id v23 = self;
LABEL_27:

        v7 = v29;
        goto LABEL_28;
      }
    }
    id v23 = 0;
LABEL_28:

    goto LABEL_29;
  }
  id v23 = 0;
LABEL_30:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType = self->_eventType;
  id v5 = a3;
  [v5 encodeInteger:eventType forKey:@"eventType"];
  [v5 encodeObject:self->_sourceBundleIdentifier forKey:@"sourceBundleIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_iconData forKey:@"iconData"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_siteName forKey:@"siteName"];
  [v5 encodeObject:self->_summary forKey:@"summary"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeDouble:@"durationHint" forKey:self->_durationHint];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_label forKey:@"label"];
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (double)durationHint
{
  return self->_durationHint;
}

- (ATXTimeEventLocation)location
{
  return self->_location;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)label
{
  return self->_label;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (ATXTimeEventIcon)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end