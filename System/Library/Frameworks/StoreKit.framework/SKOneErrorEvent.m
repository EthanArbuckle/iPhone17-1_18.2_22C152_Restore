@interface SKOneErrorEvent
- (id)createPayload;
- (id)eventName;
@end

@implementation SKOneErrorEvent

- (id)eventName
{
  return @"com.apple.storekit.skoneerrorencountered";
}

- (id)createPayload
{
  v12.receiver = self;
  v12.super_class = (Class)SKOneErrorEvent;
  v3 = [(SKBaseErrorEvent *)&v12 createPayload];
  v4 = (void *)[v3 mutableCopy];

  if (v4)
  {
    v5 = [(SKBaseErrorEvent *)self mappedError];
    v6 = [v5 domain];
    int v7 = [v6 isEqualToString:@"SKErrorDomain"];

    if (v7)
    {
      v8 = NSNumber;
      v9 = [(SKBaseErrorEvent *)self mappedError];
      v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "code"));
      [v4 setObject:v10 forKeyedSubscript:0x1F08A9120];
    }
  }

  return v4;
}

@end