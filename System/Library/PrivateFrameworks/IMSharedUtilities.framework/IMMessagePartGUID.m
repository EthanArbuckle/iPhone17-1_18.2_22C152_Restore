@interface IMMessagePartGUID
+ (BOOL)supportsSecureCoding;
+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4;
+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5;
- (BOOL)decodeRangesWithEncodedGuid:(id)a3 ranges:(IMMessagePartRanges *)a4;
- (BOOL)isEqual:(id)a3;
- (IMMessagePartGUID)init;
- (IMMessagePartGUID)initWithCoder:(id)a3;
- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3;
- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3 messageGUID:(id)a4 prefix:(id)a5 partNumber:(unint64_t)a6 ranges:(IMMessagePartRanges *)a7;
- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4;
- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5;
- (IMMessagePartRanges)ranges;
- (NSString)encodedMessagePartGUID;
- (NSString)messageGUID;
- (NSString)prefix;
- (_NSRange)messageGUIDRange;
- (_NSRange)partNumberRange;
- (_NSRange)prefixRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)partNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMMessagePartGUID

- (IMMessagePartGUID)init
{
  return 0;
}

- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length])
  {
    v7 = IMLogHandleForCategory("IMMessagePartGUID");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF850(v7);
    }

    goto LABEL_9;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (![(IMMessagePartGUID *)self decodeRangesWithEncodedGuid:v5 ranges:&v15])
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (*((void *)&v15 + 1))
  {
    v6 = [v5 substringWithRange:(void)v15];
  }
  else
  {
    v6 = 0;
  }
  if (*((void *)&v17 + 1))
  {
    v10 = [v5 substringWithRange:(void)v17];
  }
  else
  {
    v10 = 0;
  }
  if (*((void *)&v16 + 1))
  {
    v11 = [v5 substringWithRange:(void)v16];
    v12 = v11;
    if (v11 && [v11 length]) {
      uint64_t v13 = [v12 unsignedIntValue];
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  self = [(IMMessagePartGUID *)self initWithEncodedMessagePartGUID:v5 messageGUID:v10 prefix:v6 partNumber:v13 ranges:v14];

  v8 = self;
LABEL_10:

  return v8;
}

- (BOOL)decodeRangesWithEncodedGuid:(id)a3 ranges:(IMMessagePartRanges *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    a4->partNumberRange = 0u;
    a4->messageGUIDRange = 0u;
    a4->prefixRange = 0u;
    if (![v5 length]) {
      goto LABEL_18;
    }
    unint64_t v7 = 0;
    NSUInteger v8 = 0;
    NSUInteger v9 = 0;
    NSUInteger v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int v12 = [v6 characterAtIndex:v7];
      if (v12 == 58) {
        NSUInteger v13 = v7;
      }
      else {
        NSUInteger v13 = v10;
      }
      if (v12 == 58) {
        uint64_t v14 = v7;
      }
      else {
        uint64_t v14 = v11;
      }
      if (v12 == 47) {
        NSUInteger v9 = v11 + 1;
      }
      else {
        NSUInteger v10 = v13;
      }
      if (v12 == 47)
      {
        NSUInteger v8 = ~v11 + v7;
        uint64_t v11 = v7;
      }
      else
      {
        uint64_t v11 = v14;
      }
      ++v7;
    }
    while (v7 < [v6 length]);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [v6 length];
      a4->prefixRange.location = 0;
      a4->prefixRange.length = v10;
      a4->partNumberRange.location = v9;
      a4->partNumberRange.length = v8;
      a4->messageGUIDRange.location = v11 + 1;
      a4->messageGUIDRange.length = v15 + ~v11;
      LOBYTE(a4) = 1;
    }
    else
    {
LABEL_18:
      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  NSUInteger v10 = [(id)objc_opt_class() encodeMessagePartGUID:v9 prefix:v8 partNumber:a5];

  uint64_t v11 = [(IMMessagePartGUID *)self initWithEncodedMessagePartGUID:v10];
  return v11;
}

- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3 messageGUID:(id)a4 prefix:(id)a5 partNumber:(unint64_t)a6 ranges:(IMMessagePartRanges *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v32.receiver = self;
  v32.super_class = (Class)IMMessagePartGUID;
  uint64_t v15 = [(IMMessagePartGUID *)&v32 init];
  if (!v15) {
    goto LABEL_11;
  }
  if (!v12
    || (uint64_t v16 = [v12 length], !v14)
    || !v16
    || (uint64_t v17 = [v14 length], !v13)
    || !v17
    || ![v13 length])
  {
    v27 = IMLogHandleForCategory("IMMessagePartGUID");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v12;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_error_impl(&dword_1A0772000, v27, OS_LOG_TYPE_ERROR, "Failed to create IMMessagePartGuid with input: encodedMessagePartGUID: %@, prefix: %@, messageGUID: %@", buf, 0x20u);
    }

    goto LABEL_15;
  }
  if (!a7->messageGUIDRange.length || !a7->prefixRange.length)
  {
    v29 = IMLogHandleForCategory("IMMessagePartGUID");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromRange(a7->prefixRange);
      v31 = NSStringFromRange(a7->messageGUIDRange);
      *(_DWORD *)buf = 138412546;
      id v34 = v30;
      __int16 v35 = 2112;
      id v36 = v31;
      _os_log_error_impl(&dword_1A0772000, v29, OS_LOG_TYPE_ERROR, "Failed to create IMMessagePartGuid with invalid ranges: prefixRange: %@, messageGUIDRange: %@", buf, 0x16u);
    }
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  uint64_t v18 = [v12 copy];
  encodedMessagePartGUID = v15->_encodedMessagePartGUID;
  v15->_encodedMessagePartGUID = (NSString *)v18;

  uint64_t v20 = [v13 copy];
  messageGUID = v15->_messageGUID;
  v15->_messageGUID = (NSString *)v20;

  uint64_t v22 = [v14 copy];
  prefix = v15->_prefix;
  v15->_prefix = (NSString *)v22;

  v15->_partNumber = a6;
  _NSRange prefixRange = a7->prefixRange;
  _NSRange partNumberRange = a7->partNumberRange;
  v15->_ranges.messageGUIDRange = a7->messageGUIDRange;
  v15->_ranges._NSRange partNumberRange = partNumberRange;
  v15->_ranges._NSRange prefixRange = prefixRange;
LABEL_11:
  v26 = v15;
LABEL_16:

  return v26;
}

- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4
{
  return [(IMMessagePartGUID *)self initWithMessageGUID:a3 prefix:a4 partNumber:0x7FFFFFFFFFFFFFFFLL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(IMMessagePartGUID *)self encodedMessagePartGUID];
  v6 = [(IMMessagePartGUID *)self messageGUID];
  unint64_t v7 = [(IMMessagePartGUID *)self prefix];
  unint64_t v8 = [(IMMessagePartGUID *)self partNumber];
  [(IMMessagePartGUID *)self ranges];
  id v9 = (void *)[v4 initWithEncodedMessagePartGUID:v5 messageGUID:v6 prefix:v7 partNumber:v8 ranges:&v11];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(IMMessagePartGUID *)self encodedMessagePartGUID];
    v6 = [v4 encodedMessagePartGUID];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (_NSRange)prefixRange
{
  NSUInteger length = self->_ranges.prefixRange.length;
  NSUInteger location = self->_ranges.prefixRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)partNumberRange
{
  NSUInteger length = self->_ranges.partNumberRange.length;
  NSUInteger location = self->_ranges.partNumberRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)messageGUIDRange
{
  NSUInteger length = self->_ranges.messageGUIDRange.length;
  NSUInteger location = self->_ranges.messageGUIDRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartGUID;
  id v4 = [(IMMessagePartGUID *)&v14 description];
  id v5 = [(IMMessagePartGUID *)self encodedMessagePartGUID];
  v6 = [(IMMessagePartGUID *)self prefix];
  char v7 = [(IMMessagePartGUID *)self messageGUID];
  unint64_t v8 = [(IMMessagePartGUID *)self partNumber];
  v16.NSUInteger location = [(IMMessagePartGUID *)self prefixRange];
  id v9 = NSStringFromRange(v16);
  v17.NSUInteger location = [(IMMessagePartGUID *)self partNumberRange];
  NSUInteger v10 = NSStringFromRange(v17);
  v18.NSUInteger location = [(IMMessagePartGUID *)self messageGUIDRange];
  uint64_t v11 = NSStringFromRange(v18);
  id v12 = [v3 stringWithFormat:@"%@ encodedMessagePartGUID: %@, prefix: %@, messageGUID: %@, partNumber: %ld, prefixRange: %@, partNumberRange: %@, messageGUIDRange: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4
{
  return (id)[a1 encodeMessagePartGUID:a3 prefix:a4 partNumber:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7 && v8 && [v7 length] && objc_msgSend(v9, "length"))
  {
    if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
      [NSString stringWithFormat:@"%@%c%@", v9, 58, v7, v13, v14];
    }
    else {
    uint64_t v11 = [NSString stringWithFormat:@"%@%c%ld%c%@", v9, 58, a5, 47, v7];
    }
  }
  else
  {
    NSUInteger v10 = IMLogHandleForCategory("IMMessagePartGUID");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF850(v10);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessagePartGUID *)self encodedMessagePartGUID];
  [v4 encodeObject:v5 forKey:@"encodedMessagePartGUID"];
}

- (IMMessagePartGUID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedMessagePartGUID"];

  v6 = [(IMMessagePartGUID *)self initWithEncodedMessagePartGUID:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (unint64_t)partNumber
{
  return self->_partNumber;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSString)encodedMessagePartGUID
{
  return self->_encodedMessagePartGUID;
}

- (IMMessagePartRanges)ranges
{
  _NSRange v3 = *(_NSRange *)&self[1].prefixRange.length;
  retstr->_NSRange prefixRange = *(_NSRange *)&self->messageGUIDRange.length;
  retstr->_NSRange partNumberRange = v3;
  retstr->messageGUIDRange = *(_NSRange *)&self[1].partNumberRange.length;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedMessagePartGUID, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_prefix, 0);
}

@end