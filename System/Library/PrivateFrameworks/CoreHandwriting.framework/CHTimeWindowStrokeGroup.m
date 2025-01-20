@interface CHTimeWindowStrokeGroup
- (CHTimeWindowStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 startTimestamp:(double)a7 endTimestamp:(double)a8;
- (double)endTimestamp;
- (double)startTimestamp;
- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 startTimestamp:(double)a8 endTimestamp:(double)a9;
@end

@implementation CHTimeWindowStrokeGroup

- (CHTimeWindowStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 startTimestamp:(double)a7 endTimestamp:(double)a8
{
  v11.receiver = self;
  v11.super_class = (Class)CHTimeWindowStrokeGroup;
  result = [(CHStrokeGroup *)&v11 initWithStrokeIdentifiers:a3, a4, a5, 1, @"timeWindowStrategy", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 1.0, a6.origin.x, a6.origin.y firstStrokeIdentifier lastStrokeIdentifier bounds classification groupingConfidence strategyIdentifier firstStrokeOrigin];
  if (result)
  {
    result->_startTimestamp = a7;
    result->_endTimestamp = a8;
  }
  return result;
}

- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 startTimestamp:(double)a8 endTimestamp:(double)a9
{
  v13.receiver = self;
  v13.super_class = (Class)CHTimeWindowStrokeGroup;
  -[CHStrokeGroup groupByAddingStrokeIdentifiers:removingStrokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:firstStrokeOrigin:](&v13, sel_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_, a3, a4, a5, a6, 1, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, 1.0, a7.origin.x, a7.origin.y);
  objc_super v11 = (double *)objc_claimAutoreleasedReturnValue();
  v11[17] = a8;
  v11[18] = a9;
  return v11;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

@end