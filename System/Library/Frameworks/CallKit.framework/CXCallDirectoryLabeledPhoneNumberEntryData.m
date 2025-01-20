@interface CXCallDirectoryLabeledPhoneNumberEntryData
+ (BOOL)supportsSecureCoding;
- (CXCallDirectoryLabeledPhoneNumberEntryData)init;
- (CXCallDirectoryLabeledPhoneNumberEntryData)initWithCoder:(id)a3;
- (NSData)labelData;
- (NSData)phoneNumberData;
- (NSString)description;
- (const)utf8LabelAtIndex:(unint64_t)a3 length:(unsigned __int16 *)a4;
- (int64_t)phoneNumberAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setLabelData:(id)a3;
- (void)setPhoneNumberData:(id)a3;
@end

@implementation CXCallDirectoryLabeledPhoneNumberEntryData

- (CXCallDirectoryLabeledPhoneNumberEntryData)init
{
  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryLabeledPhoneNumberEntryData;
  v2 = [(CXCallDirectoryLabeledPhoneNumberEntryData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
    phoneNumberData = v2->_phoneNumberData;
    v2->_phoneNumberData = (NSData *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9B8] data];
    labelData = v2->_labelData;
    v2->_labelData = (NSData *)v5;
  }
  return v2;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p count=%lu phoneNumberData.length=%lu labelData.length=%lu>", objc_opt_class(), self, -[CXCallDirectoryLabeledPhoneNumberEntryData count](self, "count"), -[NSData length](self->_phoneNumberData, "length"), -[NSData length](self->_labelData, "length")];
}

- (unint64_t)count
{
  return [(NSData *)self->_phoneNumberData length] >> 4;
}

- (int64_t)phoneNumberAtIndex:(unint64_t)a3
{
  v7[0] = 0;
  v7[1] = 0;
  unint64_t v4 = 16 * a3;
  if (16 * a3 + 16 > [(NSData *)self->_phoneNumberData length])
  {
    v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryLabeledPhoneNumberEntryData phoneNumberAtIndex:]();
    }

    return 0;
  }
  else
  {
    -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", v7, v4, 16);
    return v7[0];
  }
}

- (const)utf8LabelAtIndex:(unint64_t)a3 length:(unsigned __int16 *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unint64_t v6 = 16 * a3;
  if (16 * a3 + 16 > [(NSData *)self->_phoneNumberData length])
  {
    v13 = CXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:]();
    }
  }
  else
  {
    -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", &v15, v6, 16);
    unsigned __int16 v14 = 0;
    uint64_t v7 = v16;
    unint64_t v8 = v16 + 2;
    if (v8 > [(NSData *)self->_labelData length])
    {
      v13 = CXDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:]();
      }
    }
    else
    {
      -[NSData getBytes:range:](self->_labelData, "getBytes:range:", &v14, v7, 2);
      uint64_t v9 = v14;
      *a4 = v14;
      unint64_t v10 = v9 + v16 + 2;
      if (v10 <= [(NSData *)self->_labelData length])
      {
        v11 = [(NSData *)self->_labelData bytes];
        return &v11[v16 + 2];
      }
      v13 = CXDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:]();
      }
    }
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryLabeledPhoneNumberEntryData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXCallDirectoryLabeledPhoneNumberEntryData;
  uint64_t v5 = [(CXCallDirectoryLabeledPhoneNumberEntryData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_phoneNumberData);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    phoneNumberData = v5->_phoneNumberData;
    v5->_phoneNumberData = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_labelData);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    labelData = v5->_labelData;
    v5->_labelData = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallDirectoryLabeledPhoneNumberEntryData *)self phoneNumberData];
  uint64_t v6 = NSStringFromSelector(sel_phoneNumberData);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(CXCallDirectoryLabeledPhoneNumberEntryData *)self labelData];
  uint64_t v7 = NSStringFromSelector(sel_labelData);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSData)phoneNumberData
{
  return self->_phoneNumberData;
}

- (void)setPhoneNumberData:(id)a3
{
}

- (NSData)labelData
{
  return self->_labelData;
}

- (void)setLabelData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelData, 0);

  objc_storeStrong((id *)&self->_phoneNumberData, 0);
}

- (void)phoneNumberAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A6E3A000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
}

- (void)utf8LabelAtIndex:length:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A6E3A000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
}

- (void)utf8LabelAtIndex:length:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A6E3A000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
}

- (void)utf8LabelAtIndex:length:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A6E3A000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
}

@end