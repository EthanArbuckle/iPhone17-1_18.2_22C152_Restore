@interface CXCallDirectoryPhoneNumberEntryData
+ (BOOL)supportsSecureCoding;
- (CXCallDirectoryPhoneNumberEntryData)init;
- (CXCallDirectoryPhoneNumberEntryData)initWithCoder:(id)a3;
- (NSData)phoneNumberData;
- (NSString)description;
- (const)phoneNumbers;
- (int64_t)phoneNumberAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneNumberData:(id)a3;
@end

@implementation CXCallDirectoryPhoneNumberEntryData

- (CXCallDirectoryPhoneNumberEntryData)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryPhoneNumberEntryData;
  v2 = [(CXCallDirectoryPhoneNumberEntryData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
    phoneNumberData = v2->_phoneNumberData;
    v2->_phoneNumberData = (NSData *)v3;
  }
  return v2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p count=%lu phoneNumberData.length=%lu>", objc_opt_class(), self, -[CXCallDirectoryPhoneNumberEntryData count](self, "count"), -[NSData length](self->_phoneNumberData, "length")];
}

- (unint64_t)count
{
  return [(NSData *)self->_phoneNumberData length] >> 3;
}

- (int64_t)phoneNumberAtIndex:(unint64_t)a3
{
  int64_t v4 = 0;
  -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", &v4, 8 * a3, 8);
  return v4;
}

- (const)phoneNumbers
{
  return (const int64_t *)[(NSData *)self->_phoneNumberData bytes];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryPhoneNumberEntryData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXCallDirectoryPhoneNumberEntryData;
  v5 = [(CXCallDirectoryPhoneNumberEntryData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_phoneNumberData);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    phoneNumberData = v5->_phoneNumberData;
    v5->_phoneNumberData = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(CXCallDirectoryPhoneNumberEntryData *)self phoneNumberData];
  v5 = NSStringFromSelector(sel_phoneNumberData);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSData)phoneNumberData
{
  return self->_phoneNumberData;
}

- (void)setPhoneNumberData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end