@interface CXCallDirectoryMutableLabeledPhoneNumberEntryData
- (BOOL)appendPhoneNumber:(int64_t)a3 label:(id)a4;
- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)init;
- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)initWithCapacity:(unint64_t)a3;
- (NSMutableData)mutableLabelData;
- (NSMutableData)mutablePhoneNumberData;
- (NSMutableDictionary)labelToLabelDataOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLabelToLabelDataOffset:(id)a3;
- (void)setMutableLabelData:(id)a3;
- (void)setMutablePhoneNumberData:(id)a3;
@end

@implementation CXCallDirectoryMutableLabeledPhoneNumberEntryData

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)initWithCapacity:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CXCallDirectoryMutableLabeledPhoneNumberEntryData;
  v4 = [(CXCallDirectoryLabeledPhoneNumberEntryData *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:16 * a3];
    mutablePhoneNumberData = v4->_mutablePhoneNumberData;
    v4->_mutablePhoneNumberData = (NSMutableData *)v5;

    [(CXCallDirectoryLabeledPhoneNumberEntryData *)v4 setPhoneNumberData:v4->_mutablePhoneNumberData];
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    mutableLabelData = v4->_mutableLabelData;
    v4->_mutableLabelData = v7;

    [(CXCallDirectoryLabeledPhoneNumberEntryData *)v4 setLabelData:v4->_mutableLabelData];
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    labelToLabelDataOffset = v4->_labelToLabelDataOffset;
    v4->_labelToLabelDataOffset = v9;
  }
  return v4;
}

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)init
{
  return [(CXCallDirectoryMutableLabeledPhoneNumberEntryData *)self initWithCapacity:0];
}

- (BOOL)appendPhoneNumber:(int64_t)a3 label:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_labelToLabelDataOffset objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 unsignedIntegerValue];
  }
  else
  {
    uint64_t v10 = [v6 lengthOfBytesUsingEncoding:4];
    uint64_t v9 = -1;
    if (v10)
    {
      __int16 v11 = v10;
      uint64_t v12 = v10 + 1;
      if (!((unint64_t)(v10 + 1) >> 16))
      {
        uint64_t v9 = [(NSMutableData *)self->_mutableLabelData length];
        LOWORD(v15[0]) = v11;
        [(NSMutableData *)self->_mutableLabelData appendBytes:v15 length:2];
        -[NSMutableData appendBytes:length:](self->_mutableLabelData, "appendBytes:length:", [v6 UTF8String], v12);
      }
    }
    v13 = [NSNumber numberWithUnsignedInteger:v9];
    [(NSMutableDictionary *)self->_labelToLabelDataOffset setObject:v13 forKeyedSubscript:v6];
  }
  if (v9 != -1)
  {
    v15[0] = a3;
    v15[1] = v9;
    [(NSMutableData *)self->_mutablePhoneNumberData appendBytes:v15 length:16];
  }

  return v9 != -1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(CXCallDirectoryLabeledPhoneNumberEntryData);
  id v6 = [(CXCallDirectoryMutableLabeledPhoneNumberEntryData *)self mutablePhoneNumberData];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CXCallDirectoryLabeledPhoneNumberEntryData *)v5 setPhoneNumberData:v7];

  v8 = [(CXCallDirectoryMutableLabeledPhoneNumberEntryData *)self mutableLabelData];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [(CXCallDirectoryLabeledPhoneNumberEntryData *)v5 setLabelData:v9];

  return v5;
}

- (NSMutableData)mutablePhoneNumberData
{
  return self->_mutablePhoneNumberData;
}

- (void)setMutablePhoneNumberData:(id)a3
{
}

- (NSMutableData)mutableLabelData
{
  return self->_mutableLabelData;
}

- (void)setMutableLabelData:(id)a3
{
}

- (NSMutableDictionary)labelToLabelDataOffset
{
  return self->_labelToLabelDataOffset;
}

- (void)setLabelToLabelDataOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToLabelDataOffset, 0);
  objc_storeStrong((id *)&self->_mutableLabelData, 0);

  objc_storeStrong((id *)&self->_mutablePhoneNumberData, 0);
}

@end