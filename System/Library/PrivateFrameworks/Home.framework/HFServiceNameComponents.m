@interface HFServiceNameComponents
- (BOOL)isEqual:(id)a3;
- (BOOL)roomNameAtEndSeparatedByWhitespace;
- (HFServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4;
- (NSString)composedString;
- (NSString)rawRoomName;
- (NSString)rawServiceName;
- (NSString)roomName;
- (NSString)serviceName;
- (unint64_t)hash;
- (void)setRawRoomName:(id)a3;
- (void)setRawServiceName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3;
- (void)setServiceName:(id)a3;
@end

@implementation HFServiceNameComponents

- (NSString)composedString
{
  v3 = [(HFServiceNameComponents *)self serviceName];
  v4 = [(HFServiceNameComponents *)self serviceName];
  if ([v4 length])
  {
    v5 = [(HFServiceNameComponents *)self roomName];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      if ([(HFServiceNameComponents *)self roomNameAtEndSeparatedByWhitespace])
      {
        uint64_t v7 = [(HFServiceNameComponents *)self serviceName];
        [(HFServiceNameComponents *)self roomName];
      }
      else
      {
        uint64_t v7 = [(HFServiceNameComponents *)self roomName];
        [(HFServiceNameComponents *)self serviceName];
      v18 = };
      uint64_t v10 = HFLocalizedStringWithFormat(@"HFServiceNameFormat", @"%1$@ %2$@", v11, v12, v13, v14, v15, v16, v7);

      v3 = (void *)v7;
      goto LABEL_10;
    }
  }
  else
  {
  }
  v8 = [(HFServiceNameComponents *)self roomName];
  uint64_t v9 = [v8 length];

  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = [(HFServiceNameComponents *)self roomName];
LABEL_10:

  v3 = (void *)v10;
LABEL_11:
  return (NSString *)v3;
}

- (HFServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HFServiceNameComponents;
  v8 = [(HFServiceNameComponents *)&v42 init];
  if (v8)
  {
    uint64_t v9 = (void *)[v6 copy];
    [(HFServiceNameComponents *)v8 setRawServiceName:v9];

    uint64_t v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v11 = [v6 stringByTrimmingCharactersInSet:v10];
    [(HFServiceNameComponents *)v8 setServiceName:v11];

    uint64_t v12 = (void *)[v7 copy];
    [(HFServiceNameComponents *)v8 setRawRoomName:v12];

    uint64_t v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v14 = [v7 stringByTrimmingCharactersInSet:v13];
    [(HFServiceNameComponents *)v8 setRoomName:v14];

    uint64_t v15 = [(HFServiceNameComponents *)v8 serviceName];
    if (![v15 length])
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v16 = [(HFServiceNameComponents *)v8 roomName];
    if (![v16 length])
    {
LABEL_17:

      goto LABEL_18;
    }
    v17 = [(HFServiceNameComponents *)v8 serviceName];
    v18 = [(HFServiceNameComponents *)v8 roomName];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      v20 = [(HFServiceNameComponents *)v8 serviceName];
      v21 = [(HFServiceNameComponents *)v8 roomName];
      uint64_t v22 = [v20 rangeOfString:v21 options:129];
      uint64_t v24 = v23;

      if (v24)
      {
        uint64_t v25 = v22 + v24;
        v26 = [(HFServiceNameComponents *)v8 serviceName];
        uint64_t v27 = [v26 length];

        if (!v22)
        {
          v41 = [(HFServiceNameComponents *)v8 serviceName];
          v29 = [v41 substringFromIndex:v24];
          v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v40 = [v29 rangeOfCharacterFromSet:v30 options:0];

          if (v25 != v27)
          {
            [(HFServiceNameComponents *)v8 setRoomNameAtEndSeparatedByWhitespace:0];
            if (!v40)
            {
LABEL_16:
              v36 = [(HFServiceNameComponents *)v8 serviceName];
              v37 = objc_msgSend(v36, "stringByReplacingCharactersInRange:withString:", v22, v24, &stru_26C081158);
              [(HFServiceNameComponents *)v8 setServiceName:v37];

              uint64_t v15 = [(HFServiceNameComponents *)v8 serviceName];
              uint64_t v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
              v38 = [v15 stringByTrimmingCharactersInSet:v16];
              [(HFServiceNameComponents *)v8 setServiceName:v38];

              goto LABEL_17;
            }
LABEL_15:
            if (![(HFServiceNameComponents *)v8 roomNameAtEndSeparatedByWhitespace])
            {
              [(HFServiceNameComponents *)v8 setRoomName:0];
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          BOOL v28 = v40 == 0;
LABEL_11:
          v31 = [(HFServiceNameComponents *)v8 serviceName];
          v32 = [v31 substringToIndex:v22];
          v33 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v34 = [v32 rangeOfCharacterFromSet:v33 options:4];
          [(HFServiceNameComponents *)v8 setRoomNameAtEndSeparatedByWhitespace:v34 + v35 == v22];

          if (v28) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        if (v25 == v27)
        {
          BOOL v28 = 0;
          goto LABEL_11;
        }
        [(HFServiceNameComponents *)v8 setRoomNameAtEndSeparatedByWhitespace:0];
      }
    }
  }
LABEL_19:

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setServiceName:(id)a3
{
}

- (void)setRoomName:(id)a3
{
}

- (void)setRawServiceName:(id)a3
{
}

- (void)setRawRoomName:(id)a3
{
}

- (BOOL)roomNameAtEndSeparatedByWhitespace
{
  return self->_roomNameAtEndSeparatedByWhitespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_rawRoomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_rawServiceName, 0);
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HFServiceNameComponents *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(HFServiceNameComponents *)self serviceName];
      v8 = [(HFServiceNameComponents *)v6 serviceName];
      if (v7 != v8)
      {
        uint64_t v9 = [(HFServiceNameComponents *)self serviceName];
        v3 = [(HFServiceNameComponents *)v6 serviceName];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        uint64_t v16 = v9;
      }
      uint64_t v11 = [(HFServiceNameComponents *)self roomName];
      uint64_t v12 = [(HFServiceNameComponents *)v6 roomName];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v13 = [(HFServiceNameComponents *)self roomName];
        uint64_t v14 = [(HFServiceNameComponents *)v6 roomName];
        char v10 = [v13 isEqual:v14];
      }
      uint64_t v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HFServiceNameComponents *)self serviceName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)rawServiceName
{
  return self->_rawServiceName;
}

- (NSString)rawRoomName
{
  return self->_rawRoomName;
}

- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3
{
  self->_roomNameAtEndSeparatedByWhitespace = a3;
}

@end