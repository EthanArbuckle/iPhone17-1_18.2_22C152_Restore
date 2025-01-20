@interface AXAuditInspectorFocus
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditElement)element;
- (BOOL)isEqual:(id)a3;
- (NSArray)inspectorSections;
- (NSString)captionText;
- (NSString)spokenDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCaptionText:(id)a3;
- (void)setElement:(id)a3;
- (void)setInspectorSections:(id)a3;
- (void)setSpokenDescription:(id)a3;
@end

@implementation AXAuditInspectorFocus

- (void)setInspectorSections:(id)a3
{
  v16 = self;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v17 = (NSArray *)objc_opt_new();
  v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "title", v16);
        if ([v11 length])
        {
          v12 = [v10 identifier];
          if ([v12 length])
          {
            v13 = [v10 identifier];
            char v14 = [v4 containsObject:v13];

            if (v14) {
              continue;
            }
            [(NSArray *)v17 addObject:v10];
            v11 = [v10 identifier];
            [v4 addObject:v11];
          }
          else
          {
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  inspectorSections = v16->_inspectorSections;
  v16->_inspectorSections = v17;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  uint64_t v8 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditInspectorFocus_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v8 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"ElementValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_9];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_11_0];
  id v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v8 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"CaptionTextValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_18];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_21];
  uint64_t v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v8 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"SpokenDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_27];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_29];
  uint64_t v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v8 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"InspectorSectionsValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_35];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_38];
  [v3 registerTransportInfoPropertyBased:v8];
}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 element];
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setElement:v4];
  }
}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 captionText];
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setCaptionText:v4];
  }
}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 spokenDescription];
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setSpokenDescription:v4];
  }
}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 inspectorSections];
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setInspectorSections:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditInspectorFocus *)self element];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditInspectorFocus *)self captionText];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(AXAuditInspectorFocus *)self inspectorSections];
  uint64_t v8 = [v7 hash];
  v9 = [(AXAuditInspectorFocus *)self spokenDescription];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditInspectorFocus *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditInspectorFocus *)v5 element];
      uint64_t v7 = [(AXAuditInspectorFocus *)self element];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        BOOL v14 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditInspectorFocus *)v5 inspectorSections];
        uint64_t v9 = [(AXAuditInspectorFocus *)self inspectorSections];
        if (v8 | v9 && ![(id)v8 isEqual:v9])
        {
          BOOL v14 = 0;
        }
        else
        {
          uint64_t v10 = [(AXAuditInspectorFocus *)v5 captionText];
          uint64_t v11 = [(AXAuditInspectorFocus *)self captionText];
          if (v10 | v11 && ![(id)v10 isEqual:v11])
          {
            BOOL v14 = 0;
          }
          else
          {
            uint64_t v16 = v8;
            uint64_t v12 = [(AXAuditInspectorFocus *)v5 spokenDescription];
            uint64_t v13 = [(AXAuditInspectorFocus *)self spokenDescription];
            BOOL v14 = !(v12 | v13) || [(id)v12 isEqual:v13];

            uint64_t v8 = v16;
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AXAuditInspectorFocus *)self element];
  [v4 setElement:v5];

  uint64_t v6 = [(AXAuditInspectorFocus *)self inspectorSections];
  uint64_t v7 = (void *)[v6 copy];
  [v4 setInspectorSections:v7];

  uint64_t v8 = [(AXAuditInspectorFocus *)self captionText];
  [v4 setCaptionText:v8];

  uint64_t v9 = [(AXAuditInspectorFocus *)self spokenDescription];
  [v4 setSpokenDescription:v9];

  return v4;
}

- (AXAuditElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (NSArray)inspectorSections
{
  return self->_inspectorSections;
}

- (NSString)captionText
{
  return self->_captionText;
}

- (void)setCaptionText:(id)a3
{
}

- (NSString)spokenDescription
{
  return self->_spokenDescription;
}

- (void)setSpokenDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenDescription, 0);
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_inspectorSections, 0);

  objc_storeStrong((id *)&self->_element, 0);
}

@end