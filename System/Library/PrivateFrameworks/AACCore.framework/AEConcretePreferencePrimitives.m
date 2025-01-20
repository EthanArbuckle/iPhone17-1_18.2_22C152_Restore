@interface AEConcretePreferencePrimitives
- (AEConcretePreferencePrimitives)initWithDomain:(id)a3;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation AEConcretePreferencePrimitives

- (AEConcretePreferencePrimitives)initWithDomain:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEConcretePreferencePrimitives;
  v5 = [(AEConcretePreferencePrimitives *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;
  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  if (self) {
    CFStringRef domain = (const __CFString *)self->_domain;
  }
  else {
    CFStringRef domain = 0;
  }
  id v4 = (void *)CFPreferencesCopyValue((CFStringRef)a3, domain, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (self) {
    CFStringRef domain = (const __CFString *)self->_domain;
  }
  else {
    CFStringRef domain = 0;
  }
  CFPreferencesSetValue((CFStringRef)a4, a3, domain, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
}

- (void).cxx_destruct
{
}

@end