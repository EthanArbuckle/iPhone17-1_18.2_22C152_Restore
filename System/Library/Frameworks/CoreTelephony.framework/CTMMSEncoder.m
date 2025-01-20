@interface CTMMSEncoder
+ (id)decodeMessageFromData:(id)a3;
+ (id)decodeMessageFromData:(id)a3 data:(id)a4;
+ (id)decodeSmsFromData:(id)a3;
+ (id)decodeSmsFromData:(id)a3 data:(id)a4;
+ (id)encodeMessage:(id)a3;
+ (id)encodeSms:(id)a3;
@end

@implementation CTMMSEncoder

+ (id)decodeSmsFromData:(id)a3
{
  id v4 = a3;
  v5 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];
  v6 = [a1 decodeSmsFromData:v5 data:v4];

  return v6;
}

+ (id)decodeSmsFromData:(id)a3 data:(id)a4
{
  id v5 = a3;
  memset(&v32, 0, sizeof(v32));
  uint64_t v33 = 0;
  memset(&v31, 0, sizeof(v31));
  memset(&v30, 0, sizeof(v30));
  memset(&__p, 0, sizeof(__p));
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  id v6 = a4;
  MMSPduDecoder::MMSPduDecoder((ctu::OsLogLogger *)v27, [v6 bytes], objc_msgSend(v6, "length"), 1);
  if (MMSPduDecoder::decodeSms((MMSPduDecoder *)v27, &v33, &v32, &v31, &v30, &__p))
  {
    v7 = [CTMessage alloc];
    v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v33];
    v9 = [(CTMessage *)v7 initWithDate:v8];

    [(CTMessage *)v9 setContext:v5];
    [(CTMessage *)v9 setMessageType:1];
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v10 = &v32;
    }
    else {
      v10 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    v11 = [NSString stringWithUTF8String:v10];
    if (+[CTPhoneNumber isValidPhoneNumber:v11]) {
      +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", [v5 slotID], v11, @"1");
    }
    else {
    v12 = +[CTAsciiAddress asciiAddressWithString:v11];
    }
    [(CTMessage *)v9 setSender:v12];

    std::string::size_type size = HIBYTE(v30.__r_.__value_.__r.__words[2]);
    if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v30.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      uint64_t v14 = [v5 slotID];
      if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v15 = &v30;
      }
      else {
        v15 = (std::string *)v30.__r_.__value_.__r.__words[0];
      }
      v16 = [NSString stringWithUTF8String:v15];
      v17 = +[CTPhoneNumber phoneNumberWithDigits:v14 digits:v16 countryCode:@"1"];
      [(CTMessage *)v9 setServiceCenter:v17];
    }
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v18 = &v31;
    }
    else {
      v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    v19 = [NSString stringWithUTF8String:v18];
    id v20 = [(CTMessage *)v9 addText:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F29128]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v23 = [NSString stringWithUTF8String:p_p];
    v24 = (void *)[v21 initWithUUIDString:v23];

    [(CTMessage *)v9 setUniqueIdentifier:v24];
    unsigned int v26 = 0;
    if (MMSPduDecoder::decodeWspIntegerValue((MMSPduDecoder *)v27, &v26)) {
      [(CTMessage *)v9 setReplaceMessage:v26];
    }
  }
  else
  {
    v9 = 0;
  }
  MEMORY[0x18531F300](v27);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }

  return v9;
}

+ (id)encodeSms:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(v62, 0, sizeof(v62));
  long long v61 = 0u;
  long long v60 = 0u;
  long long v59 = 0u;
  long long v58 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v48 = 0u;
  memset(v46, 0, sizeof(v46));
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  char v47 = 0;
  char v31 = 0;
  id v4 = [v3 recipients];
  id v5 = [v4 objectAtIndex:0];
  id v6 = [v5 canonicalFormat];

  if ([v6 getCString:&v47 maxLength:255 encoding:4])
  {
    v7 = [v3 items];
    v8 = [v7 objectAtIndex:0];

    __dst = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v9 = [v8 data];
    v10 = (void *)[v9 bytes];
    uint64_t v11 = [v8 data];
    std::string::basic_string[abi:nn180100](&__dst, v10, [(id)v11 length]);

    v12 = [v3 serviceCenter];
    LOBYTE(v11) = v12 == 0;

    if ((v11 & 1) != 0
      || ([v3 serviceCenter],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 formatForCallingCountry:@"1"],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 getCString:&v31 maxLength:255 encoding:4],
          v14,
          v13,
          (v15 & 1) != 0))
    {
      uint64_t v16 = HIBYTE(v30);
      if (v30 < 0) {
        uint64_t v16 = v29;
      }
      if (v16)
      {
        uint64_t v27 = 0;
        *(_OWORD *)std::string __p = 0u;
        long long v26 = 0u;
        MMSPduEncoder::MMSPduEncoder((MMSPduEncoder *)__p);
        if (v30 >= 0) {
          p_dst = (const char *)&__dst;
        }
        else {
          p_dst = (const char *)__dst;
        }
        MMSPduEncoder::encodeSms((MMSPduEncoder *)__p, 0, &v47, p_dst, &v31, "");
        if (v26 >= 0) {
          v18 = &__p[1];
        }
        else {
          v18 = (void **)__p[1];
        }
        if (v26 >= 0) {
          uint64_t v19 = HIBYTE(v26);
        }
        else {
          uint64_t v19 = v26;
        }
        id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v18 length:v19];
        if (SHIBYTE(v26) < 0) {
          operator delete(__p[1]);
        }
        goto LABEL_26;
      }
      v23 = sMmsPduLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[CTMMSEncoder encodeSms:]();
      }
    }
    else
    {
      v22 = sMmsPduLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[CTMMSEncoder encodeSms:]();
      }
    }
    id v20 = 0;
LABEL_26:
    if (SHIBYTE(v30) < 0) {
      operator delete(__dst);
    }

    goto LABEL_29;
  }
  id v21 = sMmsPduLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[CTMMSEncoder encodeSms:]();
  }
  id v20 = 0;
LABEL_29:

  return v20;
}

+ (id)encodeMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  *(void *)buf = 0;
  CFStringRef MobileUser = (const __CFString *)_CFStringGetMobileUser();
  *(void *)id v21 = CFPreferencesCopyValue(@"MMS", @"com.apple.carrier_1", MobileUser, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(buf, (CFTypeRef *)v21);
  id v5 = *(const void **)buf;
  if (*(void *)buf) {
    id v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    id v6 = 0;
  }
  if (v6)
  {
    *(void *)id v21 = 0;
    CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)buf, @"MimeEncodingHint");
    ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(v21, &Value);
    CFTypeRef v7 = *(CFTypeRef *)v21;
    if (*(void *)v21) {
      v8 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    }
    else {
      v8 = 0;
    }
    if (v8)
    {
      if (CFEqual(@"UTF8", *(CFTypeRef *)v21)) {
        int v9 = 134217984;
      }
      else {
        int v9 = -1;
      }
      CFTypeRef v7 = *(CFTypeRef *)v21;
      if (*(void *)v21) {
        goto LABEL_13;
      }
    }
    else
    {
      int v9 = -1;
      if (*(void *)v21) {
LABEL_13:
      }
        CFRelease(v7);
    }
    id v5 = *(const void **)buf;
    if (!*(void *)buf) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v9 = -1;
  if (*(void *)buf) {
LABEL_15:
  }
    CFRelease(v5);
LABEL_16:
  v10 = sMmsPduLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl(&dword_18444A000, v10, OS_LOG_TYPE_DEFAULT, "*****************Using mime encoding hint: %u***********************\n", buf, 8u);
  }
  if ([v19 messageType] == 1)
  {
    uint64_t v11 = [a1 encodeSms:v19];
  }
  else
  {
    uint64_t v24 = 0;
    *(_OWORD *)buf = 0u;
    long long v23 = 0u;
    MMSPduEncoder::MMSPduEncoder((MMSPduEncoder *)buf);
    v12 = [v19 items];
    BOOL v13 = [v12 count] == 0;

    if (v13)
    {
      uint64_t v16 = sMmsPduLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[CTMMSEncoder encodeMessage:]();
      }
    }
    else
    {
      uint64_t v14 = [v19 recipients];
      BOOL v15 = [v14 count] == 0;

      if (!v15) {
        operator new();
      }
      v17 = sMmsPduLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[CTMMSEncoder encodeMessage:]();
      }
    }
    uint64_t v11 = 0;
    if (SHIBYTE(v23) < 0) {
      operator delete(*(void **)&buf[8]);
    }
  }

  return v11;
}

+ (id)decodeMessageFromData:(id)a3
{
  id v4 = a3;
  id v5 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];
  id v6 = [a1 decodeMessageFromData:v5 data:v4];

  return v6;
}

+ (id)decodeMessageFromData:(id)a3 data:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  a3;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  id v6 = a4;
  MMSPduDecoder::MMSPduDecoder((ctu::OsLogLogger *)v7, [v6 bytes], objc_msgSend(v6, "length"), 1);
  MMSPduDecoder::decodeMessage((MMSPduDecoder *)v7);
}

+ (void)encodeSms:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "text part contains null text", v2, v3, v4, v5, v6);
}

+ (void)encodeSms:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "unable to get serviceCenter for SMS", v2, v3, v4, v5, v6);
}

+ (void)encodeSms:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "unable to get recipient for SMS", v2, v3, v4, v5, v6);
}

+ (void)encodeMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "encodeMessage failed: no message body", v2, v3, v4, v5, v6);
}

+ (void)encodeMessage:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "encodeMessage failed: no recipients", v2, v3, v4, v5, v6);
}

+ (void)encodeMessage:(int)a1 .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "no content type specified for part %u", (uint8_t *)v2, 8u);
}

+ (void)encodeMessage:(int)a1 .cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "part %u doesn't contain a body", (uint8_t *)v2, 8u);
}

+ (void)encodeMessage:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "unable to encode mms", v2, v3, v4, v5, v6);
}

@end