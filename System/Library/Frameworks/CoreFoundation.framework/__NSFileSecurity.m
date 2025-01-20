@interface __NSFileSecurity
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)__new:(_filesec *)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)clearProperties:(unint64_t)a3;
- (BOOL)copyAccessControlList:(_acl *)a3;
- (BOOL)getGroup:(unsigned int *)a3;
- (BOOL)getGroupUUID:(unsigned __int8 *)(a3;
- (BOOL)getMode:(unsigned __int16 *)a3;
- (BOOL)getOwner:(unsigned int *)a3;
- (BOOL)getOwnerUUID:(unsigned __int8 *)(a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setAccessControlList:(_acl *)a3;
- (BOOL)setGroup:(unsigned int)a3;
- (BOOL)setGroupUUID:(unsigned __int8)a3[16];
- (BOOL)setMode:(unsigned __int16)a3;
- (BOOL)setOwner:(unsigned int)a3;
- (BOOL)setOwnerUUID:(unsigned __int8)a3[16];
- (__NSFileSecurity)initWithCoder:(id)a3;
- (_filesec)_filesec;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSFileSecurity

+ (id)__new:(_filesec *)a3
{
  id result = __CFAllocateObject((objc_class *)a1, 0);
  *((void *)result + 1) = a3;
  return result;
}

- (_filesec)_filesec
{
  return self->_filesec;
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  filesec = self->_filesec;
  if (filesec) {
    filesec_free(filesec);
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSFileSecurity;
  [(__NSFileSecurity *)&v4 dealloc];
}

- (BOOL)getOwner:(unsigned int *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  unsigned int v6 = 0;
  int property = filesec_get_property(self->_filesec, FILESEC_OWNER, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)getMode:(unsigned __int16 *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  unsigned __int16 v6 = 0;
  int property = filesec_get_property(self->_filesec, FILESEC_MODE, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)getGroup:(unsigned int *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  unsigned int v6 = 0;
  int property = filesec_get_property(self->_filesec, FILESEC_GROUP, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)setOwner:(unsigned int)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  unsigned int v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_OWNER, &v4) == 0;
}

- (BOOL)setGroup:(unsigned int)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  unsigned int v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_GROUP, &v4) == 0;
}

- (BOOL)setMode:(unsigned __int16)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  unsigned __int16 v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_MODE, &v4) == 0;
}

- (BOOL)getOwnerUUID:(unsigned __int8 *)(a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  long long v6 = 0uLL;
  int property = filesec_get_property(self->_filesec, FILESEC_UUID, &v6);
  if (!property) {
    *(_OWORD *)a3 = v6;
  }
  return property == 0;
}

- (BOOL)setOwnerUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_UUID, a3) == 0;
}

- (BOOL)getGroupUUID:(unsigned __int8 *)(a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  long long v6 = 0uLL;
  int property = filesec_get_property(self->_filesec, FILESEC_GRPUUID, &v6);
  if (!property) {
    *(_OWORD *)a3 = v6;
  }
  return property == 0;
}

- (BOOL)setGroupUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_GRPUUID, a3) == 0;
}

- (BOOL)copyAccessControlList:(_acl *)a3
{
  acl[1] = *(acl_t *)off_1ECE0A5B0;
  acl[0] = 0;
  int property = filesec_get_property(self->_filesec, FILESEC_ACL, acl);
  if (!property)
  {
    uint64_t v5 = acl_dup(acl[0]);
    *a3 = v5;
    if (v5) {
      acl_free(acl[0]);
    }
    else {
      *a3 = acl[0];
    }
  }
  return property == 0;
}

- (BOOL)setAccessControlList:(_acl *)a3
{
  v7[1] = *(void *)off_1ECE0A5B0;
  filesec = self->_filesec;
  v7[0] = a3;
  unsigned __int16 v4 = v7;
  if (!a3) {
    unsigned __int16 v4 = 0;
  }
  if (a3 == (_acl *)1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = (uint64_t)v4;
  }
  return filesec_set_property(filesec, FILESEC_ACL, (const void *)v5) == 0;
}

- (BOOL)clearProperties:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    BOOL v5 = filesec_unset_property(self->_filesec, FILESEC_OWNER) == 0;
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v5 = 1;
    if ((a3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  if (filesec_unset_property(self->_filesec, FILESEC_GROUP)) {
    BOOL v5 = 0;
  }
LABEL_7:
  if ((v3 & 4) != 0)
  {
    if (filesec_unset_property(self->_filesec, FILESEC_MODE)) {
      BOOL v5 = 0;
    }
    if ((v3 & 8) == 0)
    {
LABEL_9:
      if ((v3 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (filesec_unset_property(self->_filesec, FILESEC_UUID)) {
    BOOL v5 = 0;
  }
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      return v5;
    }
    goto LABEL_11;
  }
LABEL_20:
  if (filesec_unset_property(self->_filesec, FILESEC_GRPUUID)) {
    BOOL v5 = 0;
  }
  if ((v3 & 0x20) != 0)
  {
LABEL_11:
    if (filesec_unset_property(self->_filesec, FILESEC_ACL)) {
      return 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self;
  v10[1] = *(void *)off_1ECE0A5B0;
  char v3 = [(__NSFileSecurity *)self _filesec];
  if (v3)
  {
    unsigned __int16 v4 = v3;
    v10[0] = 0;
    v9[0] = 0;
    v9[1] = 0;
    __int16 v8 = 0;
    v6[1] = 0;
    obj_p = 0;
    v6[0] = 0;
    if (filesec_get_property(v3, FILESEC_OWNER, (char *)v10 + 4)) {
      unint64_t v2 = 1;
    }
    else {
      unint64_t v2 = 3;
    }
    if (!filesec_get_property(v4, FILESEC_GROUP, v10)) {
      v2 |= 4uLL;
    }
    if (!filesec_get_property(v4, FILESEC_UUID, v9)) {
      v2 |= 8uLL;
    }
    if (!filesec_get_property(v4, FILESEC_MODE, &v8)) {
      v2 |= 0x10uLL;
    }
    if (!filesec_get_property(v4, FILESEC_ACL, &obj_p))
    {
      acl_free(obj_p);
      v2 |= 0x20uLL;
    }
    if (!filesec_get_property(v4, FILESEC_GRPUUID, v6)) {
      v2 |= 0x40uLL;
    }
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *(void *)off_1ECE0A5B0;
  if (self == a3) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(__NSFileSecurity *)self _filesec];
  uint64_t v6 = [a3 _filesec];
  uint64_t v7 = (_filesec *)v6;
  if (!v5 || !v6) {
    return ((unint64_t)v5 | v6) == 0;
  }
  LODWORD(acl) = 0;
  LODWORD(v26) = 0;
  int property = filesec_get_property(v5, FILESEC_OWNER, &acl);
  if ((property == 0) == (filesec_get_property(v7, FILESEC_OWNER, &v26) != 0)
    || !property && acl != v26)
  {
    return 0;
  }
  LODWORD(acl) = 0;
  LODWORD(v26) = 0;
  int v9 = filesec_get_property(v5, FILESEC_GROUP, &acl);
  if ((v9 == 0) == (filesec_get_property(v7, FILESEC_GROUP, &v26) != 0) || !v9 && acl != v26) {
    return 0;
  }
  LOWORD(acl) = 0;
  LOWORD(v26) = 0;
  int v10 = filesec_get_property(v5, FILESEC_MODE, &acl);
  if ((v10 == 0) == (filesec_get_property(v7, FILESEC_MODE, &v26) != 0)
    || !v10 && (unsigned __int16)acl != (unsigned __int16)v26)
  {
    return 0;
  }
  acl_t acl = 0;
  uint64_t v29 = 0;
  acl_t v26 = 0;
  uint64_t v27 = 0;
  int v11 = filesec_get_property(v5, FILESEC_UUID, &acl);
  if ((v11 == 0) == (filesec_get_property(v7, FILESEC_UUID, &v26) != 0)) {
    return 0;
  }
  if (!v11 && (acl != v26 || v29 != v27)) {
    return 0;
  }
  acl_t acl = 0;
  uint64_t v29 = 0;
  acl_t v26 = 0;
  uint64_t v27 = 0;
  int v12 = filesec_get_property(v5, FILESEC_GRPUUID, &acl);
  if ((v12 == 0) == (filesec_get_property(v7, FILESEC_GRPUUID, &v26) != 0)) {
    return 0;
  }
  if (!v12 && (acl != v26 || v29 != v27)) {
    return 0;
  }
  acl_t acl = 0;
  acl_t v26 = 0;
  int v13 = filesec_get_property(v5, FILESEC_ACL, &acl);
  int v14 = filesec_get_property(v7, FILESEC_ACL, &v26);
  int v15 = v14;
  if (v14 | v13)
  {
    BOOL v16 = (v13 == 0) == (v14 == 0);
    if (v13) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  ssize_t v24 = 0;
  ssize_t len_p = 0;
  v20 = acl_to_text(acl, &len_p);
  v21 = acl_to_text(v26, &v24);
  v22 = v21;
  if (v20 && v21)
  {
    BOOL v23 = len_p == v24 && memcmp(v20, v21, len_p) == 0;
    goto LABEL_43;
  }
  BOOL v23 = 0;
  BOOL v16 = 0;
  if (v20)
  {
LABEL_43:
    acl_free(v20);
    BOOL v16 = v23;
  }
  if (v22) {
    acl_free(v22);
  }
LABEL_46:
  acl_free(acl);
LABEL_47:
  if (!v15) {
    acl_free(v26);
  }
  return v16;
}

- (id)description
{
  v30[1] = *(void *)off_1ECE0A5B0;
  char v3 = [(__NSFileSecurity *)self _filesec];
  unsigned __int16 v4 = v3;
  if (!v3)
  {
LABEL_47:
    id result = (id)CFStringCreateWithFormat(0, 0, @"<FileSecurity %p> [%p]", self, v4);
    v19 = result;
    if (!result) {
      return result;
    }
    return (id)_CFAutoreleasePoolAddObject(0, (uint64_t)v19);
  }
  v30[0] = 0;
  unsigned __int16 v29 = 0;
  *(void *)&v28.byte0 = 0;
  *(void *)&v28.byte8 = 0;
  *(void *)&v27.byte0 = 0;
  *(void *)&v27.byte8 = 0;
  acl_t acl = 0;
  int property = filesec_get_property(v3, FILESEC_OWNER, (char *)v30 + 4);
  int v6 = filesec_get_property(v4, FILESEC_GROUP, v30);
  int v24 = filesec_get_property(v4, FILESEC_MODE, &v29);
  int v7 = filesec_get_property(v4, FILESEC_UUID, &v28);
  int v8 = filesec_get_property(v4, FILESEC_GRPUUID, &v27);
  int v9 = filesec_get_property(v4, FILESEC_ACL, &acl);
  CFUUIDRef v10 = 0;
  if (v7)
  {
    if (v8)
    {
LABEL_4:
      CFUUIDRef cf = 0;
      goto LABEL_7;
    }
  }
  else
  {
    CFUUIDRef v10 = CFUUIDCreateFromUUIDBytes(0, v28);
    if (v8) {
      goto LABEL_4;
    }
  }
  CFUUIDRef cf = CFUUIDCreateFromUUIDBytes(0, v27);
LABEL_7:
  int v22 = v9;
  if (v9)
  {
    v21 = 0;
    int v11 = @"(null)";
    if (property)
    {
LABEL_9:
      CFStringRef v12 = @"(null)";
      goto LABEL_20;
    }
  }
  else
  {
    if (acl == (acl_t)1)
    {
      int v11 = @"_FILESEC_REMOVE_ACL";
    }
    else
    {
      ssize_t len_p = 0;
      int v13 = acl_to_text(acl, &len_p);
      if (v13)
      {
        int v14 = v13;
        CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)v13, len_p, 0x8000100u, 0);
        acl_free(v14);
      }
      else
      {
        CFStringRef v15 = 0;
      }
      if (v15) {
        int v11 = (__CFString *)v15;
      }
      else {
        int v11 = @"(acl_to_text failed)";
      }
    }
    v21 = v11;
    if (property) {
      goto LABEL_9;
    }
  }
  CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"%d", HIDWORD(v30[0]));
LABEL_20:
  int v16 = v6;
  if (v6) {
    CFStringRef v17 = @"(null)";
  }
  else {
    CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"%d", LODWORD(v30[0]));
  }
  if (v24) {
    CFStringRef v18 = @"(null)";
  }
  else {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"%d", v29);
  }
  v19 = 0;
  if (v12 && v17 && v18) {
    v19 = (void *)CFStringCreateWithFormat(0, 0, @"<FileSecurity %p> [%p] {FILESEC_OWNER = %@, FILESEC_GROUP = %@, FILESEC_MODE = %@, FILESEC_UUID = %@, FILESEC_GRPUUID = %@, FILESEC_ACL = %@}", self, v4, v12, v17, v18, v10, cf, v11, v21);
  }
  if (!property && v12) {
    CFRelease(v12);
  }
  if (!v16 && v17) {
    CFRelease(v17);
  }
  if (!v24 && v18) {
    CFRelease(v18);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v22)
  {
    if (!v19) {
      goto LABEL_47;
    }
  }
  else
  {
    acl_free(acl);
    CFRelease(v21);
    if (!v19) {
      goto LABEL_47;
    }
  }
  return (id)_CFAutoreleasePoolAddObject(0, (uint64_t)v19);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = filesec_dup([(__NSFileSecurity *)self _filesec]);
  if (result)
  {
    id v5 = result;
    int v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    return (id)[v6 initWithFileSec:v5];
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[__NSPlaceholderFileSecurity immutablePlaceholder];
}

- (void)encodeWithCoder:(id)a3
{
  len_p[1] = *(void *)off_1ECE0A5B0;
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw(+[NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"NSFileSecurity cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  id v5 = [(__NSFileSecurity *)self _filesec];
  acl_t acl = 0;
  len_p[0] = 0;
  if (filesec_get_property(v5, FILESEC_ACL, &acl))
  {
    uint64_t Typed = CFAllocatorAllocateTyped(&__kCFAllocatorSystemDefault, 72, 2422924720, 0);
    if (!Typed) {
      return;
    }
    int v7 = (char *)Typed;
    *(void *)(Typed + 64) = 0;
    *(_OWORD *)(Typed + 32) = 0u;
    *(_OWORD *)(Typed + 48) = 0u;
    *(_OWORD *)uint64_t Typed = 0u;
    *(_OWORD *)(Typed + 16) = 0u;
    *(_DWORD *)uint64_t Typed = 0;
    size_t v8 = 72;
    *(unsigned char *)(Typed + 64) = 0;
    goto LABEL_8;
  }
  int v9 = acl_to_text(acl, len_p);
  if (!v9)
  {
LABEL_20:
    acl_free(acl);
    return;
  }
  CFUUIDRef v10 = v9;
  size_t v8 = len_p[0] + 65;
  int v11 = (char *)CFAllocatorAllocateTyped(&__kCFAllocatorSystemDefault, len_p[0] + 65, 1988560932, 0);
  if (!v11)
  {
    free(v10);
    goto LABEL_20;
  }
  int v7 = v11;
  bzero(v11, v8);
  *(_DWORD *)int v7 = 0;
  strlcpy(v7 + 64, v10, len_p[0] + 1);
  *(_DWORD *)v7 |= 0x20u;
  free(v10);
  acl_free(acl);
LABEL_8:
  uint64_t v13 = 0;
  unsigned __int16 v12 = 0;
  if (!filesec_get_property(v5, FILESEC_OWNER, (char *)&v13 + 4))
  {
    *((void *)v7 + 1) = HIDWORD(v13);
    *(_DWORD *)v7 |= 1u;
  }
  if (!filesec_get_property(v5, FILESEC_GROUP, &v13))
  {
    *((void *)v7 + 2) = v13;
    *(_DWORD *)v7 |= 2u;
  }
  if (!filesec_get_property(v5, FILESEC_MODE, &v12))
  {
    *((void *)v7 + 3) = v12;
    *(_DWORD *)v7 |= 0x10u;
  }
  if (!filesec_get_property(v5, FILESEC_UUID, v7 + 32)) {
    *(_DWORD *)v7 |= 4u;
  }
  if (!filesec_get_property(v5, FILESEC_GRPUUID, v7 + 48)) {
    *(_DWORD *)v7 |= 8u;
  }
  [a3 encodeBytes:v7 length:v8 forKey:@"NS.filesec"];
  CFAllocatorDeallocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7);
}

- (__NSFileSecurity)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end