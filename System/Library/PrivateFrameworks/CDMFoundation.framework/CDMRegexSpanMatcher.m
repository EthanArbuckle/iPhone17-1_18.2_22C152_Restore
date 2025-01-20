@interface CDMRegexSpanMatcher
+ (id)getNumberFormatter:(id)a3;
+ (id)getNumberFormatterForOutput;
+ (id)getNumberString:(id)a3 numberFormatter:(id)a4 numberFormatterForOutput:(id)a5 integerOnly:(BOOL)a6;
+ (id)readRegexAssetFromPath:(id)a3;
- (CDMRegexSpanMatcher)initWithCachePath:(id)a3;
- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4;
@end

@implementation CDMRegexSpanMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexEntries, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
  objc_storeStrong((id *)&self->_cachedFilePath, 0);
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v90 = a4;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v116 = v12;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SpanMatcher", "%{public}@", buf, 0xCu);
  }
  if ([(NSArray *)self->_regexEntries count])
  {
    unint64_t v88 = v10;
    v13 = [MEMORY[0x263EFF980] array];
    v14 = [v6 string];
    v15 = v14;
    if (v14)
    {
      uint64_t v93 = [(__CFString *)v14 length];
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      obj = self->_regexEntries;
      uint64_t v94 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v128 count:16];
      if (v94)
      {
        v97 = 0;
        v98 = 0;
        uint64_t v92 = *(void *)v112;
        v96 = v13;
        v100 = v15;
        v101 = v6;
        while (1)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v112 != v92)
            {
              uint64_t v17 = v16;
              objc_enumerationMutation(obj);
              uint64_t v16 = v17;
            }
            uint64_t v95 = v16;
            v104 = *(void **)(*((void *)&v111 + 1) + 8 * v16);
            v18 = [v104 regularExpression];
            v19 = objc_msgSend(v18, "matchesInString:options:range:", v15, 0, 0, v93);

            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            id v103 = v19;
            uint64_t v106 = [v103 countByEnumeratingWithState:&v107 objects:v127 count:16];
            if (v106)
            {
              uint64_t v105 = *(void *)v108;
              do
              {
                uint64_t v20 = 0;
                do
                {
                  if (*(void *)v108 != v105) {
                    objc_enumerationMutation(v103);
                  }
                  v21 = *(void **)(*((void *)&v107 + 1) + 8 * v20);
                  v22 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v23 = [v21 range];
                    v25 = -[__CFString substringWithRange:](v15, "substringWithRange:", v23, v24);
                    v26 = [v104 label];
                    uint64_t v27 = [v21 range];
                    uint64_t v28 = [v21 range];
                    [v21 range];
                    *(_DWORD *)buf = 136316418;
                    v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                    __int16 v117 = 2112;
                    v118 = v15;
                    __int16 v119 = 2112;
                    v120 = v25;
                    __int16 v121 = 2112;
                    v122 = v26;
                    __int16 v123 = 2048;
                    uint64_t v124 = v27;
                    __int16 v125 = 2048;
                    uint64_t v126 = v29 + v28;
                    _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s For utterance <%@>, CDMRegexSpanMatcher matched text: <%@>, label: <%@>, start index: <%zu>, end index: <%zu>", buf, 0x3Eu);
                  }
                  uint64_t v30 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", objc_msgSend(v21, "range"));
                  uint64_t v31 = [v21 range];
                  [v21 range];
                  int v33 = [v6 tokenIndexFromCharacterIndex:v31 + v32 - 1];
                  uint64_t v34 = (v33 + 1);
                  if (v33 != -1)
                  {
                    v35 = [v6 tokens];
                    unint64_t v36 = [v35 count];

                    if (v36 >= v34)
                    {
                      uint64_t v38 = [v21 range];
                      uint64_t v40 = -[__CFString substringWithRange:](v15, "substringWithRange:", v38, v39);
                      v41 = v104;
                      v42 = [v104 label];
                      uint64_t v43 = [v21 range];
                      int v44 = [v21 range];
                      [v21 range];
                      LODWORD(v87) = 8;
                      v46 = (void *)v40;
                      v102 = +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:v42 inputStringForDebug:v40 startTokenIndex:v30 endTokenIndex:v34 startCharIndex:v43 endCharIndex:(v45 + v44) spanMatcherName:v87];

                      v47 = [v104 label];
                      int v48 = [v47 isEqualToString:@"ordinal"];

                      if (v48)
                      {
                        id v6 = v101;
                        if ((unint64_t)[v21 numberOfRanges] <= 1)
                        {
                          v49 = CDMOSLoggerForCategory(0);
                          v15 = v100;
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            v50 = v49;
                            v51 = "%s CDMRegexSpanMatcher created an ordinal match with one or fewer ranges, which indica"
                                  "tes that capture groups were not used in the regex definition";
                            goto LABEL_49;
                          }
                          goto LABEL_32;
                        }
                        uint64_t v55 = [v21 rangeAtIndex:1];
                        v15 = v100;
                        if (v55 == 0x7FFFFFFFFFFFFFFFLL
                          || (uint64_t v57 = v56, v56 == 0x7FFFFFFFFFFFFFFFLL)
                          || (uint64_t v58 = v55, v55 + v56 > (unint64_t)[(__CFString *)v100 length]))
                        {
                          v49 = CDMOSLoggerForCategory(0);
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            v50 = v49;
                            v51 = "%s CDMRegexSpanMatcher created an ordinal match that cannot be resolved to a position "
                                  "in the utterance";
LABEL_49:
                            _os_log_debug_impl(&dword_2263A0000, v50, OS_LOG_TYPE_DEBUG, v51, buf, 0xCu);
                          }
LABEL_32:

                          v59 = v102;
LABEL_41:

                          goto LABEL_42;
                        }
                        v76 = -[__CFString substringWithRange:](v100, "substringWithRange:", v58, v57);
                        uint64_t v77 = [v76 integerValue];

                        if (v77 == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          v49 = CDMOSLoggerForCategory(0);
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 136315138;
                            v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                            _os_log_impl(&dword_2263A0000, v49, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher invalid ordinal value matched", buf, 0xCu);
                          }
                          goto LABEL_32;
                        }
                        v53 = [v104 label];
                        uint64_t v78 = [v21 range];
                        int v79 = [v21 range];
                        [v21 range];
                        v71 = +[CDMVocUsoGraphMapper buildVocUSOGraphForRegexOrdinal:v77 withVocLabel:v53 withInput:v46 withStartCharIndex:v78 withEndCharIndex:(v80 + v79)];
                        v59 = v102;
                        [v102 setUsoGraph:v71];
LABEL_40:

                        [v96 addObject:v59];
                        v15 = v100;
                        goto LABEL_41;
                      }
                      id v6 = v101;
                      unsigned int v52 = [v101 nonWhiteSpaceCountFromToken:v30 toToken:v34];
                      v53 = [v104 label];
                      v54 = [v104 label];
                      unsigned int v99 = v52;
                      if ([v54 isEqualToString:@"integer"])
                      {

LABEL_34:
                        v63 = v97;
                        v62 = v98;
                        if (v98 && v97)
                        {
                          v64 = &off_2647A2000;
                        }
                        else
                        {
                          v65 = [v101 locale];
                          uint64_t v66 = +[CDMRegexSpanMatcher getNumberFormatter:v65];

                          uint64_t v67 = +[CDMRegexSpanMatcher getNumberFormatterForOutput];

                          v64 = &off_2647A2000;
                          id v6 = v101;
                          v63 = (void *)v67;
                          v62 = v66;
                        }
                        v68 = v64[460];
                        v41 = v104;
                        v69 = [v104 label];
                        v97 = v63;
                        v98 = v62;
                        uint64_t v70 = objc_msgSend(v68, "getNumberString:numberFormatter:numberFormatterForOutput:integerOnly:", v46, v62, v63, objc_msgSend(v69, "isEqualToString:", @"integer"));

                        v53 = (void *)v70;
                      }
                      else
                      {
                        v60 = [v104 label];
                        int v61 = [v60 isEqualToString:@"decimal"];

                        if (v61) {
                          goto LABEL_34;
                        }
                      }
                      v71 = [v41 label];
                      uint64_t v72 = [v21 range];
                      int v73 = [v21 range];
                      [v21 range];
                      v75 = +[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:v71 withSemantic:v53 withInput:v46 withStartCharIndex:v72 withEndCharIndex:(v74 + v73) withTokenCount:v99];
                      v59 = v102;
                      [v102 setUsoGraph:v75];

                      goto LABEL_40;
                    }
                  }
                  v37 = CDMLogContext;
                  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
                    __int16 v117 = 2112;
                    v118 = @"spanmatch";
                    __int16 v119 = 1024;
                    LODWORD(v120) = v34;
                    _os_log_impl(&dword_2263A0000, v37, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nInvalid end token index for regex span matcher, endTokenIdx=%d", buf, 0x1Cu);
                  }
LABEL_42:
                  ++v20;
                }
                while (v106 != v20);
                uint64_t v81 = [v103 countByEnumeratingWithState:&v107 objects:v127 count:16];
                uint64_t v106 = v81;
              }
              while (v81);
            }

            uint64_t v16 = v95 + 1;
            v13 = v96;
          }
          while (v95 + 1 != v94);
          uint64_t v94 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v128 count:16];
          if (!v94) {
            goto LABEL_61;
          }
        }
      }
      v97 = 0;
      v98 = 0;
LABEL_61:

      v84 = (id)CDMLogContext;
      v85 = v84;
      if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v85, OS_SIGNPOST_INTERVAL_END, spid, "SpanMatcher", "", buf, 2u);
      }

      v82 = v13;
      v83 = v98;
    }
    else
    {
      v83 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
        _os_log_impl(&dword_2263A0000, v83, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher received nil utterance", buf, 0xCu);
      }
      v82 = 0;
    }
  }
  else
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v116 = "-[CDMRegexSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s CDMRegexSpanMatcher no regex entities loaded", buf, 0xCu);
    }
    v82 = 0;
  }

  return v82;
}

- (CDMRegexSpanMatcher)initWithCachePath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMRegexSpanMatcher;
  v5 = [(CDMRegexSpanMatcher *)&v12 init];
  if (v5)
  {
    if (!v4)
    {
      id v6 = NSTemporaryDirectory();
      id v4 = [v6 stringByStandardizingPath];
    }
    os_signpost_id_t v7 = [v4 stringByAppendingPathComponent:@"regex.jsonl"];
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CDMRegexSpanMatcher initWithCachePath:]";
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Loading CDMRegexSpanMatcher data from %@", buf, 0x16u);
    }

    uint64_t v9 = +[CDMRegexSpanMatcher readRegexAssetFromPath:v7];
    regexEntries = v5->_regexEntries;
    v5->_regexEntries = (NSArray *)v9;
  }
  return v5;
}

+ (id)getNumberString:(id)a3 numberFormatter:(id)a4 numberFormatterForOutput:(id)a5 integerOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (!v10) {
      goto LABEL_12;
    }
    objc_super v12 = [v10 numberFromString:v9];
    if (!v12) {
      goto LABEL_12;
    }
    v13 = v12;
    if (v6)
    {
      int v14 = [v12 intValue];
      __int16 v15 = [NSNumber numberWithInteger:v14];
      uint64_t v16 = [v15 stringValue];
    }
    else
    {
      if (v11) {
        [v11 stringFromNumber:v12];
      }
      else {
      uint64_t v16 = [v12 stringValue];
      }
    }

    if (!v16)
    {
LABEL_12:
      if (v6)
      {
        id v17 = [v9 stringByReplacingOccurrencesOfString:@"," withString:&stru_26DA24FF0];
      }
      else
      {
        id v17 = v9;
      }
      uint64_t v16 = v17;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)getNumberFormatterForOutput
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];
  [v2 setNumberStyle:1];
  [v2 setUsesGroupingSeparator:0];
  [v2 setMaximumFractionDigits:15];

  return v2;
}

+ (id)getNumberFormatter:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F08A30];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v4];

    [v5 setNumberStyle:1];
    [v5 setLocale:v6];
    [v5 setUsesGroupingSeparator:1];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)readRegexAssetFromPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = (void *)MEMORY[0x263EFF980];
    id v4 = a3;
    id v5 = [v3 array];
    id v15 = 0;
    BOOL v6 = [NSString stringWithContentsOfFile:v4 encoding:4 error:&v15];

    id v7 = v15;
    if (v7)
    {
      v8 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v17 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]";
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Error while loading CDMRegexSpanMatcher asset %@", buf, 0x16u);
      }
      id v9 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x263F08708] newlineCharacterSet];
      v8 = [v6 componentsSeparatedByCharactersInSet:v10];

      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __46__CDMRegexSpanMatcher_readRegexAssetFromPath___block_invoke;
      v13[3] = &unk_2647A54D0;
      id v11 = v5;
      id v14 = v11;
      [v8 enumerateObjectsUsingBlock:v13];
      id v9 = v11;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void __46__CDMRegexSpanMatcher_readRegexAssetFromPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];
  char v6 = [v5 isEqualToString:&stru_26DA24FF0];

  if ((v6 & 1) == 0)
  {
    id v7 = [v3 dataUsingEncoding:4];
    id v16 = 0;
    v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:&v16];
    id v9 = v16;
    if (v9)
    {
      id v10 = v9;
      id v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v18 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Error while processing regex matcher file for CDMRegexSpanMatcher: %@", buf, 0x16u);
      }
    }
    else
    {
      id v11 = [v8 objectForKey:@"label"];
      objc_super v12 = [v8 objectForKey:@"regex"];
      id v15 = 0;
      v13 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v12 options:0 error:&v15];
      id v10 = v15;
      if (v10)
      {
        CDMOSLoggerForCategory(0);
        id v14 = (CDMRegexEntry *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v18 = "+[CDMRegexSpanMatcher readRegexAssetFromPath:]_block_invoke";
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl(&dword_2263A0000, &v14->super, OS_LOG_TYPE_INFO, "%s Error while reading regular expression for CDMRegexSpanMatcher %@", buf, 0x16u);
        }
      }
      else
      {
        id v14 = [[CDMRegexEntry alloc] initWithRegex:v13 label:v11];
        [*(id *)(a1 + 32) addObject:v14];
      }
    }
  }
}

@end