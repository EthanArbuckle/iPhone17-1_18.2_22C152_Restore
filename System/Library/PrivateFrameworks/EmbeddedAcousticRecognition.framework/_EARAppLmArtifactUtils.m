@interface _EARAppLmArtifactUtils
+ (BOOL)addCustomPronsToUserProfile:(id)a3 artifact:(id)a4 configPath:(id)a5;
@end

@implementation _EARAppLmArtifactUtils

+ (BOOL)addCustomPronsToUserProfile:(id)a3 artifact:(id)a4 configPath:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v7 = a4;
  id v8 = a5;
  v49 = v7;
  v47 = v8;
  v9 = [v8 stringByDeletingLastPathComponent];
  v48 = v9;
  if ([v7 getLifeCycleStage] == 2)
  {
    v50 = [v9 stringByAppendingPathComponent:@"ncs"];
  }
  else
  {
    v50 = 0;
  }
  v10 = [NSString stringWithUTF8String:"custom-prons"];
  if ([v7 hasContent:v10])
  {

    goto LABEL_7;
  }
  v11 = [NSString stringWithUTF8String:"oov"];
  char v12 = [v7 hasContent:v11];

  if (v12)
  {
LABEL_7:
    id v13 = v8;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
    quasar::artifact::GetTargetLmeForAddingCustomProns((uint64_t)__p, &buf);
    if ((char)v65 < 0) {
      operator delete(__p[0]);
    }
    quasar::artifact::GetTargetLmeTagForAddingCustomProns(__p);
    std::string::size_type size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = buf.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      unint64_t v15 = v65;
      if ((v65 & 0x80u) != 0) {
        unint64_t v15 = (unint64_t)__p[1];
      }
      if (v15)
      {
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_std::string buf = &buf;
        }
        else {
          p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        uint64_t v54 = [NSString stringWithUTF8String:p_buf];
        if ((v65 & 0x80u) == 0) {
          v17 = __p;
        }
        else {
          v17 = (void **)__p[0];
        }
        v18 = [NSString stringWithUTF8String:v17];
        v19 = [v7 loadCustomPronData:v13 ncsRoot:v50 dataRoot:0];
        v46 = v19;
        if (v19)
        {
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id obj = [v19 getProns];
          uint64_t v20 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
          if (v20)
          {
            int v51 = 0;
            uint64_t v21 = *(void *)v61;
            do
            {
              uint64_t v22 = 0;
              v51 += v20;
              do
              {
                if (*(void *)v61 != v21) {
                  objc_enumerationMutation(obj);
                }
                v23 = *(void **)(*((void *)&v60 + 1) + 8 * v22);
                v24 = [_EARWordPart alloc];
                v25 = [v23 orthography];
                v26 = [v23 prons];
                v27 = -[_EARWordPart initWithOrthography:pronunciations:tagName:frequency:](v24, "initWithOrthography:pronunciations:tagName:frequency:", v25, v26, v18, [v23 frequency]);

                v69 = v27;
                v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
                [v55 addWordWithParts:v28 templateName:v54];

                ++v22;
              }
              while (v20 != v22);
              uint64_t v20 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
            }
            while (v20);
          }
          else
          {
            int v51 = 0;
          }

          id v7 = v49;
        }
        else
        {
          int v51 = 0;
        }
        v35 = [v7 loadOovs];
        v45 = v35;
        if (v35)
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id obja = v35;
          uint64_t v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v68, 16, v45, v46);
          if (v36)
          {
            uint64_t v37 = *(void *)v57;
            do
            {
              uint64_t v38 = 0;
              v51 += v36;
              do
              {
                if (*(void *)v57 != v37) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v39 = *(void *)(*((void *)&v56 + 1) + 8 * v38);
                v40 = [_EARWordPart alloc];
                v41 = [MEMORY[0x1E4F1CAD0] set];
                v42 = [(_EARWordPart *)v40 initWithOrthography:v39 pronunciations:v41 tagName:v18 frequency:1];

                v67 = v42;
                v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
                [v55 addWordWithParts:v43 templateName:v54];

                ++v38;
              }
              while (v36 != v38);
              uint64_t v36 = [obja countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v36);
          }
        }
        BOOL v34 = v51 != 0;

        v29 = v54;
        goto LABEL_52;
      }
      v29 = EarArtifactLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v71 = 0;
        v30 = "LME tag empty";
        v31 = v29;
        uint32_t v32 = 2;
        goto LABEL_37;
      }
    }
    else
    {
      v29 = EarArtifactLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v71 = 138412290;
        id v72 = v13;
        v30 = "LME template for adding artifact custom prons not present in %@ or is empty";
        v31 = v29;
        uint32_t v32 = 12;
LABEL_37:
        _os_log_impl(&dword_1B1A86000, v31, OS_LOG_TYPE_DEFAULT, v30, v71, v32);
      }
    }
    BOOL v34 = 0;
LABEL_52:

    if ((char)v65 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    goto LABEL_56;
  }
  v33 = EarArtifactLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1B1A86000, v33, OS_LOG_TYPE_DEFAULT, "No custom prons or OOVs present in artifact", (uint8_t *)&buf, 2u);
  }

  BOOL v34 = 0;
LABEL_56:

  return v34;
}

@end