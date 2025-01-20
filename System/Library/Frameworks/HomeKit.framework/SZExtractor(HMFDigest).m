@interface SZExtractor(HMFDigest)
+ (id)optionsForArchiveURL:()HMFDigest digest:;
@end

@implementation SZExtractor(HMFDigest)

+ (id)optionsForArchiveURL:()HMFDigest digest:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 algorithm] - 2;
  if (v8 < 7 && ((0x79u >> v8) & 1) != 0)
  {
    id v15 = **((id **)&unk_1E5945380 + v8);
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [v6 path];
    id v31 = 0;
    v18 = [v16 attributesOfItemAtPath:v17 error:&v31];
    id v19 = v31;

    if (v18)
    {
      uint64_t v20 = *MEMORY[0x1E4FA8A60];
      v34[0] = v15;
      uint64_t v21 = *MEMORY[0x1E4FA8A70];
      v33[0] = v20;
      v33[1] = v21;
      v22 = [v7 value];
      v23 = objc_msgSend(v22, "hmf_hexadecimalRepresentation");
      v32 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v34[1] = v24;
      v33[2] = *MEMORY[0x1E4FA8A68];
      v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "fileSize"));
      v33[3] = *MEMORY[0x1E4FA8A58];
      v34[2] = v25;
      v34[3] = MEMORY[0x1E4F1CC38];
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
    }
    else
    {
      v26 = (void *)MEMORY[0x19F3A64A0]();
      id v27 = a1;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        __int16 v37 = 2112;
        id v38 = v19;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to get file size with error: %@", buf, 0x16u);
      }
      v14 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      [v7 algorithm];
      v13 = HMFDigestAlgorithmToString();
      *(_DWORD *)buf = 138543618;
      v36 = v12;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Invalid digest algorithm: %@", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

@end