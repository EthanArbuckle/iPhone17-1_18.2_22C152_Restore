@interface _DKEvent(ATXMode)
- (double)atx_eventDuration;
- (id)atx_bundleID;
- (id)atx_endDate;
- (id)atx_mode;
- (id)atx_startDate;
@end

@implementation _DKEvent(ATXMode)

- (id)atx_startDate
{
  v2 = [a1 metadata];

  if (v2
    && ([a1 metadata],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKeyedSubscript:@"start"],
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    v5 = [a1 startDate];
  }
  return v5;
}

- (id)atx_endDate
{
  v2 = [a1 metadata];

  if (v2
    && ([a1 metadata],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKeyedSubscript:@"end"],
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    v5 = [a1 endDate];
  }
  return v5;
}

- (id)atx_mode
{
  v1 = [a1 value];
  v2 = [v1 stringValue];

  return v2;
}

- (id)atx_bundleID
{
  v1 = [a1 value];
  v2 = [v1 stringValue];

  return v2;
}

- (double)atx_eventDuration
{
  v2 = objc_msgSend(a1, "atx_endDate");
  v3 = objc_msgSend(a1, "atx_startDate");
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  return v5;
}

@end