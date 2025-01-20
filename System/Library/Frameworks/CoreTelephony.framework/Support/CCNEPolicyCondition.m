@interface CCNEPolicyCondition
+ (id)accountIdentifier:(id)a3;
+ (id)allInterfaces;
+ (id)clientProhibitsConstrained;
+ (id)delegateIsPlatformBinary;
+ (id)domain:(id)a3;
+ (id)effectiveApplication:(id)a3;
+ (id)effectivePID:(int)a3;
+ (id)flowRemoteAddress:(id)a3 prefix:(unsigned __int8)a4;
+ (id)flowRemoteAddressStart:(id)a3 end:(id)a4;
+ (id)ipProtocol:(unsigned __int16)a3;
+ (id)platformBinary;
+ (id)requiredAgentDomain:(id)a3 agentType:(id)a4;
+ (id)scopedInterface:(id)a3;
+ (id)trafficClassStart:(unsigned int)a3 end:(unsigned int)a4;
+ (id)usesModernNetworkAPI;
- (BOOL)isNegative;
- (CCNEPolicyCondition)init;
- (void)setNegative:(BOOL)a3;
@end

@implementation CCNEPolicyCondition

- (CCNEPolicyCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCNEPolicyCondition;
  return [(CCNEPolicyCondition *)&v3 init];
}

+ (id)accountIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition accountIdentifier:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)effectiveApplication:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition effectiveApplication:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)effectivePID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition effectivePID:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)trafficClassStart:(unsigned int)a3 end:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v6 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v7 = +[NEPolicyCondition trafficClassStart:v5 end:v4];
  condition = v6->condition;
  v6->condition = (NEPolicyCondition *)v7;

  return v6;
}

+ (id)domain:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition domain:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)flowRemoteAddress:(id)a3 prefix:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v7 = +[NEPolicyCondition flowRemoteAddress:v5 prefix:v4];
  condition = v6->condition;
  v6->condition = (NEPolicyCondition *)v7;

  return v6;
}

+ (id)flowRemoteAddressStart:(id)a3 end:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v8 = +[NEPolicyCondition flowRemoteAddressStart:v5 end:v6];
  condition = v7->condition;
  v7->condition = (NEPolicyCondition *)v8;

  return v7;
}

+ (id)ipProtocol:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition ipProtocol:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)allInterfaces
{
  v2 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v3 = +[NEPolicyCondition allInterfaces];
  condition = v2->condition;
  v2->condition = (NEPolicyCondition *)v3;

  return v2;
}

+ (id)scopedInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v5 = +[NEPolicyCondition scopedInterface:v3];
  condition = v4->condition;
  v4->condition = (NEPolicyCondition *)v5;

  return v4;
}

+ (id)platformBinary
{
  v2 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v3 = +[NEPolicyCondition platformBinary];
  condition = v2->condition;
  v2->condition = (NEPolicyCondition *)v3;

  return v2;
}

+ (id)delegateIsPlatformBinary
{
  v2 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v3 = +[NEPolicyCondition delegateIsPlatformBinary];
  condition = v2->condition;
  v2->condition = (NEPolicyCondition *)v3;

  return v2;
}

+ (id)requiredAgentDomain:(id)a3 agentType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v8 = +[NEPolicyCondition requiredAgentDomain:v5 agentType:v6];
  condition = v7->condition;
  v7->condition = (NEPolicyCondition *)v8;

  return v7;
}

+ (id)clientProhibitsConstrained
{
  v2 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v3 = +[NEPolicyCondition clientFlags:4096];
  condition = v2->condition;
  v2->condition = (NEPolicyCondition *)v3;

  return v2;
}

+ (id)usesModernNetworkAPI
{
  v2 = objc_alloc_init(CCNEPolicyCondition);
  uint64_t v3 = +[NEPolicyCondition usesModernNetworkAPI];
  condition = v2->condition;
  v2->condition = (NEPolicyCondition *)v3;

  return v2;
}

- (void)setNegative:(BOOL)a3
{
  condition = self->condition;
  if (condition) {
    [(NEPolicyCondition *)condition setNegative:a3];
  }
}

- (BOOL)isNegative
{
  return [(NEPolicyCondition *)self->condition isNegative];
}

- (void).cxx_destruct
{
}

@end