@interface DAAudioCalculation
+ (id)calculateCrossCorrelation:(id)a3 error:(id *)a4;
@end

@implementation DAAudioCalculation

+ (id)calculateCrossCorrelation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 fileTimeInFrames];
  int v7 = (int)(float)(v6 - (float)(unint64_t)[v5 maximumDelay]);
  v8 = [v5 maximumDelay];
  vDSP_Length v9 = v8 - (unsigned char *)[v5 minimumDelay];
  v10 = (const float *)[v5 sourceSignal];
  v11 = (char *)[v5 receivedSignal];
  id v12 = [v5 minimumDelay];

  v13 = (const float *)&v11[4 * (void)v12];
  v14 = malloc_type_malloc(4 * (int)v9, 0x5A72F44FuLL);
  bzero(v14, 4 * (int)v9);
  vDSP_conv(v13, 1, v10, 1, (float *)v14, 1, v9, v7);
  float __C = 0.0;
  vDSP_Length v17 = 0;
  vDSP_maxvi((const float *)v14, 1, &__C, &v17, v9);
  free(v14);
  v15 = 0;
  if (COERCE_UNSIGNED_INT(fabs(log10f(__C) * 10.0)) <= 0x7F7FFFFF)
  {
    v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  }
  if (a4 && !v15)
  {
    *a4 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-62 userInfo:0];
  }

  return v15;
}

@end