@interface NEIKEv2SubnetAttribute
+ (id)copyTypeDescription;
- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 ipv4SubnetMask:(unsigned int)a4;
- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 prefix:(unsigned __int8)a4;
- (NWAddressEndpoint)address;
- (NWAddressEndpoint)subnetMaskAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 ipv4SubnetMask:(unsigned int)a6;
- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 prefix:(unsigned __int8)a6;
- (unint64_t)attributeType;
- (unsigned)ipv4SubnetMask;
- (unsigned)prefix;
@end

@implementation NEIKEv2SubnetAttribute

- (void).cxx_destruct
{
}

- (unsigned)ipv4SubnetMask
{
  return self->_ipv4SubnetMask;
}

- (unsigned)prefix
{
  return self->_prefix;
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2SubnetAttribute *)self attributeType];
  v6 = [(NEIKEv2ConfigurationAttribute *)self attributeName];
  v7 = [(NEIKEv2SubnetAttribute *)self address];
  v8 = (void *)[v7 copy];
  v9 = objc_msgSend(v4, "initCustomWithAttributeType:attributeName:addressValue:prefix:", v5, v6, v8, -[NEIKEv2SubnetAttribute prefix](self, "prefix"));

  return v9;
}

- (NWAddressEndpoint)subnetMaskAddress
{
  v3 = [(NEIKEv2SubnetAttribute *)self address];
  uint64_t v4 = [v3 addressFamily];

  unint64_t v5 = (void *)MEMORY[0x1E4F38BC8];
  int v6 = [(NEIKEv2SubnetAttribute *)self prefix];
  if (v4 == 2) {
    CFStringRef v7 = NECreateIPv4AddressMaskStringFromPrefix(v6);
  }
  else {
    CFStringRef v7 = NECreateIPv6AddressMaskStringFromPrefix(v6);
  }
  v8 = (__CFString *)v7;
  v9 = [v5 endpointWithHostname:v7 port:@"0"];

  return (NWAddressEndpoint *)v9;
}

- (id)description
{
  return [(NEIKEv2SubnetAttribute *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  CFStringRef v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEIKEv2ConfigurationAttribute *)self attributeName];
  [v7 appendPrettyObject:v8 withName:@"Name" andIndent:v5 options:a4];

  String = NEIKEv2AttributeTypeCreateString([(NEIKEv2SubnetAttribute *)self attributeType]);
  [v7 appendPrettyObject:String withName:@"Type" andIndent:v5 options:a4];

  v10 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v10 withName:@"Payload Type" andIndent:v5 options:a4];

  v11 = [(NEIKEv2SubnetAttribute *)self address];
  [v7 appendPrettyObject:v11 withName:@"Address" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2SubnetAttribute prefix](self, "prefix"), @"Prefix", v5, a4);

  return v7;
}

- (unint64_t)attributeType
{
  if (self) {
    return *(void *)(self + 32);
  }
  return self;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 ipv4SubnetMask:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  v11 = [(NEIKEv2SubnetAttribute *)self initWithAddress:a5 ipv4SubnetMask:v6];
  v13 = v11;
  if (v11)
  {
    v11->_customType = a3;
    objc_setProperty_atomic(v11, v12, v10, 8);
  }

  return v13;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 prefix:(unsigned __int8)a6
{
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NEIKEv2SubnetAttribute;
  v12 = [(NEIKEv2SubnetAttribute *)&v20 init];
  v14 = v12;
  if (v12)
  {
    v12->_customType = a3;
    objc_setProperty_atomic(v12, v13, v10, 8);
    objc_setProperty_atomic(v14, v15, v11, 24);
    v14->_prefix = a6;
    v16 = v14;
  }
  else
  {
    v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19[0] = 0;
      _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v19, 2u);
    }
  }
  return v14;
}

- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 ipv4SubnetMask:(unsigned int)a4
{
  id v6 = a3;
  unsigned int v25 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NEIKEv2SubnetAttribute;
  CFStringRef v7 = [(NEIKEv2SubnetAttribute *)&v24 init];
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 24);
    objc_setProperty_atomic(v9, v10, @"AssignedSubnet", 8);
    uint64_t v11 = 0;
    char v12 = 0;
    v9->_ipv4SubnetMask = a4;
    while (1)
    {
      int v13 = *((unsigned __int8 *)&v25 + v11);
      if (v13 != 255) {
        break;
      }
      v12 += 8;
      if (++v11 == 4)
      {
        char v12 = 32;
        goto LABEL_24;
      }
    }
    char v14 = v12 | 6;
    char v15 = v12 | 7;
    if (v13 != 254) {
      char v15 = v12;
    }
    if (v13 != 252) {
      char v14 = v15;
    }
    char v16 = v12 | 4;
    char v17 = v12 | 5;
    if (v13 != 248) {
      char v17 = v12;
    }
    if (v13 != 240) {
      char v16 = v17;
    }
    if (v13 <= 251) {
      char v14 = v16;
    }
    char v18 = v12 | 1;
    char v19 = v12 | 2;
    if (v13 == 224) {
      v12 |= 3u;
    }
    if (v13 == 192) {
      char v12 = v19;
    }
    if (v13 == 128) {
      char v12 = v18;
    }
    if (v13 > 239) {
      char v12 = v14;
    }
LABEL_24:
    v9->_prefix = v12;
    objc_super v20 = v9;
  }
  else
  {
    v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      __int16 v23 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)&v23, 2u);
    }
  }
  return v9;
}

- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2SubnetAttribute;
  CFStringRef v7 = [(NEIKEv2SubnetAttribute *)&v15 init];
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 24);
    objc_setProperty_atomic(v9, v10, @"AssignedSubnet", 8);
    v9->_prefix = a4;
    uint64_t v11 = v9;
  }
  else
  {
    int v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v14 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "[super init] failed", v14, 2u);
    }
  }
  return v9;
}

+ (id)copyTypeDescription
{
  return @"Subnet";
}

@end