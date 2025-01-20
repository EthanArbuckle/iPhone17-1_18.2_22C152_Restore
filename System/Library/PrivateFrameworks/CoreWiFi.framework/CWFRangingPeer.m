@interface CWFRangingPeer
+ (BOOL)supportsSecureCoding;
+ (id)rangingPeerWithMACAddress:(id)a3 PMK:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRangingPeer:(id)a3;
- (BOOL)useCoreRotation;
- (CWFRangingPeer)initWithCoder:(id)a3;
- (NSData)PMK;
- (NSData)identifier;
- (NSString)MACAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfMeasurements;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMACAddress:(id)a3;
- (void)setNumberOfMeasurements:(unint64_t)a3;
- (void)setPMK:(id)a3;
- (void)setUseCoreRotation:(BOOL)a3;
@end

@implementation CWFRangingPeer

+ (id)rangingPeerWithMACAddress:(id)a3 PMK:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(CWFRangingPeer);
  objc_msgSend_setIdentifier_(v7, v8, 0, v9, v10);
  objc_msgSend_setMACAddress_(v7, v11, (uint64_t)v6, v12, v13);

  objc_msgSend_setPMK_(v7, v14, (uint64_t)v5, v15, v16);
  return v7;
}

- (id)description
{
  v3 = NSString;
  v8 = CWFCorrectEthernetAddressString(self->_MACAddress);
  identifier = self->_identifier;
  if (identifier)
  {
    id v10 = [NSString alloc];
    uint64_t v13 = objc_msgSend_initWithData_encoding_(v10, v11, (uint64_t)self->_identifier, 4, v12);
    v14 = self->_identifier;
  }
  else
  {
    v14 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v15 = CWFHexadecimalStringFromData(v14, v4, v5, v6, v7);
  v19 = objc_msgSend_stringWithFormat_(v3, v16, @"mac=%@, id='%@' (%@)", v17, v18, v8, v13, v15);

  if (identifier) {
  return v19;
  }
}

- (BOOL)isEqualToRangingPeer:(id)a3
{
  id v5 = a3;
  unint64_t numberOfMeasurements = self->_numberOfMeasurements;
  if (numberOfMeasurements == objc_msgSend_numberOfMeasurements(v5, v7, v8, v9, v10))
  {
    int useCoreRotation = self->_useCoreRotation;
    if (useCoreRotation == objc_msgSend_useCoreRotation(v5, v11, v12, v13, v14))
    {
      MACAddress = self->_MACAddress;
      objc_msgSend_MACAddress(v5, v16, v17, v18, v19);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (MACAddress != v25)
      {
        if (!self->_MACAddress
          || (objc_msgSend_MACAddress(v5, v21, v22, v23, v24), (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          char isEqual = 0;
          goto LABEL_31;
        }
        v31 = (void *)v26;
        v32 = self->_MACAddress;
        v33 = objc_msgSend_MACAddress(v5, v27, v28, v29, v30);
        if (!objc_msgSend_isEqual_(v32, v34, (uint64_t)v33, v35, v36))
        {
          char isEqual = 0;
LABEL_30:

          goto LABEL_31;
        }
        v75 = v31;
        v76 = v33;
      }
      PMK = self->_PMK;
      objc_msgSend_PMK(v5, v21, v22, v23, v24);
      v43 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (PMK != v43)
      {
        if (!self->_PMK || (objc_msgSend_PMK(v5, v39, v40, v41, v42), (uint64_t v44 = objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_25:
          char isEqual = 0;
          goto LABEL_26;
        }
        v3 = (void *)v44;
        v49 = self->_PMK;
        v50 = objc_msgSend_PMK(v5, v45, v46, v47, v48);
        if ((objc_msgSend_isEqual_(v49, v51, (uint64_t)v50, v52, v53) & 1) == 0)
        {

          char isEqual = 0;
LABEL_28:
          BOOL v72 = MACAddress == v25;
          v31 = v75;
LABEL_29:
          v33 = v76;
          if (!v72) {
            goto LABEL_30;
          }
LABEL_31:

          goto LABEL_32;
        }
        v74 = v50;
      }
      identifier = self->_identifier;
      objc_msgSend_identifier(v5, v39, v40, v41, v42);
      v55 = (NSData *)objc_claimAutoreleasedReturnValue();
      v60 = v55;
      char isEqual = identifier == v55;
      if (identifier == v55 || !self->_identifier)
      {

        if (PMK == v43)
        {
LABEL_26:
          v31 = v75;

          BOOL v72 = MACAddress == v25;
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v61 = objc_msgSend_identifier(v5, v56, v57, v58, v59);
        if (v61)
        {
          v66 = (void *)v61;
          v67 = self->_identifier;
          v68 = objc_msgSend_identifier(v5, v62, v63, v64, v65);
          char isEqual = objc_msgSend_isEqual_(v67, v69, (uint64_t)v68, v70, v71);

          if (PMK == v43)
          {
          }
          else
          {
          }
          goto LABEL_28;
        }

        if (PMK == v43) {
          goto LABEL_25;
        }
      }

      goto LABEL_26;
    }
  }
  char isEqual = 0;
LABEL_32:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFRangingPeer *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToRangingPeer = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRangingPeer = objc_msgSend_isEqualToRangingPeer_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToRangingPeer = 0;
  }

  return isEqualToRangingPeer;
}

- (unint64_t)hash
{
  unint64_t numberOfMeasurements = self->_numberOfMeasurements;
  uint64_t v7 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4) ^ numberOfMeasurements;
  uint64_t v12 = objc_msgSend_hash(self->_PMK, v8, v9, v10, v11);
  uint64_t v17 = v7 ^ v12 ^ objc_msgSend_hash(self->_identifier, v13, v14, v15, v16);
  v21 = objc_msgSend_numberWithBool_(NSNumber, v18, self->_useCoreRotation, v19, v20);
  unint64_t v26 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24, v25);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFRangingPeer, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setPMK_(v11, v15, (uint64_t)self->_PMK, v16, v17);
  objc_msgSend_setNumberOfMeasurements_(v11, v18, self->_numberOfMeasurements, v19, v20);
  objc_msgSend_setIdentifier_(v11, v21, (uint64_t)self->_identifier, v22, v23);
  objc_msgSend_setUseCoreRotation_(v11, v24, self->_useCoreRotation, v25, v26);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MACAddress = self->_MACAddress;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)MACAddress, @"_MACAddress", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_PMK, @"_PMK", v9);
  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v10, self->_numberOfMeasurements, v11, v12);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v13, @"_numberOfMeasurements", v15);

  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_identifier, @"_identifier", v17);
  objc_msgSend_numberWithBool_(NSNumber, v18, self->_useCoreRotation, v19, v20);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)v23, @"_useCoreRotation", v22);
}

- (CWFRangingPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CWFRangingPeer;
  id v5 = [(CWFRangingPeer *)&v38 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_MACAddress", v8);
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_PMK", v13);
    PMK = v5->_PMK;
    v5->_PMK = (NSData *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"_numberOfMeasurements", v18);
    v5->_unint64_t numberOfMeasurements = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23);

    uint64_t v24 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"_identifier", v26);
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v27;

    uint64_t v29 = objc_opt_class();
    v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"_useCoreRotation", v31);
    v5->_int useCoreRotation = objc_msgSend_BOOLValue(v32, v33, v34, v35, v36);
  }
  return v5;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)PMK
{
  return self->_PMK;
}

- (void)setPMK:(id)a3
{
}

- (unint64_t)numberOfMeasurements
{
  return self->_numberOfMeasurements;
}

- (void)setNumberOfMeasurements:(unint64_t)a3
{
  self->_unint64_t numberOfMeasurements = a3;
}

- (BOOL)useCoreRotation
{
  return self->_useCoreRotation;
}

- (void)setUseCoreRotation:(BOOL)a3
{
  self->_int useCoreRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PMK, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end