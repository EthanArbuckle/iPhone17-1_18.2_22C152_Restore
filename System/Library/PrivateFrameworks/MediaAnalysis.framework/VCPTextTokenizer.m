@interface VCPTextTokenizer
- (VCPTextTokenizer)init;
- (id)bytePairEncoding:(id)a3;
- (id)encode:(id)a3;
- (id)textPreProcessing:(id)a3;
- (id)whitespaceClean:(id)a3;
@end

@implementation VCPTextTokenizer

- (VCPTextTokenizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPTextTokenizer;
  v2 = [(VCPTextTokenizer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    [(NSMutableDictionary *)v2->_cache setObject:@"<|startoftext|>" forKeyedSubscript:@"<|startoftext|>"];
    [(NSMutableDictionary *)v2->_cache setObject:@"<|endoftext|>" forKeyedSubscript:@"<|endoftext|>"];
  }
  return v2;
}

- (id)whitespaceClean:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s+" options:0 error:&v12];
  id v5 = v12;
  objc_super v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedDescription];
    NSLog(&cfstr_ErrorCreatingR.isa, v7);

    id v8 = v3;
  }
  else
  {
    v9 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @" ");
    v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v8 = [v9 stringByTrimmingCharactersInSet:v10];
  }
  return v8;
}

- (id)textPreProcessing:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCPTextTokenizer *)self whitespaceClean:a3];
  v4 = [v3 lowercaseString];

  id v23 = 0;
  id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"<\\|startoftext\\|>|<\\|endoftext\\|>|'s|'t|'re|'ve|'m|'ll|'d|[[:alpha:]]+|[[:digit:]]|[^\\s[:alpha:][:digit:]]+" options:1 error:&v23];
  id v6 = v23;
  if (!v6)
  {
    v10 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = v10;
    uint64_t v12 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "range", (void)v19);
          v17 = objc_msgSend(v4, "substringWithRange:", v15, v16);
          [v11 addObject:v17];
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v11];

    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "Error creating regex: %@", buf, 0xCu);
    }
    v9 = 0;
LABEL_14:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)bytePairEncoding:(id)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  v4 = -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:");

  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v52];
    v68[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    goto LABEL_45;
  }
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v52, "length"));
  unint64_t v8 = 0;
  v57 = v7;
  while (v8 < [v52 length] - 1)
  {
    __int16 v63 = 0;
    __int16 v63 = [v52 characterAtIndex:v8];
    v9 = [NSString stringWithCharacters:&v63 length:1];
    [v7 addObject:v9];

    ++v8;
    v7 = v57;
  }
  __int16 v63 = 0;
  __int16 v63 = objc_msgSend(v52, "characterAtIndex:", objc_msgSend(v52, "length") - 1);
  v49 = [NSString stringWithCharacters:&v63 length:1];
  v50 = [v49 stringByAppendingString:@"</w>"];
  objc_msgSend(v7, "addObject:");
  v54 = [MEMORY[0x1E4F1CA80] set];
  v53 = [v7 objectAtIndexedSubscript:0];
  for (unint64_t i = 1; i < [v7 count]; ++i)
  {
    uint64_t v11 = [v7 objectAtIndexedSubscript:i];
    v67[0] = v53;
    v67[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    [v54 addObject:v12];

    v53 = (void *)v11;
    v7 = v57;
  }
  if (!v54)
  {
    v47 = [v52 stringByAppendingString:@"</w>"];
    v66 = v47;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    v54 = 0;
    goto LABEL_44;
  }
  do
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v54;
    uint64_t v13 = 0;
    v14 = 0;
    uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v60;
      double v17 = INFINITY;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v60 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          bpeRanks = self->_bpeRanks;
          long long v21 = [v19 componentsJoinedByString:@" "];
          uint64_t v22 = [(NSDictionary *)bpeRanks objectForKey:v21];

          if (v22) {
            id v23 = (void *)v22;
          }
          else {
            id v23 = &unk_1F15EABF8;
          }
          [v23 doubleValue];
          if (v24 < v17)
          {
            [v23 doubleValue];
            double v17 = v25;
            uint64_t v26 = [v19 componentsJoinedByString:@" "];

            id v27 = v19;
            uint64_t v13 = v27;
            v14 = (void *)v26;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      }
      while (v15);
    }

    v28 = [(NSDictionary *)self->_bpeRanks objectForKey:v14];
    BOOL v29 = v28 == 0;

    if (v29)
    {

      id v41 = v57;
      v54 = obj;
      break;
    }
    v56 = [v13 objectAtIndexedSubscript:0];
    v30 = v57;
    v51 = [v13 objectAtIndexedSubscript:1];
    v55 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v31 = 0;
    while (v31 < [v30 count])
    {
      uint64_t v32 = objc_msgSend(v57, "indexOfObject:inRange:", v56, v31, objc_msgSend(v30, "count") - v31);
      unint64_t v33 = v32;
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = objc_msgSend(v57, "subarrayWithRange:", v31, objc_msgSend(v57, "count") - v31);
        [v55 addObjectsFromArray:v40];

        v30 = v57;
        break;
      }
      v34 = objc_msgSend(v57, "subarrayWithRange:", v31, v32 - v31);
      [v55 addObjectsFromArray:v34];

      v35 = [v57 objectAtIndexedSubscript:v33];
      if ([v35 isEqualToString:v56] && v33 < objc_msgSend(v57, "count") - 1)
      {
        v36 = [v57 objectAtIndexedSubscript:v33 + 1];
        int v37 = [v36 isEqualToString:v51];

        if (!v37) {
          goto LABEL_31;
        }
        v38 = [v56 stringByAppendingString:v51];
        [v55 addObject:v38];

        unint64_t v31 = v33 + 2;
        v30 = v57;
      }
      else
      {

LABEL_31:
        v39 = [v57 objectAtIndexedSubscript:v33];
        [v55 addObject:v39];

        unint64_t v31 = v33 + 1;
        v30 = v57;
      }
    }
    id v41 = v55;

    uint64_t v42 = [v41 count];
    if (v42 == 1)
    {
      v54 = obj;
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA80] set];

      v43 = [v41 objectAtIndexedSubscript:0];
      for (unint64_t k = 1; k < [v41 count]; ++k)
      {
        uint64_t v45 = [v41 objectAtIndexedSubscript:k];
        v64[0] = v43;
        v64[1] = v45;
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
        [v54 addObject:v46];

        v43 = (void *)v45;
      }
    }
    v57 = v41;
  }
  while (v42 != 1);
  v47 = [v41 componentsJoinedByString:@" "];
  [(NSMutableDictionary *)self->_cache setObject:v47 forKeyedSubscript:v52];
  id v6 = v41;
  v57 = v6;
LABEL_44:

  id v5 = v57;
LABEL_45:

  return v6;
}

- (id)encode:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  __int16 v63 = [v4 resourceURL];

  if (!self->_encoder)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"encoder.json" relativeToURL:v63];
    id v6 = [v5 path];

    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
    id v85 = 0;
    unint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v85];
    id v9 = v85;
    encoder = self->_encoder;
    self->_encoder = v8;

    if (v9 && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v90 = v12;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);
      }
    }
  }
  if (!self->_decoder)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"decoder.json" relativeToURL:v63];
    v14 = [v13 path];

    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v14];
    id v84 = 0;
    uint64_t v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:&v84];
    id v17 = v84;
    decoder = self->_decoder;
    self->_decoder = v16;

    if (v17 && (int)MediaAnalysisLogLevel() >= 3)
    {
      long long v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v17 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v90 = v20;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);
      }
    }
  }
  if (!self->_bytesToUnicode)
  {
    long long v21 = [MEMORY[0x1E4F1CB10] URLWithString:@"bytes_to_unicode.json" relativeToURL:v63];
    uint64_t v22 = [v21 path];

    id v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v22];
    id v83 = 0;
    double v24 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v23 options:0 error:&v83];
    id v25 = v83;
    bytesToUnicode = self->_bytesToUnicode;
    self->_bytesToUnicode = v24;

    if (v25 && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = [v25 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v90 = v28;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);
      }
    }
  }
  if (!self->_bpeRanks)
  {
    BOOL v29 = [MEMORY[0x1E4F1CB10] URLWithString:@"bpe_ranks.json" relativeToURL:v63];
    v30 = [v29 path];

    unint64_t v31 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v30];
    id v82 = 0;
    uint64_t v32 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v31 options:0 error:&v82];
    id v33 = v82;
    bpeRanks = self->_bpeRanks;
    self->_bpeRanks = v32;

    if (v33 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = [v33 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v90 = v36;
        _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_ERROR, "Error reading JSON file: %@", buf, 0xCu);
      }
    }
  }
  long long v61 = [(VCPTextTokenizer *)self textPreProcessing:v62];
  id v67 = [MEMORY[0x1E4F1CA48] array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obunint64_t j = v61;
  uint64_t v68 = [obj countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v79 != v66) {
          objc_enumerationMutation(obj);
        }
        int v37 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        v38 = [MEMORY[0x1E4F1CA48] array];
        for (unint64_t j = 0; j < [v37 length]; ++j)
        {
          unsigned int v40 = [v37 characterAtIndex:j];
          id v41 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v40);
          id v42 = [v41 dataUsingEncoding:4];
          uint64_t v43 = [v42 bytes];
          for (unint64_t k = 0; k < [v42 length]; ++k)
          {
            uint64_t v45 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v43 + k)];
            [v38 addObject:v45];
          }
        }
        v46 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F15A0D70];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v47 = v38;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v87 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v75;
          do
          {
            for (uint64_t m = 0; m != v48; ++m)
            {
              if (*(void *)v75 != v49) {
                objc_enumerationMutation(v47);
              }
              v51 = self->_bytesToUnicode;
              id v52 = [*(id *)(*((void *)&v74 + 1) + 8 * m) stringValue];
              v53 = [(NSDictionary *)v51 objectForKeyedSubscript:v52];
              [v46 appendString:v53];
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v87 count:16];
          }
          while (v48);
        }

        v65 = [(VCPTextTokenizer *)self bytePairEncoding:v46];
        v54 = [MEMORY[0x1E4F1CA48] array];
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v55 = v65;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v71;
          do
          {
            for (uint64_t n = 0; n != v56; ++n)
            {
              if (*(void *)v71 != v57) {
                objc_enumerationMutation(v55);
              }
              long long v59 = [(NSDictionary *)self->_encoder objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * n)];
              if (v59) {
                [v54 addObject:v59];
              }
            }
            uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v86 count:16];
          }
          while (v56);
        }

        [v67 addObjectsFromArray:v54];
      }
      uint64_t v68 = [obj countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v68);
  }

  [v67 insertObject:&unk_1F15EB490 atIndex:0];
  [v67 addObject:&unk_1F15EB4A8];

  return v67;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_bpeRanks, 0);
  objc_storeStrong((id *)&self->_bytesToUnicode, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
}

@end