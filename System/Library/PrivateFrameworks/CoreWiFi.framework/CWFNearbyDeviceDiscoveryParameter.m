@interface CWFNearbyDeviceDiscoveryParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNDDParameters:(id)a3;
- (CWFNearbyDeviceDiscoveryParameter)init;
- (CWFNearbyDeviceDiscoveryParameter)initWithCoder:(id)a3;
- (NSArray)macIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)band;
- (int64_t)bandwidth;
- (int64_t)channel;
- (int64_t)operation;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBand:(int64_t)a3;
- (void)setBandwidth:(int64_t)a3;
- (void)setChannel:(int64_t)a3;
- (void)setMacIds:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CWFNearbyDeviceDiscoveryParameter

- (CWFNearbyDeviceDiscoveryParameter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CWFNearbyDeviceDiscoveryParameter;
  v2 = [(CWFNearbyDeviceDiscoveryParameter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    macIds = v2->_macIds;
    v2->_macIds = 0;

    v3->_operation = 0;
    *(_OWORD *)&v3->_channel = 0u;
    *(_OWORD *)&v3->_bandwidth = 0u;
  }
  return v3;
}

- (id)description
{
  objc_super v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  objc_msgSend_appendFormat_(v6, v7, @"macIds=", v8, v9);
  if (objc_msgSend_count(self->_macIds, v10, v11, v12, v13))
  {
    unint64_t v17 = 0;
    do
    {
      v18 = objc_msgSend_objectAtIndexedSubscript_(self->_macIds, v14, v17, v15, v16);
      v19 = CWFCorrectEthernetAddressString(v18);
      objc_msgSend_appendFormat_(v6, v20, @"%@;", v21, v22, v19);

      ++v17;
    }
    while (v17 < objc_msgSend_count(self->_macIds, v23, v24, v25, v26));
  }
  objc_msgSend_appendFormat_(v6, v14, @"channel=%ld, ", v15, v16, self->_channel);
  objc_msgSend_appendFormat_(v6, v27, @"band=%ld, ", v28, v29, self->_band);
  objc_msgSend_appendFormat_(v6, v30, @"bandwidth=%ld, ", v31, v32, self->_bandwidth);
  objc_msgSend_appendFormat_(v6, v33, @"type=%ld, ", v34, v35, self->_type);
  objc_msgSend_appendFormat_(v6, v36, @"operation=%ld, ", v37, v38, self->_operation);
  return v6;
}

- (BOOL)isEqualToNDDParameters:(id)a3
{
  id v6 = a3;
  macIds = self->_macIds;
  objc_msgSend_macIds(v6, v8, v9, v10, v11);
  uint64_t v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (macIds != v16)
  {
    if (!self->_macIds
      || (objc_msgSend_macIds(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v27 = 0;
      goto LABEL_15;
    }
    uint64_t v3 = (void *)v17;
    uint64_t v22 = self->_macIds;
    uint64_t v4 = objc_msgSend_macIds(v6, v18, v19, v20, v21);
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      BOOL v26 = 0;
LABEL_14:

      BOOL v27 = v26;
      goto LABEL_15;
    }
  }
  int64_t channel = self->_channel;
  if (channel == objc_msgSend_channel(v6, v12, v13, v14, v15)
    && (int64_t band = self->_band, band == objc_msgSend_band(v6, v29, v30, v31, v32))
    && (int64_t bandwidth = self->_bandwidth, bandwidth == objc_msgSend_bandwidth(v6, v34, v35, v36, v37))
    && (int64_t type = self->_type, type == objc_msgSend_type(v6, v39, v40, v41, v42)))
  {
    int64_t operation = self->_operation;
    BOOL v26 = operation == objc_msgSend_operation(v6, v44, v45, v46, v47);
    BOOL v27 = v26;
  }
  else
  {
    BOOL v26 = 0;
    BOOL v27 = 0;
  }
  if (macIds != v16) {
    goto LABEL_14;
  }
LABEL_15:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFNearbyDeviceDiscoveryParameter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToNDDParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToNDDParameters = objc_msgSend_isEqualToNDDParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToNDDParameters = 0;
  }

  return isEqualToNDDParameters;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_macIds, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v7, self->_channel, v8, v9);
  uint64_t v15 = objc_msgSend_hash(v10, v11, v12, v13, v14) ^ v6;
  uint64_t v19 = objc_msgSend_numberWithInteger_(NSNumber, v16, self->_band, v17, v18);
  uint64_t v24 = objc_msgSend_hash(v19, v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_numberWithInteger_(NSNumber, v25, self->_bandwidth, v26, v27);
  uint64_t v33 = v15 ^ v24 ^ objc_msgSend_hash(v28, v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v34, self->_type, v35, v36);
  uint64_t v42 = objc_msgSend_hash(v37, v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_numberWithInteger_(NSNumber, v43, self->_operation, v44, v45);
  unint64_t v51 = v33 ^ v42 ^ objc_msgSend_hash(v46, v47, v48, v49, v50);

  return v51;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFNearbyDeviceDiscoveryParameter, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMacIds_(v11, v12, (uint64_t)self->_macIds, v13, v14);
  objc_msgSend_setChannel_(v11, v15, self->_channel, v16, v17);
  objc_msgSend_setBand_(v11, v18, self->_band, v19, v20);
  objc_msgSend_setBandwidth_(v11, v21, self->_bandwidth, v22, v23);
  objc_msgSend_setType_(v11, v24, self->_type, v25, v26);
  objc_msgSend_setOperation_(v11, v27, self->_operation, v28, v29);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  macIds = self->_macIds;
  id v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)macIds, @"_macIds", v6);
  objc_msgSend_encodeInteger_forKey_(v17, v7, self->_channel, @"_channel", v8);
  objc_msgSend_encodeInteger_forKey_(v17, v9, self->_band, @"_band", v10);
  objc_msgSend_encodeInteger_forKey_(v17, v11, self->_bandwidth, @"_bandwidth", v12);
  objc_msgSend_encodeInteger_forKey_(v17, v13, self->_type, @"_type", v14);
  objc_msgSend_encodeInteger_forKey_(v17, v15, self->_operation, @"_operation", v16);
}

- (CWFNearbyDeviceDiscoveryParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CWFNearbyDeviceDiscoveryParameter;
  v5 = [(CWFNearbyDeviceDiscoveryParameter *)&v33 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"_macIds", v14);
    macIds = v5->_macIds;
    v5->_macIds = (NSArray *)v15;

    v5->_int64_t channel = objc_msgSend_decodeIntegerForKey_(v4, v17, @"_channel", v18, v19);
    v5->_int64_t band = objc_msgSend_decodeIntegerForKey_(v4, v20, @"_band", v21, v22);
    v5->_int64_t bandwidth = objc_msgSend_decodeIntegerForKey_(v4, v23, @"_bandwidth", v24, v25);
    v5->_int64_t type = objc_msgSend_decodeIntegerForKey_(v4, v26, @"_type", v27, v28);
    v5->_int64_t operation = objc_msgSend_decodeIntegerForKey_(v4, v29, @"_operation", v30, v31);
  }

  return v5;
}

- (NSArray)macIds
{
  return self->_macIds;
}

- (void)setMacIds:(id)a3
{
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (int64_t)band
{
  return self->_band;
}

- (void)setBand:(int64_t)a3
{
  self->_int64_t band = a3;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (void)setBandwidth:(int64_t)a3
{
  self->_int64_t bandwidth = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_int64_t operation = a3;
}

- (void).cxx_destruct
{
}

@end