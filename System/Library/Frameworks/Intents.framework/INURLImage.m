@interface INURLImage
@end

@implementation INURLImage

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v5 = a3;
    v6 = +[INImage imageWithImageData:a2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_2;
    v12[3] = &unk_1E551BC00;
    id v13 = *(id *)(a1 + 32);
    [v6 _retrieveImageDataWithReply:v12];

    v7 = v13;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v15[0] = a3;
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = a3;
    id v5 = [v10 dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v7 = [v9 errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v5];
    (*(void (**)(uint64_t, void, void, void *, double, double))(v8 + 16))(v8, 0, 0, v7, 0.0, 0.0);
  }
}

uint64_t __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_120(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v11 = [v6 _imageData];
  [v6 _imageSize];
  double v8 = v7;
  double v10 = v9;

  (*(void (**)(uint64_t, id, void, id, double, double))(v4 + 16))(v4, v11, 0, v5, v8, v10);
}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_126(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (!v10)
  {
    id v13 = 0;
    if (v7) {
      goto LABEL_19;
    }
LABEL_15:
    v20 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v21 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
      __int16 v51 = 2112;
      v52 = v21;
      __int16 v53 = 2112;
      id v54 = v10;
      __int16 v55 = 2112;
      id v56 = v9;
      _os_log_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_INFO, "%s Image %@ failed to load with response %@, error %@", buf, 0x2Au);
    }
    uint64_t v22 = *(void *)(a1 + 56);
    v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *, double, double))(v22 + 16))(v22, 0, 0, v23, 0.0, 0.0);
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (!v7)
  {
    id v13 = v12;
    goto LABEL_15;
  }
  if (v12)
  {
    if ([v12 statusCode] < 200 || (id v13 = v10, objc_msgSend(v12, "statusCode") >= 300))
    {
      id v14 = v7;
      id v15 = v12;
      objc_msgSend(NSString, "if_stringWithData:", v14);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v17 = 0x1E4F1C000;
      if (!v16)
      {
        v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:0];
        v19 = [v18 objectForKeyedSubscript:@"error"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v46 = v18;
          objc_msgSend(NSString, "if_stringWithData:", v19);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            unint64_t v17 = 0x1E4F1C000;
LABEL_40:
            v38 = (void *)MEMORY[0x1E4F28D20];
            uint64_t v39 = [v15 statusCode];
            if (v39) {
              uint64_t v40 = v39;
            }
            else {
              uint64_t v40 = 400;
            }
            id v16 = [v38 localizedStringForStatusCode:v40];
            goto LABEL_44;
          }
          v46 = v18;
          id v45 = v19;
          id v16 = [v45 objectForKeyedSubscript:@"message"];
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            uint64_t v35 = [v45 objectForKeyedSubscript:@"description"];
            if (v35)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v36 = (void *)v35;
              }
              else {
                v36 = 0;
              }
            }
            else
            {
              v36 = 0;
            }
            v37 = (void *)v35;
            id v16 = v36;
          }
        }

        unint64_t v17 = 0x1E4F1C000uLL;
        if (!v16) {
          goto LABEL_40;
        }
      }
LABEL_44:

      uint64_t v41 = *(void *)(a1 + 56);
      v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      id v48 = v16;
      v43 = [*(id *)(v17 + 2536) dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v44 = [v42 errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v43];
      (*(void (**)(uint64_t, void, void, void *, double, double))(v41 + 16))(v41, 0, 0, v44, 0.0, 0.0);

      id v13 = v10;
      goto LABEL_45;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_19:
  [*(id *)(a1 + 32) _imageSize];
  if (v25 <= 0.0 || (double v26 = v24, v24 <= 0.0))
  {
    v23 = +[INImage imageWithImageData:v7];
    v34 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
      __int16 v51 = 2112;
      v52 = v23;
      _os_log_impl(&dword_18CB2F000, v34, OS_LOG_TYPE_INFO, "%s Loading image size for image %@", buf, 0x16u);
    }
    [v23 _loadImageDataAndSizeWithHelper:*(void *)(a1 + 40) accessSpecifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_27:

    goto LABEL_45;
  }
  double v27 = v25;
  v28 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v29 = *(void **)(a1 + 32);
    v30 = NSNumber;
    v31 = v28;
    v32 = [v30 numberWithDouble:v26];
    v33 = [NSNumber numberWithDouble:v27];
    *(_DWORD *)buf = 136315906;
    v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
    __int16 v51 = 2112;
    v52 = v29;
    __int16 v53 = 2112;
    id v54 = v32;
    __int16 v55 = 2112;
    id v56 = v33;
    _os_log_impl(&dword_18CB2F000, v31, OS_LOG_TYPE_INFO, "%s Image %@ came with size {%@, %@}, preserving that", buf, 0x2Au);
  }
  (*(void (**)(double, double))(*(void *)(a1 + 56) + 16))(v26, v27);
LABEL_45:
}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v11 = [v6 _imageData];
  [v6 _imageSize];
  double v8 = v7;
  double v10 = v9;

  (*(void (**)(uint64_t, id, void, id, double, double))(v4 + 16))(v4, v11, 0, v5, v8, v10);
}

@end