@interface IAMValueEvent
- (IAMValueEvent)initWithName:(id)a3 value:(id)a4;
- (NSCopying)value;
- (void)setValue:(id)a3;
@end

@implementation IAMValueEvent

- (IAMValueEvent)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IAMValueEvent;
  v8 = [(IAMValueEvent *)&v11 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [(IAMEvent *)v8 setName:v9];

    [(IAMEvent *)v8 setType:1];
    [(IAMValueEvent *)v8 setValue:v7];
  }

  return v8;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSCopying)value
{
  return self->value;
}

@end