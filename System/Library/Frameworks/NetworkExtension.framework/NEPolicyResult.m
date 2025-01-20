@interface NEPolicyResult
+ (id)allowUnentitled;
+ (id)divertSocketToControlUnit:(unsigned int)a3;
+ (id)drop;
+ (id)dropWithFlags:(unsigned int)a3;
+ (id)filterWithControlUnit:(unsigned int)a3;
+ (id)netAgentUUID:(id)a3;
+ (id)pass;
+ (id)passWithFlags:(unsigned int)a3;
+ (id)prohibitFilters;
+ (id)removeNetworkAgentUUID:(id)a3;
+ (id)routeRules:(id)a3;
+ (id)scopeSocketToInterfaceName:(id)a3;
+ (id)scopeToDirectInterface;
+ (id)scopedNetworkAgent:(id)a3;
+ (id)skipWithOrder:(unsigned int)a3;
+ (id)tunnelIPToInterfaceName:(id)a3 secondaryResultType:(int64_t)a4;
- (NEPolicyResult)init;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)resultType;
- (void)setResultType:(int64_t)a3;
@end

@implementation NEPolicyResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRules, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (id)description
{
  return [(NEPolicyResult *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (self)
  {
    unint64_t v8 = self->_resultType - 1;
    if (v8 > 0xE) {
      v9 = @"unknown";
    }
    else {
      v9 = (__CFString *)*((void *)&off_1E5992798 + v8);
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  [v7 appendPrettyObject:v10 withName:@"result-type" andIndent:v5 options:a4];

  unint64_t secondaryResultType = self->_secondaryResultType;
  if (secondaryResultType)
  {
    if (secondaryResultType > 0xF) {
      v12 = @"unknown";
    }
    else {
      v12 = (__CFString *)*((void *)&off_1E5992798 + secondaryResultType - 1);
    }
    v13 = v12;
    [v7 appendPrettyObject:v13 withName:@"secondary-result" andIndent:v5 options:a4];
  }
  uint64_t controlUnit = (int)self->_controlUnit;
  if (controlUnit) {
    [v7 appendPrettyInt:controlUnit withName:@"control-unit" andIndent:v5 options:a4];
  }
  uint64_t effectiveType = (int)self->_effectiveType;
  if (effectiveType) {
    [v7 appendPrettyInt:effectiveType withName:@"effective-type" andIndent:v5 options:a4];
  }
  [v7 appendPrettyObject:self->_agentUUID withName:@"agent-uuid" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_interfaceName withName:@"interface" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_routeRules withName:@"route-rules" andIndent:v5 options:a4];

  return v7;
}

- (NEPolicyResult)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyResult is not valid", v5, 2u);
  }

  return 0;
}

+ (id)allowUnentitled
{
  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setResultType:13];

  return v3;
}

+ (id)scopedNetworkAgent:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setResultType:11];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
    }
  }
  else
  {
    [0 setResultType:11];
    id v5 = 0;
  }

  return v5;
}

+ (id)routeRules:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setResultType:9];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 64);
    }
  }
  else
  {
    [0 setResultType:9];
    id v5 = 0;
  }

  return v5;
}

+ (id)removeNetworkAgentUUID:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setResultType:15];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
    }
  }
  else
  {
    [0 setResultType:15];
    id v5 = 0;
  }

  return v5;
}

+ (id)netAgentUUID:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setResultType:8];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
    }
  }
  else
  {
    [0 setResultType:8];
    id v5 = 0;
  }

  return v5;
}

+ (id)prohibitFilters
{
  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setResultType:14];

  return v3;
}

+ (id)filterWithControlUnit:(unsigned int)a3
{
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    objc_super v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setResultType:7];
    if (v5) {
      v5[5] = a3;
    }
  }
  else
  {
    [0 setResultType:7];
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tunnelIPToInterfaceName:(id)a3 secondaryResultType:(int64_t)a4
{
  id v5 = a3;
  v6 = [NEPolicyResult alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyResult;
    objc_super v7 = objc_msgSendSuper2(&v10, sel_init);
    [v7 setResultType:6];
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 48);
      v7[5] = a4;
    }
  }
  else
  {
    [0 setResultType:6];
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)scopeToDirectInterface
{
  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setResultType:12];

  return v3;
}

+ (id)scopeSocketToInterfaceName:(id)a3
{
  id v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    [v5 setResultType:5];
    if (v5) {
      objc_setProperty_atomic_copy(v5, v6, v3, 48);
    }
  }
  else
  {
    [0 setResultType:5];
    id v5 = 0;
  }

  return v5;
}

+ (id)divertSocketToControlUnit:(unsigned int)a3
{
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setResultType:4];
    if (v5) {
      v5[5] = a3;
    }
  }
  else
  {
    [0 setResultType:4];
    id v5 = 0;
  }

  return v5;
}

+ (id)dropWithFlags:(unsigned int)a3
{
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setResultType:3];
    if (v5) {
      v5[4] = a3;
    }
  }
  else
  {
    [0 setResultType:3];
    id v5 = 0;
  }

  return v5;
}

+ (id)drop
{
  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setResultType:3];

  return v3;
}

+ (id)skipWithOrder:(unsigned int)a3
{
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    objc_super v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setResultType:2];
    if (v5) {
      v5[2] = a3;
    }
  }
  else
  {
    [0 setResultType:2];
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)passWithFlags:(unsigned int)a3
{
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    objc_super v5 = objc_msgSendSuper2(&v7, sel_init);
    [v5 setResultType:1];
    if (v5) {
      v5[3] = a3;
    }
  }
  else
  {
    [0 setResultType:1];
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)pass
{
  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    id v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setResultType:1];

  return v3;
}

@end