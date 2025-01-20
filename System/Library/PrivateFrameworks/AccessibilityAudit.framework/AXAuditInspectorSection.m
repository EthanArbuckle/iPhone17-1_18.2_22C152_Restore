@interface AXAuditInspectorSection
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditInspectorSection)init;
- (BOOL)isEqual:(id)a3;
- (NSArray)elementAttributes;
- (NSMutableArray)_elementAttributes;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (id)addAttribute:(id)a3 performsAction:(BOOL)a4 humanReadable:(id)a5 settable:(BOOL)a6 valueType:(int64_t)a7 isInternal:(BOOL)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)addAttribute:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)set_elementAttributes:(id)a3;
@end

@implementation AXAuditInspectorSection

- (AXAuditInspectorSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAuditInspectorSection;
  v2 = [(AXAuditInspectorSection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    elementAttributes = v2->__elementAttributes;
    v2->__elementAttributes = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)addAttribute:(id)a3 performsAction:(BOOL)a4 humanReadable:(id)a5 settable:(BOOL)a6 valueType:(int64_t)a7 isInternal:(BOOL)a8
{
  BOOL v25 = a6;
  BOOL v26 = a8;
  BOOL v9 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v27 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v12 = [(AXAuditInspectorSection *)self elementAttributes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v13)
  {
LABEL_12:

    goto LABEL_15;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v29;
LABEL_3:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v29 != v15) {
      objc_enumerationMutation(v12);
    }
    v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
    v18 = [v17 attributeName];
    if (![v18 isEqual:v11])
    {

      goto LABEL_10;
    }
    int v19 = [v17 performsAction];

    if (v19 == v9) {
      break;
    }
LABEL_10:
    if (v14 == ++v16)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v14) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }
  id v20 = v17;

  if (v20)
  {
    v21 = 0;
    v22 = v27;
    goto LABEL_16;
  }
LABEL_15:
  v21 = objc_opt_new();
  [v21 setAttributeName:v11];
  [v21 setPerformsAction:v9];
  v22 = v27;
  [v21 setHumanReadableName:v27];
  [v21 setValueType:a7];
  [v21 setSettable:v25];
  [v21 setIsInternal:v26];
  [(AXAuditInspectorSection *)self addAttribute:v21];
  id v20 = 0;
LABEL_16:

  return v21;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v7 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditInspectorSection_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"ElementAttributesValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_10];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_11_1];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"TitleValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_18_0];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_21_0];
  objc_super v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v7 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"IdentifierValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_27_0];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_29_0];
  [v3 registerTransportInfoPropertyBased:v7];
}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementAttributes];
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[v4 mutableCopy];
    objc_msgSend(v6, "set_elementAttributes:", v5);
  }
}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 title];
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setTitle:v4];
  }
}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setIdentifier:v4];
  }
}

- (void)addAttribute:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AXAuditInspectorSection *)self _elementAttributes];
    [v5 addObject:v4];
  }
}

- (NSArray)elementAttributes
{
  v2 = [(AXAuditInspectorSection *)self _elementAttributes];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  id v3 = [(AXAuditInspectorSection *)self title];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditInspectorSection *)self elementAttributes];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(AXAuditInspectorSection *)self identifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditInspectorSection *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditInspectorSection *)self title];
      uint64_t v7 = [(AXAuditInspectorSection *)v5 title];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditInspectorSection *)self elementAttributes];
        uint64_t v9 = [(AXAuditInspectorSection *)v5 elementAttributes];
        if (v8 | v9 && ![(id)v8 isEqual:v9])
        {
          BOOL v12 = 0;
        }
        else
        {
          uint64_t v10 = [(AXAuditInspectorSection *)self identifier];
          uint64_t v11 = [(AXAuditInspectorSection *)v5 identifier];
          BOOL v12 = !(v10 | v11) || [(id)v10 isEqual:v11];
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AXAuditInspectorSection *)self title];
  [v4 setTitle:v5];

  uint64_t v6 = [(AXAuditInspectorSection *)self identifier];
  [v4 setIdentifier:v6];

  uint64_t v7 = [(AXAuditInspectorSection *)self _elementAttributes];
  uint64_t v8 = (void *)[v7 mutableCopy];
  objc_msgSend(v4, "set_elementAttributes:", v8);

  return v4;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditInspectorSection;
  id v3 = [(AXAuditInspectorSection *)&v7 description];
  uint64_t v4 = [(AXAuditInspectorSection *)self title];
  id v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableArray)_elementAttributes
{
  return self->__elementAttributes;
}

- (void)set_elementAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__elementAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end