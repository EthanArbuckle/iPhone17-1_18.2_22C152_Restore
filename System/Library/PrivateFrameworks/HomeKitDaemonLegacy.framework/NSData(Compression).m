@interface NSData(Compression)
- (id)hmd_compressedData;
- (id)hmd_uncompressedData;
@end

@implementation NSData(Compression)

- (id)hmd_uncompressedData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 2* objc_msgSend(a1, "length", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0));
  bzero(v19, 0x2000uLL);
  memset(&v14.zalloc, 0, 24);
  int v4 = inflateInit2_(&v14, 15, "1.2.12", 112);
  if (v4)
  {
    int v5 = v4;
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize zlib for uncompression, error %d", buf, 0x12u);
    }
  }
  else
  {
    id v9 = a1;
    v14.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    while (1)
    {
      v14.avail_out = 0x2000;
      v14.next_out = v19;
      unsigned int v10 = inflate(&v14, 2);
      if (v10 >= 2) {
        break;
      }
      unsigned int v11 = v10;
      [v3 appendBytes:v19 length:0x2000 - v14.avail_out];
      if (v11 == 1 && v14.avail_out)
      {
        inflateEnd(&v14);
        v12 = (void *)[v3 copy];
        goto LABEL_12;
      }
    }
    inflateEnd(&v14);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)hmd_compressedData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  memset(&v22, 0, sizeof(v22));
  bzero(v27, 0x2000uLL);
  uint64_t v3 = deflateInit2_(&v22, -1, 8, 15, 8, 0, "1.2.12", 112);
  if (v3)
  {
    int v11 = v3;
    v12 = (void *)MEMORY[0x1D9452090](v3, v4, v5, v6, v7, v8, v9, v10);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      z_stream v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      __int16 v25 = 1024;
      int v26 = v11;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize zlib for compression, error %d", buf, 0x12u);
    }
  }
  else
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", deflateBound(&v22, objc_msgSend(a1, "length", *(_OWORD *)&v22.next_in, *(_OWORD *)&v22.total_in, *(_OWORD *)&v22.avail_out, *(_OWORD *)&v22.msg)));
    id v16 = a1;
    v22.avail_in = objc_msgSend(v16, "length", objc_msgSend(v16, "bytes"));
    while (1)
    {
      v22.avail_out = 0x2000;
      v22.next_out = v27;
      if (deflate(&v22, 4) == -2) {
        break;
      }
      [v15 appendBytes:v27 length:0x2000 - v22.avail_out];
      if (v22.avail_out)
      {
        deflateEnd(&v22);
        __int16 v17 = (void *)[v15 copy];

        goto LABEL_13;
      }
    }
    int v18 = (void *)MEMORY[0x1D9452090]();
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      __int16 v25 = 1024;
      int v26 = -2;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to compress, error %d", buf, 0x12u);
    }
    deflateEnd(&v22);
  }
  __int16 v17 = 0;
LABEL_13:
  return v17;
}

@end