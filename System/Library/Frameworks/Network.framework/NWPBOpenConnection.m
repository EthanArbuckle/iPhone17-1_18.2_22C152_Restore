@interface NWPBOpenConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBOpenConnection

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
      v14 = (char *)a3 + *v9;
      if (*v14) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
      if (v6 >= v8) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0) {
        goto LABEL_40;
      }
      uint64_t v17 = *v4;
      unint64_t v18 = *(void *)((char *)a3 + v17);
      if (v18 == -1 || v18 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + *v11) + v18);
      *(void *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v21 = *v4;
      unint64_t v22 = *(void *)((char *)a3 + v21);
      if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v23 = v22 + 1;
      int v24 = *(char *)(*(void *)((char *)a3 + *v11) + v22);
      *(void *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v11) + v26);
      *(void *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v29 = *v4;
      unint64_t v30 = *(void *)((char *)a3 + v29);
      if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + *v11) + v30);
      *(void *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v33 = *v4;
      unint64_t v34 = *(void *)((char *)a3 + v33);
      if (v34 == -1 || v34 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v35 = v34 + 1;
      int v36 = *(char *)(*(void *)((char *)a3 + *v11) + v34);
      *(void *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v37 = *v4;
      unint64_t v38 = *(void *)((char *)a3 + v37);
      if (v38 == -1 || v38 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + *v11) + v38);
      *(void *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v41 = *v4;
      unint64_t v42 = *(void *)((char *)a3 + v41);
      if (v42 == -1 || v42 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v43 = v42 + 1;
      int v44 = *(char *)(*(void *)((char *)a3 + *v11) + v42);
      *(void *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v45 = *v4;
      unint64_t v46 = *(void *)((char *)a3 + v45);
      if (v46 == -1 || v46 >= *(void *)((char *)a3 + *v7)) {
        goto LABEL_38;
      }
      unint64_t v47 = v46 + 1;
      int v48 = *(char *)(*(void *)((char *)a3 + *v11) + v46);
      *(void *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v49 = *v4;
      unint64_t v50 = *(void *)((char *)a3 + v49);
      if (v50 == -1 || v50 >= *(void *)((char *)a3 + *v7))
      {
LABEL_38:
        v14 = (char *)a3 + *v9;
        goto LABEL_39;
      }
      unint64_t v51 = v50 + 1;
      int v52 = *(char *)(*(void *)((char *)a3 + *v11) + v50);
      *(void *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        unint64_t v16 = 0;
        int v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }
LABEL_40:
      int v53 = *((unsigned __int8 *)a3 + *v9);
      if (*((unsigned char *)a3 + *v9)) {
        unint64_t v16 = 0;
      }
LABEL_42:
      if (v53) {
        BOOL v54 = 1;
      }
      else {
        BOOL v54 = (v16 & 7) == 4;
      }
      if (v54) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
      unint64_t v55 = v16 >> 3;
      if ((v16 >> 3) == 3)
      {
        PBReaderReadString();
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        clientUUID = (NWPBParameters *)self->_clientUUID;
        self->_clientUUID = v12;
LABEL_4:

        goto LABEL_5;
      }
      if (v55 == 2)
      {
        clientUUID = objc_alloc_init(NWPBParameters);
        objc_storeStrong((id *)&self->_parameters, clientUUID);
        if (!PBReaderPlaceMark() || (NWPBParametersReadFrom((uint64_t)clientUUID, (uint64_t)a3) & 1) == 0)
        {
LABEL_59:

          return 0;
        }
        goto LABEL_54;
      }
      if (v55 == 1)
      {
        clientUUID = objc_alloc_init(NWPBEndpoint);
        objc_storeStrong((id *)&self->_endpoint, clientUUID);
        if (!PBReaderPlaceMark() || !NWPBEndpointReadFrom((uint64_t)clientUUID, (uint64_t)a3)) {
          goto LABEL_59;
        }
LABEL_54:
        PBReaderRecallMark();
        goto LABEL_4;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_5:
      uint64_t v5 = *v4;
      unint64_t v6 = *(void *)((char *)a3 + v5);
      unint64_t v8 = *(void *)((char *)a3 + *v7);
      if (v6 >= v8) {
        return *((unsigned char *)a3 + *v9) == 0;
      }
    }
    unint64_t v16 = 0;
LABEL_39:
    unsigned char *v14 = 1;
    goto LABEL_40;
  }
  return *((unsigned char *)a3 + *v9) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_clientUUID, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(NWPBEndpoint *)self->_endpoint hash];
  unint64_t v4 = [(NWPBParameters *)self->_parameters hash] ^ v3;
  return v4 ^ [(NSString *)self->_clientUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((endpoint = self->_endpoint, !((unint64_t)endpoint | v4[2]))
     || -[NWPBEndpoint isEqual:](endpoint, "isEqual:"))
    && ((parameters = self->_parameters, !((unint64_t)parameters | v4[3]))
     || -[NWPBParameters isEqual:](parameters, "isEqual:")))
  {
    clientUUID = self->_clientUUID;
    if ((unint64_t)clientUUID | v4[1]) {
      char v8 = -[NSString isEqual:](clientUUID, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBEndpoint *)self->_endpoint copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NWPBParameters *)self->_parameters copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_clientUUID copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_endpoint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_parameters)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_clientUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  endpoint = self->_endpoint;
  if (endpoint)
  {
    id v5 = [(NWPBEndpoint *)endpoint dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"endpoint"];
  }
  parameters = self->_parameters;
  if (parameters)
  {
    v7 = [(NWPBParameters *)parameters dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"parameters"];
  }
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBOpenConnection;
  id v4 = [(NWPBOpenConnection *)&v8 description];
  id v5 = [(NWPBOpenConnection *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end