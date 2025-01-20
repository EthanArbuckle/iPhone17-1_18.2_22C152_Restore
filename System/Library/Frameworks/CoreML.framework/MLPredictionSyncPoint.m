@interface MLPredictionSyncPoint
- (MLPredictionSyncPoint)initWithSharedEvent:(id)a3 value:(unint64_t)a4;
- (MTLSharedEvent)sharedEvent;
- (unint64_t)value;
- (void)notify;
@end

@implementation MLPredictionSyncPoint

- (void).cxx_destruct
{
}

- (unint64_t)value
{
  return self->_value;
}

- (MTLSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (void)notify
{
  unint64_t v3 = [(MLPredictionSyncPoint *)self value];
  id v4 = [(MLPredictionSyncPoint *)self sharedEvent];
  [v4 setSignaledValue:v3];
}

- (MLPredictionSyncPoint)initWithSharedEvent:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLPredictionSyncPoint;
  v8 = [(MLPredictionSyncPoint *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sharedEvent, a3);
    v9->_value = a4;
  }

  return v9;
}

@end