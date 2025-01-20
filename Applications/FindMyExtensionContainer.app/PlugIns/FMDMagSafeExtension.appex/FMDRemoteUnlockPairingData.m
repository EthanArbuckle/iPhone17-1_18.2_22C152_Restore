@interface FMDRemoteUnlockPairingData
+ (BOOL)testPairingData;
+ (BOOL)testPairingData2;
+ (BOOL)testPairingData3;
+ (id)keys;
+ (id)randomDataOfSize:(unint64_t)a3;
- (FMDRemoteUnlockPairingData)initWithData:(id)a3;
- (NSData)keysUpdated;
- (NSData)lostModePrivateKey;
- (NSData)otherData;
- (NSData)pairingCheckToken;
- (NSData)phoneNumber;
- (id)data;
- (void)setKeysUpdated:(id)a3;
- (void)setLostModePrivateKey:(id)a3;
- (void)setOtherData:(id)a3;
- (void)setPairingCheckToken:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation FMDRemoteUnlockPairingData

+ (id)keys
{
  if (qword_100031348 != -1) {
    dispatch_once(&qword_100031348, &stru_1000254E8);
  }
  v2 = (void *)qword_100031340;

  return v2;
}

- (FMDRemoteUnlockPairingData)initWithData:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FMDRemoteUnlockPairingData;
  v5 = [(FMDRemoteUnlockPairingData *)&v30 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() keys];
    id v25 = v4;
    id v7 = v4;
    v8 = (char *)[v7 bytes];
    v9 = (char *)[v7 length];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v24 = (uint64_t)v7;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v10);
          }
          unint64_t v16 = v13 + 2;
          if (v13 + 2 <= (unint64_t)v9)
          {
            uint64_t v17 = __rev16(*(unsigned __int16 *)&v8[v13]);
            unint64_t v13 = v16 + v17;
            if (v16 + v17 > (unint64_t)v9)
            {
              v20 = sub_100006910();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                sub_10001698C(v24, v20);
              }

              v21 = 0;
              id v4 = v25;
              goto LABEL_22;
            }
            if (v17)
            {
              uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              v19 = +[NSData dataWithBytes:&v8[v16] length:v24];
              [(FMDRemoteUnlockPairingData *)v5 setValue:v19 forKey:v18];
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }

    if ((unint64_t)v9 > v13)
    {
      v22 = +[NSData dataWithBytes:&v8[v13] length:&v9[-v13]];
      [(FMDRemoteUnlockPairingData *)v5 setOtherData:v22];
    }
    id v4 = v25;
  }
  v21 = v5;
LABEL_22:

  return v21;
}

- (id)data
{
  id v3 = objc_alloc_init((Class)NSMutableData);
  [(id)objc_opt_class() keys];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[FMDRemoteUnlockPairingData valueForKey:](self, "valueForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        id v10 = malloc_type_malloc(2uLL, 0x4258646CuLL);
        if (!v10)
        {

          id v18 = 0;
          goto LABEL_16;
        }
        id v11 = v10;
        v10[1] = [v9 length];
        *id v11 = (unsigned __int16)[v9 length] >> 8;
        [v3 appendBytes:v11 length:2];
        [v3 appendData:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = [(FMDRemoteUnlockPairingData *)self otherData];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(FMDRemoteUnlockPairingData *)self otherData];
    id v15 = [v14 length];

    if (v15)
    {
      unint64_t v16 = [(FMDRemoteUnlockPairingData *)self otherData];
      [v3 appendData:v16];
    }
  }
  uint64_t v17 = sub_100006910();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100016A04((uint64_t)v3, v17);
  }

  id v18 = v3;
LABEL_16:

  return v18;
}

+ (id)randomDataOfSize:(unint64_t)a3
{
  id v4 = malloc_type_malloc(a3, 0x3658A070uLL);
  if (v4)
  {
    id v5 = v4;
    arc4random_buf(v4, a3);
    id v4 = +[NSData dataWithBytesNoCopy:v5 length:a3 freeWhenDone:1];
  }

  return v4;
}

+ (BOOL)testPairingData
{
  v2 = objc_alloc_init(FMDRemoteUnlockPairingData);
  id v3 = [(id)objc_opt_class() randomDataOfSize:60];
  [(FMDRemoteUnlockPairingData *)v2 setPairingCheckToken:v3];

  id v4 = [(id)objc_opt_class() randomDataOfSize:64];
  [(FMDRemoteUnlockPairingData *)v2 setLostModePrivateKey:v4];

  id v5 = [(FMDRemoteUnlockPairingData *)v2 data];
  if (v5)
  {
    id v6 = [[FMDRemoteUnlockPairingData alloc] initWithData:v5];
    if (v6)
    {
      [(id)objc_opt_class() keys];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            unint64_t v13 = [(FMDRemoteUnlockPairingData *)v2 valueForKey:v12];
            uint64_t v14 = [(FMDRemoteUnlockPairingData *)v6 valueForKey:v12];
            unsigned int v15 = [v13 isEqualToData:v14];

            if (!v15)
            {
              BOOL v17 = 0;
              unint64_t v16 = v7;
              goto LABEL_18;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      unint64_t v16 = sub_100006910();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMDRemoteUnlockPairingData: test 1 success", v19, 2u);
      }
      BOOL v17 = 1;
LABEL_18:
    }
    else
    {
      uint64_t v7 = sub_100006910();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100016AB0();
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    sub_100006910();
    id v6 = (FMDRemoteUnlockPairingData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      sub_100016A7C();
    }
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)testPairingData2
{
  v2 = (char *)malloc_type_malloc(0x15uLL, 0xD692C67uLL);
  *(_WORD *)v2 = 1280;
  *(_DWORD *)(v2 + 2) = 875770417;
  v2[6] = 53;
  *(_WORD *)(v2 + 7) = 3072;
  *(_DWORD *)(v2 + 17) = 1818978921;
  *(void *)(v2 + 9) = *(void *)"abcdefghijkl";
  id v3 = [objc_alloc((Class)NSData) initWithBytes:v2 length:21];
  id v4 = [[FMDRemoteUnlockPairingData alloc] initWithData:v3];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSData) initWithBytes:"12345" length:5];
    id v6 = [objc_alloc((Class)NSData) initWithBytes:"abcdefghijkl" length:12];
    uint64_t v7 = [(FMDRemoteUnlockPairingData *)v4 pairingCheckToken];
    unsigned int v8 = [v5 isEqualToData:v7];

    if (v8
      && ([(FMDRemoteUnlockPairingData *)v4 lostModePrivateKey],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v6 isEqualToData:v9],
          v9,
          v10))
    {
      id v11 = sub_100006910();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDRemoteUnlockPairingData: test 2 success", (uint8_t *)v14, 2u);
      }

      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    id v5 = sub_100006910();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016AB0();
    }
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)testPairingData3
{
  v2 = (char *)malloc_type_malloc(0x28uLL, 0x6EC9B2CFuLL);
  *(_WORD *)v2 = 1280;
  *(_DWORD *)(v2 + 2) = 875770417;
  v2[6] = 53;
  *(_WORD *)(v2 + 7) = 3072;
  *(_DWORD *)(v2 + 17) = 1818978921;
  *(void *)(v2 + 9) = *(void *)"abcdefghijkl";
  *(_WORD *)(v2 + 21) = 2304;
  v2[31] = 57;
  *(void *)(v2 + 23) = *(void *)"123456789";
  *((void *)v2 + 4) = 0x6867666564636261;
  id v3 = [objc_alloc((Class)NSData) initWithBytes:v2 length:40];
  id v4 = [[FMDRemoteUnlockPairingData alloc] initWithData:v3];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSData) initWithBytes:"12345" length:5];
    id v6 = [objc_alloc((Class)NSData) initWithBytes:"abcdefghijkl" length:12];
    id v7 = [objc_alloc((Class)NSData) initWithBytes:"123456789" length:9];
    id v8 = [objc_alloc((Class)NSData) initWithBytes:"abcdefgh" length:8];
    id v9 = [(FMDRemoteUnlockPairingData *)v4 pairingCheckToken];
    unsigned __int8 v10 = [v5 isEqualToData:v9];

    if (v10)
    {
      id v11 = [(FMDRemoteUnlockPairingData *)v4 lostModePrivateKey];
      unsigned __int8 v12 = [v6 isEqualToData:v11];

      if (v12)
      {
        unint64_t v13 = [(FMDRemoteUnlockPairingData *)v4 phoneNumber];
        unsigned __int8 v14 = [v7 isEqualToData:v13];

        if (v14)
        {
          unsigned int v15 = [(FMDRemoteUnlockPairingData *)v4 otherData];
          unsigned __int8 v16 = [v8 isEqualToData:v15];

          if (v16)
          {
            BOOL v17 = [(FMDRemoteUnlockPairingData *)v4 data];
            unsigned __int8 v18 = [v17 isEqualToData:v3];
            v19 = sub_100006910();
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v20)
              {
                __int16 v26 = 0;
                long long v21 = "FMDRemoteUnlockPairingData: test 3 success";
                long long v22 = (uint8_t *)&v26;
LABEL_26:
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
              }
            }
            else if (v20)
            {
              *(_WORD *)long long v27 = 0;
              long long v21 = "FMDRemoteUnlockPairingData: decodedData failure";
              long long v22 = v27;
              goto LABEL_26;
            }

            goto LABEL_22;
          }
          BOOL v17 = sub_100006910();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            long long v23 = "FMDRemoteUnlockPairingData: otherData failure";
            uint64_t v24 = buf;
            goto LABEL_20;
          }
LABEL_21:
          unsigned __int8 v18 = 0;
LABEL_22:

          goto LABEL_23;
        }
        BOOL v17 = sub_100006910();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        __int16 v29 = 0;
        long long v23 = "FMDRemoteUnlockPairingData: phoneNumber failure";
        uint64_t v24 = (uint8_t *)&v29;
      }
      else
      {
        BOOL v17 = sub_100006910();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        __int16 v30 = 0;
        long long v23 = "FMDRemoteUnlockPairingData: lostModePrivateKey failure";
        uint64_t v24 = (uint8_t *)&v30;
      }
    }
    else
    {
      BOOL v17 = sub_100006910();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      __int16 v31 = 0;
      long long v23 = "FMDRemoteUnlockPairingData: pairingCheckToken failure";
      uint64_t v24 = (uint8_t *)&v31;
    }
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v23, v24, 2u);
    goto LABEL_21;
  }
  id v5 = sub_100006910();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100016AE4();
  }
  unsigned __int8 v18 = 0;
LABEL_23:

  return v18;
}

- (NSData)pairingCheckToken
{
  return self->_pairingCheckToken;
}

- (void)setPairingCheckToken:(id)a3
{
}

- (NSData)lostModePrivateKey
{
  return self->_lostModePrivateKey;
}

- (void)setLostModePrivateKey:(id)a3
{
}

- (NSData)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSData)keysUpdated
{
  return self->_keysUpdated;
}

- (void)setKeysUpdated:(id)a3
{
}

- (NSData)otherData
{
  return self->_otherData;
}

- (void)setOtherData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherData, 0);
  objc_storeStrong((id *)&self->_keysUpdated, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_lostModePrivateKey, 0);

  objc_storeStrong((id *)&self->_pairingCheckToken, 0);
}

@end