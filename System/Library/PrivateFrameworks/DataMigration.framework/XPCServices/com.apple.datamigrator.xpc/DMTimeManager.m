@interface DMTimeManager
+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4;
+ (double)intervalSinceTimestamp:(unint64_t)a3;
@end

@implementation DMTimeManager

+ (double)intervalFromStart:(unint64_t)a3 toEnd:(unint64_t)a4
{
  if (qword_100030C48 != -1) {
    dispatch_once(&qword_100030C48, &stru_100024B20);
  }
  *(double *)&unint64_t v7 = (double)a3;
  LODWORD(v7) = dword_100030C40;
  LODWORD(v4) = *(_DWORD *)algn_100030C44;
  return ((double)a4 - (double)a3) * (double)v7 / (double)v4 / 1000000000.0;
}

+ (double)intervalSinceTimestamp:(unint64_t)a3
{
  id v5 = [a1 currentTimestamp];

  [a1 intervalFromStart:a3 toEnd:v5];
  return result;
}

@end