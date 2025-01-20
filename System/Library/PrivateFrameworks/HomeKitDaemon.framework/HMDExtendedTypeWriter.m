@interface HMDExtendedTypeWriter
- (HMDExtendedTypeWriter)initWithWriter:(id)a3 options:(unint64_t)a4;
- (id)error;
- (void)_beginExtensionValueWithTag:(uint64_t)a1;
- (void)beginArrayOfSize:(unint64_t)a3;
- (void)beginDictionaryOfSize:(unint64_t)a3;
- (void)endArray;
- (void)endDictionary;
- (void)failWithError:(id)a3;
- (void)writeBoolean:(BOOL)a3;
- (void)writeData:(id)a3;
- (void)writeDate:(id)a3;
- (void)writeDictionaryKey:(id)a3;
- (void)writeNull;
- (void)writeNumber:(id)a3;
- (void)writeString:(id)a3;
- (void)writeUUID:(id)a3;
@end

@implementation HMDExtendedTypeWriter

- (void).cxx_destruct
{
}

- (void)writeUUID:(id)a3
{
  if ((self->_options & 8) != 0)
  {
    id v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, @"$uuid");
    writer = self->_writer;
    v7 = [v5 UUIDString];

    [(HMDStructuredWriter *)writer writeString:v7];
    v8 = self->_writer;
    [(HMDStructuredWriter *)v8 endDictionary];
  }
  else
  {
    v4 = self->_writer;
    id v9 = a3;
    [(HMDStructuredWriter *)v4 writeUUID:v9];
  }
}

- (void)_beginExtensionValueWithTag:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(void **)(a1 + 16);
    id v4 = a2;
    [v3 beginDictionaryOfSize:1];
    [*(id *)(a1 + 16) writeDictionaryKey:v4];
  }
}

- (void)writeDate:(id)a3
{
  if ((self->_options & 4) != 0)
  {
    id v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, @"$date");
    writer = self->_writer;
    v7 = HMDExtendedTypeDateFormatter();
    v8 = [v7 stringFromDate:v5];

    [(HMDStructuredWriter *)writer writeString:v8];
    id v9 = self->_writer;
    [(HMDStructuredWriter *)v9 endDictionary];
  }
  else
  {
    id v4 = self->_writer;
    id v10 = a3;
    [(HMDStructuredWriter *)v4 writeDate:v10];
  }
}

- (void)writeData:(id)a3
{
  if ((self->_options & 2) != 0)
  {
    id v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, @"$base64");
    writer = self->_writer;
    v7 = [v5 base64EncodedStringWithOptions:0];

    [(HMDStructuredWriter *)writer writeString:v7];
    v8 = self->_writer;
    [(HMDStructuredWriter *)v8 endDictionary];
  }
  else
  {
    id v4 = self->_writer;
    id v9 = a3;
    [(HMDStructuredWriter *)v4 writeData:v9];
  }
}

- (void)writeNumber:(id)a3
{
}

- (void)writeString:(id)a3
{
}

- (void)writeBoolean:(BOOL)a3
{
}

- (void)writeNull
{
  if (self->_options)
  {
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, @"$null");
    [(HMDStructuredWriter *)self->_writer writeString:&stru_26E2EB898];
    writer = self->_writer;
    [(HMDStructuredWriter *)writer endDictionary];
  }
  else
  {
    v3 = self->_writer;
    [(HMDStructuredWriter *)v3 writeNull];
  }
}

- (void)endDictionary
{
}

- (void)writeDictionaryKey:(id)a3
{
}

- (void)beginDictionaryOfSize:(unint64_t)a3
{
}

- (void)endArray
{
}

- (void)beginArrayOfSize:(unint64_t)a3
{
}

- (void)failWithError:(id)a3
{
}

- (id)error
{
  return [(HMDStructuredWriter *)self->_writer error];
}

- (HMDExtendedTypeWriter)initWithWriter:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDExtendedTypeWriter;
  v8 = [(HMDExtendedTypeWriter *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_writer, a3);
    v9->_options = a4;
  }

  return v9;
}

@end