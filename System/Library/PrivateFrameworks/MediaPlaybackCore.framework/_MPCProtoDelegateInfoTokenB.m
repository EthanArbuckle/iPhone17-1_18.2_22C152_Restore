@interface _MPCProtoDelegateInfoTokenB
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)hardwareInfoData;
- (uint64_t)machineIDData;
- (uint64_t)picData;
- (uint64_t)sessionID;
- (uint64_t)setSessionID:(uint64_t)result;
- (uint64_t)userAgent;
- (unint64_t)hash;
- (void)setHardwareInfoData:(uint64_t)a1;
- (void)setMachineIDData:(uint64_t)a1;
- (void)setPicData:(uint64_t)a1;
- (void)setUserAgent:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoDelegateInfoTokenB

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_picData, 0);
  objc_storeStrong((id *)&self->_machineIDData, 0);

  objc_storeStrong((id *)&self->_hardwareInfoData, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_picData hash];
  uint64_t v4 = [(NSData *)self->_machineIDData hash];
  uint64_t v5 = [(NSData *)self->_hardwareInfoData hash];
  NSUInteger v6 = [(NSString *)self->_userAgent hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_sessionID;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  picData = self->_picData;
  if ((unint64_t)picData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](picData, "isEqual:")) {
      goto LABEL_14;
    }
  }
  machineIDData = self->_machineIDData;
  if ((unint64_t)machineIDData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](machineIDData, "isEqual:")) {
      goto LABEL_14;
    }
  }
  hardwareInfoData = self->_hardwareInfoData;
  if ((unint64_t)hardwareInfoData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](hardwareInfoData, "isEqual:")) {
      goto LABEL_14;
    }
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_sessionID == *((void *)v4 + 1))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_picData copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_machineIDData copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_hardwareInfoData copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_userAgent copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_sessionID;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_picData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_machineIDData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_hardwareInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  uint64_t v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v8 = (int *)MEMORY[0x263F62268];
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
      switch((v11 >> 3))
      {
        case 0u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 32;
          goto LABEL_25;
        case 1u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 24;
          goto LABEL_25;
        case 2u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 16;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 40;
LABEL_25:
          v21 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          unint64_t v24 = 0;
          *(unsigned char *)&self->_has |= 1u;
          break;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v4;
        unint64_t v26 = *(void *)((char *)a3 + v25);
        if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v26);
        *(void *)((char *)a3 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0) {
          goto LABEL_34;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          unint64_t v24 = 0;
          goto LABEL_36;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_34:
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v24 = 0;
      }
LABEL_36:
      self->_sessionID = v24;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  picData = self->_picData;
  if (picData) {
    [v3 setObject:picData forKey:@"picData"];
  }
  machineIDData = self->_machineIDData;
  if (machineIDData) {
    [v4 setObject:machineIDData forKey:@"machineIDData"];
  }
  hardwareInfoData = self->_hardwareInfoData;
  if (hardwareInfoData) {
    [v4 setObject:hardwareInfoData forKey:@"hardwareInfoData"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v4 setObject:userAgent forKey:@"userAgent"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v9 = [NSNumber numberWithUnsignedLongLong:self->_sessionID];
    [v4 setObject:v9 forKey:@"sessionID"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenB;
  id v4 = [(_MPCProtoDelegateInfoTokenB *)&v8 description];
  id v5 = [(_MPCProtoDelegateInfoTokenB *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (uint64_t)setSessionID:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 48) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (void)setPicData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setMachineIDData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setHardwareInfoData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setUserAgent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (uint64_t)picData
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)machineIDData
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)hardwareInfoData
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)userAgent
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)sessionID
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

@end