@interface AXAuditNode
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditElement)auditElement;
- (AXAuditNode)initWithAuditElement:(id)a3 description:(id)a4 roleDescription:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIgnored;
- (NSArray)children;
- (NSString)className;
- (NSString)description;
- (NSString)humanReadableDescription;
- (NSString)humanReadableRoleDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_printDescendantsWithLevel:(unint64_t)a3;
- (void)debugPrintDescendants;
- (void)setAuditElement:(id)a3;
- (void)setChildren:(id)a3;
- (void)setClassName:(id)a3;
- (void)setHumanReadableDescription:(id)a3;
- (void)setHumanReadableRoleDescription:(id)a3;
- (void)setIsIgnored:(BOOL)a3;
@end

@implementation AXAuditNode

- (AXAuditNode)initWithAuditElement:(id)a3 description:(id)a4 roleDescription:(id)a5
{
  id v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)AXAuditNode;
  v11 = [(AXAuditNode *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(AXAuditNode *)v11 setAuditElement:v8];
    if (v9) {
      v13 = v9;
    }
    else {
      v13 = &stru_26FB6E0B0;
    }
    [(AXAuditNode *)v12 setHumanReadableDescription:v13];
    if (v10) {
      v14 = v10;
    }
    else {
      v14 = &stru_26FB6E0B0;
    }
    [(AXAuditNode *)v12 setHumanReadableRoleDescription:v14];
  }

  return v12;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v10 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditNode_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"AuditElementValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_15];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_12];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"HumanReadableRoleDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_19_0];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_22_0];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"HumanReadableDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_28];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_30_0];
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"ClassNameValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_35_0];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_37];
  id v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v8];
  [(AXAuditObjectTransportPropertyEntry *)v8 setTransportKey:@"IsIgnoredValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v8 setLocalValueToTransportValue:&__block_literal_global_43_0];
  [(AXAuditObjectTransportPropertyEntry *)v8 setPopulateLocalObjectWithTransportValue:&__block_literal_global_45];
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v10 addPropertyEntry:v9];
  [(AXAuditObjectTransportPropertyEntry *)v9 setTransportKey:@"ChildrenValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v9 setLocalValueToTransportValue:&__block_literal_global_54_0];
  [(AXAuditObjectTransportPropertyEntry *)v9 setPopulateLocalObjectWithTransportValue:&__block_literal_global_57_1];
  [v3 registerTransportInfoPropertyBased:v10];
}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 auditElement];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAuditElement:v4];
  }
}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 humanReadableRoleDescription];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setHumanReadableRoleDescription:v4];
  }
}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 humanReadableDescription];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setHumanReadableDescription:v4];
  }
}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 className];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setClassName:v4];
  }
}

id __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  if ([a2 isIgnored]) {
    v2 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    v2 = (void *)MEMORY[0x263EFFA80];
  }

  return v2;
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setIsIgnored:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 children];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setChildren:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditNode *)self auditElement];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditNode *)self humanReadableDescription];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(AXAuditNode *)self children];
  uint64_t v8 = [v7 hash];
  v9 = [(AXAuditNode *)self humanReadableRoleDescription];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(AXAuditNode *)self className];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v10 ^ (v12 + [(AXAuditNode *)self isIgnored]);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditNode *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditNode *)v5 auditElement];
      uint64_t v7 = [(AXAuditNode *)self auditElement];
      if (v6 | v7 && ![(id)v6 isEqual:v7])
      {
        char v20 = 0;
      }
      else
      {
        uint64_t v8 = [(AXAuditNode *)v5 className];
        uint64_t v9 = [(AXAuditNode *)self className];
        if (v8 | v9 && ![(id)v8 isEqual:v9])
        {
          char v20 = 0;
        }
        else
        {
          uint64_t v10 = [(AXAuditNode *)v5 humanReadableDescription];
          uint64_t v11 = [(AXAuditNode *)self humanReadableDescription];
          if (v10 | v11 && ![(id)v10 isEqual:v11])
          {
            char v20 = 0;
          }
          else
          {
            uint64_t v12 = [(AXAuditNode *)v5 humanReadableRoleDescription];
            uint64_t v25 = [(AXAuditNode *)self humanReadableRoleDescription];
            if (v12 | v25 && ![(id)v12 isEqual:v25])
            {
              char v20 = 0;
            }
            else
            {
              uint64_t v23 = v12;
              uint64_t v24 = v11;
              unint64_t v13 = [(AXAuditNode *)v5 children];
              uint64_t v14 = [(AXAuditNode *)self children];
              v15 = (void *)v14;
              if (v13 && v14 && ![v13 isEqualToArray:v14])
              {
                char v20 = 0;
              }
              else
              {
                uint64_t v22 = v9;
                uint64_t v16 = v10;
                uint64_t v17 = v8;
                BOOL v18 = [(AXAuditNode *)v5 isIgnored];
                int v19 = v18 ^ [(AXAuditNode *)self isIgnored];
                uint64_t v8 = v17;
                uint64_t v10 = v16;
                uint64_t v9 = v22;
                char v20 = v19 ^ 1;
              }

              uint64_t v12 = v23;
              uint64_t v11 = v24;
            }
          }
        }
      }
    }
    else
    {
      char v20 = 0;
    }
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AXAuditNode *)self auditElement];
  [v4 setAuditElement:v5];

  uint64_t v6 = [(AXAuditNode *)self humanReadableDescription];
  [v4 setHumanReadableDescription:v6];

  uint64_t v7 = [(AXAuditNode *)self humanReadableRoleDescription];
  [v4 setHumanReadableRoleDescription:v7];

  uint64_t v8 = [(AXAuditNode *)self className];
  [v4 setClassName:v8];

  uint64_t v9 = [(AXAuditNode *)self children];
  [v4 setChildren:v9];

  objc_msgSend(v4, "setIsIgnored:", -[AXAuditNode isIgnored](self, "isIgnored"));
  return v4;
}

- (void)debugPrintDescendants
{
}

- (void)_printDescendantsWithLevel:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [(AXAuditNode *)self humanReadableDescription];
  uint64_t v6 = [(AXAuditNode *)self humanReadableRoleDescription];
  NSLog(&cfstr_AxauditnodeLd.isa, a3, v5, v6);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(AXAuditNode *)self children];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a3 + 1;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _printDescendantsWithLevel:v10];
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)AXAuditNode;
  id v3 = [(AXAuditNode *)&v9 description];
  uint64_t v4 = [(AXAuditNode *)self humanReadableDescription];
  id v5 = [(AXAuditNode *)self humanReadableRoleDescription];
  uint64_t v6 = [(AXAuditNode *)self children];
  uint64_t v7 = [v3 stringByAppendingFormat:@" %@(%@) with %ld children", v4, v5, objc_msgSend(v6, "count")];

  return (NSString *)v7;
}

- (AXAuditElement)auditElement
{
  return self->_auditElement;
}

- (void)setAuditElement:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
}

- (NSString)humanReadableRoleDescription
{
  return self->_humanReadableRoleDescription;
}

- (void)setHumanReadableRoleDescription:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_humanReadableRoleDescription, 0);
  objc_storeStrong((id *)&self->_humanReadableDescription, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_auditElement, 0);
}

@end