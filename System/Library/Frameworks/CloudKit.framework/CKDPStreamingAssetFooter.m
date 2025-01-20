@interface CKDPStreamingAssetFooter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)md5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMd5:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPStreamingAssetFooter

- (id)statusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v5 = @"TERMINATED_BY_UPLOADER";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"COMPLETED";
  }
  return v5;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"COMPLETED", v5)) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v6, @"TERMINATED_BY_UPLOADER", v7);
  }

  return isEqualToString;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPStreamingAssetFooter;
  uint64_t v4 = [(CKDPStreamingAssetFooter *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int status = self->_status;
  if (status)
  {
    if (status == 1)
    {
      v9 = @"TERMINATED_BY_UPLOADER";
      objc_msgSend_setObject_forKey_(v7, v5, @"TERMINATED_BY_UPLOADER", @"status");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v6, self->_status);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v7, v10, (uint64_t)v9, @"status");
    }
  }
  else
  {
    v9 = @"COMPLETED";
    objc_msgSend_setObject_forKey_(v7, v5, @"COMPLETED", @"status");
  }

  md5 = self->_md5;
  if (md5) {
    objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)md5, @"md5");
  }

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  uint64_t v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      if ((v11 >> 3) == 2)
      {
        PBReaderReadData();
        v24 = (NSData *)objc_claimAutoreleasedReturnValue();
        md5 = self->_md5;
        self->_md5 = v24;
      }
      else if ((v11 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v4;
          unint64_t v22 = *(void *)((char *)a3 + v21);
          if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
          *(void *)((char *)a3 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_33;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_31:
        if (*((unsigned char *)a3 + *v6)) {
          LODWORD(v20) = 0;
        }
LABEL_33:
        self->_int status = v20;
      }
      else
      {
        int v26 = PBReaderSkipValueWithTag();
        if (!v26) {
          return v26;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_md5) {
    __assert_rtn("-[CKDPStreamingAssetFooter writeTo:]", "CKDPStreamingAssetFooter.m", 91, "nil != self->_md5");
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_status;
  objc_msgSend_setMd5_(a3, a2, (uint64_t)self->_md5, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_status;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_md5, v13, (uint64_t)a3, v14);
  int v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_status == *((_DWORD *)v4 + 4))
  {
    md5 = self->_md5;
    uint64_t v11 = v4[1];
    if ((unint64_t)md5 | v11) {
      char isEqual = objc_msgSend_isEqual_(md5, v8, v11, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = 2654435761 * self->_status;
  return objc_msgSend_hash(self->_md5, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  self->_int status = *((_DWORD *)a3 + 4);
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    objc_msgSend_setMd5_(self, a2, v4, v3);
  }
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_int status = a3;
}

- (NSData)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
}

- (void).cxx_destruct
{
}

@end