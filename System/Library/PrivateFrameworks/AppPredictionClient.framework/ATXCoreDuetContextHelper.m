@interface ATXCoreDuetContextHelper
- (ATXCoreDuetContextHelper)init;
- (id)context;
- (id)fetchDataDictionaryForKeyPath:(id)a3;
- (id)lastModifiedDateForKeyPath:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation ATXCoreDuetContextHelper

- (ATXCoreDuetContextHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXCoreDuetContextHelper;
  v2 = [(ATXCoreDuetContextHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5B6A8] userContext];
    id context = v2->_context;
    v2->_id context = (id)v3;
  }
  return v2;
}

- (id)fetchDataDictionaryForKeyPath:(id)a3
{
  uint64_t v3 = [self->_context objectForKeyedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)lastModifiedDateForKeyPath:(id)a3
{
  return (id)[self->_context lastModifiedDateForContextualKeyPath:a3];
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end