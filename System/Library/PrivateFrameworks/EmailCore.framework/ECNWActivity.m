@interface ECNWActivity
+ (void)attachCurrentActivityToConnection:(id)a3;
+ (void)detachCurrentActivityFromConnection:(id)a3;
- (ECNWActivity)initWithDomain:(unsigned int)a3 type:(unsigned int)a4;
- (void)startActivity;
- (void)stopActivityWithSuccess:(BOOL)a3;
@end

@implementation ECNWActivity

+ (void)attachCurrentActivityToConnection:(id)a3
{
  id v8 = a3;
  v4 = [MEMORY[0x1E4F29060] currentThread];
  v5 = [v4 threadDictionary];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"_ECNWActivityCurrentActivity"];
  v7 = (id *)v6;
  if (v6 && !*(void *)(v6 + 16))
  {
    nw_connection_start_activity();
    objc_storeStrong(v7 + 2, a3);
  }
}

+ (void)detachCurrentActivityFromConnection:(id)a3
{
  id v7 = a3;
  v3 = [MEMORY[0x1E4F29060] currentThread];
  v4 = [v3 threadDictionary];

  v5 = [v4 objectForKeyedSubscript:@"_ECNWActivityCurrentActivity"];
  if (v5 && (id)v5[2] == v7)
  {
    nw_connection_end_activity();
    uint64_t v6 = (void *)v5[2];
    v5[2] = 0;
  }
}

- (ECNWActivity)initWithDomain:(unsigned int)a3 type:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ECNWActivity;
  v4 = [(ECNWActivity *)&v8 init];
  if (v4)
  {
    uint64_t v5 = nw_activity_create();
    activity = v4->_activity;
    v4->_activity = (OS_nw_activity *)v5;
  }
  return v4;
}

- (void)startActivity
{
  v4 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v4 threadDictionary];

  nw_activity_activate();
  uint64_t v5 = [v7 objectForKeyedSubscript:@"_ECNWActivityCurrentActivity"];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ECNWActivity.m" lineNumber:49 description:@"We don't currently support nesting activities"];
  }
  [v7 setObject:self forKeyedSubscript:@"_ECNWActivityCurrentActivity"];
}

- (void)stopActivityWithSuccess:(BOOL)a3
{
  v4 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v4 threadDictionary];

  uint64_t v5 = [v6 objectForKeyedSubscript:@"_ECNWActivityCurrentActivity"];

  if (v5 == self) {
    [v6 setObject:0 forKeyedSubscript:@"_ECNWActivityCurrentActivity"];
  }
  nw_activity_complete_with_reason();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end