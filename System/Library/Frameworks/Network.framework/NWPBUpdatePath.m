@interface NWPBUpdatePath
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBUpdatePath

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NWPBPath *)self->_responsePath hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    responsePath = self->_responsePath;
    if ((unint64_t)responsePath | v4[1]) {
      char v6 = -[NWPBPath isEqual:](responsePath, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBPath *)self->_responsePath copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)writeTo:(id)a3
{
  if (self->_responsePath) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int)*MEMORY[0x1E4F940E8];
  unint64_t v6 = *(void *)((char *)a3 + v5);
  v7 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v8 = *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]);
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      v13 = (char *)a3 + *v9;
      if (*v13) {
        goto LABEL_49;
      }
      if (v6 >= v8) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v15 = v14 & 0x7F;
      if ((v14 & 0x80) == 0) {
        goto LABEL_39;
      }
      uint64_t v16 = *v4;
      unint64_t v17 = *(void *)((char *)a3 + v16);
      if (v17 == -1 || v17 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v18 = v17 + 1;
      int v19 = *(char *)(*(void *)((char *)a3 + *v11) + v17);
      *(void *)((char *)a3 + v16) = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << 7;
      if ((v19 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v20 = *v4;
      unint64_t v21 = *(void *)((char *)a3 + v20);
      if (v21 == -1 || v21 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v22 = v21 + 1;
      int v23 = *(char *)(*(void *)((char *)a3 + *v11) + v21);
      *(void *)((char *)a3 + v20) = v22;
      v15 |= (unint64_t)(v23 & 0x7F) << 14;
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v24 = *v4;
      unint64_t v25 = *(void *)((char *)a3 + v24);
      if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v26 = v25 + 1;
      int v27 = *(char *)(*(void *)((char *)a3 + *v11) + v25);
      *(void *)((char *)a3 + v24) = v26;
      v15 |= (unint64_t)(v27 & 0x7F) << 21;
      if ((v27 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v28 = *v4;
      unint64_t v29 = *(void *)((char *)a3 + v28);
      if (v29 == -1 || v29 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v30 = v29 + 1;
      int v31 = *(char *)(*(void *)((char *)a3 + *v11) + v29);
      *(void *)((char *)a3 + v28) = v30;
      v15 |= (unint64_t)(v31 & 0x7F) << 28;
      if ((v31 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v32 = *v4;
      unint64_t v33 = *(void *)((char *)a3 + v32);
      if (v33 == -1 || v33 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v34 = v33 + 1;
      int v35 = *(char *)(*(void *)((char *)a3 + *v11) + v33);
      *(void *)((char *)a3 + v32) = v34;
      if ((v35 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v36 = *v4;
      unint64_t v37 = *(void *)((char *)a3 + v36);
      if (v37 == -1 || v37 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v38 = v37 + 1;
      int v39 = *(char *)(*(void *)((char *)a3 + *v11) + v37);
      *(void *)((char *)a3 + v36) = v38;
      if ((v39 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v40 = *v4;
      unint64_t v41 = *(void *)((char *)a3 + v40);
      if (v41 == -1 || v41 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v42 = v41 + 1;
      int v43 = *(char *)(*(void *)((char *)a3 + *v11) + v41);
      *(void *)((char *)a3 + v40) = v42;
      if ((v43 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v44 = *v4;
      unint64_t v45 = *(void *)((char *)a3 + v44);
      if (v45 == -1 || v45 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v46 = v45 + 1;
      int v47 = *(char *)(*(void *)((char *)a3 + *v11) + v45);
      *(void *)((char *)a3 + v44) = v46;
      if ((v47 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v48 = *v4;
      unint64_t v49 = *(void *)((char *)a3 + v48);
      if (v49 == -1 || v49 >= *(void *)((char *)a3 + *v7))
      {
LABEL_37:
        v13 = (char *)a3 + *v9;
        goto LABEL_38;
      }
      unint64_t v50 = v49 + 1;
      int v51 = *(char *)(*(void *)((char *)a3 + *v11) + v49);
      *(void *)((char *)a3 + v48) = v50;
      if (v51 < 0)
      {
        unint64_t v15 = 0;
        int v52 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_41;
      }
LABEL_39:
      int v52 = *((unsigned __int8 *)a3 + *v9);
      if (*((unsigned char *)a3 + *v9)) {
        unint64_t v15 = 0;
      }
LABEL_41:
      if (v52) {
        BOOL v53 = 1;
      }
      else {
        BOOL v53 = (v15 & 7) == 4;
      }
      if (v53) {
        goto LABEL_49;
      }
      if ((v15 >> 3) == 1)
      {
        v54 = objc_alloc_init(NWPBPath);
        objc_storeStrong((id *)&self->_responsePath, v54);
        if (!PBReaderPlaceMark() || (NWPBPathReadFrom((uint64_t)v54, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v12) = 0;
          return v12;
        }
        PBReaderRecallMark();
      }
      else
      {
        int v12 = PBReaderSkipValueWithTag();
        if (!v12) {
          return v12;
        }
      }
      uint64_t v5 = *v4;
      unint64_t v6 = *(void *)((char *)a3 + v5);
      unint64_t v8 = *(void *)((char *)a3 + *v7);
      if (v6 >= v8) {
        goto LABEL_49;
      }
    }
    unint64_t v15 = 0;
LABEL_38:
    unsigned char *v13 = 1;
    goto LABEL_39;
  }
LABEL_49:
  LOBYTE(v12) = *((unsigned char *)a3 + *v9) == 0;
  return v12;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  responsePath = self->_responsePath;
  if (responsePath)
  {
    uint64_t v5 = [(NWPBPath *)responsePath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"responsePath"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBUpdatePath;
  v4 = [(NWPBUpdatePath *)&v8 description];
  uint64_t v5 = [(NWPBUpdatePath *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end