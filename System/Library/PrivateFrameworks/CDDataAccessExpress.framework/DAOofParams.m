@interface DAOofParams
- (BOOL)isEnabled;
- (DAOofParams)initWithDictionary:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)externalMessage;
- (NSString)message;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationForASSettingTask;
- (int)externalState;
- (int)oofState;
- (void)enableOof:(BOOL)a3 From:(id)a4 to:(id)a5 withMessage:(id)a6;
- (void)setEndTime:(id)a3;
- (void)setExternalMessage:(id)a3;
- (void)setExternalState:(int)a3;
- (void)setMessage:(id)a3;
- (void)setOofState:(int)a3;
- (void)setStartTime:(id)a3;
@end

@implementation DAOofParams

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(DAOofParams *)self oofState];
  v5 = [(DAOofParams *)self startTime];
  v6 = [(DAOofParams *)self endTime];
  v7 = [(DAOofParams *)self message];
  uint64_t v8 = [(DAOofParams *)self externalState];
  v9 = [(DAOofParams *)self externalMessage];
  v10 = [v3 stringWithFormat:@"oofState:%d startTime:%@ endTime:%@ message:%@ externalState:%d externalMessage:%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (DAOofParams)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAOofParams;
  v5 = [(DAOofParams *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"kDASettingsOofStateKey"];

    if (v6)
    {
      v7 = [v4 objectForKey:@"kDASettingsOofStateKey"];
      -[DAOofParams setOofState:](v5, "setOofState:", [v7 intValue]);
    }
    uint64_t v8 = [v4 objectForKey:@"kDASettingsStartTimeKey"];
    [(DAOofParams *)v5 setStartTime:v8];

    v9 = [v4 objectForKey:@"kDASettingsEndTimeKey"];
    [(DAOofParams *)v5 setEndTime:v9];

    v10 = [v4 objectForKey:@"kDASettingsOofInternalMessageKey"];
    [(DAOofParams *)v5 setMessage:v10];

    v11 = [v4 objectForKey:@"kDASettingsOofExternalStateKey"];

    if (v11)
    {
      v12 = [v4 objectForKey:@"kDASettingsOofExternalStateKey"];
      -[DAOofParams setExternalState:](v5, "setExternalState:", [v12 intValue]);
    }
    v13 = [v4 objectForKey:@"kDASettingsOofExternalMessageKey"];
    [(DAOofParams *)v5 setExternalMessage:v13];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[DAOofParams oofState](self, "oofState"));
  [v3 setObject:v4 forKeyedSubscript:@"kDASettingsOofStateKey"];

  v5 = [(DAOofParams *)self startTime];

  if (v5)
  {
    v6 = [(DAOofParams *)self startTime];
    [v3 setObject:v6 forKeyedSubscript:@"kDASettingsStartTimeKey"];
  }
  v7 = [(DAOofParams *)self endTime];

  if (v7)
  {
    uint64_t v8 = [(DAOofParams *)self endTime];
    [v3 setObject:v8 forKeyedSubscript:@"kDASettingsEndTimeKey"];
  }
  v9 = [(DAOofParams *)self message];

  if (v9)
  {
    v10 = [(DAOofParams *)self message];
    [v3 setObject:v10 forKeyedSubscript:@"kDASettingsOofInternalMessageKey"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[DAOofParams externalState](self, "externalState"));
  [v3 setObject:v11 forKeyedSubscript:@"kDASettingsOofExternalStateKey"];

  v12 = [(DAOofParams *)self externalMessage];

  if (v12)
  {
    v13 = [(DAOofParams *)self externalMessage];
    [v3 setObject:v13 forKeyedSubscript:@"kDASettingsOofExternalMessageKey"];
  }

  return v3;
}

- (id)dictionaryRepresentationForASSettingTask
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[DAOofParams oofState](self, "oofState"));
  v27 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"kDASettingsOofStateKey"];

  v5 = objc_opt_new();
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  objc_msgSend(v5, "setLocale:");
  [v5 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.000Z'"];
  v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v5 setTimeZone:v6];

  v7 = [(DAOofParams *)self startTime];

  if (v7)
  {
    uint64_t v8 = [(DAOofParams *)self startTime];
    v9 = [v5 stringFromDate:v8];
    [v27 setObject:v9 forKeyedSubscript:@"kDASettingsStartTimeKey"];
  }
  v10 = [(DAOofParams *)self endTime];

  if (v10)
  {
    v11 = [(DAOofParams *)self endTime];
    v12 = [v5 stringFromDate:v11];
    [v27 setObject:v12 forKeyedSubscript:@"kDASettingsEndTimeKey"];
  }
  v13 = objc_opt_new();
  v14 = [(DAOofParams *)self message];

  if (v14)
  {
    objc_super v15 = objc_opt_new();
    [v15 setObject:&unk_1F23283A8 forKeyedSubscript:@"kDASettingsAudienceKey"];
    [v15 setObject:&unk_1F23283C0 forKeyedSubscript:@"kDASettingsEnabledKey"];
    v16 = [(DAOofParams *)self message];
    [v15 setObject:v16 forKeyedSubscript:@"kDASettingsReplyMessageKey"];

    [v15 setObject:@"TEXT" forKeyedSubscript:@"kDASettingsBodyTypeKey"];
    [v13 addObject:v15];
  }
  v17 = [(DAOofParams *)self externalMessage];

  if (v17)
  {
    v18 = objc_opt_new();
    [v18 setObject:&unk_1F23283C0 forKeyedSubscript:@"kDASettingsAudienceKey"];
    if ([(DAOofParams *)self externalState]) {
      v19 = &unk_1F23283C0;
    }
    else {
      v19 = &unk_1F23283A8;
    }
    [v18 setObject:v19 forKeyedSubscript:@"kDASettingsEnabledKey"];
    v20 = [(DAOofParams *)self externalMessage];
    [v18 setObject:v20 forKeyedSubscript:@"kDASettingsReplyMessageKey"];

    [v18 setObject:@"TEXT" forKeyedSubscript:@"kDASettingsBodyTypeKey"];
    [v13 addObject:v18];
    v21 = objc_opt_new();
    [v21 setObject:&unk_1F23283D8 forKeyedSubscript:@"kDASettingsAudienceKey"];
    if ([(DAOofParams *)self externalState] == 2) {
      v22 = &unk_1F23283C0;
    }
    else {
      v22 = &unk_1F23283A8;
    }
    [v21 setObject:v22 forKeyedSubscript:v25];
    v23 = [(DAOofParams *)self externalMessage];
    [v21 setObject:v23 forKeyedSubscript:@"kDASettingsReplyMessageKey"];

    [v21 setObject:@"TEXT" forKeyedSubscript:@"kDASettingsBodyTypeKey"];
    [v13 addObject:v21];
  }
  [v27 setObject:v13 forKeyedSubscript:@"kDASettingsOofMessagesKey"];

  return v27;
}

- (BOOL)isEnabled
{
  return [(DAOofParams *)self oofState] != 0;
}

- (void)enableOof:(BOOL)a3 From:(id)a4 to:(id)a5 withMessage:(id)a6
{
  if (a3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = a6;
  id v10 = a5;
  id v11 = a4;
  [(DAOofParams *)self setOofState:v9];
  [(DAOofParams *)self setStartTime:v11];

  [(DAOofParams *)self setEndTime:v10];
  [(DAOofParams *)self setMessage:v12];
}

- (int)oofState
{
  return self->_oofState;
}

- (void)setOofState:(int)a3
{
  self->_oofState = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int)externalState
{
  return self->_externalState;
}

- (void)setExternalState:(int)a3
{
  self->_externalState = a3;
}

- (NSString)externalMessage
{
  return self->_externalMessage;
}

- (void)setExternalMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end