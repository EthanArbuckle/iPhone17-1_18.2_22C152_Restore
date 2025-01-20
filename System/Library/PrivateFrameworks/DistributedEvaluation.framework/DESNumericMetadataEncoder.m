@interface DESNumericMetadataEncoder
- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4;
- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4;
- (id)encodeString:(id)a3 toLength:(unint64_t)a4;
- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4;
- (id)zeroWithLength:(unint64_t)a3;
@end

@implementation DESNumericMetadataEncoder

- (id)encodeString:(id)a3 toLength:(unint64_t)a4
{
  v6 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BECCB000, v6, OS_LOG_TYPE_INFO, "Numeric metadata encoder does not support string.", v9, 2u);
  }

  v7 = [(DESNumericMetadataEncoder *)self zeroWithLength:a4];

  return v7;
}

- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v11 count:1];

  v9 = -[DESNumericMetadataEncoder encodeNumberVector:toLength:](self, "encodeNumberVector:toLength:", v8, a4, v11, v12);

  return v9;
}

- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4
{
  v6 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BECCB000, v6, OS_LOG_TYPE_INFO, "Numeric metadata encoder does not support string vector.", v9, 2u);
  }

  id v7 = [(DESNumericMetadataEncoder *)self zeroWithLength:a4];

  return v7;
}

- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = a4;
  if ([v6 count] <= a4) {
    unint64_t v7 = [v6 count];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4 * v7];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v10 = [v6 objectAtIndexedSubscript:i];
      int v14 = 0;
      [v10 floatValue];
      int v14 = v11;
      [v8 appendBytes:&v14 length:4];
    }
  }
  if ([v6 count] < a4)
  {
    uint64_t v12 = -[DESNumericMetadataEncoder zeroWithLength:](self, "zeroWithLength:", a4 - [v6 count]);
    [v8 appendData:v12];
  }

  return v8;
}

- (id)zeroWithLength:(unint64_t)a3
{
  return (id)[MEMORY[0x1E4F1CA58] dataWithLength:4 * a3];
}

@end