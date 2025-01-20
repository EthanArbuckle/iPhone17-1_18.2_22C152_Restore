@interface NSData(KCJoiningMessages)
+ (id)dataWithEncodedSequenceData:()KCJoiningMessages data:error:;
+ (id)dataWithEncodedSequenceString:()KCJoiningMessages data:error:;
+ (id)dataWithEncodedString:()KCJoiningMessages error:;
- (BOOL)decodeSequenceData:()KCJoiningMessages data:error:;
- (BOOL)decodeSequenceString:()KCJoiningMessages data:error:;
@end

@implementation NSData(KCJoiningMessages)

- (BOOL)decodeSequenceString:()KCJoiningMessages data:error:
{
  id v8 = a1;
  uint64_t v9 = [v8 bytes];
  id v10 = v8;
  return decode_seq_string_data(a3, a4, a5, v9, [v10 bytes] + objc_msgSend(v10, "length")) != 0;
}

- (BOOL)decodeSequenceData:()KCJoiningMessages data:error:
{
  id v8 = a1;
  uint64_t v9 = [v8 bytes];
  id v10 = v8;
  return decode_seq_data_data(a3, a4, a5, v9, [v10 bytes] + objc_msgSend(v10, "length")) != 0;
}

+ (id)dataWithEncodedSequenceString:()KCJoiningMessages data:error:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sizeof_seq_string_data(v7, v8);
  if (v9)
  {
    id v10 = [MEMORY[0x263EFF990] dataWithLength:v9];
    uint64_t v11 = [v10 mutableBytes];
    [v10 length];
    if (encode_seq_string_data(v7, v8, a5, v11) == v11)
    {
      id v17 = v10;
    }
    else
    {
      KCJoiningErrorCreate(3, a5, @"extra data", v12, v13, v14, v15, v16, v19);
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)dataWithEncodedSequenceData:()KCJoiningMessages data:error:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sizeof_seq_data_data(v7, v8);
  if (v9)
  {
    id v10 = [MEMORY[0x263EFF990] dataWithLength:v9];
    uint64_t v11 = [v10 mutableBytes];
    [v10 length];
    if (encode_seq_data_data(v7, v8) == v11)
    {
      id v17 = v10;
    }
    else
    {
      KCJoiningErrorCreate(3, a5, @"extra data", v12, v13, v14, v15, v16, v19);
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)dataWithEncodedString:()KCJoiningMessages error:
{
  id v5 = a3;
  [v5 lengthOfBytesUsingEncoding:4];
  uint64_t v6 = ccder_sizeof();
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF990] dataWithLength:v6];
    uint64_t v8 = [v7 mutableBytes];
    if (kcder_encode_string(v5, a4, v8, v8 + [v7 length]) == v8)
    {
      id v14 = v7;
    }
    else
    {
      KCJoiningErrorCreate(3, a4, @"extra data", v9, v10, v11, v12, v13, v16);
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end