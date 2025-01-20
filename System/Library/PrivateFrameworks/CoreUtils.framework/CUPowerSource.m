@interface CUPowerSource
+ (BOOL)supportsSecureCoding;
- (BOOL)adapterSharedSource;
- (BOOL)aggregate;
- (BOOL)charging;
- (BOOL)hasAllComponents;
- (BOOL)isAggregateComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)present;
- (BOOL)showChargingUI;
- (CUPowerSource)initWithCoder:(id)a3;
- (CUPowerSource)subCase;
- (CUPowerSource)subLeft;
- (CUPowerSource)subMain;
- (CUPowerSource)subRight;
- (NSArray)LEDs;
- (NSDictionary)ioKitAdapterDescription;
- (NSDictionary)ioKitDescription;
- (NSString)accessoryCategory;
- (NSString)accessoryID;
- (NSString)adapterName;
- (NSString)groupID;
- (NSString)name;
- (NSString)partID;
- (NSString)partName;
- (NSString)state;
- (NSString)transportType;
- (NSString)type;
- (double)chargeLevel;
- (double)maxCapacity;
- (id)description;
- (id)detailedDescription;
- (int)powerState;
- (int)publish;
- (int)role;
- (int64_t)adapterErrorFlags;
- (int64_t)adapterFamilyCode;
- (int64_t)adapterSourceID;
- (int64_t)familyCode;
- (int64_t)productID;
- (int64_t)sourceID;
- (int64_t)temperature;
- (int64_t)vendorID;
- (unint64_t)hash;
- (unsigned)expectedComponents;
- (unsigned)updateWithPowerAdapterDetails:(id)a3;
- (unsigned)updateWithPowerSourceDescription:(id)a3;
- (void)_updateWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleSubComponentsUpdated;
- (void)handleSubComponentsUpdatedWithBaseSource:(id)a3;
- (void)invalidate;
- (void)setAccessoryCategory:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAdapterErrorFlags:(int64_t)a3;
- (void)setAdapterFamilyCode:(int64_t)a3;
- (void)setAdapterName:(id)a3;
- (void)setAdapterSharedSource:(BOOL)a3;
- (void)setAdapterSourceID:(int64_t)a3;
- (void)setAggregate:(BOOL)a3;
- (void)setChargeLevel:(double)a3;
- (void)setCharging:(BOOL)a3;
- (void)setExpectedComponents:(unsigned int)a3;
- (void)setFamilyCode:(int64_t)a3;
- (void)setGroupID:(id)a3;
- (void)setIoKitAdapterDescription:(id)a3;
- (void)setIoKitDescription:(id)a3;
- (void)setLEDs:(id)a3;
- (void)setMaxCapacity:(double)a3;
- (void)setName:(id)a3;
- (void)setPartID:(id)a3;
- (void)setPartName:(id)a3;
- (void)setPowerState:(int)a3;
- (void)setPresent:(BOOL)a3;
- (void)setProductID:(int64_t)a3;
- (void)setRole:(int)a3;
- (void)setShowChargingUI:(BOOL)a3;
- (void)setSourceID:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setSubCase:(id)a3;
- (void)setSubLeft:(id)a3;
- (void)setSubMain:(id)a3;
- (void)setSubRight:(id)a3;
- (void)setTemperature:(int64_t)a3;
- (void)setTransportType:(id)a3;
- (void)setType:(id)a3;
- (void)setVendorID:(int64_t)a3;
- (void)updateWithPowerSource:(id)a3;
@end

@implementation CUPowerSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioKitDescription, 0);
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, 0);
  objc_storeStrong((id *)&self->_adapterName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_subMain, 0);
  objc_storeStrong((id *)&self->_subCase, 0);
  objc_storeStrong((id *)&self->_subRight, 0);
  objc_storeStrong((id *)&self->_subLeft, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_partID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_LEDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setIoKitDescription:(id)a3
{
}

- (NSDictionary)ioKitDescription
{
  return self->_ioKitDescription;
}

- (void)setIoKitAdapterDescription:(id)a3
{
}

- (NSDictionary)ioKitAdapterDescription
{
  return self->_ioKitAdapterDescription;
}

- (void)setAdapterSourceID:(int64_t)a3
{
  self->_adapterSourceID = a3;
}

- (int64_t)adapterSourceID
{
  return self->_adapterSourceID;
}

- (void)setAdapterSharedSource:(BOOL)a3
{
  self->_adapterSharedSource = a3;
}

- (BOOL)adapterSharedSource
{
  return self->_adapterSharedSource;
}

- (void)setAdapterName:(id)a3
{
}

- (NSString)adapterName
{
  return self->_adapterName;
}

- (void)setAdapterFamilyCode:(int64_t)a3
{
  self->_adapterFamilyCode = a3;
}

- (int64_t)adapterFamilyCode
{
  return self->_adapterFamilyCode;
}

- (void)setAdapterErrorFlags:(int64_t)a3
{
  self->_adapterErrorFlags = a3;
}

- (int64_t)adapterErrorFlags
{
  return self->_adapterErrorFlags;
}

- (void)setVendorID:(int64_t)a3
{
  self->_vendorID = a3;
}

- (int64_t)vendorID
{
  return self->_vendorID;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setTransportType:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTemperature:(int64_t)a3
{
  self->_temperature = a3;
}

- (int64_t)temperature
{
  return self->_temperature;
}

- (void)setSubMain:(id)a3
{
}

- (CUPowerSource)subMain
{
  return self->_subMain;
}

- (void)setSubCase:(id)a3
{
}

- (CUPowerSource)subCase
{
  return self->_subCase;
}

- (void)setSubRight:(id)a3
{
}

- (CUPowerSource)subRight
{
  return self->_subRight;
}

- (void)setSubLeft:(id)a3
{
}

- (CUPowerSource)subLeft
{
  return self->_subLeft;
}

- (void)setState:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setSourceID:(int64_t)a3
{
  self->_sourceID = a3;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setShowChargingUI:(BOOL)a3
{
  self->_showChargingUI = a3;
}

- (BOOL)showChargingUI
{
  return self->_showChargingUI;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setProductID:(int64_t)a3
{
  self->_productID = a3;
}

- (int64_t)productID
{
  return self->_productID;
}

- (void)setPowerState:(int)a3
{
  self->_powerState = a3;
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPartName:(id)a3
{
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartID:(id)a3
{
}

- (NSString)partID
{
  return self->_partID;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setMaxCapacity:(double)a3
{
  self->_maxCapacity = a3;
}

- (double)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setLEDs:(id)a3
{
}

- (void)setGroupID:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setFamilyCode:(int64_t)a3
{
  self->_familyCode = a3;
}

- (int64_t)familyCode
{
  return self->_familyCode;
}

- (void)setExpectedComponents:(unsigned int)a3
{
  self->_expectedComponents = a3;
}

- (unsigned)expectedComponents
{
  return self->_expectedComponents;
}

- (void)setChargeLevel:(double)a3
{
  self->_chargeLevel = a3;
}

- (double)chargeLevel
{
  return self->_chargeLevel;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (BOOL)charging
{
  return self->_charging;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (unsigned)updateWithPowerSourceDescription:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitDescription, a3);
  self->_present = 1;
  CFTypeID TypeID = CFStringGetTypeID();
  v7 = CFDictionaryGetTypedValue(v5, @"Accessory Category", TypeID, 0);
  v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  accessoryCategory = self->_accessoryCategory;
  v10 = v7;
  v11 = accessoryCategory;
  if (v10 == v11)
  {

    goto LABEL_7;
  }
  v12 = v11;
  if (v11)
  {
    char v13 = [(NSString *)v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_accessoryCategory, v8);
  unsigned int v14 = 1;
LABEL_10:
  CFTypeID v15 = CFStringGetTypeID();
  v16 = CFDictionaryGetTypedValue(v5, @"Accessory Identifier", v15, 0);

  if (!v16) {
    goto LABEL_18;
  }
  accessoryID = self->_accessoryID;
  v18 = v16;
  v19 = accessoryID;
  if (v18 == v19)
  {

    goto LABEL_18;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_17;
  }
  char v21 = [(NSString *)v18 isEqual:v19];

  if ((v21 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_accessoryID, v16);
    unsigned int v14 = 1;
  }
LABEL_18:
  unint64_t Int64 = CFDictionaryGetInt64(v5, @"Is Charging", 0);
  unint64_t v23 = CFDictionaryGetInt64(v5, @"Show Charging UI", 0);
  BOOL v24 = v23 != 0;
  BOOL v25 = (Int64 | v23) != 0;
  if (self->_charging != v25)
  {
    self->_charging = v25;
    v14 |= 4u;
  }
  if (self->_showChargingUI != v24)
  {
    self->_showChargingUI = v24;
    v14 |= 4u;
  }
  double Double = CFDictionaryGetDouble(v5, @"Current Capacity", 0);
  double v27 = CFDictionaryGetDouble(v5, @"Max Capacity", 0);
  double v28 = Double / v27;
  if (v27 <= 0.0) {
    double v28 = 1.0;
  }
  if (v28 > 1.0) {
    double v28 = 1.0;
  }
  if (v28 < 0.0) {
    double v28 = 0.0;
  }
  if (v28 != self->_chargeLevel)
  {
    self->_chargeLevel = v28;
    v14 |= 2u;
  }
  CFTypeID v29 = CFStringGetTypeID();
  v30 = CFDictionaryGetTypedValue(v5, @"Group Identifier", v29, 0);

  if (v30)
  {
    groupID = self->_groupID;
    v32 = v30;
    v33 = groupID;
    if (v32 == v33)
    {
    }
    else
    {
      v34 = v33;
      if (v33)
      {
        char v35 = [(NSString *)v32 isEqual:v33];

        if (v35) {
          goto LABEL_38;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_groupID, v30);
      v14 |= 1u;
    }
  }
LABEL_38:
  v36 = self->_groupID;
  if (v36)
  {
    v37 = [(NSString *)v36 UTF8String];
    if (v37)
    {
      v38 = v37;
      if (!strcasecmp(v37, "left"))
      {
        unsigned int v39 = 1;
      }
      else if (!strcasecmp(v38, "right"))
      {
        unsigned int v39 = 2;
      }
      else if (!strcasecmp(v38, "case"))
      {
        unsigned int v39 = 4;
      }
      else if (!strcasecmp(v38, "leftRight"))
      {
        unsigned int v39 = 3;
      }
      else if (!strcasecmp(v38, "leftCase"))
      {
        unsigned int v39 = 5;
      }
      else if (!strcasecmp(v38, "rightCase"))
      {
        unsigned int v39 = 6;
      }
      else
      {
        unsigned int v39 = !strcasecmp(v38, "leftRightCase") ? 7 : 0;
      }
    }
    else
    {
      unsigned int v39 = 0;
    }
    if (v39 != self->_expectedComponents)
    {
      self->_expectedComponents = v39;
      self->_aggregate = v39 != 0;
      v14 |= 1u;
    }
  }
  CFTypeID v40 = CFArrayGetTypeID();
  v41 = CFDictionaryGetTypedValue(v5, @"LEDs", v40, 0);
  if ([v41 count])
  {
    LEDs = self->_LEDs;
    v43 = v41;
    v44 = LEDs;
    if (v43 == v44)
    {

      goto LABEL_91;
    }
    v45 = v44;
    if ((v43 == 0) != (v44 != 0))
    {
      char v46 = [(NSArray *)v43 isEqual:v44];

      if (v46) {
        goto LABEL_91;
      }
    }
    else
    {
    }
    v122 = v30;
    unsigned int v123 = v14;
    v124 = self;
    CFDictionaryRef v125 = v5;
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v48 = v43;
    uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v126 objects:v130 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v127 != v51) {
            objc_enumerationMutation(v48);
          }
          CFDictionaryRef v53 = *(const __CFDictionary **)(*((void *)&v126 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v54 = objc_alloc_init(CUPowerSourceLEDInfo);
            CFTypeID v55 = CFStringGetTypeID();
            v56 = (const char *)[(__CFDictionary *)CFDictionaryGetTypedValue(v53, @"Color", v55, 0) UTF8String];
            if (v56)
            {
              v57 = v56;
              if (!strcmp(v56, "Green"))
              {
                uint64_t v58 = 1;
              }
              else if (!strcmp(v57, "Orange"))
              {
                uint64_t v58 = 2;
              }
              else if (!strcmp(v57, "White"))
              {
                uint64_t v58 = 3;
              }
              else
              {
                uint64_t v58 = 0;
              }
              [(CUPowerSourceLEDInfo *)v54 setLEDColor:v58];
            }
            CFTypeID v59 = CFStringGetTypeID();
            v60 = (const char *)[(__CFDictionary *)CFDictionaryGetTypedValue(v53, @"State", v59, 0) UTF8String];
            if (v60)
            {
              v61 = v60;
              if (!strcmp(v60, "Off"))
              {
                uint64_t v62 = 0;
              }
              else if (!strcmp(v61, "Solid"))
              {
                uint64_t v62 = 1;
              }
              else
              {
                uint64_t v62 = 2 * (strcmp(v61, "Blinking") == 0);
              }
              [(CUPowerSourceLEDInfo *)v54 setLEDState:v62];
            }
            [v47 addObject:v54];
          }
        }
        uint64_t v50 = [(NSArray *)v48 countByEnumeratingWithState:&v126 objects:v130 count:16];
      }
      while (v50);
    }

    uint64_t v63 = [v47 copy];
    self = v124;
    v64 = v124->_LEDs;
    v124->_LEDs = (NSArray *)v63;

    unsigned int v14 = v123 | 1;
    CFDictionaryRef v5 = v125;
    v30 = v122;
  }
LABEL_91:
  if (v27 != self->_maxCapacity)
  {
    self->_maxCapacity = v27;
    v14 |= 4u;
  }
  CFTypeID v65 = CFStringGetTypeID();
  v66 = CFDictionaryGetTypedValue(v5, @"Name", v65, 0);

  if (v66)
  {
    name = self->_name;
    v68 = v66;
    v69 = name;
    if (v68 == v69)
    {

      goto LABEL_101;
    }
    v70 = v69;
    if (v69)
    {
      char v71 = [(NSString *)v68 isEqual:v69];

      if (v71) {
        goto LABEL_101;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_name, v66);
    v14 |= 1u;
  }
LABEL_101:
  CFTypeID v72 = CFStringGetTypeID();
  v73 = CFDictionaryGetTypedValue(v5, @"Part Identifier", v72, 0);

  if (!v73) {
    goto LABEL_109;
  }
  partID = self->_partID;
  v75 = v73;
  v76 = partID;
  if (v75 == v76)
  {

    goto LABEL_109;
  }
  v77 = v76;
  if (!v76)
  {

    goto LABEL_108;
  }
  char v78 = [(NSString *)v75 isEqual:v76];

  if ((v78 & 1) == 0)
  {
LABEL_108:
    objc_storeStrong((id *)&self->_partID, v73);
    v14 |= 1u;
  }
LABEL_109:
  CFTypeID v79 = CFStringGetTypeID();
  v80 = CFDictionaryGetTypedValue(v5, @"Part Name", v79, 0);

  if (v80)
  {
    partName = self->_partName;
    v82 = v80;
    v83 = partName;
    if (v82 == v83)
    {
    }
    else
    {
      v84 = v83;
      if (v83)
      {
        char v85 = [(NSString *)v82 isEqual:v83];

        if (v85) {
          goto LABEL_117;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_partName, v80);
      v14 |= 1u;
    }
  }
LABEL_117:
  CFTypeID v86 = CFStringGetTypeID();
  v87 = CFDictionaryGetTypedValue(v5, @"Power Source State", v86, 0);

  if (([v87 isEqual:@"AC Power"] & 1) != 0
    || [v87 isEqual:@"UPS Power"])
  {
    if (CFDictionaryGetInt64(v5, @"Is Charged", 0)
      || CFDictionaryGetInt64(v5, @"Is Finishing Charge", 0))
    {
      int v88 = 3;
    }
    else
    {
      int v88 = 2;
    }
  }
  else
  {
    int v88 = 1;
  }
  if (v88 != self->_powerState)
  {
    self->_powerState = v88;
    v14 |= 4u;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged(v5, @"Product ID", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (Int64Ranged != self->_productID)
  {
    self->_productID = Int64Ranged;
    v14 |= 1u;
  }
  CFTypeID v90 = CFStringGetTypeID();
  v91 = CFDictionaryGetTypedValue(v5, @"Power Source State", v90, 0);

  if (v91)
  {
    state = self->_state;
    v93 = v91;
    v94 = state;
    if (v93 == v94)
    {

      goto LABEL_136;
    }
    v95 = v94;
    if (v94)
    {
      char v96 = [(NSString *)v93 isEqual:v94];

      if (v96) {
        goto LABEL_136;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_state, v91);
    v14 |= 4u;
  }
LABEL_136:
  int v97 = CFDictionaryGetInt64Ranged(v5, @"Temperature", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v97 != self->_temperature)
  {
    self->_temperature = v97;
    v14 |= 1u;
  }
  CFTypeID v98 = CFStringGetTypeID();
  v99 = CFDictionaryGetTypedValue(v5, @"Transport Type", v98, 0);

  if (v99)
  {
    transportType = self->_transportType;
    v101 = v99;
    v102 = transportType;
    if (v101 == v102)
    {

      goto LABEL_146;
    }
    v103 = v102;
    if (v102)
    {
      char v104 = [(NSString *)v101 isEqual:v102];

      if (v104) {
        goto LABEL_146;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_transportType, v99);
    v14 |= 1u;
  }
LABEL_146:
  CFTypeID v105 = CFStringGetTypeID();
  v106 = CFDictionaryGetTypedValue(v5, @"Type", v105, 0);

  if (!v106) {
    goto LABEL_154;
  }
  type = self->_type;
  v108 = v106;
  v109 = type;
  if (v108 == v109)
  {

    goto LABEL_154;
  }
  v110 = v109;
  if (!v109)
  {

    goto LABEL_153;
  }
  char v111 = [(NSString *)v108 isEqual:v109];

  if ((v111 & 1) == 0)
  {
LABEL_153:
    objc_storeStrong((id *)&self->_type, v106);
    v14 |= 1u;
  }
LABEL_154:
  int v112 = CFDictionaryGetInt64Ranged(v5, @"Vendor ID", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v112 != self->_vendorID)
  {
    self->_vendorID = v112;
    v14 |= 1u;
  }
  if ([(NSString *)self->_type isEqual:@"Accessory Source"])
  {
    CFTypeID v113 = CFDictionaryGetTypeID();
    v114 = CFDictionaryGetTypedValue(v5, @"AdapterDetails", v113, 0);
    v115 = v114;
    if (v114)
    {
      ioKitAdapterDescription = self->_ioKitAdapterDescription;
      v117 = v114;
      v118 = ioKitAdapterDescription;
      if (v117 == v118)
      {
      }
      else
      {
        v119 = v118;
        if (v118)
        {
          char v120 = [(NSDictionary *)v117 isEqual:v118];

          if (v120) {
            goto LABEL_165;
          }
        }
        else
        {
        }
        v14 |= [(CUPowerSource *)self updateWithPowerAdapterDetails:v117];
      }
    }
LABEL_165:
  }
  return v14;
}

- (void)updateWithPowerSource:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  [v5 encodeWithCoder:v9];

  id v6 = objc_alloc(MEMORY[0x1E4F28DC0]);
  v7 = [v9 encodedData];
  v8 = (void *)[v6 initForReadingFromData:v7 error:0];

  [(CUPowerSource *)self _updateWithCoder:v8];
  [v8 finishDecoding];
}

- (unsigned)updateWithPowerAdapterDetails:(id)a3
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, a3);
  int Int64Ranged = CFDictionaryGetInt64Ranged(v5, @"FamilyCode", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (Int64Ranged == self->_adapterFamilyCode)
  {
    unsigned int v7 = 0;
  }
  else
  {
    self->_adapterFamilyCode = Int64Ranged;
    unsigned int v7 = 256;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue(v5, @"Name", TypeID, 0);
  adapterName = self->_adapterName;
  v11 = v9;
  v12 = adapterName;
  if (v11 == v12)
  {

    CFTypeID v15 = v11;
LABEL_11:

    goto LABEL_12;
  }
  char v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_10;
  }
  char v14 = [(NSString *)v11 isEqual:v12];

  if ((v14 & 1) == 0)
  {
LABEL_10:
    v16 = v11;
    CFTypeID v15 = self->_adapterName;
    self->_adapterName = v16;
    unsigned int v7 = 256;
    goto LABEL_11;
  }
LABEL_12:
  BOOL v17 = CFDictionaryGetInt64(v5, @"SharedSource", 0) != 0;
  if (self->_adapterSharedSource != v17)
  {
    self->_adapterSharedSource = v17;
    unsigned int v7 = 256;
  }
  int v18 = CFDictionaryGetInt64Ranged(v5, @"Source", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v18 != self->_adapterSourceID)
  {
    self->_adapterSourceID = v18;
    unsigned int v7 = 256;
  }
  int v19 = CFDictionaryGetInt64Ranged(v5, @"ErrorFlags", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (v19 != self->_adapterErrorFlags)
  {
    self->_adapterErrorFlags = v19;
    v7 |= 0x100u;
  }

  return v7;
}

- (BOOL)isAggregateComponent
{
  if ([(NSString *)self->_accessoryCategory isEqualToString:@"Audio Battery Case"]) {
    return 1;
  }
  accessoryCategory = self->_accessoryCategory;
  return [(NSString *)accessoryCategory isEqualToString:@"Headphone"];
}

- (void)handleSubComponentsUpdatedWithBaseSource:(id)a3
{
  v4 = (CUPowerSource *)a3;
  subLeft = v4;
  if (v4 || (subLeft = self->_subLeft) != 0 || (subLeft = self->_subRight) != 0)
  {
    v69 = subLeft;

    id v6 = v69;
    goto LABEL_5;
  }
  id v6 = self->_subCase;
  if (v6)
  {
LABEL_5:
    v70 = v6;
    unsigned int v7 = [(CUPowerSource *)v6 accessoryID];
    v8 = v7;
    if (!v7) {
      goto LABEL_13;
    }
    accessoryID = self->_accessoryID;
    v10 = v7;
    v11 = accessoryID;
    if (v10 == v11)
    {

      goto LABEL_13;
    }
    v12 = v11;
    if (v11)
    {
      char v13 = [(NSString *)v10 isEqual:v11];

      if (v13)
      {
LABEL_13:
        int64_t v14 = [(CUPowerSource *)v70 adapterErrorFlags];
        if (v14 != self->_adapterErrorFlags) {
          self->_adapterErrorFlags = v14;
        }
        int64_t v15 = [(CUPowerSource *)v70 adapterFamilyCode];
        if (v15 != self->_adapterFamilyCode) {
          self->_adapterFamilyCode = v15;
        }
        v16 = [(CUPowerSource *)v70 adapterName];

        if (v16)
        {
          adapterName = self->_adapterName;
          int v18 = v16;
          int v19 = adapterName;
          if (v18 == v19)
          {

            goto LABEL_25;
          }
          v20 = v19;
          if (v19)
          {
            char v21 = [(NSString *)v18 isEqual:v19];

            if (v21) {
              goto LABEL_25;
            }
          }
          else
          {
          }
          objc_storeStrong((id *)&self->_adapterName, v16);
        }
LABEL_25:
        BOOL v22 = [(CUPowerSource *)v70 adapterSharedSource];
        if (self->_adapterSharedSource != v22) {
          self->_adapterSharedSource = v22;
        }
        int64_t v23 = [(CUPowerSource *)v70 adapterSourceID];
        if (v23 != self->_adapterSourceID) {
          self->_adapterSourceID = v23;
        }
        BOOL v24 = 1;
        self->_aggregate = 1;
        if (![(CUPowerSource *)v70 charging]) {
          BOOL v24 = [(CUPowerSource *)v70 adapterSourceID] >= 1
        }
             && [(CUPowerSource *)v70 adapterSourceID] != 0xFFFF;
        if (self->_charging != v24) {
          self->_charging = v24;
        }
        [(CUPowerSource *)v70 chargeLevel];
        double v25 = 1.79769313e308;
        if (v26 < 1.79769313e308)
        {
          [(CUPowerSource *)v70 chargeLevel];
          double v25 = v27;
        }
        double v28 = self->_subLeft;
        if (v28)
        {
          [(CUPowerSource *)v28 chargeLevel];
          if (v29 < v25)
          {
            [(CUPowerSource *)self->_subLeft chargeLevel];
            double v25 = v30;
          }
        }
        subRight = self->_subRight;
        if (subRight)
        {
          [(CUPowerSource *)subRight chargeLevel];
          if (v32 < v25)
          {
            [(CUPowerSource *)self->_subRight chargeLevel];
            double v25 = v33;
          }
        }
        subCase = self->_subCase;
        if (subCase)
        {
          [(CUPowerSource *)subCase chargeLevel];
          if (v35 < v25)
          {
            [(CUPowerSource *)self->_subCase chargeLevel];
            double v25 = v36;
          }
        }
        if (v25 != 1.79769313e308 && v25 != self->_chargeLevel) {
          self->_chargeLevel = v25;
        }
        unsigned int v37 = [(CUPowerSource *)v70 expectedComponents];
        if (v37 != self->_expectedComponents) {
          self->_expectedComponents = v37;
        }
        v38 = [(CUPowerSource *)v70 groupID];

        if (v38)
        {
          groupID = self->_groupID;
          CFTypeID v40 = v38;
          v41 = groupID;
          if (v40 == v41)
          {

            goto LABEL_59;
          }
          v42 = v41;
          if (v41)
          {
            char v43 = [(NSString *)v40 isEqual:v41];

            if (v43) {
              goto LABEL_59;
            }
          }
          else
          {
          }
          objc_storeStrong((id *)&self->_groupID, v38);
        }
LABEL_59:
        [(CUPowerSource *)v70 chargeLevel];
        double v44 = 2.22507386e-308;
        if (v45 > 2.22507386e-308)
        {
          [(CUPowerSource *)v70 maxCapacity];
          double v44 = v46;
        }
        id v47 = self->_subLeft;
        if (v47)
        {
          [(CUPowerSource *)v47 chargeLevel];
          if (v48 > v44)
          {
            [(CUPowerSource *)self->_subLeft maxCapacity];
            double v44 = v49;
          }
        }
        uint64_t v50 = self->_subRight;
        if (v50)
        {
          [(CUPowerSource *)v50 chargeLevel];
          if (v51 > v44)
          {
            [(CUPowerSource *)self->_subRight maxCapacity];
            double v44 = v52;
          }
        }
        CFDictionaryRef v53 = self->_subCase;
        if (v53)
        {
          [(CUPowerSource *)v53 chargeLevel];
          if (v54 > v44)
          {
            [(CUPowerSource *)self->_subCase maxCapacity];
            double v44 = v55;
          }
        }
        if (v44 != 2.22507386e-308 && v44 != self->_maxCapacity) {
          self->_maxCapacity = v44;
        }
        v56 = [(CUPowerSource *)v70 name];

        if (!v56) {
          goto LABEL_81;
        }
        name = self->_name;
        uint64_t v58 = v56;
        CFTypeID v59 = name;
        if (v58 == v59)
        {
        }
        else
        {
          v60 = v59;
          if (v59)
          {
            char v61 = [(NSString *)v58 isEqual:v59];

            if (v61) {
              goto LABEL_81;
            }
          }
          else
          {
          }
          objc_storeStrong((id *)&self->_name, v56);
        }
LABEL_81:
        int64_t v62 = [(CUPowerSource *)v70 productID];
        if (v62 != self->_productID) {
          self->_productID = v62;
        }
        int64_t v63 = [(CUPowerSource *)v70 vendorID];
        if (v63 != self->_vendorID) {
          self->_vendorID = v63;
        }
        goto LABEL_85;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_accessoryID, v8);
    goto LABEL_13;
  }
  if (gLogCategory_CUPowerSourceMonitor <= 60
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSource handleSubComponentsUpdatedWithBaseSource:]", 0x3Cu, (uint64_t)"### Updating aggregate without subcomponents?", v64, v65, v66, v67, v68);
  }
  v70 = 0;
  v56 = 0;
LABEL_85:
}

- (void)handleSubComponentsUpdated
{
}

- (NSArray)LEDs
{
  if (self->_LEDs) {
    return self->_LEDs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_psID)
  {
    IOPSReleasePowerSource();
    obj->_psID = 0;
  }
  [(CUPowerSource *)obj->_subLeft invalidate];
  subLeft = obj->_subLeft;
  obj->_subLeft = 0;

  [(CUPowerSource *)obj->_subRight invalidate];
  subRight = obj->_subRight;
  obj->_subRight = 0;

  [(CUPowerSource *)obj->_subCase invalidate];
  subCase = obj->_subCase;
  obj->_subCase = 0;

  [(CUPowerSource *)obj->_subMain invalidate];
  subMain = obj->_subMain;
  obj->_subMain = 0;

  objc_sync_exit(obj);
}

- (int)publish
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  double v49 = v2;
  if (v2->_psID || (int v46 = IOPSCreatePowerSource()) == 0)
  {
    double v48 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accessoryCategory = v2->_accessoryCategory;
    if (accessoryCategory) {
      [(NSDictionary *)v48 setObject:accessoryCategory forKeyedSubscript:@"Accessory Category"];
    }
    accessoryID = v2->_accessoryID;
    if (accessoryID) {
      [(NSDictionary *)v48 setObject:accessoryID forKeyedSubscript:@"Accessory Identifier"];
    }
    CFDictionaryRef v5 = objc_msgSend(NSNumber, "numberWithBool:", v2->_charging, &v2->_psID);
    [(NSDictionary *)v48 setObject:v5 forKeyedSubscript:@"Is Charging"];

    id v6 = [NSNumber numberWithInt:fabs(v2->_chargeLevel + -1.0) < 0.00000011920929];
    [(NSDictionary *)v48 setObject:v6 forKeyedSubscript:@"Is Charged"];

    unsigned int v7 = [NSNumber numberWithInt:(int)(v2->_chargeLevel * 100.0)];
    [(NSDictionary *)v48 setObject:v7 forKeyedSubscript:@"Current Capacity"];

    groupID = v2->_groupID;
    if (groupID) {
      [(NSDictionary *)v48 setObject:groupID forKeyedSubscript:@"Group Identifier"];
    }
    if ([(NSArray *)v2->_LEDs count])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      obj = v2->_LEDs;
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(obj);
            }
            char v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            int64_t v14 = NSString;
            unsigned int v15 = [v13 LEDState];
            v16 = "?";
            if (v15 <= 2) {
              v16 = off_1E55BE8E0[v15];
            }
            BOOL v17 = [v14 stringWithUTF8String:v16];
            int v18 = NSString;
            unsigned int v19 = [v13 LEDColor];
            v20 = "?";
            if (v19 <= 3) {
              v20 = off_1E55BE8F8[v19];
            }
            char v21 = [v18 stringWithUTF8String:v20];
            v55[0] = @"State";
            v55[1] = @"Color";
            v56[0] = v17;
            v56[1] = v21;
            BOOL v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
            [v9 addObject:v22];
          }
          uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v10);
      }

      [(NSDictionary *)v48 setObject:v9 forKeyedSubscript:@"LEDs"];
    }
    int64_t v23 = [NSNumber numberWithDouble:v2->_maxCapacity];
    [(NSDictionary *)v48 setObject:v23 forKeyedSubscript:@"Max Capacity"];

    name = v2->_name;
    if (name) {
      [(NSDictionary *)v48 setObject:name forKeyedSubscript:@"Name"];
    }
    partID = v2->_partID;
    if (partID) {
      [(NSDictionary *)v48 setObject:partID forKeyedSubscript:@"Part Identifier"];
    }
    partName = v2->_partName;
    if (partName) {
      [(NSDictionary *)v48 setObject:partName forKeyedSubscript:@"Part Name"];
    }
    if (v2->_productID)
    {
      double v27 = objc_msgSend(NSNumber, "numberWithInteger:");
      [(NSDictionary *)v48 setObject:v27 forKeyedSubscript:@"Product ID"];
    }
    state = v2->_state;
    if (state) {
      [(NSDictionary *)v48 setObject:state forKeyedSubscript:@"Power Source State"];
    }
    double v29 = [NSNumber numberWithInteger:v2->_temperature];
    [(NSDictionary *)v48 setObject:v29 forKeyedSubscript:@"Temperature"];

    transportType = v2->_transportType;
    if (transportType) {
      [(NSDictionary *)v48 setObject:transportType forKeyedSubscript:@"Transport Type"];
    }
    type = v2->_type;
    if (type) {
      [(NSDictionary *)v48 setObject:type forKeyedSubscript:@"Type"];
    }
    if (v2->_vendorID)
    {
      double v32 = objc_msgSend(NSNumber, "numberWithInteger:");
      [(NSDictionary *)v48 setObject:v32 forKeyedSubscript:@"Vendor ID"];
    }
    if ([(NSString *)v2->_type isEqual:@"Accessory Source"])
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v2->_adapterErrorFlags)
      {
        v34 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v33 setObject:v34 forKeyedSubscript:@"ErrorFlags"];
      }
      if (v2->_adapterFamilyCode)
      {
        double v35 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v33 setObject:v35 forKeyedSubscript:@"FamilyCode"];
      }
      adapterName = v2->_adapterName;
      if (adapterName) {
        [v33 setObject:adapterName forKeyedSubscript:@"Name"];
      }
      unsigned int v37 = [NSNumber numberWithBool:v2->_adapterSharedSource];
      [v33 setObject:v37 forKeyedSubscript:@"SharedSource"];

      if (v2->_adapterSourceID)
      {
        v38 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v33 setObject:v38 forKeyedSubscript:@"Source"];
      }
      [(NSDictionary *)v48 setObject:v33 forKeyedSubscript:@"AdapterDetails"];
    }
    unsigned int v39 = v48;
    if (!v48) {
      goto LABEL_57;
    }
    p_ioKitDescription = (id *)&v2->_ioKitDescription;
    ioKitDescription = v2->_ioKitDescription;
    v42 = v48;
    char v43 = ioKitDescription;
    if (v42 == v43)
    {

      unsigned int v39 = v48;
    }
    else
    {
      double v44 = v43;
      if (v43)
      {
        char v45 = [(NSDictionary *)v42 isEqual:v43];

        unsigned int v39 = v48;
        if (v45) {
          goto LABEL_57;
        }
      }
      else
      {

        unsigned int v39 = v48;
      }
      objc_storeStrong(p_ioKitDescription, v39);
      int v46 = IOPSSetPowerSourceDetails();
      unsigned int v39 = v48;
      if (v46) {
        goto LABEL_58;
      }
    }
LABEL_57:
    int v46 = 0;
    v42 = v39;
    goto LABEL_58;
  }
  v42 = 0;
LABEL_58:

  objc_sync_exit(v49);
  return v46;
}

- (id)detailedDescription
{
  if (self->_ioKitAdapterDescription) {
    NSPrintF((uint64_t)"CUPowerSource %{ptr} %@Adapter %@\n", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  }
  else {
  v8 = NSPrintF((uint64_t)"CUPowerSource %{ptr} %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  }
  return v8;
}

- (id)description
{
  CFMutableStringRef v109 = 0;
  NSAppendPrintF(&v109, (uint64_t)"CUPowerSource %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  id v9 = v109;
  CFMutableStringRef v16 = v9;
  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    CFMutableStringRef v108 = v9;
    NSAppendPrintF(&v108, (uint64_t)", SID %ld", v10, v11, v12, v13, v14, v15, sourceID);
    int v18 = v108;

    CFMutableStringRef v16 = v18;
  }
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
  {
    CFMutableStringRef v107 = v16;
    NSAppendPrintF(&v107, (uint64_t)", AcCa %@", v10, v11, v12, v13, v14, v15, (uint64_t)accessoryCategory);
    v20 = v107;

    CFMutableStringRef v16 = v20;
  }
  accessoryID = self->_accessoryID;
  if (accessoryID)
  {
    CFMutableStringRef v106 = v16;
    NSAppendPrintF(&v106, (uint64_t)", AcID %@", v10, v11, v12, v13, v14, v15, (uint64_t)accessoryID);
    BOOL v22 = v106;

    CFMutableStringRef v16 = v22;
  }
  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
  {
    CFMutableStringRef v105 = v16;
    NSAppendPrintF(&v105, (uint64_t)", AdEF %ld", v10, v11, v12, v13, v14, v15, adapterErrorFlags);
    BOOL v24 = v105;

    CFMutableStringRef v16 = v24;
  }
  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
  {
    CFMutableStringRef v104 = v16;
    NSAppendPrintF(&v104, (uint64_t)", AdFm %ld", v10, v11, v12, v13, v14, v15, adapterFamilyCode);
    double v26 = v104;

    CFMutableStringRef v16 = v26;
  }
  adapterName = self->_adapterName;
  if (adapterName)
  {
    CFMutableStringRef v103 = v16;
    NSAppendPrintF(&v103, (uint64_t)", AdNm '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)adapterName);
    double v28 = v103;

    CFMutableStringRef v16 = v28;
  }
  if (self->_adapterSharedSource)
  {
    CFMutableStringRef v102 = v16;
    NSAppendPrintF(&v102, (uint64_t)", AdSS %s", v10, v11, v12, v13, v14, v15, (uint64_t)"yes");
    double v29 = v102;

    CFMutableStringRef v16 = v29;
  }
  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
  {
    CFMutableStringRef v101 = v16;
    NSAppendPrintF(&v101, (uint64_t)", AdSI %ld", v10, v11, v12, v13, v14, v15, adapterSourceID);
    v31 = v101;

    CFMutableStringRef v16 = v31;
  }
  if (self->_showChargingUI)
  {
    CFMutableStringRef v100 = v16;
    NSAppendPrintF(&v100, (uint64_t)", ChUI %s", v10, v11, v12, v13, v14, v15, (uint64_t)"yes");
    double v32 = v100;

    CFMutableStringRef v16 = v32;
  }
  int64_t familyCode = self->_familyCode;
  if (familyCode)
  {
    CFMutableStringRef v99 = v16;
    NSAppendPrintF(&v99, (uint64_t)", Fm %ld", v10, v11, v12, v13, v14, v15, familyCode);
    v34 = v99;

    CFMutableStringRef v16 = v34;
  }
  groupID = self->_groupID;
  if (groupID)
  {
    CFMutableStringRef v98 = v16;
    NSAppendPrintF(&v98, (uint64_t)", GID %@", v10, v11, v12, v13, v14, v15, (uint64_t)groupID);
    double v36 = v98;

    CFMutableStringRef v16 = v36;
  }
  if ([(NSArray *)self->_LEDs count])
  {
    CFMutableStringRef v97 = v16;
    NSAppendPrintF(&v97, (uint64_t)", LEDs %##@", v37, v38, v39, v40, v41, v42, (uint64_t)self->_LEDs);
    char v43 = v97;

    CFMutableStringRef v16 = v43;
  }
  uint64_t v44 = *(uint64_t *)&self->_maxCapacity;
  if (*(double *)&v44 > 0.0)
  {
    CFMutableStringRef v96 = v16;
    NSAppendPrintF(&v96, (uint64_t)", MaxC %.2f%%", v37, v38, v39, v40, v41, v42, v44);
    char v45 = v96;

    CFMutableStringRef v16 = v45;
  }
  partID = self->_partID;
  if (partID)
  {
    CFMutableStringRef v95 = v16;
    NSAppendPrintF(&v95, (uint64_t)", PaID %@", v37, v38, v39, v40, v41, v42, (uint64_t)partID);
    id v47 = v95;

    CFMutableStringRef v16 = v47;
  }
  int64_t productID = self->_productID;
  if (productID)
  {
    CFMutableStringRef v94 = v16;
    NSAppendPrintF(&v94, (uint64_t)", PdID %ld", v37, v38, v39, v40, v41, v42, productID);
    double v49 = v94;

    CFMutableStringRef v16 = v49;
  }
  int64_t vendorID = self->_vendorID;
  if (vendorID)
  {
    CFMutableStringRef v93 = v16;
    NSAppendPrintF(&v93, (uint64_t)", VeID %ld", v37, v38, v39, v40, v41, v42, vendorID);
    long long v51 = v93;

    CFMutableStringRef v16 = v51;
  }
  int64_t temperature = self->_temperature;
  if (temperature)
  {
    CFMutableStringRef v92 = v16;
    NSAppendPrintF(&v92, (uint64_t)", Tmp %ld", v37, v38, v39, v40, v41, v42, temperature);
    long long v53 = v92;

    CFMutableStringRef v16 = v53;
  }
  type = self->_type;
  if (type)
  {
    CFMutableStringRef v91 = v16;
    NSAppendPrintF(&v91, (uint64_t)", Typ '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)type);
    double v55 = v91;

    CFMutableStringRef v16 = v55;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    CFMutableStringRef v90 = v16;
    NSAppendPrintF(&v90, (uint64_t)", TPT '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)transportType);
    v57 = v90;

    CFMutableStringRef v16 = v57;
  }
  name = self->_name;
  if (name)
  {
    CFMutableStringRef v89 = v16;
    NSAppendPrintF(&v89, (uint64_t)", Nm '%@'", v37, v38, v39, v40, v41, v42, (uint64_t)name);
    CFTypeID v59 = v89;

    CFMutableStringRef v16 = v59;
  }
  if (self->_chargeLevel != 0.0)
  {
    CFMutableStringRef v88 = v16;
    uint64_t v60 = 43;
    if (!self->_charging) {
      uint64_t v60 = 45;
    }
    NSAppendPrintF(&v88, (uint64_t)", L %c%.2f%%", v37, v38, v39, v40, v41, v42, v60);
    char v61 = v88;

    CFMutableStringRef v16 = v61;
  }
  unsigned int powerState = self->_powerState;
  if (powerState)
  {
    CFMutableStringRef v87 = v16;
    if (powerState > 3) {
      int64_t v63 = "?";
    }
    else {
      int64_t v63 = off_1E55BE8C8[powerState - 1];
    }
    NSAppendPrintF(&v87, (uint64_t)", St %s", v37, v38, v39, v40, v41, v42, (uint64_t)v63);
    uint64_t v64 = v87;

    CFMutableStringRef v16 = v64;
  }
  if ((self->_aggregate || self->_expectedComponents)
    && ![(CUPowerSource *)self isAggregateComponent])
  {
    CFMutableStringRef v86 = v16;
    NSAppendPrintF(&v86, (uint64_t)", Components: ", v65, v66, v67, v68, v69, v70, v81);
    char v71 = v86;

    if (self->_subLeft)
    {
      CFMutableStringRef v85 = v71;
      NSAppendPrintF(&v85, (uint64_t)"L", v72, v73, v74, v75, v76, v77, v82);
      char v78 = v85;

      char v71 = v78;
    }
    if (self->_subRight)
    {
      CFMutableStringRef v84 = v71;
      NSAppendPrintF(&v84, (uint64_t)"R", v72, v73, v74, v75, v76, v77, v82);
      CFTypeID v79 = v84;

      char v71 = v79;
    }
    if (self->_subCase)
    {
      CFMutableStringRef v83 = v71;
      NSAppendPrintF(&v83, (uint64_t)"C", v72, v73, v74, v75, v76, v77, v82);
      CFMutableStringRef v16 = v83;
    }
    else
    {
      CFMutableStringRef v16 = v71;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  int64_t v3 = self->_adapterSourceID ^ self->_sourceID;
  NSUInteger v4 = v3 ^ [(NSString *)self->_accessoryID hash];
  NSUInteger v5 = [(NSString *)self->_groupID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_accessoryCategory hash];
  return v6 ^ [(NSString *)self->_partID hash];
}

- (BOOL)hasAllComponents
{
  BOOL result = 1;
  if (self->_aggregate)
  {
    unsigned int expectedComponents = self->_expectedComponents;
    if ((expectedComponents & 1) != 0 && !self->_subLeft) {
      return 0;
    }
    if ((expectedComponents & 2) != 0 && !self->_subRight || (expectedComponents & 4) != 0 && !self->_subCase) {
      return 0;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t sourceID = self->_sourceID;
    if (sourceID == [v4 sourceID])
    {
      int64_t adapterSourceID = self->_adapterSourceID;
      if (adapterSourceID == [v4 adapterSourceID])
      {
        accessoryID = self->_accessoryID;
        v8 = [v4 accessoryID];
        id v9 = accessoryID;
        uint64_t v10 = v8;
        uint64_t v11 = v10;
        if (v9 == v10)
        {
        }
        else
        {
          if ((v9 == 0) == (v10 != 0))
          {
            char v13 = 0;
            BOOL v17 = v10;
LABEL_32:

            goto LABEL_33;
          }
          int v12 = [(NSString *)v9 isEqual:v10];

          if (!v12)
          {
            char v13 = 0;
LABEL_34:

            goto LABEL_9;
          }
        }
        groupID = self->_groupID;
        CFMutableStringRef v16 = [v4 groupID];
        BOOL v17 = groupID;
        int v18 = v16;
        id v9 = v18;
        if (v17 == v18)
        {
        }
        else
        {
          if ((v17 == 0) == (v18 != 0))
          {
            char v13 = 0;
            BOOL v22 = v18;
LABEL_31:

            goto LABEL_32;
          }
          int v19 = [(NSString *)v17 isEqual:v18];

          if (!v19)
          {
            char v13 = 0;
LABEL_33:

            goto LABEL_34;
          }
        }
        accessoryCategory = self->_accessoryCategory;
        char v21 = [v4 accessoryCategory];
        BOOL v22 = accessoryCategory;
        int64_t v23 = v21;
        BOOL v17 = v23;
        if (v22 == v23)
        {
        }
        else
        {
          if ((v22 == 0) == (v23 != 0))
          {
            char v13 = 0;
            double v27 = v23;
LABEL_30:

            goto LABEL_31;
          }
          int v24 = [(NSString *)v22 isEqual:v23];

          if (!v24)
          {
            char v13 = 0;
            goto LABEL_32;
          }
        }
        partID = self->_partID;
        double v26 = [v4 partID];
        double v27 = partID;
        double v28 = v26;
        BOOL v22 = v28;
        if (v27 == v28)
        {
          char v13 = 1;
        }
        else if ((v27 == 0) == (v28 != 0))
        {
          char v13 = 0;
        }
        else
        {
          char v13 = [(NSString *)v27 isEqual:v28];
        }

        goto LABEL_30;
      }
    }
  }
  char v13 = 0;
LABEL_9:

  return v13;
}

- (void)dealloc
{
  [(CUPowerSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CUPowerSource;
  [(CUPowerSource *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory) {
    [v30 encodeObject:accessoryCategory forKey:@"accessoryCategory"];
  }
  accessoryID = self->_accessoryID;
  if (accessoryID) {
    [v30 encodeObject:accessoryID forKey:@"accessoryID"];
  }
  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags) {
    [v30 encodeInteger:adapterErrorFlags forKey:@"adapterErrorFlag"];
  }
  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode) {
    [v30 encodeInteger:adapterFamilyCode forKey:@"adapterFamilyCode"];
  }
  adapterName = self->_adapterName;
  if (adapterName) {
    [v30 encodeObject:adapterName forKey:@"adapterName"];
  }
  if (self->_adapterSharedSource) {
    [v30 encodeBool:1 forKey:@"adapterSharedSource"];
  }
  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID) {
    [v30 encodeInteger:adapterSourceID forKey:@"adapterSourceID"];
  }
  if (self->_aggregate) {
    [v30 encodeBool:1 forKey:@"aggregate"];
  }
  if (self->_charging) {
    [v30 encodeBool:1 forKey:@"charging"];
  }
  if (self->_chargeLevel > 0.0) {
    objc_msgSend(v30, "encodeDouble:forKey:", @"chargeLevel");
  }
  int64_t familyCode = self->_familyCode;
  if (familyCode) {
    [v30 encodeInteger:familyCode forKey:@"familyCode"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v30 encodeObject:groupID forKey:@"groupID"];
  }
  if ([(NSArray *)self->_LEDs count]) {
    [v30 encodeObject:self->_LEDs forKey:@"LEDs"];
  }
  if (self->_maxCapacity > 0.0) {
    objc_msgSend(v30, "encodeDouble:forKey:", @"maxCapacity");
  }
  name = self->_name;
  char v13 = v30;
  if (name)
  {
    [v30 encodeObject:name forKey:@"name"];
    char v13 = v30;
  }
  partID = self->_partID;
  if (partID)
  {
    [v30 encodeObject:partID forKey:@"partID"];
    char v13 = v30;
  }
  partName = self->_partName;
  if (partName)
  {
    [v30 encodeObject:partName forKey:@"partName"];
    char v13 = v30;
  }
  uint64_t powerState = self->_powerState;
  if (powerState)
  {
    [v30 encodeInteger:powerState forKey:@"powerState"];
    char v13 = v30;
  }
  int64_t productID = self->_productID;
  if (productID)
  {
    [v30 encodeInteger:productID forKey:@"productID"];
    char v13 = v30;
  }
  uint64_t role = self->_role;
  if (role)
  {
    [v30 encodeInteger:role forKey:@"role"];
    char v13 = v30;
  }
  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    [v30 encodeInteger:sourceID forKey:@"sourceID"];
    char v13 = v30;
  }
  state = self->_state;
  if (state)
  {
    [v30 encodeObject:state forKey:@"state"];
    char v13 = v30;
  }
  subLeft = self->_subLeft;
  if (subLeft)
  {
    [v30 encodeObject:subLeft forKey:@"subLeft"];
    char v13 = v30;
  }
  subRight = self->_subRight;
  if (subRight)
  {
    [v30 encodeObject:subRight forKey:@"subRight"];
    char v13 = v30;
  }
  subCase = self->_subCase;
  if (subCase)
  {
    [v30 encodeObject:subCase forKey:@"subCase"];
    char v13 = v30;
  }
  subMain = self->_subMain;
  if (subMain)
  {
    [v30 encodeObject:subMain forKey:@"subMain"];
    char v13 = v30;
  }
  int64_t temperature = self->_temperature;
  if (temperature)
  {
    [v30 encodeInteger:temperature forKey:@"temperature"];
    char v13 = v30;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    [v30 encodeObject:transportType forKey:@"transportType"];
    char v13 = v30;
  }
  type = self->_type;
  if (type)
  {
    [v30 encodeObject:type forKey:@"type"];
    char v13 = v30;
  }
  int64_t vendorID = self->_vendorID;
  if (vendorID)
  {
    [v30 encodeInteger:vendorID forKey:@"vendorID"];
    char v13 = v30;
  }
  ioKitDescription = self->_ioKitDescription;
  if (ioKitDescription)
  {
    [v30 encodeObject:ioKitDescription forKey:@"ioKitDictionary"];
    char v13 = v30;
  }
  if (self->_present)
  {
    [v30 encodeBool:1 forKey:@"present"];
    char v13 = v30;
  }
}

- (void)_updateWithCoder:(id)a3
{
  id v4 = a3;
  accessoryCategory = self->_accessoryCategory;
  self->_accessoryCategory = 0;

  id v6 = v4;
  uint64_t v7 = objc_opt_class();
  NSDecodeObjectIfPresent(v6, @"accessoryCategory", v7, (void **)&self->_accessoryCategory);

  accessoryID = self->_accessoryID;
  self->_accessoryID = 0;

  id v9 = v6;
  uint64_t v10 = objc_opt_class();
  NSDecodeObjectIfPresent(v9, @"accessoryID", v10, (void **)&self->_accessoryID);

  self->_int64_t adapterErrorFlags = 0;
  id v11 = v9;
  if ([v11 containsValueForKey:@"adapterErrorFlag"]) {
    self->_int64_t adapterErrorFlags = [v11 decodeIntegerForKey:@"adapterErrorFlag"];
  }

  self->_int64_t adapterFamilyCode = 0;
  id v12 = v11;
  if ([v12 containsValueForKey:@"adapterFamilyCode"]) {
    self->_int64_t adapterFamilyCode = [v12 decodeIntegerForKey:@"adapterFamilyCode"];
  }

  adapterName = self->_adapterName;
  self->_adapterName = 0;

  id v14 = v12;
  uint64_t v15 = objc_opt_class();
  NSDecodeObjectIfPresent(v14, @"adapterName", v15, (void **)&self->_adapterName);

  self->_adapterSharedSource = 0;
  id v16 = v14;
  if ([v16 containsValueForKey:@"adapterSharedSource"]) {
    self->_adapterSharedSource = [v16 decodeBoolForKey:@"adapterSharedSource"];
  }

  self->_int64_t adapterSourceID = 0;
  id v17 = v16;
  if ([v17 containsValueForKey:@"adapterSourceID"]) {
    self->_int64_t adapterSourceID = [v17 decodeIntegerForKey:@"adapterSourceID"];
  }

  self->_aggregate = 0;
  id v18 = v17;
  if ([v18 containsValueForKey:@"aggregate"]) {
    self->_aggregate = [v18 decodeBoolForKey:@"aggregate"];
  }

  self->_charging = 0;
  id v19 = v18;
  if ([v19 containsValueForKey:@"charging"]) {
    self->_charging = [v19 decodeBoolForKey:@"charging"];
  }

  self->_chargeLevel = 0.0;
  id v20 = v19;
  if ([v20 containsValueForKey:@"chargeLevel"])
  {
    [v20 decodeDoubleForKey:@"chargeLevel"];
    self->_chargeLevel = v21;
  }

  self->_int64_t familyCode = 0;
  id v22 = v20;
  if ([v22 containsValueForKey:@"familyCode"]) {
    self->_int64_t familyCode = [v22 decodeIntegerForKey:@"familyCode"];
  }

  groupID = self->_groupID;
  self->_groupID = 0;

  id v24 = v22;
  uint64_t v25 = objc_opt_class();
  NSDecodeObjectIfPresent(v24, @"groupID", v25, (void **)&self->_groupID);

  LEDs = self->_LEDs;
  self->_LEDs = 0;

  uint64_t v27 = objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent(v24, @"LEDs", v27, (void **)&self->_LEDs);
  self->_maxCapacity = 0.0;
  id v28 = v24;
  if ([v28 containsValueForKey:@"maxCapacity"])
  {
    [v28 decodeDoubleForKey:@"maxCapacity"];
    self->_maxCapacity = v29;
  }

  name = self->_name;
  self->_name = 0;

  id v31 = v28;
  uint64_t v32 = objc_opt_class();
  NSDecodeObjectIfPresent(v31, @"name", v32, (void **)&self->_name);

  partID = self->_partID;
  self->_partID = 0;

  id v34 = v31;
  uint64_t v35 = objc_opt_class();
  NSDecodeObjectIfPresent(v34, @"partID", v35, (void **)&self->_partID);

  partName = self->_partName;
  self->_partName = 0;

  id v37 = v34;
  uint64_t v38 = objc_opt_class();
  NSDecodeObjectIfPresent(v37, @"partName", v38, (void **)&self->_partName);

  self->_uint64_t powerState = 0;
  uint64_t v64 = 0;
  if (NSDecodeSInt64RangedIfPresent(v37, @"powerState", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v64)) {
    self->_uint64_t powerState = v64;
  }
  self->_int64_t productID = 0;
  id v39 = v37;
  if ([v39 containsValueForKey:@"productID"]) {
    self->_int64_t productID = [v39 decodeIntegerForKey:@"productID"];
  }

  self->_uint64_t role = 0;
  uint64_t v64 = 0;
  if (NSDecodeSInt64RangedIfPresent(v39, @"role", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v64)) {
    self->_uint64_t role = v64;
  }
  self->_int64_t sourceID = 0;
  id v40 = v39;
  if ([v40 containsValueForKey:@"sourceID"]) {
    self->_int64_t sourceID = [v40 decodeIntegerForKey:@"sourceID"];
  }

  state = self->_state;
  self->_state = 0;

  id v42 = v40;
  uint64_t v43 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"state", v43, (void **)&self->_state);

  subLeft = self->_subLeft;
  self->_subLeft = 0;

  uint64_t v45 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subLeft", v45, (void **)&self->_subLeft);
  subRight = self->_subRight;
  self->_subRight = 0;

  uint64_t v47 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subRight", v47, (void **)&self->_subRight);
  subCase = self->_subCase;
  self->_subCase = 0;

  uint64_t v49 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subCase", v49, (void **)&self->_subCase);
  subMain = self->_subMain;
  self->_subMain = 0;

  uint64_t v51 = objc_opt_class();
  NSDecodeObjectIfPresent(v42, @"subMain", v51, (void **)&self->_subMain);
  self->_int64_t temperature = 0;
  id v52 = v42;
  if ([v52 containsValueForKey:@"temperature"]) {
    self->_int64_t temperature = [v52 decodeIntegerForKey:@"temperature"];
  }

  transportType = self->_transportType;
  self->_transportType = 0;

  id v54 = v52;
  uint64_t v55 = objc_opt_class();
  NSDecodeObjectIfPresent(v54, @"transportType", v55, (void **)&self->_transportType);

  type = self->_type;
  self->_type = 0;

  id v57 = v54;
  uint64_t v58 = objc_opt_class();
  NSDecodeObjectIfPresent(v57, @"type", v58, (void **)&self->_type);

  self->_int64_t vendorID = 0;
  id v59 = v57;
  if ([v59 containsValueForKey:@"vendorID"]) {
    self->_int64_t vendorID = [v59 decodeIntegerForKey:@"vendorID"];
  }

  ioKitDescription = self->_ioKitDescription;
  self->_ioKitDescription = 0;

  id v61 = v59;
  uint64_t v62 = objc_opt_class();
  NSDecodeStandardContainerIfPresent(v61, @"ioKitDictionary", v62, (void **)&self->_ioKitDescription);

  self->_present = 0;
  id v63 = v61;
  if ([v63 containsValueForKey:@"present"]) {
    self->_present = [v63 decodeBoolForKey:@"present"];
  }
}

- (CUPowerSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUPowerSource;
  NSUInteger v5 = [(CUPowerSource *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    [(CUPowerSource *)v5 _updateWithCoder:v4];
    uint64_t v7 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end