@interface NSData
- (NSData)_uudecoded_large;
- (NSData)_uudecoded_small;
@end

@implementation NSData

- (NSData)_uudecoded_small
{
  v1 = a1;
  v10[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v8[0] = v2;
    v8[1] = v2;
    unint64_t v3 = vcvtpd_u64_f64((double)[(NSData *)a1 length] * 0.74 + 100.0);
    if (v3 <= 0x64) {
      uint64_t v4 = 100;
    }
    else {
      uint64_t v4 = v3;
    }
    OutputBuffer::OutputBuffer((OutputBuffer *)v8, v4);
    memset(v7, 170, sizeof(v7));
    DecodeBuffer::DecodeBuffer((DecodeBuffer *)v7, v1);
    v10[0] = &unk_1F08425A8;
    v10[1] = v8;
    v10[3] = v10;
    v9[0] = &unk_1F0842600;
    v9[1] = v8;
    v9[3] = v9;
    char v5 = DecodeBuffer::parse((DecodeBuffer *)v7, (uint64_t)v10, (uint64_t)v9);
    std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](v9);
    std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](v10);
    if (v5)
    {
      [*((id *)&v8[0] + 1) setLength:*(void *)&v8[0]];
      v1 = (NSData *)*((id *)&v8[0] + 1);
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (NSData)_uudecoded_large
{
  v1 = a1;
  v11[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v2;
    *(_OWORD *)v9 = v2;
    TemporaryFile::TemporaryFile((TemporaryFile *)&v8);
    unint64_t v3 = v9[0];
    if ((int)v8 < 1 || v9[0] == 0)
    {
      v1 = 0;
      if (!v9[0])
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      memset(v7, 170, sizeof(v7));
      DecodeBuffer::DecodeBuffer((DecodeBuffer *)v7, v1);
      v11[0] = &unk_1F08424F8;
      v11[1] = &v8;
      v11[3] = v11;
      v10[0] = &unk_1F0842550;
      v10[1] = &v8;
      v10[3] = v10;
      char v6 = DecodeBuffer::parse((DecodeBuffer *)v7, (uint64_t)v11, (uint64_t)v10);
      std::__function::__value_func<void ()(LineOfOutput const&)>::~__value_func[abi:nn180100](v10);
      std::__function::__value_func<void ()(unsigned char)>::~__value_func[abi:nn180100](v11);
      if (v6)
      {
        TemporaryFile::mappedData((TemporaryFile *)&v8);
        v1 = (NSData *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }
      unint64_t v3 = v9[0];
      if (!v9[0]) {
        goto LABEL_9;
      }
    }
    fclose(v3);
    goto LABEL_9;
  }
LABEL_10:
  return v1;
}

@end