@interface CWFAutoJoinParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinParameters:(id)a3;
- (CWFAutoJoinParameters)initWithCoder:(id)a3;
- (CWFNetworkProfile)targetNetworkProfile;
- (NSArray)preferredChannels;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mode;
- (int64_t)trigger;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPreferredChannels:(id)a3;
- (void)setTargetNetworkProfile:(id)a3;
- (void)setTrigger:(int64_t)a3;
@end

@implementation CWFAutoJoinParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredChannels, 0);
  objc_storeStrong((id *)&self->_targetNetworkProfile, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(CWFAutoJoinParameters, a2, (uint64_t)a3, v3, v4);
  v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTrigger_(v11, v12, self->_trigger, v13, v14);
  objc_msgSend_setMode_(v11, v15, self->_mode, v16, v17);
  objc_msgSend_setTargetNetworkProfile_(v11, v18, (uint64_t)self->_targetNetworkProfile, v19, v20);
  objc_msgSend_setPreferredChannels_(v11, v21, (uint64_t)self->_preferredChannels, v22, v23);
  return v11;
}

- (id)description
{
  v6 = NSString;
  v7 = sub_1B4F520D4(self->_trigger, a2, v2, v3, v4);
  v12 = sub_1B4F52138(self->_mode, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_componentsJoinedByString_(self->_preferredChannels, v13, @", ", v14, v15);
  uint64_t v20 = objc_msgSend_stringWithFormat_(v6, v17, @"trigger=%@, mode=%@, preferredChannels=(%@), target=(%@)", v18, v19, v7, v12, v16, self->_targetNetworkProfile);

  return v20;
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (CWFNetworkProfile)targetNetworkProfile
{
  return self->_targetNetworkProfile;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void)setTargetNetworkProfile:(id)a3
{
}

- (void)setPreferredChannels:(id)a3
{
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isEqualToAutoJoinParameters:(id)a3
{
  id v6 = a3;
  int64_t trigger = self->_trigger;
  if (trigger == objc_msgSend_trigger(v6, v8, v9, v10, v11))
  {
    int64_t mode = self->_mode;
    if (mode == objc_msgSend_mode(v6, v12, v13, v14, v15))
    {
      targetNetworkProfile = self->_targetNetworkProfile;
      objc_msgSend_targetNetworkProfile(v6, v17, v18, v19, v20);
      v26 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
      if (targetNetworkProfile != v26)
      {
        if (!self->_targetNetworkProfile
          || (objc_msgSend_targetNetworkProfile(v6, v22, v23, v24, v25), (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          char isEqual = 0;
          goto LABEL_17;
        }
        uint64_t v3 = (void *)v27;
        v32 = self->_targetNetworkProfile;
        uint64_t v4 = objc_msgSend_targetNetworkProfile(v6, v28, v29, v30, v31);
        if (!objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35))
        {
          char isEqual = 0;
          goto LABEL_15;
        }
      }
      preferredChannels = self->_preferredChannels;
      objc_msgSend_preferredChannels(v6, v22, v23, v24, v25);
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
      char isEqual = preferredChannels == v42;
      if (!isEqual && self->_preferredChannels)
      {
        uint64_t v43 = objc_msgSend_preferredChannels(v6, v38, v39, v40, v41);
        if (!v43)
        {

          char isEqual = 0;
LABEL_14:
          if (targetNetworkProfile == v26)
          {
LABEL_17:

            goto LABEL_18;
          }
LABEL_15:

          goto LABEL_17;
        }
        v48 = (void *)v43;
        v49 = self->_preferredChannels;
        v50 = objc_msgSend_preferredChannels(v6, v44, v45, v46, v47);
        char isEqual = objc_msgSend_isEqual_(v49, v51, (uint64_t)v50, v52, v53);
      }
      goto LABEL_14;
    }
  }
  char isEqual = 0;
LABEL_18:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAutoJoinParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinParameters = objc_msgSend_isEqualToAutoJoinParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAutoJoinParameters = 0;
  }

  return isEqualToAutoJoinParameters;
}

- (unint64_t)hash
{
  int64_t v6 = self->_mode ^ self->_trigger;
  uint64_t v7 = v6 ^ objc_msgSend_hash(self->_targetNetworkProfile, a2, v2, v3, v4);
  return v7 ^ objc_msgSend_hash(self->_preferredChannels, v8, v9, v10, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t trigger = self->_trigger;
  id v13 = a3;
  objc_msgSend_encodeInteger_forKey_(v13, v5, trigger, @"_trigger", v6);
  objc_msgSend_encodeInteger_forKey_(v13, v7, self->_mode, @"_mode", v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_targetNetworkProfile, @"_targetNetworkProfile", v10);
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_preferredChannels, @"_preferredChannels", v12);
}

- (CWFAutoJoinParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CWFAutoJoinParameters;
  uint64_t v8 = [(CWFAutoJoinParameters *)&v29 init];
  if (v8)
  {
    v8->_int64_t trigger = objc_msgSend_decodeIntegerForKey_(v4, v5, @"_trigger", v6, v7);
    v8->_int64_t mode = objc_msgSend_decodeIntegerForKey_(v4, v9, @"_mode", v10, v11);
    uint64_t v12 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"_targetNetworkProfile", v14);
    targetNetworkProfile = v8->_targetNetworkProfile;
    v8->_targetNetworkProfile = (CWFNetworkProfile *)v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v23 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"_preferredChannels", v25);
    preferredChannels = v8->_preferredChannels;
    v8->_preferredChannels = (NSArray *)v26;
  }
  return v8;
}

- (NSArray)preferredChannels
{
  return self->_preferredChannels;
}

@end