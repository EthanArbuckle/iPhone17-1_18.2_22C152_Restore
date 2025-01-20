@interface CUOPACK
+ (id)decodeData:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)encodeObject:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
@end

@implementation CUOPACK

+ (id)decodeData:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  unsigned int v17 = -6700;
  v6 = OPACKDecodeData((const __CFData *)a3, a4, &v17);
  v12 = v6;
  if (v6)
  {
    v13 = v6;
  }
  else if (a5)
  {
    if (v17) {
      uint64_t v15 = v17;
    }
    else {
      uint64_t v15 = 4294960596;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v15, (uint64_t)"OPACK encode failed", v7, v8, v9, v10, v11, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)encodeObject:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  unsigned int v17 = -6700;
  CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)a3, a4, (int *)&v17);
  CFMutableDataRef v12 = DataMutable;
  if (DataMutable)
  {
    v13 = DataMutable;
  }
  else if (a5)
  {
    if (v17) {
      uint64_t v15 = v17;
    }
    else {
      uint64_t v15 = 4294960596;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v15, (uint64_t)"OPACK encode failed", v7, v8, v9, v10, v11, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end