@interface ATXModeTimelineData
- (ATXModeTimelineData)init;
- (NSArray)modeTimeline;
- (id)dictionaryRepresentation;
- (void)setModeTimeline:(id)a3;
@end

@implementation ATXModeTimelineData

- (ATXModeTimelineData)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXModeTimelineData;
  v2 = [(ATXModeTimelineData *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(ATXModeTimelineData *)v2 setModeTimeline:v3];
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"modeTimeline";
  v2 = [(ATXModeTimelineData *)self modeTimeline];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSArray)modeTimeline
{
  return self->_modeTimeline;
}

- (void)setModeTimeline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end