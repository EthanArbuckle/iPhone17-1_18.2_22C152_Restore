@interface ConfusionPairAligner
- (ConfusionPairAligner)initWithUttId:(id)a3 recognizedText:(id)a4 correctedText:(id)a5 errorType:(int64_t)a6 editMethod:(int64_t)a7;
- (id)confusionPairs;
@end

@implementation ConfusionPairAligner

- (void).cxx_destruct
{
}

- (id)confusionPairs
{
  return self->_confusionPairs;
}

- (ConfusionPairAligner)initWithUttId:(id)a3 recognizedText:(id)a4 correctedText:(id)a5 errorType:(int64_t)a6 editMethod:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v56.receiver = self;
  v56.super_class = (Class)ConfusionPairAligner;
  v15 = [(ConfusionPairAligner *)&v56 init];
  if (!v15)
  {
LABEL_31:
    v17 = v15;
    goto LABEL_33;
  }
  v16 = (ConfusionPairAligner *)objc_alloc_init((Class)_EAREditDistance);
  v17 = v16;
  if (v16)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = sub_1000097F4;
    v54 = sub_100009804;
    id v55 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = sub_1000097F4;
    v48 = sub_100009804;
    id v49 = 0;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000980C;
    v43[3] = &unk_10003C9C0;
    v43[4] = &v50;
    v43[5] = &v44;
    [(ConfusionPairAligner *)v16 editAlignmentWithRefText:v14 hypText:v13 placeholderSymbol:@"~" caseInsensitive:0 removeWordSense:1 completion:v43];
    v18 = (void *)v51[5];
    if (!v18 || !v45[5] || (id v19 = [v18 count], v19 != objc_msgSend((id)v45[5], "count")))
    {
      _Block_object_dispose(&v44, 8);

      _Block_object_dispose(&v50, 8);
      v17 = 0;
      goto LABEL_33;
    }
    v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    int64_t v39 = a7;
    int64_t v40 = a6;
    confusionPairs = v15->_confusionPairs;
    v15->_confusionPairs = v20;

    uint64_t v22 = (uint64_t)[(id)v45[5] count];
    if (v22 >= 1)
    {
      uint64_t v42 = 0;
      uint64_t v23 = 0;
      while (1)
      {
        uint64_t v24 = v23;
        while (1)
        {
          v25 = objc_msgSend((id)v45[5], "objectAtIndexedSubscript:", v24, v36);
          v26 = [(id)v51[5] objectAtIndexedSubscript:v24];
          unsigned __int8 v27 = [v25 isEqualToString:v26];

          if ((v27 & 1) == 0) {
            break;
          }
          if (++v24 >= v22) {
            goto LABEL_30;
          }
        }
        id v41 = v12;
        v28 = [[ConfusionPair alloc] initWithUttId:v12];
        if (v24 >= v22)
        {
          int v37 = 0;
          uint64_t v23 = v24;
        }
        else
        {
          uint64_t v23 = v24;
          while (1)
          {
            v29 = [(id)v45[5] objectAtIndexedSubscript:v23];
            v30 = [(id)v51[5] objectAtIndexedSubscript:v23];
            if ([v29 isEqualToString:v30]) {
              break;
            }
            [(ConfusionPair *)v28 addRecognizedToken:v29 correctedToken:v30];

            if (++v23 >= v22)
            {
              int v37 = 0;
              uint64_t v23 = v22;
              goto LABEL_19;
            }
          }

          int v37 = 1;
        }
LABEL_19:
        unint64_t v38 = [(ConfusionPair *)v28 placeholderCount];
        v31 = [(ConfusionPair *)v28 recognizedTokens];
        if ([v31 count]) {
          break;
        }
        v32 = [(ConfusionPair *)v28 correctedTokens];
        id v36 = [v32 count];

        if (v36) {
          goto LABEL_22;
        }
LABEL_28:

        id v12 = v41;
        if (v24 < v22)
        {
          v42 += v38;
          if (v23 < v22) {
            continue;
          }
        }
        goto LABEL_30;
      }

LABEL_22:
      if (v24 < 1)
      {
        v34 = &stru_10003D2D8;
        v33 = &stru_10003D2D8;
      }
      else
      {
        v33 = [(id)v45[5] objectAtIndexedSubscript:v24 - 1];
        v34 = &stru_10003D2D8;
      }
      if (v37)
      {
        v34 = [(id)v51[5] objectAtIndexedSubscript:v23];
      }
      -[ConfusionPair setIndex:](v28, "setIndex:", v24 - v42, v36);
      [(ConfusionPair *)v28 setLeftContext:v33];
      [(ConfusionPair *)v28 setRightContext:v34];
      [(ConfusionPair *)v28 setErrorType:v40];
      [(ConfusionPair *)v28 setEditMethod:v39];
      [(NSMutableArray *)v15->_confusionPairs addObject:v28];

      goto LABEL_28;
    }
LABEL_30:
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(&v50, 8);
    goto LABEL_31;
  }
LABEL_33:

  return v17;
}

@end