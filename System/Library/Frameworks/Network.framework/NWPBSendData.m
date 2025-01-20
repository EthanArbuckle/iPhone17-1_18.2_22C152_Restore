@interface NWPBSendData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBSendData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);

  objc_storeStrong((id *)&self->_clientUUID, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientUUID hash];
  uint64_t v4 = [(NSData *)self->_messageData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_receiveWindow;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientUUID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](messageData, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_receiveWindow == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientUUID copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_messageData copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_receiveWindow;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int)*MEMORY[0x1E4F940E8];
  unint64_t v6 = *(void *)((char *)a3 + v5);
  BOOL v7 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v8 = *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]);
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      v15 = (char *)a3 + *v9;
      if (*v15) {
        goto LABEL_88;
      }
      if (v6 >= v8) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v17 = v16 & 0x7F;
      if ((v16 & 0x80) == 0) {
        goto LABEL_40;
      }
      uint64_t v18 = *v4;
      unint64_t v19 = *(void *)((char *)a3 + v18);
      if (v19 == -1 || v19 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v20 = v19 + 1;
      int v21 = *(char *)(*(void *)((char *)a3 + *v11) + v19);
      *(void *)((char *)a3 + v18) = v20;
      v17 |= (unint64_t)(v21 & 0x7F) << 7;
      if ((v21 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v22 = *v4;
      unint64_t v23 = *(void *)((char *)a3 + v22);
      if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v24 = v23 + 1;
      int v25 = *(char *)(*(void *)((char *)a3 + *v11) + v23);
      *(void *)((char *)a3 + v22) = v24;
      v17 |= (unint64_t)(v25 & 0x7F) << 14;
      if ((v25 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v26 = *v4;
      unint64_t v27 = *(void *)((char *)a3 + v26);
      if (v27 == -1 || v27 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v28 = v27 + 1;
      int v29 = *(char *)(*(void *)((char *)a3 + *v11) + v27);
      *(void *)((char *)a3 + v26) = v28;
      v17 |= (unint64_t)(v29 & 0x7F) << 21;
      if ((v29 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v30 = *v4;
      unint64_t v31 = *(void *)((char *)a3 + v30);
      if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v32 = v31 + 1;
      int v33 = *(char *)(*(void *)((char *)a3 + *v11) + v31);
      *(void *)((char *)a3 + v30) = v32;
      v17 |= (unint64_t)(v33 & 0x7F) << 28;
      if ((v33 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v34 = *v4;
      unint64_t v35 = *(void *)((char *)a3 + v34);
      if (v35 == -1 || v35 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v36 = v35 + 1;
      int v37 = *(char *)(*(void *)((char *)a3 + *v11) + v35);
      *(void *)((char *)a3 + v34) = v36;
      if ((v37 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v38 = *v4;
      unint64_t v39 = *(void *)((char *)a3 + v38);
      if (v39 == -1 || v39 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v40 = v39 + 1;
      int v41 = *(char *)(*(void *)((char *)a3 + *v11) + v39);
      *(void *)((char *)a3 + v38) = v40;
      if ((v41 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v42 = *v4;
      unint64_t v43 = *(void *)((char *)a3 + v42);
      if (v43 == -1 || v43 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v44 = v43 + 1;
      int v45 = *(char *)(*(void *)((char *)a3 + *v11) + v43);
      *(void *)((char *)a3 + v42) = v44;
      if ((v45 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v46 = *v4;
      unint64_t v47 = *(void *)((char *)a3 + v46);
      if (v47 == -1 || v47 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v48 = v47 + 1;
      int v49 = *(char *)(*(void *)((char *)a3 + *v11) + v47);
      *(void *)((char *)a3 + v46) = v48;
      if ((v49 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v50 = *v4;
      unint64_t v51 = *(void *)((char *)a3 + v50);
      if (v51 == -1 || v51 >= *(void *)((char *)a3 + *v7))
      {
LABEL_38:
        v15 = (char *)a3 + *v9;
        goto LABEL_39;
      }
      unint64_t v52 = v51 + 1;
      int v53 = *(char *)(*(void *)((char *)a3 + *v11) + v51);
      *(void *)((char *)a3 + v50) = v52;
      if (v53 < 0)
      {
        unint64_t v17 = 0;
        int v54 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }
LABEL_40:
      int v54 = *((unsigned __int8 *)a3 + *v9);
      if (*((unsigned char *)a3 + *v9)) {
        unint64_t v17 = 0;
      }
LABEL_42:
      if (v54) {
        BOOL v55 = 1;
      }
      else {
        BOOL v55 = (v17 & 7) == 4;
      }
      if (v55) {
        goto LABEL_88;
      }
      unint64_t v56 = v17 >> 3;
      if ((v17 >> 3) == 3)
      {
        *(unsigned char *)&self->_has |= 1u;
        uint64_t v57 = *v4;
        unint64_t v58 = *(void *)((char *)a3 + v57);
        if (v58 == -1 || v58 >= *(void *)((char *)a3 + *v7))
        {
          unsigned int v61 = 0;
        }
        else
        {
          unint64_t v59 = v58 + 1;
          char v60 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v58);
          *(void *)((char *)a3 + v57) = v59;
          unsigned int v61 = v60 & 0x7F;
          if ((v60 & 0x80) == 0) {
            goto LABEL_85;
          }
          uint64_t v62 = *v4;
          unint64_t v63 = *(void *)((char *)a3 + v62);
          if (v63 != -1 && v63 < *(void *)((char *)a3 + *v7))
          {
            int v64 = *(char *)(*(void *)((char *)a3 + *v11) + v63);
            *(void *)((char *)a3 + v62) = v63 + 1;
            unsigned int v61 = v61 & 0xFFFFC07F | ((v64 & 0x7F) << 7);
            if ((v64 & 0x80000000) == 0) {
              goto LABEL_85;
            }
            uint64_t v65 = *v4;
            unint64_t v66 = *(void *)((char *)a3 + v65);
            if (v66 != -1 && v66 < *(void *)((char *)a3 + *v7))
            {
              int v67 = *(char *)(*(void *)((char *)a3 + *v11) + v66);
              *(void *)((char *)a3 + v65) = v66 + 1;
              unsigned int v61 = v61 & 0xFFE03FFF | ((v67 & 0x7F) << 14);
              if ((v67 & 0x80000000) == 0) {
                goto LABEL_85;
              }
              uint64_t v68 = *v4;
              unint64_t v69 = *(void *)((char *)a3 + v68);
              if (v69 != -1 && v69 < *(void *)((char *)a3 + *v7))
              {
                int v70 = *(char *)(*(void *)((char *)a3 + *v11) + v69);
                *(void *)((char *)a3 + v68) = v69 + 1;
                unsigned int v61 = v61 & 0xF01FFFFF | ((v70 & 0x7F) << 21);
                if ((v70 & 0x80000000) == 0) {
                  goto LABEL_85;
                }
                uint64_t v71 = *v4;
                unint64_t v72 = *(void *)((char *)a3 + v71);
                if (v72 != -1 && v72 < *(void *)((char *)a3 + *v7))
                {
                  unint64_t v73 = v72 + 1;
                  int v74 = *(char *)(*(void *)((char *)a3 + *v11) + v72);
                  *(void *)((char *)a3 + v71) = v73;
                  v61 |= v74 << 28;
                  if ((v74 & 0x80000000) == 0) {
                    goto LABEL_85;
                  }
                  uint64_t v75 = *v4;
                  unint64_t v76 = *(void *)((char *)a3 + v75);
                  if (v76 != -1 && v76 < *(void *)((char *)a3 + *v7))
                  {
                    unint64_t v77 = v76 + 1;
                    int v78 = *(char *)(*(void *)((char *)a3 + *v11) + v76);
                    *(void *)((char *)a3 + v75) = v77;
                    if ((v78 & 0x80000000) == 0) {
                      goto LABEL_85;
                    }
                    uint64_t v79 = *v4;
                    unint64_t v80 = *(void *)((char *)a3 + v79);
                    if (v80 != -1 && v80 < *(void *)((char *)a3 + *v7))
                    {
                      unint64_t v81 = v80 + 1;
                      int v82 = *(char *)(*(void *)((char *)a3 + *v11) + v80);
                      *(void *)((char *)a3 + v79) = v81;
                      if ((v82 & 0x80000000) == 0) {
                        goto LABEL_85;
                      }
                      uint64_t v83 = *v4;
                      unint64_t v84 = *(void *)((char *)a3 + v83);
                      if (v84 != -1 && v84 < *(void *)((char *)a3 + *v7))
                      {
                        unint64_t v85 = v84 + 1;
                        int v86 = *(char *)(*(void *)((char *)a3 + *v11) + v84);
                        *(void *)((char *)a3 + v83) = v85;
                        if ((v86 & 0x80000000) == 0) {
                          goto LABEL_85;
                        }
                        uint64_t v87 = *v4;
                        unint64_t v88 = *(void *)((char *)a3 + v87);
                        if (v88 != -1 && v88 < *(void *)((char *)a3 + *v7))
                        {
                          unint64_t v89 = v88 + 1;
                          int v90 = *(char *)(*(void *)((char *)a3 + *v11) + v88);
                          *(void *)((char *)a3 + v87) = v89;
                          if ((v90 & 0x80000000) == 0) {
                            goto LABEL_85;
                          }
                          uint64_t v91 = *v4;
                          unint64_t v92 = *(void *)((char *)a3 + v91);
                          if (v92 != -1 && v92 < *(void *)((char *)a3 + *v7))
                          {
                            unint64_t v93 = v92 + 1;
                            int v94 = *(char *)(*(void *)((char *)a3 + *v11) + v92);
                            *(void *)((char *)a3 + v91) = v93;
                            if (v94 < 0)
                            {
                              unsigned int v61 = 0;
LABEL_87:
                              self->_receiveWindow = v61;
                              goto LABEL_5;
                            }
LABEL_85:
                            if (*((unsigned char *)a3 + *v9)) {
                              unsigned int v61 = 0;
                            }
                            goto LABEL_87;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        *((unsigned char *)a3 + *v9) = 1;
        goto LABEL_85;
      }
      if (v56 == 2)
      {
        PBReaderReadData();
        v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = 16;
LABEL_4:
        v14 = *(Class *)((char *)&self->super.super.isa + v13);
        *(Class *)((char *)&self->super.super.isa + v13) = v12;

        goto LABEL_5;
      }
      if (v56 == 1)
      {
        PBReaderReadString();
        v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = 8;
        goto LABEL_4;
      }
      int v95 = PBReaderSkipValueWithTag();
      if (!v95) {
        return v95;
      }
LABEL_5:
      uint64_t v5 = *v4;
      unint64_t v6 = *(void *)((char *)a3 + v5);
      unint64_t v8 = *(void *)((char *)a3 + *v7);
      if (v6 >= v8) {
        goto LABEL_88;
      }
    }
    unint64_t v17 = 0;
LABEL_39:
    unsigned char *v15 = 1;
    goto LABEL_40;
  }
LABEL_88:
  LOBYTE(v95) = *((unsigned char *)a3 + *v9) == 0;
  return v95;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  messageData = self->_messageData;
  if (messageData) {
    [v4 setObject:messageData forKey:@"messageData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v7 = [NSNumber numberWithUnsignedInt:self->_receiveWindow];
    [v4 setObject:v7 forKey:@"receiveWindow"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBSendData;
  id v4 = [(NWPBSendData *)&v8 description];
  uint64_t v5 = [(NWPBSendData *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end