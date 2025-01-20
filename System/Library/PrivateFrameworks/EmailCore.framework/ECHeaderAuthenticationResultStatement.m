@interface ECHeaderAuthenticationResultStatement
- (ECHeaderAuthenticationResultStatement)initWithMethod:(id)a3 result:(id)a4 reason:(id)a5 properties:(id)a6;
- (NSArray)properties;
- (NSString)method;
- (NSString)reason;
- (NSString)result;
- (id)_valueForPropertyPassingTest:(id)a3;
- (id)valueForFullProperty:(id)a3;
- (id)valueForPropertyType:(id)a3 property:(id)a4;
@end

@implementation ECHeaderAuthenticationResultStatement

- (ECHeaderAuthenticationResultStatement)initWithMethod:(id)a3 result:(id)a4 reason:(id)a5 properties:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ECHeaderAuthenticationResultStatement;
  v15 = [(ECHeaderAuthenticationResultStatement *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_method, a3);
    objc_storeStrong((id *)&v16->_result, a4);
    objc_storeStrong((id *)&v16->_reason, a5);
    objc_storeStrong((id *)&v16->_properties, a6);
  }

  return v16;
}

- (id)valueForFullProperty:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ECHeaderAuthenticationResultStatement_valueForFullProperty___block_invoke;
  v8[3] = &unk_1E63EE6A8;
  id v9 = v4;
  id v5 = v4;
  v6 = [(ECHeaderAuthenticationResultStatement *)self _valueForPropertyPassingTest:v8];

  return v6;
}

uint64_t __62__ECHeaderAuthenticationResultStatement_valueForFullProperty___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 fullProperty];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)valueForPropertyType:(id)a3 property:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ECHeaderAuthenticationResultStatement_valueForPropertyType_property___block_invoke;
  v12[3] = &unk_1E63EE6D0;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = [(ECHeaderAuthenticationResultStatement *)self _valueForPropertyPassingTest:v12];

  return v10;
}

uint64_t __71__ECHeaderAuthenticationResultStatement_valueForPropertyType_property___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 propertyType];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 property];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_valueForPropertyPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(ECHeaderAuthenticationResultStatement *)self properties];
  uint64_t v6 = objc_msgSend(v5, "ef_firstObjectPassingTest:", v4);

  id v7 = [v6 value];

  return v7;
}

- (NSString)method
{
  return self->_method;
}

- (NSString)result
{
  return self->_result;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_method, 0);
}

@end