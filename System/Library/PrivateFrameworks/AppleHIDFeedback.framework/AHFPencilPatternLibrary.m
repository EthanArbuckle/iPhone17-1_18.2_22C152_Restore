@interface AHFPencilPatternLibrary
- (AHFPencilPatternLibrary)init;
- (BOOL)isReport:(id)a3 equalTo:(id)a4;
- (NSDictionary)library;
- (id)allPatterns;
- (id)createPatternsLibraryFrom:(id)a3;
- (id)getReportForPattern:(id)a3 timestampUs:(unint64_t)a4 prevTimestampUs:(unint64_t)a5 error:(id *)a6;
- (id)maybeGetExploratoryPayload:(id)a3;
- (id)waveformIndexWithType:(id)a3;
- (void)init;
- (void)setLibrary:(id)a3;
@end

@implementation AHFPencilPatternLibrary

- (AHFPencilPatternLibrary)init
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)AHFPencilPatternLibrary;
  v2 = [(AHFPencilPatternLibrary *)&v32 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 URLsForResourcesWithExtension:@"pattern" subdirectory:@"Patterns/Pencil"];

    v29 = (void *)v4;
    v5 = [(AHFPencilPatternLibrary *)v2 createPatternsLibraryFrom:v4];
    v6 = LoggingFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 count];
      v8 = [v5 allKeys];
      *(_DWORD *)buf = 136315650;
      v34 = "-[AHFPencilPatternLibrary init]";
      __int16 v35 = 2048;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_247F8A000, v6, OS_LOG_TYPE_DEFAULT, "%s Loaded %lu haptics patterns: %@", buf, 0x20u);
    }
    if (isInternalBuild())
    {
      v9 = [NSURL fileURLWithPath:@"/AppleInternal/Library/Application Support/AppleHIDFeedback/Patterns/Pencil"];
      v28 = [MEMORY[0x263F08850] defaultManager];
      v10 = [v28 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:0 error:0];
      v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"pathExtension == %@", @"pattern"];
      v12 = [v10 filteredArrayUsingPredicate:v11];
      v13 = [(AHFPencilPatternLibrary *)v2 createPatternsLibraryFrom:v12];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __31__AHFPencilPatternLibrary_init__block_invoke;
      v30[3] = &unk_265236088;
      id v14 = v13;
      id v31 = v14;
      v15 = [v5 keysOfEntriesPassingTest:v30];
      if ([v15 count])
      {
        v16 = LoggingFramework();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          [(AHFPencilPatternLibrary *)(uint64_t)v15 init];
        }
      }
      v17 = LoggingFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v12;
        v19 = v11;
        v20 = v9;
        uint64_t v21 = [v14 count];
        [v14 allKeys];
        v22 = v27 = v10;
        *(_DWORD *)buf = 136315650;
        v34 = "-[AHFPencilPatternLibrary init]";
        __int16 v35 = 2048;
        uint64_t v36 = v21;
        v9 = v20;
        v11 = v19;
        v12 = v18;
        __int16 v37 = 2112;
        v38 = v22;
        _os_log_impl(&dword_247F8A000, v17, OS_LOG_TYPE_DEFAULT, "%s Loaded %lu internal haptics patterns: %@", buf, 0x20u);

        v10 = v27;
      }

      [v5 addEntriesFromDictionary:v14];
    }
    uint64_t v23 = [NSDictionary dictionaryWithDictionary:v5];
    library = v2->_library;
    v2->_library = (NSDictionary *)v23;

    v25 = v2;
  }

  return v2;
}

BOOL __31__AHFPencilPatternLibrary_init__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)waveformIndexWithType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MicroTap"])
  {
    uint64_t v4 = &unk_26FC38AE8;
  }
  else if ([v3 isEqualToString:@"MiniTap"])
  {
    uint64_t v4 = &unk_26FC38B00;
  }
  else if ([v3 isEqualToString:@"WideTap"])
  {
    uint64_t v4 = &unk_26FC38B18;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)createPatternsLibraryFrom:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v62 = *(void *)v70;
    *(void *)&long long v7 = 136316418;
    long long v50 = v7;
    id v51 = v5;
    v52 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v59 = v8;
      do
      {
        if (*(void *)v70 != v62) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v69 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "lastPathComponent", v50);
        v12 = [v11 stringByDeletingPathExtension];

        if (!v12)
        {
          v16 = LoggingFramework();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v10;
            _os_log_error_impl(&dword_247F8A000, v16, OS_LOG_TYPE_ERROR, "%s Could not find a name for pattern in %@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        v13 = [v4 valueForKey:v12];

        if (v13)
        {
          id v14 = LoggingFramework();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v12;
            _os_log_impl(&dword_247F8A000, v14, OS_LOG_TYPE_DEFAULT, "%s Pattern '%@' already exists in library. Overriding", buf, 0x16u);
          }
        }
        v15 = [NSDictionary dictionaryWithContentsOfURL:v10];
        v16 = v15;
        if (!v15)
        {
          v17 = LoggingFramework();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v10;
            _os_log_error_impl(&dword_247F8A000, v17, OS_LOG_TYPE_ERROR, "%s Could load %@", buf, 0x16u);
          }
          goto LABEL_33;
        }
        v17 = [v15 objectForKeyedSubscript:@"Priority"];
        if (!v17)
        {
          log = LoggingFramework();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v10;
            _os_log_error_impl(&dword_247F8A000, log, OS_LOG_TYPE_ERROR, "%s Could not find a 'Priority' in %@", buf, 0x16u);
          }
          goto LABEL_32;
        }
        log = [v16 objectForKeyedSubscript:@"Timeout"];
        if (!log)
        {
          v20 = LoggingFramework();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v10;
            _os_log_error_impl(&dword_247F8A000, v20, OS_LOG_TYPE_ERROR, "%s Could not find a 'Timeout' in %@", buf, 0x16u);
          }
          goto LABEL_31;
        }
        v18 = [v16 objectForKeyedSubscript:@"Pattern"];
        v60 = v17;
        if (!v18)
        {
          v20 = 0;
          uint64_t v21 = LoggingFramework();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
            __int16 v75 = 2112;
            *(void *)v76 = v10;
            v22 = v21;
            uint64_t v23 = "%s Could not find a 'Pattern' in %@";
            goto LABEL_63;
          }
LABEL_30:

          v17 = v60;
          goto LABEL_31;
        }
        v19 = v18;
        if (![v18 count])
        {
          v20 = v19;
          uint64_t v21 = LoggingFramework();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
LABEL_62:
          *(_DWORD *)buf = 136315394;
          v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
          __int16 v75 = 2112;
          *(void *)v76 = v10;
          v22 = v21;
          uint64_t v23 = "%s \\Array 'Pattern' is empty in %@";
LABEL_63:
          _os_log_error_impl(&dword_247F8A000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
          goto LABEL_30;
        }
        if ((unint64_t)[v19 count] >= 9)
        {
          v20 = v19;
          uint64_t v21 = LoggingFramework();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
          goto LABEL_62;
        }
        uint64_t v24 = [v19 count];
        memset(v68, 0, 14);
        memset(v67, 0, 47);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        obj = v19;
        uint64_t v53 = v24;
        uint64_t v56 = [obj countByEnumeratingWithState:&v63 objects:v83 count:16];
        if (!v56)
        {
          uint64_t v38 = 0;
          goto LABEL_71;
        }
        int v25 = 0;
        uint64_t v57 = *(void *)v64;
        while (2)
        {
          uint64_t v26 = 0;
          int v54 = v25;
          do
          {
            if (*(void *)v64 != v57) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v63 + 1) + 8 * v26);
            uint64_t v28 = [v27 objectForKeyedSubscript:@"Type"];
            if (!v28)
            {
              v29 = LoggingFramework();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                __int16 v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(void *)&v76[6] = v10;
                _os_log_error_impl(&dword_247F8A000, v29, OS_LOG_TYPE_ERROR, "%s Could not find a 'Type' in asset %u in %@", buf, 0x1Cu);
              }
              goto LABEL_69;
            }
            v29 = v28;
            uint64_t v30 = [(AHFPencilPatternLibrary *)self waveformIndexWithType:v28];
            if (!v30)
            {
              uint64_t v39 = LoggingFramework();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                __int16 v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(void *)&v76[6] = v10;
                _os_log_error_impl(&dword_247F8A000, v39, OS_LOG_TYPE_ERROR, "%s Could not understand 'Type' in asset %u in %@", buf, 0x1Cu);
              }

              goto LABEL_68;
            }
            id v31 = (void *)v30;
            objc_super v32 = [v27 objectForKeyedSubscript:@"Gain"];
            v33 = v32;
            if (!v32)
            {
              v40 = LoggingFramework();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                __int16 v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(void *)&v76[6] = v10;
                v41 = v40;
                v42 = "%s Could not find a 'Gain' in asset %u in %@";
                goto LABEL_66;
              }
LABEL_67:

LABEL_68:
              uint64_t v8 = v59;
LABEL_69:

              uint64_t v38 = (v54 + v26);
              goto LABEL_70;
            }
            if ([v32 unsignedIntValue] >= 0x65)
            {
              v40 = LoggingFramework();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                goto LABEL_67;
              }
              *(_DWORD *)buf = 136315650;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              __int16 v75 = 1024;
              *(_DWORD *)v76 = v54 + v26;
              *(_WORD *)&v76[4] = 2112;
              *(void *)&v76[6] = v10;
              v41 = v40;
              v42 = "%s Invalid value for 'Gain' in asset %u in %@";
LABEL_66:
              _os_log_error_impl(&dword_247F8A000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0x1Cu);
              goto LABEL_67;
            }
            if (v24 == 1)
            {
              BYTE4(v68[1]) = [v31 unsignedIntValue];
              BYTE5(v68[1]) = [v33 unsignedIntValue];
            }
            else
            {
              uint64_t v34 = [v27 objectForKeyedSubscript:@"Spacing"];
              if (!v34)
              {
                v40 = LoggingFramework();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_67;
                }
                *(_DWORD *)buf = 136315650;
                v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
                __int16 v75 = 1024;
                *(_DWORD *)v76 = v54 + v26;
                *(_WORD *)&v76[4] = 2112;
                *(void *)&v76[6] = v10;
                v41 = v40;
                v42 = "%s Could not find a 'Spacing' in asset %u in %@";
                goto LABEL_66;
              }
              __int16 v35 = (void *)v34;
              uint64_t v36 = (char *)v67 + 4 * (v54 + v26);
              v36[15] = [v31 unsignedIntValue];
              v36[16] = [v33 unsignedIntValue];
              *(_WORD *)(v36 + 17) = [v35 unsignedIntValue];
              uint64_t v24 = v53;
            }
            ++v26;
            uint64_t v8 = v59;
          }
          while (v56 != v26);
          uint64_t v37 = [obj countByEnumeratingWithState:&v63 objects:v83 count:16];
          int v25 = v54 + v26;
          uint64_t v56 = v37;
          if (v37) {
            continue;
          }
          break;
        }
        uint64_t v38 = (v54 + v26);
LABEL_70:
        id v5 = v51;
        uint64_t v4 = v52;
LABEL_71:

        if ([obj count] == v38)
        {
          if (v53 == 1)
          {
            LOBYTE(v68[0]) = 16;
            *(void *)((char *)v68 + 1) = 0;
            BYTE1(v68[1]) = [v60 unsignedIntValue];
            WORD1(v68[1]) = [log unsignedIntValue];
            v43 = [MEMORY[0x263EFF8F8] dataWithBytes:v68 length:14];
            goto LABEL_77;
          }
          v44 = [v16 objectForKeyedSubscript:@"Num Loops"];
          v43 = v44;
          if (v44 && [v44 unsignedIntValue])
          {
            LOBYTE(v67[0]) = 17;
            *(void *)((char *)v67 + 1) = 0;
            BYTE9(v67[0]) = [v60 unsignedIntValue];
            WORD5(v67[0]) = [log unsignedIntValue];
            BYTE12(v67[0]) = [obj count];
            *(_WORD *)((char *)v67 + 13) = [v43 unsignedIntValue];
            uint64_t v45 = [MEMORY[0x263EFF8F8] dataWithBytes:v67 length:47];

            v43 = (void *)v45;
LABEL_77:
            v46 = LoggingFramework();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v50;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              __int16 v75 = 2112;
              *(void *)v76 = v12;
              *(_WORD *)&v76[8] = 2112;
              *(void *)&v76[10] = v43;
              __int16 v77 = 2112;
              v78 = v60;
              __int16 v79 = 2112;
              v80 = log;
              __int16 v81 = 2112;
              v82 = v16;
              _os_log_debug_impl(&dword_247F8A000, v46, OS_LOG_TYPE_DEBUG, "%s Correctly added pattern '%@' (%@) to library (priority=%@, timeout=%@): %@", buf, 0x3Eu);
            }

            [v4 setValue:v43 forKey:v12];
          }
          else
          {
            v47 = LoggingFramework();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v74 = "-[AHFPencilPatternLibrary createPatternsLibraryFrom:]";
              __int16 v75 = 2112;
              *(void *)v76 = v10;
              _os_log_error_impl(&dword_247F8A000, v47, OS_LOG_TYPE_ERROR, "%s Could not find a 'Num Loops' in %@ or number of loops invalid (0)", buf, 0x16u);
            }

            uint64_t v8 = v59;
          }
        }
        v17 = v60;
        v20 = obj;
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:
        ++v9;
      }
      while (v9 != v8);
      uint64_t v48 = [v5 countByEnumeratingWithState:&v69 objects:v84 count:16];
      uint64_t v8 = v48;
    }
    while (v48);
  }

  return v4;
}

- (id)getReportForPattern:(id)a3 timestampUs:(unint64_t)a4 prevTimestampUs:(unint64_t)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = [(NSDictionary *)self->_library valueForKey:v10];
  if (v11
    || isInternalBuild()
    && ([(AHFPencilPatternLibrary *)self maybeGetExploratoryPayload:v10],
        (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = (id) [v11 mutableCopy];
    uint64_t v13 = [v12 mutableBytes];
    unint64_t v14 = a4 - a5;
    if ((a4 - a5) >> 3 <= 0x752 && *(_WORD *)(v13 + 10))
    {
      if (a6)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"Too soon after previous haptic (delta %lluus)", v14, *MEMORY[0x263F08320]);
        v22 = v16;
        v17 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a6 = [v15 errorWithDomain:@"com.apple.hid.AppleHIDFeedback" code:-536870184 userInfo:v17];
      }
      v18 = 0;
    }
    else
    {
      *(void *)(v13 + 1) = a4;
      id v12 = v12;
      v18 = v12;
    }
    goto LABEL_12;
  }
  if (a6)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08320];
    v11 = [NSString stringWithFormat:@"Could not find pattern %@", v10];
    v24[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v19 errorWithDomain:@"com.apple.hid.AppleHIDFeedback" code:-536870206 userInfo:v12];
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (id)allPatterns
{
  return [(NSDictionary *)self->_library allKeys];
}

- (BOOL)isReport:(id)a3 equalTo:(id)a4
{
  id v6 = a3;
  long long v7 = [(NSDictionary *)self->_library valueForKey:a4];
  if (v7 && (unint64_t)[v6 length] >= 0xC)
  {
    id v9 = v6;
    uint64_t v10 = [v9 bytes];
    id v11 = (id) [v7 mutableCopy];
    *(void *)([v11 mutableBytes] + 1) = *(void *)(v10 + 1);
    char v8 = [v9 isEqualToData:v11];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)maybeGetExploratoryPayload:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [&unk_26FC38BC0 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(&unk_26FC38BC0);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [v9 lowercaseString];
        if ([v4 hasPrefix:v10])
        {
          id v11 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v10, "length"));
          uint64_t v12 = [v11 integerValue];
          if ((unint64_t)(v12 - 101) > 0xFFFFFFFFFFFFFF9BLL)
          {
            int v14 = v12;
            v15 = [(AHFPencilPatternLibrary *)self waveformIndexWithType:v9];
            char v18 = 16;
            uint64_t v19 = 0;
            char v20 = 1;
            __int16 v21 = 0;
            char v22 = [v15 unsignedIntValue];
            char v23 = v14;
            v16 = LoggingFramework();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              v29 = "-[AHFPencilPatternLibrary maybeGetExploratoryPayload:]";
              __int16 v30 = 2112;
              id v31 = v4;
              __int16 v32 = 2112;
              v33 = v9;
              __int16 v34 = 1024;
              int v35 = v14;
              _os_log_debug_impl(&dword_247F8A000, v16, OS_LOG_TYPE_DEBUG, "%s Pattern '%@' is a exploratory '%@' with gain %u", buf, 0x26u);
            }

            uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:&v18 length:14];

            goto LABEL_15;
          }
        }
      }
      uint64_t v6 = [&unk_26FC38BC0 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_15:

  return v13;
}

- (NSDictionary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[AHFPencilPatternLibrary init]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_247F8A000, a2, OS_LOG_TYPE_ERROR, "%s The following haptics patterns are being overriden: %@", (uint8_t *)&v2, 0x16u);
}

@end