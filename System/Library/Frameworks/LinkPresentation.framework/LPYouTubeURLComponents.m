@interface LPYouTubeURLComponents
+ (BOOL)parseYouTubeTimeFormat:(id)a3 outTime:(double *)a4;
+ (id)formatAsYouTubeTime:(double)a3;
- (NSString)videoID;
- (double)startTime;
- (void)setStartTime:(double)a3;
- (void)setVideoID:(id)a3;
@end

@implementation LPYouTubeURLComponents

+ (BOOL)parseYouTubeTimeFormat:(id)a3 outTime:(double *)a4
{
  id v5 = a3;
  *a4 = 0.0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v5];
  unint64_t v9 = 0;
  if (([v6 scanUnsignedLongLong:&v9] & 1) == 0) {
    goto LABEL_10;
  }
  if (![v6 scanString:@"h" intoString:0])
  {
LABEL_5:
    if (![v6 scanString:@"m" intoString:0]) {
      goto LABEL_9;
    }
    *a4 = *a4 + (double)(60 * v9);
    if ([v6 isAtEnd]) {
      goto LABEL_7;
    }
    if ([v6 scanUnsignedLongLong:&v9])
    {
LABEL_9:
      [v6 scanString:@"s" intoString:0];
      *a4 = *a4 + (double)v9;
      char v7 = [v6 isAtEnd];
      goto LABEL_11;
    }
LABEL_10:
    char v7 = 0;
    goto LABEL_11;
  }
  *a4 = *a4 + (double)(3600 * v9);
  if (([v6 isAtEnd] & 1) == 0)
  {
    if (![v6 scanUnsignedLongLong:&v9]) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
LABEL_7:
  char v7 = 1;
LABEL_11:

  return v7;
}

+ (id)formatAsYouTubeTime:(double)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ds", a3);
}

- (NSString)videoID
{
  return self->_videoID;
}

- (void)setVideoID:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
}

@end