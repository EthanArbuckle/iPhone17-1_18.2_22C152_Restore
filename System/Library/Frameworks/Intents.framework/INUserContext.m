@interface INUserContext
+ (BOOL)supportsSecureCoding;
+ (int64_t)_type;
- (INUserContext)initWithCoder:(id)a3;
- (id)_init;
- (void)_becomeCurrentNoHelper;
- (void)_setStore:(id)a3;
- (void)becomeCurrent;
@end

@implementation INUserContext

- (void).cxx_destruct
{
}

- (INUserContext)initWithCoder:(id)a3
{
  return 0;
}

- (void)_becomeCurrentNoHelper
{
  store = self->_store;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v5 bundleIdentifier];
  [(INUserContextStore *)store storeUserContext:self forBundleIdentifier:v4];
}

- (void)_setStore:(id)a3
{
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)INUserContext;
  v2 = [(INUserContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[INUserContextStore sharedStore];
    store = v2->_store;
    v2->_store = (INUserContextStore *)v3;
  }
  return v2;
}

- (void)becomeCurrent
{
  store = self->_store;
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v5 bundleIdentifier];
  [(INUserContextStore *)store storeUserContextViaHelper:self forBundleIdentifier:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (int64_t)_type
{
  return 0;
}

@end