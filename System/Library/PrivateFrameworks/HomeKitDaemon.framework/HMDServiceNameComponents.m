@interface HMDServiceNameComponents
+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4;
+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5;
- (HMDServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5;
- (NSString)format;
- (NSString)rawServiceName;
- (NSString)roomName;
- (NSString)serviceName;
- (id)composedName;
- (void)setFormat:(id)a3;
- (void)setRawServiceName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation HMDServiceNameComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_rawServiceName, 0);
}

- (void)setFormat:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setRawServiceName:(id)a3
{
}

- (NSString)rawServiceName
{
  return self->_rawServiceName;
}

- (id)composedName
{
  v3 = [(HMDServiceNameComponents *)self serviceName];
  v4 = [(HMDServiceNameComponents *)self serviceName];
  if ([v4 length])
  {
    v5 = [(HMDServiceNameComponents *)self roomName];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      v7 = NSString;
      uint64_t v8 = [(HMDServiceNameComponents *)self format];
      v9 = [(HMDServiceNameComponents *)self roomName];
      v10 = [(HMDServiceNameComponents *)self serviceName];
      uint64_t v11 = [v7 stringWithValidatedFormat:v8, @"%@ %@", 0, v9, v10 validFormatSpecifiers error];

      v3 = (void *)v8;
      goto LABEL_7;
    }
  }
  else
  {
  }
  v12 = [(HMDServiceNameComponents *)self roomName];
  uint64_t v13 = [v12 length];

  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v11 = [(HMDServiceNameComponents *)self roomName];
LABEL_7:

  v3 = (void *)v11;
LABEL_8:
  return v3;
}

- (HMDServiceNameComponents)initWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)HMDServiceNameComponents;
  uint64_t v11 = [(HMDServiceNameComponents *)&v37 init];
  if (v11)
  {
    v12 = (void *)[v8 copy];
    [(HMDServiceNameComponents *)v11 setRawServiceName:v12];

    uint64_t v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v14 = [v8 stringByTrimmingCharactersInSet:v13];
    [(HMDServiceNameComponents *)v11 setServiceName:v14];

    v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v16 = [v9 stringByTrimmingCharactersInSet:v15];
    [(HMDServiceNameComponents *)v11 setRoomName:v16];

    if (v10)
    {
      v17 = (void *)[v10 copy];
      [(HMDServiceNameComponents *)v11 setFormat:v17];
    }
    else
    {
      [(HMDServiceNameComponents *)v11 setFormat:@"%@ %@"];
    }
    v18 = [(HMDServiceNameComponents *)v11 serviceName];
    if (![v18 length]) {
      goto LABEL_13;
    }
    v19 = [(HMDServiceNameComponents *)v11 roomName];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      v21 = [(HMDServiceNameComponents *)v11 serviceName];
      v22 = [(HMDServiceNameComponents *)v11 roomName];
      uint64_t v23 = [v21 rangeOfString:v22 options:129];
      uint64_t v25 = v24;

      if (v25)
      {
        if (!v23
          || ([(HMDServiceNameComponents *)v11 serviceName],
              v26 = objc_claimAutoreleasedReturnValue(),
              uint64_t v27 = [v26 length],
              v26,
              v23 + v25 == v27))
        {
          v28 = [(HMDServiceNameComponents *)v11 serviceName];
          v29 = [v28 substringFromIndex:v23 + v25];
          v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v31 = [v29 rangeOfCharacterFromSet:v30 options:0];

          if (v31)
          {
            [(HMDServiceNameComponents *)v11 setRoomName:0];
            goto LABEL_14;
          }
          v32 = [(HMDServiceNameComponents *)v11 serviceName];
          v33 = objc_msgSend(v32, "stringByReplacingCharactersInRange:withString:", v23, v25, &stru_26E2EB898);
          [(HMDServiceNameComponents *)v11 setServiceName:v33];

          v18 = [(HMDServiceNameComponents *)v11 serviceName];
          v34 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          v35 = [v18 stringByTrimmingCharactersInSet:v34];
          [(HMDServiceNameComponents *)v11 setServiceName:v35];

LABEL_13:
        }
      }
    }
  }
LABEL_14:

  return v11;
}

+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4 localizedFormat:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDServiceNameComponents alloc] initWithRawServiceName:v9 rawRoomName:v8 localizedFormat:v7];

  return v10;
}

+ (id)componentsWithRawServiceName:(id)a3 rawRoomName:(id)a4
{
  return +[HMDServiceNameComponents componentsWithRawServiceName:a3 rawRoomName:a4 localizedFormat:0];
}

@end