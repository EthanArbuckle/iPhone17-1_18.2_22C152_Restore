@interface FBDisplayLayoutTransition
+ (id)layoutForDisplayType:(int64_t)a3;
+ (void)flushLayoutForDisplayType:(int64_t)a3;
- (BOOL)isTransitioning;
- (FBDisplayLayoutTransition)init;
- (FBDisplayLayoutTransition)initWithDisplayType:(int64_t)a3 name:(id)a4;
- (NSString)name;
- (NSString)transitionReason;
- (id)description;
- (int64_t)backlightLevel;
- (int64_t)displayType;
- (int64_t)interfaceOrientation;
- (void)beginTransition;
- (void)dealloc;
- (void)endTransition;
- (void)setBacklightLevel:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setTransitionReason:(id)a3;
@end

@implementation FBDisplayLayoutTransition

+ (id)layoutForDisplayType:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = +[FBMainDisplayLayoutPublisher sharedInstance];
    v3 = [v4 currentLayout];
  }

  return v3;
}

+ (void)flushLayoutForDisplayType:(int64_t)a3
{
  if (!a3)
  {
    id v4 = +[FBMainDisplayLayoutPublisher sharedInstance];
    [v4 flush];
  }
}

- (FBDisplayLayoutTransition)init
{
  return [(FBDisplayLayoutTransition *)self initWithDisplayType:7 name:0];
}

- (FBDisplayLayoutTransition)initWithDisplayType:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBDisplayLayoutTransition;
  v7 = [(FBDisplayLayoutTransition *)&v15 init];
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      publisher = v7->_publisher;
      v7->_publisher = 0;
    }
    else
    {
      uint64_t v10 = +[FBMainDisplayLayoutPublisher sharedInstance];
      publisher = v8->_publisher;
      v8->_publisher = (FBMainDisplayLayoutPublisher *)v10;
    }

    uint64_t v11 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    transitionReason = v8->_transitionReason;
    v8->_transitionReason = 0;
    v8->_displayType = a3;

    *(_OWORD *)&v8->_interfaceOrientation = xmmword_1A6386450;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  objc_super v15 = @"FBDisplayLayoutTransition.m";
  __int16 v16 = 1024;
  int v17 = 61;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)isTransitioning
{
  return self->_transition != 0;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_transitionReason withName:@"transitionReason" skipIfNil:1];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[FBDisplayLayoutTransition isTransitioning](self, "isTransitioning"), @"transitioning");
  if (self->_interfaceOrientation)
  {
    v7 = BSInterfaceOrientationDescription();
    id v8 = (id)[v3 appendObject:v7 withName:@"interfaceOrientation"];
  }
  int64_t backlightLevel = self->_backlightLevel;
  if (backlightLevel != -1) { {
    id v10 = (id)[v3 appendInteger:backlightLevel withName:@"backlightLevel"];
  }
  }
  uint64_t v11 = [v3 build];

  return v11;
}

- (void)beginTransition
{
  publisher = self->_publisher;
  if (publisher && !self->_transition)
  {
    id v4 = [(FBMainDisplayLayoutPublisher *)publisher transitionAssertionWithReason:self->_transitionReason];
    transition = self->_transition;
    self->_transition = v4;

    if (self->_interfaceOrientation) { {
      -[FBMainDisplayLayoutPublisher setInterfaceOrientation:](self->_publisher, "setInterfaceOrientation:");
    }
    }
    if (self->_backlightLevel != -1)
    {
      id v6 = self->_publisher;
      -[FBMainDisplayLayoutPublisher setBacklightLevel:](v6, "setBacklightLevel:");
    }
  }
}

- (void)endTransition
{
  publisher = self->_publisher;
  if (publisher && self->_transition)
  {
    if (self->_interfaceOrientation) { {
      -[FBMainDisplayLayoutPublisher setInterfaceOrientation:](publisher, "setInterfaceOrientation:");
    }
    }
    if (self->_backlightLevel != -1) { {
      -[FBMainDisplayLayoutPublisher setBacklightLevel:](self->_publisher, "setBacklightLevel:");
    }
    }
    [(BSInvalidatable *)self->_transition invalidate];
    transition = self->_transition;
    self->_transition = 0;
  }
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)transitionReason
{
  return self->_transitionReason;
}

- (void)setTransitionReason:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)backlightLevel
{
  return self->_backlightLevel;
}

- (void)setBacklightLevel:(int64_t)a3
{
  self->_int64_t backlightLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end