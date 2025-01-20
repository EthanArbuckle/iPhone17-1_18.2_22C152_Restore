@interface __CFN_SocksHandshakev5
- (BOOL)parse:(const char *)a3 len:(int64_t)a4 completion:(id)a5;
- (id)finish:(int)a3;
@end

@implementation __CFN_SocksHandshakev5

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_authMethods, 0);
}

- (id)finish:(int)a3
{
  if (self)
  {
    if (self->super._finished)
    {
      dispatch_data_t v11 = 0;
      goto LABEL_16;
    }
    self->super._finished = 1;
  }
  v5 = [MEMORY[0x1E4F1CA58] data];
  [v5 appendBytes:"\x05" length:1];
  if (a3) {
    v6 = "\x01";
  }
  else {
    v6 = (const char *)byte_18430C0B8;
  }
  [v5 appendBytes:v6 length:1];
  [v5 appendBytes:byte_18430C0B8 length:1];
  unsigned __int8 addressType = self->_addressType;
  [v5 appendBytes:&addressType length:1];
  int v7 = self->_addressType;
  switch(v7)
  {
    case 4:
      ipaddr = self->ipaddr;
      v9 = v5;
      uint64_t v10 = 16;
      goto LABEL_14;
    case 3:
      size_t v12 = strlen((const char *)[(NSMutableString *)self->_domainName UTF8String]);
      unsigned __int8 addressType = v12;
      [v5 appendBytes:&addressType length:1];
      ipaddr = (unsigned __int8 *)[(NSMutableString *)self->_domainName UTF8String];
      v9 = v5;
      uint64_t v10 = v12;
      goto LABEL_14;
    case 1:
      ipaddr = self->ipaddr;
      v9 = v5;
      uint64_t v10 = 4;
LABEL_14:
      [v9 appendBytes:ipaddr length:v10];
      break;
  }
  __int16 v15 = 0;
  [v5 appendBytes:&v15 length:2];
  id v13 = v5;
  dispatch_data_t v11 = dispatch_data_create((const void *)[v13 bytes], objc_msgSend(v13, "length"), 0, 0);

LABEL_16:

  return v11;
}

- (BOOL)parse:(const char *)a3 len:(int64_t)a4 completion:(id)a5
{
  v9 = (void (**)(id, dispatch_data_t, void))a5;
  while (2)
  {
    switch(self->_state)
    {
      case 0uLL:
        unint64_t v10 = 1;
        goto LABEL_23;
      case 1uLL:
        int v11 = *a3++;
        self->_numberOfAuthVersionSupported = v11;
        self->_state = 2;
        size_t v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v13 = 56;
        goto LABEL_17;
      case 2uLL:
        authMethods = self->_authMethods;
        __int16 v15 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a3];
        [(NSMutableSet *)authMethods addObject:v15];

        int v16 = self->_numberOfAuthVersionSupported - 1;
        self->_numberOfAuthVersionSupported = v16;
        if (v16) {
          goto LABEL_24;
        }
        id v17 = objc_getProperty(self, v8, 24, 1);
        if (v17)
        {
          v19 = v17;
          int v20 = [(NSMutableSet *)self->_authMethods containsObject:&unk_1ECFD1AB8];

          if (v20) {
            goto LABEL_68;
          }
        }
        id v21 = objc_getProperty(self, v18, 24, 1);
        if (v21)
        {
        }
        else if ([(NSMutableSet *)self->_authMethods containsObject:&unk_1ECFD1AD0])
        {
          self->_state = 3;
          v58 = (const char *)&unk_18430BFD0;
LABEL_69:
          dispatch_data_t v59 = dispatch_data_create(v58, 2uLL, 0, 0);
          v9[2](v9, v59, 0);

          goto LABEL_24;
        }
        if ([(NSMutableSet *)self->_authMethods containsObject:&unk_1ECFD1AB8])
        {
LABEL_68:
          self->_state = 4;
          v58 = "\x05\x02";
          goto LABEL_69;
        }
        dispatch_data_t v60 = dispatch_data_create("\x05\xFF", 2uLL, 0, 0);
        v9[2](v9, v60, 1);

LABEL_71:
        self->_BOOL done = 1;
        goto LABEL_24;
      case 3uLL:
        unint64_t v22 = 10;
        goto LABEL_42;
      case 4uLL:
        unint64_t v22 = 5;
        goto LABEL_42;
      case 5uLL:
        unint64_t v10 = 6;
        goto LABEL_23;
      case 6uLL:
        int v23 = *a3++;
        self->_int64_t usernameLen = v23;
        self->_state = 7;
        size_t v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        uint64_t v13 = 112;
        goto LABEL_17;
      case 7uLL:
        int64_t usernameLen = self->_usernameLen;
        if (a4 >= usernameLen)
        {
          self->_state = 8;
          int64_t v25 = self->_usernameLen;
        }
        else
        {
          self->_int64_t usernameLen = usernameLen - a4;
          int64_t v25 = a4;
        }
        username = self->_username;
        v45 = (void *)[[NSString alloc] initWithBytes:a3 length:v25 encoding:1];
        [(NSMutableString *)username appendString:v45];

        goto LABEL_53;
      case 8uLL:
        int v26 = *a3++;
        self->_int64_t passwordLen = v26;
        self->_state = 9;
        size_t v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        uint64_t v13 = 128;
LABEL_17:
        v27 = *(Class *)((char *)&self->super.super.isa + v13);
        *(Class *)((char *)&self->super.super.isa + v13) = v12;

        goto LABEL_25;
      case 9uLL:
        int64_t passwordLen = self->_passwordLen;
        if (a4 >= passwordLen)
        {
          self->_state = 10;
          int64_t v29 = self->_passwordLen;
        }
        else
        {
          self->_int64_t passwordLen = passwordLen - a4;
          int64_t v29 = a4;
        }
        password = self->_password;
        v47 = (void *)[[NSString alloc] initWithBytes:a3 length:v29 encoding:1];
        [(NSMutableString *)password appendString:v47];

        a3 += v29;
        a4 -= v29;
        if (self->_state != 10) {
          goto LABEL_54;
        }
        id v48 = objc_getProperty(self, v8, 24, 1);
        if (!v48)
        {
          v52 = 0;
LABEL_61:
          dispatch_data_t v56 = dispatch_data_create(&unk_18430BFD3, 2uLL, 0, 0);
          v9[2](v9, v56, 0);

          goto LABEL_64;
        }
        v50 = v48;
        v51 = objc_msgSend(objc_getProperty(self, v49, 24, 1), "objectForKeyedSubscript:", self->_username);
        v52 = v51;
        if (v51)
        {
          int v53 = [v51 isEqualToString:self->_password];

          if (v53) {
            goto LABEL_61;
          }
        }
        else
        {
        }
        dispatch_data_t v57 = dispatch_data_create("\x01\x01", 2uLL, 0, 0);
        v9[2](v9, v57, 1);

        self->_BOOL done = 1;
LABEL_64:

        goto LABEL_54;
      case 0xAuLL:
        unint64_t v10 = 11;
        goto LABEL_23;
      case 0xBuLL:
        unint64_t v10 = 12;
        goto LABEL_23;
      case 0xCuLL:
        unint64_t v10 = 13;
        goto LABEL_23;
      case 0xDuLL:
        self->_int addressType = *a3;
        v30 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        domainName = self->_domainName;
        self->_domainName = v30;

        int addressType = self->_addressType;
        if (addressType == 4)
        {
          self->_state = 17;
          int v33 = 16;
LABEL_58:
          self->_int64_t destinationLen = v33;
          goto LABEL_24;
        }
        if (addressType != 3)
        {
          if (addressType != 1) {
            goto LABEL_71;
          }
          self->_state = 14;
          int v33 = 4;
          goto LABEL_58;
        }
        unint64_t v10 = 15;
LABEL_23:
        self->_state = v10;
LABEL_24:
        ++a3;
LABEL_25:
        --a4;
LABEL_54:
        if (!a4)
        {
          BOOL done = self->_done;
          goto LABEL_73;
        }
        if (!self->_done) {
          continue;
        }
        BOOL done = 1;
LABEL_73:

        return done;
      case 0xEuLL:
        [(NSMutableString *)self->_domainName appendFormat:@"%u", *(unsigned __int8 *)a3];
        unsigned __int8 v34 = *a3++;
        self->ipaddr[-self->_destinationLen + 4] = v34;
        --a4;
        int v35 = self->_destinationLen - 1;
        self->_int64_t destinationLen = v35;
        if (!v35) {
          goto LABEL_41;
        }
        v36 = self->_domainName;
        v37 = @".";
        goto LABEL_38;
      case 0xFuLL:
        int v38 = *a3++;
        self->_int64_t destinationLen = v38;
        self->_state = 16;
        goto LABEL_25;
      case 0x10uLL:
        int64_t destinationLen = self->_destinationLen;
        if (a4 >= destinationLen)
        {
          self->_state = 18;
          int64_t v25 = self->_destinationLen;
        }
        else
        {
          self->_int64_t destinationLen = destinationLen - a4;
          int64_t v25 = a4;
        }
        v54 = self->_domainName;
        v55 = (void *)[[NSString alloc] initWithBytes:a3 length:v25 encoding:1];
        [(NSMutableString *)v54 appendString:v55];

LABEL_53:
        a3 += v25;
        a4 -= v25;
        goto LABEL_54;
      case 0x11uLL:
        [(NSMutableString *)self->_domainName appendFormat:@"%.2x", *(unsigned __int8 *)a3];
        unsigned __int8 v40 = *a3++;
        self->ipaddr[-self->_destinationLen + 16] = v40;
        --a4;
        int v41 = self->_destinationLen - 1;
        self->_int64_t destinationLen = v41;
        if (v41)
        {
          if ((v41 & 1) == 0)
          {
            v36 = self->_domainName;
            v37 = @":";
LABEL_38:
            [(NSMutableString *)v36 appendString:v37];
          }
        }
        else
        {
LABEL_41:
          unint64_t v22 = 18;
LABEL_42:
          self->_state = v22;
        }
        goto LABEL_54;
      case 0x12uLL:
        __int16 v42 = *(unsigned __int8 *)a3++;
        self->_destPort = v42 | (self->_destPort << 8);
        --a4;
        int v43 = self->_portLen + 1;
        self->_portLen = v43;
        if (v43 == 2)
        {
          objc_setProperty_atomic(self, v8, self->_domainName, 16);
          self->super._port = self->_destPort;
          self->_state = 19;
          self->_BOOL done = 1;
        }
        goto LABEL_54;
      default:
        goto LABEL_54;
    }
  }
}

@end