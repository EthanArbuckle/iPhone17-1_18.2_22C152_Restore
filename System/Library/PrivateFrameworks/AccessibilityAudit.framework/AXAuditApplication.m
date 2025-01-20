@interface AXAuditApplication
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditPSN)psnObj;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (UIImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setPid:(int)a3;
- (void)setPsnObj:(id)a3;
@end

@implementation AXAuditApplication

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v9 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditApplication_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"IconValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_20];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_9_1];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"DisplayNameValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_17_3];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_20];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"BundleIdentifierValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_26_0];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_28_0];
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"PidValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_34_0];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_38_0];
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v8];
  [(AXAuditObjectTransportPropertyEntry *)v8 setTransportKey:@"PsnValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v8 setLocalValueToTransportValue:&__block_literal_global_44];
  [(AXAuditObjectTransportPropertyEntry *)v8 setPopulateLocalObjectWithTransportValue:&__block_literal_global_47];
  [v3 registerTransportInfoPropertyBased:v9];
}

id __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 icon];
  id v3 = UIImagePNGRepresentation(v2);

  return v3;
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v4];
    [v6 setIcon:v5];
  }
}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 displayName];
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setDisplayName:v4];
  }
}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setBundleIdentifier:v4];
  }
}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 pid];

  return [v2 numberWithInt:v3];
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPid:", objc_msgSend(v4, "integerValue"));
  }
}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 psnObj];
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setPsnObj:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditApplication *)self psnObj];
  id v6 = (void *)[v5 copy];
  [v4 setPsnObj:v6];

  objc_msgSend(v4, "setPid:", -[AXAuditApplication pid](self, "pid"));
  v7 = [(AXAuditApplication *)self displayName];
  [v4 setDisplayName:v7];

  v8 = [(AXAuditApplication *)self bundleIdentifier];
  [v4 setBundleIdentifier:v8];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(AXAuditApplication *)self psnObj];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(AXAuditApplication *)self pid];
  id v6 = [(AXAuditApplication *)self displayName];
  uint64_t v7 = [v6 hash];
  v8 = [(AXAuditApplication *)self bundleIdentifier];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditApplication *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(AXAuditApplication *)self psnObj];
      uint64_t v7 = [(AXAuditApplication *)v5 psnObj];
      int v8 = [(AXAuditApplication *)v5 pid];
      if (v8 == [(AXAuditApplication *)self pid]
        && (!(v6 | v7) || [(id)v6 isEqual:v7]))
      {
        uint64_t v9 = [(AXAuditApplication *)self displayName];
        uint64_t v10 = [(AXAuditApplication *)v5 displayName];
        if (v9 | v10 && ![(id)v9 isEqual:v10])
        {
          BOOL v13 = 0;
        }
        else
        {
          uint64_t v11 = [(AXAuditApplication *)self bundleIdentifier];
          uint64_t v12 = [(AXAuditApplication *)v5 bundleIdentifier];
          BOOL v13 = !(v11 | v12) || [(id)v11 isEqual:v12];
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (AXAuditPSN)psnObj
{
  return self->_psnObj;
}

- (void)setPsnObj:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_psnObj, 0);
}

@end