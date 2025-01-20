@interface NEDNSResourceRecord
- (NSString)name;
- (NSString)resourceString;
- (int64_t)recordClass;
- (int64_t)type;
- (unint64_t)dataLength;
- (unint64_t)timeToLive;
- (void)initFromByteParser:(void *)a1;
@end

@implementation NEDNSResourceRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceString, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)resourceString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void)initFromByteParser:(void *)a1
{
  v3 = a2;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_27;
  }
  unsigned __int8 v46 = 1;
  v45.receiver = a1;
  v45.super_class = (Class)NEDNSResourceRecord;
  v5 = objc_msgSendSuper2(&v45, sel_init);
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v6 = [(NEByteParser *)v3 parseDomainName];
  v7 = (void *)v5[2];
  v5[2] = v6;

  if (!v5[2])
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR name";
LABEL_23:
    _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_24;
  }
  v5[1] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR type";
    goto LABEL_23;
  }
  v5[3] = -[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
  if (!v46)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR class";
    goto LABEL_23;
  }
  v5[4] = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
  if (v46)
  {
    v8 = (const char *)-[NEByteParser parse16Bits:]((uint64_t)v3, &v46);
    v5[5] = v8;
    if (v46)
    {
      uint64_t v9 = v5[1];
      switch(v9)
      {
        case 1:
          if (v8 != 4) {
            goto LABEL_25;
          }
          uint64_t v10 = -[NEByteParser parseAddressWithFamily:]((uint64_t)v3, 2);
          v11 = (void *)v5[6];
          v5[6] = v10;

          if (v5[6]) {
            goto LABEL_72;
          }
          v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR A address";
          goto LABEL_23;
        case 2:
          uint64_t v18 = [(NEByteParser *)v3 parseDomainName];
          v19 = (void *)v5[6];
          v5[6] = v18;

          if (v5[6]) {
            goto LABEL_72;
          }
          v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR NS";
          goto LABEL_23;
        case 3:
        case 4:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          goto LABEL_72;
        case 5:
          uint64_t v20 = [(NEByteParser *)v3 parseDomainName];
          v21 = (void *)v5[6];
          v5[6] = v20;

          if (v5[6]) {
            goto LABEL_72;
          }
          v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR CNAME";
          goto LABEL_23;
        case 6:
          uint64_t v22 = [(NEByteParser *)v3 parseDomainName];
          if (!v22)
          {
            v12 = ne_log_obj();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_24;
            }
            *(_WORD *)buf = 0;
            v13 = "Failed to parse RR SOA main name";
            goto LABEL_23;
          }
          v24 = (void *)v22;
          v25 = [(NEByteParser *)v3 parseDomainName];
          if (!v25)
          {
            v37 = ne_log_obj();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA responsible name";
            goto LABEL_69;
          }
          uint64_t v26 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            v37 = ne_log_obj();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA serial number";
            goto LABEL_69;
          }
          uint64_t v27 = v26;
          uint64_t v28 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            v37 = ne_log_obj();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA refresh interval";
            goto LABEL_69;
          }
          uint64_t v29 = v28;
          uint64_t v30 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            v37 = ne_log_obj();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA retry interval";
            goto LABEL_69;
          }
          uint64_t v31 = v30;
          uint64_t v32 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          if (!v46)
          {
            v37 = ne_log_obj();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA expire interval";
            goto LABEL_69;
          }
          uint64_t v33 = v32;
          uint64_t v34 = -[NEByteParser parse32Bits:]((uint64_t)v3, &v46);
          int v35 = v46;
          if (v46)
          {
            uint64_t v36 = [[NSString alloc] initWithFormat:@"%@ %@ %u %u %u %u %u", v24, v25, v27, v29, v31, v33, v34];
            v37 = v5[6];
            v5[6] = v36;
            goto LABEL_71;
          }
          v37 = ne_log_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA minimum TTL";
LABEL_69:
            _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
LABEL_70:
          int v35 = 0;
LABEL_71:

          if (!v35) {
            goto LABEL_25;
          }
LABEL_72:
          v14 = v5;
          break;
        case 12:
          uint64_t v38 = [(NEByteParser *)v3 parseDomainName];
          v39 = (void *)v5[6];
          v5[6] = v38;

          if (v5[6]) {
            goto LABEL_72;
          }
          v12 = ne_log_obj();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR PTR";
          goto LABEL_23;
        default:
          if (v9 == 16)
          {
            uint64_t v40 = -[NEByteParser parseBytes:]((uint64_t)v3, v8);
            if (v40)
            {
              uint64_t v41 = [[NSString alloc] initWithBytes:v40 length:v5[5] encoding:4];
              v42 = (void *)v5[6];
              v5[6] = v41;

              goto LABEL_72;
            }
            v12 = ne_log_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v13 = "Failed to parse RR TXT";
              goto LABEL_23;
            }
          }
          else
          {
            if (v9 != 28) {
              goto LABEL_72;
            }
            if (v8 != 16) {
              goto LABEL_25;
            }
            uint64_t v16 = -[NEByteParser parseAddressWithFamily:]((uint64_t)v3, 30);
            v17 = (void *)v5[6];
            v5[6] = v16;

            if (v5[6]) {
              goto LABEL_72;
            }
            v12 = ne_log_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v13 = "Failed to parse RR AAAA address";
              goto LABEL_23;
            }
          }
          goto LABEL_24;
      }
      goto LABEL_26;
    }
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR length";
    goto LABEL_23;
  }
  v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR TTL";
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  v14 = 0;
LABEL_26:

LABEL_27:
  return v14;
}

@end