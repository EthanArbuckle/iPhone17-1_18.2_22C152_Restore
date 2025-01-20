@interface CLKComplicationPreviewTimelineEntry
+ (BOOL)supportsSecureCoding;
- (CLKComplicationPreviewTimelineEntry)init;
- (CLKComplicationPreviewTimelineEntry)initWithCoder:(id)a3;
- (NSArray)errors;
- (NSArray)selectableRegions;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)previewFaceColor;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setErrors:(id)a3;
- (void)setPreviewFaceColor:(int64_t)a3;
- (void)setSelectableRegions:(id)a3;
@end

@implementation CLKComplicationPreviewTimelineEntry

- (CLKComplicationPreviewTimelineEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  v2 = [(CLKComplicationPreviewTimelineEntry *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(CLKComplicationPreviewTimelineEntry *)v2 setErrors:v3];

    v4 = objc_opt_new();
    [(CLKComplicationPreviewTimelineEntry *)v2 setSelectableRegions:v4];
  }
  return v2;
}

- (void)finalize
{
  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  [(CLKComplicationTimelineEntry *)&v4 finalize];
  v3 = [(CLKComplicationTimelineEntry *)self complicationTemplate];
  [v3 setRenderForPreviews:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  id v4 = a3;
  [(CLKComplicationTimelineEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_previewFaceColor, @"previewFaceColor", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_errors forKey:@"errors"];
  [v4 encodeObject:self->_selectableRegions forKey:@"selectableRegions"];
}

- (CLKComplicationPreviewTimelineEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  objc_super v5 = [(CLKComplicationTimelineEntry *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_previewFaceColor = [v4 decodeIntegerForKey:@"previewFaceColor"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectableRegions"];
    selectableRegions = v5->_selectableRegions;
    v5->_selectableRegions = (NSArray *)v8;
  }
  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationPreviewTimelineEntry;
  id v4 = [(CLKComplicationTimelineEntry *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ preview face color = %ld", v4, self->_previewFaceColor];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(CLKComplicationTimelineEntry *)self finalized])
  {
    return self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CLKComplicationPreviewTimelineEntry;
    id v5 = [(CLKComplicationTimelineEntry *)&v7 copyWithZone:a3];
    [v5 setPreviewFaceColor:self->_previewFaceColor];
    [v5 setErrors:self->_errors];
    [v5 setSelectableRegions:self->_selectableRegions];
    return v5;
  }
}

- (int64_t)previewFaceColor
{
  return self->_previewFaceColor;
}

- (void)setPreviewFaceColor:(int64_t)a3
{
  self->_previewFaceColor = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)selectableRegions
{
  return self->_selectableRegions;
}

- (void)setSelectableRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectableRegions, 0);

  objc_storeStrong((id *)&self->_errors, 0);
}

@end