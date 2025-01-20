@interface CWFRangingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRangingResult:(id)a3;
- (CWFRangingResult)initWithCoder:(id)a3;
- (NSArray)measurements;
- (NSData)identifier;
- (NSString)MACAddress;
- (double)distance;
- (double)standardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)status;
- (unint64_t)hash;
- (unint64_t)numberOfValidMeasurements;
- (void)encodeWithCoder:(id)a3;
- (void)setDistance:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setMACAddress:(id)a3;
- (void)setMeasurements:(id)a3;
- (void)setNumberOfValidMeasurements:(unint64_t)a3;
- (void)setStandardDeviation:(double)a3;
- (void)setStatus:(int)a3;
@end

@implementation CWFRangingResult

- (id)description
{
  v3 = NSString;
  v8 = CWFCorrectEthernetAddressString(self->_MACAddress);
  identifier = self->_identifier;
  if (identifier)
  {
    id v10 = [NSString alloc];
    v13 = objc_msgSend_initWithData_encoding_(v10, v11, (uint64_t)self->_identifier, 4, v12);
    v14 = self->_identifier;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  v15 = CWFHexadecimalStringFromData(v14, v4, v5, v6, v7);
  v19 = objc_msgSend_stringWithFormat_(v3, v16, @"mac=%@, id='%@' (%@), dist=%f, stddev=%f, measurements=[%@]", v17, v18, v8, v13, v15, *(void *)&self->_distance, *(void *)&self->_standardDeviation, self->_measurements);

  if (identifier) {
  return v19;
  }
}

- (BOOL)isEqualToRangingResult:(id)a3
{
  id v4 = a3;
  MACAddress = self->_MACAddress;
  objc_msgSend_MACAddress(v4, v6, v7, v8, v9);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (MACAddress != v14)
  {
    if (!self->_MACAddress
      || (objc_msgSend_MACAddress(v4, v10, v11, v12, v13), (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_38;
    }
    v20 = (void *)v15;
    v21 = self->_MACAddress;
    v22 = objc_msgSend_MACAddress(v4, v16, v17, v18, v19);
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      char isEqual = 0;
LABEL_37:

      goto LABEL_38;
    }
    v114 = v22;
    v115 = v20;
  }
  identifier = self->_identifier;
  objc_msgSend_identifier(v4, v10, v11, v12, v13);
  v32 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (identifier != v32)
  {
    if (!self->_identifier
      || (objc_msgSend_identifier(v4, v28, v29, v30, v31), (uint64_t v33 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      v22 = v114;
      v20 = v115;
      goto LABEL_36;
    }
    v38 = (void *)v33;
    v39 = self->_identifier;
    v40 = objc_msgSend_identifier(v4, v34, v35, v36, v37);
    if ((objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43) & 1) == 0)
    {

      char isEqual = 0;
      v22 = v114;
      v20 = v115;
      if (MACAddress == v14) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    v112 = v40;
    v113 = v38;
  }
  v44 = objc_msgSend_numberWithDouble_(NSNumber, v28, v29, v30, v31, self->_distance);
  v45 = NSNumber;
  objc_msgSend_distance(v4, v46, v47, v48, v49);
  v54 = objc_msgSend_numberWithDouble_(v45, v50, v51, v52, v53);
  if (!objc_msgSend_isEqualToNumber_(v44, v55, (uint64_t)v54, v56, v57))
  {

    char isEqual = 0;
    goto LABEL_34;
  }
  uint64_t v62 = objc_msgSend_numberWithDouble_(NSNumber, v58, v59, v60, v61, self->_standardDeviation);
  v63 = NSNumber;
  v64 = (void *)v62;
  objc_msgSend_standardDeviation(v4, v65, v66, v67, v68);
  v73 = objc_msgSend_numberWithDouble_(v63, v69, v70, v71, v72);
  if (objc_msgSend_isEqualToNumber_(v64, v74, (uint64_t)v73, v75, v76))
  {
    v111 = v64;
    int status = self->_status;
    if (status == objc_msgSend_status(v4, v77, v78, v79, v80))
    {
      unint64_t numberOfValidMeasurements = self->_numberOfValidMeasurements;
      if (numberOfValidMeasurements == objc_msgSend_numberOfValidMeasurements(v4, v82, v83, v84, v85))
      {
        measurements = self->_measurements;
        objc_msgSend_measurements(v4, v87, v88, v89, v90);
        v92 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (measurements == v92)
        {
          char isEqual = 1;
        }
        else
        {
          if (self->_measurements)
          {
            v110 = v92;
            v97 = objc_msgSend_measurements(v4, v93, v94, v95, v96);
            if (v97)
            {
              v102 = self->_measurements;
              v109 = v97;
              v103 = objc_msgSend_measurements(v4, v98, v99, v100, v101);
              char isEqual = objc_msgSend_isEqual_(v102, v104, (uint64_t)v103, v105, v106);

              v97 = v109;
            }
            else
            {
              char isEqual = 0;
            }
            v64 = v111;

            v92 = v110;
            goto LABEL_32;
          }
          char isEqual = 0;
        }
        v64 = v111;
LABEL_32:

        goto LABEL_33;
      }
    }
    char isEqual = 0;
    v64 = v111;
  }
  else
  {
    char isEqual = 0;
  }
LABEL_33:

LABEL_34:
  BOOL v107 = identifier == v32;
  v22 = v114;
  v20 = v115;
  if (!v107)
  {
  }
LABEL_36:

  if (MACAddress != v14) {
    goto LABEL_37;
  }
LABEL_38:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFRangingResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToRangingResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRangingResult = objc_msgSend_isEqualToRangingResult_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToRangingResult = 0;
  }

  return isEqualToRangingResult;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_identifier, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = v11 ^ objc_msgSend_hash(self->_measurements, v12, v13, v14, v15) ^ self->_status;
  v21 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18, v19, v20, self->_distance);
  uint64_t v26 = v16 ^ objc_msgSend_hash(v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_numberWithDouble_(NSNumber, v27, v28, v29, v30, self->_standardDeviation);
  unint64_t v36 = v26 ^ objc_msgSend_hash(v31, v32, v33, v34, v35) ^ self->_numberOfValidMeasurements;

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFRangingResult, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setIdentifier_(v11, v15, (uint64_t)self->_identifier, v16, v17);
  objc_msgSend_setDistance_(v11, v18, v19, v20, v21, self->_distance);
  objc_msgSend_setStandardDeviation_(v11, v22, v23, v24, v25, self->_standardDeviation);
  objc_msgSend_setStatus_(v11, v26, self->_status, v27, v28);
  objc_msgSend_setMeasurements_(v11, v29, (uint64_t)self->_measurements, v30, v31);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MACAddress = self->_MACAddress;
  id v19 = a3;
  objc_msgSend_encodeObject_forKey_(v19, v5, (uint64_t)MACAddress, @"_MACAddress", v6);
  objc_msgSend_encodeObject_forKey_(v19, v7, (uint64_t)self->_identifier, @"_identifier", v8);
  objc_msgSend_encodeDouble_forKey_(v19, v9, @"_distance", v10, v11, self->_distance);
  objc_msgSend_encodeDouble_forKey_(v19, v12, @"_standardDeviation", v13, v14, self->_standardDeviation);
  objc_msgSend_encodeInteger_forKey_(v19, v15, self->_status, @"_status", v16);
  objc_msgSend_encodeObject_forKey_(v19, v17, (uint64_t)self->_measurements, @"_measurements", v18);
}

- (CWFRangingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CWFRangingResult;
  uint64_t v5 = [(CWFRangingResult *)&v39 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_MACAddress", v8);
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_identifier", v13);
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v14;

    objc_msgSend_decodeDoubleForKey_(v4, v16, @"_distance", v17, v18);
    v5->_distance = v19;
    objc_msgSend_decodeDoubleForKey_(v4, v20, @"_standardDeviation", v21, v22);
    v5->_standardDeviation = v23;
    v5->_int status = objc_msgSend_decodeIntegerForKey_(v4, v24, @"_status", v25, v26);
    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v33 = objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v29, 0);
    uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, @"_measurements", v35);
    measurements = v5->_measurements;
    v5->_measurements = (NSArray *)v36;
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

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(double)a3
{
  self->_standardDeviation = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_int status = a3;
}

- (unint64_t)numberOfValidMeasurements
{
  return self->_numberOfValidMeasurements;
}

- (void)setNumberOfValidMeasurements:(unint64_t)a3
{
  self->_unint64_t numberOfValidMeasurements = a3;
}

- (NSArray)measurements
{
  return self->_measurements;
}

- (void)setMeasurements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end