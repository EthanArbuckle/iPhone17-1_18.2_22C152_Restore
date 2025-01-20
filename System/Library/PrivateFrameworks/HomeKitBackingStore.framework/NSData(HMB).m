@interface NSData(HMB)
+ (id)hmbDecodeQueryableParameter:()HMB;
+ (id)hmbEncodeQueryableParameter:()HMB;
+ (uint64_t)hmbDescriptionForEncodedQueryableVariable:()HMB;
- (id)hmbCompress;
- (id)hmbDescription;
- (id)hmbUncompress;
@end

@implementation NSData(HMB)

- (id)hmbDescription
{
  unint64_t v2 = [a1 length];
  v3 = NSString;
  if (v2 < 0x41)
  {
    v5 = [a1 base64EncodedStringWithOptions:0];
    v4 = [v3 stringWithFormat:@"[%@]", v5];
  }
  else
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"<%lu bytes>", objc_msgSend(a1, "length"));
  }
  return v4;
}

- (id)hmbUncompress
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1D944CB30]();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 2* objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0));
  bzero(v23, 0x2000uLL);
  memset(&v18.zalloc, 0, 24);
  int v4 = inflateInit2_(&v18, 15, "1.2.12", 112);
  if (v4)
  {
    int v5 = v4;
    v6 = (void *)MEMORY[0x1D944CB30]();
    id v7 = a1;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize zlib for uncompression: %ld", buf, 0x16u);
    }
  }
  else
  {
    id v10 = a1;
    v18.avail_in = objc_msgSend(v10, "length", objc_msgSend(v10, "bytes"));
    while (1)
    {
      v18.avail_out = 0x2000;
      v18.next_out = v23;
      int v11 = inflate(&v18, 2);
      if (v11 >= 2) {
        break;
      }
      [v3 appendBytes:v23 length:0x2000 - v18.avail_out];
      if (v11 == 1 && v18.avail_out)
      {
        inflateEnd(&v18);
        v12 = (void *)[v3 copy];
        goto LABEL_14;
      }
    }
    v13 = (void *)MEMORY[0x1D944CB30]();
    id v14 = v10;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to inflate data: %ld", buf, 0x16u);
    }
    inflateEnd(&v18);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)hmbCompress
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1D944CB30]();
  memset(&v24, 0, sizeof(v24));
  bzero(v29, 0x2000uLL);
  uint64_t v3 = deflateInit2_(&v24, -1, 8, 15, 8, 0, "1.2.12", 112);
  if (v3)
  {
    int v11 = v3;
    v12 = (void *)MEMORY[0x1D944CB30](v3, v4, v5, v6, v7, v8, v9, v10);
    id v13 = a1;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize zlib for compression: %ld", buf, 0x16u);
    }
  }
  else
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", deflateBound(&v24, objc_msgSend(a1, "length", *(_OWORD *)&v24.next_in, *(_OWORD *)&v24.total_in, *(_OWORD *)&v24.avail_out, *(_OWORD *)&v24.msg)));
    id v17 = a1;
    v24.avail_in = objc_msgSend(v17, "length", objc_msgSend(v17, "bytes"));
    while (1)
    {
      v24.avail_out = 0x2000;
      v24.next_out = v29;
      if (deflate(&v24, 4) == -2) {
        break;
      }
      [v16 appendBytes:v29 length:0x2000 - v24.avail_out];
      if (v24.avail_out)
      {
        deflateEnd(&v24);
        z_stream v18 = (void *)[v16 copy];

        goto LABEL_13;
      }
    }
    v19 = (void *)MEMORY[0x1D944CB30]();
    id v20 = v17;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      __int16 v27 = 2048;
      uint64_t v28 = -2;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to deflate data: %ld", buf, 0x16u);
    }
    deflateEnd(&v24);
  }
  z_stream v18 = 0;
LABEL_13:
  return v18;
}

+ (uint64_t)hmbDescriptionForEncodedQueryableVariable:()HMB
{
  return [a3 hmbDescription];
}

+ (id)hmbDecodeQueryableParameter:()HMB
{
  id v3 = a3;
  return v3;
}

+ (id)hmbEncodeQueryableParameter:()HMB
{
  id v3 = a3;
  return v3;
}

@end