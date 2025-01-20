@interface NWPBCommandMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBCommandMessage

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_command;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_messageData hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_command != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](messageData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_command;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_messageData copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int)*MEMORY[0x1E4F940E8];
  unint64_t v6 = *(void *)((char *)a3 + v5);
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v8 = *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]);
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      v14 = (char *)a3 + *v9;
      if (*v14) {
        goto LABEL_85;
      }
      if (v6 >= v8) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0) {
        goto LABEL_39;
      }
      uint64_t v17 = *v4;
      unint64_t v18 = *(void *)((char *)a3 + v17);
      if (v18 == -1 || v18 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + *v11) + v18);
      *(void *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v21 = *v4;
      unint64_t v22 = *(void *)((char *)a3 + v21);
      if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v23 = v22 + 1;
      int v24 = *(char *)(*(void *)((char *)a3 + *v11) + v22);
      *(void *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v11) + v26);
      *(void *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v29 = *v4;
      unint64_t v30 = *(void *)((char *)a3 + v29);
      if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + *v11) + v30);
      *(void *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v33 = *v4;
      unint64_t v34 = *(void *)((char *)a3 + v33);
      if (v34 == -1 || v34 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v35 = v34 + 1;
      int v36 = *(char *)(*(void *)((char *)a3 + *v11) + v34);
      *(void *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v37 = *v4;
      unint64_t v38 = *(void *)((char *)a3 + v37);
      if (v38 == -1 || v38 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + *v11) + v38);
      *(void *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v41 = *v4;
      unint64_t v42 = *(void *)((char *)a3 + v41);
      if (v42 == -1 || v42 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v43 = v42 + 1;
      int v44 = *(char *)(*(void *)((char *)a3 + *v11) + v42);
      *(void *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v45 = *v4;
      unint64_t v46 = *(void *)((char *)a3 + v45);
      if (v46 == -1 || v46 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_37;
      }
      unint64_t v47 = v46 + 1;
      int v48 = *(char *)(*(void *)((char *)a3 + *v11) + v46);
      *(void *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v49 = *v4;
      unint64_t v50 = *(void *)((char *)a3 + v49);
      if (v50 == -1 || v50 >= *(void *)((char *)a3 + *v7))
      {
LABEL_37:
        v14 = (char *)a3 + *v9;
        goto LABEL_38;
      }
      unint64_t v51 = v50 + 1;
      int v52 = *(char *)(*(void *)((char *)a3 + *v11) + v50);
      *(void *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        unint64_t v16 = 0;
        int v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_41;
      }
LABEL_39:
      int v53 = *((unsigned __int8 *)a3 + *v9);
      if (*((unsigned char *)a3 + *v9)) {
        unint64_t v16 = 0;
      }
LABEL_41:
      if (v53) {
        BOOL v54 = 1;
      }
      else {
        BOOL v54 = (v16 & 7) == 4;
      }
      if (v54) {
        goto LABEL_85;
      }
      if ((v16 >> 3) == 2)
      {
        PBReaderReadData();
        v12 = (NSData *)objc_claimAutoreleasedReturnValue();
        messageData = self->_messageData;
        self->_messageData = v12;
      }
      else
      {
        if ((v16 >> 3) == 1)
        {
          *(unsigned char *)&self->_has |= 1u;
          uint64_t v55 = *v4;
          unint64_t v56 = *(void *)((char *)a3 + v55);
          if (v56 == -1 || v56 >= *(void *)((char *)a3 + *v7))
          {
            int v59 = 0;
          }
          else
          {
            unint64_t v57 = v56 + 1;
            char v58 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v56);
            *(void *)((char *)a3 + v55) = v57;
            int v59 = v58 & 0x7F;
            if ((v58 & 0x80) == 0) {
              goto LABEL_82;
            }
            uint64_t v60 = *v4;
            unint64_t v61 = *(void *)((char *)a3 + v60);
            if (v61 != -1 && v61 < *(void *)((char *)a3 + *v7))
            {
              int v62 = *(char *)(*(void *)((char *)a3 + *v11) + v61);
              *(void *)((char *)a3 + v60) = v61 + 1;
              int v59 = v59 & 0xFFFFC07F | ((v62 & 0x7F) << 7);
              if ((v62 & 0x80000000) == 0) {
                goto LABEL_82;
              }
              uint64_t v63 = *v4;
              unint64_t v64 = *(void *)((char *)a3 + v63);
              if (v64 != -1 && v64 < *(void *)((char *)a3 + *v7))
              {
                int v65 = *(char *)(*(void *)((char *)a3 + *v11) + v64);
                *(void *)((char *)a3 + v63) = v64 + 1;
                int v59 = v59 & 0xFFE03FFF | ((v65 & 0x7F) << 14);
                if ((v65 & 0x80000000) == 0) {
                  goto LABEL_82;
                }
                uint64_t v66 = *v4;
                unint64_t v67 = *(void *)((char *)a3 + v66);
                if (v67 != -1 && v67 < *(void *)((char *)a3 + *v7))
                {
                  int v68 = *(char *)(*(void *)((char *)a3 + *v11) + v67);
                  *(void *)((char *)a3 + v66) = v67 + 1;
                  int v59 = v59 & 0xF01FFFFF | ((v68 & 0x7F) << 21);
                  if ((v68 & 0x80000000) == 0) {
                    goto LABEL_82;
                  }
                  uint64_t v69 = *v4;
                  unint64_t v70 = *(void *)((char *)a3 + v69);
                  if (v70 != -1 && v70 < *(void *)((char *)a3 + *v7))
                  {
                    unint64_t v71 = v70 + 1;
                    int v72 = *(char *)(*(void *)((char *)a3 + *v11) + v70);
                    *(void *)((char *)a3 + v69) = v71;
                    v59 |= v72 << 28;
                    if ((v72 & 0x80000000) == 0) {
                      goto LABEL_82;
                    }
                    uint64_t v73 = *v4;
                    unint64_t v74 = *(void *)((char *)a3 + v73);
                    if (v74 != -1 && v74 < *(void *)((char *)a3 + *v7))
                    {
                      unint64_t v75 = v74 + 1;
                      int v76 = *(char *)(*(void *)((char *)a3 + *v11) + v74);
                      *(void *)((char *)a3 + v73) = v75;
                      if ((v76 & 0x80000000) == 0) {
                        goto LABEL_82;
                      }
                      uint64_t v77 = *v4;
                      unint64_t v78 = *(void *)((char *)a3 + v77);
                      if (v78 != -1 && v78 < *(void *)((char *)a3 + *v7))
                      {
                        unint64_t v79 = v78 + 1;
                        int v80 = *(char *)(*(void *)((char *)a3 + *v11) + v78);
                        *(void *)((char *)a3 + v77) = v79;
                        if ((v80 & 0x80000000) == 0) {
                          goto LABEL_82;
                        }
                        uint64_t v81 = *v4;
                        unint64_t v82 = *(void *)((char *)a3 + v81);
                        if (v82 != -1 && v82 < *(void *)((char *)a3 + *v7))
                        {
                          unint64_t v83 = v82 + 1;
                          int v84 = *(char *)(*(void *)((char *)a3 + *v11) + v82);
                          *(void *)((char *)a3 + v81) = v83;
                          if ((v84 & 0x80000000) == 0) {
                            goto LABEL_82;
                          }
                          uint64_t v85 = *v4;
                          unint64_t v86 = *(void *)((char *)a3 + v85);
                          if (v86 != -1 && v86 < *(void *)((char *)a3 + *v7))
                          {
                            unint64_t v87 = v86 + 1;
                            int v88 = *(char *)(*(void *)((char *)a3 + *v11) + v86);
                            *(void *)((char *)a3 + v85) = v87;
                            if ((v88 & 0x80000000) == 0) {
                              goto LABEL_82;
                            }
                            uint64_t v89 = *v4;
                            unint64_t v90 = *(void *)((char *)a3 + v89);
                            if (v90 != -1 && v90 < *(void *)((char *)a3 + *v7))
                            {
                              unint64_t v91 = v90 + 1;
                              int v92 = *(char *)(*(void *)((char *)a3 + *v11) + v90);
                              *(void *)((char *)a3 + v89) = v91;
                              if (v92 < 0)
                              {
                                int v59 = 0;
LABEL_84:
                                self->_command = v59;
                                goto LABEL_4;
                              }
LABEL_82:
                              if (*((unsigned char *)a3 + *v9)) {
                                int v59 = 0;
                              }
                              goto LABEL_84;
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
          goto LABEL_82;
        }
        int v93 = PBReaderSkipValueWithTag();
        if (!v93) {
          return v93;
        }
      }
LABEL_4:
      uint64_t v5 = *v4;
      unint64_t v6 = *(void *)((char *)a3 + v5);
      unint64_t v8 = *(void *)((char *)a3 + *v7);
      if (v6 >= v8) {
        goto LABEL_85;
      }
    }
    unint64_t v16 = 0;
LABEL_38:
    unsigned char *v14 = 1;
    goto LABEL_39;
  }
LABEL_85:
  LOBYTE(v93) = *((unsigned char *)a3 + *v9) == 0;
  return v93;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t command = self->_command;
    if (command >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_command);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v5 = off_1E52440B0[command];
    }
    [v3 setObject:v5 forKey:@"command"];
  }
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBCommandMessage;
  id v4 = [(NWPBCommandMessage *)&v8 description];
  uint64_t v5 = [(NWPBCommandMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end