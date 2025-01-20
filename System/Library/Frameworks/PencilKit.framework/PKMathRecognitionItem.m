@interface PKMathRecognitionItem
- (BOOL)isLowConfidenceMath;
- (BOOL)isRecentlyCreated;
- (BOOL)isValidForDrawing:(id)a3;
- (BOOL)isVerticalExpression;
- (BOOL)shouldBeSolved;
- (BOOL)shouldSolveMathFlagIsSet;
- (CGRect)bounds;
- (CGRect)boundsForTriggerStrokes;
- (NSArray)scrubbableVariables;
- (NSArray)strokes;
- (NSArray)symbolStrokes;
- (NSArray)tappableStrokes;
- (NSArray)triggerStrokes;
- (NSNumber)strokeGroupIdentifier;
- (NSString)expression;
- (NSString)expressionToPresent;
- (NSUUID)uuid;
- (double)_boundsForStrokeIndexes:(void *)a1;
- (double)_boundsForStrokes:(uint64_t)a1;
- (double)_remainingDelayForTargetDelay:(void *)a1;
- (double)boundsForAnyEqualSign;
- (double)boundsForEqualSign;
- (double)boundsForVerticalExpressionLine;
- (double)mostRecentStrokeTimestamp;
- (double)sortIndex;
- (double)suggestedDistanceBetweenDigits;
- (double)suggestedHeightForResult;
- (id)_anyEqualSignStrokes;
- (id)_findHeroStroke;
- (id)_heroStrokeInDrawing:(void *)a1;
- (id)_stringForVariable:(id)a1;
- (id)_strokeIndexesForCharacterRange:(uint64_t)a3;
- (id)_strokeIndexesForVerticalExpressionLine;
- (id)_strokesForStrokeIndexes:(void *)a1;
- (id)alternativesTokens;
- (id)changeIdentifier;
- (id)graphableVariables;
- (id)initWithStrokeGroupItem:(void *)a3 uuid:;
- (id)mathResult;
- (id)originalExpression;
- (id)stableIdentifier;
- (id)strokeUUIDs;
- (id)strokesForEqualSign;
- (id)strokesForIdentifier;
- (id)strokesForVerticalExpressionLine;
- (uint64_t)_tagAsRecentlyUpdated;
- (uint64_t)characterRangeForTriggerSymbol;
- (uint64_t)hasAnyErrors;
- (uint64_t)hasAnyErrorsOrAlternatives;
- (uint64_t)hasAnyTrignometry;
- (unint64_t)isRecentlyModified;
- (void)_logRecentlyModifiedAndCreated;
- (void)_setIsGraphable:(void *)a3 graphableVariables:;
- (void)_updateFromOldItem:(uint64_t)a1;
- (void)_updatePreferredTranscriptionChangingToken:(void *)a3 withAlternative:;
- (void)_updateVariable:(void *)a3 valueString:;
- (void)heroStroke;
@end

@implementation PKMathRecognitionItem

- (id)initWithStrokeGroupItem:(void *)a3 uuid:
{
  v56[1] = *MEMORY[0x1E4F143B8];
  v6 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_39;
  }
  v54.receiver = a1;
  v54.super_class = (Class)PKMathRecognitionItem;
  a1 = (id *)objc_msgSendSuper2(&v54, sel_init);
  if (!a1) {
    goto LABEL_39;
  }
  if (v6) {
    v8 = (void *)v6[1];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 mathResult];
  v11 = [v10 preferredTranscription];

  objc_storeStrong(a1 + 1, a2);
  if (v6)
  {
    long long v12 = *((_OWORD *)v6 + 2);
    long long v13 = *((_OWORD *)v6 + 3);
  }
  else
  {
    long long v12 = 0uLL;
    long long v13 = 0uLL;
  }
  *((_OWORD *)a1 + 9) = v12;
  *((_OWORD *)a1 + 10) = v13;
  id v14 = a1[7];
  a1[7] = (id)MEMORY[0x1E4F1CBF0];

  if ((unint64_t)[v11 length] <= 1)
  {
    *((unsigned char *)a1 + 72) = 0;
    goto LABEL_11;
  }
  int v15 = objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v11, "length") - 1);
  *((unsigned char *)a1 + 72) = v15 == 61;
  if (v15 != 61)
  {
LABEL_11:
    char v16 = [v11 hasSuffix:@"\\hline \\end{array}"];
    *((unsigned char *)a1 + 72) = v16;
    *((unsigned char *)a1 + 73) = v16;
  }
  objc_storeStrong(a1 + 10, v11);
  v49 = v11;
  if (v6) {
    v17 = (void *)v6[1];
  }
  else {
    v17 = 0;
  }
  id v18 = v17;
  v19 = [v18 mathResult];
  v20 = [v19 selectedTranscriptionPathIndex];

  if (v6) {
    v21 = (void *)v6[1];
  }
  else {
    v21 = 0;
  }
  id v22 = v21;
  v23 = [v22 mathResult];
  v24 = [v23 transcriptionPaths];
  v25 = v24;
  if (v20)
  {
    if (v6) {
      v26 = (void *)v6[1];
    }
    else {
      v26 = 0;
    }
    id v27 = v26;
    v28 = [v27 mathResult];
    v29 = [v28 selectedTranscriptionPathIndex];
    v30 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v29, "integerValue"));
    v56[0] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    id v32 = a1[8];
    a1[8] = (id)v31;
  }
  else
  {
    uint64_t v33 = [v24 copy];
    id v27 = a1[8];
    a1[8] = (id)v33;
  }

  if (v7)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v34 = -[PKMathRecognitionItem strokesForIdentifier](a1);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      char v37 = 0;
      uint64_t v38 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v51 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = [*(id *)(*((void *)&v50 + 1) + 8 * i) _strokeUUID];
          char v41 = [v40 isEqual:v7];

          v37 |= v41;
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v36);

      if (v37) {
        goto LABEL_35;
      }
    }
    else
    {
    }
    v42 = -[PKMathRecognitionItem strokesForIdentifier](a1);
    v43 = [v42 firstObject];
    uint64_t v44 = [v43 _strokeUUID];
  }
  else
  {
    v42 = -[PKMathRecognitionItem strokesForIdentifier](a1);
    v43 = [v42 firstObject];
    uint64_t v44 = [v43 _strokeUUID];
  }

  id v7 = (id)v44;
LABEL_35:
  if (v7)
  {
    id v45 = v7;
  }
  else
  {
    id v45 = [MEMORY[0x1E4F29128] UUID];
  }
  id v46 = a1[11];
  a1[11] = v45;

  v47 = -[PKMathRecognitionItem heroStroke](a1);
  *((unsigned char *)a1 + 74) = ([v47 _flags] & 0x20000000000) != 0;

LABEL_39:
  return a1;
}

- (id)strokesForIdentifier
{
  if (a1)
  {
    v2 = [a1 triggerStrokes];
    if (![v2 count])
    {
      uint64_t v3 = -[PKMathRecognitionItem _anyEqualSignStrokes](a1);

      v2 = (void *)v3;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)heroStroke
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = -[PKMathRecognitionItem _findHeroStroke]((id *)a1);
      v5 = (void *)v2[2];
      v2[2] = v4;

      uint64_t v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)graphableVariables
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isLowConfidenceMath
{
  v2 = -[PKMathRecognitionItem mathResult]((uint64_t)self);
  char v3 = [v2 hasLowConfidence];

  return v3;
}

- (id)mathResult
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 8);
    if (v1) {
      uint64_t v1 = (void *)v1[1];
    }
    v2 = v1;
    char v3 = [v2 mathResult];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)originalExpression
{
  if (a1)
  {
    uint64_t v1 = -[PKMathRecognitionItem mathResult](a1);
    v2 = [v1 preferredTranscription];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSString)expression
{
  updatedExpression = self->_updatedExpression;
  if (!updatedExpression) {
    updatedExpression = self->_expression;
  }
  return updatedExpression;
}

- (void)_updateVariable:(void *)a3 valueString:
{
  if (a1)
  {
    id v5 = a3;
    v6 = a2;
    id v7 = -[PKMathRecognitionItem originalExpression](a1);
    id v12 = (id)[v7 mutableCopy];

    if (v6)
    {
      uint64_t v9 = v6[5];
      uint64_t v8 = v6[6];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }

    objc_msgSend(v12, "replaceCharactersInRange:withString:", v9, v8, v5);
    uint64_t v10 = [v12 copy];
    v11 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v10;

    *(unsigned char *)(a1 + 75) = 1;
  }
}

- (id)_stringForVariable:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    char v3 = a2;
    uint64_t v4 = -[PKMathRecognitionItem originalExpression]((uint64_t)v2);
    if (v3)
    {
      uint64_t v6 = v3[5];
      uint64_t v5 = v3[6];
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }

    id v7 = objc_msgSend(v4, "substringWithRange:", v6, v5);

    id v2 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1FB2C00];
  }

  return v2;
}

- (NSNumber)strokeGroupIdentifier
{
  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem) {
    strokeGroupItem = (PKStrokeGroupItem *)strokeGroupItem->_strokeGroupItem;
  }
  char v3 = strokeGroupItem;
  uint64_t v4 = [(PKStrokeGroupItem *)v3 strokeGroupIdentifier];

  return (NSNumber *)v4;
}

- (id)stableIdentifier
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 8);
    if (v1) {
      uint64_t v1 = (void *)v1[1];
    }
    id v2 = v1;
    char v3 = [v2 strokeGroupStableIdentifier];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)changeIdentifier
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 8);
    if (v1) {
      uint64_t v1 = (void *)v1[1];
    }
    id v2 = v1;
    char v3 = [v2 strokeGroupIdentifier];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (NSArray)strokes
{
  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem) {
    return strokeGroupItem->_strokes;
  }
  else {
    return 0;
  }
}

- (id)strokeUUIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F1CA80];
    char v3 = [a1 strokes];
    uint64_t v4 = objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = objc_msgSend(a1, "strokes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) _strokeUUID];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (double)boundsForEqualSign
{
  if (!a1) {
    return 0.0;
  }
  id v2 = -[PKMathRecognitionItem strokesForEqualSign](a1);
  double v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)strokesForEqualSign
{
  id v1 = a1;
  if (a1)
  {
    if (a1[72])
    {
      if (!a1[73])
      {
        id v2 = -[PKMathRecognitionItem mathResult]((uint64_t)a1);
        double v3 = [v2 symbolStrokeIndexes];
        uint64_t v4 = [v3 lastObject];
LABEL_10:

        goto LABEL_13;
      }
    }
    else if (!a1[73])
    {
      uint64_t v5 = -[PKMathRecognitionItem mathResult]((uint64_t)a1);
      uint64_t v6 = [v5 preferredTranscription];
      uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v2 = [v6 componentsSeparatedByCharactersInSet:v7];

      uint64_t v8 = [v2 count];
      while (--v8 >= 0)
      {
        uint64_t v9 = [v2 objectAtIndexedSubscript:v8];
        int v10 = [v9 isEqualToString:@"="];

        if (v10)
        {
          double v3 = -[PKMathRecognitionItem mathResult]((uint64_t)v1);
          v11 = [v3 symbolStrokeIndexes];
          uint64_t v4 = [v11 objectAtIndexedSubscript:v8];

          goto LABEL_10;
        }
      }
    }
    uint64_t v4 = [MEMORY[0x1E4F28D60] indexSet];
LABEL_13:
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v4);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (double)_boundsForStrokes:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    double x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) renderBounds];
          v26.origin.double x = v13;
          v26.origin.CGFloat y = v14;
          v26.size.CGFloat width = v15;
          v26.size.CGFloat height = v16;
          v24.origin.double x = x;
          v24.origin.CGFloat y = y;
          v24.size.CGFloat width = width;
          v24.size.CGFloat height = height;
          CGRect v25 = CGRectUnion(v24, v26);
          double x = v25.origin.x;
          CGFloat y = v25.origin.y;
          CGFloat width = v25.size.width;
          CGFloat height = v25.size.height;
        }
        uint64_t v10 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    double x = 0.0;
  }

  return x;
}

- (double)boundsForAnyEqualSign
{
  if (!a1) {
    return 0.0;
  }
  id v2 = -[PKMathRecognitionItem _anyEqualSignStrokes](a1);
  double v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)_anyEqualSignStrokes
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28D60] indexSet];
    double v3 = -[PKMathRecognitionItem mathResult]((uint64_t)v1);
    uint64_t v4 = [v3 preferredTranscription];
    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

    uint64_t v7 = [v6 count];
    while (v7-- >= 1)
    {
      uint64_t v9 = [v6 objectAtIndexedSubscript:v7];
      int v10 = [v9 isEqualToString:@"="];

      if (v10)
      {
        uint64_t v11 = -[PKMathRecognitionItem mathResult]((uint64_t)v1);
        long long v12 = [v11 symbolStrokeIndexes];
        uint64_t v13 = [v12 objectAtIndexedSubscript:v7];

        id v2 = (void *)v13;
        break;
      }
    }
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (double)boundsForVerticalExpressionLine
{
  if (!a1) {
    return 0.0;
  }
  id v2 = -[PKMathRecognitionItem strokesForVerticalExpressionLine](a1);
  double v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)strokesForVerticalExpressionLine
{
  id v1 = a1;
  if (a1)
  {
    id v2 = -[PKMathRecognitionItem _strokeIndexesForVerticalExpressionLine](a1);
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (CGRect)boundsForTriggerStrokes
{
  if ([(PKMathRecognitionItem *)self shouldBeSolved])
  {
    if ([(PKMathRecognitionItem *)self isVerticalExpression]) {
      double v3 = -[PKMathRecognitionItem boundsForVerticalExpressionLine](self);
    }
    else {
      double v3 = -[PKMathRecognitionItem boundsForEqualSign](self);
    }
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSArray)triggerStrokes
{
  if ([(PKMathRecognitionItem *)self shouldBeSolved])
  {
    if ([(PKMathRecognitionItem *)self isVerticalExpression]) {
      -[PKMathRecognitionItem strokesForVerticalExpressionLine](self);
    }
    else {
    double v3 = -[PKMathRecognitionItem strokesForEqualSign](self);
    }
  }
  else
  {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (id)_strokesForStrokeIndexes:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [a1 strokes];
    double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v6 = [v3 firstIndex];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (unint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = [v3 indexGreaterThanIndex:i])
      {
        if (i >= [v4 count])
        {
          int v10 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v11 = 0;
            _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "Stroke index out of bounds", v11, 2u);
          }
        }
        else
        {
          int v10 = [v4 objectAtIndexedSubscript:i];
          [v5 addObject:v10];
        }
      }
    }
    uint64_t v7 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)symbolStrokes
{
  id v3 = (void *)MEMORY[0x1E4F1CA70];
  double v4 = [(PKMathRecognitionItem *)self strokes];
  double v5 = [v3 orderedSetWithArray:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [(PKMathRecognitionItem *)self triggerStrokes];
  uint64_t v8 = [v6 setWithArray:v7];
  [v5 minusSet:v8];

  uint64_t v9 = [v5 array];

  return (NSArray *)v9;
}

- (double)_boundsForStrokeIndexes:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  id v3 = -[PKMathRecognitionItem _strokesForStrokeIndexes:](a1, a2);
  double v4 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v3);

  return v4;
}

- (id)_strokeIndexesForVerticalExpressionLine
{
  id v1 = a1;
  if (a1)
  {
    if (a1[73])
    {
      id v2 = -[PKMathRecognitionItem mathResult]((uint64_t)a1);
      id v3 = [v2 preferredTranscription];
      double v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      double v5 = [v3 componentsSeparatedByCharactersInSet:v4];

      uint64_t v6 = [v5 count];
      while (--v6 >= 0)
      {
        uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
        int v8 = [v7 isEqualToString:@"\\hline"];

        if (v8)
        {
          uint64_t v9 = -[PKMathRecognitionItem mathResult]((uint64_t)v1);
          int v10 = [v9 symbolStrokeIndexes];
          id v1 = [v10 objectAtIndexedSubscript:v6];

          goto LABEL_9;
        }
      }
    }
    id v1 = [MEMORY[0x1E4F28D60] indexSet];
  }
LABEL_9:

  return v1;
}

- (NSArray)tappableStrokes
{
  if (self)
  {
    id v3 = [MEMORY[0x1E4F28E60] indexSet];
    double v4 = -[PKMathRecognitionItem mathResult]((uint64_t)self);
    double v5 = [v4 preferredTranscription];
    uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v7 = [v5 componentsSeparatedByCharactersInSet:v6];

    if ([v7 count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
        if ([v9 isEqualToString:@"\\hline"]) {
          break;
        }
        int v10 = [v7 objectAtIndexedSubscript:v8];
        int v11 = [v10 isEqualToString:@"="];

        if (v11) {
          goto LABEL_7;
        }
LABEL_8:
        if (++v8 >= (unint64_t)[v7 count]) {
          goto LABEL_9;
        }
      }

LABEL_7:
      long long v12 = -[PKMathRecognitionItem mathResult]((uint64_t)self);
      uint64_t v13 = [v12 symbolStrokeIndexes];
      CGFloat v14 = [v13 objectAtIndexedSubscript:v8];

      [v3 addIndexes:v14];
      goto LABEL_8;
    }
LABEL_9:
    CGFloat v15 = (void *)[v3 copy];
  }
  else
  {
    CGFloat v15 = 0;
  }
  CGFloat v16 = -[PKMathRecognitionItem _strokesForStrokeIndexes:](self, v15);

  return (NSArray *)v16;
}

- (NSString)expressionToPresent
{
  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem) {
    strokeGroupItem = (PKStrokeGroupItem *)strokeGroupItem->_strokeGroupItem;
  }
  double v4 = strokeGroupItem;
  double v5 = [(PKStrokeGroupItem *)v4 mathResult];
  uint64_t v6 = [v5 preferredTranscription];

  if ([(PKMathRecognitionItem *)self shouldBeSolved]
    && ![(PKMathRecognitionItem *)self isVerticalExpression])
  {
    uint64_t v7 = [v6 componentsSeparatedByString:@"="];
    uint64_t v8 = [v7 firstObject];

    uint64_t v6 = (void *)v8;
  }

  return (NSString *)v6;
}

- (double)suggestedHeightForResult
{
  if (!a1) {
    return 0.0;
  }
  id v1 = -[PKMathRecognitionItem mathResult](a1);
  [v1 baseCharacterHeight];
  double v3 = v2;

  return v3;
}

- (double)suggestedDistanceBetweenDigits
{
  double v1 = 0.0;
  if (a1 && [a1 isVerticalExpression])
  {
    uint64_t v22 = 0;
    uint64_t v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = 0;
    long long v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x4010000000;
    v15[3] = "";
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v16 = *MEMORY[0x1E4F1DB20];
    long long v17 = v3;
    double v4 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    double v5 = -[PKMathRecognitionItem mathResult]((uint64_t)a1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__PKMathRecognitionItem_suggestedDistanceBetweenDigits__block_invoke;
    v9[3] = &unk_1E64CADB0;
    id v6 = v4;
    id v10 = v6;
    int v11 = a1;
    long long v12 = v15;
    uint64_t v13 = &v22;
    CGFloat v14 = &v18;
    [v5 enumerateTokensInPreferredTranscriptionPathWithBlock:v9];

    double v7 = v19[3];
    if (v7 > 0.0) {
      double v1 = v23[3] / v7;
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  return v1;
}

void __55__PKMathRecognitionItem_suggestedDistanceBetweenDigits__block_invoke(void *a1, void *a2)
{
  id v22 = a2;
  long long v3 = [v22 string];
  BOOL v4 = [v3 length] == 1 && objc_msgSend(v3, "rangeOfCharacterFromSet:", a1[4]) == 0;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(a1[6] + 8) + 32));
  id v6 = (_OWORD *)MEMORY[0x1E4F1DB20];
  if (v4)
  {
    double v7 = (void *)a1[5];
    uint64_t v8 = [v22 strokeIndexes];
    double v9 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v7, v8);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v24.origin.double x = v9;
  v24.origin.CGFloat y = v11;
  v24.size.CGFloat width = v13;
  v24.size.CGFloat height = v15;
  BOOL v16 = CGRectIsNull(v24);
  BOOL v17 = v16;
  if (!v16 && !IsNull)
  {
    v25.origin.double x = v9;
    v25.origin.CGFloat y = v11;
    v25.size.CGFloat width = v13;
    v25.size.CGFloat height = v15;
    double MinX = CGRectGetMinX(v25);
    double v19 = MinX - CGRectGetMinX(*(CGRect *)(*(void *)(a1[6] + 8) + 32));
    if (v19 > 0.0)
    {
      *(double *)(*(void *)(a1[7] + 8) + 24) = v19 + *(double *)(*(void *)(a1[7] + 8) + 24);
      *(double *)(*(void *)(a1[8] + 8) + 24) = *(double *)(*(void *)(a1[8] + 8) + 24) + 1.0;
    }
  }
  uint64_t v20 = *(void *)(a1[6] + 8);
  if (v17)
  {
    long long v21 = v6[1];
    *(_OWORD *)(v20 + 32) = *v6;
    *(_OWORD *)(v20 + 48) = v21;
  }
  else
  {
    *(double *)(v20 + 32) = v9;
    *(CGFloat *)(v20 + 40) = v11;
    *(CGFloat *)(v20 + 48) = v13;
    *(CGFloat *)(v20 + 56) = v15;
  }
}

- (BOOL)isValidForDrawing:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(PKMathRecognitionItem *)self strokes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _strokeUUID];
        CGFloat v11 = [v4 _visibleStrokeForIdentifier:v10];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (NSArray)scrubbableVariables
{
  scrubbableVariables = self->_scrubbableVariables;
  if (!scrubbableVariables)
  {
    allTokens = self->_allTokens;
    if (allTokens)
    {
      double v5 = allTokens;
      +[PKMathVariable variablesForTokens:item:]((uint64_t)PKMathVariable, v5, self);
      uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_scrubbableVariables;
      self->_scrubbableVariables = v6;

      scrubbableVariables = self->_scrubbableVariables;
    }
    else
    {
      scrubbableVariables = 0;
    }
  }

  return scrubbableVariables;
}

- (id)_strokeIndexesForCharacterRange:(uint64_t)a3
{
  if (a1)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    uint64_t v10 = 0;
    CGFloat v11 = &v10;
    uint64_t v12 = 0x3032000000;
    CGFloat v13 = __Block_byref_object_copy__31;
    long long v14 = __Block_byref_object_dispose__31;
    id v15 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v6 = -[PKMathRecognitionItem mathResult](a1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PKMathRecognitionItem__strokeIndexesForCharacterRange___block_invoke;
    v9[3] = &unk_1E64CADD8;
    v9[6] = a2;
    v9[7] = a3;
    void v9[4] = v16;
    v9[5] = &v10;
    [v6 enumerateTokensInPreferredTranscriptionPathWithBlock:v9];

    uint64_t v7 = (void *)[(id)v11[5] copy];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __57__PKMathRecognitionItem__strokeIndexesForCharacterRange___block_invoke(NSRange *a1, void *a2)
{
  id v7 = a2;
  long long v3 = [v7 string];
  NSUInteger v4 = *(void *)(*(void *)(a1[2].location + 8) + 24);
  v9.length = [v3 length];
  v9.location = v4;
  if (NSIntersectionRange(a1[48], v9).length)
  {
    double v5 = *(void **)(*(void *)(a1[2].length + 8) + 40);
    uint64_t v6 = [v7 strokeIndexes];
    [v5 addIndexes:v6];
  }
  *(void *)(*(void *)(a1[2].location + 8) + 24) += [v3 length] + 1;
}

- (unint64_t)isRecentlyModified
{
  unint64_t v1 = (unint64_t)a1;
  if (a1)
  {
    double v2 = [a1 strokes];
    if ([v2 count])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v4 = v3;
      double v5 = -[PKMathRecognitionItem mostRecentStrokeTimestamp]((void *)v1);
      if (v5 < *(double *)(v1 + 40)) {
        double v5 = *(double *)(v1 + 40);
      }
      unint64_t v1 = v4 - v5 < 5.0;
    }
    else
    {
      unint64_t v1 = 0;
    }
  }
  return v1;
}

- (double)mostRecentStrokeTimestamp
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v1 = objc_msgSend(a1, "strokes", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = +[PKLocalStrokeTracker sharedInstance]();
        BOOL v9 = -[PKLocalStrokeTracker isRecentlyCreatedLocalStroke:]((uint64_t)v8, v7);

        if (v9)
        {
          [v7 timestamp];
          double v11 = v10;
          uint64_t v12 = [v7 path];
          if ([v12 count])
          {
            objc_msgSend(v12, "timestampAtIndex:", objc_msgSend(v12, "count") - 1);
            double v11 = v11 + v13;
          }
          if (v5 < v11) {
            double v5 = v11;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)isRecentlyCreated
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    if ([a1 isVerticalExpression]) {
      -[PKMathRecognitionItem strokesForVerticalExpressionLine]((unsigned char *)v1);
    }
    else {
    uint64_t v2 = -[PKMathRecognitionItem _anyEqualSignStrokes]((id)v1);
    }
    if (![v2 count])
    {
      uint64_t v3 = [(id)v1 strokes];

      uint64_t v2 = (void *)v3;
    }
    if ([v2 count])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v5 = v4;
      uint64_t v6 = [v2 valueForKeyPath:@"@min.timestamp"];
      [v6 doubleValue];
      double v8 = v7;

      BOOL v1 = v5 - v8 < 10.0;
    }
    else
    {
      BOOL v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)hasAnyTrignometry
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(a1 + 104);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "isTrigonometric", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (uint64_t)characterRangeForTriggerSymbol
{
  if (!a1) {
    return 0;
  }
  int v2 = [a1 isVerticalExpression];
  uint64_t v3 = [a1 expression];
  double v4 = v3;
  if (v2) {
    double v5 = @"\\hline";
  }
  else {
    double v5 = @"=";
  }
  uint64_t v6 = [v3 rangeOfString:v5 options:4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (uint64_t)hasAnyErrorsOrAlternatives
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(a1 + 104);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v7 = objc_msgSend(v6, "alternatives", (void)v12);
        if ([v7 count])
        {

LABEL_14:
          uint64_t v10 = 1;
          goto LABEL_15;
        }
        long long v8 = [v6 errors];
        uint64_t v9 = [v8 count];

        if (v9) {
          goto LABEL_14;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_15:

  return v10;
}

- (uint64_t)hasAnyErrors
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 104);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        double v5 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "errors", (void)v8);
        uint64_t v6 = [v5 count];

        if (v6)
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (id)alternativesTokens
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    if ((unint64_t)[*(id *)(a1 + 64) count] < 2)
    {
      uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_35;
    }
    char v41 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = -[PKMathRecognitionItem mathResult](v1);
    uint64_t v4 = [v3 tokenColumnCount];

    if (v4 < 1) {
      goto LABEL_30;
    }
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v44 = (void *)v1;
LABEL_6:
    long long v7 = -[PKMathRecognitionItem mathResult](v1);
    long long v8 = [*(id *)(v1 + 64) firstObject];
    id v46 = objc_msgSend(v7, "transcriptionWithPath:columnRange:", v8, v6, 1);

    long long v9 = -[PKMathRecognitionItem mathResult](v1);
    long long v10 = [v9 tokenRowsAtColumnIndex:v6];

    if ([v10 count])
    {
      uint64_t v45 = v5;
      long long v11 = [MEMORY[0x1E4F28E60] indexSet];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v12 = *(id *)(v1 + 64);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (!v13) {
        goto LABEL_23;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      while (1)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v6 >= [v17 length])
          {
            uint64_t v19 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v20 = v19;
              long long v21 = "Unexpected column index for available transcription path";
LABEL_19:
              _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
            }
          }
          else
          {
            unint64_t v18 = [v17 indexAtPosition:v6];
            if (v18 < [v10 count])
            {
              [v11 addIndex:v18];
              continue;
            }
            uint64_t v19 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v20 = v19;
              long long v21 = "Unexpected row index in available transcription path";
              goto LABEL_19;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (!v14)
        {
LABEL_23:

          uint64_t v1 = (uint64_t)v44;
          uint64_t v22 = v45;
          if ((unint64_t)[v11 count] >= 2)
          {
            uint64_t v23 = objc_alloc_init(PKMathRecognitionToken);
            [(PKMathRecognitionToken *)v23 setItem:v44];
            [(PKMathRecognitionToken *)v23 setType:4];
            -[PKMathRecognitionToken setCharacterRange:](v23, "setCharacterRange:", v45, [v46 length]);
            CGRect v24 = -[PKMathRecognitionItem mathResult]((uint64_t)v44);
            CGRect v25 = objc_msgSend(v24, "strokeIndexesForColumnsInRange:", v6, 1);

            v43 = v25;
            -[PKMathRecognitionToken setBounds:](v23, "setBounds:", -[PKMathRecognitionItem _boundsForStrokeIndexes:](v44, v25));
            CGRect v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count") - 1);
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __43__PKMathRecognitionItem_alternativesTokens__block_invoke;
            v47[3] = &unk_1E64CAE00;
            v47[4] = v44;
            id v48 = v10;
            id v27 = v26;
            id v49 = v27;
            [v11 enumerateIndexesUsingBlock:v47];
            [(PKMathRecognitionToken *)v23 setAlternatives:v27];
            v42 = v27;
            [(PKMathRecognitionToken *)v23 setRenderableAlternatives:v27];
            [(PKMathRecognitionToken *)v23 setColumnIndex:v6];
            v28 = -[PKMathRecognitionItem mathResult]((uint64_t)v44);
            LOBYTE(v27) = objc_opt_respondsToSelector();

            if (v27)
            {
              v29 = -[PKMathRecognitionItem mathResult]((uint64_t)v44);
              v30 = [v29 renderableLatexCandidatesForColumnIndex:v6];

              uint64_t v31 = [v30 objectsAtIndexes:v11];

              uint64_t v40 = [v31 count];
              id v32 = [(PKMathRecognitionToken *)v23 alternatives];
              uint64_t v33 = [v32 count];

              if (v40 == v33) {
                [(PKMathRecognitionToken *)v23 setRenderableAlternatives:v31];
              }

              uint64_t v22 = v45;
            }
            [v41 addObject:v23];
          }
          uint64_t v34 = [v46 length];

          uint64_t v5 = v22 + v34 + 1;
          ++v6;
          uint64_t v35 = -[PKMathRecognitionItem mathResult]((uint64_t)v44);
          uint64_t v36 = [v35 tokenColumnCount];

          if ((uint64_t)v6 >= v36)
          {
LABEL_30:
            char v37 = v41;
            uint64_t v2 = (void *)[v41 copy];
            goto LABEL_34;
          }
          goto LABEL_6;
        }
      }
    }
    uint64_t v38 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v38, OS_LOG_TYPE_DEFAULT, "Unexpected number of rows", buf, 2u);
    }

    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
    char v37 = v41;
LABEL_34:
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_35:

  return v2;
}

void __43__PKMathRecognitionItem_alternativesTokens__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v5 = v4;
  if (v3)
  {
    unint64_t v6 = [v4 lastObject];
    id v14 = [MEMORY[0x1E4F28E78] string];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = [v12 string];
          [v14 appendString:v13];

          if (v12 != v6) {
            [v14 appendString:@" "];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v14 = 0;
  }

  [*(id *)(a1 + 48) addObject:v14];
}

- (void)_updateFromOldItem:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v16 = v3;
    if (v3) {
      uint64_t v5 = (void *)v3[13];
    }
    else {
      uint64_t v5 = 0;
    }
    objc_setProperty_nonatomic_copy((id)a1, v4, v5, 104);
    *(unsigned char *)(a1 + 48) = *((unsigned char *)v16 + 48);
    uint64_t v6 = [*((id *)v16 + 7) copy];
    id v7 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v6;

    uint64_t v8 = -[PKMathRecognitionItem changeIdentifier](a1);
    uint64_t v9 = -[PKMathRecognitionItem changeIdentifier]((uint64_t)v16);
    if ([v8 isEqualToNumber:v9])
    {
      uint64_t v10 = -[PKMathRecognitionItem stableIdentifier](a1);
      long long v11 = -[PKMathRecognitionItem stableIdentifier]((uint64_t)v16);
      int v12 = [v10 isEqualToNumber:v11];

      uint64_t v3 = v16;
      if (!v12) {
        goto LABEL_8;
      }
      uint64_t v13 = [*((id *)v16 + 8) copy];
      id v14 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v13;

      uint64_t v8 = -[PKMathRecognitionItem mathResult]((uint64_t)v16);
      uint64_t v9 = [v8 selectedTranscriptionPathIndex];
      long long v15 = -[PKMathRecognitionItem mathResult](a1);
      [v15 setSelectedTranscriptionPathIndex:v9];
    }
    uint64_t v3 = v16;
  }
LABEL_8:
}

- (id)_findHeroStroke
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 uuid];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v3 = objc_msgSend(v1, "triggerStrokes", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = [v8 _strokeUUID];
          char v10 = [v9 isEqual:v2];

          if (v10)
          {
            objc_storeStrong(v1 + 2, v8);
            uint64_t v1 = v8;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    uint64_t v1 = 0;
LABEL_12:
  }

  return v1;
}

- (id)_heroStrokeInDrawing:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[PKMathRecognitionItem heroStroke](a1);
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 _strokeUUID];
      id v7 = [v3 _visibleStrokeForIdentifier:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_updatePreferredTranscriptionChangingToken:(void *)a3 withAlternative:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v32 = a3;
  if (a1)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v5 = -[PKMathRecognitionItem mathResult](a1);
    uint64_t v6 = [v5 transcriptionPaths];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v35;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if ([*(id *)(a1 + 64) containsObject:v13])
          {
            long long v14 = -[PKMathRecognitionItem mathResult](a1);
            long long v15 = objc_msgSend(v14, "transcriptionWithPath:columnRange:", v13, objc_msgSend(v33, "columnIndex"), 1);

            if ([v15 isEqualToString:v32])
            {
              [v31 addObject:v13];
              if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v11 = v9 + i;
              }
            }
          }
        }
        v9 += v8;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

    uint64_t v16 = [v31 copy];
    uint64_t v17 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v16;

    long long v18 = -[PKMathRecognitionItem mathResult](a1);
    uint64_t v19 = [v18 selectedTranscriptionPathIndex];
    uint64_t v20 = [v19 integerValue];

    if (v11 == v20)
    {
      long long v21 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = -[PKMathRecognitionItem mathResult](a1);
        uint64_t v23 = [v22 preferredTranscription];
        *(_DWORD *)buf = 138477827;
        v39 = v23;
        _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Candidate selection didn't lead to change in transcription for expression: %{private}@", buf, 0xCu);
      }
      CGRect v24 = v21;
    }
    else
    {
      CGRect v24 = *(id *)(a1 + 80);
      CGRect v25 = [NSNumber numberWithInteger:v11];
      CGRect v26 = -[PKMathRecognitionItem mathResult](a1);
      [v26 setSelectedTranscriptionPathIndex:v25];

      id v27 = -[PKMathRecognitionItem mathResult](a1);
      uint64_t v28 = [v27 preferredTranscription];
      v29 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v28;

      long long v21 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138478083;
        v39 = v30;
        __int16 v40 = 2113;
        char v41 = v24;
        _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Set preferred transcription: %{private}@, for expression: %{private}@", buf, 0x16u);
      }
    }
  }
}

- (uint64_t)_tagAsRecentlyUpdated
{
  if (result)
  {
    uint64_t v1 = result;
    CGRect result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(v1 + 40) = v2;
  }
  return result;
}

- (void)_setIsGraphable:(void *)a3 graphableVariables:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    *(unsigned char *)(a1 + 48) = a2;
    uint64_t v7 = [v5 copy];
    uint64_t v8 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v7;

    if ([v6 count])
    {
      uint64_t v9 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v6 count];
        uint64_t v11 = [(id)a1 expression];
        v12[0] = 67109635;
        v12[1] = a2;
        __int16 v13 = 2048;
        uint64_t v14 = v10;
        __int16 v15 = 2113;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Setting graphable: %{BOOL}d (%lu), for expression: %{private}@", (uint8_t *)v12, 0x1Cu);
      }
    }
  }
}

- (void)_logRecentlyModifiedAndCreated
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 strokes];
    if (![v2 count])
    {
      id v3 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Recently modified debug: no strokes", (uint8_t *)&v13, 2u);
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    uint64_t v6 = [v2 valueForKeyPath:@"@min.timestamp"];
    [v6 doubleValue];
    double v8 = v7;

    if ([a1 isVerticalExpression]) {
      -[PKMathRecognitionItem strokesForVerticalExpressionLine](a1);
    }
    else {
    uint64_t v9 = -[PKMathRecognitionItem _anyEqualSignStrokes](a1);
    }
    if ([v9 count])
    {
      id v10 = v9;

      uint64_t v2 = v10;
    }
    double v11 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](a1);
    long long v12 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      double v14 = v5 - v8;
      __int16 v15 = 2048;
      double v16 = v5 - v11;
      _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Recently modified debug: Modified diff: %g, created diff: %g", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (double)_remainingDelayForTargetDelay:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return fmax(a2 - (v4 - -[PKMathRecognitionItem mostRecentStrokeTimestamp](a1)), 0.0);
}

- (BOOL)shouldBeSolved
{
  return self->_shouldBeSolved;
}

- (BOOL)isVerticalExpression
{
  return self->_isVerticalExpression;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)sortIndex
{
  return self->_sortIndex;
}

- (BOOL)shouldSolveMathFlagIsSet
{
  return self->_shouldSolveMathFlagIsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeIdentifier, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_allTokens, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_availableTranscriptionPaths, 0);
  objc_storeStrong((id *)&self->_graphableVariables, 0);
  objc_storeStrong((id *)&self->_updatedExpression, 0);
  objc_storeStrong((id *)&self->_scrubbableVariables, 0);
  objc_storeStrong((id *)&self->_heroStroke, 0);

  objc_storeStrong((id *)&self->_strokeGroupItem, 0);
}

@end