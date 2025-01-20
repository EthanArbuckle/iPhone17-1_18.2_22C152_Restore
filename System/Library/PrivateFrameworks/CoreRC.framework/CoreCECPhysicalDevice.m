@interface CoreCECPhysicalDevice
+ (id)physicalDeviceTreeWithLogicalDevices:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CoreCECPhysicalDevice)init;
- (CoreCECPhysicalDevice)initWithLogicalDevice:(id)a3;
- (CoreCECPhysicalDevice)initWithPhysicalAddress:(unint64_t)a3;
- (CoreCECPhysicalDevice)parent;
- (NSArray)children;
- (NSSet)logicalDevices;
- (id)description;
- (id)propertyList;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)physicalAddress;
- (void)addChild:(id)a3;
- (void)addLogicalDevice:(id)a3;
- (void)dealloc;
- (void)setParent:(id)a3;
@end

@implementation CoreCECPhysicalDevice

- (CoreCECPhysicalDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECPhysicalDevice;
  v2 = [(CoreCECPhysicalDevice *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_physicalAddress = 252645135;
    v2->_logicalDevices = (NSMutableSet *)objc_opt_new();
    v3->_children = (NSMutableArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECPhysicalDevice;
  [(CoreCECPhysicalDevice *)&v3 dealloc];
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  v16.receiver = self;
  v16.super_class = (Class)CoreCECPhysicalDevice;
  id v4 = [(CoreCECPhysicalDevice *)&v16 description];
  objc_super v5 = objc_msgSend(v3, "stringWithFormat:", @"%@ %@ ("), v4, CoreCECPhysicalAddressString(self->_physicalAddress);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(CoreCECPhysicalDevice *)self logicalDevices];
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "appendFormat:", @" %u", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "logicalAddress"));
      }
      while (v8 != v10);
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
  [v5 appendString:@""]);
  return (id)[NSString stringWithString:v5];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(CoreCECPhysicalDevice *)self physicalAddress];
  return v5 == [a3 physicalAddress];
}

- (unint64_t)hash
{
  return self->_physicalAddress & 0xF0F0F0F;
}

- (CoreCECPhysicalDevice)initWithPhysicalAddress:(unint64_t)a3
{
  if (CoreCECPhysicalAddressIsValid(a3))
  {
    result = [(CoreCECPhysicalDevice *)self init];
    if (result) {
      result->_physicalAddress = a3;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (CoreCECPhysicalDevice)initWithLogicalDevice:(id)a3
{
  id v4 = -[CoreCECPhysicalDevice initWithPhysicalAddress:](self, "initWithPhysicalAddress:", [a3 physicalAddress]);
  unint64_t v5 = v4;
  if (v4) {
    [(CoreCECPhysicalDevice *)v4 addLogicalDevice:a3];
  }
  return v5;
}

- (void)addChild:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->_children, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->_children addObject:a3];
    [(NSMutableArray *)self->_children sortUsingSelector:sel_compare_];
    [a3 setParent:self];
  }
}

- (void)addLogicalDevice:(id)a3
{
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = [(CoreCECPhysicalDevice *)self physicalAddress];
  unint64_t v5 = [a3 physicalAddress];
  int64_t v6 = -1;
  if (v4 >= v5) {
    int64_t v6 = 1;
  }
  if (v4 == v5) {
    return 0;
  }
  else {
    return v6;
  }
}

+ (id)physicalDeviceTreeWithLogicalDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v25 = [[CoreCECPhysicalDevice alloc] initWithPhysicalAddress:0];
  unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v25, 0);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v9 physicalAddress] != 252645135)
        {
          uint64_t v10 = (CoreCECPhysicalDevice *)objc_msgSend(v4, "physicalDeviceWithAddress:", objc_msgSend(v9, "physicalAddress"));
          if (!v10)
          {
            v11 = [[CoreCECPhysicalDevice alloc] initWithLogicalDevice:v9];
            if (!v11) {
              continue;
            }
            uint64_t v10 = v11;
            [v4 addObject:v11];
          }
          [(CoreCECPhysicalDevice *)v10 addLogicalDevice:v9];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v12 = (void *)[MEMORY[0x263EFFA08] setWithSet:v4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(CoreCECPhysicalDevice **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v18 = [(CoreCECPhysicalDevice *)v17 physicalAddress];
        if (v18)
        {
          uint64_t v19 = 255;
          do
          {
            uint64_t v20 = v19;
            v19 <<= 8;
          }
          while ((v20 & v18) == 0);
          uint64_t v21 = v18 & ~v20;
          if (v21)
          {
            do
            {
              v22 = (CoreCECPhysicalDevice *)[v4 physicalDeviceWithAddress:v21];
              if (!v22)
              {
                v23 = [[CoreCECPhysicalDevice alloc] initWithPhysicalAddress:v21];
                if (!v23) {
                  goto LABEL_29;
                }
                v22 = v23;
                [v4 addObject:v23];
              }
              [(CoreCECPhysicalDevice *)v22 addChild:v17];
              v21 &= ~(v20 << 8);
              v20 <<= 8;
              v17 = v22;
            }
            while (v21);
          }
          else
          {
            v22 = v17;
          }
          [(CoreCECPhysicalDevice *)v25 addChild:v22];
        }
LABEL_29:
        ;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v14);
  }

  return v25;
}

- (NSArray)children
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_children];
}

- (NSSet)logicalDevices
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_logicalDevices];
}

- (id)propertyList
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v3 setValue:CoreCECPhysicalAddressString(self->_physicalAddress) forKey:@"physical address"];
  objc_msgSend(v3, "setValue:forKey:", -[NSArray valueForKey:](-[CoreCECPhysicalDevice children](self, "children"), "valueForKey:", @"propertyList"), @"children");
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(-[NSSet valueForKey:](-[CoreCECPhysicalDevice logicalDevices](self, "logicalDevices"), "valueForKey:", @"logicalAddress"), "allObjects"), @"logical addresses");
  unint64_t v4 = NSDictionary;
  return (id)[v4 dictionaryWithDictionary:v3];
}

- (unint64_t)physicalAddress
{
  return self->_physicalAddress;
}

- (CoreCECPhysicalDevice)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  self->_parent = (CoreCECPhysicalDevice *)a3;
}

@end