@interface DERHelper
+ (id)sharedDERHelper;
- (BOOL)addExplicitTagging:(unsigned int)a3 data:(char *)a4 len:(unsigned int)a5 outData:(char *)a6 outLen:(unsigned int *)a7;
- (BOOL)decodeOptions:(unsigned __int8)a3 data:(id)a4;
- (BOOL)decodeVinylL3Owner:(char *)a3 length:(unsigned int)a4;
- (BOOL)decodeVinylObject:(DERDecoder *)a3 data:(char *)a4 len:(unsigned int *)a5;
- (BOOL)generateL3Token:(char *)a3 outLen:(unsigned int *)a4 type:(unsigned __int8)a5;
- (BOOL)generateProfileDescriptor:(char *)a3 outLen:(unsigned int *)a4;
- (BOOL)generateProfileTypeProvider:(const char *)a3 name:(const char *)a4 outData:(char *)a5 outLen:(unsigned int *)a6;
- (BOOL)wrapL2L1:(const char *)a3 len3:(unsigned int)a4 data1:(const char *)a5 len1:(unsigned int)a6 data2:(const char *)a7 len2:(unsigned int)a8 outData:(char *)a9 outLen:(unsigned int *)a10;
- (BOOL)wrapWithSequence:(const char *)a3 len:(unsigned int)a4 outData:(char *)a5 outLen:(unsigned int *)a6;
- (DERHelper)init;
- (NSData)otc;
- (NSMutableDictionary)pcfDict;
- (char)convertChar:(char)a3;
- (id)arrayWithDecodingProfileList:(id)a3;
- (id)arrayWithDecodingReceiptsList:(id)a3;
- (id)arrayWithDecodingVinylObjectArray:(id)a3;
- (id)dataWithEncodingSignedIdentityMap:(id)a3 metaDataDict:(id)a4;
- (id)decodeVinylBatchDescriptor:(char *)a3 length:(unsigned int)a4;
- (id)decodeVinylObjectArray:(id)a3 num:(int)a4;
- (id)dictionaryWithDecodingProfile:(id)a3;
- (id)dictionaryWithDecodingReceipt:(id)a3;
- (id)dictionaryWithDecodingVinylObject:(DERDecoder *)a3;
- (id)dictionaryWithDecodingVinylProfileOption:(id)a3;
- (id)generateCreateSession:(id)a3;
- (id)generateGetExpData;
- (id)generateSignIdMap:(id)a3;
- (id)getBD;
- (id)getProfileID;
- (id)getl3;
- (id)hexString:(id)a3;
- (id)parseInfo:(id)a3;
- (unsigned)svn;
- (void)setOtc:(id)a3;
- (void)setPcfDict:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setSvn:(unsigned int)a3;
@end

@implementation DERHelper

- (id)arrayWithDecodingVinylObjectArray:(id)a3
{
  int v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = [a3 length];
  [a3 bytes];
  [a3 length];
  int v5 = DERDecoderInitialize();
  if (v5)
  {
    v6 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v26, kCtLoggingSystemName, "der");
    v7 = *((void *)&v26 + 1);
    ctu::OsLogContext::~OsLogContext(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ((v5 + 1) > 8) {
        v8 = "DEREncoderError(No Decoding)";
      }
      else {
        v8 = off_101A49EF0[v5 + 1];
      }
      LODWORD(v26) = 136315138;
      *(void *)((char *)&v26 + 4) = v8;
      v12 = "failed to initialize decoder for object array: %s";
      v13 = (uint8_t *)&v26;
      goto LABEL_21;
    }
    return 0;
  }
  long long v26 = 0uLL;
  int v9 = DERDecoderParseSequence();
  if (v9)
  {
    v10 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v7 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext(v10);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v9 + 1) > 8) {
      v11 = "DEREncoderError(No Decoding)";
    }
    else {
      v11 = off_101A49EF0[v9 + 1];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v25 = v11;
    v12 = "failed to decode container object array sequence: %s";
LABEL_20:
    v13 = buf;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v12, v13, 0xCu);
    return 0;
  }
  unsigned int v20 = 0;
  int Count = DERDecoderGetCount();
  if (Count)
  {
    v15 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v7 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext(v15);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((Count + 1) > 8) {
      v16 = "DEREncoderError(No Decoding)";
    }
    else {
      v16 = off_101A49EF0[Count + 1];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v25 = v16;
    v12 = "failed to get count for object array: %s";
    goto LABEL_20;
  }
  v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v20, 1, 0, 16, 1, &v26);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100C51B3C;
  v19[3] = &unk_101A49D38;
  v19[4] = self;
  v19[5] = v17;
  sub_100C51740((uint64_t)&v26, v20, (uint64_t)v19);
  return v17;
}

- (id)dictionaryWithDecodingVinylObject:(DERDecoder *)a3
{
  int v5 = +[NSMutableDictionary dictionaryWithCapacity:10];
  v40[0] = 0;
  v40[1] = 0;
  v39[0] = 0;
  v39[1] = 0;
  v38[0] = 0;
  v38[1] = 0;
  v37[0] = 0;
  v37[1] = 0;
  v36[0] = 0;
  v36[1] = 0;
  v35[0] = 0;
  v35[1] = 0;
  v34[0] = 0;
  v34[1] = 0;
  int v6 = DERDecoderParseSequence();
  if (v6)
  {
    v7 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v8 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if ((v6 + 1) > 8) {
        int v9 = "DEREncoderError(No Decoding)";
      }
      else {
        int v9 = off_101A49EF0[v6 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "failed to decode vinyl object array sequence: %s", buf, 0xCu);
    }
    return 0;
  }
  v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3->var0, a3->var1, 1, 0, 2, 0, v40, 1, 0, 10, 0, v39, 1, 0, 12, 0, v38,
          1,
          0,
          4,
          0,
          v37,
          0,
          2,
          2,
          1,
          v36,
          1,
          0,
          4,
          0,
          v35,
          1,
          2,
          3,
          1,
          v34);
  v11 = sub_100C59920();
  [(NSMutableDictionary *)v5 setValue:v10 forKey:@"RawObject"];
  v12 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 3) = 0;
  }
  else
  {
    v14 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v15 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "failed to create sub-encoder for wrapping explicit", buf, 2u);
    }
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100C52390;
  v33[3] = &unk_101A49D58;
  v33[4] = a3;
  sub_100C52164(v13, 0, 0x10u, (uint64_t)v33);
  if ([(NSNumber *)sub_100C59AAC() intValue] == 4)
  {
    *(void *)buf = 0;
    sub_100C523B0(v13, buf);
    [(NSMutableDictionary *)v5 setValue:*(void *)buf forKey:@"RawObject"];
  }
  [(NSMutableDictionary *)v5 setValue:sub_100C59BF8() forKey:@"Version"];
  [(NSMutableDictionary *)v5 setValue:sub_100C59AAC() forKey:@"DataType"];
  [(NSMutableDictionary *)v5 setValue:sub_100C54AD4(v38) forKey:@"Name"];
  [(NSMutableDictionary *)v5 setValue:v11 forKey:@"DataPayload"];
  if (!v36[0]) {
    goto LABEL_22;
  }
  *(_OWORD *)buf = 0uLL;
  uint64_t v31 = 0;
  v32 = buf;
  uint64_t v29 = 0;
  uint64_t v30 = 2;
  uint64_t v28 = 1;
  int v16 = DERDecoderParseSequence();
  if (v16)
  {
    v17 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v42, kCtLoggingSystemName, "der");
    v18 = *((void *)&v42 + 1);
    ctu::OsLogContext::~OsLogContext(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if ((v16 + 1) > 8) {
        v19 = "DEREncoderError(No Decoding)";
      }
      else {
        v19 = off_101A49EF0[v16 + 1];
      }
      LODWORD(v42) = 136315138;
      *(void *)((char *)&v42 + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "failed to decide epoch: %s", (uint8_t *)&v42, 0xCu);
    }
LABEL_22:
    unsigned int v20 = 0;
    goto LABEL_23;
  }
  unsigned int v20 = sub_100C59BF8();
LABEL_23:
  [(NSMutableDictionary *)v5 setValue:v20, @"Epoch", v28, v29, v30, v31, v32 forKey];
  [(NSMutableDictionary *)v5 setValue:sub_100C59920() forKey:@"Signature"];
  *(void *)&long long v42 = 0;
  unsigned int v41 = 0;
  int DataWithTag = DERDecoderGetDataWithTag();
  if (DataWithTag)
  {
    int v22 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    uint64_t v23 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if ((DataWithTag + 1) > 8) {
        v24 = "DEREncoderError(No Decoding)";
      }
      else {
        v24 = off_101A49EF0[DataWithTag + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "failed to decode cert: %s", buf, 0xCu);
    }
    v25 = 0;
  }
  else
  {
    v25 = +[NSData dataWithBytes:(void)v42 length:v41];
  }
  [(NSMutableDictionary *)v5 setValue:v25 forKey:@"Cert"];
  id v26 = [(NSMutableDictionary *)v5 objectForKey:@"DataType"];
  if (v26 && [v26 intValue] == 105) {
    [(DERHelper *)self setOtc:v11];
  }
  if (v13) {
    sub_100463290(v13);
  }
  return v5;
}

- (id)dictionaryWithDecodingVinylProfileOption:(id)a3
{
  unsigned int v41 = [a3 length];
  v40[4] = 0;
  v40[5] = 0;
  [a3 bytes];
  [a3 length];
  int v4 = DERDecoderInitialize();
  if (v4)
  {
    int v5 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v4 + 1) > 8) {
        v7 = "DEREncoderError(No Decoding)";
      }
      else {
        v7 = off_101A49EF0[v4 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v7;
      v11 = "failed to initialize vinyl profile option decoder: %s";
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
      return 0;
    }
    return 0;
  }
  void v40[2] = 0;
  v40[3] = 0;
  int v8 = DERDecoderParseSequence();
  if (v8)
  {
    int v9 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v8 + 1) > 8) {
        v10 = "DEREncoderError(No Decoding)";
      }
      else {
        v10 = off_101A49EF0[v8 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v10;
      v11 = "failed to parse vinyl profile option sequence: %s";
      goto LABEL_24;
    }
    return 0;
  }
  v40[0] = 0;
  v40[1] = 0;
  v39[0] = 0;
  v39[1] = 0;
  v38[0] = 0;
  v38[1] = 0;
  int v12 = DERDecoderParseSequence();
  if (v12)
  {
    v13 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v12 + 1) > 8) {
        v14 = "DEREncoderError(No Decoding)";
      }
      else {
        v14 = off_101A49EF0[v12 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v14;
      v11 = "failed to decode vinyl profile option sequence: %s";
      goto LABEL_24;
    }
    return 0;
  }
  v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4, 0, 2, 1, 1, v40, 0, 2, 2, 1, v39, 0, 2, 3, 1, v38);
  *(_OWORD *)buf = 0uLL;
  if (v40[0])
  {
    v36 = buf;
    uint64_t v34 = 16;
    uint64_t v35 = 1;
    uint64_t v32 = 1;
    uint64_t v33 = 0;
    int v16 = DERDecoderParseSequence();
    if (!v16)
    {
      uint64_t v21 = sub_100C59D44();
      goto LABEL_31;
    }
    v17 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v44, kCtLoggingSystemName, "der");
    v18 = *((void *)&v44 + 1);
    ctu::OsLogContext::~OsLogContext(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if ((v16 + 1) > 8) {
        v19 = "DEREncoderError(No Decoding)";
      }
      else {
        v19 = off_101A49EF0[v16 + 1];
      }
      LODWORD(v44) = 136315138;
      *(void *)((char *)&v44 + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "failed to parse profile choice sequence: %s", (uint8_t *)&v44, 0xCu);
    }
  }
  uint64_t v21 = 0;
LABEL_31:
  [(NSMutableDictionary *)v15 setValue:v21, @"ProfileChoice", v32, v33, v34, v35, v36 forKey];
  *(_OWORD *)buf = 0uLL;
  v37 = buf;
  int v22 = DERDecoderParseSequence();
  if (v22)
  {
    uint64_t v23 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v44, kCtLoggingSystemName, "der");
    v24 = *((void *)&v44 + 1);
    ctu::OsLogContext::~OsLogContext(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      if ((v22 + 1) > 8) {
        v25 = "DEREncoderError(No Decoding)";
      }
      else {
        v25 = off_101A49EF0[v22 + 1];
      }
      LODWORD(v44) = 136315138;
      *(void *)((char *)&v44 + 4) = v25;
      uint64_t v29 = (uint8_t *)&v44;
LABEL_44:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "failed to parse vinyl profile descriptor sequence: %s", v29, 0xCu);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  long long v44 = 0uLL;
  v37 = (uint8_t *)&v44;
  int v26 = DERDecoderParseSequence();
  if (v26)
  {
    v27 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v42, kCtLoggingSystemName, "der");
    v24 = *(NSObject **)&v43[4];
    ctu::OsLogContext::~OsLogContext(v27);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      if ((v26 + 1) > 8) {
        uint64_t v28 = "DEREncoderError(No Decoding)";
      }
      else {
        uint64_t v28 = off_101A49EF0[v26 + 1];
      }
      *(_DWORD *)long long v42 = 136315138;
      *(void *)v43 = v28;
      uint64_t v29 = v42;
      goto LABEL_44;
    }
LABEL_45:
    uint64_t v30 = 0;
    goto LABEL_46;
  }
  uint64_t v30 = sub_100C59D44();
LABEL_46:
  [(NSMutableDictionary *)v15 setValue:v30, @"ProfileParked", 1, 0, 16, 1, v37 forKey];
  [(NSMutableDictionary *)v15 setValue:a3 forKey:@"ProfileRawData"];
  if (v38[0]) {
    uint64_t v31 = sub_100C5A1F4(v38, 16, (uint64_t)&stru_101A49E50);
  }
  else {
    uint64_t v31 = 0;
  }
  [(NSMutableDictionary *)v15 setValue:v31 forKey:@"Profiles"];
  return v15;
}

- (id)arrayWithDecodingProfileList:(id)a3
{
  unsigned int v17 = [a3 length];
  if (v17 > 2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    [a3 bytes];
    [a3 length];
    int v5 = DERDecoderInitialize();
    if (v5)
    {
      int v6 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v20, kCtLoggingSystemName, "der");
      v7 = *((void *)&v20 + 1);
      ctu::OsLogContext::~OsLogContext(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if ((v5 + 1) > 8) {
          int v8 = "DEREncoderError(No Decoding)";
        }
        else {
          int v8 = off_101A49EF0[v5 + 1];
        }
        LODWORD(v20) = 136315138;
        *(void *)((char *)&v20 + 4) = v8;
        int v12 = "failed to initialize profile list decoder: %s";
        v13 = (uint8_t *)&v20;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v12, v13, 0xCu);
      }
    }
    else
    {
      long long v20 = 0uLL;
      int v9 = DERDecoderParseSequence();
      if (!v9) {
        return +[NSArray array];
      }
      v10 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      v7 = *(NSObject **)&v19[4];
      ctu::OsLogContext::~OsLogContext(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if ((v9 + 1) > 8) {
          v11 = "DEREncoderError(No Decoding)";
        }
        else {
          v11 = off_101A49EF0[v9 + 1];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v19 = v11;
        int v12 = "failed to decode container profile list: %s";
        v13 = buf;
        goto LABEL_18;
      }
    }
    return 0;
  }

  return +[NSArray array];
}

- (id)dataWithEncodingSignedIdentityMap:(id)a3 metaDataDict:(id)a4
{
  v7 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  int v8 = v7;
  if (v7) {
    *((_DWORD *)v7 + 3) = 0;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100C53408;
  v12[3] = &unk_101A49DD0;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = a4;
  sub_100C52164(v7, 0, 0x10u, (uint64_t)v12);
  v11 = 0;
  sub_100C523B0(v8, &v11);
  int v9 = v11;
  if (v8) {
    sub_100463290(v8);
  }
  return v9;
}

+ (id)sharedDERHelper
{
  if (!qword_101B10310) {
    qword_101B10310 = objc_alloc_init(DERHelper);
  }
  objc_sync_exit(a1);
  return (id)qword_101B10310;
}

- (DERHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)DERHelper;
  return [(DERHelper *)&v3 init];
}

- (BOOL)wrapWithSequence:(const char *)a3 len:(unsigned int)a4 outData:(char *)a5 outLen:(unsigned int *)a6
{
  v10 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  v11 = v10;
  if (v10)
  {
    *((_DWORD *)v10 + 3) = 0;
    sub_1004632FC(v10, 0, 0x10u, a3, a4, 1);
    sub_100463664(v11, a5, a6);
    sub_100463290(v11);
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v14, kCtLoggingSystemName, "der");
    int v12 = *(NSObject **)&v15[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      *(void *)uint64_t v15 = "-[DERHelper wrapWithSequence:len:outData:outLen:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder II", (uint8_t *)&v14, 0xCu);
    }
  }
  return v11 != 0;
}

- (BOOL)addExplicitTagging:(unsigned int)a3 data:(char *)a4 len:(unsigned int)a5 outData:(char *)a6 outLen:(unsigned int *)a7
{
  int v12 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 3) = 0;
    sub_1004632FC(v12, 2, a3, a4, a5, 1);
    sub_100463664(v13, a6, a7);
    sub_100463290(v13);
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v16, kCtLoggingSystemName, "der");
    int v14 = *(NSObject **)&v17[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      *(void *)unsigned int v17 = "-[DERHelper addExplicitTagging:data:len:outData:outLen:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder II", (uint8_t *)&v16, 0xCu);
    }
  }
  return v13 != 0;
}

- (BOOL)generateProfileTypeProvider:(const char *)a3 name:(const char *)a4 outData:(char *)a5 outLen:(unsigned int *)a6
{
  long long v20 = 0;
  unsigned int v19 = 0;
  v10 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v10)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v17 = *(NSObject **)&v22[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    BOOL v16 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (!v16) {
      return v16;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v22 = "-[DERHelper generateProfileTypeProvider:name:outData:outLen:]";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder II", buf, 0xCu);
    LOBYTE(v16) = 0;
    return v16;
  }
  v11 = v10;
  *((_DWORD *)v10 + 3) = 0;
  unsigned int v12 = strlen(a3);
  sub_1004632FC(v11, 0, 0xCu, a3, v12, 0);
  sub_100463664(v11, &v20, &v19);
  sub_100463290(v11);
  v13 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v13)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v17 = *(NSObject **)&v22[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    BOOL v16 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (!v16) {
      return v16;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v22 = "-[DERHelper generateProfileTypeProvider:name:outData:outLen:]";
    goto LABEL_10;
  }
  int v14 = v13;
  *((_DWORD *)v13 + 3) = 0;
  sub_1004632FC(v13, 2, 0, v20, v19, 1);
  if (v20)
  {
    free(v20);
    long long v20 = 0;
  }
  unsigned int v15 = strlen(a4);
  sub_1004632FC(v14, 0, 0xCu, a4, v15, 0);
  sub_100463664(v14, a5, a6);
  sub_100463290(v14);
  LOBYTE(v16) = 1;
  return v16;
}

- (void)setProfileID:(id)a3
{
  self->profileID = (NSData *)a3;
}

- (id)getProfileID
{
  return self->profileID;
}

- (id)generateCreateSession:(id)a3
{
  v18 = 0;
  unsigned int v19 = 0;
  uint64_t v17 = 0;
  char v16 = 0;
  int v5 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v5)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v9 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v21 = "-[DERHelper generateCreateSession:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
    return 0;
  }
  int v6 = v5;
  *((_DWORD *)v5 + 3) = 0;
  id v7 = [a3 objectForKey:@"PARKED"];
  if (v7)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v8 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CreateSession: parked", buf, 2u);
    }
    goto LABEL_22;
  }
  -[DERHelper generateProfileTypeProvider:name:outData:outLen:](self, "generateProfileTypeProvider:name:outData:outLen:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerID_Type"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerType"), "UTF8String"), &v19, (char *)&v17 + 4);
  sub_1004632FC(v6, 0, 0x10u, v19, HIDWORD(v17), 1);
  if (v19)
  {
    free(v19);
    unsigned int v19 = 0;
  }
  -[DERHelper generateProfileTypeProvider:name:outData:outLen:](self, "generateProfileTypeProvider:name:outData:outLen:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerID_Name"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerName"), "UTF8String"), &v19, (char *)&v17 + 4);
  sub_1004632FC(v6, 0, 0x10u, v19, HIDWORD(v17), 1);
  if (v19)
  {
    free(v19);
    unsigned int v19 = 0;
  }
  sub_100463664(v6, &v19, (unsigned int *)&v17 + 1);
  sub_100463290(v6);
  if (![(DERHelper *)self wrapWithSequence:v19 len:HIDWORD(v17) outData:&v18 outLen:&v17])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v10 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v21 = "-[DERHelper generateCreateSession:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s failed to wrap with Sequence", buf, 0xCu);
    }
    if (v19) {
      free(v19);
    }
    return 0;
  }
  if (v19)
  {
    free(v19);
    unsigned int v19 = 0;
  }
  [(DERHelper *)self addExplicitTagging:1 data:v18 len:v17 outData:&v19 outLen:(char *)&v17 + 4];
  if (v18)
  {
    free(v18);
    int v6 = 0;
    v18 = 0;
  }
  else
  {
    int v6 = 0;
  }
LABEL_22:
  unsigned int v12 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (v12)
  {
    v13 = v12;
    *((_DWORD *)v12 + 3) = 0;
    if (v7)
    {
      sub_1004632FC(v12, 0, 0x10u, [v7 bytes], objc_msgSend(v7, "length"), 1);
    }
    else
    {
      sub_1004632FC(v12, 0, 0x10u, v19, HIDWORD(v17), 1);
      if (v19)
      {
        free(v19);
        unsigned int v19 = 0;
      }
    }
    sub_1004632FC(v13, 0, 4u, [(NSData *)[(DERHelper *)self otc] bytes], [(NSData *)[(DERHelper *)self otc] length], 0);
    sub_1004632FC(v13, 0, 0xAu, &v16, 1u, 0);
    sub_100463664(v13, &v19, (unsigned int *)&v17 + 1);
    [(DERHelper *)self wrapWithSequence:v19 len:HIDWORD(v17) outData:&v18 outLen:&v17];
    v11 = +[NSData dataWithBytes:v18 length:v17];
    sub_100463290(v13);
    if (v6) {
LABEL_32:
    }
      sub_100463290(v6);
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v14 = *(NSObject **)&v21[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v21 = "-[DERHelper generateCreateSession:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
    v11 = 0;
    if (v6) {
      goto LABEL_32;
    }
  }
  return v11;
}

- (BOOL)decodeVinylObject:(DERDecoder *)a3 data:(char *)a4 len:(unsigned int *)a5
{
  long long v36 = 0u;
  memset(v35, 0, sizeof(v35));
  int v34 = 0;
  uint64_t v32 = 0;
  int v7 = DERDecoderParseSequence();
  if (v7)
  {
    int v8 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v9 = *(NSObject **)&v38[4];
    ctu::OsLogContext::~OsLogContext(v8);
    int v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if ((v7 + 1) > 8) {
        v11 = "DEREncoderError(No Decoding)";
      }
      else {
        v11 = off_101A49EF0[v7 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)v38 = v11;
      int v22 = "failed to decode Vinyl Object Array IV: %s";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
      goto LABEL_35;
    }
  }
  else
  {
    unsigned int v12 = sub_100C54AD4(a3);
    v13 = v12;
    if (v12
      && -[NSString rangeOfString:](v12, "rangeOfString:", @"ProfileOption-PCF", 1, 0, 2, 0, 0, 1, 0, 10, 0, 0, 1, 0, 12, 0, 0, 1,
           0,
           4,
           0,
           0,
           0,
           2,
           0,
           0,
           0,
           0,
           2,
           1,
           0,
           0,
           0,
           2,
           2,
           1,
           0,
           1,
           0,
           4,
           0,
           0,
           1,
           2,
           3,
           1,
           &v36) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t Buffer = DERDecoderGetBuffer();
      if (![(DERHelper *)self wrapWithSequence:Buffer len:DERDecoderGetBufferLength() outData:v35 outLen:&v32])
      {
        int v26 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
        v27 = *(NSObject **)&v38[4];
        ctu::OsLogContext::~OsLogContext(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v38 = "-[DERHelper decodeVinylObject:data:len:]";
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s failed to wrap with Sequence in generateVinylObjectArray", buf, 0xCu);
        }
        LOBYTE(v10) = v35[0];
        if (v35[0])
        {
          free(v35[0]);
LABEL_35:
          LOBYTE(v10) = 0;
          return v10;
        }
        return v10;
      }
      unsigned int v15 = +[NSData dataWithBytes:v35[0] length:v32];
      char v16 = [(DERHelper *)self pcfDict];
      uint64_t v17 = (char *)[(NSString *)v13 rangeOfString:@"ProfileOption-PCF-"];
      [(NSMutableDictionary *)v16 setValue:v15 forKey:[(NSString *)v13 substringFromIndex:&v17[v18]]];
    }
    int DataWithTag = DERDecoderGetDataWithTag();
    if (DataWithTag)
    {
      long long v20 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      int v9 = *(NSObject **)&v38[4];
      ctu::OsLogContext::~OsLogContext(v20);
      int v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if ((DataWithTag + 1) > 8) {
          uint64_t v21 = "DEREncoderError(No Decoding)";
        }
        else {
          uint64_t v21 = off_101A49EF0[DataWithTag + 1];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v38 = v21;
        int v22 = "failed to decode payload: %s";
        goto LABEL_34;
      }
    }
    else
    {
      int v33 = 4;
      int v23 = DERDecoderGetDataWithTag();
      if (v23)
      {
        v24 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
        int v9 = *(NSObject **)&v38[4];
        ctu::OsLogContext::~OsLogContext(v24);
        int v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if ((v23 + 1) > 8) {
            v25 = "DEREncoderError(No Decoding)";
          }
          else {
            v25 = off_101A49EF0[v23 + 1];
          }
          *(_DWORD *)buf = 136315138;
          *(void *)v38 = v25;
          int v22 = "failed to decode signature: %s";
          goto LABEL_34;
        }
      }
      else
      {
        int v28 = DERDecoderGetDataWithTag();
        if (v28)
        {
          uint64_t v29 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          int v9 = *(NSObject **)&v38[4];
          ctu::OsLogContext::~OsLogContext(v29);
          int v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
          if (v10)
          {
            if ((v28 + 1) > 8) {
              uint64_t v30 = "DEREncoderError(No Decoding)";
            }
            else {
              uint64_t v30 = off_101A49EF0[v28 + 1];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)v38 = v30;
            int v22 = "failed to decode cert: %s";
            goto LABEL_34;
          }
        }
        else
        {
          LOBYTE(v10) = 1;
        }
      }
    }
  }
  return v10;
}

- (BOOL)decodeVinylL3Owner:(char *)a3 length:(unsigned int)a4
{
  int v4 = DERDecoderInitialize();
  if (v4)
  {
    int v5 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)&v33[4];
    ctu::OsLogContext::~OsLogContext(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if ((v4 + 1) > 8) {
        int v8 = "DEREncoderError(No Decoding)";
      }
      else {
        int v8 = off_101A49EF0[v4 + 1];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)int v33 = v8;
      unsigned int v12 = "failed to initialize Vinyl Object Array: %s";
LABEL_47:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    int v9 = DERDecoderParseSequence();
    if (v9)
    {
      int v10 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      int v6 = *(NSObject **)&v33[4];
      ctu::OsLogContext::~OsLogContext(v10);
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if ((v9 + 1) > 8) {
          v11 = "DEREncoderError(No Decoding)";
        }
        else {
          v11 = off_101A49EF0[v9 + 1];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)int v33 = v11;
        unsigned int v12 = "failed to decode Vinyl Object Array: %s";
        goto LABEL_47;
      }
    }
    else
    {
      int v13 = DERDecoderParseSequence();
      if (v13)
      {
        int v14 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
        int v6 = *(NSObject **)&v33[4];
        ctu::OsLogContext::~OsLogContext(v14);
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if ((v13 + 1) > 8) {
            unsigned int v15 = "DEREncoderError(No Decoding)";
          }
          else {
            unsigned int v15 = off_101A49EF0[v13 + 1];
          }
          *(_DWORD *)buf = 136315138;
          *(void *)int v33 = v15;
          unsigned int v12 = "failed to decode Vinyl Object Name: %s";
          goto LABEL_47;
        }
      }
      else
      {
        int DataWithTag = DERDecoderGetDataWithTag();
        if (DataWithTag)
        {
          uint64_t v17 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          uint64_t v18 = *(NSObject **)&v33[4];
          ctu::OsLogContext::~OsLogContext(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            if ((DataWithTag + 1) > 8) {
              unsigned int v19 = "DEREncoderError(No Decoding)";
            }
            else {
              unsigned int v19 = off_101A49EF0[DataWithTag + 1];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)int v33 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "no Principal: %s", buf, 0xCu);
          }
        }
        else
        {
          DERDecoderGetDataWithTag();
        }
        int v20 = DERDecoderGetDataWithTag();
        if (v20)
        {
          uint64_t v21 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          int v22 = *(NSObject **)&v33[4];
          ctu::OsLogContext::~OsLogContext(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            if ((v20 + 1) > 8) {
              int v23 = "DEREncoderError(No Decoding)";
            }
            else {
              int v23 = off_101A49EF0[v20 + 1];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)int v33 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "no service name: %s", buf, 0xCu);
          }
        }
        else
        {
          DERDecoderGetDataWithTag();
        }
        int v24 = DERDecoderGetDataWithTag();
        if (v24)
        {
          v25 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          int v26 = *(NSObject **)&v33[4];
          ctu::OsLogContext::~OsLogContext(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            if ((v24 + 1) > 8) {
              v27 = "DEREncoderError(No Decoding)";
            }
            else {
              v27 = off_101A49EF0[v24 + 1];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)int v33 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no profile id: %s", buf, 0xCu);
          }
        }
        else
        {
          DERDecoderGetDataWithTag();
        }
        int v28 = DERDecoderGetDataWithTag();
        if (v28)
        {
          uint64_t v29 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          int v6 = *(NSObject **)&v33[4];
          ctu::OsLogContext::~OsLogContext(v29);
          BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
          if (v7)
          {
            if ((v28 + 1) > 8) {
              uint64_t v30 = "DEREncoderError(No Decoding)";
            }
            else {
              uint64_t v30 = off_101A49EF0[v28 + 1];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)int v33 = v30;
            unsigned int v12 = "failed to decode hashBatchDescriptor: %s";
            goto LABEL_47;
          }
        }
        else
        {
          LOBYTE(v7) = 1;
        }
      }
    }
  }
  return v7;
}

- (id)decodeVinylBatchDescriptor:(char *)a3 length:(unsigned int)a4
{
  DERDecoderInitialize();
  int v4 = DERDecoderParseSequence();
  if (v4)
  {
    int v5 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v4 + 1) > 8) {
        BOOL v7 = "DEREncoderError(No Decoding)";
      }
      else {
        BOOL v7 = off_101A49EF0[v4 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v7;
      v11 = "failed to decode BD: %s";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
      return 0;
    }
    return 0;
  }
  int v8 = DERDecoderParseSequence();
  if (v8)
  {
    int v9 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v8 + 1) > 8) {
        int v10 = "DEREncoderError(No Decoding)";
      }
      else {
        int v10 = off_101A49EF0[v8 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v10;
      v11 = "failed to decode Batch Descriptor: %s";
      goto LABEL_29;
    }
    return 0;
  }
  int v12 = DERDecoderParseSequence();
  if (v12)
  {
    int v13 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v12 + 1) > 8) {
        int v14 = "DEREncoderError(No Decoding)";
      }
      else {
        int v14 = off_101A49EF0[v12 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v14;
      v11 = "failed to decode batchDescriptor ID: %s";
      goto LABEL_29;
    }
    return 0;
  }
  int DataWithTag = DERDecoderGetDataWithTag();
  if (DataWithTag)
  {
    char v16 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v16);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((DataWithTag + 1) > 8) {
        uint64_t v17 = "DEREncoderError(No Decoding)";
      }
      else {
        uint64_t v17 = off_101A49EF0[DataWithTag + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v17;
      v11 = "failed to decode l2 src id: %s";
      goto LABEL_29;
    }
    return 0;
  }
  dword_101B12A28 = 0;
  int v18 = DERDecoderGetDataWithTag();
  if (v18)
  {
    unsigned int v19 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v19);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v18 + 1) > 8) {
        int v20 = "DEREncoderError(No Decoding)";
      }
      else {
        int v20 = off_101A49EF0[v18 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v20;
      v11 = "failed to decode l2 dst id: %s";
      goto LABEL_29;
    }
    return 0;
  }
  int v22 = DERDecoderGetDataWithTag();
  if (v22)
  {
    int v23 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v23);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v22 + 1) > 8) {
      int v24 = "DEREncoderError(No Decoding)";
    }
    else {
      int v24 = off_101A49EF0[v22 + 1];
    }
    *(_DWORD *)buf = 136315138;
    v44[0] = v24;
    v11 = "failed to decode challenge: %s";
    goto LABEL_29;
  }
  dword_101B12A2C = 0;
  int v25 = DERDecoderParseSequence();
  if (v25)
  {
    int v26 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v26);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v25 + 1) > 8) {
      v27 = "DEREncoderError(No Decoding)";
    }
    else {
      v27 = off_101A49EF0[v25 + 1];
    }
    *(_DWORD *)buf = 136315138;
    v44[0] = v27;
    v11 = "failed to decode hash: %s";
    goto LABEL_29;
  }
  int v28 = DERDecoderParseSequence();
  if (v28)
  {
    uint64_t v29 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v29);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v28 + 1) > 8) {
      uint64_t v30 = "DEREncoderError(No Decoding)";
    }
    else {
      uint64_t v30 = off_101A49EF0[v28 + 1];
    }
    *(_DWORD *)buf = 136315138;
    v44[0] = v30;
    v11 = "failed to decode hash: %s";
    goto LABEL_29;
  }
  int v31 = DERDecoderParseSequence();
  if (v31)
  {
    uint64_t v32 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v6 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v32);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v31 + 1) > 8) {
      int v33 = "DEREncoderError(No Decoding)";
    }
    else {
      int v33 = off_101A49EF0[v31 + 1];
    }
    *(_DWORD *)buf = 136315138;
    v44[0] = v33;
    v11 = "failed to decode profileInfo: %s";
    goto LABEL_29;
  }
  int v34 = DERDecoderGetDataWithTag();
  if (v34)
  {
    uint64_t v35 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    long long v36 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      if ((v34 + 1) > 8) {
        v37 = "DEREncoderError(No Decoding)";
      }
      else {
        v37 = off_101A49EF0[v34 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v44[0] = v37;
      v40 = "profile to be deleted not present: %s";
      unsigned int v41 = v36;
      uint32_t v42 = 12;
      goto LABEL_65;
    }
  }
  else
  {
    v38 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v39 = *(NSObject **)((char *)v44 + 4);
    ctu::OsLogContext::~OsLogContext(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44[0]) = 0;
      v40 = "profile to be deleted present but had weird length: %ul";
      unsigned int v41 = v39;
      uint32_t v42 = 8;
LABEL_65:
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, v40, buf, v42);
    }
  }
  return &__NSDictionary0__struct;
}

- (id)decodeVinylObjectArray:(id)a3 num:(int)a4
{
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  *(_DWORD *)&v30[8] = 0;
  size_t __n = 0;
  uint64_t v29 = 0;
  unsigned int v28 = 0;
  *(void *)uint64_t v30 = [a3 length];
  [a3 bytes];
  [a3 length];
  int v6 = DERDecoderInitialize();
  if (v6)
  {
    BOOL v7 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v8 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if ((v6 + 1) > 8) {
        int v9 = "DEREncoderError(No Decoding)";
      }
      else {
        int v9 = off_101A49EF0[v6 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v39[0] = v9;
      int v13 = "failed to initiaze DERDecoder: %s";
LABEL_23:
      uint64_t v21 = v8;
      uint32_t v22 = 12;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v13, buf, v22);
      return 0;
    }
    return 0;
  }
  int v10 = DERDecoderParseSequence();
  if (v10)
  {
    v11 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v8 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if ((v10 + 1) > 8) {
        int v12 = "DEREncoderError(No Decoding)";
      }
      else {
        int v12 = off_101A49EF0[v10 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v39[0] = v12;
      int v13 = "failed to decode Vinyl Object Array: %s";
      goto LABEL_23;
    }
    return 0;
  }
  int v14 = DERDecoderParseSequence();
  if (v14)
  {
    unsigned int v15 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v8 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if ((v14 + 1) > 8) {
        char v16 = "DEREncoderError(No Decoding)";
      }
      else {
        char v16 = off_101A49EF0[v14 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v39[0] = v16;
      int v13 = "failed to decode Vinyl Object Array: %s";
      goto LABEL_23;
    }
    return 0;
  }
  uint64_t v17 = v33;
  dword_101B12A34 = v33;
  memcpy(&unk_101B10318, v32, v33);
  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &unk_101B10318, v17, 1, 0, 16, 1, &v32, 1, 0, 16, 1, &v30[4]);
  if (![(DERHelper *)self decodeVinylObject:&v32 data:&v29 len:&v28])
  {
    int v24 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v25 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    int v13 = "failed to decode Vinyl Object ";
    goto LABEL_29;
  }
  uint64_t v18 = __n;
  dword_101B12A30 = __n;
  if (__n >= 0x1389)
  {
    unsigned int v19 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v20 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39[0]) = dword_101B12A30;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "bd len too large : %ul", buf, 8u);
    }
    return 0;
  }
  memcpy(&unk_101B116A0, *(const void **)&v30[4], __n);
  +[NSData dataWithBytes:&unk_101B116A0 length:v18];
  if (![(DERHelper *)self decodeVinylObject:&v30[4] data:&v29 len:&v28])
  {
    v27 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v25 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v27);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    int v13 = "failed to decode 2nd Vinyl Object ";
LABEL_29:
    uint64_t v21 = v25;
    uint32_t v22 = 2;
    goto LABEL_24;
  }
  id result = [(DERHelper *)self decodeVinylBatchDescriptor:v29 length:v28];
  if (!result)
  {
    int v26 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v25 = *(NSObject **)((char *)v39 + 4);
    ctu::OsLogContext::~OsLogContext(v26);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    int v13 = "failed to decode Vinyl batch descriptor";
    goto LABEL_29;
  }
  return result;
}

- (char)convertChar:(char)a3
{
  char v3 = a3 - 48;
  if ((a3 - 48) >= 0xA)
  {
    int v4 = a3;
    if ((a3 - 97) > 5)
    {
      if ((a3 - 65) > 5)
      {
        ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v7, kCtLoggingSystemName, "der");
        int v5 = v8;
        ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v7);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v7[0] = 67109120;
          v7[1] = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "unrecognized char in CSN, %c", (uint8_t *)v7, 8u);
        }
        return 0;
      }
      else
      {
        return a3 - 55;
      }
    }
    else
    {
      return a3 - 87;
    }
  }
  return v3;
}

- (id)hexString:(id)a3
{
  unint64_t v5 = (unint64_t)[a3 length];
  unint64_t v6 = v5 >> 1;
  BOOL v7 = +[NSMutableString stringWithCapacity:v5 >> 1];
  if ([a3 characterAtIndex:0] == 53
    && [a3 characterAtIndex:1] == 57)
  {
    if (v5 >= 2)
    {
      unsigned int v8 = 1;
      unsigned int v9 = 1;
      do
      {
        -[NSMutableString appendString:](v7, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02X", (-[DERHelper convertChar:](self, "convertChar:", (char)[a3 characterAtIndex:v8])+ 16* -[DERHelper convertChar:](self, "convertChar:", (char)objc_msgSend(a3, "characterAtIndex:", v8 - 1)))));
        BOOL v10 = v6 > v9++;
        v8 += 2;
      }
      while (v10);
    }
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    v11 = v16;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "engineering CSN", buf, 2u);
    }
    if (v5 >= 2)
    {
      unsigned int v12 = 1;
      unsigned int v13 = 1;
      do
      {
        -[NSMutableString appendString:](v7, "appendString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%c", ([a3 characterAtIndex:v12]+ 16 * objc_msgSend(a3, "characterAtIndex:", v12 - 1)- 48)));
        BOOL v10 = v6 > v13++;
        v12 += 2;
      }
      while (v10);
    }
  }
  return +[NSString stringWithString:v7];
}

- (id)getl3
{
  return +[NSData dataWithBytes:&unk_101B10318 length:dword_101B12A34];
}

- (id)getBD
{
  return +[NSData dataWithBytes:&unk_101B116A0 length:dword_101B12A30];
}

- (BOOL)wrapL2L1:(const char *)a3 len3:(unsigned int)a4 data1:(const char *)a5 len1:(unsigned int)a6 data2:(const char *)a7 len2:(unsigned int)a8 outData:(char *)a9 outLen:(unsigned int *)a10
{
  char v16 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (v16)
  {
    uint64_t v17 = v16;
    *((_DWORD *)v16 + 3) = 0;
    sub_1004632FC(v16, 0, 0x10u, a3, a4, 1);
    sub_1004632FC(v17, 0, 0x10u, a5, a6, 1);
    BOOL v19 = a8 > (a7[(*((unsigned __int8 *)a7 + 1) ^ 0x80) + 3] + (a7[1] ^ 0x80) - 124);
    if (a8 > (a7[(*((unsigned __int8 *)a7 + 1) ^ 0x80) + 3] + (a7[1] ^ 0x80) - 124))
    {
      unsigned __int8 v18 = a7[(*((unsigned __int8 *)a7 + 1) ^ 0x80) + 3] + (a7[1] ^ 0x80) - 124;
      sub_1004632FC(v17, 0, 0x10u, &a7[v18], a8 - v18, 1);
      sub_100463664(v17, a9, a10);
    }
    else
    {
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v24, kCtLoggingSystemName, "der");
      uint64_t v21 = *(NSObject **)&v25[4];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FAILURE: unexpected length", (uint8_t *)&v24, 2u);
      }
    }
    sub_100463290(v17);
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v24, kCtLoggingSystemName, "der");
    int v20 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v24 = 136315138;
      *(void *)int v25 = "-[DERHelper wrapL2L1:len3:data1:len1:data2:len2:outData:outLen:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder II", (uint8_t *)&v24, 0xCu);
    }
    return 0;
  }
  return v19;
}

- (BOOL)generateProfileDescriptor:(char *)a3 outLen:(unsigned int *)a4
{
  unsigned int v13 = 0;
  int v14 = 0;
  uint64_t v12 = 0;
  __int16 v11 = 49;
  strcpy(v18, "Post-Paid");
  strcpy(v17, "T-mobile");
  BOOL v7 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  unsigned int v8 = v7;
  if (v7)
  {
    *((_DWORD *)v7 + 3) = 0;
    [(DERHelper *)self generateProfileTypeProvider:&v11 name:v18 outData:&v14 outLen:(char *)&v12 + 4];
    sub_1004632FC(v8, 0, 0x10u, v14, HIDWORD(v12), 1);
    if (v14)
    {
      free(v14);
      int v14 = 0;
    }
    [(DERHelper *)self generateProfileTypeProvider:&v11 name:v17 outData:&v14 outLen:(char *)&v12 + 4];
    sub_1004632FC(v8, 0, 0x10u, v14, HIDWORD(v12), 1);
    if (v14)
    {
      free(v14);
      int v14 = 0;
    }
    sub_1004632FC(v8, 0, 4u, objc_msgSend(-[DERHelper getProfileID](self, "getProfileID"), "bytes"), 0x10u, 0);
    sub_100463664(v8, &v13, (unsigned int *)&v12);
    [(DERHelper *)self wrapWithSequence:v13 len:v12 outData:a3 outLen:a4];
    if (v13)
    {
      free(v13);
      unsigned int v13 = 0;
    }
    sub_100463290(v8);
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v9 = *(NSObject **)&v16[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)char v16 = "-[DERHelper generateProfileDescriptor:outLen:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
  }
  return v8 != 0;
}

- (id)generateGetExpData
{
  uint64_t v8 = 0;
  unsigned int v9 = 0;
  uint64_t v7 = 0;
  char v3 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v3)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unint64_t v6 = *(NSObject **)&v11[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)__int16 v11 = "-[DERHelper generateGetExpData]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
    return 0;
  }
  int v4 = v3;
  *((_DWORD *)v3 + 3) = 0;
  sub_1004632FC(v3, 0, 4u, objc_msgSend(-[DERHelper getProfileID](self, "getProfileID"), "bytes"), 0x10u, 0);
  sub_100463664(v4, &v9, (unsigned int *)&v7 + 1);
  sub_100463290(v4);
  if ([(DERHelper *)self wrapWithSequence:v9 len:HIDWORD(v7) outData:&v8 outLen:&v7])
  {
    return +[NSData dataWithBytes:v8 length:v7];
  }
  id result = v9;
  if (v9)
  {
    free(v9);
    return 0;
  }
  return result;
}

- (BOOL)generateL3Token:(char *)a3 outLen:(unsigned int *)a4 type:(unsigned __int8)a5
{
  int v23 = 0;
  unsigned int v22 = 0;
  strcpy(__s, "steve@mac.com");
  __s[14] = 0;
  v21[5] = 0;
  strcpy(v21, "9:41");
  uint64_t v8 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v8)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned __int8 v18 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)int v25 = "-[DERHelper generateL3Token:outLen:type:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
    return 0;
  }
  unsigned int v9 = v8;
  *((_DWORD *)v8 + 3) = 0;
  sub_1004632FC(v8, 0, 0xCu, "InMemory", 8u, 0);
  BOOL v10 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v10)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    BOOL v19 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)int v25 = "-[DERHelper generateL3Token:outLen:type:]";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
LABEL_21:
    sub_100463290(v9);
    return 0;
  }
  __int16 v11 = v10;
  *((_DWORD *)v10 + 3) = 0;
  unsigned int v12 = strlen(__s);
  sub_1004632FC(v11, 0, 0xCu, __s, v12, 0);
  sub_100463664(v11, &v23, &v22);
  sub_100463290(v11);
  sub_1004632FC(v9, 2, 0, v23, v22, 1);
  if (v23)
  {
    free(v23);
    int v23 = 0;
  }
  unsigned int v13 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v13)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    BOOL v19 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)int v25 = "-[DERHelper generateL3Token:outLen:type:]";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  int v14 = v13;
  *((_DWORD *)v13 + 3) = 0;
  unsigned int v15 = strlen(v21);
  sub_1004632FC(v14, 0, 0xCu, v21, v15, 0);
  sub_100463664(v14, &v23, &v22);
  sub_100463290(v14);
  sub_1004632FC(v9, 2, 1u, v23, v22, 1);
  if (v23)
  {
    free(v23);
    int v23 = 0;
  }
  sub_100463664(v9, &v23, &v22);
  sub_100463290(v9);
  BOOL v16 = [(DERHelper *)self wrapWithSequence:v23 len:v22 outData:a3 outLen:a4];
  if (!v16)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    uint64_t v17 = *(NSObject **)&v25[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)int v25 = "-[DERHelper generateL3Token:outLen:type:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Failed to wrap with Sequence", buf, 0xCu);
    }
  }
  if (v23)
  {
    free(v23);
    int v23 = 0;
  }
  sub_100463290(v14);
  return v16;
}

- (id)generateSignIdMap:(id)a3
{
  int v31 = 0;
  uint64_t v32 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"opType"), "isEqualToString:", @"EXPORT"))-[DERHelper setProfileID:](self, "setProfileID:", objc_msgSend(a3, "objectForKey:", @"profileid")); {
  unint64_t v5 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  }
  if (!v5)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    uint64_t v7 = *(NSObject **)&v34[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    }
    return 0;
  }
  unint64_t v6 = v5;
  *((_DWORD *)v5 + 3) = 0;
  if ((objc_msgSend(objc_msgSend(a3, "objectForKey:", @"opType"), "isEqualToString:", @"COMMAND") & 1) == 0)
  {
    if ([(DERHelper *)self generateL3Token:&v31 outLen:&v28 type:0])
    {
      sub_1004632FC(v6, 2, 0, v31, v28, 1);
      if (v31)
      {
        free(v31);
        int v31 = 0;
      }
    }
    else
    {
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      unsigned int v9 = *(NSObject **)&v34[4];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "failed to generate L3 token", buf, 2u);
      }
    }
    if ([(DERHelper *)self generateL3Token:&v31 outLen:&v28 type:0])
    {
      sub_1004632FC(v6, 2, 1u, v31, v28, 1);
      if (v31)
      {
        free(v31);
        int v31 = 0;
      }
    }
    else
    {
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      BOOL v10 = *(NSObject **)&v34[4];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "failed to generate L3 token", buf, 2u);
      }
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"opType"), "isEqualToString:", @"EXPORT"))
  {
    __int16 v11 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
    if (!v11)
    {
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      int v23 = *(NSObject **)&v34[4];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
      goto LABEL_48;
    }
    unsigned int v12 = v11;
    *((_DWORD *)v11 + 3) = 0;
    -[DERHelper generateProfileTypeProvider:name:outData:outLen:](self, "generateProfileTypeProvider:name:outData:outLen:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerID_Type"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerType"), "UTF8String"), &v32, (char *)&v28 + 4);
    sub_1004632FC(v12, 0, 0x10u, v32, HIDWORD(v28), 1);
    if (v32)
    {
      free(v32);
      uint64_t v32 = 0;
    }
    -[DERHelper generateProfileTypeProvider:name:outData:outLen:](self, "generateProfileTypeProvider:name:outData:outLen:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerID_Name"), "UTF8String"), objc_msgSend(objc_msgSend(a3, "objectForKey:", @"providerName"), "UTF8String"), &v32, (char *)&v28 + 4);
    sub_1004632FC(v12, 0, 0x10u, v32, HIDWORD(v28), 1);
    if (v32)
    {
      free(v32);
      uint64_t v32 = 0;
    }
    sub_1004632FC(v12, 0, 4u, objc_msgSend(-[DERHelper getProfileID](self, "getProfileID"), "bytes"), 0x10u, 0);
    sub_100463664(v12, &v30, (unsigned int *)&v27 + 1);
    sub_100463290(v12);
    [(DERHelper *)self wrapWithSequence:v30 len:HIDWORD(v27) outData:&v32 outLen:(char *)&v28 + 4];
    sub_1004632FC(v6, 2, 2u, v32, HIDWORD(v28), 1);
    if (v32)
    {
      free(v32);
      uint64_t v32 = 0;
    }
    if (v30)
    {
      free(v30);
      uint64_t v30 = 0;
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"opType"), "isEqualToString:", @"EXPORT"))
  {
    unsigned int v13 = 1;
  }
  else if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"opType"), "isEqualToString:", @"COMMAND"))
  {
    unsigned int v13 = 3;
  }
  else
  {
    unsigned int v13 = 0;
  }
  int v14 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v14)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v23 = *(NSObject **)&v34[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder", buf, 0xCu);
    goto LABEL_49;
  }
  unsigned int v15 = v14;
  *((_DWORD *)v14 + 3) = 0;
  sub_1004635EC(v14, 0, 0xAu, v13);
  sub_100463664(v15, &v30, (unsigned int *)&v27 + 1);
  sub_1004632FC(v6, 2, 3u, v30, HIDWORD(v27), 1);
  if (v30)
  {
    free(v30);
    uint64_t v30 = 0;
  }
  BOOL v16 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (!v16)
  {
    sub_100463290(v15);
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v23 = *(NSObject **)&v34[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
    goto LABEL_48;
  }
  uint64_t v17 = v16;
  *((_DWORD *)v16 + 3) = 0;
  sub_100463290(v15);
  id v18 = (id)MGCopyAnswer();
  id v19 = (id)MGCopyAnswer();
  int v20 = sub_100C5786C(@"kSerialNumber", v18);
  sub_1004632FC(v17, 0, 0x10u, [(NSData *)v20 bytes], [(NSData *)v20 length], 1);
  uint64_t v21 = sub_100C5786C(@"kIMEI", v19);
  sub_1004632FC(v17, 0, 0x10u, [(NSData *)v21 bytes], [(NSData *)v21 length], 1);
  sub_100463664(v17, &v30, (unsigned int *)&v27 + 1);
  sub_100463290(v17);
  if (![(DERHelper *)self wrapWithSequence:v30 len:HIDWORD(v27) outData:&v29 outLen:&v27])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    int v25 = *(NSObject **)&v34[4];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Failed to wrap with Sequence", buf, 0xCu);
    }
    if (v30)
    {
      free(v30);
      uint64_t v8 = 0;
      uint64_t v30 = 0;
      goto LABEL_50;
    }
LABEL_49:
    uint64_t v8 = 0;
LABEL_50:
    sub_100463290(v6);
    return v8;
  }
  sub_1004632FC(v6, 2, 5u, v29, v27, 1);
  sub_100463664(v6, &v32, (unsigned int *)&v28 + 1);
  sub_100463290(v6);
  unsigned int v22 = (uint64_t *)malloc_type_calloc(0x10uLL, 1uLL, 0xBCCD4226uLL);
  if (v22)
  {
    unint64_t v6 = v22;
    *((_DWORD *)v22 + 3) = 0;
    sub_1004632FC(v22, 0, 0x10u, v32, HIDWORD(v28), 1);
    if (v32)
    {
      free(v32);
      uint64_t v32 = 0;
    }
    sub_100463664(v6, &v32, (unsigned int *)&v28 + 1);
    uint64_t v8 = +[NSData dataWithBytes:v32 length:HIDWORD(v28)];
    goto LABEL_50;
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
  int v26 = *(NSObject **)&v34[4];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v34 = "-[DERHelper generateSignIdMap:]";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Failed to create DER encoder II", buf, 0xCu);
  }
  if (v32) {
    free(v32);
  }
  return 0;
}

- (BOOL)decodeOptions:(unsigned __int8)a3 data:(id)a4
{
  int v5 = a3;
  v36[0] = 0;
  v36[1] = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v29 = 0;
  int v28 = 0;
  unsigned int v31 = 0;
  [a4 bytes];
  [a4 length];
  int v7 = DERDecoderInitialize();
  if (v7)
  {
    uint64_t v8 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v9 = *(NSObject **)((char *)v38 + 4);
    ctu::OsLogContext::~OsLogContext(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((v7 + 1) > 8) {
        BOOL v10 = "DEREncoderError(No Decoding)";
      }
      else {
        BOOL v10 = off_101A49EF0[v7 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v38[0] = v10;
      int v14 = "failed to initiaze DERDecoder: %s";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
      return 0;
    }
    return 0;
  }
  int v11 = DERDecoderParseSequence();
  if (v11)
  {
    unsigned int v12 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v9 = *(NSObject **)((char *)v38 + 4);
    ctu::OsLogContext::~OsLogContext(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((v11 + 1) > 8) {
        unsigned int v13 = "DEREncoderError(No Decoding)";
      }
      else {
        unsigned int v13 = off_101A49EF0[v11 + 1];
      }
      *(_DWORD *)buf = 136315138;
      v38[0] = v13;
      int v14 = "failed to decode Vinyl Object Array: %s";
      goto LABEL_21;
    }
    return 0;
  }
  unsigned int v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0, 1, 0, 16, 1, &v32);
  if (v5 == 3) {
    [(DERHelper *)self setPcfDict:v15];
  }
  int v30 = 0;
  unsigned int v31 = v33;
  int v16 = DERDecoderInitialize();
  if (v31)
  {
    int v17 = v16;
    unsigned int v18 = 0;
    while (1)
    {
      if (v17)
      {
        int v24 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
        unsigned int v9 = *(NSObject **)((char *)v38 + 4);
        ctu::OsLogContext::~OsLogContext(v24);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        if ((v17 + 1) > 8) {
          int v25 = "DEREncoderError(No Decoding)";
        }
        else {
          int v25 = off_101A49EF0[v17 + 1];
        }
        *(_DWORD *)buf = 136315138;
        v38[0] = v25;
        int v14 = "failed to initiaze DERDecoder: %s";
        goto LABEL_21;
      }
      int v19 = DERDecoderParseSequence();
      if (v19) {
        break;
      }
      -[DERHelper decodeVinylObject:data:len:](self, "decodeVinylObject:data:len:", v36, &v29, &v28, 1, 0, 16, 1, v36);
      v18 += v30;
      int v30 = 0;
      int v17 = DERDecoderInitialize();
      if (v18 >= v31) {
        goto LABEL_25;
      }
    }
    int v26 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v9 = *(NSObject **)((char *)v38 + 4);
    ctu::OsLogContext::~OsLogContext(v26);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v19 + 1) > 8) {
      uint64_t v27 = "DEREncoderError(No Decoding)";
    }
    else {
      uint64_t v27 = off_101A49EF0[v19 + 1];
    }
    *(_DWORD *)buf = 136315138;
    v38[0] = v27;
    int v14 = "failed to decode Vinyl Object Array: %s";
    goto LABEL_21;
  }
  unsigned int v18 = 0;
LABEL_25:
  unsigned int v22 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
  int v23 = *(NSObject **)((char *)v38 + 4);
  ctu::OsLogContext::~OsLogContext(v22);
  BOOL v20 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v38[0]) = v18;
    WORD2(v38[0]) = 1024;
    *(_DWORD *)((char *)v38 + 6) = v31;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "reaching the end << %u %u", buf, 0xEu);
  }
  return v20;
}

- (id)dictionaryWithDecodingReceipt:(id)a3
{
  char v3 = (NSMutableDictionary *)a3;
  if (a3)
  {
    unsigned int v25 = [a3 length];
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    [(NSMutableDictionary *)v3 bytes];
    [(NSMutableDictionary *)v3 length];
    int v4 = DERDecoderInitialize();
    if (v4)
    {
      int v5 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v29, kCtLoggingSystemName, "der");
      unint64_t v6 = *((void *)&v29 + 1);
      ctu::OsLogContext::~OsLogContext(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((v4 + 1) > 8) {
          int v7 = "DEREncoderError(No Decoding)";
        }
        else {
          int v7 = off_101A49EF0[v4 + 1];
        }
        LODWORD(v29) = 136315138;
        *(void *)((char *)&v29 + 4) = v7;
        int v11 = "failed to initialize receipt decoder: %s";
        unsigned int v12 = (uint8_t *)&v29;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v11, v12, 0xCu);
        return 0;
      }
      return 0;
    }
    long long v29 = 0uLL;
    int v8 = DERDecoderParseSequence();
    if (v8)
    {
      unsigned int v9 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v28, kCtLoggingSystemName, "der");
      unint64_t v6 = *((void *)&v28 + 1);
      ctu::OsLogContext::~OsLogContext(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((v8 + 1) > 8) {
          BOOL v10 = "DEREncoderError(No Decoding)";
        }
        else {
          BOOL v10 = off_101A49EF0[v8 + 1];
        }
        LODWORD(v28) = 136315138;
        *(void *)((char *)&v28 + 4) = v10;
        int v11 = "failed to parse vinyl profile option sequence: %s";
        unsigned int v12 = (uint8_t *)&v28;
        goto LABEL_21;
      }
      return 0;
    }
    long long v28 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    int v13 = DERDecoderParseSequence();
    if (v13)
    {
      int v14 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      unint64_t v6 = *(NSObject **)&v27[4];
      ctu::OsLogContext::~OsLogContext(v14);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((v13 + 1) > 8) {
          unsigned int v15 = "DEREncoderError(No Decoding)";
        }
        else {
          unsigned int v15 = off_101A49EF0[v13 + 1];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v27 = v15;
        int v11 = "failed to decode vinyl receipt sequence: %s";
        unsigned int v12 = buf;
        goto LABEL_21;
      }
      return 0;
    }
    buf[0] = 48;
    buf[1] = BYTE8(v28);
    int v16 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", buf, 2, 1, 0, 16, 1, &v28, 0, 2, 0, 1, &v22, 1, 0, 10, 0, &v21,
            1,
            0,
            10,
            0,
            &v20,
            0,
            0,
            4,
            0,
            &v19,
            0,
            0,
            16,
            1,
            &v18);
    [(NSMutableData *)v16 appendBytes:(void)v28 length:DWORD2(v28)];
    char v3 = +[NSMutableDictionary dictionaryWithCapacity:3];
    [(NSMutableDictionary *)v3 setValue:sub_100C58224() forKey:@"batchDescriptorId"];
    [(NSMutableDictionary *)v3 setValue:sub_100C583C8(&v22) forKey:@"ProfileID"];
    [(NSMutableDictionary *)v3 setValue:sub_100C59AAC() forKey:@"OperationType"];
    [(NSMutableDictionary *)v3 setValue:sub_100C59AAC() forKey:@"batchDescriptorId"];
    [(NSMutableDictionary *)v3 setValue:sub_100C583C8(&v19) forKey:@"statusWord"];
    [(NSMutableDictionary *)v3 setValue:sub_100C584EC((uint64_t)&v18) forKey:@"MetaData"];
    [(NSMutableDictionary *)v3 setValue:v16 forKey:@"batchDescriptorIdRaw"];
  }
  return v3;
}

- (id)arrayWithDecodingReceiptsList:(id)a3
{
  unsigned int v26 = [a3 length];
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (v26 <= 2)
  {
    int v4 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v29, kCtLoggingSystemName, "der");
    int v5 = *((void *)&v29 + 1);
    ctu::OsLogContext::~OsLogContext(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      unint64_t v6 = "empty receipts";
      int v7 = (uint8_t *)&v29;
      int v8 = v5;
      uint32_t v9 = 2;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v6, v7, v9);
    }
    return 0;
  }
  [a3 bytes];
  [a3 length];
  int v10 = DERDecoderInitialize();
  if (v10)
  {
    int v11 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v29, kCtLoggingSystemName, "der");
    unsigned int v12 = *((void *)&v29 + 1);
    ctu::OsLogContext::~OsLogContext(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v10 + 1) > 8) {
      int v13 = "DEREncoderError(No Decoding)";
    }
    else {
      int v13 = off_101A49EF0[v10 + 1];
    }
    LODWORD(v29) = 136315138;
    *(void *)((char *)&v29 + 4) = v13;
    unint64_t v6 = "failed to initialize receipts list decoder: %s";
    int v7 = (uint8_t *)&v29;
LABEL_24:
    int v8 = v12;
    uint32_t v9 = 12;
    goto LABEL_25;
  }
  long long v29 = 0uLL;
  int v14 = DERDecoderParseSequence();
  if (v14)
  {
    unsigned int v15 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v12 = *(NSObject **)&v28[4];
    ctu::OsLogContext::~OsLogContext(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((v14 + 1) > 8) {
      int v16 = "DEREncoderError(No Decoding)";
    }
    else {
      int v16 = off_101A49EF0[v14 + 1];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)long long v28 = v16;
    unint64_t v6 = "failed to decode container receipts list: %s";
    goto LABEL_23;
  }
  unsigned int v23 = 0;
  int Count = DERDecoderGetCount();
  if (Count)
  {
    long long v18 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unsigned int v12 = *(NSObject **)&v28[4];
    ctu::OsLogContext::~OsLogContext(v18);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    if ((Count + 1) > 8) {
      long long v19 = "DEREncoderError(No Decoding)";
    }
    else {
      long long v19 = off_101A49EF0[Count + 1];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)long long v28 = v19;
    unint64_t v6 = "failed to get count for object array: %s";
LABEL_23:
    int v7 = buf;
    goto LABEL_24;
  }
  long long v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v23, 1, 0, 16, 1, &v29);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100C589A4;
  v22[3] = &unk_101A49D80;
  v22[4] = v20;
  sub_100C51740((uint64_t)&v29, v23, (uint64_t)v22);
  return v20;
}

- (id)parseInfo:(id)a3
{
  memset(v35, 0, sizeof(v35));
  HIDWORD(v33) = 0;
  uint64_t v34 = 0;
  [a3 bytes];
  [a3 length];
  int v5 = DERDecoderInitialize();
  if (v5)
  {
    unint64_t v6 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
    int v7 = *((void *)&buf + 1);
    ctu::OsLogContext::~OsLogContext(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ((v5 + 1) > 8) {
        int v8 = "DEREncoderError(No Decoding)";
      }
      else {
        int v8 = off_101A49EF0[v5 + 1];
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v8;
      unsigned int v12 = "failed to initiaze DERDecoder: %s";
      goto LABEL_25;
    }
  }
  else
  {
    int v9 = DERDecoderParseSequence();
    if (v9)
    {
      int v10 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
      int v7 = *((void *)&buf + 1);
      ctu::OsLogContext::~OsLogContext(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if ((v9 + 1) > 8) {
          int v11 = "DEREncoderError(No Decoding)";
        }
        else {
          int v11 = off_101A49EF0[v9 + 1];
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v11;
        unsigned int v12 = "failed to decode Vinyl Object Array: %s";
        goto LABEL_25;
      }
    }
    else
    {
      int v13 = DERDecoderParseSequence();
      if (v13)
      {
        int v14 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
        int v7 = *((void *)&buf + 1);
        ctu::OsLogContext::~OsLogContext(v14);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          if ((v13 + 1) > 8) {
            unsigned int v15 = "DEREncoderError(No Decoding)";
          }
          else {
            unsigned int v15 = off_101A49EF0[v13 + 1];
          }
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v15;
          unsigned int v12 = "failed to decode Vinyl Object Array: %s";
          goto LABEL_25;
        }
      }
      else if (-[DERHelper decodeVinylObject:data:len:](self, "decodeVinylObject:data:len:", v35, &v34, (char *)&v33 + 4, 1, 0, 16, 1, v35))
      {
        int v16 = +[NSData dataWithBytes:v34 length:HIDWORD(v33)];
        unsigned int v38 = [(NSData *)v16 length];
        memset(v37, 0, sizeof(v37));
        if (v38 > 2)
        {
          [(NSData *)v16 bytes];
          [(NSData *)v16 length];
          int v24 = DERDecoderInitialize();
          if (v24)
          {
            uint64_t v25 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
            int v7 = *((void *)&buf + 1);
            ctu::OsLogContext::~OsLogContext(v25);
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
              return 0;
            }
            if ((v24 + 1) > 8) {
              unsigned int v26 = "DEREncoderError(No Decoding)";
            }
            else {
              unsigned int v26 = off_101A49EF0[v24 + 1];
            }
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v26;
            unsigned int v12 = "failed to initialize Info decoder: %s";
            goto LABEL_25;
          }
          int v27 = DERDecoderParseSequence();
          if (v27)
          {
            long long v28 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
            int v7 = *((void *)&buf + 1);
            ctu::OsLogContext::~OsLogContext(v28);
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
              return 0;
            }
            if ((v27 + 1) > 8) {
              long long v29 = "DEREncoderError(No Decoding)";
            }
            else {
              long long v29 = off_101A49EF0[v27 + 1];
            }
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v29;
            unsigned int v12 = "failed to decode container info list: %s";
            goto LABEL_25;
          }
          unsigned int v36 = 0;
          int Count = DERDecoderGetCount();
          if (!Count)
          {
            long long v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v36, 1, 0, 16, 1, v37);
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            v40 = sub_100C5B41C;
            unsigned int v41 = &unk_101A49D80;
            uint32_t v42 = v22;
            sub_100C51740((uint64_t)v37, v36, (uint64_t)&buf);
            return v22;
          }
          unsigned int v31 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
          int v7 = *((void *)&buf + 1);
          ctu::OsLogContext::~OsLogContext(v31);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            if ((Count + 1) > 8) {
              uint64_t v32 = "DEREncoderError(No Decoding)";
            }
            else {
              uint64_t v32 = off_101A49EF0[Count + 1];
            }
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v32;
            unsigned int v12 = "failed to get count for object array: %s";
            goto LABEL_25;
          }
        }
        else
        {
          int v17 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
          long long v18 = *((void *)&buf + 1);
          ctu::OsLogContext::~OsLogContext(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            unsigned int v12 = "empty info";
            long long v19 = v18;
            uint32_t v20 = 2;
LABEL_26:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v12, (uint8_t *)&buf, v20);
          }
        }
      }
      else
      {
        long long v21 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&buf, kCtLoggingSystemName, "der");
        int v7 = *((void *)&buf + 1);
        ctu::OsLogContext::~OsLogContext(v21);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "kDERDecoderErrorNone";
          unsigned int v12 = "failed to decode Vinyl Object Array for Info: %s";
LABEL_25:
          long long v19 = v7;
          uint32_t v20 = 12;
          goto LABEL_26;
        }
      }
    }
  }
  return 0;
}

- (id)dictionaryWithDecodingProfile:(id)a3
{
  [a3 bytes];
  [a3 length];
  int v4 = DERDecoderInitialize();
  if (v4)
  {
    int v5 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
    unint64_t v6 = *(NSObject **)&v23[4];
    ctu::OsLogContext::~OsLogContext(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((v4 + 1) > 8) {
        int v7 = "DEREncoderError(No Decoding)";
      }
      else {
        int v7 = off_101A49EF0[v4 + 1];
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)unsigned int v23 = v7;
      int v11 = "failed to initialize DERDecoder: %s";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    }
  }
  else
  {
    int v8 = DERDecoderParseSequence();
    if (v8)
    {
      int v9 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
      unint64_t v6 = *(NSObject **)&v23[4];
      ctu::OsLogContext::~OsLogContext(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((v8 + 1) > 8) {
          int v10 = "DEREncoderError(No Decoding)";
        }
        else {
          int v10 = off_101A49EF0[v8 + 1];
        }
        *(_DWORD *)long long buf = 136315138;
        *(void *)unsigned int v23 = v10;
        int v11 = "failed to decode Vinyl Profile (outer SEQ): %s";
        goto LABEL_35;
      }
    }
    else
    {
      int v12 = DERDecoderParseSequence();
      if (v12)
      {
        int v13 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
        unint64_t v6 = *(NSObject **)&v23[4];
        ctu::OsLogContext::~OsLogContext(v13);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          if ((v12 + 1) > 8) {
            int v14 = "DEREncoderError(No Decoding)";
          }
          else {
            int v14 = off_101A49EF0[v12 + 1];
          }
          *(_DWORD *)long long buf = 136315138;
          *(void *)unsigned int v23 = v14;
          int v11 = "failed to decode Vinyl Profile (inner SEQ): %s";
          goto LABEL_35;
        }
      }
      else
      {
        int v15 = DERDecoderParseSequence();
        if (v15)
        {
          int v16 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          unint64_t v6 = *(NSObject **)&v23[4];
          ctu::OsLogContext::~OsLogContext(v16);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            if ((v15 + 1) > 8) {
              int v17 = "DEREncoderError(No Decoding)";
            }
            else {
              int v17 = off_101A49EF0[v15 + 1];
            }
            *(_DWORD *)long long buf = 136315138;
            *(void *)unsigned int v23 = v17;
            int v11 = "failed to decode Vinyl Profile (Main Profile): %s";
            goto LABEL_35;
          }
        }
        else
        {
          if (*(char *)(DERDecoderGetBuffer() + 1) < 0) {
            DERDecoderGetBuffer();
          }
          DERDecoderGetBufferLength();
          DERDecoderInitialize();
          int v18 = DERDecoderParseSequence();
          if (!v18) {
            return sub_100C595E0();
          }
          long long v19 = (ctu::OsLogContext *)ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, kCtLoggingSystemName, "der");
          unint64_t v6 = *(NSObject **)&v23[4];
          ctu::OsLogContext::~OsLogContext(v19);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            if ((v18 + 1) > 8) {
              uint32_t v20 = "DEREncoderError(No Decoding)";
            }
            else {
              uint32_t v20 = off_101A49EF0[v18 + 1];
            }
            *(_DWORD *)long long buf = 136315138;
            *(void *)unsigned int v23 = v20;
            int v11 = "4. failed to decode Vinyl Profile (Main Profile): %s";
            goto LABEL_35;
          }
        }
      }
    }
  }
  return 0;
}

- (NSData)otc
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOtc:(id)a3
{
}

- (NSMutableDictionary)pcfDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPcfDict:(id)a3
{
}

- (unsigned)svn
{
  return self->_svn;
}

- (void)setSvn:(unsigned int)a3
{
  self->_svn = a3;
}

@end