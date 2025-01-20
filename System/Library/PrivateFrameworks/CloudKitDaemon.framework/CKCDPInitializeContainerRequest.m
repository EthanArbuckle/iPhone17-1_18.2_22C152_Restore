@interface CKCDPInitializeContainerRequest
- (BOOL)hasContainerName;
- (BOOL)hasEnvironment;
- (BOOL)hasPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)containerName;
- (NSString)environment;
- (NSString)path;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPInitializeContainerRequest

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPInitializeContainerRequest;
  v4 = [(CKCDPInitializeContainerRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  containerName = self->_containerName;
  if (containerName) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, @"containerName");
  }
  path = self->_path;
  if (path) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)path, @"path");
  }
  environment = self->_environment;
  if (environment) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)environment, @"environment");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
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
        if (v10++ >= 9)
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
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 24;
        goto LABEL_24;
      }
      if (v18 == 1)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = 8;
LABEL_24:
        v21 = *(Class *)((char *)&self->super.super.super.isa + v20);
        *(Class *)((char *)&self->super.super.super.isa + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    PBReaderReadString();
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 16;
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_environment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 86;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  containerName = self->_containerName;
  id v9 = v4;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v4, v5, (uint64_t)containerName);
    id v4 = v9;
  }
  path = self->_path;
  if (path)
  {
    objc_msgSend_setPath_(v9, v5, (uint64_t)path);
    id v4 = v9;
  }
  environment = self->_environment;
  if (environment)
  {
    objc_msgSend_setEnvironment_(v9, v5, (uint64_t)environment);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unsigned int v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  unint64_t v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_path, v14, (uint64_t)a3);
  int v16 = (void *)v10[3];
  v10[3] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_environment, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((containerName = self->_containerName, uint64_t v9 = v4[1], !((unint64_t)containerName | v9))
     || objc_msgSend_isEqual_(containerName, v7, v9))
    && ((path = self->_path, uint64_t v11 = v4[3], !((unint64_t)path | v11))
     || objc_msgSend_isEqual_(path, v7, v11)))
  {
    environment = self->_environment;
    uint64_t v13 = v4[2];
    if ((unint64_t)environment | v13) {
      char isEqual = objc_msgSend_isEqual_(environment, v7, v13);
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
  uint64_t v4 = objc_msgSend_hash(self->_containerName, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_path, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_environment, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  v8 = a3;
  uint64_t v5 = v8[1];
  if (v5) {
    objc_msgSend_setContainerName_(self, v4, v5);
  }
  uint64_t v6 = v8[3];
  if (v6) {
    objc_msgSend_setPath_(self, v4, v6);
  }
  uint64_t v7 = v8[2];
  if (v7) {
    objc_msgSend_setEnvironment_(self, v4, v7);
  }
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end