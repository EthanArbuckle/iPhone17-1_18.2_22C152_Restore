@interface IAMEvent
- (BOOL)matchesWithKey:(id)a3;
- (IAMEvent)initWithName:(id)a3 type:(int64_t)a4;
- (NSString)name;
- (int64_t)type;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IAMEvent

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

- (IAMEvent)initWithName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IAMEvent;
  v7 = [(IAMEvent *)&v10 init];
  if (v7)
  {
    v8 = (void *)[v6 copy];
    [(IAMEvent *)v7 setName:v8];

    [(IAMEvent *)v7 setType:a4];
  }

  return v7;
}

- (BOOL)matchesWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(IAMEvent *)self name];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

@end