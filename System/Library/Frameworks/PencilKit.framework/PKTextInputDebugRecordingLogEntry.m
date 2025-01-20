@interface PKTextInputDebugRecordingLogEntry
+ (id)_dictionaryRepresentationForDrawing:(id)a3 detailLevel:(int64_t)a4 containsInProgress:(BOOL)a5;
+ (id)_dictionaryRepresentationForTarget:(id)a3;
+ (id)_dictionaryRepresentationForTargetContentInfo:(id)a3 elementType:(id)a4 detailLevel:(int64_t)a5 contentLevel:(int64_t)a6 resultAffectedRange:(_NSRange)a7 localeIdentifiers:(id)a8;
- (CHTextInputQueryItem)_resultQueryItem;
- (PKDrawing)_originalDrawing;
- (PKTextInputDebugRecordingLogEntry)initWithResultCommand:(id)a3;
- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4;
- (id)inputDrawing;
- (void)_extractDataFromResultCommand:(id)a3;
- (void)set_originalDrawing:(id)a3;
- (void)set_resultQueryItem:(id)a3;
@end

@implementation PKTextInputDebugRecordingLogEntry

- (PKTextInputDebugRecordingLogEntry)initWithResultCommand:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugRecordingLogEntry;
  v5 = [(PKTextInputDebugRecordingLogEntry *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKTextInputDebugRecordingLogEntry *)v5 _extractDataFromResultCommand:v4];
  }

  return v6;
}

- (void)_extractDataFromResultCommand:(id)a3
{
  id v4 = (id *)a3;
  v47 = v4;
  if (v4)
  {
    id v5 = v4[5];
    id v6 = v47[4];
  }
  else
  {
    id v5 = 0;
    id v6 = 0;
  }
  id v7 = v6;
  objc_super v8 = [v7 correctionResult];

  v9 = [MEMORY[0x1E4F1C9C8] date];
  [(PKTextInputDebugLogEntry *)self setEntryDate:v9];

  v10 = [v5 languageSpec];
  v11 = -[PKTextInputLanguageSpec debugLocaleDescriptions](v10);
  [(PKTextInputDebugLogEntry *)self setRecognitionLocaleIdentifiers:v11];

  v12 = [v5 strokeProvider];
  v13 = [v12 drawing];
  [(PKTextInputDebugRecordingLogEntry *)self set_originalDrawing:v13];

  v14 = [v5 inputInProgressStroke];
  [(PKTextInputDebugLogEntry *)self setInputContainsInProgressStroke:v14 != 0];

  v15 = [v5 textInputTargets];
  v16 = (void *)[v15 copy];
  [(PKTextInputDebugLogEntry *)self setInputTargets:v16];

  if (v47)
  {
    id v17 = v47[6];
    v18 = v17;
    if (v17)
    {
      v19 = (void *)*((void *)v17 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = 0;
LABEL_6:
  id v20 = v19;

  if (!v20) {
    goto LABEL_15;
  }
  if (v47 && (v21 = (id *)v47[6]) != 0)
  {
    v22 = v21;
    id v23 = v21[1];
    v24 = v23;
    if (v23)
    {
      v25 = (void *)*((void *)v23 + 14);
      goto LABEL_11;
    }
  }
  else
  {
    v24 = 0;
    v22 = 0;
  }
  v25 = 0;
LABEL_11:
  id v26 = v25;

  v27 = [v5 submittedTargetContentInfoForRecognitionIdentifier:v26];
  [(PKTextInputDebugLogEntry *)self setInputTargetContentInfo:v27];

  if (!v47)
  {
    v29 = 0;
    goto LABEL_36;
  }
  id v28 = v47[6];
  v29 = v28;
  if (!v28)
  {
LABEL_36:
    v30 = 0;
    goto LABEL_14;
  }
  v30 = (void *)*((void *)v28 + 1);
LABEL_14:
  v31 = v30;
  v32 = -[PKTextInputElement debugElementTypeDescription](v31);
  [(PKTextInputDebugLogEntry *)self setInputTargetElementType:v32];

LABEL_15:
  if (v47)
  {
    id v33 = v47[4];
    [(PKTextInputDebugRecordingLogEntry *)self set_resultQueryItem:v33];

    v34 = [v8 textResult];
    [(PKTextInputDebugLogEntry *)self setTokenizedTextResult:v34];

    id v35 = v47[10];
  }
  else
  {
    [(PKTextInputDebugRecordingLogEntry *)self set_resultQueryItem:0];
    v46 = [v8 textResult];
    [(PKTextInputDebugLogEntry *)self setTokenizedTextResult:v46];

    id v35 = 0;
  }
  id v36 = v35;
  [(PKTextInputDebugLogEntry *)self setResultCommittedText:v36];

  v37 = [v8 textResult];
  v38 = [v37 topTranscription];
  [(PKTextInputDebugLogEntry *)self setResultTopTranscription:v38];

  if (v47)
  {
    [(PKTextInputDebugLogEntry *)self setResultCommittedTokenColumnCount:v47[11]];
    id v39 = v47[12];
  }
  else
  {
    [(PKTextInputDebugLogEntry *)self setResultCommittedTokenColumnCount:0];
    id v39 = 0;
  }
  id v40 = v39;
  [(PKTextInputDebugLogEntry *)self setResultCommitReason:v40];

  if (v8)
  {
    uint64_t v41 = [v8 affectedRange];
    uint64_t v43 = v42;
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", v41, v43);
  unint64_t v44 = [v8 resultType];
  if (v44 > 8) {
    v45 = &stru_1F1FB2C00;
  }
  else {
    v45 = off_1E64CB930[v44];
  }
  [(PKTextInputDebugLogEntry *)self setResultTypeDescription:v45];
  [v5 recognitionDuration];
  -[PKTextInputDebugLogEntry setResultRecognitionDuration:](self, "setResultRecognitionDuration:");
}

- (id)inputDrawing
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  inputDrawing = self->super._inputDrawing;
  if (!inputDrawing)
  {
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
    id v5 = +[PKTextInputCanvasController defaultInkWithColor:]((uint64_t)PKTextInputCanvasController, v4);

    id v6 = (void *)MEMORY[0x1E4F1CA48];
    id v7 = [(PKTextInputDebugRecordingLogEntry *)self _originalDrawing];
    objc_super v8 = [v7 strokes];
    v9 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = [(PKTextInputDebugRecordingLogEntry *)self _originalDrawing];
    v11 = [v10 strokes];

    id obj = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v17 = [(PKTextInputDebugRecordingLogEntry *)self _originalDrawing];
          id v18 = objc_alloc((Class)[v17 strokeClass]);
          v19 = [v16 path];
          if (v16) {
            [v16 transform];
          }
          else {
            memset(v26, 0, sizeof(v26));
          }
          id v20 = [v16 mask];
          v21 = (void *)[v18 initWithInk:v5 strokePath:v19 transform:v26 mask:v20];
          [v9 addObject:v21];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    v22 = [[PKDrawing alloc] initWithStrokes:v9];
    id v23 = self->super._inputDrawing;
    self->super._inputDrawing = v22;

    inputDrawing = self->super._inputDrawing;
  }

  return inputDrawing;
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  id v7 = [(id)objc_opt_class() loggedDateFormatter];
  objc_super v8 = [(PKTextInputDebugLogEntry *)self entryDate];
  v9 = [v7 stringFromDate:v8];
  [v6 setObject:v9 forKeyedSubscript:@"date"];

  v10 = [(PKTextInputDebugRecordingLogEntry *)self inputDrawing];
  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "_dictionaryRepresentationForDrawing:detailLevel:containsInProgress:", v10, a3, -[PKTextInputDebugLogEntry inputContainsInProgressStroke](self, "inputContainsInProgressStroke"));
    [v6 setObject:v11 forKeyedSubscript:@"inputDrawing"];
  }
  unint64_t v12 = 0x1E4F28000uLL;
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v14 = [(PKTextInputDebugLogEntry *)self inputTargets];
      v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v16 = [(PKTextInputDebugLogEntry *)self inputTargets];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v63 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [(id)objc_opt_class() _dictionaryRepresentationForTarget:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }
        while (v18);
      }

      [v6 setObject:v15 forKeyedSubscript:@"inputTargets"];
      unint64_t v12 = 0x1E4F28000;
    }
  }
  else
  {
    v22 = NSNumber;
    id v23 = [(PKTextInputDebugLogEntry *)self inputTargets];
    v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    [v6 setObject:v24 forKeyedSubscript:@"inputTargetsCount"];
  }
  v25 = [(PKTextInputDebugLogEntry *)self inputTargetContentInfo];

  if (v25)
  {
    uint64_t v60 = [(PKTextInputDebugLogEntry *)self resultAffectedRange];
    uint64_t v27 = v26;
    long long v28 = v6;
    int64_t v29 = a3;
    long long v30 = v10;
    unint64_t v31 = v12;
    uint64_t v32 = objc_opt_class();
    id v33 = [(PKTextInputDebugLogEntry *)self inputTargetContentInfo];
    v34 = [(PKTextInputDebugLogEntry *)self inputTargetElementType];
    id v35 = [(PKTextInputDebugLogEntry *)self recognitionLocaleIdentifiers];
    id v36 = (void *)v32;
    unint64_t v12 = v31;
    v10 = v30;
    a3 = v29;
    id v6 = v28;
    v37 = objc_msgSend(v36, "_dictionaryRepresentationForTargetContentInfo:elementType:detailLevel:contentLevel:resultAffectedRange:localeIdentifiers:", v33, v34, a3, a4, v60, v27, v35);

    [v6 setObject:v37 forKeyedSubscript:@"inputTargetContentInfo"];
  }
  v38 = [(PKTextInputDebugRecordingLogEntry *)self _resultQueryItem];

  if (v38)
  {
    id v39 = objc_opt_class();
    id v40 = [(PKTextInputDebugRecordingLogEntry *)self _resultQueryItem];
    uint64_t v41 = [v39 _mutableDictionaryRepresentationForResultQueryItem:v40 detailLevel:a3];

    uint64_t v42 = *(void **)(v12 + 3792);
    [(PKTextInputDebugLogEntry *)self resultRecognitionDuration];
    uint64_t v43 = objc_msgSend(v42, "numberWithDouble:");
    [v41 setObject:v43 forKeyedSubscript:@"recognitionDuration"];

    uint64_t v44 = [(PKTextInputDebugLogEntry *)self recognitionLocaleIdentifiers];
    v45 = (void *)v44;
    if (v44) {
      uint64_t v46 = v44;
    }
    else {
      uint64_t v46 = MEMORY[0x1E4F1CBF0];
    }
    [v41 setObject:v46 forKeyedSubscript:@"recognitionLocales"];

    v47 = [(PKTextInputDebugLogEntry *)self recognitionLocaleIdentifiers];
    uint64_t v48 = [v47 firstObject];
    v49 = (void *)v48;
    if (v48) {
      v50 = (__CFString *)v48;
    }
    else {
      v50 = &stru_1F1FB2C00;
    }
    [v41 setObject:v50 forKeyedSubscript:@"recognitionLocale"];

    [v6 setObject:v41 forKeyedSubscript:@"recognitionResult"];
  }
  uint64_t v51 = [(PKTextInputDebugLogEntry *)self resultCommittedText];
  v52 = (void *)v51;
  if (v51) {
    v53 = (__CFString *)v51;
  }
  else {
    v53 = &stru_1F1FB2C00;
  }
  [v6 setObject:v53 forKeyedSubscript:@"committedText"];

  v54 = objc_msgSend(*(id *)(v12 + 3792), "numberWithInteger:", -[PKTextInputDebugLogEntry resultCommittedTokenColumnCount](self, "resultCommittedTokenColumnCount"));
  [v6 setObject:v54 forKeyedSubscript:@"committedTokenColumnCount"];

  uint64_t v55 = [(PKTextInputDebugLogEntry *)self resultCommitReason];
  v56 = (void *)v55;
  if (v55) {
    v57 = (__CFString *)v55;
  }
  else {
    v57 = &stru_1F1FB2C00;
  }
  [v6 setObject:v57 forKeyedSubscript:@"commitReason"];

  v58 = (void *)[v6 copy];

  return v58;
}

+ (id)_dictionaryRepresentationForDrawing:(id)a3 detailLevel:(int64_t)a4 containsInProgress:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  objc_super v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = NSNumber;
  v10 = [v7 strokes];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  [v8 setObject:v11 forKeyedSubscript:@"strokeCount"];

  [v7 bounds];
  unint64_t v12 = NSStringFromCGRect(v17);
  [v8 setObject:v12 forKeyedSubscript:@"bounds"];

  uint64_t v13 = [NSNumber numberWithBool:v5];
  [v8 setObject:v13 forKeyedSubscript:@"containsInProgressStroke"];

  if (a4 == 1)
  {
    uint64_t v14 = [v7 dataRepresentation];
    [v8 setObject:v14 forKeyedSubscript:@"drawingData"];
  }

  return v8;
}

+ (id)_dictionaryRepresentationForTarget:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"identifier";
  id v3 = a3;
  id v4 = [v3 inputTargetIdentifier];
  v16[1] = @"frame";
  v17[0] = v4;
  [v3 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  uint64_t v13 = NSStringFromCGRect(v19);
  v17[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v14;
}

+ (id)_dictionaryRepresentationForTargetContentInfo:(id)a3 elementType:(id)a4 detailLevel:(int64_t)a5 contentLevel:(int64_t)a6 resultAffectedRange:(_NSRange)a7 localeIdentifiers:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a8;
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = [v12 textInputTarget];
  CGRect v17 = [v16 inputTargetIdentifier];
  [v15 setObject:v17 forKeyedSubscript:@"targetIdentifier"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "textContentLength"));
  [v15 setObject:v18 forKeyedSubscript:@"textContentLength"];

  if (v13) {
    [v15 setObject:v13 forKeyedSubscript:@"elementType"];
  }
  if (objc_msgSend(v12, "referenceSubstringRange", a7.location, a7.length) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v50.location = [v12 referenceSubstringRange];
    CGRect v19 = NSStringFromRange(v50);
    [v15 setObject:v19 forKeyedSubscript:@"referenceSubstringRange"];
  }
  if ([v12 strokeCoveredTextRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v51.location = [v12 strokeCoveredTextRange];
    id v20 = NSStringFromRange(v51);
    [v15 setObject:v20 forKeyedSubscript:@"strokeCoveredTextRange"];
  }
  if ([v12 selectedTextRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v52.location = [v12 selectedTextRange];
    v21 = NSStringFromRange(v52);
    [v15 setObject:v21 forKeyedSubscript:@"selectedTextRange"];
  }
  if ([v12 activePreviewRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v53.location = [v12 activePreviewRange];
    v22 = NSStringFromRange(v53);
    [v15 setObject:v22 forKeyedSubscript:@"activePreviewRange"];
  }
  if ([v12 lastCharacterLevelPosition] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "lastCharacterLevelPosition"));
    [v15 setObject:v23 forKeyedSubscript:@"lastCharacterLevelPosition"];
  }
  v24 = [v12 protectedCharacterIndexes];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    uint64_t v26 = [v12 protectedCharacterIndexes];
    [v15 setObject:v26 forKeyedSubscript:@"protectedCharacterIndexes"];
  }
  unsigned int v27 = [v12 contentType];
  if (v27 > 7) {
    long long v28 = &stru_1F1FB2C00;
  }
  else {
    long long v28 = off_1E64CB978[v27];
  }
  [v15 setObject:v28 forKeyedSubscript:@"contentType"];
  unsigned int v29 = [v12 autoCapitalizationMode];
  if (v29 > 5) {
    long long v30 = &stru_1F1FB2C00;
  }
  else {
    long long v30 = off_1E64CB9B8[v29];
  }
  [v15 setObject:v30 forKeyedSubscript:@"autocapitalization"];
  unsigned int v31 = [v12 autoCorrectionMode];
  if (v31 > 2) {
    uint64_t v32 = &stru_1F1FB2C00;
  }
  else {
    uint64_t v32 = off_1E64CB9E8[v31];
  }
  [v15 setObject:v32 forKeyedSubscript:@"autocorrection"];
  id v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isCursorStrong"));
  [v15 setObject:v33 forKeyedSubscript:@"isCursorStrong"];

  v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isSingleLine"));
  [v15 setObject:v34 forKeyedSubscript:@"isSingleLine"];

  id v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "containsCommittedStrokes"));
  [v15 setObject:v35 forKeyedSubscript:@"containsCommittedStrokes"];

  if (a5 == 1)
  {
    uint64_t v36 = [v12 referenceSubstringRange];
    uint64_t v38 = v37;
    if ([v12 characterRectsInReferenceSubstring])
    {
      if (v36 != 0x7FFFFFFFFFFFFFFFLL && v38)
      {
        id v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v38];
        uint64_t v40 = [v12 characterRectsInReferenceSubstring] + 16;
        do
        {
          CGRect v54 = *(CGRect *)(v40 - 16);
          v40 += 32;
          uint64_t v41 = NSStringFromCGRect(v54);
          [v39 addObject:v41];

          --v38;
        }
        while (v38);
        [v15 setObject:v39 forKeyedSubscript:@"characterRectsInReferenceSubstring"];
      }
    }
  }
  uint64_t v42 = [v14 firstObject];
  uint64_t v43 = objc_msgSend(a1, "_referenceSubstringForTargetContentInfo:resultAffectedRange:targetContentLevel:localeIdentifier:", v12, v47, v48, a6, v42);

  if ((unint64_t)a6 > 2) {
    uint64_t v44 = 0;
  }
  else {
    uint64_t v44 = off_1E64CBA00[a6];
  }
  [v15 setObject:v43 forKeyedSubscript:@"referenceSubstring"];
  [v15 setObject:v44 forKeyedSubscript:@"referenceSubstringLogContentLevel"];

  return v15;
}

- (CHTextInputQueryItem)_resultQueryItem
{
  return self->__resultQueryItem;
}

- (void)set_resultQueryItem:(id)a3
{
}

- (PKDrawing)_originalDrawing
{
  return self->__originalDrawing;
}

- (void)set_originalDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__originalDrawing, 0);

  objc_storeStrong((id *)&self->__resultQueryItem, 0);
}

@end