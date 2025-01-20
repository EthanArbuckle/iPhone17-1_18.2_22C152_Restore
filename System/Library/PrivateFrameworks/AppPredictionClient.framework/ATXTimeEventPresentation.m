@interface ATXTimeEventPresentation
+ (BOOL)supportsSecureCoding;
- (ATXPinnedTimeEvent)pinnedTimeEvent;
- (ATXTimeEventPresentation)initWithCardIcon:(id)a3 fields:(id)a4 backgroundImageData:(id)a5 logoImageData:(id)a6 subtitleGlyph:(id)a7 allowsRescheduling:(BOOL)a8;
- (ATXTimeEventPresentation)initWithCardIcons:(id)a3 shouldOverlapIcons:(BOOL)a4 subtitleGlyph:(id)a5 hasCheckbox:(BOOL)a6 allowsRescheduling:(BOOL)a7;
- (ATXTimeEventPresentation)initWithCoder:(id)a3;
- (ATXTimeEventPresentation)initWithPinnedTimeEvent:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5;
- (ATXTimeEventPresentation)initWithRouteMapIcons:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5;
- (ATXTimeEventPresentation)initWithWidget:(id)a3 allowsRescheduling:(BOOL)a4;
- (ATXTimeScheduledWidget)widget;
- (BOOL)allowsRescheduling;
- (BOOL)hasCheckbox;
- (BOOL)overlapIcons;
- (BOOL)supportsRouteMap;
- (NSArray)fields;
- (NSArray)icons;
- (NSData)backgroundImageData;
- (NSData)logoImageData;
- (NSString)subtitleGlyph;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeEventPresentation

- (ATXTimeEventPresentation)initWithCardIcons:(id)a3 shouldOverlapIcons:(BOOL)a4 subtitleGlyph:(id)a5 hasCheckbox:(BOOL)a6 allowsRescheduling:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXTimeEventPresentation;
  v14 = [(ATXTimeEventPresentation *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    icons = v14->_icons;
    v14->_icons = (NSArray *)v15;

    v14->_overlapIcons = a4;
    uint64_t v17 = [v13 copy];
    subtitleGlyph = v14->_subtitleGlyph;
    v14->_subtitleGlyph = (NSString *)v17;

    v14->_hasCheckbox = a6;
    fields = v14->_fields;
    v14->_fields = (NSArray *)MEMORY[0x1E4F1CBF0];

    v14->_allowsRescheduling = a7;
  }

  return v14;
}

- (ATXTimeEventPresentation)initWithCardIcon:(id)a3 fields:(id)a4 backgroundImageData:(id)a5 logoImageData:(id)a6 subtitleGlyph:(id)a7 allowsRescheduling:(BOOL)a8
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)ATXTimeEventPresentation;
  v19 = [(ATXTimeEventPresentation *)&v27 init];
  if (v19)
  {
    v28[0] = v14;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    icons = v19->_icons;
    v19->_icons = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    fields = v19->_fields;
    v19->_fields = (NSArray *)v22;

    objc_storeStrong((id *)&v19->_backgroundImageData, a5);
    objc_storeStrong((id *)&v19->_logoImageData, a6);
    uint64_t v24 = [v18 copy];
    subtitleGlyph = v19->_subtitleGlyph;
    v19->_subtitleGlyph = (NSString *)v24;

    v19->_allowsRescheduling = a8;
  }

  return v19;
}

- (ATXTimeEventPresentation)initWithRouteMapIcons:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventPresentation;
  v10 = [(ATXTimeEventPresentation *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    icons = v10->_icons;
    v10->_icons = (NSArray *)v11;

    v10->_supportsRouteMap = 1;
    uint64_t v13 = [v9 copy];
    subtitleGlyph = v10->_subtitleGlyph;
    v10->_subtitleGlyph = (NSString *)v13;

    fields = v10->_fields;
    v10->_fields = (NSArray *)MEMORY[0x1E4F1CBF0];

    v10->_allowsRescheduling = a5;
  }

  return v10;
}

- (ATXTimeEventPresentation)initWithPinnedTimeEvent:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventPresentation;
  uint64_t v11 = [(ATXTimeEventPresentation *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pinnedTimeEvent, a3);
    uint64_t v13 = [v10 copy];
    subtitleGlyph = v12->_subtitleGlyph;
    v12->_subtitleGlyph = (NSString *)v13;

    fields = v12->_fields;
    v12->_fields = (NSArray *)MEMORY[0x1E4F1CBF0];

    v12->_allowsRescheduling = a5;
  }

  return v12;
}

- (ATXTimeEventPresentation)initWithWidget:(id)a3 allowsRescheduling:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXTimeEventPresentation;
  id v8 = [(ATXTimeEventPresentation *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_widget, a3);
    fields = v9->_fields;
    v9->_fields = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9->_allowsRescheduling = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  widget = self->_widget;
  id v5 = a3;
  [v5 encodeObject:widget forKey:@"widget"];
  [v5 encodeObject:self->_icons forKey:@"icons"];
  [v5 encodeBool:self->_supportsRouteMap forKey:@"routeMap"];
  [v5 encodeBool:self->_hasCheckbox forKey:@"hasCheckbox"];
  [v5 encodeBool:self->_overlapIcons forKey:@"overlapIcons"];
  [v5 encodeObject:self->_subtitleGlyph forKey:@"subtitleGlyph"];
  [v5 encodeObject:self->_pinnedTimeEvent forKey:@"pinnedTimeEvent"];
  [v5 encodeObject:self->_backgroundImageData forKey:@"backgroundImageData"];
  [v5 encodeObject:self->_logoImageData forKey:@"logoImageData"];
  [v5 encodeObject:self->_fields forKey:@"fields"];
  [v5 encodeBool:self->_allowsRescheduling forKey:@"allowsRescheduling"];
}

- (ATXTimeEventPresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ATXTimeEventPresentation;
  id v5 = [(ATXTimeEventPresentation *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
    widget = v5->_widget;
    v5->_widget = (ATXTimeScheduledWidget *)v6;

    id v8 = (void *)MEMORY[0x1AD0D3C30]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = self;
    objc_super v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, 0);

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"icons"];
    icons = v5->_icons;
    v5->_icons = (NSArray *)v13;

    v5->_supportsRouteMap = [v4 decodeBoolForKey:@"routeMap"];
    v5->_hasCheckbox = [v4 decodeBoolForKey:@"hasCheckbox"];
    v5->_overlapIcons = [v4 decodeBoolForKey:@"overlapIcons"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleGlyph"];
    subtitleGlyph = v5->_subtitleGlyph;
    v5->_subtitleGlyph = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedTimeEvent"];
    pinnedTimeEvent = v5->_pinnedTimeEvent;
    v5->_pinnedTimeEvent = (ATXPinnedTimeEvent *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundImageData"];
    backgroundImageData = v5->_backgroundImageData;
    v5->_backgroundImageData = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImageData"];
    logoImageData = v5->_logoImageData;
    v5->_logoImageData = (NSData *)v21;

    uint64_t v23 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"fields"];
    fields = v5->_fields;
    v5->_fields = (NSArray *)v23;

    v5->_allowsRescheduling = [v4 decodeBoolForKey:@"allowsRescheduling"];
  }

  return v5;
}

- (NSArray)icons
{
  return self->_icons;
}

- (BOOL)overlapIcons
{
  return self->_overlapIcons;
}

- (BOOL)hasCheckbox
{
  return self->_hasCheckbox;
}

- (NSData)backgroundImageData
{
  return self->_backgroundImageData;
}

- (NSData)logoImageData
{
  return self->_logoImageData;
}

- (NSArray)fields
{
  return self->_fields;
}

- (ATXTimeScheduledWidget)widget
{
  return self->_widget;
}

- (BOOL)supportsRouteMap
{
  return self->_supportsRouteMap;
}

- (ATXPinnedTimeEvent)pinnedTimeEvent
{
  return self->_pinnedTimeEvent;
}

- (NSString)subtitleGlyph
{
  return self->_subtitleGlyph;
}

- (BOOL)allowsRescheduling
{
  return self->_allowsRescheduling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleGlyph, 0);
  objc_storeStrong((id *)&self->_pinnedTimeEvent, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_logoImageData, 0);
  objc_storeStrong((id *)&self->_backgroundImageData, 0);

  objc_storeStrong((id *)&self->_icons, 0);
}

@end