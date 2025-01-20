@interface HMDStructuredReader
+ (HMDTokenBasedStructuredReader)readerWithError:(uint64_t)a1;
+ (id)extendedTypeReaderWithReader:(id)a3;
+ (id)readerFromOPACKData:(id)a3;
+ (id)readerFromObject:(id)a3;
+ (id)readerFromObjectWithExtendedTypes:(id)a3;
- (BOOL)readBoolean;
- (_HMDStructuredDataToken)readToken;
- (id)readData;
- (id)readDate;
- (id)readDictionaryKey;
- (id)readLogicalValueAsObject;
- (id)readNumber;
- (id)readString;
- (id)readUUID;
- (int64_t)tokenType;
- (unint64_t)beginArray;
- (unint64_t)beginDictionary;
- (void)_processLogicalValueWithBlock:(void *)a1;
- (void)copyLogicalValueToWriter:(id)a3;
- (void)endArray;
- (void)endDictionary;
- (void)readNull;
- (void)skipLogicalValue;
- (void)skipToken;
@end

@implementation HMDStructuredReader

+ (id)extendedTypeReaderWithReader:(id)a3
{
  id v3 = a3;
  v4 = [[HMDExtendedTypeReader alloc] initWithReader:v3];

  return v4;
}

+ (id)readerFromOPACKData:(id)a3
{
  if (a3)
  {
    v4 = (void *)OPACKDecodeData();
    v5 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410]);
    v6 = +[HMDStructuredReader readerWithError:]((uint64_t)a1, v5);
  }
  else
  {
    v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    v6 = +[HMDStructuredReader readerWithError:]((uint64_t)a1, v4);
  }

  return v6;
}

+ (HMDTokenBasedStructuredReader)readerWithError:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_alloc_init(HMDTokenBasedStructuredReader);
  [(HMDTokenBasedStructuredReader *)v3 failWithError:v2];

  return v3;
}

- (id)readLogicalValueAsObject
{
  id v3 = 0;
  switch([(HMDStructuredReader *)self tokenType])
  {
    case -2:
      break;
    case 6:
      [(HMDStructuredReader *)self readNull];
      uint64_t v4 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_12;
    case 7:
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDStructuredReader readBoolean](self, "readBoolean"));
      goto LABEL_12;
    case 8:
      uint64_t v4 = [(HMDStructuredReader *)self readString];
      goto LABEL_12;
    case 9:
      uint64_t v4 = [(HMDStructuredReader *)self readNumber];
      goto LABEL_12;
    case 10:
      uint64_t v4 = [(HMDStructuredReader *)self readData];
      goto LABEL_12;
    case 11:
      uint64_t v4 = [(HMDStructuredReader *)self readDate];
      goto LABEL_12;
    case 12:
      uint64_t v4 = [(HMDStructuredReader *)self readUUID];
LABEL_12:
      id v3 = (id)v4;
      break;
    default:
      v9 = 0;
      v5 = -[HMDStructuredDataFoundationOutputPointerWriter initWithOutput:]([HMDStructuredDataFoundationOutputPointerWriter alloc], &v9);
      [(HMDStructuredReader *)self copyLogicalValueToWriter:v5];
      v6 = [(HMDStructuredDataStream *)self error];
      v7 = v9;
      if (v6) {
        v7 = 0;
      }
      id v3 = v7;

      break;
  }
  return v3;
}

+ (id)readerFromObjectWithExtendedTypes:(id)a3
{
  id v3 = [a1 readerFromObject:a3];
  uint64_t v4 = +[HMDStructuredReader extendedTypeReaderWithReader:v3];

  return v4;
}

+ (id)readerFromObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = -[HMDStructuredDataFoundationReader initWithInput:]([HMDStructuredDataFoundationReader alloc], v3);

    return v5;
  }
  else
  {
    v7 = (HMDUserActivityHomeAwayReport *)_HMFPreconditionFailure();
    [(HMDUserActivityHomeAwayReport *)v7 .cxx_destruct];
  }
  return result;
}

- (void)copyLogicalValueToWriter:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__HMDStructuredReader_copyLogicalValueToWriter___block_invoke;
  v6[3] = &unk_264A2F698;
  v9 = v10;
  id v5 = v4;
  id v7 = v5;
  SEL v8 = self;
  -[HMDStructuredReader _processLogicalValueWithBlock:](self, v6);

  _Block_object_dispose(v10, 8);
}

void __48__HMDStructuredReader_copyLogicalValueToWriter___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = *(void **)(a1 + 40);
    [v2 skipToken];
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) readToken];
    if (v3) {
      objc_msgSend(v3, "writeToken:", v4, v5);
    }
    else {

    }
    v6 = [*(id *)(a1 + 32) error];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 != 0;
  }
}

- (void)_processLogicalValueWithBlock:(void *)a1
{
  v6 = a2;
  if (a1)
  {
    uint64_t v3 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v4 = [a1 tokenType];
        if (v4 != 5) {
          break;
        }
        v6[2]();
      }
      switch(v4)
      {
        case -2:
          goto LABEL_12;
        case -1:
          goto LABEL_11;
        case 1:
        case 3:
          ++v3;
          goto LABEL_9;
        case 2:
        case 4:
          if (!v3)
          {
LABEL_11:
            id v5 = HMDStructuredDataTokenTypeAsString(v4);
            [a1 failWithReason:@"Unexpected <%@>", v5];

            goto LABEL_12;
          }
          --v3;
LABEL_9:
          v6[2]();
          if (!v3) {
            goto LABEL_12;
          }
          break;
        default:
          goto LABEL_9;
      }
    }
  }
LABEL_12:
}

- (void)skipLogicalValue
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__HMDStructuredReader_skipLogicalValue__block_invoke;
  v2[3] = &unk_264A2F7F8;
  v2[4] = self;
  -[HMDStructuredReader _processLogicalValueWithBlock:](self, v2);
}

uint64_t __39__HMDStructuredReader_skipLogicalValue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) skipToken];
}

- (void)skipToken
{
  [(HMDStructuredReader *)self readToken];
}

- (_HMDStructuredDataToken)readToken
{
  int64_t v3 = [(HMDStructuredReader *)self tokenType];
  id v4 = 0;
  uint64_t v5 = -1;
  switch(v3)
  {
    case -2:
      id v4 = [(HMDStructuredDataStream *)self error];
      uint64_t v5 = -2;
      break;
    case -1:
      break;
    case 1:
      unint64_t v6 = [(HMDStructuredReader *)self beginArray];
      if (v6 != -1)
      {
        id v4 = [NSNumber numberWithUnsignedInteger:v6];
        uint64_t v5 = 1;
        goto LABEL_8;
      }
      id v4 = 0;
      uint64_t v5 = 1;
      break;
    case 2:
      [(HMDStructuredReader *)self endArray];
      id v4 = 0;
      uint64_t v5 = 2;
      break;
    case 3:
      unint64_t v7 = [(HMDStructuredReader *)self beginDictionary];
      if (v7 == -1)
      {
        id v4 = 0;
        uint64_t v5 = 3;
      }
      else
      {
        id v4 = [NSNumber numberWithUnsignedInteger:v7];
        uint64_t v5 = 3;
LABEL_8:
      }
      break;
    case 4:
      [(HMDStructuredReader *)self endDictionary];
      id v4 = 0;
      uint64_t v5 = 4;
      break;
    case 5:
      id v4 = [(HMDStructuredReader *)self readDictionaryKey];
      uint64_t v5 = 5;
      break;
    case 6:
      [(HMDStructuredReader *)self readNull];
      id v4 = 0;
      uint64_t v5 = 6;
      break;
    case 7:
      BOOL v8 = [(HMDStructuredReader *)self readBoolean];
      id v4 = [NSNumber numberWithBool:v8];
      uint64_t v5 = 7;
      break;
    case 8:
      id v4 = [(HMDStructuredReader *)self readString];
      uint64_t v5 = 8;
      break;
    case 9:
      id v4 = [(HMDStructuredReader *)self readNumber];
      uint64_t v5 = 9;
      break;
    case 10:
      id v4 = [(HMDStructuredReader *)self readData];
      uint64_t v5 = 10;
      break;
    case 11:
      id v4 = [(HMDStructuredReader *)self readDate];
      uint64_t v5 = 11;
      break;
    case 12:
      id v4 = [(HMDStructuredReader *)self readUUID];
      uint64_t v5 = 12;
      break;
    default:
      char v11 = (void *)MEMORY[0x263EFF940];
      uint64_t v12 = *MEMORY[0x263EFF498];
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid token type (%zd)", v3);
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

      objc_exception_throw(v14);
  }
  int64_t v9 = v5;
  v10 = v4;
  result.value = v10;
  result.type = v9;
  return result;
}

- (id)readUUID
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)readDate
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)readData
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)readNumber
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)readString
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)readBoolean
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)readNull
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)endDictionary
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)readDictionaryKey
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)beginDictionary
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)endArray
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)beginArray
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (int64_t)tokenType
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  unint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end