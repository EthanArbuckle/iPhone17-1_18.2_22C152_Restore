@interface CLSTemporalClusterEvent
+ (unsigned)_categoryFromPortraitEventCategory:(unsigned __int8)a3;
- (CLSTemporalClusterEvent)initWithName:(id)a3 category:(unsigned __int8)a4;
- (CLSTemporalClusterEvent)initWithPortraitEvent:(id)a3;
- (NSString)name;
- (unsigned)category;
@end

@implementation CLSTemporalClusterEvent

- (void).cxx_destruct
{
}

- (unsigned)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (CLSTemporalClusterEvent)initWithName:(id)a3 category:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSTemporalClusterEvent;
  v8 = [(CLSTemporalClusterEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_category = a4;
  }

  return v9;
}

- (CLSTemporalClusterEvent)initWithPortraitEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSTemporalClusterEvent;
  v5 = [(CLSTemporalClusterEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_category = objc_msgSend((id)objc_opt_class(), "_categoryFromPortraitEventCategory:", objc_msgSend(v4, "suggestedEventCategory"));
  }

  return v5;
}

+ (unsigned)_categoryFromPortraitEventCategory:(unsigned __int8)a3
{
  if (a3 == 8) {
    return 1;
  }
  else {
    return 2 * (a3 == 12);
  }
}

@end