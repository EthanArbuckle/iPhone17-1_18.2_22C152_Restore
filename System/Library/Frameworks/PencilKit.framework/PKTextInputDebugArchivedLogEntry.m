@interface PKTextInputDebugArchivedLogEntry
- (BOOL)_loadInputDrawingFromDictionary:(id)a3 errorMessage:(id *)a4;
- (BOOL)_loadRecognitionResultFromDictionary:(id)a3;
- (BOOL)_loadTargetContentInfoFromDictionary:(id)a3 targets:(id)a4;
- (BOOL)_loadTextInputTargetsFromDictionaries:(id)a3;
- (PKTextInputDebugArchivedLogEntry)initWithDictionary:(id)a3 error:(id *)a4;
- (PKTextInputDebugArchivedLogEntry)initWithRecordingLogEntry:(id)a3 error:(id *)a4;
- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4;
@end

@implementation PKTextInputDebugArchivedLogEntry

- (PKTextInputDebugArchivedLogEntry)initWithDictionary:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKTextInputDebugArchivedLogEntry;
  v7 = [(PKTextInputDebugArchivedLogEntry *)&v47 init];
  if (!v7)
  {
    v33 = 0;
    v11 = &stru_1F1FB2C00;
    if (!a4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v8 = [v6 copy];
  logDictionary = v7->_logDictionary;
  v7->_logDictionary = (NSDictionary *)v8;

  uint64_t v10 = [v6 objectForKeyedSubscript:@"date"];
  if (!v10) {
    goto LABEL_21;
  }
  v11 = (__CFString *)v10;
  v12 = [v6 objectForKeyedSubscript:@"date"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 objectForKeyedSubscript:@"inputDrawing"],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_25:

    v34 = @"The input dictionary is incomplete or corrupted.";
LABEL_26:

    v11 = v34;
    goto LABEL_27;
  }
  v14 = (void *)v13;
  v15 = [v6 objectForKeyedSubscript:@"inputDrawing"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 objectForKeyedSubscript:@"inputTargets"],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  v45 = (void *)v16;
  v17 = [v6 objectForKeyedSubscript:@"inputTargets"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 objectForKeyedSubscript:@"inputTargetContentInfo"],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  v43 = (void *)v18;
  v44 = [v6 objectForKeyedSubscript:@"inputTargetContentInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 objectForKeyedSubscript:@"recognitionResult"],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_23;
  }
  v40 = (void *)v19;
  v42 = [v6 objectForKeyedSubscript:@"recognitionResult"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_21:
    v11 = @"The input dictionary is incomplete or corrupted.";
    goto LABEL_27;
  }
  v20 = [v6 objectForKeyedSubscript:@"date"];
  v21 = +[PKTextInputDebugLogEntry loggedDateFormatter];
  v22 = [v21 dateFromString:v20];
  [(PKTextInputDebugLogEntry *)v7 setEntryDate:v22];

  v23 = [(PKTextInputDebugLogEntry *)v7 entryDate];

  if (v23)
  {
    v24 = [(NSDictionary *)v7->_logDictionary objectForKeyedSubscript:@"inputDrawing"];
    v46 = &stru_1F1FB2C00;
    BOOL v25 = [(PKTextInputDebugArchivedLogEntry *)v7 _loadInputDrawingFromDictionary:v24 errorMessage:&v46];
    v11 = v46;

    if (!v25) {
      goto LABEL_27;
    }
    v26 = [(NSDictionary *)v7->_logDictionary objectForKeyedSubscript:@"inputTargets"];
    BOOL v27 = [(PKTextInputDebugArchivedLogEntry *)v7 _loadTextInputTargetsFromDictionaries:v26];

    if (v27)
    {
      v28 = [(NSDictionary *)v7->_logDictionary objectForKeyedSubscript:@"inputTargetContentInfo"];
      v29 = [(PKTextInputDebugLogEntry *)v7 inputTargets];
      BOOL v30 = [(PKTextInputDebugArchivedLogEntry *)v7 _loadTargetContentInfoFromDictionary:v28 targets:v29];

      if (v30)
      {
        v31 = [(NSDictionary *)v7->_logDictionary objectForKeyedSubscript:@"recognitionResult"];
        BOOL v32 = [(PKTextInputDebugArchivedLogEntry *)v7 _loadRecognitionResultFromDictionary:v31];

        if (v32)
        {
          v33 = 0;
          if (!a4) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        v34 = @"Failed to load recognition result.";
      }
      else
      {
        v34 = @"Failed to load target content info.";
      }
    }
    else
    {
      v34 = @"Failed to load text input targets.";
    }
    goto LABEL_26;
  }
  v11 = @"Failed to load entry date.";
LABEL_27:

  v35 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v36 = *MEMORY[0x1E4F281F8];
  uint64_t v48 = *MEMORY[0x1E4F28568];
  v49[0] = v11;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
  v33 = [v35 errorWithDomain:v36 code:1 userInfo:v37];

  v7 = 0;
  if (a4) {
LABEL_28:
  }
    *a4 = v33;
LABEL_29:
  v38 = v7;

  return v38;
}

- (PKTextInputDebugArchivedLogEntry)initWithRecordingLogEntry:(id)a3 error:(id *)a4
{
  id v6 = [a3 dictionaryRepresentationWithTargetContentLevel:2];
  v7 = [(PKTextInputDebugArchivedLogEntry *)self initWithDictionary:v6 error:a4];

  return v7;
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  v7 = (void *)[(NSDictionary *)self->_logDictionary mutableCopy];
  uint64_t v8 = v7;
  if (!a3)
  {
    [v7 removeObjectForKey:@"inputTargets"];
    v9 = NSNumber;
    uint64_t v10 = [(PKTextInputDebugLogEntry *)self inputTargets];
    v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    [v8 setObject:v11 forKeyedSubscript:@"inputTargetsCount"];

    v12 = [v8 objectForKeyedSubscript:@"recognitionResult"];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (v13)
    {
      [v13 removeObjectForKey:@"tokenizedTextResultData"];
      [v8 setObject:v13 forKeyedSubscript:@"recognitionResult"];
    }
    v14 = [v8 objectForKeyedSubscript:@"inputDrawing"];
    v15 = (void *)[v14 mutableCopy];

    if (v15)
    {
      [v15 removeObjectForKey:@"drawingData"];
      [v8 setObject:v15 forKeyedSubscript:@"inputDrawing"];
    }
    uint64_t v16 = [v8 objectForKeyedSubscript:@"inputTargetContentInfo"];
    v17 = (void *)[v16 mutableCopy];

    if (v17)
    {
      [v17 removeObjectForKey:@"characterRectsInReferenceSubstring"];
      [v8 setObject:v17 forKeyedSubscript:@"inputTargetContentInfo"];
    }
  }
  if (a4 != 2)
  {
    uint64_t v18 = [v8 objectForKeyedSubscript:@"inputTargetContentInfo"];
    uint64_t v19 = (void *)[v18 mutableCopy];

    if (v19)
    {
      v20 = [(PKTextInputDebugLogEntry *)self referenceSubstringWithTargetContentLevel:a4];
      [v19 setObject:v20 forKeyedSubscript:@"referenceSubstring"];
      [v8 setObject:v19 forKeyedSubscript:@"inputTargetContentInfo"];
    }
  }

  return v8;
}

- (BOOL)_loadInputDrawingFromDictionary:(id)a3 errorMessage:(id *)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"drawingData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    uint64_t v16 = @"Failed to load drawing data.";
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v18 = 0;
  uint64_t v8 = [[PKDrawing alloc] initWithData:v7 error:&v18];
  id v9 = v18;
  [(PKTextInputDebugLogEntry *)self setInputDrawing:v8];

  uint64_t v10 = [(PKTextInputDebugLogEntry *)self inputDrawing];
  BOOL v11 = v10 != 0;

  if (v10)
  {

    uint64_t v12 = [v6 objectForKeyedSubscript:@"containsInProgressStroke"];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = [v6 objectForKeyedSubscript:@"containsInProgressStroke"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v16 = 0;
        BOOL v11 = 1;
        if (!a4) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    id v9 = [v6 objectForKeyedSubscript:@"containsInProgressStroke"];
    -[PKTextInputDebugLogEntry setInputContainsInProgressStroke:](self, "setInputContainsInProgressStroke:", [v9 BOOLValue]);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = [v9 localizedDescription];
  }

  if (a4) {
LABEL_10:
  }
    *a4 = v16;
LABEL_11:

  return v11;
}

- (BOOL)_loadTextInputTargetsFromDictionaries:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v29 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v32;
    BOOL v27 = self;
    id obj = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v9 = [v8 objectForKeyedSubscript:@"identifier"];
        if (!v9) {
          goto LABEL_15;
        }
        uint64_t v10 = (void *)v9;
        BOOL v11 = [v8 objectForKeyedSubscript:@"identifier"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v8 objectForKeyedSubscript:@"frame"],
              (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
        {

LABEL_15:
          BOOL v25 = 0;
          id v6 = obj;
          v24 = obj;
          goto LABEL_16;
        }
        uint64_t v13 = (void *)v12;
        v14 = [v8 objectForKeyedSubscript:@"frame"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v16 = [v8 objectForKeyedSubscript:@"frame"];
        CGRect v37 = CGRectFromString(v16);
        double x = v37.origin.x;
        double y = v37.origin.y;
        double width = v37.size.width;
        double height = v37.size.height;

        id v21 = objc_alloc(MEMORY[0x1E4F5C0A8]);
        v22 = [v8 objectForKeyedSubscript:@"identifier"];
        v23 = objc_msgSend(v21, "initWithIdentifier:frame:", v22, x, y, width, height);

        [v5 addObject:v23];
      }
      id v6 = obj;
      self = v27;
      uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  v24 = (void *)[v5 copy];
  [(PKTextInputDebugLogEntry *)self setInputTargets:v24];
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

- (BOOL)_loadTargetContentInfoFromDictionary:(id)a3 targets:(id)a4
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"targetIdentifier"];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"targetIdentifier"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_169:
      goto LABEL_170;
    }
    v137 = v9;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"textContentLength"];
  if (!v10
    || ([v6 objectForKeyedSubscript:@"textContentLength"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        count = (void *)v11,
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"elementType"];
    if (v13)
    {
      v14 = [v6 objectForKeyedSubscript:@"elementType"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_88:

LABEL_89:
        if (!v10) {
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      v133 = v14;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"referenceSubstring"];
    uint64_t v16 = (void *)v15;
    if (v15)
    {
      v17 = (void *)v15;
      uint64_t v18 = [v6 objectForKeyedSubscript:@"referenceSubstring"];
      objc_opt_class();
      v131 = (void *)v18;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
        uint64_t v16 = v17;
LABEL_86:

LABEL_87:
        v14 = v133;
        if (!v13) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
      uint64_t v16 = v17;
    }
    v135 = [v6 objectForKeyedSubscript:@"referenceSubstringRange"];
    if (v135)
    {
      uint64_t v19 = [v6 objectForKeyedSubscript:@"referenceSubstringRange"];
      objc_opt_class();
      v127 = (void *)v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_84:

LABEL_85:
        if (!v16) {
          goto LABEL_87;
        }
        goto LABEL_86;
      }
    }
    v129 = [v6 objectForKeyedSubscript:@"strokeCoveredTextRange"];
    if (v129)
    {
      uint64_t v20 = [v6 objectForKeyedSubscript:@"strokeCoveredTextRange"];
      objc_opt_class();
      v123 = (void *)v20;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_82:

LABEL_83:
        if (!v135) {
          goto LABEL_85;
        }
        goto LABEL_84;
      }
    }
    v125 = [v6 objectForKeyedSubscript:@"selectedTextRange"];
    if (v125)
    {
      uint64_t v21 = [v6 objectForKeyedSubscript:@"selectedTextRange"];
      objc_opt_class();
      v119 = (void *)v21;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_80:

LABEL_81:
        if (!v129) {
          goto LABEL_83;
        }
        goto LABEL_82;
      }
    }
    v121 = [v6 objectForKeyedSubscript:@"activePreviewRange"];
    if (v121)
    {
      uint64_t v22 = [v6 objectForKeyedSubscript:@"activePreviewRange"];
      objc_opt_class();
      v116 = (void *)v22;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_78:

LABEL_79:
        if (!v125) {
          goto LABEL_81;
        }
        goto LABEL_80;
      }
    }
    v118 = [v6 objectForKeyedSubscript:@"lastCharacterLevelPosition"];
    if (v118)
    {
      uint64_t v23 = [v6 objectForKeyedSubscript:@"lastCharacterLevelPosition"];
      objc_opt_class();
      v113 = (void *)v23;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_76:

LABEL_77:
        if (!v121) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }
    }
    v115 = [v6 objectForKeyedSubscript:@"contentType"];
    if (v115)
    {
      uint64_t v24 = [v6 objectForKeyedSubscript:@"contentType"];
      objc_opt_class();
      v110 = (void *)v24;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_74:

LABEL_75:
        if (!v118) {
          goto LABEL_77;
        }
        goto LABEL_76;
      }
    }
    v112 = [v6 objectForKeyedSubscript:@"autocapitalization"];
    if (v112)
    {
      uint64_t v25 = [v6 objectForKeyedSubscript:@"autocapitalization"];
      objc_opt_class();
      v106 = (void *)v25;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_72:

LABEL_73:
        if (!v115) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
    }
    v108 = [v6 objectForKeyedSubscript:@"autocorrection"];
    if (v108)
    {
      uint64_t v26 = [v6 objectForKeyedSubscript:@"autocorrection"];
      objc_opt_class();
      v102 = (void *)v26;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_70:

LABEL_71:
        if (!v112) {
          goto LABEL_73;
        }
        goto LABEL_72;
      }
    }
    v104 = [v6 objectForKeyedSubscript:@"characterRectsInReferenceSubstring"];
    if (v104)
    {
      uint64_t v27 = [v6 objectForKeyedSubscript:@"characterRectsInReferenceSubstring"];
      objc_opt_class();
      v99 = (void *)v27;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_68:

LABEL_69:
        if (!v108) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
    }
    v100 = [v6 objectForKeyedSubscript:@"referenceSubstringLogContentLevel"];
    if (v100)
    {
      uint64_t v28 = [v6 objectForKeyedSubscript:@"referenceSubstringLogContentLevel"];
      objc_opt_class();
      v98 = (void *)v28;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_66:

LABEL_67:
        if (!v104) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
    }
    uint64_t v29 = [v6 objectForKeyedSubscript:@"isCursorStrong"];
    uint64_t v30 = (void *)v29;
    if (v29)
    {
      long long v31 = (void *)v29;
      uint64_t v32 = [v6 objectForKeyedSubscript:@"isCursorStrong"];
      objc_opt_class();
      v96 = (void *)v32;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
        uint64_t v30 = v31;
LABEL_64:

LABEL_65:
        if (!v100) {
          goto LABEL_67;
        }
        goto LABEL_66;
      }
      uint64_t v30 = v31;
    }
    v97 = [v6 objectForKeyedSubscript:@"containsCommittedStrokes"];
    if (v97)
    {
      uint64_t v33 = [v6 objectForKeyedSubscript:@"containsCommittedStrokes"];
      objc_opt_class();
      v94 = (void *)v33;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 0;
LABEL_62:

LABEL_63:
        if (!v30) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
    }
    uint64_t v95 = [v6 objectForKeyedSubscript:@"isSingleLine"];
    if (!v95
      || ([v6 objectForKeyedSubscript:@"isSingleLine"],
          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v93 = (void *)v34,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v36 = [v6 objectForKeyedSubscript:@"protectedCharacterIndexes"];
      if (v36)
      {
        CGRect v37 = (void *)v36;
        v92 = [v6 objectForKeyedSubscript:@"protectedCharacterIndexes"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 1;
      }
      v35 = (void *)v95;
      if (!v95)
      {
LABEL_61:
        if (!v97) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
    }
    else
    {
      char isKindOfClass = 0;
      v35 = (void *)v95;
    }

    goto LABEL_61;
  }
  char isKindOfClass = 0;
LABEL_90:

LABEL_91:
  if (v8) {

  }
  if (isKindOfClass)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"targetIdentifier"];
    if (v8)
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v38 = v7;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v145 objects:v150 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        id v136 = v7;
        v138 = self;
        uint64_t v41 = *(void *)v146;
LABEL_97:
        uint64_t v42 = 0;
        while (1)
        {
          if (*(void *)v146 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v145 + 1) + 8 * v42);
          v44 = objc_msgSend(v43, "inputTargetIdentifier", v92);
          char v45 = [v44 isEqualToNumber:v8];

          if (v45) {
            break;
          }
          if (v40 == ++v42)
          {
            uint64_t v40 = [v38 countByEnumeratingWithState:&v145 objects:v150 count:16];
            if (v40) {
              goto LABEL_97;
            }
            id v7 = v136;
            self = v138;
            goto LABEL_168;
          }
        }
        id v46 = v43;

        id v7 = v136;
        self = v138;
        if (!v46) {
          goto LABEL_169;
        }
        id v47 = objc_alloc_init(MEMORY[0x1E4F5C058]);
        [v47 setTextInputTarget:v46];
        id v48 = [v6 objectForKeyedSubscript:@"contentType"];
        id v132 = v46;
        if ([v48 isEqualToString:@"Default"])
        {
          unsigned int v101 = 0;
        }
        else
        {
          if ([v48 isEqualToString:@"Digits"])
          {
            int v49 = 1;
          }
          else if ([v48 isEqualToString:@"Phone"])
          {
            int v49 = 2;
          }
          else if ([v48 isEqualToString:@"Username"])
          {
            int v49 = 3;
          }
          else if ([v48 isEqualToString:@"EmailAddress"])
          {
            int v49 = 4;
          }
          else if ([v48 isEqualToString:@"URL"])
          {
            int v49 = 5;
          }
          else if ([v48 isEqualToString:@"ASCII"])
          {
            int v49 = 6;
          }
          else if ([v48 isEqualToString:@"Equation"])
          {
            int v49 = 7;
          }
          else
          {
            int v49 = 0;
          }
          unsigned int v101 = v49;
        }

        v50 = [v6 objectForKeyedSubscript:@"autocapitalization"];
        v51 = [&unk_1F200F4C0 objectForKeyedSubscript:v50];
        v52 = v51;
        if (v51) {
          uint64_t v128 = [v51 integerValue];
        }
        else {
          uint64_t v128 = 1;
        }

        v53 = [v6 objectForKeyedSubscript:@"autocorrection"];
        v54 = [&unk_1F200F4E8 objectForKeyedSubscript:v53];
        v55 = v54;
        if (v54) {
          uint64_t v126 = [v54 integerValue];
        }
        else {
          uint64_t v126 = 0;
        }

        v56 = [v6 objectForKeyedSubscript:@"textContentLength"];
        uint64_t v122 = [v56 integerValue];

        uint64_t v57 = [v6 objectForKeyedSubscript:@"referenceSubstring"];
        v58 = (void *)v57;
        v59 = &stru_1F1FB2C00;
        if (v57) {
          v59 = (__CFString *)v57;
        }
        v124 = v59;

        v60 = [v6 objectForKeyedSubscript:@"referenceSubstringRange"];
        if (v60)
        {
          v61 = [v6 objectForKeyedSubscript:@"referenceSubstringRange"];
          NSRange v62 = NSRangeFromString(v61);
          NSUInteger location = v62.location;
          NSUInteger counta = v62.length;
        }
        else
        {
          NSUInteger counta = 0;
          NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
        }

        v63 = [v6 objectForKeyedSubscript:@"selectedTextRange"];
        if (v63)
        {
          v64 = [v6 objectForKeyedSubscript:@"selectedTextRange"];
          NSRange v117 = NSRangeFromString(v64);
        }
        else
        {
          v117.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
          v117.length = 0;
        }

        v65 = [v6 objectForKeyedSubscript:@"strokeCoveredTextRange"];
        if (v65)
        {
          v66 = [v6 objectForKeyedSubscript:@"strokeCoveredTextRange"];
          NSRange v114 = NSRangeFromString(v66);
        }
        else
        {
          v114.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
          v114.length = 0;
        }

        v67 = [v6 objectForKeyedSubscript:@"activePreviewRange"];
        if (v67)
        {
          v68 = [v6 objectForKeyedSubscript:@"activePreviewRange"];
          NSRange v111 = NSRangeFromString(v68);
        }
        else
        {
          v111.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
          v111.length = 0;
        }

        v69 = [v6 objectForKeyedSubscript:@"lastCharacterLevelPosition"];
        if (v69)
        {
          v70 = [v6 objectForKeyedSubscript:@"lastCharacterLevelPosition"];
          uint64_t v109 = [v70 integerValue];
        }
        else
        {
          uint64_t v109 = 0x7FFFFFFFFFFFFFFFLL;
        }

        v71 = [v6 objectForKeyedSubscript:@"isCursorStrong"];
        if (v71)
        {
          v72 = [v6 objectForKeyedSubscript:@"isCursorStrong"];
          unsigned int v107 = [v72 BOOLValue];
        }
        else
        {
          unsigned int v107 = 1;
        }

        v73 = [v6 objectForKeyedSubscript:@"containsCommittedStrokes"];
        if (v73)
        {
          v74 = [v6 objectForKeyedSubscript:@"containsCommittedStrokes"];
          unsigned int v105 = [v74 BOOLValue];
        }
        else
        {
          unsigned int v105 = 0;
        }

        v75 = [v6 objectForKeyedSubscript:@"isSingleLine"];
        v130 = v47;
        if (v75)
        {
          v76 = [v6 objectForKeyedSubscript:@"isSingleLine"];
          unsigned int v103 = [v76 BOOLValue];
        }
        else
        {
          unsigned int v103 = 1;
        }

        v134 = malloc_type_calloc(counta, 0x20uLL, 0x1000040E0EAB150uLL);
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        v77 = [v6 objectForKeyedSubscript:@"characterRectsInReferenceSubstring"];
        uint64_t v78 = [v77 countByEnumeratingWithState:&v141 objects:v149 count:16];
        if (v78)
        {
          uint64_t v79 = v78;
          uint64_t v80 = 0;
          uint64_t v81 = *(void *)v142;
LABEL_157:
          uint64_t v82 = 0;
          uint64_t v83 = (uint64_t)v134 + 32 * v80 + 16;
          while (1)
          {
            if (*(void *)v142 != v81) {
              objc_enumerationMutation(v77);
            }
            v84 = *(NSString **)(*((void *)&v141 + 1) + 8 * v82);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || v80 + v82 >= counta) {
              break;
            }
            *(CGRect *)(v83 - 16) = CGRectFromString(v84);
            v83 += 32;
            if (v79 == ++v82)
            {
              uint64_t v79 = [v77 countByEnumeratingWithState:&v141 objects:v149 count:16];
              v80 += v82;
              if (v79) {
                goto LABEL_157;
              }
              break;
            }
          }
        }

        v85 = [v6 objectForKeyedSubscript:@"protectedCharacterIndexes"];
        if (v85)
        {
          v86 = v130;
          [v130 setProtectedCharacterIndexes:v85];
        }
        else
        {
          v87 = [MEMORY[0x1E4F28D60] indexSet];
          v86 = v130;
          [v130 setProtectedCharacterIndexes:v87];
        }
        id v7 = v136;
        self = v138;

        objc_msgSend(v86, "setReferenceSubstring:range:characterRects:", v124, location, counta, v134);
        [v86 setTextContentLength:v122];
        objc_msgSend(v86, "setStrokeCoveredTextRange:", v114.location, v114.length);
        objc_msgSend(v86, "setSelectedTextRange:", v117.location, v117.length);
        objc_msgSend(v86, "setActivePreviewRange:", v111.location, v111.length);
        [v86 setContentType:v101];
        [v86 setAutoCapitalizationMode:v128];
        [v86 setAutoCorrectionMode:v126];
        [v86 setIsSingleLine:v103];
        [v86 setIsCursorStrong:v107];
        [v86 setLastCharacterLevelPosition:v109];
        [v86 setContainsCommittedStrokes:v105];
        free(v134);
        v88 = (void *)[v86 copy];
        [(PKTextInputDebugLogEntry *)v138 setInputTargetContentInfo:v88];

        id v38 = v132;
      }
LABEL_168:
    }
    goto LABEL_169;
  }
LABEL_170:
  v89 = [(PKTextInputDebugLogEntry *)self inputTargetContentInfo];
  BOOL v90 = v89 != 0;

  return v90;
}

- (BOOL)_loadRecognitionResultFromDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"recognitionLocale"];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = (id)v5;
  id v7 = [v4 objectForKeyedSubscript:@"recognitionLocale"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 objectForKeyedSubscript:@"recognitionLocales"],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v4 objectForKeyedSubscript:@"recognitionLocales"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"committedText"];
  if (!v11)
  {
LABEL_13:
    uint64_t v15 = [v4 objectForKeyedSubscript:@"topTranscription"];
    v65 = v11;
    if (v15)
    {
      uint64_t v16 = [v4 objectForKeyedSubscript:@"topTranscription"];
      objc_opt_class();
      v63 = (void *)v16;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v17 = 1;
        uint64_t v11 = v65;
LABEL_48:

LABEL_49:
        uint64_t v12 = v64;
        if (!v11) {
          goto LABEL_51;
        }
        goto LABEL_50;
      }
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"committedTokenColumnCount"];
    if (v18)
    {
      uint64_t v19 = [v4 objectForKeyedSubscript:@"committedTokenColumnCount"];
      objc_opt_class();
      v60 = (void *)v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v17 = 1;
LABEL_46:

LABEL_47:
        uint64_t v11 = v65;
        if (!v15) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
    }
    uint64_t v61 = [v4 objectForKeyedSubscript:@"commitReason"];
    NSRange v62 = v18;
    if (v61)
    {
      uint64_t v20 = [v4 objectForKeyedSubscript:@"commitReason"];
      objc_opt_class();
      v56 = (void *)v20;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v17 = 1;
        uint64_t v21 = (void *)v61;
LABEL_44:

LABEL_45:
        uint64_t v18 = v62;
        if (!v62) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
    }
    uint64_t v59 = [v4 objectForKeyedSubscript:@"tokenizedTextResultData"];
    if (v59)
    {
      uint64_t v22 = [v4 objectForKeyedSubscript:@"tokenizedTextResultData"];
      objc_opt_class();
      v55 = (void *)v22;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v23 = (void *)v59;
        char v57 = 1;
        uint64_t v21 = (void *)v61;
LABEL_42:

LABEL_43:
        char v17 = v57;
        if (!v21) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"affectedRange"];
    if (v24)
    {
      v53 = v15;
      uint64_t v25 = [v4 objectForKeyedSubscript:@"affectedRange"];
      objc_opt_class();
      v50 = (void *)v25;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v57 = 1;
        uint64_t v21 = (void *)v61;
        uint64_t v15 = v53;
LABEL_40:

LABEL_41:
        uint64_t v23 = (void *)v59;
        if (!v59) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
      uint64_t v15 = v53;
    }
    [v4 objectForKeyedSubscript:@"recognitionDuration"];
    v54 = v52 = v24;
    if (!v54
      || ([v4 objectForKeyedSubscript:@"recognitionDuration"],
          v51 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v27 = [v4 objectForKeyedSubscript:@"resultType"];
      if (v27)
      {
        v58 = v27;
        uint64_t v28 = [v4 objectForKeyedSubscript:@"resultType"];
        objc_opt_class();
        int v26 = objc_opt_isKindOfClass() ^ 1;

        uint64_t v27 = v58;
      }
      else
      {
        LOBYTE(v26) = 0;
      }
      uint64_t v21 = (void *)v61;

      if (!v54)
      {
        char v57 = v26;
LABEL_39:
        uint64_t v24 = v52;
        if (!v52) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    else
    {
      LOBYTE(v26) = 1;
      uint64_t v21 = (void *)v61;
    }
    char v57 = v26;

    goto LABEL_39;
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"committedText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = v12;
    goto LABEL_13;
  }
  char v17 = 1;
LABEL_50:

LABEL_51:
  if (v17)
  {
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  [v4 objectForKeyedSubscript:@"recognitionLocales"];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v68;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v68 != v31) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_10;
        }
      }
      uint64_t v30 = [v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  [(PKTextInputDebugLogEntry *)self setRecognitionLocaleIdentifiers:v6];
  if (![v6 count])
  {
    uint64_t v33 = [v4 objectForKeyedSubscript:@"recognitionLocale"];
    uint64_t v34 = (void *)v33;
    if (v33)
    {
      uint64_t v73 = v33;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      [(PKTextInputDebugLogEntry *)self setRecognitionLocaleIdentifiers:v35];
    }
  }
  uint64_t v36 = [v4 objectForKeyedSubscript:@"committedText"];
  [(PKTextInputDebugLogEntry *)self setResultCommittedText:v36];

  CGRect v37 = [v4 objectForKeyedSubscript:@"topTranscription"];
  [(PKTextInputDebugLogEntry *)self setResultTopTranscription:v37];

  id v38 = [v4 objectForKeyedSubscript:@"committedTokenColumnCount"];
  -[PKTextInputDebugLogEntry setResultCommittedTokenColumnCount:](self, "setResultCommittedTokenColumnCount:", [v38 integerValue]);

  uint64_t v39 = [v4 objectForKeyedSubscript:@"commitReason"];
  [(PKTextInputDebugLogEntry *)self setResultCommitReason:v39];

  uint64_t v40 = [v4 objectForKeyedSubscript:@"affectedRange"];
  if (v40)
  {
    uint64_t v41 = [v4 objectForKeyedSubscript:@"affectedRange"];
    NSRange v42 = NSRangeFromString(v41);
    -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", v42.location, v42.length);
  }
  else
  {
    -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  v43 = [v4 objectForKeyedSubscript:@"resultType"];
  [(PKTextInputDebugLogEntry *)self setResultTypeDescription:v43];

  v44 = [v4 objectForKeyedSubscript:@"recognitionDuration"];
  [v44 doubleValue];
  -[PKTextInputDebugLogEntry setResultRecognitionDuration:](self, "setResultRecognitionDuration:");

  char v45 = [v4 objectForKeyedSubscript:@"tokenizedTextResultData"];
  if (v45)
  {
    id v66 = 0;
    id v46 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v45 error:&v66];
    id v47 = v66;
    [(PKTextInputDebugLogEntry *)self setTokenizedTextResult:v46];

    id v48 = [(PKTextInputDebugLogEntry *)self tokenizedTextResult];

    if (!v48)
    {
      int v49 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v47;
        _os_log_error_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_ERROR, "Error unarchiving CHTokenizedTextResult: %@", buf, 0xCu);
      }
    }
  }

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
}

@end