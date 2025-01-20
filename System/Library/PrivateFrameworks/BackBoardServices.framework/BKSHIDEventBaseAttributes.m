@interface BKSHIDEventBaseAttributes
+ (id)baseAttributesFromProvider:(id)a3;
+ (id)protobufSchema;
- (BKSHIDEventAuthenticationMessage)authenticationMessage;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDeferringToken)token;
- (BKSHIDEventDisplay)display;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)source;
- (unsigned)contextID;
- (unsigned)options;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setAuthenticationMessage:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setOptions:(unsigned __int16)a3;
- (void)setSource:(int)a3;
- (void)setToken:(id)a3;
@end

@implementation BKSHIDEventBaseAttributes

- (unsigned)contextID
{
  return [(BKSHIDEventDeferringToken *)self->_token _identifierOfCAContext];
}

- (unsigned)options
{
  return self->_options;
}

- (int)source
{
  return self->_source;
}

- (void)setOptions:(unsigned __int16)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
}

+ (id)baseAttributesFromProvider:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [v3 environment];
  [v4 setEnvironment:v5];

  v6 = [v3 display];
  [v4 setDisplay:v6];

  v7 = [v3 token];

  [v4 setToken:v7];
  return v4;
}

- (void)setToken:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (void)setDisplay:(id)a3
{
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_184 != -1) {
    dispatch_once(&protobufSchema_onceToken_184, block);
  }
  v2 = (void *)protobufSchema_schema_183;
  return v2;
}

uint64_t __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_186];
  uint64_t v2 = protobufSchema_schema_183;
  protobufSchema_schema_183 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_authenticationMessage"];
  [v2 addField:"_environment"];
  [v2 addField:"_display"];
  [v2 addField:"_token"];
  [v2 addField:"_source"];
  [v2 addField:"_options"];
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (void)setAuthenticationMessage:(id)a3
{
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  authenticationMessage = self->_authenticationMessage;
  id v15 = v4;
  if (authenticationMessage)
  {
    id v6 = (id)[v4 appendObject:authenticationMessage withName:@"authenticationMessage"];
    id v4 = v15;
  }
  id v7 = (id)[v4 appendObject:self->_environment withName:@"environment"];
  display = self->_display;
  if (display) {
    id v9 = (id)[v15 appendObject:display withName:@"display"];
  }
  token = self->_token;
  if (token) {
    id v11 = (id)[v15 appendObject:token withName:@"token"];
  }
  v12 = NSStringFromBKSHIDEventSource(self->_source);
  id v13 = (id)[v15 appendObject:v12 withName:@"source"];

  v14 = NSStringFromBKSHIDEventAttributeOptions(self->_options);
  [v15 appendString:v14 withName:@"options"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKSHIDEventBaseAttributes *)self succinctDescriptionBuilder];
  [(BKSHIDEventBaseAttributes *)self appendDescriptionToFormatter:v4];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BKSHIDEventBaseAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  id v2 = [(BKSHIDEventBaseAttributes *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_source == v5[3]
      && self->_options == *((unsigned __int16 *)v5 + 4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(BKSHIDEventBaseAttributes *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_authenticationMessage);
  objc_storeStrong((id *)(v4 + 24), self->_environment);
  objc_storeStrong((id *)(v4 + 32), self->_display);
  objc_storeStrong((id *)(v4 + 40), self->_token);
  *(_DWORD *)(v4 + 12) = self->_source;
  *(_WORD *)(v4 + 8) = self->_options;
  return (id)v4;
}

@end