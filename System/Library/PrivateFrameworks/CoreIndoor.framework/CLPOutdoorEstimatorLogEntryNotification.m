@interface CLPOutdoorEstimatorLogEntryNotification
+ (BOOL)supportsSecureCoding;
- (CLPOutdoorEstimatorLogEntryNotification)init;
- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3;
- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char;
- (basic_string<char,)serializedOutdoorEstimatorLogEntry;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLPOutdoorEstimatorLogEntryNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPOutdoorEstimatorLogEntryNotification)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v4 = [(CLPOutdoorEstimatorLogEntryNotification *)&v8 init];
  v5 = (CLPOutdoorEstimatorLogEntryNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    v6 = v5;
  }

  return v5;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v5 = [(CLPOutdoorEstimatorLogEntryNotification *)&v30 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"outdoorEstimatorLogEntry", v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v14 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12, v13);
    unint64_t v19 = objc_msgSend_length(v9, v15, v16, v17, v18);
    size_t v20 = v19;
    if (v19 >= 0x7FFFFFFFFFFFFFF8) {
      sub_221DE2208();
    }
    if (v19 >= 0x17)
    {
      uint64_t v26 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17) {
        uint64_t v26 = v19 | 7;
      }
      uint64_t v27 = v26 + 1;
      p_dst = (long long *)operator new(v26 + 1);
      *((void *)&__dst + 1) = v20;
      unint64_t v29 = v27 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v29) = v19;
      p_dst = &__dst;
      if (!v19)
      {
        LOBYTE(__dst) = 0;
        p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
        if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
        {
LABEL_6:
          long long v23 = __dst;
          *((void *)&p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1 + 2) = v29;
          *(_OWORD *)p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var0.__data_ = v23;
          v24 = v5;

          goto LABEL_7;
        }
LABEL_12:
        operator delete(p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1.__data_);
        goto LABEL_6;
      }
    }
    memmove(p_dst, v14, v20);
    *((unsigned char *)p_dst + v20) = 0;
    p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
    if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0) {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_, self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__size_, v5);
  }
  else {
  uint64_t v6 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)&self->_serializedOutdoorEstimatorLogEntry, *((unsigned __int8 *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23), v5);
  }
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)v6, @"outdoorEstimatorLogEntry", v8);
}

- (basic_string<char,)serializedOutdoorEstimatorLogEntry
{
  if (*((char *)&result->__r_.var1 + 3) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_221DE22DC(retstr, (void *)result->__r_.__value_.var0.var1.__size_, *((void *)&result->__r_.__value_.var0.var1+ 2));
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result->__r_.var0;
  return result;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0;
  return self;
}

@end