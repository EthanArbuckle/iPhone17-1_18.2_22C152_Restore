@interface MTRAccessGrant
+ (id)accessGrantForAllNodesWithPrivilege:(unsigned __int8)a3;
+ (id)accessGrantForCASEAuthenticatedTag:(id)a3 privilege:(unsigned __int8)a4;
+ (id)accessGrantForGroupID:(id)a3 privilege:(unsigned __int8)a4;
+ (id)accessGrantForNodeID:(id)a3 privilege:(unsigned __int8)a4;
- (BOOL)isEqual:(id)a3;
- (NSNumber)subjectID;
- (id)description;
- (unint64_t)hash;
- (unsigned)authenticationMode;
- (unsigned)grantedPrivilege;
@end

@implementation MTRAccessGrant

+ (id)accessGrantForNodeID:(id)a3 privilege:(unsigned __int8)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  if ((unint64_t)(v8 - 1) >= 0xFFFFFFEFFFFFFFFFLL)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v8;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided non-operational node ID: 0x%llx", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v13 = 0;
  }
  else
  {
    v9 = [MTRAccessGrant alloc];
    v12 = objc_msgSend_copy(v5, v10, v11);
    v13 = sub_244B21710(v9, v12, a4, 2);
  }

  return v13;
}

+ (id)accessGrantForCASEAuthenticatedTag:(id)a3 privilege:(unsigned __int8)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  unint64_t v9 = v8;
  if (HIDWORD(v8))
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v9;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided too-large CAT value: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((_WORD)v8)
  {
    v10 = [MTRAccessGrant alloc];
    v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, v9 | 0xFFFFFFFD00000000);
    v13 = sub_244B21710(v10, v12, a4, 2);

    goto LABEL_13;
  }
  v15 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v9;
    _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided invalid CAT value: 0x%x", buf, 8u);
  }

  if (sub_244CC4E58(1u)) {
LABEL_11:
  }
    sub_244CC4DE0(0, 1);
LABEL_12:
  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)accessGrantForGroupID:(id)a3 privilege:(unsigned __int8)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v8 = objc_msgSend_unsignedLongLongValue(v5, v6, v7);
  unint64_t v9 = v8;
  if (v8 >= 0x10000)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v9;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided too-large group id: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    v10 = [MTRAccessGrant alloc];
    v12 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, v9 | 0xFFFFFFFFFFFF0000);
    v13 = sub_244B21710(v10, v12, a4, 3);

    goto LABEL_13;
  }
  v15 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = 0;
    _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "MTRAccessGrant provided invalid group id: 0x%x", buf, 8u);
  }

  if (sub_244CC4E58(1u)) {
LABEL_11:
  }
    sub_244CC4DE0(0, 1);
LABEL_12:
  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)accessGrantForAllNodesWithPrivilege:(unsigned __int8)a3
{
  v3 = sub_244B21710([MTRAccessGrant alloc], 0, a3, 2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v8 = v5;
    uint64_t v11 = v8;
    subjectID = self->_subjectID;
    v13 = subjectID;
    if (!subjectID)
    {
      v3 = objc_msgSend_subjectID(v8, v9, v10);
      if (!v3) {
        goto LABEL_10;
      }
      v13 = self->_subjectID;
    }
    v14 = objc_msgSend_subjectID(v11, v9, v10);
    int isEqual = objc_msgSend_isEqual_(v13, v15, (uint64_t)v14);

    if (subjectID)
    {
      if (!isEqual) {
        goto LABEL_12;
      }
    }
    else
    {

      if ((isEqual & 1) == 0) {
        goto LABEL_12;
      }
    }
LABEL_10:
    int grantedPrivilege = self->_grantedPrivilege;
    if (grantedPrivilege == objc_msgSend_grantedPrivilege(v11, v9, v10))
    {
      int authenticationMode = self->_authenticationMode;
      BOOL v7 = authenticationMode == objc_msgSend_authenticationMode(v11, v18, v19);
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  return objc_msgSend_unsignedIntegerValue(self->_subjectID, a2, v2) ^ self->_grantedPrivilege ^ (unint64_t)self->_authenticationMode;
}

- (id)description
{
  unsigned int v3 = self->_grantedPrivilege - 1;
  if (v3 > 4) {
    v4 = @"Unknown";
  }
  else {
    v4 = off_265199678[(char)v3];
  }
  subjectID = self->_subjectID;
  if (subjectID)
  {
    unint64_t v6 = objc_msgSend_unsignedLongLongValue(subjectID, a2, v2);
    if (v6 < 0xFFFFFFFFFFFF0000)
    {
      BOOL v7 = NSString;
      unint64_t v16 = v6;
      uint64_t v17 = v4;
      uint64_t v14 = objc_opt_class();
      if (HIDWORD(v6) == 4294967293) {
        unint64_t v9 = @"<%@ nodes with CASE Authenticated Tag 0x%08x can %@>";
      }
      else {
        unint64_t v9 = @"<%@ node 0x%016llx can %@>";
      }
    }
    else
    {
      BOOL v7 = NSString;
      unint64_t v16 = (unsigned __int16)v6;
      uint64_t v17 = v4;
      uint64_t v14 = objc_opt_class();
      unint64_t v9 = @"<%@ group 0x%x can %@>";
    }
    objc_msgSend_stringWithFormat_(v7, v8, (uint64_t)v9, v14, v16, v17);
  }
  else
  {
    uint64_t v10 = NSString;
    uint64_t v15 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v10, v11, @"<%@ all nodes can %@>", v15, v4);
  v12 = };

  return v12;
}

- (NSNumber)subjectID
{
  return self->_subjectID;
}

- (unsigned)grantedPrivilege
{
  return self->_grantedPrivilege;
}

- (unsigned)authenticationMode
{
  return self->_authenticationMode;
}

- (void).cxx_destruct
{
}

@end