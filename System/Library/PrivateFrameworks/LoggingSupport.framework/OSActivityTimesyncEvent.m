@interface OSActivityTimesyncEvent
- (OSActivityTimesyncEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
@end

@implementation OSActivityTimesyncEvent

- (OSActivityTimesyncEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)OSActivityTimesyncEvent;
  v4 = [(OSActivityTimesyncEvent *)&v12 init];
  if (v4)
  {
    unint64_t var12 = a3->var8.var2.var12;
    if ((var12 & 1) == 0)
    {
      if (a3->var8.var8.var12)
      {
        v6 = "=== system wallclock time adjusted";
LABEL_15:
        [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:v6 persisted:1];
        return v4;
      }
      memset(out, 0, 37);
      uuid_unparse_upper(a3->var8.var8.var10, out);
      v11 = out;
      v9 = "=== system boot: %s";
LABEL_14:
      v6 = __str;
      snprintf(__str, 0x80uLL, v9, v11);
      goto LABEL_15;
    }
    if ((var12 & 2) == 0)
    {
      unsigned int var14 = a3->var8.var8.var14;
      if (var14 <= 6)
      {
        if (var14 == 1)
        {
          v8 = "TTL less than 1 day";
          goto LABEL_12;
        }
        if (var14 == 3)
        {
          v8 = "TTL less than 3 days";
          goto LABEL_12;
        }
      }
      else
      {
        switch(var14)
        {
          case 7u:
            v8 = "TTL less than 7 days";
            goto LABEL_12;
          case 0xEu:
            v8 = "TTL less than 14 days";
            goto LABEL_12;
          case 0x1Eu:
            v8 = "TTL more than 14 days";
LABEL_12:
            v11 = (char *)v8;
            v9 = "=== log class: %s begins";
            goto LABEL_14;
        }
      }
      v8 = "persist";
      goto LABEL_12;
    }
    v8 = "in-memory";
    goto LABEL_12;
  }
  return v4;
}

@end