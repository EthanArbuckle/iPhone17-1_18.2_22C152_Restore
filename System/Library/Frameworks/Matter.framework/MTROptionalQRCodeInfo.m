@interface MTROptionalQRCodeInfo
- (BOOL)isEqual:(id)a3;
- (MTROptionalQRCodeInfo)init;
- (MTROptionalQRCodeInfo)initWithTag:(id)a3 int32Value:(int)a4;
- (MTROptionalQRCodeInfo)initWithTag:(id)a3 stringValue:(id)a4;
- (MTROptionalQRCodeInfoType)type;
- (NSNumber)infoType;
- (NSNumber)integerValue;
- (NSNumber)tag;
- (NSString)stringValue;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
@end

@implementation MTROptionalQRCodeInfo

- (MTROptionalQRCodeInfo)initWithTag:(id)a3 int32Value:(int)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTROptionalQRCodeInfo;
  v7 = [(MTROptionalQRCodeInfo *)&v9 init];
  v7->_info.type = 2;
  v7->_info.tag = sub_244BDB0E0(v6);
  v7->_info.data.__r_.var0 = a4;

  return v7;
}

- (MTROptionalQRCodeInfo)initWithTag:(id)a3 stringValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTROptionalQRCodeInfo;
  v8 = [(MTROptionalQRCodeInfo *)&v14 init];
  v8->_info.type = 1;
  v8->_info.tag = sub_244BDB0E0(v6);
  if (!v7) {
    sub_244B27D00(@"value");
  }
  id v9 = v7;
  uint64_t v12 = objc_msgSend_UTF8String(v9, v10, v11);
  MEMORY[0x245695E30](&v8->_info.data, v12);

  return v8;
}

- (MTROptionalQRCodeInfoType)type
{
  int type = self->_info.type;
  if (type == 1) {
    return 1;
  }
  else {
    return 2 * (type == 2);
  }
}

- (NSNumber)tag
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, self->_info.tag);
}

- (NSNumber)integerValue
{
  if (self->_info.type == 2)
  {
    v2 = objc_msgSend_numberWithInt_(NSNumber, a2, self->_info.data.__r_.var0);
  }
  else
  {
    v2 = 0;
  }

  return (NSNumber *)v2;
}

- (NSString)stringValue
{
  if (self->_info.type == 1)
  {
    p_data = &self->_info.data;
    if (*((char *)&self->_info.data.__r_.__value_.var0.__l + 23) < 0) {
      p_data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_data->__r_.__value_.var0.__l.__data_;
    }
    v3 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)p_data);
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return (self->_info.type << 8) | (unint64_t)self->_info.tag;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = (unsigned __int8 *)v4;
    v8 = v7;
    if (self->_info.tag == v7[8])
    {
      int type = self->_info.type;
      if (type == *((_DWORD *)v7 + 3))
      {
        if (type == 2)
        {
          BOOL v24 = self->_info.data.__r_.var0 == *((_DWORD *)v7 + 10);
LABEL_29:
          BOOL v6 = v24;
          goto LABEL_26;
        }
        if (type == 1)
        {
          uint64_t v10 = *((unsigned __int8 *)&self->_info.data.__r_.__value_.var0.__l + 23);
          if ((v10 & 0x80u) == 0) {
            unint64_t size = *((unsigned __int8 *)&self->_info.data.__r_.__value_.var0.__l + 23);
          }
          else {
            unint64_t size = self->_info.data.__r_.__value_.var0.__l.__size_;
          }
          uint64_t v12 = v7[39];
          int v13 = (char)v12;
          if ((v12 & 0x80u) != 0) {
            uint64_t v12 = *((void *)v7 + 3);
          }
          if (size == v12)
          {
            p_data = &self->_info.data;
            if (v13 >= 0) {
              v15 = v7 + 16;
            }
            else {
              v15 = (unsigned __int8 *)*((void *)v7 + 2);
            }
            if ((v10 & 0x80) == 0)
            {
              if (*((unsigned char *)&self->_info.data.__r_.__value_.var0.__l + 23))
              {
                uint64_t v16 = v10 - 1;
                do
                {
                  int v18 = p_data->__r_.__value_.var0.__s.__data_[0];
                  p_data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)p_data + 1);
                  int v17 = v18;
                  int v20 = *v15++;
                  int v19 = v20;
                  BOOL v22 = v16-- != 0;
                  BOOL v6 = v17 == v19;
                }
                while (v17 == v19 && v22);
              }
              else
              {
                BOOL v6 = 1;
              }
              goto LABEL_26;
            }
            BOOL v24 = memcmp(p_data->__r_.__value_.var0.__l.__data_, v15, self->_info.data.__r_.__value_.var0.__l.__size_) == 0;
            goto LABEL_29;
          }
        }
      }
    }
    BOOL v6 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v6 = 0;
LABEL_27:

  return v6;
}

- (id)description
{
  id v4 = NSString;
  uint64_t v5 = objc_msgSend_tag(self, a2, v2);
  uint64_t v8 = objc_msgSend_unsignedCharValue(v5, v6, v7);
  int v13 = objc_msgSend_integerValue(self, v9, v10);
  objc_super v14 = v13;
  if (!v13)
  {
    objc_super v14 = objc_msgSend_stringValue(self, v11, v12);
  }
  v15 = objc_msgSend_stringWithFormat_(v4, v11, @"0x%02x=%@", v8, v14);
  if (!v13) {

  }
  return v15;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_info.data.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_info.data.__r_.__value_.var0.__l.__data_);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0uLL;
  *((_DWORD *)self + 10) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (MTROptionalQRCodeInfo)init
{
  return (MTROptionalQRCodeInfo *)MEMORY[0x270F9A6D0](self, sel_initWithTag_stringValue_, &unk_26F9CB410);
}

- (NSNumber)infoType
{
  v3 = NSNumber;
  uint64_t v5 = objc_msgSend_type(self, a2, v2);

  return (NSNumber *)objc_msgSend_numberWithUnsignedInteger_(v3, v4, v5);
}

@end