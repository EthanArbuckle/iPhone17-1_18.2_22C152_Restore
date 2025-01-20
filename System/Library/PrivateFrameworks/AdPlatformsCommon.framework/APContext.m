@interface APContext
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)maxSize;
- (APContentDepiction)current;
- (APContext)initWithCoder:(id)a3;
- (APContext)initWithIdentifier:(id)a3 maxSize:(id)a4 requestedAdIdentifier:(id)a5 currentContent:(id)a6 adjacentContent:(id)a7 supplementalContext:(id)a8;
- (NSArray)adjacent;
- (NSDate)prefetchTimestamp;
- (NSDictionary)supplementalContext;
- (NSString)fingerprint;
- (NSString)requestedAdIdentifier;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjacent:(id)a3;
- (void)setCurrent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxSize:(id)a3;
- (void)setPrefetchTimestamp:(id)a3;
- (void)setRequestedAdIdentifier:(id)a3;
- (void)setSupplementalContext:(id)a3;
@end

@implementation APContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContext)initWithIdentifier:(id)a3 maxSize:(id)a4 requestedAdIdentifier:(id)a5 currentContent:(id)a6 adjacentContent:(id)a7 supplementalContext:(id)a8
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v31 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)APContext;
  v20 = [(APContext *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    v21->_maxSize.width = var0;
    v21->_maxSize.height = var1;
    objc_storeStrong((id *)&v21->_requestedAdIdentifier, a5);
    objc_storeStrong((id *)&v21->_current, a6);
    objc_storeStrong((id *)&v21->_adjacent, a7);
    uint64_t v28 = objc_msgSend_copy(v19, v22, v23, v24, v25, v26, v27);
    supplementalContext = v21->_supplementalContext;
    v21->_supplementalContext = (NSDictionary *)v28;
  }
  return v21;
}

- (APContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)APContext;
  v5 = [(APContext *)&v78 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"identifier", v8, v9, v10);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    int v18 = objc_msgSend_decodeIntForKey_(v4, v13, @"height", v14, v15, v16, v17);
    v5->_maxSize.height = (double)v18;
    v5->_maxSize.width = (double)(int)objc_msgSend_decodeIntForKey_(v4, v19, @"width", v20, v21, (double)v18, v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"requestedAdIdentifier", v25, v26, v27);
    requestedAdIdentifier = v5->_requestedAdIdentifier;
    v5->_requestedAdIdentifier = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"current", v32, v33, v34);
    current = v5->_current;
    v5->_current = (APContentDepiction *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v45 = objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v44, v39, 0);
    uint64_t v50 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"adjacent", v47, v48, v49);
    adjacent = v5->_adjacent;
    v5->_adjacent = (NSArray *)v50;

    v52 = (void *)MEMORY[0x263EFFA08];
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    v63 = objc_msgSend_setWithObjects_(v52, v58, v53, v59, v60, v61, v62, v54, v55, v56, v57, 0);
    uint64_t v68 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v63, @"supplementalContext", v65, v66, v67);
    supplementalContext = v5->_supplementalContext;
    v5->_supplementalContext = (NSDictionary *)v68;

    uint64_t v70 = objc_opt_class();
    uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v70, @"prefetchTimestamp", v72, v73, v74);
    prefetchTimestamp = v5->_prefetchTimestamp;
    v5->_prefetchTimestamp = (NSDate *)v75;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"identifier", v13, v14, v15);

  objc_msgSend_maxSize(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt_forKey_(v4, v23, (int)v22, @"width", v24, v22, v25);
  objc_msgSend_maxSize(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt_forKey_(v4, v33, (int)v32, @"height", v34, v35, v32);
  uint64_t v42 = objc_msgSend_requestedAdIdentifier(self, v36, v37, v38, v39, v40, v41);
  objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)v42, @"requestedAdIdentifier", v44, v45, v46);

  uint64_t v53 = objc_msgSend_current(self, v47, v48, v49, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, @"current", v55, v56, v57);

  v64 = objc_msgSend_adjacent(self, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"adjacent", v66, v67, v68);

  uint64_t v75 = objc_msgSend_supplementalContext(self, v69, v70, v71, v72, v73, v74);
  objc_msgSend_encodeObject_forKey_(v4, v76, (uint64_t)v75, @"supplementalContext", v77, v78, v79);

  objc_msgSend_prefetchTimestamp(self, v80, v81, v82, v83, v84, v85);
  id v90 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v86, (uint64_t)v90, @"prefetchTimestamp", v87, v88, v89);
}

- (NSString)fingerprint
{
  uint64_t v7 = objc_msgSend_identifier(self, a2, v2, v3, v4, v5, v6);
  double v14 = objc_msgSend_UUIDString(v7, v8, v9, v10, v11, v12, v13);

  return (NSString *)v14;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)maxSize
{
  objc_copyStruct(v4, &self->_maxSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (void)setMaxSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = a3;
  objc_copyStruct(&self->_maxSize, &v3, 16, 1, 0);
}

- (NSString)requestedAdIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestedAdIdentifier:(id)a3
{
}

- (APContentDepiction)current
{
  return (APContentDepiction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrent:(id)a3
{
}

- (NSArray)adjacent
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdjacent:(id)a3
{
}

- (NSDictionary)supplementalContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSupplementalContext:(id)a3
{
}

- (NSDate)prefetchTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrefetchTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchTimestamp, 0);
  objc_storeStrong((id *)&self->_supplementalContext, 0);
  objc_storeStrong((id *)&self->_adjacent, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_requestedAdIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end