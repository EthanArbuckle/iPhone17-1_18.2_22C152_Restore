@interface CBORValue
- (int)fieldType;
- (unint64_t)getNumUintBytes:(unint64_t)a3;
- (unsigned)fieldValue;
- (void)encodeStartItems:(unint64_t)a3 output:(id)a4;
- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5;
- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5;
- (void)write:(id)a3;
@end

@implementation CBORValue

- (int)fieldType
{
  return -1;
}

- (unsigned)fieldValue
{
  return 32 * ([(CBORValue *)self fieldType] & 7);
}

- (void)write:(id)a3
{
}

- (void)encodeStartItems:(unint64_t)a3 output:(id)a4
{
  id v6 = a4;
  [(CBORValue *)self setUint:[(CBORValue *)self fieldValue] item2:a3 output:v6];
}

- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5
{
  char v5 = a4 & 0x1F | a3;
  [a5 appendBytes:&v5 length:1];
}

- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  unint64_t v9 = [(CBORValue *)self getNumUintBytes:a4];
  int v10 = 0;
  uint64_t v11 = 24;
  switch(v9)
  {
    case 0uLL:
      [(CBORValue *)self setAdditionalInformation:v6 item2:a4 output:v8];
      break;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      uint64_t v11 = 25;
      int v10 = 1;
      goto LABEL_6;
    case 4uLL:
      uint64_t v11 = 26;
      int v10 = 3;
      goto LABEL_6;
    case 8uLL:
      uint64_t v11 = 27;
      int v10 = 7;
LABEL_6:
      [(CBORValue *)self setAdditionalInformation:v6 item2:v11 output:v8];
      char v12 = 8 * v10;
      int v13 = v10 + 1;
      do
      {
        char v15 = a4 >> (v12 & 0xF8);
        [v8 appendBytes:&v15 length:1];
        v12 -= 8;
        BOOL v14 = __OFSUB__(v13--, 1);
      }
      while (!((v13 < 0) ^ v14 | (v13 == 0)));
      break;
    default:
      break;
  }
}

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

@end