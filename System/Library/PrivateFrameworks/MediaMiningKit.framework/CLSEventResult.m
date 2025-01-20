@interface CLSEventResult
+ (id)eventResultWithEvent:(id)a3 andConfidence:(float)a4;
- (BOOL)isSameEventAsResult:(id)a3;
- (CLSEvent)event;
- (float)confidence;
- (id)description;
- (void)mergeWithResult:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setEvent:(id)a3;
@end

@implementation CLSEventResult

- (void).cxx_destruct
{
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setEvent:(id)a3
{
}

- (CLSEvent)event
{
  return self->_event;
}

- (id)description
{
  v3 = NSString;
  v4 = [(CLSEvent *)self->_event title];
  v5 = [v3 stringWithFormat:@"[%@] (%f)", v4, self->_confidence];

  return v5;
}

- (void)mergeWithResult:(id)a3
{
  id v6 = a3;
  [v6 confidence];
  if (v4 > self->_confidence)
  {
    [v6 confidence];
    self->_confidence = v5;
  }
}

- (BOOL)isSameEventAsResult:(id)a3
{
  return 0;
}

+ (id)eventResultWithEvent:(id)a3 andConfidence:(float)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(CLSEventResult);
  [(CLSEventResult *)v6 setEvent:v5];

  *(float *)&double v7 = a4;
  [(CLSEventResult *)v6 setConfidence:v7];
  return v6;
}

@end