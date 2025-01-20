@interface EMDEUtils
+ (BOOL)isValidConfigFile;
+ (CFScopedPtr<MontrealNeuralNetwork)loadExtractionModelWithError:(id *)a3;
+ (NSDictionary)config;
+ (basic_string<char,)getTokenForTokenID:(std::allocator<char>> *__return_ptr)retstr;
+ (id)assetFolder;
+ (id)configFileName;
+ (id)decodeSequence:()vector<int;
+ (id)preProcessInputMessage:(id)a3;
+ (id)profaneRangesForText:(id)a3 usingLexicon:(_LXLexicon *)a4;
+ (id)removeLinksFrom:(id)a3;
+ (unsigned)validateAndUpdateAllowedWords:(void *)a3 forWord:()basic_string<char isComplete:()std:(std::allocator<char>> *)a4 :char_traits<char>;
+ (vector<float,)tokenizeInputSequence:(id)a2;
+ (vector<std::string,)allowedPrefixes;
+ (vector<std::string,)decodeVocabulary;
+ (void)loadConfigFromFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5;
+ (void)loadDecodeVocabulary;
+ (void)setAllowedPrefixes:()vector<std:(std::allocator<std::string>> *)a3 :string;
+ (void)setAssetFolder:(id)a3;
+ (void)setConfig:(id)a3;
+ (void)setConfigFile:(id)a3;
+ (void)setDecodeVocabulary:()vector<std:(std::allocator<std::string>> *)a3 :string;
@end

@implementation EMDEUtils

+ (void)setAllowedPrefixes:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  if (a3 != (vector<std::string, std::allocator<std::string>> *)&qword_1000B6578) {
    sub_10000D42C((uint64_t)&qword_1000B6578, (std::string *)a3->var0, (long long *)a3->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var1 - (char *)a3->var0) >> 3));
  }
}

+ (vector<std::string,)allowedPrefixes
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  return (vector<std::string, std::allocator<std::string>> *)sub_10000D700((char *)retstr, (long long *)qword_1000B6578, (long long *)qword_1000B6580, 0xAAAAAAAAAAAAAAABLL* ((qword_1000B6580 - qword_1000B6578) >> 3));
}

+ (void)setDecodeVocabulary:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  if (a3 != (vector<std::string, std::allocator<std::string>> *)&qword_1000B6590) {
    sub_10000D42C((uint64_t)&qword_1000B6590, (std::string *)a3->var0, (long long *)a3->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var1 - (char *)a3->var0) >> 3));
  }
}

+ (vector<std::string,)decodeVocabulary
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  return (vector<std::string, std::allocator<std::string>> *)sub_10000D700((char *)retstr, (long long *)qword_1000B6590, (long long *)qword_1000B6598, 0xAAAAAAAAAAAAAAABLL* ((qword_1000B6598 - qword_1000B6590) >> 3));
}

+ (void)setConfig:(id)a3
{
}

+ (NSDictionary)config
{
  v2 = (void *)qword_1000B65A8;
  if (!qword_1000B65A8)
  {
    id v12 = 0;
    [a1 loadConfigFromFile:qword_1000B65B8 assetFolderPath:qword_1000B65B0 error:&v12];
    id v3 = v12;
    if (v3)
    {
      v4 = extractionLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10008E2E4((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    v2 = (void *)qword_1000B65A8;
  }
  return (NSDictionary *)v2;
}

+ (void)setAssetFolder:(id)a3
{
}

+ (id)assetFolder
{
  return (id)qword_1000B65B0;
}

+ (void)setConfigFile:(id)a3
{
}

+ (id)configFileName
{
  return (id)qword_1000B65B8;
}

+ (void)loadConfigFromFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&qword_1000B65B0, a4);
    objc_storeStrong((id *)&qword_1000B65B8, a3);
    id v12 = [(id)qword_1000B65B0 stringByAppendingPathComponent:qword_1000B65B8];
    v13 = +[NSURL fileURLWithPath:v12];
    v14 = +[NSData dataWithContentsOfURL:v13 options:0 error:a5];

    if (a5 && *a5)
    {
      v15 = extractionLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10008E47C((uint64_t)a5, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      uint64_t v24 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:a5];
      v25 = (void *)qword_1000B65A8;
      qword_1000B65A8 = v24;

      if (a5 && *a5)
      {
        v15 = extractionLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10008E40C((uint64_t)a5, v15, v26, v27, v28, v29, v30, v31);
        }
      }
      else
      {
        v15 = [(id)qword_1000B65A8 mutableCopy];
        [v15 setObject:qword_1000B65B0 forKey:@"EMDE_ASSET_FOLDER_PATH"];
        id v32 = [v15 copy];
        v33 = (void *)qword_1000B65A8;
        qword_1000B65A8 = (uint64_t)v32;

        if ([(id)objc_opt_class() isValidConfigFile])
        {
          [a1 loadDecodeVocabulary];
        }
        else
        {
          v34 = extractionLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10008E3D8();
          }

          if (a5)
          {
            NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
            v35 = +[NSString stringWithFormat:@"EMDEUtils - Loaded config file is not valid."];
            v38 = v35;
            v36 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];

            *a5 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v36];
          }
        }
      }
    }

    goto LABEL_22;
  }
  v22 = extractionLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10008E350((uint64_t)v9, (uint64_t)v11, v22);
  }

  if (a5)
  {
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    v23 = +[NSString stringWithFormat:@"Found nil in input parameters for loadConfigFromFile:%@ assetFolderPath:%@", v9, v11];
    v40 = v23;
    id v12 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

    *a5 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v12];
LABEL_22:
  }
}

+ (BOOL)isValidConfigFile
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)qword_1000B6568;
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend((id)qword_1000B65A8, "objectForKey:", v6, (void)v12);
        BOOL v8 = v7 == 0;

        if (v8)
        {
          id v10 = extractionLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v6;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "EMDEUtils - Missing key %@ in loaded config", buf, 0xCu);
          }

          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

+ (void)loadDecodeVocabulary
{
  id v2 = +[EMDEUtils config];
  id v3 = [v2 objectForKeyedSubscript:@"EMDE_ASSET_FOLDER_PATH"];
  uint64_t v4 = +[EMDEUtils config];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"EMDE_VOCAB_FILE"];
  uint64_t v6 = [v3 stringByAppendingPathComponent:v5];

  uint64_t v21 = +[NSString stringWithContentsOfFile:v6 encoding:4 error:0];
  uint64_t v7 = +[NSCharacterSet newlineCharacterSet];
  BOOL v8 = [v21 componentsSeparatedByCharactersInSet:v7];

  sub_10000D5A4(&qword_1000B6590);
  qword_1000B6590 = 0;
  qword_1000B6598 = 0;
  qword_1000B65A0 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  __p[0] = &v29;
  sub_10000D388((void ***)__p);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        sub_10000A1B4(__p, (char *)[*(id *)(*((void *)&v25 + 1) + 8 * i) UTF8String]);
        long long v12 = (_OWORD *)qword_1000B6598;
        if (qword_1000B6598 >= (unint64_t)qword_1000B65A0)
        {
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((qword_1000B6598 - qword_1000B6590) >> 3);
          unint64_t v15 = v14 + 1;
          if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_100004204();
          }
          if (0x5555555555555556 * ((qword_1000B65A0 - qword_1000B6590) >> 3) > v15) {
            unint64_t v15 = 0x5555555555555556 * ((qword_1000B65A0 - qword_1000B6590) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((qword_1000B65A0 - qword_1000B6590) >> 3) >= 0x555555555555555) {
            unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v16 = v15;
          }
          v33 = &qword_1000B65A0;
          if (v16) {
            uint64_t v17 = (char *)sub_10000D200((uint64_t)&qword_1000B65A0, v16);
          }
          else {
            uint64_t v17 = 0;
          }
          uint64_t v18 = &v17[24 * v14];
          uint64_t v29 = v17;
          uint64_t v30 = v18;
          id v32 = &v17[24 * v16];
          long long v19 = *(_OWORD *)__p;
          *((void *)v18 + 2) = v24;
          *(_OWORD *)uint64_t v18 = v19;
          __p[1] = 0;
          uint64_t v24 = 0;
          __p[0] = 0;
          uint64_t v31 = v18 + 24;
          sub_10000D788(&qword_1000B6590, &v29);
          uint64_t v20 = qword_1000B6598;
          sub_10000D920((uint64_t)&v29);
          qword_1000B6598 = v20;
          if (SHIBYTE(v24) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v13 = *(_OWORD *)__p;
          *(void *)(qword_1000B6598 + 16) = v24;
          *long long v12 = v13;
          qword_1000B6598 = (uint64_t)v12 + 24;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v9);
  }
}

+ (basic_string<char,)getTokenForTokenID:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v2 = qword_1000B6590 + 24 * v1;
  if (*(char *)(v2 + 23) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, *(void **)v2, *(void *)(v2 + 8));
  }
  long long v3 = *(_OWORD *)v2;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)(v2 + 16);
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = v3;
  return result;
}

+ (CFScopedPtr<MontrealNeuralNetwork)loadExtractionModelWithError:(id *)a3
{
  uint64_t v5 = v3;
  uint64_t v6 = +[EMDEUtils config];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"EMDE_ASSET_FOLDER_PATH"];
  BOOL v8 = +[EMDEUtils config];
  id v9 = [v8 objectForKeyedSubscript:@"EMDE_UNILM_MODEL_FILE"];
  uint64_t v10 = [v7 stringByAppendingPathComponent:v9];

  id v11 = v10;
  sub_10000A1B4(__p, (char *)[v11 UTF8String]);
  long long v12 = (const void *)kMRLNeuralNetworkOptionModelURLKey;
  if (kMRLNeuralNetworkOptionModelURLKey) {
    CFRetain(kMRLNeuralNetworkOptionModelURLKey);
  }
  sub_10000D0C0(&v25, v12);
  if ((v28 & 0x80u) == 0) {
    long long v13 = __p;
  }
  else {
    long long v13 = (void **)__p[0];
  }
  if ((v28 & 0x80u) == 0) {
    CFIndex v14 = v28;
  }
  else {
    CFIndex v14 = (CFIndex)__p[1];
  }
  CFTypeRef v24 = CFURLCreateWithBytes(0, (const UInt8 *)v13, v14, 0, 0);
  if (!v24)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  sub_10000D9B0(v29, &v25, &v24);
  unint64_t v15 = (const void *)kMRLNeuralNetworkOptionModelTypeKey;
  if (kMRLNeuralNetworkOptionModelTypeKey) {
    CFRetain(kMRLNeuralNetworkOptionModelTypeKey);
  }
  sub_10000D0C0(&cf, v15);
  sub_10000DA10((uint64_t)v30, &cf, "Espresso");
  v26[0] = v29;
  v26[1] = 2;
  CFDictionaryRef v16 = sub_10000CD2C((uint64_t)v26);
  uint64_t v17 = 0;
  v26[2] = v16;
  do
  {
    uint64_t v18 = *(const void **)&v30[v17 * 8 + 8];
    if (v18) {
      CFRelease(v18);
    }
    CFTypeRef v19 = v29[v17 + 2];
    if (v19) {
      CFRelease(v19);
    }
    v17 -= 2;
  }
  while (v17 != -4);
  if (cf) {
    CFRelease(cf);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v25) {
    CFRelease(v25);
  }
  v29[0] = 0;
  *uint64_t v5 = MRLNeuralNetworkCreate();
  if (a3 && v29[0])
  {
    CFRetain(v29[0]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3) {
      goto LABEL_30;
    }
    id v20 = 0;
  }
  *a3 = v20;
LABEL_30:
  if (v16) {
    CFRelease(v16);
  }
  if ((char)v28 < 0) {
    operator delete(__p[0]);
  }

  return v21;
}

+ (vector<float,)tokenizeInputSequence:(id)a2
{
  id v43 = a4;
  if (v43)
  {
    uint64_t v4 = +[EMDEUtils config];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"EMDE_ASSET_FOLDER_PATH"];
    uint64_t v6 = +[EMDEUtils config];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"EMDE_SPIECE_MODEL_FILE"];
    id v41 = [v5 stringByAppendingPathComponent:v7];

    memset(v61, 0, sizeof(v61));
    BOOL v8 = +[EMDEUtils config];
    id v9 = [v8 objectForKeyedSubscript:@"EMDE_TOKENISER_UPPERCASE_TOKEN_ID"];

    if (v9)
    {
      uint64_t v10 = +[EMDEUtils config];
      id v11 = [v10 objectForKeyedSubscript:@"EMDE_TOKENISER_UPPERCASE_TOKEN_ID"];
      signed int v12 = [v11 intValue];
      uint64_t v13 = qword_1000B6590 + 24 * v12;
      if (*(char *)(v13 + 23) < 0) {
        uint64_t v13 = *(void *)v13;
      }
      v47 = +[NSString stringWithUTF8String:v13];

      v44 = +[NSRegularExpression regularExpressionWithPattern:@"(?<!\\p{L})\\p{Lu}\\p{Ll}*(?!\\p{L})" options:0 error:0];
      CFIndex v14 = +[NSCharacterSet whitespaceCharacterSet];
      unint64_t v15 = [v43 componentsSeparatedByCharactersInSet:v14];
      id v16 = [v15 mutableCopy];

      for (unint64_t i = 0; (unint64_t)[v16 count] > i; ++i)
      {
        uint64_t v18 = [v16 objectAtIndexedSubscript:i];
        id v19 = [v18 length];

        id v20 = [v16 objectAtIndexedSubscript:i];
        v45 = objc_msgSend(v44, "matchesInString:options:range:", v20, 0, 0, v19);

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = [v45 reverseObjectEnumerator];
        id v21 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v58;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v58 != v22) {
                objc_enumerationMutation(obj);
              }
              id v24 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)j) range];
              uint64_t v26 = v25;
              long long v27 = [v16 objectAtIndexedSubscript:i];
              unsigned __int8 v28 = objc_msgSend(v27, "substringWithRange:", v24, v26);

              uint64_t v29 = [v28 lowercaseString];
              uint64_t v30 = +[NSString stringWithFormat:@"%@%@", v47, v29, v41];

              uint64_t v31 = [v16 objectAtIndexedSubscript:i];
              id v32 = objc_msgSend(v31, "stringByReplacingCharactersInRange:withString:", v24, v26, v30);
              [v16 setObject:v32 atIndexedSubscript:i];
            }
            id v21 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v21);
        }
      }
      id v34 = [v16 componentsJoinedByString:@" "];
      sub_10000A1B4(&v53, (char *)[v34 UTF8String]);
      v36 = v53;
      v35 = v54;
      *(_DWORD *)v61 = *(_DWORD *)v55;
      *(_DWORD *)&v61[3] = *(_DWORD *)&v55[3];
      char v37 = v56;

      if ((v37 & 0x80) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      sub_10000A1B4(&v53, (char *)[v43 UTF8String]);
      v36 = v53;
      v35 = v54;
      *(_DWORD *)v61 = *(_DWORD *)v55;
      *(_DWORD *)&v61[3] = *(_DWORD *)&v55[3];
      char v37 = v56;
      if ((v56 & 0x80) == 0)
      {
LABEL_19:
        __dst[0] = v36;
        __dst[1] = v35;
        *(_DWORD *)v51 = *(_DWORD *)v61;
        *(_DWORD *)&v51[3] = *(_DWORD *)&v61[3];
        char v52 = v37;
LABEL_22:
        id v38 = v41;
        sub_10000A1B4(__p, (char *)[v38 UTF8String]);
        SentencePiece::encode((uint64_t)__dst, (uint64_t)__p, (void **)&retstr->__begin_);
        if (v49 < 0) {
          operator delete(__p[0]);
        }
        if (v52 < 0) {
          operator delete(__dst[0]);
        }
        if (retstr->__end_ == retstr->__begin_)
        {
          NSErrorUserInfoKey v39 = modelLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_10008E520();
          }
        }
        if (v37 < 0) {
          operator delete(v36);
        }

        goto LABEL_33;
      }
    }
    sub_1000302DC(__dst, v36, (unint64_t)v35);
    goto LABEL_22;
  }
  v33 = modelLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10008E4EC();
  }

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
LABEL_33:

  return result;
}

+ (id)decodeSequence:()vector<int
{
  uint64_t v4 = +[EMDEUtils config];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"EMDE_ASSET_FOLDER_PATH"];
  uint64_t v6 = +[EMDEUtils config];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"EMDE_SPIECE_MODEL_FILE"];
  BOOL v8 = [v5 stringByAppendingPathComponent:v7];

  id v16 = 0;
  uint64_t v17 = 0;
  unint64_t v15 = 0;
  sub_10000DBB4(&v15, a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  id v9 = v8;
  sub_10000A1B4(__p, (char *)[v9 UTF8String]);
  SentencePiece::decode((uint64_t)&v15, (uint64_t)__p, v18);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v15)
  {
    id v16 = v15;
    operator delete(v15);
  }
  if (v19 >= 0) {
    uint64_t v10 = v18;
  }
  else {
    uint64_t v10 = (void **)v18[0];
  }
  id v11 = +[NSString stringWithUTF8String:v10];
  if (v19 < 0) {
    operator delete(v18[0]);
  }

  return v11;
}

+ (id)removeLinksFrom:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = +[NSDataDetector dataDetectorWithTypes:32 error:0];
    uint64_t v7 = objc_msgSend(v6, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v8 = objc_msgSend(v7, "reverseObjectEnumerator", 0);
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          signed int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v12 resultType] == (id)32)
          {
            id v13 = [v12 range];
            uint64_t v15 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v13, v14, @".");

            id v5 = (id)v15;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v16 = v5;
    uint64_t v17 = v16;
  }
  else
  {
    id v16 = extractionLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008E554();
    }
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)preProcessInputMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 removeLinksFrom:v4];
    if (!v5) {
      id v5 = v4;
    }
    uint64_t v6 = +[NSRegularExpression regularExpressionWithPattern:@"\\*" options:0 error:0];
    uint64_t v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), @" ");

    BOOL v8 = +[NSRegularExpression regularExpressionWithPattern:@"( *\n)+" options:0 error:0];
    id v9 = [v7 length];
    uint64_t v10 = +[EMDEUtils config];
    id v11 = [v10 objectForKeyedSubscript:@"EMDE_NEW_LINE_SEPARATOR"];
    signed int v12 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, v9, v11);

    id v13 = [v12 stringByReplacingOccurrencesOfString:@",", @", " withString];

    uint64_t v14 = +[NSRegularExpression regularExpressionWithPattern:@" +" options:0 error:0];
    uint64_t v15 = objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), @" ");

    id v16 = +[NSRegularExpression regularExpressionWithPattern:@"’" options:0 error:0];
    uint64_t v17 = objc_msgSend(v16, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), @"'");
  }
  else
  {
    uint64_t v18 = extractionLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10008E588();
    }

    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)profaneRangesForText:(id)a3 usingLexicon:(_LXLexicon *)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = objc_alloc((Class)NLTagger);
    NLTagScheme v19 = NLTagSchemeTokenType;
    uint64_t v7 = +[NSArray arrayWithObjects:&v19 count:1];
    BOOL v8 = [v6 initWithTagSchemes:v7];

    [v8 setString:v5];
    id v9 = objc_opt_new();
    id v10 = [v5 length];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C374;
    v15[3] = &unk_1000ACAC8;
    id v16 = v5;
    uint64_t v18 = a4;
    id v11 = v9;
    id v17 = v11;
    -[NSObject enumerateTagsInRange:unit:scheme:options:usingBlock:](v8, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v10, 0, NLTagSchemeTokenType, 46, v15);
    signed int v12 = v17;
    id v13 = v11;
  }
  else
  {
    BOOL v8 = extractionLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10008E5BC();
    }
    id v13 = 0;
  }

  return v13;
}

+ (unsigned)validateAndUpdateAllowedWords:(void *)a3 forWord:()basic_string<char isComplete:()std:(std::allocator<char>> *)a4 :char_traits<char>
{
  int v52 = v4;
  if (!a3)
  {
    id v10 = modelLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008E5F0();
    }

    return 0;
  }
  id v5 = a4;
  id v6 = (std::string *)a3;
  if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    unint64_t size = a4->__r_.__value_.var0.var1.__size_;
  }
  else
  {
    unint64_t size = *((unsigned __int8 *)&a4->__r_.__value_.var0.var1 + 23);
    data = a4;
  }
  LOBYTE(__dst) = 44;
  signed int v12 = sub_10000CBF8(data, (unsigned __int8 *)&data->__r_.__value_.var0.var0.__data_[size], (unsigned __int8 *)&__dst);
  if (*((char *)&v5->__r_.__value_.var0.var1 + 23) < 0)
  {
    uint64_t v14 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v5->__r_.__value_.var0.var1.__data_;
    id v13 = &v5->__r_.__value_.var0.var1.__data_[v5->__r_.__value_.var0.var1.__size_];
  }
  else
  {
    id v13 = &v5->__r_.__value_.var0.var0.__data_[*((unsigned __int8 *)&v5->__r_.__value_.var0.var1 + 23)];
    uint64_t v14 = v5;
  }
  std::string::erase((std::string *)v5, v12 - (unsigned __int8 *)v14, v13 - (char *)v12);
  if (*((char *)&v5->__r_.__value_.var0.var1 + 23) < 0)
  {
    id v16 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v5->__r_.__value_.var0.var1.__data_;
    uint64_t v15 = &v5->__r_.__value_.var0.var1.__data_[v5->__r_.__value_.var0.var1.__size_];
  }
  else
  {
    uint64_t v15 = &v5->__r_.__value_.var0.var0.__data_[*((unsigned __int8 *)&v5->__r_.__value_.var0.var1 + 23)];
    id v16 = v5;
  }
  while (v16 != (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v15)
  {
    v16->__r_.__value_.var0.var0.__data_[0] = __tolower(v16->__r_.__value_.var0.var0.__data_[0]);
    id v16 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)v16 + 1);
  }
  sub_10000A1B4(&__dst, " ");
  sub_10000A1B4(v69, ",");
  sub_10000A1B4(v70, "");
  long long v65 = 0uLL;
  uint64_t v66 = 0;
  v62 = (char *)&v65;
  LOBYTE(v63) = 0;
  *(void *)&long long v65 = operator new(0x48uLL);
  *((void *)&v65 + 1) = v65;
  uint64_t v66 = v65 + 72;
  uint64_t v17 = 0;
  *((void *)&v65 + 1) = sub_10000D248((uint64_t)&v66, &__dst, &v71, (char *)v65);
  do
  {
    if (SHIBYTE(v70[v17 + 2]) < 0) {
      operator delete((void *)v70[v17]);
    }
    v17 -= 3;
  }
  while (v17 != -9);
  sub_10000A1B4(&__dst, " ");
  sub_10000A1B4(v69, ",");
  sub_10000A1B4(v70, "");
  v62 = 0;
  v63 = 0;
  v64 = 0;
  __p[0] = &v62;
  LOBYTE(__p[1]) = 0;
  v62 = (char *)operator new(0x48uLL);
  v63 = v62;
  v64 = v62 + 72;
  uint64_t v18 = 0;
  v63 = sub_10000D248((uint64_t)&v64, &__dst, &v71, v62);
  do
  {
    if (SHIBYTE(v70[v18 + 2]) < 0) {
      operator delete((void *)v70[v18]);
    }
    v18 -= 3;
  }
  while (v18 != -9);
  NLTagScheme v19 = +[EMDEUtils config];
  long long v20 = [v19 objectForKeyedSubscript:@"EMDE_VALIDATE_ONLY_ALLOWED_PREFIX"];
  BOOL v21 = v20 == 0;

  if (!v21)
  {
    [a1 allowedPrefixes];
    sub_10000D5A4((uint64_t *)&v65);
    long long v65 = __dst;
    uint64_t v66 = v68;
    uint64_t v68 = 0;
    long long __dst = 0uLL;
    __p[0] = &__dst;
    sub_10000D388((void ***)__p);
  }
  long long v22 = v62;
  v53 = v63;
  if (v62 == v63)
  {
LABEL_91:
    unsigned __int8 v11 = 0;
    goto LABEL_95;
  }
  std::string::size_type v23 = 0;
  v55 = v5;
  while (2)
  {
    v54 = v22;
    std::string::size_type __n1 = v23;
    if (v22[23] < 0)
    {
      sub_1000302DC(&__dst, *(void **)v22, *((void *)v22 + 1));
    }
    else
    {
      long long v24 = *(_OWORD *)v22;
      uint64_t v68 = *((void *)v22 + 2);
      long long __dst = v24;
    }
    uint64_t v25 = (long long *)*((void *)&v65 + 1);
    long long v57 = (long long *)*((void *)&v65 + 1);
    for (unint64_t i = (long long *)v65; i != v25; unint64_t i = (long long *)((char *)i + 24))
    {
      if (*((char *)i + 23) < 0)
      {
        sub_1000302DC(__p, *(void **)i, *((void *)i + 1));
      }
      else
      {
        long long v27 = *i;
        uint64_t v61 = *((void *)i + 2);
        *(_OWORD *)__p = v27;
      }
      sub_10000CC60((const void **)__p, (const void **)v5, (uint64_t)&v58);
      if (v68 >= 0) {
        p_dst = (const std::string::value_type *)&__dst;
      }
      else {
        p_dst = (const std::string::value_type *)__dst;
      }
      if (v68 >= 0) {
        std::string::size_type v29 = HIBYTE(v68);
      }
      else {
        std::string::size_type v29 = *((void *)&__dst + 1);
      }
      uint64_t v30 = std::string::append(&v58, p_dst, v29);
      std::string v59 = *v30;
      v30->__r_.__value_.__l.__size_ = 0;
      v30->__r_.__value_.__r.__words[2] = 0;
      v30->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v6->__r_.__value_.__r.__words[2]) < 0)
      {
        id v32 = (std::string *)v6->__r_.__value_.__r.__words[0];
        int64_t v31 = v6->__r_.__value_.__l.__size_;
      }
      else
      {
        int64_t v31 = HIBYTE(v6->__r_.__value_.__r.__words[2]);
        id v32 = v6;
      }
      int v33 = SHIBYTE(v59.__r_.__value_.__r.__words[2]);
      long long v34 = *(_OWORD *)&v59.__r_.__value_.__l.__data_;
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v35 = &v59;
      }
      else {
        v35 = (std::string *)v59.__r_.__value_.__r.__words[0];
      }
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int64_t v36 = HIBYTE(v59.__r_.__value_.__r.__words[2]);
      }
      else {
        int64_t v36 = v59.__r_.__value_.__l.__size_;
      }
      if (!v36)
      {
        std::string::size_type v39 = 0;
        if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_68;
        }
LABEL_67:
        operator delete((void *)v34);
        goto LABEL_68;
      }
      char v37 = (char *)v32 + v31;
      if (v31 >= v36)
      {
        v40 = v6;
        int v41 = v35->__r_.__value_.__s.__data_[0];
        v42 = v32;
        do
        {
          int64_t v43 = v31 - v36;
          if (v43 == -1) {
            break;
          }
          v44 = (char *)memchr(v42, v41, v43 + 1);
          if (!v44) {
            break;
          }
          id v38 = v44;
          if (!memcmp(v44, v35, v36)) {
            goto LABEL_62;
          }
          v42 = (std::string *)(v38 + 1);
          int64_t v31 = v37 - (v38 + 1);
        }
        while (v31 >= v36);
        id v38 = v37;
LABEL_62:
        id v6 = v40;
        id v5 = v55;
      }
      else
      {
        id v38 = (char *)v32 + v31;
      }
      if (v38 == v37) {
        std::string::size_type v39 = -1;
      }
      else {
        std::string::size_type v39 = v38 - (char *)v32;
      }
      if (v33 < 0) {
        goto LABEL_67;
      }
LABEL_68:
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
      if (v39 != -1)
      {
        sub_10000CC60((const void **)__p, (const void **)v5, (uint64_t)&v59);
        v45 = v68 >= 0 ? (const std::string::value_type *)&__dst : (const std::string::value_type *)__dst;
        std::string::size_type v46 = v68 >= 0 ? HIBYTE(v68) : *((void *)&__dst + 1);
        v47 = std::string::append(&v59, v45, v46);
        v48 = (void *)v47->__r_.__value_.__r.__words[0];
        std::string::size_type v49 = v47->__r_.__value_.__l.__size_;
        int v50 = SHIBYTE(v47->__r_.__value_.__r.__words[2]);
        v47->__r_.__value_.__l.__size_ = 0;
        v47->__r_.__value_.__r.__words[2] = 0;
        v47->__r_.__value_.__r.__words[0] = 0;
        if (v50 < 0)
        {
          std::string::size_type __n1 = v49;
          operator delete(v48);
        }
        else
        {
          std::string::size_type __n1 = v50;
        }
        if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v59.__r_.__value_.__l.__data_);
        }
      }
      if (SHIBYTE(v61) < 0) {
        operator delete(__p[0]);
      }
      if (v39 != -1) {
        goto LABEL_87;
      }
      uint64_t v25 = v57;
    }
    std::string::size_type v39 = -1;
LABEL_87:
    std::string::size_type v23 = __n1;
    if (SHIBYTE(v68) < 0) {
      operator delete((void *)__dst);
    }
    if (v39 == -1)
    {
      long long v22 = v54 + 24;
      if (v54 + 24 == v53) {
        goto LABEL_91;
      }
      continue;
    }
    break;
  }
  if (v52) {
    std::string::replace(v6, v39, __n1, " ");
  }
  unsigned __int8 v11 = 1;
LABEL_95:
  *(void *)&long long __dst = &v62;
  sub_10000D388((void ***)&__dst);
  *(void *)&long long __dst = &v65;
  sub_10000D388((void ***)&__dst);
  return v11;
}

@end