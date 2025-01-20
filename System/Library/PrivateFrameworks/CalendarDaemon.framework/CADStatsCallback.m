@interface CADStatsCallback
- (CADStatsCallback)initWithEventName:(id)a3 callback:(id)a4;
- (id)eventDictionaries;
- (id)eventName;
@end

@implementation CADStatsCallback

- (CADStatsCallback)initWithEventName:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADStatsCallback;
  v8 = [(CADStatsCallback *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [@"cadstats." stringByAppendingString:v6];
    eventName = v8->_eventName;
    v8->_eventName = (NSString *)v9;

    uint64_t v11 = MEMORY[0x1C1867AB0](v7);
    id callback = v8->_callback;
    v8->_id callback = (id)v11;
  }
  return v8;
}

- (id)eventName
{
  return self->_eventName;
}

- (id)eventDictionaries
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  (*((void (**)(void))self->_callback + 2))();
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end