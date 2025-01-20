@interface DTKPCPUEvent
- (DTKPCPUEvent)initWithName:(id)a3 alias:(id)a4 definition:(id)a5 kpepEvent:(kpep_event *)a6;
- (NSString)alias;
- (NSString)aliasOrName;
- (NSString)definition;
- (NSString)displayName;
- (NSString)name;
- (id)description;
- (kpep_event)kpepEvent;
- (void)setAlias:(id)a3;
@end

@implementation DTKPCPUEvent

- (DTKPCPUEvent)initWithName:(id)a3 alias:(id)a4 definition:(id)a5 kpepEvent:(kpep_event *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DTKPCPUEvent;
  v13 = [(DTKPCPUEvent *)&v23 init];
  if (v13)
  {
    if (![v10 length]) {
      sub_23093EB88();
    }
    if (!a6) {
      sub_23093EBB4();
    }
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    alias = v13->_alias;
    v13->_alias = (NSString *)v16;

    if ([(NSString *)v13->_alias length])
    {
      v18 = [NSString stringWithFormat:@"%@ (%@)", v13->_alias, v13->_name];
    }
    else
    {
      v18 = v13->_name;
    }
    displayName = v13->_displayName;
    v13->_displayName = v18;

    uint64_t v20 = [v12 copy];
    definition = v13->_definition;
    v13->_definition = (NSString *)v20;

    v13->_kpepEvent = a6;
  }

  return v13;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)DTKPCPUEvent;
  v3 = [(DTKPCPUEvent *)&v8 description];
  v4 = v3;
  alias = (__CFString *)self->_alias;
  if (!alias) {
    alias = @"no alias";
  }
  v6 = [v3 stringByAppendingFormat:@" %@ (%@)", self->_name, alias];

  return v6;
}

- (NSString)aliasOrName
{
  NSUInteger v3 = [(NSString *)self->_alias length];
  uint64_t v4 = 32;
  if (!v3) {
    uint64_t v4 = 24;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return (NSString *)v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (kpep_event)kpepEvent
{
  return self->_kpepEvent;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (NSString)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end