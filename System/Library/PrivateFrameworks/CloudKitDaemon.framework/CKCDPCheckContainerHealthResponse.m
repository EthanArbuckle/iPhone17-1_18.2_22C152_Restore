@interface CKCDPCheckContainerHealthResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation CKCDPCheckContainerHealthResponse

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCheckContainerHealthResponse;
  v4 = [(CKCDPCheckContainerHealthResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
      return v8 == 0;
    }
    if (*((unsigned char *)a3 + *v6))
    {
      int v8 = 1;
      return v8 == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        LOBYTE(v11) = 0;
        int v8 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      LOBYTE(v11) = 0;
    }
LABEL_14:
    if (v8) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = (v11 & 7) == 4;
    }
    if (v16) {
      return v8 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  char isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end