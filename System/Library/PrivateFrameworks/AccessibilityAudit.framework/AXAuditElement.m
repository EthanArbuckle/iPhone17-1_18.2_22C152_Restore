@interface AXAuditElement
+ (id)auditElementWithElement:(id)a3 identifier:(id)a4;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXElement)axElement;
- (BOOL)isEqual:(id)a3;
- (__AXUIElement)createAxElementRefForXCTest;
- (id)accessibilityIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)platformElementToken;
- (unint64_t)hash;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAxElement:(id)a3;
- (void)setPlatformElementToken:(id)a3;
@end

@implementation AXAuditElement

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v6 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditElement_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"PlatformElementValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_0];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_11];
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v4];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"AccessibilityIdentifier_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_16];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_19];
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v5];
  [v3 registerTransportInfoPropertyBased:v6];
}

id __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 platformElementToken];
  if (v2
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v5 setPlatformElementToken:v4];
  }
}

uint64_t __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 accessibilityIdentifier];
}

void __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAccessibilityIdentifier:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditElement *)self platformElementToken];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditElement *)self accessibilityIdentifier];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditElement *)a3;
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
      uint64_t v6 = [(AXAuditElement *)self platformElementToken];
      uint64_t v7 = [(AXAuditElement *)v5 platformElementToken];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        BOOL v10 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditElement *)self accessibilityIdentifier];
        uint64_t v9 = [(AXAuditElement *)v5 accessibilityIdentifier];
        BOOL v10 = !(v8 | v9) || [(id)v8 isEqual:v9];
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditElement *)self platformElementToken];
  [v4 setPlatformElementToken:v5];

  uint64_t v6 = [(AXAuditElement *)self accessibilityIdentifier];
  [v4 setAccessibilityIdentifier:v6];

  return v4;
}

- (__AXUIElement)createAxElementRefForXCTest
{
  v2 = [(AXAuditElement *)self axElement];
  id v3 = (__AXUIElement *)[v2 elementRef];
  uint64_t v4 = v3;
  if (v3) {
    CFRetain(v3);
  }

  return v4;
}

- (id)platformElementToken
{
  return self->_platformElementToken;
}

- (void)setPlatformElementToken:(id)a3
{
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessibilityIdentifier, 0);

  objc_storeStrong(&self->_platformElementToken, 0);
}

+ (id)auditElementWithElement:(id)a3 identifier:(id)a4
{
  uint64_t v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    uint64_t v4 = objc_opt_new();
    [v4 setAxElement:v6];

    [v4 setAccessibilityIdentifier:v5];
  }

  return v4;
}

- (void)setAxElement:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!v4
    || ([v4 uiElement],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 axElement],
        v5,
        !v6))
  {
    [(AXAuditElement *)self setPlatformElementToken:0];
    goto LABEL_10;
  }
  Data = (void *)_AXUIElementCreateData();
  if (!Data)
  {
    uint64_t v8 = self;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = self;
    uint64_t v9 = Data;
LABEL_8:
    [(AXAuditElement *)v8 setPlatformElementToken:v9];
  }

LABEL_10:
}

- (AXElement)axElement
{
  v2 = [(AXAuditElement *)self platformElementToken];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 objectForKey:@"ElementData"];

    v2 = (void *)v3;
  }
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (uint64_t v4 = _AXUIElementCreateWithData()) != 0)
  {
    id v5 = (const void *)v4;
    uint64_t v6 = [MEMORY[0x263F21668] elementWithAXUIElement:v4];
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (AXElement *)v6;
}

@end