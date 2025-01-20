@interface GDLocationAddress
+ (unint64_t)triplesColumnsRequiredForRendering;
- (GDLocationAddress)initWithRelationshipIdTriplesIterator:(id)a3;
- (GDRelationshipIdentifier)relationshipIdentifier;
- (NSString)ISOCountryCode;
- (NSString)administrativeArea;
- (NSString)country;
- (NSString)locality;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subPremises;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (id)description;
@end

@implementation GDLocationAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);

  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (NSString)ISOCountryCode
{
  return self->_ISOCountryCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)subPremises
{
  return self->_subPremises;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (id)description
{
  v85 = NSString;
  v83 = objc_msgSend_relationshipIdentifier(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_subPremises(self, v6, v7, v8, v9);
  v88 = (void *)v10;
  if (v10) {
    v15 = (__CFString *)v10;
  }
  else {
    v15 = &stru_1F0AE2ED0;
  }
  v82 = v15;
  uint64_t v16 = objc_msgSend_subThoroughfare(self, v11, v12, v13, v14);
  v87 = (void *)v16;
  if (v16) {
    v21 = (__CFString *)v16;
  }
  else {
    v21 = &stru_1F0AE2ED0;
  }
  v81 = v21;
  uint64_t v22 = objc_msgSend_thoroughfare(self, v17, v18, v19, v20);
  v86 = (void *)v22;
  if (v22) {
    v27 = (__CFString *)v22;
  }
  else {
    v27 = &stru_1F0AE2ED0;
  }
  v80 = v27;
  uint64_t v28 = objc_msgSend_subLocality(self, v23, v24, v25, v26);
  v84 = (void *)v28;
  if (v28) {
    v33 = (__CFString *)v28;
  }
  else {
    v33 = &stru_1F0AE2ED0;
  }
  v79 = v33;
  uint64_t v34 = objc_msgSend_locality(self, v29, v30, v31, v32);
  v39 = (void *)v34;
  if (v34) {
    v40 = (__CFString *)v34;
  }
  else {
    v40 = &stru_1F0AE2ED0;
  }
  v78 = v40;
  uint64_t v41 = objc_msgSend_subAdministrativeArea(self, v35, v36, v37, v38);
  v46 = (void *)v41;
  if (v41) {
    v47 = (__CFString *)v41;
  }
  else {
    v47 = &stru_1F0AE2ED0;
  }
  v77 = v47;
  uint64_t v48 = objc_msgSend_administrativeArea(self, v42, v43, v44, v45);
  v53 = (void *)v48;
  if (v48) {
    v54 = (__CFString *)v48;
  }
  else {
    v54 = &stru_1F0AE2ED0;
  }
  uint64_t v55 = objc_msgSend_postalCode(self, v49, v50, v51, v52);
  v60 = (void *)v55;
  if (v55) {
    v61 = (__CFString *)v55;
  }
  else {
    v61 = &stru_1F0AE2ED0;
  }
  uint64_t v62 = objc_msgSend_country(self, v56, v57, v58, v59);
  v67 = (void *)v62;
  if (v62) {
    v68 = (__CFString *)v62;
  }
  else {
    v68 = &stru_1F0AE2ED0;
  }
  uint64_t v69 = objc_msgSend_ISOCountryCode(self, v63, v64, v65, v66);
  v73 = (void *)v69;
  if (v69) {
    v74 = (__CFString *)v69;
  }
  else {
    v74 = &stru_1F0AE2ED0;
  }
  v75 = objc_msgSend_stringWithFormat_(v85, v70, @"<GDLocationAddress id:%@ sp:%@ st:%@ t:%@ sl:%@ l:%@ sa:%@ a:%@ p:%@ c:%@ i:%@>", v71, v72, v83, v82, v81, v80, v79, v78, v77, v54, v61, v68, v74);

  return v75;
}

- (GDLocationAddress)initWithRelationshipIdTriplesIterator:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)GDLocationAddress;
  v5 = [(GDLocationAddress *)&v47 init];
  if (!v5) {
    goto LABEL_23;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v41 = v4;
  id obj = v4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v43, (uint64_t)v48, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    p_ISOCountryCode = (void **)&v5->_ISOCountryCode;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (!v5->_relationshipIdentifier)
        {
          uint64_t v16 = [GDRelationshipIdentifier alloc];
          v21 = objc_msgSend_relationshipId(v15, v17, v18, v19, v20);
          uint64_t v25 = objc_msgSend_initWithString_(v16, v22, (uint64_t)v21, v23, v24);
          relationshipIdentifier = v5->_relationshipIdentifier;
          v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v25;
        }
        v27 = objc_msgSend_relationshipPredicate(v15, v8, v9, v10, v11, p_ISOCountryCode);
        p_subPremises = (void **)&v5->_subPremises;
        if (objc_msgSend_isEqual_(v27, v28, @"PS730", v29, v30)) {
          goto LABEL_19;
        }
        p_subPremises = (void **)&v5->_subThoroughfare;
        if (objc_msgSend_isEqual_(v27, v31, @"PS570", v33, v34)) {
          goto LABEL_19;
        }
        p_subPremises = (void **)&v5->_thoroughfare;
        if ((objc_msgSend_isEqual_(v27, v31, @"PS316", v33, v34) & 1) != 0
          || (p_subPremises = (void **)&v5->_subLocality,
              (objc_msgSend_isEqual_(v27, v31, @"PS569", v33, v34) & 1) != 0)
          || (p_subPremises = (void **)&v5->_locality,
              (objc_msgSend_isEqual_(v27, v31, @"PS453", v33, v34) & 1) != 0)
          || (p_subPremises = (void **)&v5->_subAdministrativeArea,
              (objc_msgSend_isEqual_(v27, v31, @"PS568", v33, v34) & 1) != 0)
          || (p_subPremises = (void **)&v5->_administrativeArea,
              (objc_msgSend_isEqual_(v27, v31, @"PS455", v33, v34) & 1) != 0)
          || (p_subPremises = (void **)&v5->_postalCode,
              (objc_msgSend_isEqual_(v27, v31, @"PS315", v33, v34) & 1) != 0)
          || (p_subPremises = (void **)&v5->_country,
              (objc_msgSend_isEqual_(v27, v31, @"PS450", v33, v34) & 1) != 0)
          || (p_subPremises = p_ISOCountryCode,
              objc_msgSend_isEqual_(v27, v31, @"PS454", v33, v34)))
        {
LABEL_19:
          uint64_t v36 = objc_msgSend_object(v15, v31, v32, v33, v34);
          uint64_t v37 = *p_subPremises;
          *p_subPremises = (void *)v36;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v43, (uint64_t)v48, 16);
    }
    while (v12);
  }

  id v4 = v41;
  if (!v5->_relationshipIdentifier) {
    uint64_t v38 = 0;
  }
  else {
LABEL_23:
  }
    uint64_t v38 = v5;

  return v38;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end