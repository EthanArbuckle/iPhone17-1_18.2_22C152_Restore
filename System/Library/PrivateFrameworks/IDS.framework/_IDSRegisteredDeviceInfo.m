@interface _IDSRegisteredDeviceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (NSArray)identities;
- (NSArray)linkedUserURIs;
- (NSArray)subServices;
- (NSDictionary)clientData;
- (NSDictionary)dictionaryRepresentation;
- (_IDSRegisteredDevice)device;
- (_IDSRegisteredDeviceInfo)initWithDictionary:(id)a3 device:(id)a4;
- (id)debugDescription;
- (id)description;
@end

@implementation _IDSRegisteredDeviceInfo

- (_IDSRegisteredDeviceInfo)initWithDictionary:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_IDSRegisteredDeviceInfo;
  v8 = [(_IDSRegisteredDeviceInfo *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a4);
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6AE18]];
    clientData = v9->_clientData;
    v9->_clientData = (NSDictionary *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6AE40]];
    identities = v9->_identities;
    v9->_identities = (NSArray *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6AE60]];
    linkedUserURIs = v9->_linkedUserURIs;
    v9->_linkedUserURIs = (NSArray *)v14;

    uint64_t v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6AEC8]];
    subServices = v9->_subServices;
    v9->_subServices = (NSArray *)v16;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_IDSRegisteredDeviceInfo *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (self == v4)
  {
    char v15 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(_IDSRegisteredDeviceInfo *)self clientData];
    v8 = [(_IDSRegisteredDeviceInfo *)v6 clientData];
    if ([v7 isEqualToDictionary:v8])
    {
      v9 = [(_IDSRegisteredDeviceInfo *)self identities];
      uint64_t v10 = [(_IDSRegisteredDeviceInfo *)v6 identities];
      if ([v9 isEqualToArray:v10])
      {
        v11 = [(_IDSRegisteredDeviceInfo *)self linkedUserURIs];
        uint64_t v12 = [(_IDSRegisteredDeviceInfo *)v6 linkedUserURIs];
        if ([v11 isEqualToArray:v12])
        {
          v13 = [(_IDSRegisteredDeviceInfo *)self subServices];
          objc_super v19 = [(_IDSRegisteredDeviceInfo *)v6 subServices];
          if (objc_msgSend(v13, "isEqualToArray:"))
          {
            v17 = [(_IDSRegisteredDeviceInfo *)self device];
            [(_IDSRegisteredDeviceInfo *)v6 device];
            uint64_t v14 = v18 = v13;
            char v15 = [v17 isEqual:v14];

            v13 = v18;
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
LABEL_9:
    char v15 = 0;
  }
LABEL_19:

  return v15;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  id v4 = a3;
  v5 = [[_IDSRegisteredDevice alloc] initWithDictionary:v4];
  id v6 = [(_IDSRegisteredDeviceInfo *)self clientData];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE18]];
  if ([v6 isEqualToDictionary:v7])
  {
    v8 = [(_IDSRegisteredDeviceInfo *)self identities];
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE40]];
    if ([v8 isEqualToArray:v9])
    {
      uint64_t v10 = [(_IDSRegisteredDeviceInfo *)self linkedUserURIs];
      v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE60]];
      if ([v10 isEqualToArray:v11])
      {
        uint64_t v12 = [(_IDSRegisteredDeviceInfo *)self subServices];
        uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AEC8]];
        objc_super v19 = (void *)v12;
        uint64_t v14 = (void *)v12;
        char v15 = (void *)v13;
        if ([v14 isEqualToArray:v13])
        {
          v18 = [(_IDSRegisteredDeviceInfo *)self device];
          char v16 = [v18 isEqual:v5];
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [(_IDSRegisteredDeviceInfo *)self device];
  id v4 = [v3 dictionaryRepresentation];
  v5 = (__CFDictionary *)[v4 mutableCopy];

  id v6 = [(_IDSRegisteredDeviceInfo *)self clientData];
  if (v6) {
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E4F6AE18], v6);
  }

  id v7 = [(_IDSRegisteredDeviceInfo *)self identities];
  if (v7) {
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E4F6AE40], v7);
  }

  v8 = [(_IDSRegisteredDeviceInfo *)self linkedUserURIs];
  if (v8) {
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E4F6AE60], v8);
  }

  v9 = [(_IDSRegisteredDeviceInfo *)self subServices];
  if (v9) {
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E4F6AEC8], v9);
  }

  return (NSDictionary *)v5;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_IDSRegisteredDeviceInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"<%@ %p>: Dictionary representation %@", v4, self, v5];

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (_IDSRegisteredDevice)device
{
  return self->_device;
}

- (NSDictionary)clientData
{
  return self->_clientData;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSArray)linkedUserURIs
{
  return self->_linkedUserURIs;
}

- (NSArray)subServices
{
  return self->_subServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subServices, 0);
  objc_storeStrong((id *)&self->_linkedUserURIs, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_clientData, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end