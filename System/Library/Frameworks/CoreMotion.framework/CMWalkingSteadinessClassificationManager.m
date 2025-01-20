@interface CMWalkingSteadinessClassificationManager
+ (BOOL)classificationForScore:(double)a3 classification:(int64_t *)a4;
+ (BOOL)isWalkingSteadinessAvailable;
+ (double)maximumScoreForClassification:(int64_t)a3;
+ (double)minimumScoreForClassification:(int64_t)a3;
+ (id)classificationDataFromStruct:(CLWalkingSteadinessClassificationData *)a3;
+ (int)mapClassificationTypeFromFrameworkToClassifier:(int64_t)a3;
@end

@implementation CMWalkingSteadinessClassificationManager

+ (id)classificationDataFromStruct:(CLWalkingSteadinessClassificationData *)a3
{
  double var0 = a3->var0;
  double var1 = a3->var1;
  int var3 = a3->var3;
  uint64_t v6 = 1;
  if (var3 == 2) {
    uint64_t v6 = 2;
  }
  if (var3 == 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = [CMWalkingSteadinessClassificationData alloc];
  v10 = objc_msgSend_initWithLowerBound_upperBound_classificationType_(v8, v9, v7, var0, var1);

  return v10;
}

+ (double)minimumScoreForClassification:(int64_t)a3
{
  LODWORD(v4) = objc_msgSend_mapClassificationTypeFromFrameworkToClassifier_(CMWalkingSteadinessClassificationManager, a2, a3)- 1;
  if (v4 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v4;
  }
  v5 = &qword_19060B2B8[4 * v4];
  long long v6 = *((_OWORD *)v5 + 1);
  v11[0] = *(_OWORD *)v5;
  v11[1] = v6;
  uint64_t v7 = objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, v3, (uint64_t)v11);
  objc_msgSend_lowerBound(v7, v8, v9);
  return result;
}

+ (double)maximumScoreForClassification:(int64_t)a3
{
  LODWORD(v4) = objc_msgSend_mapClassificationTypeFromFrameworkToClassifier_(CMWalkingSteadinessClassificationManager, a2, a3)- 1;
  if (v4 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v4;
  }
  v5 = &qword_19060B2B8[4 * v4];
  long long v6 = *((_OWORD *)v5 + 1);
  v11[0] = *(_OWORD *)v5;
  v11[1] = v6;
  uint64_t v7 = objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, v3, (uint64_t)v11);
  objc_msgSend_upperBound(v7, v8, v9);
  return result;
}

+ (int)mapClassificationTypeFromFrameworkToClassifier:(int64_t)a3
{
  if (a3 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (a3 == 3) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (BOOL)isWalkingSteadinessAvailable
{
  if (sub_1902BACB4())
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_1902BAD40();
    return ((unint64_t)sub_1902CD6B0() >> 53) & 1;
  }
  return v2;
}

+ (BOOL)classificationForScore:(double)a3 classification:(int64_t *)a4
{
  v5 = qword_19060B2B8;
  while (1)
  {
    uint64_t v6 = *v5;
    if (*(double *)v5 <= a3)
    {
      double v7 = *((double *)v5 + 1);
      if (v7 > a3)
      {
        int v9 = *((_DWORD *)v5 + 6);
        goto LABEL_10;
      }
    }
    if (*((_DWORD *)v5 + 6) == 1)
    {
      double v7 = *((double *)v5 + 1);
      if (vabdd_f64(a3, v7) <= 1.0e-12) {
        break;
      }
    }
    v5 += 4;
    if (v5 == &qword_19060B318) {
      return 0;
    }
  }
  int v9 = 1;
LABEL_10:
  v13[0] = v6;
  *(double *)&v13[1] = v7;
  int v14 = v9;
  v10 = objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, a2, (uint64_t)v13);
  *a4 = objc_msgSend_classificationType(v10, v11, v12);
  return 1;
}

@end