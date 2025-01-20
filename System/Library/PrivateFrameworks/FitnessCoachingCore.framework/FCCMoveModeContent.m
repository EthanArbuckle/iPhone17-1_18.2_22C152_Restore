@interface FCCMoveModeContent
- (FCCMoveModeContent)initWithNotificationType:(int64_t)a3 nextActivityMoveMode:(int64_t)a4 nextActivityMoveModeStartDate:(id)a5 delay:(double)a6;
- (FCCMoveModeContent)initWithTransportData:(id)a3;
- (NSDate)nextActivityMoveModeStartDate;
- (NSString)description;
- (double)delay;
- (id)transportData;
- (int64_t)nextActivityMoveMode;
- (int64_t)notificationType;
@end

@implementation FCCMoveModeContent

- (FCCMoveModeContent)initWithNotificationType:(int64_t)a3 nextActivityMoveMode:(int64_t)a4 nextActivityMoveModeStartDate:(id)a5 delay:(double)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCCMoveModeContent;
  v12 = [(FCCMoveModeContent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_notificationType = a3;
    v12->_nextActivityMoveMode = a4;
    objc_storeStrong((id *)&v12->_nextActivityMoveModeStartDate, a5);
    v13->_delay = a6;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCMoveModeContent: notificationType %ld nextActivityMoveMode %ld nextActivityMoveModeStartDate %@ delay %f@", self->_notificationType, self->_nextActivityMoveMode, self->_nextActivityMoveModeStartDate, *(void *)&self->_delay];
}

- (FCCMoveModeContent)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCMoveModeProtobuf alloc] initWithData:v4];

  uint64_t v6 = [(FCCMoveModeProtobuf *)v5 notificationType];
  uint64_t v7 = [(FCCMoveModeProtobuf *)v5 nextActivityMoveMode];
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [(FCCMoveModeProtobuf *)v5 nextActivityMoveModeStartDate];
  v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = [(FCCMoveModeContent *)self initWithNotificationType:v6 nextActivityMoveMode:v7 nextActivityMoveModeStartDate:v9 delay:(double)[(FCCMoveModeProtobuf *)v5 delay]];

  return v10;
}

- (id)transportData
{
  v3 = objc_alloc_init(FCCMoveModeProtobuf);
  [(FCCMoveModeProtobuf *)v3 setNotificationType:self->_notificationType];
  [(FCCMoveModeProtobuf *)v3 setNextActivityMoveMode:self->_nextActivityMoveMode];
  [(NSDate *)self->_nextActivityMoveModeStartDate timeIntervalSinceReferenceDate];
  -[FCCMoveModeProtobuf setNextActivityMoveModeStartDate:](v3, "setNextActivityMoveModeStartDate:");
  [(FCCMoveModeProtobuf *)v3 setDelay:(int)self->_delay];
  id v4 = [(FCCMoveModeProtobuf *)v3 data];

  return v4;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (int64_t)nextActivityMoveMode
{
  return self->_nextActivityMoveMode;
}

- (NSDate)nextActivityMoveModeStartDate
{
  return self->_nextActivityMoveModeStartDate;
}

- (double)delay
{
  return self->_delay;
}

- (void).cxx_destruct
{
}

@end