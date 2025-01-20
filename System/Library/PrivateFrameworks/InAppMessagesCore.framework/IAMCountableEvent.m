@interface IAMCountableEvent
- (IAMCountableEvent)initWithName:(id)a3;
@end

@implementation IAMCountableEvent

- (IAMCountableEvent)initWithName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IAMCountableEvent;
  v5 = [(IAMCountableEvent *)&v8 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    [(IAMEvent *)v5 setName:v6];

    [(IAMEvent *)v5 setType:0];
  }

  return v5;
}

@end