@interface CWFANQPParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)cacheOnly;
- (BOOL)includeMatchingKnownNetworkProfiles;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToANQPParameters:(id)a3;
- (CWFANQPParameters)initWithCoder:(id)a3;
- (NSArray)ANQPElementIDList;
- (NSArray)scanResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)acceptableCacheAge;
- (unint64_t)hash;
- (unint64_t)maximumAge;
- (unint64_t)maximumCacheAge;
- (unint64_t)minimumTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setANQPElementIDList:(id)a3;
- (void)setAcceptableCacheAge:(unint64_t)a3;
- (void)setCacheOnly:(BOOL)a3;
- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3;
- (void)setMaximumAge:(unint64_t)a3;
- (void)setMaximumCacheAge:(unint64_t)a3;
- (void)setMinimumTimestamp:(unint64_t)a3;
- (void)setScanResults:(id)a3;
@end

@implementation CWFANQPParameters

- (unint64_t)maximumCacheAge
{
  return self->_acceptableCacheAge / 0x3E8;
}

- (void)setMaximumCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = 1000 * a3;
}

- (BOOL)cacheOnly
{
  return self->_acceptableCacheAge == -1;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_acceptableCacheAge = -1;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"scanResults=%@, ANQPElementsIDList=%@, acceptableCacheAge=%lu, maxAge=%lu, minTimestanp=%llu, includeMatchingKnownNetworks=%d", v2, v3, self->_scanResults, self->_ANQPElementIDList, self->_acceptableCacheAge, self->_maximumAge, self->_minimumTimestamp, self->_includeMatchingKnownNetworkProfiles);
}

- (BOOL)isEqualToANQPParameters:(id)a3
{
  id v7 = a3;
  scanResults = self->_scanResults;
  objc_msgSend_scanResults(v7, v9, v10, v11, v12);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (scanResults == v17) {
    goto LABEL_7;
  }
  if (self->_scanResults)
  {
    uint64_t v18 = objc_msgSend_scanResults(v7, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v3 = (void *)v18;
      v23 = self->_scanResults;
      v24 = objc_msgSend_scanResults(v7, v19, v20, v21, v22);
      if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
      {
        BOOL v28 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v62 = v24;
LABEL_7:
      ANQPElementIDList = self->_ANQPElementIDList;
      objc_msgSend_ANQPElementIDList(v7, v13, v14, v15, v16);
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (ANQPElementIDList != v34)
      {
        if (!self->_ANQPElementIDList) {
          goto LABEL_21;
        }
        uint64_t v35 = objc_msgSend_ANQPElementIDList(v7, v30, v31, v32, v33);
        if (!v35) {
          goto LABEL_19;
        }
        v4 = (void *)v35;
        v40 = self->_ANQPElementIDList;
        v5 = objc_msgSend_ANQPElementIDList(v7, v36, v37, v38, v39);
        if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
        {
          BOOL v28 = 0;
          v24 = v62;
LABEL_16:

          goto LABEL_22;
        }
      }
      unint64_t acceptableCacheAge = self->_acceptableCacheAge;
      if (acceptableCacheAge == objc_msgSend_acceptableCacheAge(v7, v30, v31, v32, v33))
      {
        unint64_t maximumAge = self->_maximumAge;
        if (maximumAge == objc_msgSend_maximumAge(v7, v45, v46, v47, v48))
        {
          unint64_t minimumTimestamp = self->_minimumTimestamp;
          if (minimumTimestamp == objc_msgSend_minimumTimestamp(v7, v50, v51, v52, v53))
          {
            int includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
            BOOL v28 = includeMatchingKnownNetworkProfiles == objc_msgSend_includeMatchingKnownNetworkProfiles(v7, v55, v56, v57, v58);
            BOOL v60 = ANQPElementIDList == v34;
            v24 = v62;
            if (v60) {
              goto LABEL_22;
            }
            goto LABEL_16;
          }
        }
      }
      if (ANQPElementIDList != v34)
      {

LABEL_19:
        BOOL v28 = 0;
        v24 = v62;
        if (scanResults == v17) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_21:
      BOOL v28 = 0;
      v24 = v62;
LABEL_22:

      if (scanResults == v17) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFANQPParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToANQPParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToANQPParameters = objc_msgSend_isEqualToANQPParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToANQPParameters = 0;
  }

  return isEqualToANQPParameters;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_scanResults, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_ANQPElementIDList, v7, v8, v9, v10) ^ v6 ^ self->_acceptableCacheAge ^ self->_maximumAge ^ self->_minimumTimestamp ^ self->_includeMatchingKnownNetworkProfiles;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFANQPParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setScanResults_(v11, v12, (uint64_t)self->_scanResults, v13, v14);
  objc_msgSend_setANQPElementIDList_(v11, v15, (uint64_t)self->_ANQPElementIDList, v16, v17);
  objc_msgSend_setAcceptableCacheAge_(v11, v18, self->_acceptableCacheAge, v19, v20);
  objc_msgSend_setMaximumAge_(v11, v21, self->_maximumAge, v22, v23);
  objc_msgSend_setMinimumTimestamp_(v11, v24, self->_minimumTimestamp, v25, v26);
  objc_msgSend_setIncludeMatchingKnownNetworkProfiles_(v11, v27, self->_includeMatchingKnownNetworkProfiles, v28, v29);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  scanResults = self->_scanResults;
  id v29 = a3;
  objc_msgSend_encodeObject_forKey_(v29, v5, (uint64_t)scanResults, @"_scanResults", v6);
  objc_msgSend_encodeObject_forKey_(v29, v7, (uint64_t)self->_ANQPElementIDList, @"_ANQPElementIDList", v8);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, self->_acceptableCacheAge, v10, v11);
  objc_msgSend_encodeObject_forKey_(v29, v13, (uint64_t)v12, @"_acceptableCacheAge", v14);

  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, self->_maximumAge, v16, v17);
  objc_msgSend_encodeObject_forKey_(v29, v19, (uint64_t)v18, @"_maximumAge", v20);

  v24 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v21, self->_minimumTimestamp, v22, v23);
  objc_msgSend_encodeObject_forKey_(v29, v25, (uint64_t)v24, @"_minimumTimestamp", v26);

  objc_msgSend_encodeBool_forKey_(v29, v27, self->_includeMatchingKnownNetworkProfiles, @"_includeMatchingKnownNetworkProfiles", v28);
}

- (CWFANQPParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CWFANQPParameters;
  v5 = [(CWFANQPParameters *)&v56 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"_scanResults", v14);
    scanResults = v5->_scanResults;
    v5->_scanResults = (NSArray *)v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v23 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"_ANQPElementIDList", v25);
    ANQPElementIDList = v5->_ANQPElementIDList;
    v5->_ANQPElementIDList = (NSArray *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"_acceptableCacheAge", v30);
    v5->_unint64_t acceptableCacheAge = objc_msgSend_unsignedIntegerValue(v31, v32, v33, v34, v35);

    uint64_t v36 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"_maximumAge", v38);
    v5->_unint64_t maximumAge = objc_msgSend_unsignedIntegerValue(v39, v40, v41, v42, v43);

    uint64_t v44 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"_minimumTimestamp", v46);
    v5->_unint64_t minimumTimestamp = objc_msgSend_unsignedLongLongValue(v47, v48, v49, v50, v51);

    v5->_int includeMatchingKnownNetworkProfiles = objc_msgSend_decodeBoolForKey_(v4, v52, @"_includeMatchingKnownNetworkProfiles", v53, v54);
  }

  return v5;
}

- (NSArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
}

- (NSArray)ANQPElementIDList
{
  return self->_ANQPElementIDList;
}

- (void)setANQPElementIDList:(id)a3
{
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_unint64_t acceptableCacheAge = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_unint64_t maximumAge = a3;
}

- (unint64_t)minimumTimestamp
{
  return self->_minimumTimestamp;
}

- (void)setMinimumTimestamp:(unint64_t)a3
{
  self->_unint64_t minimumTimestamp = a3;
}

- (BOOL)includeMatchingKnownNetworkProfiles
{
  return self->_includeMatchingKnownNetworkProfiles;
}

- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3
{
  self->_int includeMatchingKnownNetworkProfiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANQPElementIDList, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);
}

@end