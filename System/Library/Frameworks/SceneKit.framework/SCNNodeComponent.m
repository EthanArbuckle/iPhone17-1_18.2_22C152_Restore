@interface SCNNodeComponent
- (SCNNodeComponent)initWithType:(int64_t)a3 component:(id)a4;
- (SCNNodeComponent)next;
- (id)component;
- (int64_t)type;
- (void)setComponent:(id)a3;
- (void)setNext:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SCNNodeComponent

- (void)setNext:(id)a3
{
}

- (SCNNodeComponent)initWithType:(int64_t)a3 component:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCNNodeComponent;
  v7 = [(SCNNodeComponent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SCNNodeComponent *)v7 setType:a3];
    [(SCNNodeComponent *)v8 setComponent:v6];
  }

  return v8;
}

- (void)setComponent:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->type = a3;
}

- (int64_t)type
{
  return self->type;
}

- (id)component
{
  return self->component;
}

- (SCNNodeComponent)next
{
  return self->next;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);

  objc_storeStrong(&self->component, 0);
}

@end