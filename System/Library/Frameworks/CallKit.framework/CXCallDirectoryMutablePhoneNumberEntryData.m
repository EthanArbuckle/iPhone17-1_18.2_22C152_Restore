@interface CXCallDirectoryMutablePhoneNumberEntryData
- (CXCallDirectoryMutablePhoneNumberEntryData)init;
- (CXCallDirectoryMutablePhoneNumberEntryData)initWithCapacity:(unint64_t)a3;
- (NSMutableData)mutablePhoneNumberData;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendPhoneNumber:(int64_t)a3;
- (void)setMutablePhoneNumberData:(id)a3;
@end

@implementation CXCallDirectoryMutablePhoneNumberEntryData

- (CXCallDirectoryMutablePhoneNumberEntryData)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryMutablePhoneNumberEntryData;
  v4 = [(CXCallDirectoryPhoneNumberEntryData *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:8 * a3];
    mutablePhoneNumberData = v4->_mutablePhoneNumberData;
    v4->_mutablePhoneNumberData = (NSMutableData *)v5;

    [(CXCallDirectoryPhoneNumberEntryData *)v4 setPhoneNumberData:v4->_mutablePhoneNumberData];
  }
  return v4;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)init
{
  return [(CXCallDirectoryMutablePhoneNumberEntryData *)self initWithCapacity:0];
}

- (void)appendPhoneNumber:(int64_t)a3
{
  int64_t v3 = a3;
  [(NSMutableData *)self->_mutablePhoneNumberData appendBytes:&v3 length:8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(CXCallDirectoryPhoneNumberEntryData);
  v6 = [(CXCallDirectoryMutablePhoneNumberEntryData *)self mutablePhoneNumberData];
  v7 = (void *)[v6 copyWithZone:a3];
  [(CXCallDirectoryPhoneNumberEntryData *)v5 setPhoneNumberData:v7];

  return v5;
}

- (NSMutableData)mutablePhoneNumberData
{
  return self->_mutablePhoneNumberData;
}

- (void)setMutablePhoneNumberData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end