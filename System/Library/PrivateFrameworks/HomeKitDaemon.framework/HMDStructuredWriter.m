@interface HMDStructuredWriter
+ (id)extendedTypeWriterWithWriter:(id)a3 options:(unint64_t)a4;
+ (id)writerIntoOPACKData:(id)a3;
+ (id)writerIntoObject:(id *)a3;
+ (id)writerIntoObject:(id *)a3 extendedTypeOptions:(unint64_t)a4;
- (id)error;
- (void)beginArrayOfSize:(unint64_t)a3;
- (void)beginDictionaryOfSize:(unint64_t)a3;
- (void)endArray;
- (void)endDictionary;
- (void)failWithError:(id)a3;
- (void)writeBoolean:(BOOL)a3;
- (void)writeData:(id)a3;
- (void)writeDate:(id)a3;
- (void)writeDictionaryKey:(id)a3;
- (void)writeLogicalValue:(id)a3;
- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4;
- (void)writeNull;
- (void)writeNumber:(id)a3;
- (void)writeString:(id)a3;
- (void)writeToken:(_HMDStructuredDataToken)a3;
- (void)writeUUID:(id)a3;
@end

@implementation HMDStructuredWriter

+ (id)extendedTypeWriterWithWriter:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    v7 = [[HMDExtendedTypeWriter alloc] initWithWriter:v5 options:a4];
  }
  else {
    v7 = (HMDExtendedTypeWriter *)v5;
  }
  v8 = v7;

  return v8;
}

+ (id)writerIntoOPACKData:(id)a3
{
  id v4 = a3;
  id v5 = [HMDStructuredDataOPACKWriter alloc];
  id v6 = v4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v10 = (void *)_HMFPreconditionFailure();
      return +[HMDStructuredReader readerFromOPACKData:v12];
    }
    v13.receiver = v5;
    v13.super_class = (Class)HMDStructuredDataOPACKWriter;
    v8 = objc_msgSendSuper2(&v13, sel_init);
    id v5 = (HMDStructuredDataOPACKWriter *)v8;
    if (v8) {
      objc_storeStrong(v8 + 6, a3);
    }
  }

  return v5;
}

- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    v15 = (_Unwind_Exception *)_HMFPreconditionFailure();

    _Unwind_Resume(v15);
  }
  id v16 = v6;
  uint64_t v7 = +[HMDStructuredDataFoundationReader tokenForValue:]((uint64_t)HMDStructuredDataFoundationReader, v6);
  uint64_t v9 = v7;
  v10 = v8;
  if ((unint64_t)(v7 - 6) < 7)
  {
    SEL v11 = v8;
    if (self)
    {
      -[HMDStructuredWriter writeToken:](self, "writeToken:", v9, v10);
      goto LABEL_9;
    }
    id v12 = v11;
    goto LABEL_6;
  }
  if (v7 != -2)
  {
    id v12 = -[HMDStructuredDataFoundationReader initWithInput:]([HMDStructuredDataFoundationReader alloc], v16);
    [v12 copyLogicalValueToWriter:self];
    objc_super v13 = [v12 error];

    if (v13)
    {
      v14 = [v12 error];
      [(HMDStructuredWriter *)self failWithError:v14];
    }
LABEL_6:

    goto LABEL_9;
  }
  [(HMDStructuredWriter *)self failWithError:v8];
LABEL_9:
}

- (void)writeLogicalValue:(id)a3
{
}

+ (id)writerIntoObject:(id *)a3 extendedTypeOptions:(unint64_t)a4
{
  id v6 = [a1 writerIntoObject:a3];
  uint64_t v7 = [a1 extendedTypeWriterWithWriter:v6 options:a4];

  return v7;
}

+ (id)writerIntoObject:(id *)a3
{
  v3 = -[HMDStructuredDataFoundationOutputPointerWriter initWithOutput:]([HMDStructuredDataFoundationOutputPointerWriter alloc], a3);
  return v3;
}

- (void).cxx_destruct
{
}

- (void)writeToken:(_HMDStructuredDataToken)a3
{
  id value = a3.value;
  switch(a3.type)
  {
    case 1:
      if (a3.value) {
        uint64_t v4 = [a3.value unsignedIntegerValue];
      }
      else {
        uint64_t v4 = -1;
      }
      [(HMDStructuredWriter *)self beginArrayOfSize:v4];
      break;
    case 2:
      [(HMDStructuredWriter *)self endArray];
      break;
    case 3:
      if (a3.value) {
        uint64_t v5 = [a3.value unsignedIntegerValue];
      }
      else {
        uint64_t v5 = -1;
      }
      [(HMDStructuredWriter *)self beginDictionaryOfSize:v5];
      break;
    case 4:
      [(HMDStructuredWriter *)self endDictionary];
      break;
    case 5:
      [(HMDStructuredWriter *)self writeDictionaryKey:a3.value];
      break;
    case 6:
      [(HMDStructuredWriter *)self writeNull];
      break;
    case 7:
      -[HMDStructuredWriter writeBoolean:](self, "writeBoolean:", [a3.value BOOLValue]);
      break;
    case 8:
      [(HMDStructuredWriter *)self writeString:a3.value];
      break;
    case 9:
      [(HMDStructuredWriter *)self writeNumber:a3.value];
      break;
    case 0xALL:
      [(HMDStructuredWriter *)self writeData:a3.value];
      break;
    case 0xBLL:
      [(HMDStructuredWriter *)self writeDate:a3.value];
      break;
    case 0xCLL:
      [(HMDStructuredWriter *)self writeUUID:a3.value];
      break;
    default:
      id v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid token type (%zd)", a3.type);
      id v8 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:0];

      objc_exception_throw(v8);
  }
}

- (void)writeUUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 12, v4);
  }
  else {
}
  }

- (void)writeDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 11, v4);
  }
  else {
}
  }

- (void)writeData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 10, v4);
  }
  else {
}
  }

- (void)writeNumber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 9, v4);
  }
  else {
}
  }

- (void)writeString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 8, v4);
  }
  else {
}
  }

- (void)writeBoolean:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  if (self)
  {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 7, v4);
  }
  else
  {
    MEMORY[0x270F9A828]();
  }
}

- (void)writeNull
{
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 6, 0);
  }
}

- (void)endDictionary
{
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 4, 0);
  }
}

- (void)writeDictionaryKey:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 5, v4);
  }
  else {
}
  }

- (void)beginDictionaryOfSize:(unint64_t)a3
{
  if (a3 == -1)
  {
    id v4 = 0;
    if (self) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      -[HMDStructuredWriter writeToken:](self, "writeToken:", 3, v4);
      return;
    }
  }
}

- (void)endArray
{
  if (self) {
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 2, 0);
  }
}

- (void)beginArrayOfSize:(unint64_t)a3
{
  if (a3 == -1)
  {
    id v4 = 0;
    if (self) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      -[HMDStructuredWriter writeToken:](self, "writeToken:", 1, v4);
      return;
    }
  }
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  if (!self->_error)
  {
    id v7 = v4;
    if (v4)
    {
      id v5 = (NSError *)v4;
    }
    else
    {
      id v5 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    }
    error = self->_error;
    self->_error = v5;

    id v4 = v7;
  }
}

- (id)error
{
  return self->_error;
}

@end