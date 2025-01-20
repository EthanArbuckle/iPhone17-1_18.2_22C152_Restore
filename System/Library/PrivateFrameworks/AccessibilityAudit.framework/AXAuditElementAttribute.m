@interface AXAuditElementAttribute
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditElementAttribute)init;
- (BOOL)displayAsTree;
- (BOOL)displayInline;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isSettable;
- (BOOL)isSupported;
- (BOOL)performsAction;
- (NSString)attributeName;
- (NSString)description;
- (NSString)developerAPISelector;
- (NSString)humanReadableName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)setAttributeName:(id)a3;
- (void)setDeveloperAPISelector:(id)a3;
- (void)setDisplayAsTree:(BOOL)a3;
- (void)setDisplayInline:(BOOL)a3;
- (void)setHumanReadableName:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setPerformsAction:(BOOL)a3;
- (void)setSettable:(BOOL)a3;
- (void)setValueType:(int64_t)a3;
@end

@implementation AXAuditElementAttribute

- (AXAuditElementAttribute)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXAuditElementAttribute;
  result = [(AXAuditElementAttribute *)&v3 init];
  if (result) {
    result->_valueType = 1;
  }
  return result;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v13 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditElementAttribute_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"AttributeNameValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_2];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_9];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"HumanReadableNameValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_15_0];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_17_0];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"DeveloperAPISelectorValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_22];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_24];
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"SettableValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_30];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_34];
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v8];
  [(AXAuditObjectTransportPropertyEntry *)v8 setTransportKey:@"PerformsActionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v8 setLocalValueToTransportValue:&__block_literal_global_41];
  [(AXAuditObjectTransportPropertyEntry *)v8 setPopulateLocalObjectWithTransportValue:&__block_literal_global_43];
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v9];
  [(AXAuditObjectTransportPropertyEntry *)v9 setTransportKey:@"ValueTypeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v9 setLocalValueToTransportValue:&__block_literal_global_48];
  [(AXAuditObjectTransportPropertyEntry *)v9 setPopulateLocalObjectWithTransportValue:&__block_literal_global_50];
  v10 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v10];
  [(AXAuditObjectTransportPropertyEntry *)v10 setTransportKey:@"DisplayInlineValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v10 setLocalValueToTransportValue:&__block_literal_global_55];
  [(AXAuditObjectTransportPropertyEntry *)v10 setPopulateLocalObjectWithTransportValue:&__block_literal_global_57];
  v11 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v11];
  [(AXAuditObjectTransportPropertyEntry *)v11 setTransportKey:@"DisplayAsTree_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v11 setLocalValueToTransportValue:&__block_literal_global_62_0];
  [(AXAuditObjectTransportPropertyEntry *)v11 setPopulateLocalObjectWithTransportValue:&__block_literal_global_64_0];
  v12 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v13 addPropertyEntry:v12];
  [(AXAuditObjectTransportPropertyEntry *)v12 setTransportKey:@"IsInternal_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v12 setLocalValueToTransportValue:&__block_literal_global_69_0];
  [(AXAuditObjectTransportPropertyEntry *)v12 setPopulateLocalObjectWithTransportValue:&__block_literal_global_71_0];
  [v3 registerTransportInfoPropertyBased:v13];
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attributeName];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAttributeName:v4];
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 humanReadableName];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setHumanReadableName:v4];
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 developerAPISelector];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setDeveloperAPISelector:v4];
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 isSettable];

  return [v2 numberWithBool:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setSettable:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 performsAction];

  return [v2 numberWithBool:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setPerformsAction:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 valueType];

  return [v2 numberWithInteger:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setValueType:", objc_msgSend(v4, "integerValue"));
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_13(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 displayInline];

  return [v2 numberWithBool:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setDisplayInline:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_15(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 displayAsTree];

  return [v2 numberWithBool:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setDisplayAsTree:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_17(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 isInternal];

  return [v2 numberWithBool:v3];
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setIsInternal:", objc_msgSend(v4, "BOOLValue"));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditElementAttribute *)self attributeName];
  [v4 setAttributeName:v5];

  v6 = [(AXAuditElementAttribute *)self humanReadableName];
  [v4 setHumanReadableName:v6];

  objc_msgSend(v4, "setSettable:", -[AXAuditElementAttribute isSettable](self, "isSettable"));
  objc_msgSend(v4, "setPerformsAction:", -[AXAuditElementAttribute performsAction](self, "performsAction"));
  objc_msgSend(v4, "setValueType:", -[AXAuditElementAttribute valueType](self, "valueType"));
  v7 = [(AXAuditElementAttribute *)self developerAPISelector];
  [v4 setDeveloperAPISelector:v7];

  objc_msgSend(v4, "setDisplayAsTree:", -[AXAuditElementAttribute displayAsTree](self, "displayAsTree"));
  objc_msgSend(v4, "setIsInternal:", -[AXAuditElementAttribute isInternal](self, "isInternal"));
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(AXAuditElementAttribute *)self attributeName];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditElementAttribute *)self humanReadableName];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(AXAuditElementAttribute *)self isSettable];
  uint64_t v8 = [(AXAuditElementAttribute *)self performsAction];
  int64_t v9 = v7 ^ v8 ^ [(AXAuditElementAttribute *)self valueType];
  v10 = [(AXAuditElementAttribute *)self developerAPISelector];
  uint64_t v11 = [v10 hash];
  unint64_t v12 = v9 ^ v11 ^ [(AXAuditElementAttribute *)self isInternal];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditElementAttribute *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditElementAttribute *)v5 valueType];
      if (v6 == [(AXAuditElementAttribute *)self valueType]
        && (BOOL v7 = [(AXAuditElementAttribute *)v5 isSettable],
            v7 == [(AXAuditElementAttribute *)self isSettable])
        && (BOOL v8 = [(AXAuditElementAttribute *)v5 performsAction],
            v8 == [(AXAuditElementAttribute *)self performsAction])
        && (BOOL v9 = [(AXAuditElementAttribute *)v5 isInternal],
            v9 == [(AXAuditElementAttribute *)self isInternal]))
      {
        uint64_t v12 = [(AXAuditElementAttribute *)self attributeName];
        uint64_t v13 = [(AXAuditElementAttribute *)v5 attributeName];
        if (v12 | v13 && ![(id)v12 isEqual:v13])
        {
          BOOL v10 = 0;
        }
        else
        {
          uint64_t v14 = [(AXAuditElementAttribute *)self humanReadableName];
          uint64_t v15 = [(AXAuditElementAttribute *)v5 humanReadableName];
          if (v14 | v15 && ![(id)v14 isEqual:v15])
          {
            BOOL v10 = 0;
          }
          else
          {
            uint64_t v16 = [(AXAuditElementAttribute *)self developerAPISelector];
            uint64_t v17 = [(AXAuditElementAttribute *)v5 developerAPISelector];
            BOOL v10 = !(v16 | v17) || [(id)v16 isEqual:v17];
          }
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)AXAuditElementAttribute;
  uint64_t v3 = [(AXAuditElementAttribute *)&v10 description];
  uint64_t v4 = [(AXAuditElementAttribute *)self attributeName];
  if ([(AXAuditElementAttribute *)self isSettable]) {
    id v5 = @"settable";
  }
  else {
    id v5 = &stru_26FB6E0B0;
  }
  BOOL v6 = [(AXAuditElementAttribute *)self isInternal];
  BOOL v7 = @"internal";
  if (!v6) {
    BOOL v7 = &stru_26FB6E0B0;
  }
  BOOL v8 = [v3 stringByAppendingFormat:@"name:%@ %@ %@", v4, v5, v7];

  return (NSString *)v8;
}

- (NSString)attributeName
{
  return self->_attributeName;
}

- (void)setAttributeName:(id)a3
{
}

- (NSString)developerAPISelector
{
  return self->_developerAPISelector;
}

- (void)setDeveloperAPISelector:(id)a3
{
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void)setSettable:(BOOL)a3
{
  self->_settable = a3;
}

- (BOOL)performsAction
{
  return self->_performsAction;
}

- (void)setPerformsAction:(BOOL)a3
{
  self->_performsAction = a3;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)displayInline
{
  return self->_displayInline;
}

- (void)setDisplayInline:(BOOL)a3
{
  self->_displayInline = a3;
}

- (BOOL)displayAsTree
{
  return self->_displayAsTree;
}

- (void)setDisplayAsTree:(BOOL)a3
{
  self->_displayAsTree = a3;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(int64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_developerAPISelector, 0);

  objc_storeStrong((id *)&self->_attributeName, 0);
}

@end