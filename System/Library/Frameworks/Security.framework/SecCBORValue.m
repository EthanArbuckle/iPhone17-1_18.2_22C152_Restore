@interface SecCBORValue
- (int)fieldType;
- (unint64_t)getNumUintBytes:(unint64_t)a3;
- (unsigned)fieldValue;
- (void)encodeStartItems:(unint64_t)a3 output:(id)a4;
- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5;
- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5;
- (void)write:(id)a3;
@end

@implementation SecCBORValue

- (unint64_t)getNumUintBytes:(unint64_t)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 8;
  if (!HIDWORD(a3)) {
    uint64_t v5 = 4;
  }
  if (a3 >= 0x10000) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0x100) {
    unint64_t v3 = v4;
  }
  if (a3 >= 0x18) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  unint64_t v9 = [(SecCBORValue *)self getNumUintBytes:a4];
  uint64_t v10 = 0;
  uint64_t v11 = 24;
  switch(v9)
  {
    case 0uLL:
      [(SecCBORValue *)self setAdditionalInformation:v6 item2:a4 output:v8];
      break;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      uint64_t v11 = 25;
      uint64_t v10 = 1;
      goto LABEL_6;
    case 4uLL:
      uint64_t v11 = 26;
      uint64_t v10 = 3;
      goto LABEL_6;
    case 8uLL:
      uint64_t v11 = 27;
      uint64_t v10 = 7;
LABEL_6:
      [(SecCBORValue *)self setAdditionalInformation:v6 item2:v11 output:v8];
      uint64_t v12 = v10 + 1;
      char v13 = 8 * v10;
      do
      {
        char v15 = a4 >> (v13 & 0xF8);
        [v8 appendBytes:&v15 length:1];
        v13 -= 8;
      }
      while (v12-- > 1);
      break;
    default:
      break;
  }
}

- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5
{
  char v5 = a4 & 0x1F | a3;
  [a5 appendBytes:&v5 length:1];
}

- (void)encodeStartItems:(unint64_t)a3 output:(id)a4
{
  id v6 = a4;
  [(SecCBORValue *)self setUint:[(SecCBORValue *)self fieldValue] item2:a3 output:v6];
}

- (void)write:(id)a3
{
}

- (unsigned)fieldValue
{
  return 32 * ([(SecCBORValue *)self fieldType] & 7);
}

- (int)fieldType
{
  return -1;
}

@end