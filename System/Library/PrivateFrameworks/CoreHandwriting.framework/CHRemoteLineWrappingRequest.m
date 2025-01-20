@interface CHRemoteLineWrappingRequest
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
- (BOOL)enableCachingIfAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteLineWrappingRequest:(id)a3;
- (CHRemoteLineWrappingRequest)initWithCoder:(id)a3;
- (CHRemoteLineWrappingRequest)initWithLineWrappableGroups:(id)a3 options:(id)a4;
- (NSArray)lineWrappableGroups;
- (NSDictionary)options;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation CHRemoteLineWrappingRequest

- (CHRemoteLineWrappingRequest)initWithLineWrappableGroups:(id)a3 options:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHRemoteLineWrappingRequest;
  v7 = [(CHRemoteLineWrappingRequest *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_lineWrappableGroups, a3);
  }

  return v8;
}

- (CHRemoteLineWrappingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHRemoteLineWrappingRequest;
  v5 = [(CHRemoteLineWrappingRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, @"lineWrappableGroups", v8, v9);
    lineWrappableGroups = v5->_lineWrappableGroups;
    v5->_lineWrappableGroups = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_lineWrappableGroups, @"lineWrappableGroups", v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqualToRemoteLineWrappingRequest:(id)a3
{
  uint64_t v9 = (CHRemoteLineWrappingRequest *)a3;
  if (self == v9) {
    goto LABEL_9;
  }
  int v10 = objc_msgSend_enableCachingIfAvailable(self, v4, v5, v6, v7, v8);
  if (v10 != objc_msgSend_enableCachingIfAvailable(v9, v11, v12, v13, v14, v15)) {
    goto LABEL_4;
  }
  v21 = objc_msgSend_lineWrappableGroups(self, v16, v17, v18, v19, v20);
  v27 = objc_msgSend_lineWrappableGroups(v9, v22, v23, v24, v25, v26);

  if (v21 != v27) {
    goto LABEL_4;
  }
  v34 = objc_msgSend_options(self, v28, v29, v30, v31, v32);
  v40 = objc_msgSend_options(v9, v35, v36, v37, v38, v39);

  if (v34 == v40)
  {
LABEL_9:
    BOOL v33 = 1;
    goto LABEL_10;
  }
  v51 = objc_msgSend_options(self, v41, v42, v43, v44, v45);
  if (v51)
  {
    v57 = objc_msgSend_options(v9, v46, v47, v48, v49, v50);
    if (v57)
    {
      v58 = objc_msgSend_options(self, v52, v53, v54, v55, v56);
      v64 = objc_msgSend_options(v9, v59, v60, v61, v62, v63);
      char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v58, v65, (uint64_t)v64, v66, v67, v68);

      if (isEqualToDictionary) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
LABEL_4:
  BOOL v33 = 0;
LABEL_10:

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteLineWrappingRequest = objc_msgSend_isEqualToRemoteLineWrappingRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteLineWrappingRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 17;
  uint64_t v7 = objc_msgSend_lineWrappableGroups(self, a2, v2, v3, v4, v5);

  uint64_t v8 = v42[3];
  unsigned int v14 = objc_msgSend_enableCachingIfAvailable(self, v9, v10, v11, v12, v13);
  uint64_t v15 = (uint64_t)v7 + 992 * v8 + 32 * v14 - v14 + -31 * v8;
  v42[3] = v15;
  v21 = objc_msgSend_options(self, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  v42[3] = v27 + 31 * v15;

  BOOL v33 = objc_msgSend_options(self, v28, v29, v30, v31, v32);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1C4B03090;
  v40[3] = &unk_1E64E3B58;
  v40[4] = &v41;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v33, v34, (uint64_t)v40, v35, v36, v37);

  unint64_t v38 = v42[3];
  _Block_object_dispose(&v41, 8);
  return v38;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (NSArray)lineWrappableGroups
{
  return self->_lineWrappableGroups;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lineWrappableGroups, 0);
}

@end