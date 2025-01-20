@interface MGGroupsActivity
- (MGGroupsActivity)initWithName:(id)a3;
- (NSDate)when;
- (NSString)name;
- (id)description;
- (void)dealloc;
@end

@implementation MGGroupsActivity

- (MGGroupsActivity)initWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MGGroupsActivity;
  v5 = [(MGGroupsActivity *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    when = v5->_when;
    v5->_when = v8;

    v10 = MGLogForCategory(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p starting %@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] now];
  id v4 = [(MGGroupsActivity *)self when];
  [v3 timeIntervalSinceDate:v4];
  uint64_t v6 = v5;

  v7 = MGLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(MGGroupsActivity *)self name];
    *(_DWORD *)buf = 134218498;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_impl(&dword_229257000, v7, OS_LOG_TYPE_DEFAULT, "%p ending %@ (%g)", buf, 0x20u);
  }
  v9.receiver = self;
  v9.super_class = (Class)MGGroupsActivity;
  [(MGGroupsActivity *)&v9 dealloc];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MGGroupsActivity *)self name];
  v7 = [(MGGroupsActivity *)self when];
  v8 = [v3 stringWithFormat:@"<%@: %p, %@ - %@>", v5, self, v6, v7];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)when
{
  return self->_when;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end