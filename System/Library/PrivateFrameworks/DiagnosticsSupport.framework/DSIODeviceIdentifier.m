@interface DSIODeviceIdentifier
+ (id)identifierForAccessoryModel:(unint64_t)a3;
+ (id)identifierForIOHIDDevice:(__IOHIDDevice *)a3;
- (DSIODeviceIdentifier)initWithAccessoryModel:(unint64_t)a3 usagePage:(unsigned int)a4 usage:(unsigned int)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7;
- (unint64_t)accessoryModel;
- (unsigned)productID;
- (unsigned)usage;
- (unsigned)usagePage;
- (unsigned)vendorID;
@end

@implementation DSIODeviceIdentifier

- (DSIODeviceIdentifier)initWithAccessoryModel:(unint64_t)a3 usagePage:(unsigned int)a4 usage:(unsigned int)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7
{
  v13.receiver = self;
  v13.super_class = (Class)DSIODeviceIdentifier;
  result = [(DSIODeviceIdentifier *)&v13 init];
  if (result)
  {
    result->_accessoryModel = a3;
    result->_usagePage = a4;
    result->_usage = a5;
    result->_vendorID = a6;
    result->_productID = a7;
  }
  return result;
}

+ (id)identifierForAccessoryModel:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 0;
      uint64_t v7 = 133;
      uint64_t v8 = 46;
      uint64_t v9 = 1452;
      uint64_t v10 = 5013;
      goto LABEL_25;
    case 1uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 1;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 5016;
      goto LABEL_25;
    case 2uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 2;
      uint64_t v7 = 133;
      uint64_t v8 = 46;
      uint64_t v9 = 1452;
      uint64_t v10 = 5017;
      goto LABEL_25;
    case 3uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 3;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 76;
      uint64_t v10 = 546;
      goto LABEL_25;
    case 4uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 4;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 76;
      uint64_t v10 = 332;
      goto LABEL_25;
    case 5uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 5;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 76;
      uint64_t v10 = 482;
      goto LABEL_25;
    case 6uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 6;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 76;
      uint64_t v10 = 1106;
      goto LABEL_25;
    case 7uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 7;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 616;
      goto LABEL_25;
    case 8uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 8;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 618;
      goto LABEL_25;
    case 9uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 9;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 619;
      goto LABEL_25;
    case 0xAuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 10;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 658;
      goto LABEL_25;
    case 0xBuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 11;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 659;
      goto LABEL_25;
    case 0xCuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 12;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 622;
      goto LABEL_25;
    case 0xDuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 13;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 623;
      goto LABEL_25;
    case 0xEuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 14;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 1105;
      goto LABEL_25;
    case 0xFuLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 15;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 1104;
      goto LABEL_25;
    case 0x10uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 16;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 1108;
      goto LABEL_25;
    case 0x11uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 17;
      uint64_t v7 = 65280;
      uint64_t v8 = 11;
      uint64_t v9 = 1452;
      uint64_t v10 = 1109;
      goto LABEL_25;
    case 0x12uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 18;
      uint64_t v7 = 65309;
      uint64_t v8 = 45;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_25;
    case 0x13uLL:
      v5 = [DSIODeviceIdentifier alloc];
      uint64_t v6 = 19;
      uint64_t v7 = 65280;
      uint64_t v8 = 88;
      uint64_t v9 = 1452;
      uint64_t v10 = 30723;
LABEL_25:
      v11 = -[DSIODeviceIdentifier initWithAccessoryModel:usagePage:usage:vendorID:productID:](v5, "initWithAccessoryModel:usagePage:usage:vendorID:productID:", v6, v7, v8, v9, v10, v3);
      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

+ (id)identifierForIOHIDDevice:(__IOHIDDevice *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = IOHIDDeviceGetProperty(a3, @"DeviceUsagePairs");
  v23 = IOHIDDeviceGetProperty(a3, @"VendorID");
  IOHIDDeviceGetProperty(a3, @"ProductID");
  v22 = v21 = v4;
  uint64_t v5 = 0;
  long long v6 = 0uLL;
  do
  {
    long long v26 = v6;
    long long v27 = v6;
    long long v24 = v6;
    long long v25 = v6;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_super v13 = [v12 objectForKeyedSubscript:@"DeviceUsagePage"];
          v14 = [v12 objectForKeyedSubscript:@"DeviceUsage"];
          v15 = +[DSIODeviceIdentifier identifierForAccessoryModel:v5];
          int v16 = [v15 usagePage];
          if (v16 == [v13 unsignedIntValue])
          {
            int v17 = [v15 usage];
            if (v17 == [v14 unsignedIntValue])
            {
              int v18 = [v15 vendorID];
              if (v18 == [v23 unsignedIntValue])
              {
                int v19 = [v15 productID];
                if (v19 == [v22 unsignedIntValue])
                {

                  goto LABEL_16;
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    ++v5;
    uint64_t v4 = v21;
    long long v6 = 0uLL;
  }
  while (v5 != 20);
  v15 = 0;
LABEL_16:

  return v15;
}

- (unint64_t)accessoryModel
{
  return self->_accessoryModel;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (unsigned)usage
{
  return self->_usage;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

@end