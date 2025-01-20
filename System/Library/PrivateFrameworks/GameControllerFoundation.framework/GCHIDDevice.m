@interface GCHIDDevice
- (GCHIDDevice)init;
- (GCHIDDevice)initWithService:(unsigned int)a3;
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
@end

@implementation GCHIDDevice

- (GCHIDDevice)initWithService:(unsigned int)a3
{
  v22.receiver = self;
  v22.super_class = (Class)GCHIDDevice;
  v3 = [(GCHIDDevice *)&v22 initWithService:*(void *)&a3];
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    CFArrayRef v5 = IOHIDDeviceCopyMatchingElements((IOHIDDeviceRef)v3, 0, 0);
    if (v5)
    {
      v6 = objc_opt_new();
      v7 = objc_opt_new();
      v8 = objc_opt_new();
      v9 = objc_opt_new();
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__5;
      v37 = __Block_byref_object_dispose__5;
      id v38 = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = __ProcessHIDElements_block_invoke;
      aBlock[3] = &unk_26BEC4AA8;
      id v21 = v9;
      id v28 = v21;
      id v10 = v7;
      id v29 = v10;
      id v11 = v8;
      id v30 = v11;
      id v12 = v6;
      id v31 = v12;
      v32 = &v33;
      v13 = _Block_copy(aBlock);
      v14 = _Block_copy(v13);
      v15 = (void *)v34[5];
      v34[5] = (uint64_t)v14;

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      CFArrayRef v16 = v5;
      uint64_t v17 = [(__CFArray *)v16 countByEnumeratingWithState:&v23 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v24;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v16);
            }
            (*((void (**)(void *, void))v13 + 2))(v13, *(void *)(*((void *)&v23 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          uint64_t v17 = [(__CFArray *)v16 countByEnumeratingWithState:&v23 objects:v39 count:16];
        }
        while (v17);
      }

      [v12 enumerateObjectsUsingBlock:&__block_literal_global_10];
      [v10 enumerateObjectsUsingBlock:&__block_literal_global_78];
      [v11 enumerateObjectsUsingBlock:&__block_literal_global_83];

      _Block_object_dispose(&v33, 8);
      CFRelease(v16);
    }
  }
  return v3;
}

- (GCHIDDevice)init
{
  return 0;
}

- (id)debugDescription
{
  v15.receiver = self;
  v15.super_class = (Class)GCHIDDevice;
  v14 = [(GCHIDDevice *)&v15 debugDescription];
  v3 = [(GCHIDDevice *)self transport];
  v4 = [(GCHIDDevice *)self vendorID];
  CFArrayRef v5 = [(GCHIDDevice *)self productID];
  v6 = [(GCHIDDevice *)self versionNumber];
  v7 = [(GCHIDDevice *)self manufacturer];
  v8 = [(GCHIDDevice *)self product];
  v9 = [(GCHIDDevice *)self maxInputReportSize];
  id v10 = [(GCHIDDevice *)self maxOutputReportSize];
  id v11 = [(GCHIDDevice *)self maxFeatureReportSize];
  id v12 = +[NSString stringWithFormat:@"%@ {\n\t transport = %@\n\t vendorID = %@\n\t productID = %@\n\t versionNumber = %@\n\t manufacturer = %@\n\t product = %@\n\t maxInputReportSize = %@\n\t maxOutputReportSize = %@\n\t maxFeatureReportSize = %@\n}", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)transport
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"Transport"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)vendorID
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"VendorID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)productID
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"ProductID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)versionNumber
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"VersionNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)manufacturer
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"Manufacturer"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)product
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"Product"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)maxInputReportSize
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"MaxInputReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)maxOutputReportSize
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"MaxOutputReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)maxFeatureReportSize
{
  v2 = [(GCHIDDevice *)self propertyForKey:@"MaxFeatureReportSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSArray)elements
{
  CFArrayRef v2 = IOHIDDeviceCopyMatchingElements((IOHIDDeviceRef)self, 0, 0);

  return (NSArray *)v2;
}

- (id)valueForHIDDeviceKey:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = GCHIDDeviceAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
    id v10 = [(GCHIDDevice *)self valueForKey:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = GCHIDDeviceAttributeKeys();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [v4 substringToIndex:1];
    v8 = [v7 lowercaseString];

    uint64_t v9 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);

    id v4 = (id)v9;
  }
  v12.receiver = self;
  v12.super_class = (Class)GCHIDDevice;
  id v10 = [(GCHIDDevice *)&v12 valueForKey:v4];

  return v10;
}

@end