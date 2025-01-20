@interface FBProcessState
- (BOOL)isDebugging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isRunning;
- (FBProcessState)init;
- (FBProcessState)initWithPid:(int)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (int64_t)taskState;
- (int64_t)visibility;
- (void)setDebugging:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setTaskState:(int64_t)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation FBProcessState

- (BOOL)isForeground
{
  return self->_foreground;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int64_t)taskState
{
  return self->_taskState;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[FBProcessState alloc] initWithPid:[(FBProcessState *)self pid]];
  [(FBProcessState *)v4 setTaskState:[(FBProcessState *)self taskState]];
  [(FBProcessState *)v4 setVisibility:[(FBProcessState *)self visibility]];
  [(FBProcessState *)v4 setDebugging:[(FBProcessState *)self isDebugging]];
  return v4;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isDebugging
{
  return self->_debugging;
}

- (void)setTaskState:(int64_t)a3
{
  if (self->_taskState != a3)
  {
    self->_taskState = a3;
    self->_running = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
}

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    self->_foreground = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
}

- (void)setDebugging:(BOOL)a3
{
  self->_debugging = a3;
}

- (FBProcessState)initWithPid:(int)a3
{
  result = [(FBProcessState *)self init];
  if (result)
  {
    result->_pid = a3;
    result->_visibility = 0;
    if (a3 < 1)
    {
      int64_t v5 = 0;
    }
    else
    {
      result->_running = 1;
      int64_t v5 = 2;
    }
    result->_taskState = v5;
  }
  return result;
}

- (FBProcessState)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBProcessState;
  result = [(FBProcessState *)&v3 init];
  if (result) { {
    result->_pid = -1;
  }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBProcessState *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && self->_pid == v4->_pid
      && self->_taskState == v4->_taskState
      && self->_visibility == v4->_visibility
      && self->_debugging == v4->_debugging;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(FBProcessState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBProcessState *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_pid withName:@"pid"];
  unint64_t taskState = self->_taskState;
  if (taskState > 3) { {
    BOOL v6 = 0;
  }
  }
  else {
    BOOL v6 = off_1E5C4B6F8[taskState];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"taskState"];
  unint64_t visibility = self->_visibility;
  if (visibility > 3) { {
    v9 = 0;
  }
  }
  else {
    v9 = off_1E5C4B718[visibility];
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"visibility"];
  id v11 = (id)[v3 appendBool:self->_debugging withName:@"debugging" ifEqualTo:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBProcessState *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end