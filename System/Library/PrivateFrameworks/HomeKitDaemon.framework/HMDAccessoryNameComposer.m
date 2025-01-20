@interface HMDAccessoryNameComposer
- (BOOL)isEqual:(id)a3;
- (BOOL)roomNameAtEndSeparatedByWhitespace;
- (HMDAccessoryNameComposer)initWithRawAccessoryName:(id)a3 rawRoomName:(id)a4;
- (NSString)accessoryName;
- (NSString)composedString;
- (NSString)rawAccessoryName;
- (NSString)rawRoomName;
- (NSString)roomName;
- (unint64_t)hash;
- (void)setAccessoryName:(id)a3;
- (void)setRawAccessoryName:(id)a3;
- (void)setRawRoomName:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3;
@end

@implementation HMDAccessoryNameComposer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_rawRoomName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_rawAccessoryName, 0);
}

- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3
{
  self->_roomNameAtEndSeparatedByWhitespace = a3;
}

- (BOOL)roomNameAtEndSeparatedByWhitespace
{
  return self->_roomNameAtEndSeparatedByWhitespace;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRawRoomName:(id)a3
{
}

- (NSString)rawRoomName
{
  return self->_rawRoomName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setRawAccessoryName:(id)a3
{
}

- (NSString)rawAccessoryName
{
  return self->_rawAccessoryName;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryNameComposer *)self accessoryName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDAccessoryNameComposer *)a3;
  if (v5 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HMDAccessoryNameComposer *)self accessoryName];
      v8 = [(HMDAccessoryNameComposer *)v6 accessoryName];
      if (v7 != v8)
      {
        v9 = [(HMDAccessoryNameComposer *)self accessoryName];
        unint64_t v3 = [(HMDAccessoryNameComposer *)v6 accessoryName];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDAccessoryNameComposer *)self roomName];
      v12 = [(HMDAccessoryNameComposer *)v6 roomName];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDAccessoryNameComposer *)self roomName];
        v14 = [(HMDAccessoryNameComposer *)v6 roomName];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
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

- (NSString)composedString
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDAccessoryNameComposer *)self accessoryName];
  v4 = [(HMDAccessoryNameComposer *)self accessoryName];
  if ([v4 length])
  {
    v5 = [(HMDAccessoryNameComposer *)self roomName];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      BOOL v7 = [(HMDAccessoryNameComposer *)self roomNameAtEndSeparatedByWhitespace];
      v8 = NSString;
      v9 = HMDLocalizedStringForKey(@"ACCESSORY_NAME_COMPOSER_FORMAT");
      if (v7)
      {
        id v25 = 0;
        char v10 = [(HMDAccessoryNameComposer *)self accessoryName];
        v11 = [(HMDAccessoryNameComposer *)self roomName];
        objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%1$@ %2$@", &v25, v10, v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v13 = v25;

        v14 = v12;
        if (!v12)
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v27 = v17;
            __int16 v28 = 2112;
            v29 = @"ACCESSORY_NAME_COMPOSER_FORMAT";
            __int16 v30 = 2112;
            v31 = @"%1$@ %2$@";
            __int16 v32 = 2112;
            id v33 = v13;
LABEL_13:
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            goto LABEL_14;
          }
          goto LABEL_14;
        }
      }
      else
      {
        id v24 = 0;
        v21 = [(HMDAccessoryNameComposer *)self roomName];
        v22 = [(HMDAccessoryNameComposer *)self accessoryName];
        objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%1$@ %2$@", &v24, v21, v22);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v13 = v24;

        v14 = v12;
        if (!v12)
        {
          v15 = (void *)MEMORY[0x230FBD990]();
          v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v27 = v17;
            __int16 v28 = 2112;
            v29 = @"ACCESSORY_NAME_COMPOSER_FORMAT";
            __int16 v30 = 2112;
            v31 = @"%1$@ %2$@";
            __int16 v32 = 2112;
            id v33 = v13;
            goto LABEL_13;
          }
LABEL_14:

          v14 = @"ACCESSORY_NAME_COMPOSER_FORMAT";
        }
      }
      v20 = v14;

      goto LABEL_16;
    }
  }
  else
  {
  }
  v18 = [(HMDAccessoryNameComposer *)self roomName];
  uint64_t v19 = [v18 length];

  if (!v19) {
    goto LABEL_17;
  }
  v20 = [(HMDAccessoryNameComposer *)self roomName];
LABEL_16:

  unint64_t v3 = v20;
LABEL_17:
  return (NSString *)v3;
}

- (HMDAccessoryNameComposer)initWithRawAccessoryName:(id)a3 rawRoomName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HMDAccessoryNameComposer;
  v8 = [(HMDAccessoryNameComposer *)&v42 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [(HMDAccessoryNameComposer *)v8 setRawAccessoryName:v9];

    char v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v11 = [v6 stringByTrimmingCharactersInSet:v10];
    [(HMDAccessoryNameComposer *)v8 setAccessoryName:v11];

    v12 = (void *)[v7 copy];
    [(HMDAccessoryNameComposer *)v8 setRawRoomName:v12];

    id v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v14 = [v7 stringByTrimmingCharactersInSet:v13];
    [(HMDAccessoryNameComposer *)v8 setRoomName:v14];

    v15 = [(HMDAccessoryNameComposer *)v8 accessoryName];
    if (![v15 length])
    {
LABEL_18:

      goto LABEL_19;
    }
    v16 = [(HMDAccessoryNameComposer *)v8 roomName];
    if (![v16 length])
    {
LABEL_17:

      goto LABEL_18;
    }
    v17 = [(HMDAccessoryNameComposer *)v8 accessoryName];
    v18 = [(HMDAccessoryNameComposer *)v8 roomName];
    char v19 = [v17 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      v20 = [(HMDAccessoryNameComposer *)v8 accessoryName];
      v21 = [(HMDAccessoryNameComposer *)v8 roomName];
      uint64_t v22 = [v20 rangeOfString:v21 options:129];
      uint64_t v24 = v23;

      if (v24)
      {
        uint64_t v25 = v22 + v24;
        v26 = [(HMDAccessoryNameComposer *)v8 accessoryName];
        uint64_t v27 = [v26 length];

        if (!v22)
        {
          v41 = [(HMDAccessoryNameComposer *)v8 accessoryName];
          v29 = [v41 substringFromIndex:v24];
          __int16 v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v40 = [v29 rangeOfCharacterFromSet:v30 options:0];

          if (v25 != v27)
          {
            [(HMDAccessoryNameComposer *)v8 setRoomNameAtEndSeparatedByWhitespace:0];
            if (!v40)
            {
LABEL_16:
              v36 = [(HMDAccessoryNameComposer *)v8 accessoryName];
              v37 = objc_msgSend(v36, "stringByReplacingCharactersInRange:withString:", v22, v24, &stru_26E2EB898);
              [(HMDAccessoryNameComposer *)v8 setAccessoryName:v37];

              v15 = [(HMDAccessoryNameComposer *)v8 accessoryName];
              v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
              v38 = [v15 stringByTrimmingCharactersInSet:v16];
              [(HMDAccessoryNameComposer *)v8 setAccessoryName:v38];

              goto LABEL_17;
            }
LABEL_15:
            if (![(HMDAccessoryNameComposer *)v8 roomNameAtEndSeparatedByWhitespace])
            {
              [(HMDAccessoryNameComposer *)v8 setRoomName:0];
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          BOOL v28 = v40 == 0;
LABEL_11:
          v31 = [(HMDAccessoryNameComposer *)v8 accessoryName];
          __int16 v32 = [v31 substringToIndex:v22];
          id v33 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v34 = [v32 rangeOfCharacterFromSet:v33 options:0];
          [(HMDAccessoryNameComposer *)v8 setRoomNameAtEndSeparatedByWhitespace:v34 + v35 == v22];

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
        [(HMDAccessoryNameComposer *)v8 setRoomNameAtEndSeparatedByWhitespace:0];
      }
    }
  }
LABEL_19:

  return v8;
}

@end