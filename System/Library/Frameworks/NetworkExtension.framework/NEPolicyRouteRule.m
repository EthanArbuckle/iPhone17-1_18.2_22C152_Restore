@interface NEPolicyRouteRule
+ (id)routeRuleWithAction:(int64_t)a3 forInterfaceName:(id)a4;
+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4;
+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4 forInterfaceName:(id)a5;
+ (id)routeRuleWithAction:(int64_t)a3 forType:(int64_t)a4;
- (NEPolicyRouteRule)init;
- (NSUUID)networkAgentUUID;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unsigned)controlUnit;
- (unsigned)effectiveType;
- (void)setControlUnit:(unsigned int)a3;
- (void)setEffectiveType:(unsigned int)a3;
- (void)setNetworkAgentUUID:(id)a3;
@end

@implementation NEPolicyRouteRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchNetworkAgent, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);

  objc_storeStrong((id *)&self->_networkAgentUUID, 0);
}

- (void)setEffectiveType:(unsigned int)a3
{
  self->_effectiveType = a3;
}

- (unsigned)effectiveType
{
  return self->_effectiveType;
}

- (void)setControlUnit:(unsigned int)a3
{
  self->_controlUnit = a3;
}

- (unsigned)controlUnit
{
  return self->_controlUnit;
}

- (void)setNetworkAgentUUID:(id)a3
{
}

- (NSUUID)networkAgentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  return [(NEPolicyRouteRule *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = v7;
  if (self)
  {
    unint64_t v9 = self->_action - 1;
    if (v9 > 6) {
      v10 = @"unknown";
    }
    else {
      v10 = (__CFString *)*((void *)&off_1E5992728 + v9);
    }
    [v7 appendPrettyObject:v10 withName:@"action" andIndent:v5 options:a4];
    unint64_t v11 = self->_type - 1;
    if (v11 < 7)
    {
      uint64_t v12 = *((void *)&off_1E5992760 + v11);
      goto LABEL_9;
    }
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"action" andIndent:v5 options:a4];
  }
  uint64_t v12 = 0;
LABEL_9:
  [v8 appendPrettyObject:v12 withName:@"type" andIndent:v5 options:a4];
  [v8 appendPrettyObject:self->_interfaceName withName:@"interface" andIndent:v5 options:a4];
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v13, 40, 1), @"matchNetworkAgent", v5, a4);
  v14 = [(NEPolicyRouteRule *)self networkAgentUUID];
  [v8 appendPrettyObject:v14 withName:@"networkAgentUUID" andIndent:v5 options:a4];

  if ([(NEPolicyRouteRule *)self controlUnit]) {
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEPolicyRouteRule controlUnit](self, "controlUnit"), @"controlUnit", v5, a4);
  }
  if ([(NEPolicyRouteRule *)self effectiveType]) {
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEPolicyRouteRule effectiveType](self, "effectiveType"), @"effectiveType", v5, a4);
  }

  return v8;
}

- (NEPolicyRouteRule)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyRouteRule is not valid", v5, 2u);
  }

  return 0;
}

+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4 forInterfaceName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [NEPolicyRouteRule alloc];
  if (v9)
  {
    v15.receiver = v9;
    v15.super_class = (Class)NEPolicyRouteRule;
    v10 = objc_msgSendSuper2(&v15, sel_init);
    uint64_t v12 = v10;
    if (v10)
    {
      v10[3] = a3;
      objc_setProperty_atomic_copy(v10, v11, v7, 40);
      objc_setProperty_atomic_copy(v12, v13, v8, 32);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4
{
  id v5 = a4;
  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v11.receiver = v6;
    v11.super_class = (Class)NEPolicyRouteRule;
    id v7 = objc_msgSendSuper2(&v11, sel_init);
    unint64_t v9 = v7;
    if (v7)
    {
      v7[3] = a3;
      objc_setProperty_atomic_copy(v7, v8, v5, 40);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)routeRuleWithAction:(int64_t)a3 forType:(int64_t)a4
{
  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)NEPolicyRouteRule;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_action = a3;
      v6->_type = a4;
    }
  }

  return v6;
}

+ (id)routeRuleWithAction:(int64_t)a3 forInterfaceName:(id)a4
{
  id v5 = a4;
  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v11.receiver = v6;
    v11.super_class = (Class)NEPolicyRouteRule;
    id v7 = objc_msgSendSuper2(&v11, sel_init);
    unint64_t v9 = v7;
    if (v7)
    {
      v7[3] = a3;
      objc_setProperty_atomic_copy(v7, v8, v5, 32);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

@end