@interface NSNumber(CUByteCodable)
+ (__CFString)createWithBytesNoCopy:()CUByteCodable length:error:;
- (CFMutableDataRef)encodedDataAndReturnError:()CUByteCodable;
- (uint64_t)encodedBytesAndReturnLength:()CUByteCodable error:;
@end

@implementation NSNumber(CUByteCodable)

- (CFMutableDataRef)encodedDataAndReturnError:()CUByteCodable
{
  unsigned int v16 = 0;
  CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable(a1, 8u, (int *)&v16);
  CFMutableDataRef v11 = DataMutable;
  if (DataMutable)
  {
    v12 = DataMutable;
  }
  else if (a3)
  {
    if (v16) {
      uint64_t v13 = v16;
    }
    else {
      uint64_t v13 = 4294960534;
    }
    NSErrorWithOSStatusF(v13, (uint64_t)"OPACK encode failed", v5, v6, v7, v8, v9, v10, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (uint64_t)encodedBytesAndReturnLength:()CUByteCodable error:
{
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

+ (__CFString)createWithBytesNoCopy:()CUByteCodable length:error:
{
  unsigned int v25 = 0;
  uint64_t v13 = _OPACKDecodeBytes(0, a3, a4, 8u, &v25);
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      free(a3);
      v20 = v13;
      goto LABEL_13;
    }
    if (a5)
    {
      v22 = NSErrorWithOSStatusF(4294960540, (uint64_t)"OPACK decode non-dictionary", v14, v15, v16, v17, v18, v19, v24);
LABEL_11:
      v20 = 0;
      *a5 = v22;
      goto LABEL_13;
    }
  }
  else if (a5)
  {
    if (v25) {
      uint64_t v21 = v25;
    }
    else {
      uint64_t v21 = 4294960534;
    }
    v22 = NSErrorWithOSStatusF(v21, (uint64_t)"OPACK decode failed", v7, v8, v9, v10, v11, v12, v24);
    goto LABEL_11;
  }
  v20 = 0;
LABEL_13:

  return v20;
}

@end