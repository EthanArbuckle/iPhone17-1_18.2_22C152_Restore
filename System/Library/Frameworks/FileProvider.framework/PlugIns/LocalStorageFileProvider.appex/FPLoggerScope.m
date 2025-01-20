@interface FPLoggerScope
- (FPLoggerScope)init;
- (id)adopt;
- (id)enter;
- (id)fork;
- (id)leave;
@end

@implementation FPLoggerScope

- (FPLoggerScope)init
{
  self->section = __fp_create_section();
  return self;
}

- (id)enter
{
  v3 = [FPPublicLog alloc];
  v4 = +[NSString stringWithFormat:@"┏%llx", self->section];
  v5 = [(FPPublicLog *)v3 initWithString:v4];

  return v5;
}

- (id)leave
{
  v3 = [FPPublicLog alloc];
  v4 = +[NSString stringWithFormat:@"┗%llx", self->section];
  v5 = [(FPPublicLog *)v3 initWithString:v4];

  return v5;
}

- (id)adopt
{
  v3 = [FPPublicLog alloc];
  v4 = +[NSString stringWithFormat:@"┳%llx", self->section];
  v5 = [(FPPublicLog *)v3 initWithString:v4];

  return v5;
}

- (id)fork
{
  v3 = [FPPublicLog alloc];
  v4 = +[NSString stringWithFormat:@"┣%llx", self->section];
  v5 = [(FPPublicLog *)v3 initWithString:v4];

  return v5;
}

@end