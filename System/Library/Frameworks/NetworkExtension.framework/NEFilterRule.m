@interface NEFilterRule
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEAppRule)appRule;
- (NEFilterAction)action;
- (NEFilterRule)initWithCoder:(id)a3;
- (NEFilterRule)initWithNetworkRule:(NENetworkRule *)networkRule action:(NEFilterAction)action;
- (NENetworkRule)networkRule;
- (NSUUID)effectiveUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFilterRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveUUID, 0);
  objc_storeStrong((id *)&self->_appRule, 0);

  objc_storeStrong((id *)&self->_networkRule, 0);
}

- (NSUUID)effectiveUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NEAppRule)appRule
{
  return (NEAppRule *)objc_getProperty(self, a2, 24, 1);
}

- (NEFilterAction)action
{
  return self->_action;
}

- (NENetworkRule)networkRule
{
  return (NENetworkRule *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEFilterRule allocWithZone:a3];
  networkRule = self->_networkRule;
  int64_t action = self->_action;

  return [(NEFilterRule *)v4 initWithNetworkRule:networkRule action:action];
}

- (NEFilterRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEFilterRule;
  v5 = [(NEFilterRule *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rule"];
    networkRule = v5->_networkRule;
    v5->_networkRule = (NENetworkRule *)v6;

    v5->_int64_t action = [v4 decodeIntegerForKey:@"action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  networkRule = self->_networkRule;
  id v5 = a3;
  [v5 encodeObject:networkRule forKey:@"rule"];
  [v5 encodeInteger:self->_action forKey:@"action"];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v7 appendPrettyObject:self->_networkRule withName:@"networkRule" andIndent:v5 options:a4];
  v8 = +[NEFilterProvider descriptionForAction:]((uint64_t)NEFilterProvider, self->_action);
  [v7 appendPrettyObject:v8 withName:@"action" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NENetworkRule *)self->_networkRule checkValidityAndCollectErrors:v4];
  uint64_t v6 = [(NENetworkRule *)self->_networkRule matchRemoteHostOrNetworkEndpoint];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(NENetworkRule *)self->_networkRule matchRemoteHostOrNetworkEndpoint];
    nw_endpoint_type_t type = nw_endpoint_get_type(v8);

    if (type == nw_endpoint_type_address)
    {
      v10 = [(NENetworkRule *)self->_networkRule matchRemoteHostOrNetworkEndpoint];
      int port = nw_endpoint_get_port(v10);

      if (!port)
      {
        v12 = [(NENetworkRule *)self->_networkRule matchRemoteHostOrNetworkEndpoint];
        address = (sockaddr *)nw_endpoint_get_address(v12);
        if (NEIsWildcardAddress(&address->sa_len)
          && [(NENetworkRule *)self->_networkRule matchProtocol] == NENetworkRuleProtocolAny)
        {
          NETrafficDirection v15 = [(NENetworkRule *)self->_networkRule matchDirection];

          if (v15) {
            goto LABEL_7;
          }
          v12 = NEResourcesCopyLocalizedNSString(@"FILTER_RULE_INVALID_NETWORK_RULE", @"FILTER_RULE_INVALID_NETWORK_RULE");
          [v4 addObject:v12];
          BOOL v5 = 0;
        }
      }
    }
  }
LABEL_7:

  return v5;
}

- (NEFilterRule)initWithNetworkRule:(NENetworkRule *)networkRule action:(NEFilterAction)action
{
  uint64_t v6 = networkRule;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterRule;
  id v7 = [(NEFilterRule *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(NENetworkRule *)v6 copy];
    objc_super v9 = v7->_networkRule;
    v7->_networkRule = (NENetworkRule *)v8;

    v7->_int64_t action = action;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end