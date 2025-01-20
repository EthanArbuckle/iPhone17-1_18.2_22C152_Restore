@interface FBSDisplayLayoutTransitionContext
- (FBSDisplayLayoutTransitionContext)initWithXPCDictionary:(id)a3;
- (NSSet)transitionReasons;
- (NSString)description;
- (NSString)transitionReason;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setTransitionReasons:(id)a3;
@end

@implementation FBSDisplayLayoutTransitionContext

- (void).cxx_destruct
{
}

id __59__FBSDisplayLayoutTransitionContext_initWithXPCDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2 && object_getClass(v2) == (Class)MEMORY[0x1E4F145F0])
  {
    v4 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSSet)transitionReasons
{
  return [(NSOrderedSet *)self->_transitionReasons set];
}

- (NSString)transitionReason
{
  return (NSString *)[(NSOrderedSet *)self->_transitionReasons lastObject];
}

- (FBSDisplayLayoutTransitionContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FBSDisplayLayoutTransitionContext;
  if ([(FBSDisplayLayoutTransitionContext *)&v6 init]) {
    BSCreateDeserializedArrayFromXPCDictionaryWithKey();
  }

  return 0;
}

id __61__FBSDisplayLayoutTransitionContext_encodeWithXPCDictionary___block_invoke(int a1, id a2)
{
  xpc_object_t v2 = xpc_string_create((const char *)[a2 UTF8String]);

  return v2;
}

- (void)setTransitionReasons:(id)a3
{
  id v4 = (NSOrderedSet *)[a3 copy];
  transitionReasons = self->_transitionReasons;
  self->_transitionReasons = v4;

  MEMORY[0x1F41817F8](v4, transitionReasons);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  transitionReasons = self->_transitionReasons;
  id v4 = a3;
  [(NSOrderedSet *)transitionReasons array];
  objc_claimAutoreleasedReturnValue();
  BSSerializeArrayToXPCDictionaryWithKey();
}

- (NSString)description
{
  return (NSString *)[(FBSDisplayLayoutTransitionContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  xpc_object_t v2 = [(FBSDisplayLayoutTransitionContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSDisplayLayoutTransitionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(FBSDisplayLayoutTransitionContext *)self succinctDescriptionBuilder];
  v5 = [(NSOrderedSet *)self->_transitionReasons array];
  objc_super v6 = [v5 componentsJoinedByString:@", "];
  id v7 = (id)[v4 appendObject:v6 withName:@"reasons" skipIfNil:1];

  return v4;
}

@end