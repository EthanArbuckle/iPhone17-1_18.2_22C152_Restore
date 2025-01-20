@interface SZExtractor(HMFDigest)
+ (id)optionsForArchiveURL:()HMFDigest digest:fileManager:;
@end

@implementation SZExtractor(HMFDigest)

+ (id)optionsForArchiveURL:()HMFDigest digest:fileManager:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v9 algorithm] - 2;
  if (v11 < 7 && ((0x79u >> v11) & 1) != 0)
  {
    id v18 = **((id **)&unk_264A236D0 + v11);
    v19 = [v8 path];
    id v36 = 0;
    v20 = [v10 attributesOfItemAtPath:v19 error:&v36];
    id v21 = v36;

    if (v20)
    {
      uint64_t v22 = *MEMORY[0x263F7BDE8];
      v39[0] = v18;
      uint64_t v23 = *MEMORY[0x263F7BDF8];
      v38[0] = v22;
      v38[1] = v23;
      v35 = [v9 value];
      v24 = objc_msgSend(v35, "hmf_hexadecimalRepresentation");
      v37 = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      v39[1] = v25;
      v38[2] = *MEMORY[0x263F7BDF0];
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "fileSize"));
      v26 = v20;
      id v27 = v18;
      v29 = id v28 = v21;
      v38[3] = *MEMORY[0x263F7BDE0];
      v39[2] = v29;
      v39[3] = MEMORY[0x263EFFA88];
      v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];

      id v21 = v28;
      id v18 = v27;
      v20 = v26;
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        __int16 v42 = 2112;
        id v43 = v21;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to get file size with error: %@", buf, 0x16u);
      }
      v17 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      [v9 algorithm];
      v16 = HMFDigestAlgorithmToString();
      *(_DWORD *)buf = 138543618;
      v41 = v15;
      __int16 v42 = 2112;
      id v43 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid digest algorithm: %@", buf, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

@end