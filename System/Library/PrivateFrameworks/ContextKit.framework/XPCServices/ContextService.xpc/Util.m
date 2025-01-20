@interface Util
+ (BOOL)linewiseFromFile:(id)a3 dataReadingOptions:(unint64_t)a4 withIterator:(id)a5;
+ (double)elapsedMillisForBlock:(id)a3;
+ (double)elapsedMillisForBlock:(id)a3 enableTiming:(BOOL)a4;
+ (double)elapsedMillisForMachAbsoluteTimeStart:(unint64_t)a3 machAbsoluteTimeEnd:(unint64_t)a4;
+ (double)elapsedMillisSinceMachAbsolute:(unint64_t)a3;
+ (double)elapsedMillisSinceMachAbsolute:(unint64_t)a3 nowTarget:(unint64_t *)a4;
+ (double)elapsedNanosForMachAbsoluteTimeStart:(unint64_t)a3 machAbsoluteTimeEnd:(unint64_t)a4;
+ (double)elapsedNanosSinceMachAbsolute:(unint64_t)a3;
+ (double)elapsedNanosSinceMachAbsolute:(unint64_t)a3 nowTarget:(unint64_t *)a4;
+ (id)buildVersion;
+ (id)languageTagForString:(id)a3;
@end

@implementation Util

+ (double)elapsedNanosForMachAbsoluteTimeStart:(unint64_t)a3 machAbsoluteTimeEnd:(unint64_t)a4
{
  unsigned int v6 = dword_10056314C;
  if (!dword_10056314C)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100563148);
    unsigned int v6 = dword_10056314C;
  }
  return (double)((a4 - a3) * dword_100563148 / v6);
}

+ (double)elapsedNanosSinceMachAbsolute:(unint64_t)a3
{
  uint64_t v5 = mach_absolute_time();
  [a1 elapsedNanosForMachAbsoluteTimeStart:a3 machAbsoluteTimeEnd:v5];
  return result;
}

+ (double)elapsedMillisForMachAbsoluteTimeStart:(unint64_t)a3 machAbsoluteTimeEnd:(unint64_t)a4
{
  [a1 elapsedNanosForMachAbsoluteTimeStart:a3 machAbsoluteTimeEnd:a4];
  return v4 / 1000.0 / 1000.0;
}

+ (double)elapsedMillisSinceMachAbsolute:(unint64_t)a3
{
  uint64_t v5 = mach_absolute_time();
  [a1 elapsedMillisForMachAbsoluteTimeStart:a3 machAbsoluteTimeEnd:v5];
  return result;
}

+ (double)elapsedNanosSinceMachAbsolute:(unint64_t)a3 nowTarget:(unint64_t *)a4
{
  uint64_t v7 = mach_absolute_time();
  [a1 elapsedNanosForMachAbsoluteTimeStart:a3 machAbsoluteTimeEnd:v7];
  *a4 = v7;
  return result;
}

+ (double)elapsedMillisSinceMachAbsolute:(unint64_t)a3 nowTarget:(unint64_t *)a4
{
  uint64_t v7 = mach_absolute_time();
  [a1 elapsedMillisForMachAbsoluteTimeStart:a3 machAbsoluteTimeEnd:v7];
  *a4 = v7;
  return result;
}

+ (double)elapsedMillisForBlock:(id)a3
{
  [a1 elapsedMillisForBlock:a3 enableTiming:1];
  return result;
}

+ (double)elapsedMillisForBlock:(id)a3 enableTiming:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = (void (**)(void))a3;
    uint64_t v6 = mach_absolute_time();
    v5[2](v5);

    uint64_t v7 = mach_absolute_time();
    [a1 elapsedMillisForMachAbsoluteTimeStart:v6 machAbsoluteTimeEnd:v7];
  }
  else
  {
    v9 = (void (*)(void))*((void *)a3 + 2);
    id v10 = a3;
    v9();

    return 0.0;
  }
  return result;
}

+ (id)buildVersion
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  v3 = [v2 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];

  return v3;
}

+ (id)languageTagForString:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    v11 = 0;
    goto LABEL_10;
  }
  v13[0] = NLLanguageEnglish;
  v13[1] = NLLanguageGerman;
  v13[2] = NLLanguageSpanish;
  v13[3] = NLLanguageJapanese;
  v13[4] = NLLanguageKorean;
  v13[5] = NLLanguageFrench;
  v13[6] = NLLanguageSimplifiedChinese;
  v13[7] = NLLanguageTraditionalChinese;
  double v4 = +[NSArray arrayWithObjects:v13 count:8];
  id v5 = objc_alloc_init((Class)NLLanguageRecognizer);
  [v5 setLanguageConstraints:v4];
  [v5 processString:v3];
  uint64_t v6 = [v5 languageHypothesesWithMaximum:1];
  uint64_t v7 = [v6 allValues];
  v8 = [v7 firstObject];

  if (v8 && ([v8 doubleValue], v9 > 0.4))
  {
    id v10 = [v5 dominantLanguage];
  }
  else
  {
    [v5 reset];
    [v5 processString:v3];
    id v10 = [v5 dominantLanguage];
    if (v10 == NLLanguageUndetermined)
    {
      v11 = 0;
      goto LABEL_9;
    }
  }
  id v10 = v10;
  v11 = v10;
LABEL_9:

LABEL_10:
  return v11;
}

+ (BOOL)linewiseFromFile:(id)a3 dataReadingOptions:(unint64_t)a4 withIterator:(id)a5
{
  uint64_t v7 = (void (**)(id, id))a5;
  if (a3)
  {
    v8 = +[NSData dataWithContentsOfFile:a3 options:a4 error:0];
    double v9 = v8;
    BOOL v10 = v8 != 0;
    if (v8)
    {
      id v11 = v8;
      v12 = (char *)[v11 bytes];
      id v13 = [v11 length];
      if (v13)
      {
        unint64_t v14 = (unint64_t)v13;
        unint64_t v15 = 0;
        unint64_t v16 = 0;
        v17 = v12 - 1;
        v18 = NSMutableArray_ptr;
        while (1)
        {
          v19 = &v17[-v16];
          while (1)
          {
            int v20 = v12[v16];
            if (v20 != 10) {
              break;
            }
            ++v16;
            --v19;
            if (v16 >= v14) {
              goto LABEL_25;
            }
          }
          if (v14 <= v15) {
            unint64_t v21 = v15;
          }
          else {
            unint64_t v21 = v14;
          }
          unint64_t v22 = v15;
          while (v21 != v22)
          {
            unint64_t v15 = v22 + 1;
            int v23 = v12[++v22];
            if (v23 == 10) {
              goto LABEL_17;
            }
          }
          unint64_t v15 = v21;
LABEL_17:
          unint64_t v24 = v15 - v16;
          if (v15 == v16 || v20 == 35) {
            goto LABEL_24;
          }
          v27 = v17;
          if (v19[v15] != 13) {
            goto LABEL_22;
          }
          if (v15 - 1 != v16) {
            break;
          }
LABEL_23:
          v17 = v27;
LABEL_24:
          if (v16 >= v14) {
            goto LABEL_25;
          }
        }
        unint64_t v24 = ~v16 + v15;
LABEL_22:
        id v25 = [objc_alloc((Class)v18[17]) initWithBytes:&v12[v16] length:v24 encoding:4];
        v7[2](v7, v25);
        unint64_t v16 = v15 + 1;

        v18 = NSMutableArray_ptr;
        goto LABEL_23;
      }
    }
LABEL_25:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end