@interface APSPayloadMessageStatsCounts
- (APSPayloadMessageStatsCount)total;
- (APSPayloadMessageStatsCounts)init;
- (APSPayloadMessageStatsCountsByWakeState)byWakeState;
- (void)_appendPrettyStatusToStatusPrinter:(id)a3 time:(double)a4 type:(id)a5 direction:(id)a6;
- (void)appendPrettyStatusToStatusPrinter:(id)a3 total:(BOOL)a4 direction:(id)a5;
- (void)countTopic:(id)a3 now:(double)a4;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)setByWakeState:(id)a3;
- (void)setTotal:(id)a3;
@end

@implementation APSPayloadMessageStatsCounts

- (APSPayloadMessageStatsCounts)init
{
  v8.receiver = self;
  v8.super_class = (Class)APSPayloadMessageStatsCounts;
  v2 = [(APSPayloadMessageStatsCounts *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(APSPayloadMessageStatsCount);
    total = v2->_total;
    v2->_total = v3;

    v5 = objc_alloc_init(APSPayloadMessageStatsCountsByWakeState);
    byWakeState = v2->_byWakeState;
    v2->_byWakeState = v5;
  }
  return v2;
}

- (void)countTopic:(id)a3 now:(double)a4
{
  total = self->_total;
  id v7 = a3;
  [(APSPayloadMessageStatsCount *)total countTopic:v7 now:a4];
  [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState countTopic:v7 now:a4];
}

- (void)_appendPrettyStatusToStatusPrinter:(id)a3 time:(double)a4 type:(id)a5 direction:(id)a6
{
  if (a4 != 0.0)
  {
    id v10 = a3;
    id v11 = +[NSString stringWithFormat:@"last %@ wake %@ push", a5, a6];
    [v10 appendDescription:v11 timeIntervalValue:a4];
  }
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3 total:(BOOL)a4 direction:(id)a5
{
  BOOL v6 = a4;
  id v24 = a3;
  id v8 = a5;
  if ([(APSPayloadMessageStatsCount *)self->_total count])
  {
    if (v6) {
      CFStringRef v9 = @"total %@ push notifications";
    }
    else {
      CFStringRef v9 = @"%@ push notifications";
    }
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v8);
    objc_msgSend(v24, "appendDescription:unsignedIntegerValue:", v10, -[APSPayloadMessageStatsCount count](self->_total, "count"));
    id v11 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState fullWake];
    id v12 = [v11 count];

    v13 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState darkWake];
    unint64_t v14 = (unint64_t)[v13 count];

    v15 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState unknown];
    unint64_t v16 = (unint64_t)[v15 count];

    [v24 pushIndent];
    objc_msgSend(v24, "appendDescription:unsignedIntegerValue:", @"previous hour", -[APSPayloadMessageStatsCount sumOfBucketType:](self->_total, "sumOfBucketType:", 0));
    objc_msgSend(v24, "appendDescription:unsignedIntegerValue:", @"previous day", -[APSPayloadMessageStatsCount sumOfBucketType:](self->_total, "sumOfBucketType:", 1));
    if (v14 | v16)
    {
      if (v16)
      {
        v17 = +[NSString stringWithFormat:@"%llu/%llu/%llu", v12, v14, v16];
        CFStringRef v18 = @"full/dark/unknown";
      }
      else
      {
        v17 = +[NSString stringWithFormat:@"%llu/%llu", v12, v14];
        CFStringRef v18 = @"full/dark";
      }
      [v24 appendDescription:v18 stringValue:v17];

      v21 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState fullWake];
      [v21 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:](self, "_appendPrettyStatusToStatusPrinter:time:type:direction:", v24, @"full", v8);

      v22 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState darkWake];
      [v22 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:](self, "_appendPrettyStatusToStatusPrinter:time:type:direction:", v24, @"dark", v8);

      v23 = [(APSPayloadMessageStatsCountsByWakeState *)self->_byWakeState unknown];
      [v23 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:](self, "_appendPrettyStatusToStatusPrinter:time:type:direction:", v24, @"unknown", v8);

      v20 = v24;
    }
    else
    {
      if (v6) {
        +[NSString stringWithFormat:@"last %@ push notification", v8];
      }
      else {
      uint64_t v19 = +[NSString stringWithFormat:@"last %@ push", v8];
      }

      [(APSPayloadMessageStatsCount *)self->_total lastMessageTime];
      objc_msgSend(v24, "appendDescription:timeIntervalValue:", v19);
      v20 = v24;
      id v10 = (void *)v19;
    }
    [v20 popIndent];
  }
}

- (void)prepareForDarkWake
{
  byWakeState = self->_byWakeState;
  id v3 = [(APSPayloadMessageStatsCountsByWakeState *)byWakeState darkWake];
  [(APSPayloadMessageStatsCountsByWakeState *)byWakeState moveUnknownToDestination:v3];
}

- (void)prepareForFullWake
{
  byWakeState = self->_byWakeState;
  id v3 = [(APSPayloadMessageStatsCountsByWakeState *)byWakeState fullWake];
  [(APSPayloadMessageStatsCountsByWakeState *)byWakeState moveUnknownToDestination:v3];
}

- (APSPayloadMessageStatsCount)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
}

- (APSPayloadMessageStatsCountsByWakeState)byWakeState
{
  return self->_byWakeState;
}

- (void)setByWakeState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byWakeState, 0);
  objc_storeStrong((id *)&self->_total, 0);
}

@end