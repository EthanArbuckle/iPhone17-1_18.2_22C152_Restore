@interface CWFEAPCredentials
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEAPCredentials:(id)a3;
- (CWFEAPCredentials)initWithCoder:(id)a3;
- (NSString)password;
- (NSString)username;
- (__SecIdentity)TLSIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)TLSIdentityHandle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPassword:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
- (void)setTLSIdentityHandle:(void *)a3;
- (void)setUsername:(id)a3;
@end

@implementation CWFEAPCredentials

- (void)dealloc
{
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFRelease(TLSIdentityHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)CWFEAPCredentials;
  [(CWFEAPCredentials *)&v4 dealloc];
}

- (__SecIdentity)TLSIdentity
{
  CFTypeRef arg = 0;
  if (!self->_TLSIdentityHandle) {
    return 0;
  }
  result = (__SecIdentity *)sub_1B4F87F74();
  if (result)
  {
    sub_1B4F87664((uint64_t)self->_TLSIdentityHandle, (uint64_t)&arg);
    result = (__SecIdentity *)arg;
    if (arg) {
      return (__SecIdentity *)CFAutorelease(arg);
    }
  }
  return result;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFRelease(TLSIdentityHandle);
  }
  v6 = 0;
  if (a3)
  {
    v6 = (void *)sub_1B4F87F74();
    if (v6) {
      sub_1B4F87820((uint64_t)a3);
    }
  }
  self->_TLSIdentityHandle = v6;
}

- (void)TLSIdentityHandle
{
  uint64_t v5 = objc_msgSend_TLSIdentity(self, a2, v2, v3, v4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  if (!sub_1B4F87F74()) {
    return 0;
  }
  sub_1B4F87820(v6);
  if (!v7) {
    return 0;
  }
  return (void *)CFAutorelease(v7);
}

- (void)setTLSIdentityHandle:(void *)a3
{
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle != a3)
  {
    CFTypeRef cf = 0;
    if (a3)
    {
      if (sub_1B4F87F74())
      {
        sub_1B4F87664((uint64_t)a3, (uint64_t)&cf);
        if (cf)
        {
          objc_msgSend_setTLSIdentity_(self, v6, (uint64_t)cf, v7, v8);
          CFRelease(cf);
        }
        return;
      }
      TLSIdentityHandle = self->_TLSIdentityHandle;
    }
    if (TLSIdentityHandle) {
      CFRelease(TLSIdentityHandle);
    }
    self->_TLSIdentityHandle = 0;
  }
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"hasUsername=%d, hasPassword=%d, hasIdentity=%d", v2, v3, self->_username != 0, self->_password != 0, self->_TLSIdentityHandle != 0);
}

- (BOOL)isEqualToEAPCredentials:(id)a3
{
  id v5 = a3;
  v14 = (const void *)objc_msgSend_TLSIdentity(v5, v6, v7, v8, v9);
  if (v14)
  {
    if (sub_1B4F87F74())
    {
      sub_1B4F87820((uint64_t)v14);
      v14 = v15;
    }
    else
    {
      v14 = 0;
    }
  }
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle == v14) {
    goto LABEL_9;
  }
  char isEqual = 0;
  if (v14 && TLSIdentityHandle)
  {
    if (!CFEqual(TLSIdentityHandle, v14))
    {
      char isEqual = 0;
LABEL_27:
      CFRelease(v14);
      goto LABEL_28;
    }
LABEL_9:
    username = self->_username;
    objc_msgSend_username(v5, v10, v11, v12, v13);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (username != v23)
    {
      if (!self->_username
        || (objc_msgSend_username(v5, v19, v20, v21, v22), (uint64_t v24 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        char isEqual = 0;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v3 = (void *)v24;
      v29 = self->_username;
      v30 = objc_msgSend_username(v5, v25, v26, v27, v28);
      if (!objc_msgSend_isEqual_(v29, v31, (uint64_t)v30, v32, v33))
      {
        char isEqual = 0;
LABEL_24:

        goto LABEL_25;
      }
      v52 = v30;
    }
    password = self->_password;
    objc_msgSend_password(v5, v19, v20, v21, v22);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    char isEqual = password == v39;
    if (!isEqual && self->_password)
    {
      uint64_t v40 = objc_msgSend_password(v5, v35, v36, v37, v38);
      if (!v40)
      {

        char isEqual = 0;
LABEL_19:
        v30 = v52;
        if (username == v23) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      v45 = (void *)v40;
      v46 = self->_password;
      v47 = objc_msgSend_password(v5, v41, v42, v43, v44);
      char isEqual = objc_msgSend_isEqual_(v46, v48, (uint64_t)v47, v49, v50);
    }
    goto LABEL_19;
  }
LABEL_26:
  if (v14) {
    goto LABEL_27;
  }
LABEL_28:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFEAPCredentials *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToEAPCredentials = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToEAPCredentials = objc_msgSend_isEqualToEAPCredentials_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToEAPCredentials = 0;
  }

  return isEqualToEAPCredentials;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_username, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_password, v7, v8, v9, v10);
  CFHashCode TLSIdentityHandle = (CFHashCode)self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFHashCode TLSIdentityHandle = CFHash((CFTypeRef)TLSIdentityHandle);
  }
  return v11 ^ v6 ^ TLSIdentityHandle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFEAPCredentials, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUsername_(v11, v12, (uint64_t)self->_username, v13, v14);
  objc_msgSend_setPassword_(v11, v15, (uint64_t)self->_password, v16, v17);
  uint64_t v22 = objc_msgSend_TLSIdentity(self, v18, v19, v20, v21);
  objc_msgSend_setTLSIdentity_(v11, v23, v22, v24, v25);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)username, @"_username", v6);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_password, @"_password", v8);
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_TLSIdentityHandle, @"_TLSIdentityHandle", v10);
}

- (CWFEAPCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CWFEAPCredentials;
  id v5 = [(CWFEAPCredentials *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_username", v8);
    username = v5->_username;
    v5->_username = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_password", v13);
    password = v5->_password;
    v5->_password = (NSString *)v14;

    v5->_CFHashCode TLSIdentityHandle = objc_msgSend_decodePropertyListForKey_(v4, v16, @"_TLSIdentityHandle", v17, v18);
  }

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end