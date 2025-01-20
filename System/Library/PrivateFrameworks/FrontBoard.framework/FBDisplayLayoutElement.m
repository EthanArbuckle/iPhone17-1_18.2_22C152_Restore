@interface FBDisplayLayoutElement
- (Class)elementClass;
- (FBDisplayLayoutElement)init;
- (FBDisplayLayoutElement)initWithDisplayType:(int64_t)a3 identifier:(id)a4 elementClass:(Class)a5;
- (FBSDisplayLayoutElement)element;
- (NSString)description;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)displayType;
- (void)activate;
- (void)activateWithBuilder:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)updateWithBuilder:(id)a3;
@end

@implementation FBDisplayLayoutElement

- (FBDisplayLayoutElement)init
{
  return [(FBDisplayLayoutElement *)self initWithDisplayType:7 identifier:0 elementClass:0];
}

- (FBDisplayLayoutElement)initWithDisplayType:(int64_t)a3 identifier:(id)a4 elementClass:(Class)a5
{
  id v9 = a4;
  if (v9)
  {
    v10 = v9;
    v23.receiver = self;
    v23.super_class = (Class)FBDisplayLayoutElement;
    v11 = [(FBDisplayLayoutElement *)&v23 init];
    v12 = v11;
    if (v11)
    {
      if (a3)
      {
        publisher = v11->_publisher;
        v11->_publisher = 0;
      }
      else
      {
        uint64_t v14 = +[FBMainDisplayLayoutPublisher sharedInstance];
        publisher = v12->_publisher;
        v12->_publisher = (FBMainDisplayLayoutPublisher *)v14;
      }

      v12->_displayType = a3;
      uint64_t v15 = [v10 copy];
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v15;

      uint64_t v17 = [NSString stringWithFormat:@"FBDisplayLayoutElement:%p %@", v12, v12->_identifier];
      key = v12->_key;
      v12->_key = (NSString *)v17;

      v12->_elementClass = a5;
      uint64_t v19 = [[a5 alloc] initWithIdentifier:v12->_identifier];
      element = v12->_element;
      v12->_element = (FBSDisplayLayoutElement *)v19;
    }
    return v12;
  }
  else
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBDisplayLayoutElement initWithDisplayType:identifier:elementClass:](a2, (uint64_t)self, (uint64_t)v22);
    }
    }
    [v22 UTF8String];
    result = (FBDisplayLayoutElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBDisplayLayoutElement.m";
  __int16 v10 = 1024;
  int v11 = 46;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)activate
{
}

- (void)activateWithBuilder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    (*((void (**)(id, FBSDisplayLayoutElement *))v4 + 2))(v4, self->_element);
    id v4 = v7;
  }
  if (!self->_activeAssertion)
  {
    v5 = [(FBMainDisplayLayoutPublisher *)self->_publisher _addElement:self->_element forKey:self->_key];
    activeAssertion = self->_activeAssertion;
    self->_activeAssertion = v5;

    id v4 = v7;
  }
}

- (void)updateWithBuilder:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    (*((void (**)(id, FBSDisplayLayoutElement *))v4 + 2))(v4, self->_element);
    id v4 = v8;
  }
  if (self->_activeAssertion)
  {
    v5 = [(FBMainDisplayLayoutPublisher *)self->_publisher transitionAssertionWithReason:0];
    [(BSInvalidatable *)self->_activeAssertion invalidate];
    v6 = [(FBMainDisplayLayoutPublisher *)self->_publisher _addElement:self->_element forKey:self->_key];
    activeAssertion = self->_activeAssertion;
    self->_activeAssertion = v6;

    [v5 invalidate];
    id v4 = v8;
  }
}

- (void)deactivate
{
  activeAssertion = self->_activeAssertion;
  if (activeAssertion)
  {
    [(BSInvalidatable *)activeAssertion invalidate];
    id v4 = self->_activeAssertion;
    self->_activeAssertion = 0;
  }
}

- (NSString)description
{
  return (NSString *)[(FBDisplayLayoutElement *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBDisplayLayoutElement *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = FBSDisplayTypeDescription();
  id v5 = (id)[v3 appendObject:v4 withName:@"displayType"];

  id v6 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v7 = NSStringFromClass(self->_elementClass);
  id v8 = (id)[v3 appendObject:v7 withName:@"class"];

  id v9 = (id)[v3 appendBool:self->_activeAssertion != 0 withName:@"activated"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBDisplayLayoutElement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBDisplayLayoutElement *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__FBDisplayLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5C497A0;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __64__FBDisplayLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"element"];
}

- (FBSDisplayLayoutElement)element
{
  return self->_element;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (Class)elementClass
{
  return self->_elementClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)initWithDisplayType:(const char *)a1 identifier:(uint64_t)a2 elementClass:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"FBDisplayLayoutElement.m";
  __int16 v10 = 1024;
  int v11 = 33;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end