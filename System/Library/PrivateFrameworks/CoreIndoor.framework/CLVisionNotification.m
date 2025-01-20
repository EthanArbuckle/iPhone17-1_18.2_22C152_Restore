@interface CLVisionNotification
+ (BOOL)supportsSecureCoding;
- (CLVisionNotification)init;
- (CLVisionNotification)initWithARSessionState:(unint64_t)a3;
- (CLVisionNotification)initWithCoder:(id)a3;
- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char;
- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char;
- (basic_string<char,)serializedVIOEstimation;
- (basic_string<char,)serializedVLLocalizationResult;
- (id).cxx_construct;
- (int)notificationType;
- (unint64_t)arSessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLVisionNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisionNotification)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2, v3);

  return 0;
}

- (CLVisionNotification)initWithARSessionState:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = [(CLVisionNotification *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_arSessionState = a3;
    v4->_notificationType = 0;
    v6 = v4;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  id v4 = [(CLVisionNotification *)&v8 init];
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    v5->_notificationType = 1;
    v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  id v4 = [(CLVisionNotification *)&v8 init];
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 2, (const std::string *)a3);
    v5->_notificationType = 2;
    v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CLVisionNotification;
  objc_super v8 = [(CLVisionNotification *)&v55 init];
  if (v8)
  {
    v8->_arSessionState = (int)objc_msgSend_decodeIntForKey_(v4, v5, @"arSessionState", v6, v7);
    v8->_notificationType = objc_msgSend_decodeIntForKey_(v4, v9, @"notificationType", v10, v11);
    uint64_t v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"vioEstimation", v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    v20 = (const void *)objc_msgSend_bytes(v15, v16, v17, v18, v19);
    unint64_t v25 = objc_msgSend_length(v15, v21, v22, v23, v24);
    size_t v26 = v25;
    if (v25 > 0x7FFFFFFFFFFFFFF7) {
      sub_221DE2208();
    }
    if (v25 >= 0x17)
    {
      uint64_t v49 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v25 | 7) != 0x17) {
        uint64_t v49 = v25 | 7;
      }
      uint64_t v50 = v49 + 1;
      p_dst = (long long *)operator new(v49 + 1);
      *((void *)&__dst + 1) = v26;
      unint64_t v54 = v50 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v54) = v25;
      p_dst = &__dst;
      if (!v25)
      {
        LOBYTE(__dst) = 0;
        p_serializedVIOEstimation = &v8->_serializedVIOEstimation;
        if ((*((char *)&v8->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
          goto LABEL_6;
        }
LABEL_16:
        operator delete(p_serializedVIOEstimation->__r_.__value_.var0.var1.__data_);
LABEL_6:
        *(_OWORD *)p_serializedVIOEstimation->__r_.__value_.var0.var0.__data_ = __dst;
        *((void *)&p_serializedVIOEstimation->__r_.__value_.var0.var1 + 2) = v54;
        uint64_t v29 = objc_opt_class();
        v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"vlLocalizationResult", v31);

        id v33 = v32;
        v38 = (const void *)objc_msgSend_bytes(v33, v34, v35, v36, v37);
        unint64_t v43 = objc_msgSend_length(v33, v39, v40, v41, v42);
        size_t v44 = v43;
        if (v43 > 0x7FFFFFFFFFFFFFF7) {
          sub_221DE2208();
        }
        if (v43 >= 0x17)
        {
          uint64_t v51 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v43 | 7) != 0x17) {
            uint64_t v51 = v43 | 7;
          }
          uint64_t v52 = v51 + 1;
          v45 = (long long *)operator new(v51 + 1);
          *((void *)&__dst + 1) = v44;
          unint64_t v54 = v52 | 0x8000000000000000;
          *(void *)&long long __dst = v45;
        }
        else
        {
          HIBYTE(v54) = v43;
          v45 = &__dst;
          if (!v43)
          {
            LOBYTE(__dst) = 0;
            p_var0 = &v8->_serializedVIOEstimation.__r_.var0;
            if ((v8->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
            {
LABEL_10:
              *(_OWORD *)p_var0 = __dst;
              *((void *)p_var0 + 2) = v54;
              v47 = v8;

              goto LABEL_11;
            }
LABEL_21:
            operator delete(*(void **)p_var0);
            goto LABEL_10;
          }
        }
        memmove(v45, v38, v44);
        *((unsigned char *)v45 + v44) = 0;
        p_var0 = &v8->_serializedVIOEstimation.__r_.var0;
        if ((v8->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_21;
      }
    }
    memmove(p_dst, v20, v26);
    *((unsigned char *)p_dst + v26) = 0;
    p_serializedVIOEstimation = &v8->_serializedVIOEstimation;
    if ((*((char *)&v8->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_11:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  objc_msgSend_encodeInt_forKey_(v18, v4, LODWORD(self->_arSessionState), @"arSessionState", v5);
  objc_msgSend_encodeInt_forKey_(v18, v6, self->_notificationType, @"notificationType", v7);
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0) {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_, self->_serializedVIOEstimation.__r_.__value_.var0.var1.__size_, v9);
  }
  else {
  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)&self->_serializedVIOEstimation, *((unsigned __int8 *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23), v9);
  }
  objc_msgSend_encodeObject_forKey_(v18, v11, (uint64_t)v10, @"vioEstimation", v12);

  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0) {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, *(void *)&self->_serializedVIOEstimation.__r_.var0, self->_serializedVIOEstimation.var0, v14);
  }
  else {
  id v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, (uint64_t)&self->_serializedVIOEstimation.__r_.var0, self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7], v14);
  }
  objc_msgSend_encodeObject_forKey_(v18, v16, (uint64_t)v15, @"vlLocalizationResult", v17);
}

- (unint64_t)arSessionState
{
  return self->_arSessionState;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (basic_string<char,)serializedVIOEstimation
{
  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_221DE22DC(retstr, *(void **)&result->__r_.var0, result->var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  return result;
}

- (basic_string<char,)serializedVLLocalizationResult
{
  if (*((char *)&result[1].__r_.var1 + 3) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_221DE22DC(retstr, (void *)result[1].__r_.__value_.var0.var1.__size_, *((void *)&result[1].__r_.__value_.var0.var1+ 2));
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].__r_.__value_.var0.var1.__size_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result[1].__r_.var0;
  return result;
}

- (void).cxx_destruct
{
  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0)
  {
    operator delete(*(void **)&self->_serializedVIOEstimation.__r_.var0);
    if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      return;
    }
  }
  else if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
  {
    return;
  }
  data = self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_;
  operator delete(data);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end