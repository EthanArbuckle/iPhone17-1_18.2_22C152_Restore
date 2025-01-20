@interface FedStatsCategoricalTypeHuffmanEncoder
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeHuffmanEncoder)initWithHuffmanEncoderDatabase:(id)a3 tableName:(id)a4 lookupColumnName:(id)a5 codeColumnName:(id)a6 unknownTokenBitString:(id)a7 endTokenBitString:(id)a8 specialTokenBitStrings:(id)a9 exploreUnknownToken:(BOOL)a10;
- (FedStatsCategoricalTypeTokenizerProtocol)explorationTokenizer;
- (FedStatsSQLiteDatabase)huffmanDB;
- (NSDictionary)specialTokenBitStrings;
- (NSString)codeColumnName;
- (NSString)endTokenBitString;
- (NSString)lookupColumnName;
- (NSString)tableName;
- (NSString)unknownTokenBitString;
- (id)codeForToken:(id)a3;
- (id)preEncode:(id)a3;
@end

@implementation FedStatsCategoricalTypeHuffmanEncoder

- (FedStatsCategoricalTypeHuffmanEncoder)initWithHuffmanEncoderDatabase:(id)a3 tableName:(id)a4 lookupColumnName:(id)a5 codeColumnName:(id)a6 unknownTokenBitString:(id)a7 endTokenBitString:(id)a8 specialTokenBitStrings:(id)a9 exploreUnknownToken:(BOOL)a10
{
  id v17 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)FedStatsCategoricalTypeHuffmanEncoder;
  v19 = [(FedStatsCategoricalTypeHuffmanEncoder *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_huffmanDB, a3);
    objc_storeStrong((id *)&v20->_tableName, a4);
    objc_storeStrong((id *)&v20->_lookupColumnName, a5);
    objc_storeStrong((id *)&v20->_codeColumnName, a6);
    objc_storeStrong((id *)&v20->_unknownTokenBitString, a7);
    objc_storeStrong((id *)&v20->_endTokenBitString, a8);
    objc_storeStrong((id *)&v20->_specialTokenBitStrings, a9);
    if (a10)
    {
      uint64_t v21 = +[FedStatsCategoricalTypeCharacterTokenizer instanceWithParameters:MEMORY[0x263EFFA78] error:0];
      explorationTokenizer = v20->_explorationTokenizer;
      v20->_explorationTokenizer = (FedStatsCategoricalTypeTokenizerProtocol *)v21;
    }
    else
    {
      explorationTokenizer = v20->_explorationTokenizer;
      v20->_explorationTokenizer = 0;
    }
  }
  return v20;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v105[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 objectForKey:@"fileName"];
  if (!v7)
  {
    if (a4)
    {
      v23 = LABEL_24:;
      *a4 = +[FedStatsError errorWithCode:101 description:v23];
    }
LABEL_25:
    id v24 = 0;
    goto LABEL_89;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  id v8 = [NSURL URLWithString:v7];
LABEL_8:
  v9 = v8;
  v10 = [v6 objectForKey:@"tableName"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v6 objectForKey:@"valueColumnName"];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v6 objectForKey:@"indexColumnName"];
          if (v12)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v103 = 0;
              v13 = +[FedStatsSQLiteDatabase databaseWithURL:v9 mode:114 error:&v103];
              id v14 = v103;
              v15 = v14;
              if (!v13)
              {
                if (a4)
                {
                  +[FedStatsError errorWithCode:101 underlyingError:v14 description:@"Cannot load Huffman database"];
                  id v24 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v24 = 0;
                }
                goto LABEL_85;
              }
              id v78 = v14;
              v94 = v12;
              v82 = v11;
              [NSString stringWithFormat:@"SELECT COUNT(1) AS %@ FROM SQLITE_MASTER WHERE type == 'table' AND name == '%@'", @"tableCount", v10];
              v87 = v102[1] = 0;
              v93 = v13;
              v16 = objc_msgSend(v13, "runQuery:error:");
              id v17 = 0;
              v77 = v9;
              if (v16 && ([v16 next], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v19 = v18;
                v20 = [v18 objectForKey:@"tableCount"];
                uint64_t v21 = v20;
                if (v20 && [v20 unsignedIntegerValue] == 1)
                {
                  int v22 = 0;
                }
                else
                {
                  if (a4) {
                    id v28 = {;
                  }
                    *a4 = +[FedStatsError errorWithCode:101 description:v28];
                  }
                  int v22 = 1;
                }
              }
              else
              {
                if (a4)
                {
                  *a4 = +[FedStatsError errorWithCode:101 underlyingError:v17 description:@"Cannot query list of tables in Huffman database"];
                }
                int v22 = 1;
              }
              v11 = v82;

              if (v22)
              {
                id v24 = 0;
                v9 = v77;
                v15 = v78;
                v13 = v93;
                v12 = v94;
                goto LABEL_85;
              }
              uint64_t v29 = [NSString stringWithFormat:@"SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'", @"columnCount", v10, v82];
              v102[0] = 0;
              v13 = v93;
              v30 = [v93 runQuery:v29 error:v102];
              id v84 = v102[0];
              v88 = (void *)v29;
              if (v30 && ([v30 next], (v31 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                id obj = v31;
                v32 = [v31 objectForKey:@"columnCount"];
                v33 = v32;
                v15 = v78;
                if (v32 && [v32 unsignedIntegerValue] == 1)
                {
                  int v34 = 0;
                }
                else
                {
                  if (a4) {
                    v36 = {;
                  }
                    *a4 = +[FedStatsError errorWithCode:101 description:v36];

                    v13 = v93;
                  }
                  int v34 = 1;
                }
              }
              else
              {
                if (a4)
                {
                  v35 = v84;
                  *a4 = +[FedStatsError errorWithCode:101 underlyingError:v84 description:@"Cannot query list of columns in Huffman database table"];
                  int v34 = 1;
                  v15 = v78;
LABEL_67:

                  if (v34)
                  {
                    id v24 = 0;
                    v9 = v77;
                    v11 = v82;
                  }
                  else
                  {
                    [NSString stringWithFormat:@"SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'", @"columnCount", v10, v94];
                    v89 = uint64_t v101 = 0;
                    v37 = objc_msgSend(v13, "runQuery:error:");
                    id v38 = 0;
                    v85 = v37;
                    if (v37 && ([v37 next], (v39 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      v40 = v39;
                      v41 = [v39 objectForKey:@"columnCount"];
                      if (v41
                        && (id objb = v40,
                            v42 = v41,
                            BOOL v43 = [v41 unsignedIntegerValue] == 1,
                            v41 = v42,
                            v40 = objb,
                            v43))
                      {
                        int v44 = 0;
                      }
                      else
                      {
                        if (a4)
                        {
                          v46 = v45 = v41;
                          *a4 = +[FedStatsError errorWithCode:101 description:v46];

                          v41 = v45;
                          v13 = v93;
                        }
                        int v44 = 1;
                      }

                      v11 = v82;
                    }
                    else
                    {
                      if (a4)
                      {
                        *a4 = +[FedStatsError errorWithCode:101 underlyingError:v38 description:@"Cannot query list of columns in Huffman database table"];
                      }
                      int v44 = 1;
                      v11 = v82;
                    }

                    if (!v44)
                    {
                      [NSString stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1", v94, v10, v11, @"<ET>"];
                      v90 = uint64_t v100 = 0;
                      v48 = objc_msgSend(v13, "runQuery:error:");
                      id v49 = 0;
                      if (v48
                        && ([v48 next], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        v51 = v50;
                        v52 = v49;
                        uint64_t v76 = [v50 objectForKey:v94];

                        int v53 = 1;
                      }
                      else
                      {
                        v52 = v49;
                        if (a4)
                        {
                          +[FedStatsError errorWithCode:101 underlyingError:v49 description:@"Cannot query end token in Huffman database table"];
                          uint64_t v76 = 0;
                          int v53 = 0;
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          uint64_t v76 = 0;
                          int v53 = 0;
                        }
                      }

                      if (v53)
                      {
                        [NSString stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1", v94, v10, v82, @"<UT>"];
                        v91 = uint64_t v99 = 0;
                        v54 = objc_msgSend(v13, "runQuery:error:");
                        id v55 = 0;
                        if (v54
                          && ([v54 next], (v56 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          v57 = v56;
                          v58 = v55;
                          uint64_t v75 = [v56 objectForKey:v94];

                          int v59 = 1;
                        }
                        else
                        {
                          v58 = v55;
                          if (a4)
                          {
                            +[FedStatsError errorWithCode:101 underlyingError:v55 description:@"Cannot query unknown token in Huffman database table"];
                            uint64_t v75 = 0;
                            int v59 = 0;
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            uint64_t v75 = 0;
                            int v59 = 0;
                          }
                        }

                        if (v59)
                        {
                          v86 = [MEMORY[0x263EFF9A0] dictionary];
                          v105[0] = @"<BT>";
                          v105[1] = @"<number>";
                          v105[2] = @"<person>";
                          v105[3] = @"<location>";
                          [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:4];
                          long long v95 = 0u;
                          long long v96 = 0u;
                          long long v97 = 0u;
                          long long v98 = 0u;
                          id obja = (id)objc_claimAutoreleasedReturnValue();
                          v61 = v82;
                          uint64_t v92 = [obja countByEnumeratingWithState:&v95 objects:v104 count:16];
                          if (v92)
                          {
                            uint64_t v83 = *(void *)v96;
                            do
                            {
                              for (uint64_t i = 0; i != v92; ++i)
                              {
                                if (*(void *)v96 != v83) {
                                  objc_enumerationMutation(obja);
                                }
                                uint64_t v63 = *(void *)(*((void *)&v95 + 1) + 8 * i);
                                v64 = [NSString stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1", v94, v10, v61, v63];
                                v65 = [v93 runQuery:v64 error:0];
                                v66 = [v65 next];
                                v67 = v66;
                                if (v66)
                                {
                                  v68 = [v66 objectForKeyedSubscript:v94];
                                  [v86 setObject:v68 forKeyedSubscript:v63];

                                  v61 = v82;
                                }
                                else
                                {
                                  [v86 setObject:&stru_270008ED0 forKeyedSubscript:v63];
                                }
                              }
                              uint64_t v92 = [obja countByEnumeratingWithState:&v95 objects:v104 count:16];
                            }
                            while (v92);
                          }

                          v69 = [v6 objectForKey:@"exploreUnknownToken"];
                          if (!v69 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            uint64_t v70 = [NSNumber numberWithBool:0];

                            v69 = (void *)v70;
                          }
                          id v71 = objc_alloc((Class)a1);
                          LOBYTE(v74) = [v69 BOOLValue];
                          v72 = v71;
                          v13 = v93;
                          v11 = v82;
                          v73 = (void *)v75;
                          v60 = (void *)v76;
                          id v24 = (void *)[v72 initWithHuffmanEncoderDatabase:v93 tableName:v10 lookupColumnName:v82 codeColumnName:v94 unknownTokenBitString:v75 endTokenBitString:v76 specialTokenBitStrings:v86 exploreUnknownToken:v74];

                          v9 = v77;
                        }
                        else
                        {
                          id v24 = 0;
                          v60 = (void *)v76;
                          v9 = v77;
                          v11 = v82;
                          v73 = (void *)v75;
                        }

                        v12 = v94;
                        v15 = v78;
                      }
                      else
                      {
                        id v24 = 0;
                        v9 = v77;
                        v15 = v78;
                        v11 = v82;
                        v12 = v94;
                        v60 = (void *)v76;
                      }

                      goto LABEL_85;
                    }
                    id v24 = 0;
                    v9 = v77;
                  }
                  v12 = v94;
LABEL_85:

                  goto LABEL_86;
                }
                int v34 = 1;
                v15 = v78;
              }
              v35 = v84;
              goto LABEL_67;
            }
            if (a4)
            {
              goto LABEL_40;
            }
          }
          else if (a4)
          {
            id v27 = LABEL_40:;
            *a4 = +[FedStatsError errorWithCode:101 description:v27];
          }
          id v24 = 0;
LABEL_86:

          goto LABEL_87;
        }
        if (a4)
        {
          goto LABEL_34;
        }
      }
      else if (a4)
      {
        id v26 = LABEL_34:;
        *a4 = +[FedStatsError errorWithCode:101 description:v26];
      }
      id v24 = 0;
LABEL_87:

      goto LABEL_88;
    }
    if (a4)
    {
      goto LABEL_28;
    }
  }
  else if (a4)
  {
    id v25 = LABEL_28:;
    *a4 = +[FedStatsError errorWithCode:101 description:v25];
  }
  id v24 = 0;
LABEL_88:

LABEL_89:
  return v24;
}

- (id)codeForToken:(id)a3
{
  id v4 = a3;
  v5 = [(FedStatsCategoricalTypeHuffmanEncoder *)self specialTokenBitStrings];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [(FedStatsCategoricalTypeHuffmanEncoder *)self specialTokenBitStrings];
    id v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    v9 = NSString;
    v10 = [(FedStatsCategoricalTypeHuffmanEncoder *)self codeColumnName];
    v11 = [(FedStatsCategoricalTypeHuffmanEncoder *)self tableName];
    v12 = [(FedStatsCategoricalTypeHuffmanEncoder *)self lookupColumnName];
    v7 = [v9 stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1", v10, v11, v12, @"%@"];

    v13 = objc_msgSend(NSString, "stringWithFormat:", v7, v4);
    id v14 = [(FedStatsCategoricalTypeHuffmanEncoder *)self huffmanDB];
    v15 = [v14 runQuery:v13 error:0];

    if (v15 && ([v15 next], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v17 = (void *)v16;
      id v18 = [(FedStatsCategoricalTypeHuffmanEncoder *)self codeColumnName];
      id v8 = [v17 objectForKey:v18];
    }
    else
    {
      id v8 = [(FedStatsCategoricalTypeHuffmanEncoder *)self unknownTokenBitString];
    }
  }
  return v8;
}

- (id)preEncode:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v32 = v5;
    id v7 = v5;
    uint64_t v36 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v36)
    {
      uint64_t v8 = *(void *)v42;
      unint64_t v9 = 0x263F08000uLL;
      id v34 = v7;
      v35 = v6;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v12 = [(FedStatsCategoricalTypeHuffmanEncoder *)self codeForToken:v11];
          v13 = [(FedStatsCategoricalTypeHuffmanEncoder *)self unknownTokenBitString];
          int v14 = [v13 isEqual:v12];

          if (v14)
          {
            v15 = [*(id *)(v9 + 2880) stringWithFormat:@"%@", v11];
            uint64_t v16 = [(FedStatsCategoricalTypeHuffmanEncoder *)self explorationTokenizer];
            if (v16 && (id v17 = (void *)v16, v18 = [v15 length], v17, v18 != 1))
            {
              v19 = [(FedStatsCategoricalTypeHuffmanEncoder *)self explorationTokenizer];
              v20 = [v19 tokenize:v15];

              uint64_t v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v22 = v20;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v38 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    id v27 = [(FedStatsCategoricalTypeHuffmanEncoder *)self codeForToken:*(void *)(*((void *)&v37 + 1) + 8 * j)];
                    [v21 addObject:v27];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
                }
                while (v24);
              }

              id v28 = [v21 componentsJoinedByString:&stru_270008ED0];
              id v6 = v35;
              [v35 addObject:v28];

              uint64_t v8 = v33;
              id v7 = v34;
              unint64_t v9 = 0x263F08000;
            }
            else
            {
              [v6 addObject:v12];
            }
          }
          else
          {
            [v6 addObject:v12];
          }
        }
        uint64_t v36 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v36);
    }

    uint64_t v29 = [(FedStatsCategoricalTypeHuffmanEncoder *)self endTokenBitString];
    [v6 addObject:v29];

    v30 = [v6 componentsJoinedByString:&stru_270008ED0];

    v5 = v32;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  v31[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = [v13 objectForKey:@"fileName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a8 = (id *)v13;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = 0;
    id v17 = +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:v16 requiredForCollectionKey:0 error:&v30];
    id v18 = v30;
    v19 = v18;
    if (v17)
    {
      if (v14)
      {
        id v29 = v18;
        v20 = [v17 assetSpecifierValueForDataPoint:v14 error:&v29];
        id v28 = v29;

        if (v20)
        {
          if (v15)
          {
            uint64_t v21 = [v15 objectForKey:v20];
            if (v21)
            {
              a8 = (id *)[v13 mutableCopy];
              [a8 setObject:v21 forKey:@"fileName"];
            }
            else if (a8)
            {
              id v26 = [NSString stringWithFormat:@"Missing asset URL for '%@'", v20];
              *a8 = +[FedStatsError errorWithCode:300 description:v26];

              a8 = 0;
            }
          }
          else
          {
            if (a7)
            {
              v31[0] = v20;
              *a7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
            }
            a8 = (id *)v13;
          }
        }
        else if (a8)
        {
          uint64_t v25 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v16];
          uint64_t v24 = v28;
          *a8 = +[FedStatsError errorWithCode:300 underlyingError:v28 description:v25];

          a8 = 0;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v24 = v28;
        goto LABEL_27;
      }
      if (a6)
      {
        *a6 = [v17 parameters];
      }
      a8 = (id *)v13;
    }
    else if (a8)
    {
      uint64_t v23 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v16];
      *a8 = +[FedStatsError errorWithCode:300 underlyingError:v19 description:v23];

      a8 = 0;
    }
    uint64_t v24 = v19;
LABEL_28:

    goto LABEL_29;
  }
  if (a8)
  {
    id v22 = [NSString stringWithFormat:@"Value for '%@' must be either a string or URL", @"fileName"];
    *a8 = +[FedStatsError errorWithCode:302 description:v22];

    a8 = 0;
  }
LABEL_29:

  return a8;
}

- (FedStatsSQLiteDatabase)huffmanDB
{
  return self->_huffmanDB;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)lookupColumnName
{
  return self->_lookupColumnName;
}

- (NSString)codeColumnName
{
  return self->_codeColumnName;
}

- (NSString)unknownTokenBitString
{
  return self->_unknownTokenBitString;
}

- (NSString)endTokenBitString
{
  return self->_endTokenBitString;
}

- (NSDictionary)specialTokenBitStrings
{
  return self->_specialTokenBitStrings;
}

- (FedStatsCategoricalTypeTokenizerProtocol)explorationTokenizer
{
  return self->_explorationTokenizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explorationTokenizer, 0);
  objc_storeStrong((id *)&self->_specialTokenBitStrings, 0);
  objc_storeStrong((id *)&self->_endTokenBitString, 0);
  objc_storeStrong((id *)&self->_unknownTokenBitString, 0);
  objc_storeStrong((id *)&self->_codeColumnName, 0);
  objc_storeStrong((id *)&self->_lookupColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_huffmanDB, 0);
}

@end