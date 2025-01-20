@interface GCHIDDeviceSnapshot
+ (BOOL)supportsSecureCoding;
- (GCHIDDeviceSnapshot)init;
- (GCHIDDeviceSnapshot)initWithCoder:(id)a3;
- (GCHIDDeviceSnapshot)initWithHIDDevice:(id)a3;
- (GCHIDDeviceSnapshot)initWithService:(unsigned int)a3;
- (NSArray)elements;
- (NSNumber)maxFeatureReportSize;
- (NSNumber)maxInputReportSize;
- (NSNumber)maxOutputReportSize;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSNumber)versionNumber;
- (NSString)manufacturer;
- (NSString)product;
- (NSString)transport;
- (id)debugDescription;
- (id)valueForHIDDeviceKey:(id)a3;
- (id)valueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCHIDDeviceSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHIDDeviceSnapshot)init
{
  v5.receiver = self;
  v5.super_class = (Class)GCHIDDeviceSnapshot;
  v2 = [(GCHIDDeviceSnapshot *)&v5 init];
  elements = v2->_elements;
  v2->_elements = (NSArray *)&__NSArray0__struct;

  return v2;
}

- (GCHIDDeviceSnapshot)initWithService:(unsigned int)a3
{
  v39.receiver = self;
  v39.super_class = (Class)GCHIDDeviceSnapshot;
  v4 = [(GCHIDDeviceSnapshot *)&v39 init];
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, 0, 0);
  if (properties)
  {
    objc_super v5 = CFDictionaryGetValue(properties, @"Transport");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    objc_storeStrong((id *)&v4->_transport, v6);
    v7 = CFDictionaryGetValue(properties, @"VendorID");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&v4->_vendorID, v8);
    v9 = CFDictionaryGetValue(properties, @"ProductID");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&v4->_productID, v10);
    v11 = CFDictionaryGetValue(properties, @"VersionNumber");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&v4->_versionNumber, v12);
    v13 = CFDictionaryGetValue(properties, @"Manufacturer");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v4->_manufacturer, v14);
    v15 = CFDictionaryGetValue(properties, @"Product");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&v4->_product, v16);
    uint64_t v17 = CFDictionaryGetValue(properties, @"MaxInputReportSize");
    objc_opt_class();
    v36 = (void *)v17;
    if (objc_opt_isKindOfClass()) {
      v18 = (void *)v17;
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&v4->_maxInputReportSize, v18);
    uint64_t v19 = CFDictionaryGetValue(properties, @"MaxOutputReportSize");
    objc_opt_class();
    v35 = (void *)v19;
    if (objc_opt_isKindOfClass()) {
      v20 = (void *)v19;
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)&v4->_maxOutputReportSize, v20);
    uint64_t v21 = CFDictionaryGetValue(properties, @"MaxFeatureReportSize");
    objc_opt_class();
    v37 = (void *)v21;
    if (objc_opt_isKindOfClass()) {
      v22 = (void *)v21;
    }
    else {
      v22 = 0;
    }
    objc_storeStrong((id *)&v4->_maxFeatureReportSize, v22);
    v23 = CFDictionaryGetValue(properties, @"Elements");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = v11;
      v33 = v9;
      v34 = v7;
      v24 = (void *)[v23 mutableCopy];

      v25 = objc_opt_new();
      while ([v24 count])
      {
        v26 = [v24 firstObject];
        [v24 removeObjectAtIndex:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v27 = [[GCHIDElementSnapshot alloc] initWithDictionary:v26];
          if (v27) {
            [v25 addObject:v27];
          }
          v28 = [v26 objectForKey:@"Elements"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v24 addObjectsFromArray:v28];
          }
        }
      }
      uint64_t v29 = [v25 copy];
      elements = v4->_elements;
      v4->_elements = (NSArray *)v29;

      v7 = v34;
      v11 = v32;
      v9 = v33;
    }
    else
    {
      v24 = v23;
    }
    CFRelease(properties);
  }
  return v4;
}

- (GCHIDDeviceSnapshot)initWithHIDDevice:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)GCHIDDeviceSnapshot;
  id v3 = a3;
  v4 = [(GCHIDDeviceSnapshot *)&v29 init];
  uint64_t v5 = [v3 propertyForKey:@"Transport"];
  v28 = (void *)v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = (void *)v5;
  }
  else {
    v6 = 0;
  }
  objc_storeStrong((id *)&v4->_transport, v6);
  uint64_t v7 = [v3 propertyForKey:@"VendorID"];
  v27 = (void *)v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = (void *)v7;
  }
  else {
    v8 = 0;
  }
  objc_storeStrong((id *)&v4->_vendorID, v8);
  v9 = [v3 propertyForKey:@"ProductID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  objc_storeStrong((id *)&v4->_productID, v10);
  v11 = [v3 propertyForKey:@"VersionNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  objc_storeStrong((id *)&v4->_versionNumber, v12);
  v13 = [v3 propertyForKey:@"Manufacturer"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  objc_storeStrong((id *)&v4->_manufacturer, v14);
  v15 = [v3 propertyForKey:@"Product"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  objc_storeStrong((id *)&v4->_product, v16);
  uint64_t v17 = [v3 propertyForKey:@"MaxInputReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  objc_storeStrong((id *)&v4->_maxInputReportSize, v18);
  uint64_t v19 = [v3 propertyForKey:@"MaxOutputReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  objc_storeStrong((id *)&v4->_maxOutputReportSize, v20);
  uint64_t v21 = [v3 propertyForKey:@"MaxFeatureReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  objc_storeStrong((id *)&v4->_maxFeatureReportSize, v22);
  v23 = [v3 elementsMatching:&__NSDictionary0__struct];

  uint64_t v24 = objc_msgSend(v23, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_9);
  elements = v4->_elements;
  v4->_elements = (NSArray *)v24;

  return v4;
}

uint64_t __41__GCHIDDeviceSnapshot_initWithHIDDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gc_snapshot");
}

- (GCHIDDeviceSnapshot)initWithCoder:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)GCHIDDeviceSnapshot;
  id v3 = a3;
  v4 = [(GCHIDDeviceSnapshot *)&v28 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Transport"];
  transport = v4->_transport;
  v4->_transport = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"VendorID"];
  vendorID = v4->_vendorID;
  v4->_vendorID = (NSNumber *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ProductID"];
  productID = v4->_productID;
  v4->_productID = (NSNumber *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"VersionNumber"];
  versionNumber = v4->_versionNumber;
  v4->_versionNumber = (NSNumber *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Manufacturer"];
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v13;

  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Product"];
  product = v4->_product;
  v4->_product = (NSString *)v15;

  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MaxInputReportSize"];
  maxInputReportSize = v4->_maxInputReportSize;
  v4->_maxInputReportSize = (NSNumber *)v17;

  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MaxOutputReportSize"];
  maxOutputReportSize = v4->_maxOutputReportSize;
  v4->_maxOutputReportSize = (NSNumber *)v19;

  uint64_t v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"MaxFeatureReportSize"];
  maxFeatureReportSize = v4->_maxFeatureReportSize;
  v4->_maxFeatureReportSize = (NSNumber *)v21;

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v23 = +[NSArray arrayWithObjects:v29 count:2];
  uint64_t v24 = +[NSSet setWithArray:v23];
  uint64_t v25 = [v3 decodeObjectOfClasses:v24 forKey:@"elements"];

  elements = v4->_elements;
  v4->_elements = (NSArray *)v25;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  transport = self->_transport;
  id v5 = a3;
  [v5 encodeObject:transport forKey:@"Transport"];
  [v5 encodeObject:self->_vendorID forKey:@"VendorID"];
  [v5 encodeObject:self->_productID forKey:@"ProductID"];
  [v5 encodeObject:self->_versionNumber forKey:@"VersionNumber"];
  [v5 encodeObject:self->_manufacturer forKey:@"Manufacturer"];
  [v5 encodeObject:self->_product forKey:@"Product"];
  [v5 encodeObject:self->_maxInputReportSize forKey:@"MaxInputReportSize"];
  [v5 encodeObject:self->_maxOutputReportSize forKey:@"MaxOutputReportSize"];
  [v5 encodeObject:self->_maxFeatureReportSize forKey:@"MaxFeatureReportSize"];
  id v6 = [(GCHIDDeviceSnapshot *)self elements];
  [v5 encodeObject:v6 forKey:@"elements"];
}

- (id)debugDescription
{
  v27.receiver = self;
  v27.super_class = (Class)GCHIDDeviceSnapshot;
  id v3 = [(GCHIDDeviceSnapshot *)&v27 debugDescription];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@" {\n"];
  id v5 = [(GCHIDDeviceSnapshot *)self transport];
  [v4 appendFormat:@"\t transport = %@\n", v5];

  id v6 = [(GCHIDDeviceSnapshot *)self vendorID];
  [v4 appendFormat:@"\t vendorID = %@\n", v6];

  uint64_t v7 = [(GCHIDDeviceSnapshot *)self productID];
  [v4 appendFormat:@"\t productID = %@\n", v7];

  v8 = [(GCHIDDeviceSnapshot *)self versionNumber];
  [v4 appendFormat:@"\t versionNumber = %@\n", v8];

  uint64_t v9 = [(GCHIDDeviceSnapshot *)self manufacturer];
  [v4 appendFormat:@"\t manufacturer = %@\n", v9];

  v10 = [(GCHIDDeviceSnapshot *)self product];
  [v4 appendFormat:@"\t product = %@\n", v10];

  uint64_t v11 = [(GCHIDDeviceSnapshot *)self maxInputReportSize];
  [v4 appendFormat:@"\t maxInputReportSize = %@\n", v11];

  v12 = [(GCHIDDeviceSnapshot *)self maxOutputReportSize];
  [v4 appendFormat:@"\t maxOutputReportSize = %@\n", v12];

  uint64_t v13 = [(GCHIDDeviceSnapshot *)self maxFeatureReportSize];
  [v4 appendFormat:@"\t maxFeatureReportSize = %@\n", v13];

  v14 = [(GCHIDDeviceSnapshot *)self elements];
  objc_msgSend(v4, "appendFormat:", @"\t elements (%zu) = {\n", objc_msgSend(v14, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [(GCHIDDeviceSnapshot *)self elements];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) debugDescription];
        uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
        [v4 appendFormat:@"\t\t %@\n", v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  [v4 appendFormat:@"\t }\n"];

  return v4;
}

- (id)valueForHIDDeviceKey:(id)a3
{
  id v4 = a3;
  id v5 = GCHIDDeviceAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    uint64_t v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    v10 = [(GCHIDDeviceSnapshot *)self valueForKey:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  id v5 = GCHIDDeviceAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    uint64_t v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);

    id v4 = (id)v9;
  }
  v12.receiver = self;
  v12.super_class = (Class)GCHIDDeviceSnapshot;
  v10 = [(GCHIDDeviceSnapshot *)&v12 valueForKey:v4];

  return v10;
}

- (NSString)transport
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)product
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)maxInputReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)maxOutputReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)maxFeatureReportSize
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)elements
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_maxFeatureReportSize, 0);
  objc_storeStrong((id *)&self->_maxOutputReportSize, 0);
  objc_storeStrong((id *)&self->_maxInputReportSize, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

@end