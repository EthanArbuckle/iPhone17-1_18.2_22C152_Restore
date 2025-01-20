@interface IPPerson
- (IPPerson)init;
- (IPPerson)initWithEmail:(id)a3 fullName:(id)a4;
- (IPPerson)initWithHandle:(id)a3 handleType:(id)a4 fullName:(id)a5;
- (IPPerson)initWithSGIPPerson:(id)a3;
- (IPPerson)initWithString:(id)a3;
- (NSString)ABUUID;
- (NSString)displayableName;
- (NSString)email;
- (NSString)fullName;
- (NSString)handle;
- (NSString)handleType;
- (void)setABUUID:(id)a3;
@end

@implementation IPPerson

- (IPPerson)initWithEmail:(id)a3 fullName:(id)a4
{
  return [(IPPerson *)self initWithHandle:a3 handleType:*MEMORY[0x263EFDF80] fullName:a4];
}

- (IPPerson)initWithHandle:(id)a3 handleType:(id)a4 fullName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IPPerson;
  v12 = [(IPPerson *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_handleType, a4);
    if ([v11 length]) {
      v14 = v11;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v13->_fullName, v14);
  }

  return v13;
}

- (IPPerson)init
{
  return 0;
}

- (IPPerson)initWithString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 length];
    if ([v5 hasSuffix:@">"])
    {
      uint64_t v7 = [v5 rangeOfString:@"<"];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
        id v9 = (char *)(v6 - 1);
        if (v6 == 1) {
          goto LABEL_12;
        }
      }
      else
      {
        id v9 = (char *)v7;
        uint64_t v11 = [v5 length] - v7;
        if (v11 == 2)
        {
          v8 = 0;
          if (!v9) {
            goto LABEL_12;
          }
        }
        else
        {
          v8 = objc_msgSend(v5, "substringWithRange:", v9 + 1, v11 - 2);
          if (!v9)
          {
LABEL_12:
            self = [(IPPerson *)self initWithEmail:v8 fullName:v9];

            id v10 = self;
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      v8 = 0;
      id v9 = (char *)v6;
      if (!v6) {
        goto LABEL_12;
      }
    }
    v12 = objc_msgSend(v5, "substringWithRange:", 0, v9);
    v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v9 = [v12 stringByTrimmingCharactersInSet:v13];

    goto LABEL_12;
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

- (IPPerson)initWithSGIPPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 handle];
  uint64_t v6 = (void *)[v5 copy];
  uint64_t v7 = [v4 handleType];
  v8 = (void *)[v7 copy];
  id v9 = [v4 name];

  id v10 = (void *)[v9 copy];
  uint64_t v11 = [(IPPerson *)self initWithHandle:v6 handleType:v8 fullName:v10];

  return v11;
}

- (NSString)displayableName
{
  v3 = [(IPPerson *)self fullName];

  if (v3)
  {
    id v4 = [(IPPerson *)self fullName];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)email
{
  if ([(NSString *)self->_handleType isEqualToString:*MEMORY[0x263EFDF80]]) {
    v3 = self->_handle;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)ABUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setABUUID:(id)a3
{
}

- (NSString)handleType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_ABUUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end