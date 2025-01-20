@interface ATXWidgetEntityFeatures
- (ATXWidgetEntityFeatures)init;
- (NSNumber)parentAppGlobalPrior;
- (NSNumber)parentAppScore;
- (NSNumber)widgetGlobalPrior;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setParentAppGlobalPrior:(id)a3;
- (void)setParentAppScore:(id)a3;
- (void)setWidgetGlobalPrior:(id)a3;
@end

@implementation ATXWidgetEntityFeatures

- (ATXWidgetEntityFeatures)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXWidgetEntityFeatures;
  v2 = [(ATXWidgetEntityFeatures *)&v8 init];
  v3 = v2;
  if (v2)
  {
    parentAppScore = v2->_parentAppScore;
    v2->_parentAppScore = (NSNumber *)&unk_1F27F17B8;

    parentAppGlobalPrior = v3->_parentAppGlobalPrior;
    v3->_parentAppGlobalPrior = (NSNumber *)&unk_1F27F17B8;

    widgetGlobalPrior = v3->_widgetGlobalPrior;
    v3->_widgetGlobalPrior = (NSNumber *)&unk_1F27F17B8;
  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetEntityFeatures;
  v5 = [(ATXWidgetEntityFeatures *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"parentAppScore"];
    parentAppScore = v5->_parentAppScore;
    v5->_parentAppScore = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"parentAppGlobalPrior"];
    parentAppGlobalPrior = v5->_parentAppGlobalPrior;
    v5->_parentAppGlobalPrior = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"widgetGlobalPrior"];
    widgetGlobalPrior = v5->_widgetGlobalPrior;
    v5->_widgetGlobalPrior = (NSNumber *)v10;
  }
  return v5;
}

- (id)jsonRepresentation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)&self->_parentAppScore;
  v5[0] = @"parentAppScore";
  v5[1] = @"parentAppGlobalPrior";
  long long v6 = v2;
  v5[2] = @"widgetGlobalPrior";
  widgetGlobalPrior = self->_widgetGlobalPrior;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:v5 count:3];
  return v3;
}

- (NSNumber)parentAppScore
{
  return self->_parentAppScore;
}

- (void)setParentAppScore:(id)a3
{
}

- (NSNumber)parentAppGlobalPrior
{
  return self->_parentAppGlobalPrior;
}

- (void)setParentAppGlobalPrior:(id)a3
{
}

- (NSNumber)widgetGlobalPrior
{
  return self->_widgetGlobalPrior;
}

- (void)setWidgetGlobalPrior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGlobalPrior, 0);
  objc_storeStrong((id *)&self->_parentAppGlobalPrior, 0);
  objc_storeStrong((id *)&self->_parentAppScore, 0);
}

@end