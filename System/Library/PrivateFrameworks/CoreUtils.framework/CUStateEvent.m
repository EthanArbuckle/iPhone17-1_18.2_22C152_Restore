@interface CUStateEvent
+ (id)enterState;
+ (id)exitState;
+ (id)initialTransition;
- (CUStateEvent)initWithName:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)name;
- (id)description;
- (void)dealloc;
@end

@implementation CUStateEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v2 = (void *)[(NSString *)self->_name copy];
  return v2;
}

- (void)dealloc
{
  name = self->_name;
  self->_name = 0;

  userInfo = self->_userInfo;
  self->_userInfo = 0;

  v5.receiver = self;
  v5.super_class = (Class)CUStateEvent;
  [(CUStateEvent *)&v5 dealloc];
}

- (CUStateEvent)initWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CUStateEvent;
  v8 = [(CUStateEvent *)&v22 init];
  if (!v8) {
    FatalErrorF((uint64_t)"init failed", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v22.receiver);
  }
  v16 = v8;
  uint64_t v17 = [v6 copy];
  name = v16->_name;
  v16->_name = (NSString *)v17;

  uint64_t v19 = [v7 copy];
  userInfo = v16->_userInfo;
  v16->_userInfo = (NSDictionary *)v19;

  return v16;
}

+ (id)initialTransition
{
  if (initialTransition_sInit != -1) {
    dispatch_once(&initialTransition_sInit, &__block_literal_global_38);
  }
  v2 = (void *)initialTransition_sState;
  return v2;
}

uint64_t __33__CUStateEvent_initialTransition__block_invoke()
{
  v0 = [[CUStateEvent alloc] initWithName:@"initial" userInfo:0];
  uint64_t v1 = initialTransition_sState;
  initialTransition_sState = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)exitState
{
  if (exitState_sInit != -1) {
    dispatch_once(&exitState_sInit, &__block_literal_global_33);
  }
  v2 = (void *)exitState_sState;
  return v2;
}

uint64_t __25__CUStateEvent_exitState__block_invoke()
{
  v0 = [[CUStateEvent alloc] initWithName:@"exit" userInfo:0];
  uint64_t v1 = exitState_sState;
  exitState_sState = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)enterState
{
  if (enterState_sInit != -1) {
    dispatch_once(&enterState_sInit, &__block_literal_global_8003);
  }
  v2 = (void *)enterState_sState;
  return v2;
}

uint64_t __26__CUStateEvent_enterState__block_invoke()
{
  v0 = [[CUStateEvent alloc] initWithName:@"enter" userInfo:0];
  uint64_t v1 = enterState_sState;
  enterState_sState = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end