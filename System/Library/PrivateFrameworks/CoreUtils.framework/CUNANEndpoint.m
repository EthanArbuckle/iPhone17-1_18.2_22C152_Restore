@interface CUNANEndpoint
- (CUNANEndpoint)initWithEndpointID:(const char *)a3 error:(id *)a4;
- (NSData)customData;
- (NSDictionary)textInfo;
- (NSString)identifier;
- (NSString)mockPeerEndpointString;
- (NSString)name;
- (NSString)serviceType;
- (WiFiAwareDiscoveryResult)discoveryResult;
- (WiFiMACAddress)macAddress;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)port;
- (int)rssi;
- (unsigned)instanceID;
- (unsigned)updateWithDiscoveryResult:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setDiscoveryResult:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceID:(unsigned __int8)a3;
- (void)setMacAddress:(id)a3;
- (void)setMockPeerEndpointString:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setRssi:(int)a3;
- (void)setServiceType:(id)a3;
- (void)setTextInfo:(id)a3;
@end

@implementation CUNANEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mockPeerEndpointString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customData, 0);
}

- (void)setMacAddress:(id)a3
{
}

- (WiFiMACAddress)macAddress
{
  return self->_macAddress;
}

- (void)setInstanceID:(unsigned __int8)a3
{
  self->_instanceID = a3;
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void)setDiscoveryResult:(id)a3
{
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (void)setTextInfo:(id)a3
{
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (int)port
{
  return self->_port;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setMockPeerEndpointString:(id)a3
{
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setCustomData:(id)a3
{
}

- (NSData)customData
{
  return self->_customData;
}

- (unsigned)updateWithDiscoveryResult:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_discoveryResult, a3);
  v6 = [v5 serviceSpecificInfo];
  v7 = [v6 blob];
  customData = self->_customData;
  v9 = v7;
  v10 = customData;
  if (v9 == v10)
  {

    unsigned int v13 = 0;
    v14 = v9;
LABEL_8:

    goto LABEL_9;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_7;
  }
  char v12 = [(NSData *)v9 isEqual:v10];

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v15 = v9;
    v14 = self->_customData;
    self->_customData = v15;
    unsigned int v13 = 1;
    goto LABEL_8;
  }
  unsigned int v13 = 0;
LABEL_9:
  if (!self->_identifier)
  {
    v16 = [v5 publisherAddress];
    v17 = [v16 data];
    [v5 publishID];
    _WiFiAwareCreateEndpointIdentifier(v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v18;

    if (self->_identifier) {
      unsigned int v13 = 1;
    }
  }
  v20 = [v6 instanceName];
  v21 = v20;
  if (v20)
  {
    name = self->_name;
    v23 = v20;
    v24 = name;
    if (v23 == v24)
    {

      goto LABEL_20;
    }
    v25 = v24;
    if (v24)
    {
      char v26 = [(NSString *)v23 isEqual:v24];

      if (v26) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_name, v21);
    v13 |= 2u;
  }
LABEL_20:
  uint64_t v27 = [v5 rssi];
  v46 = v6;
  if (v27 != self->_rssi)
  {
    self->_rssi = v27;
    v13 |= 0x10u;
  }
  v28 = [v5 serviceName];
  serviceType = self->_serviceType;
  v30 = v28;
  v31 = serviceType;
  if (v30 == v31)
  {

    goto LABEL_29;
  }
  v32 = v31;
  if ((v30 == 0) == (v31 != 0))
  {

    v6 = v46;
    goto LABEL_28;
  }
  char v33 = [(NSString *)v30 isEqual:v31];

  v6 = v46;
  if ((v33 & 1) == 0)
  {
LABEL_28:
    objc_storeStrong((id *)&self->_serviceType, v28);
    v13 |= 1u;
  }
LABEL_29:
  v34 = [v6 txtRecordData];
  v36 = v34;
  if (v34)
  {
    v37 = (void *)CUTXTDictionaryCreateWithTXTData(v34, v35, 0);
    v38 = v37;
    if (!v37)
    {
LABEL_39:

      goto LABEL_40;
    }
    textInfo = self->_textInfo;
    p_textInfo = &self->_textInfo;
    v41 = v37;
    v42 = textInfo;
    if (v41 == v42)
    {
    }
    else
    {
      v43 = v42;
      if (v42)
      {
        char v45 = [(NSDictionary *)v41 isEqual:v42];

        if (v45) {
          goto LABEL_38;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)p_textInfo, v38);
      v13 |= 8u;
    }
LABEL_38:
    v6 = v46;
    goto LABEL_39;
  }
LABEL_40:

  return v13;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v84 = 0;
  NSAppendPrintF_safe(&v84, (uint64_t)"CUNANEndpoint ", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v70);
  v10 = v84;
  v17 = v10;
  identifier = self->_identifier;
  if (identifier)
  {
    CFMutableStringRef v83 = v10;
    v19 = &v83;
    NSAppendPrintF_safe(&v83, (uint64_t)"%@", v11, v12, v13, v14, v15, v16, (uint64_t)identifier);
  }
  else
  {
    macAddress = self->_macAddress;
    if (macAddress)
    {
      CFMutableStringRef v82 = v10;
      v19 = &v82;
      NSAppendPrintF_safe(&v82, (uint64_t)"%@-%u", v11, v12, v13, v14, v15, v16, (uint64_t)macAddress);
    }
    else
    {
      CFMutableStringRef v81 = v10;
      v19 = &v81;
      NSAppendPrintF_safe(&v81, (uint64_t)"?", v11, v12, v13, v14, v15, v16, v71);
    }
  }
  v21 = *v19;

  serviceType = self->_serviceType;
  if (serviceType)
  {
    CFMutableStringRef v80 = v21;
    NSAppendPrintF_safe(&v80, (uint64_t)", Sv '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)serviceType);
    v29 = v80;

    v21 = v29;
  }
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v79 = v21;
    NSAppendPrintF_safe(&v79, (uint64_t)", Nm '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)name);
    v31 = v79;

    v21 = v31;
  }
  uint64_t port = self->_port;
  if (port)
  {
    CFMutableStringRef v78 = v21;
    NSAppendPrintF_safe(&v78, (uint64_t)", Pt %d", v22, v23, v24, v25, v26, v27, port);
    char v33 = v78;

    v21 = v33;
  }
  customData = self->_customData;
  if (customData)
  {
    CFMutableStringRef v77 = v21;
    NSAppendPrintF_safe(&v77, (uint64_t)", CD %@", v22, v23, v24, v25, v26, v27, (uint64_t)customData);
    uint64_t v35 = v77;

    v21 = v35;
  }
  discoveryResult = self->_discoveryResult;
  if (discoveryResult)
  {
    CFMutableStringRef v76 = v21;
    int v37 = [(WiFiAwareDiscoveryResult *)discoveryResult datapathSupported];
    [(WiFiAwareDiscoveryResult *)self->_discoveryResult datapathSecurityRequired];
    [(WiFiAwareDiscoveryResult *)self->_discoveryResult furtherServiceDiscoveryRequired];
    uint64_t v44 = 100;
    if (v37) {
      uint64_t v44 = 68;
    }
    NSAppendPrintF_safe(&v76, (uint64_t)", Fl <%c%c%c>", v38, v39, v40, v41, v42, v43, v44);
    char v45 = v76;

    v21 = v45;
  }
  CFMutableStringRef v75 = v21;
  NSAppendPrintF_safe(&v75, (uint64_t)", rssi %d", v22, v23, v24, v25, v26, v27, self->_rssi);
  v46 = v75;

  CFMutableStringRef v74 = v46;
  v54 = NSPrintF((uint64_t)"%##@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)self->_textInfo);
  NSAppendPrintF_safe(&v74, (uint64_t)", TI %@", v55, v56, v57, v58, v59, v60, (uint64_t)v54);
  v61 = v74;

  if (a3 <= 20)
  {
    CFMutableStringRef v73 = v61;
    NSAppendPrintF_safe(&v73, (uint64_t)"\n", v62, v63, v64, v65, v66, v67, v72);
    v68 = v73;

    v61 = v68;
  }
  return v61;
}

- (id)description
{
  return [(CUNANEndpoint *)self descriptionWithLevel:50];
}

- (CUNANEndpoint)initWithEndpointID:(const char *)a3 error:(id *)a4
{
  uint64_t v6 = [(CUNANEndpoint *)self init];
  if (!v6) {
    goto LABEL_6;
  }
  unsigned __int16 v19 = 0;
  unsigned int v18 = 0;
  unsigned __int8 v17 = 0;
  if (sscanf(a3, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx-%hhu", &v18, (char *)&v18 + 1, (char *)&v18 + 2, (char *)&v18 + 3, &v19, (char *)&v19 + 1, &v17) != 7)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"Bad peer ID: '%s'", v7, v8, v9, v10, v11, (uint64_t)a3);
      uint64_t v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  v6->_instanceID = v17;
  id v12 = objc_alloc((Class)getWiFiMACAddressClass[0]());
  uint64_t v13 = [v12 initWithAddress:v18 | ((unint64_t)v19 << 32)];
  macAddress = v6->_macAddress;
  v6->_macAddress = (WiFiMACAddress *)v13;

  uint64_t v15 = v6;
LABEL_7:

  return v15;
}

@end