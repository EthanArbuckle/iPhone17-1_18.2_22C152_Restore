@interface SRSpeechExpression
- (id)sr_dictionaryRepresentation;
@end

@implementation SRSpeechExpression

- (id)sr_dictionaryRepresentation
{
  if (self) {
    [(SRSpeechExpression *)self timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CFStringRef v3 = CMTimeRangeCopyDescription(kCFAllocatorDefault, &range);
  v17[0] = @"version";
  v18[0] = [(SRSpeechExpression *)self version];
  v18[1] = v3;
  v17[1] = @"timeRange";
  v17[2] = @"confidence";
  [(SRSpeechExpression *)self confidence];
  if (fabs(v4) == INFINITY) {
    CFStringRef v5 = @"INF";
  }
  else {
    CFStringRef v5 = +[NSString stringWithFormat:@"%f", *(void *)&v4];
  }
  v18[2] = v5;
  v17[3] = @"mood";
  [(SRSpeechExpression *)self mood];
  if (fabs(v6) == INFINITY) {
    CFStringRef v7 = @"INF";
  }
  else {
    CFStringRef v7 = +[NSString stringWithFormat:@"%f", *(void *)&v6];
  }
  v18[3] = v7;
  v17[4] = @"valence";
  [(SRSpeechExpression *)self valence];
  if (fabs(v8) == INFINITY) {
    CFStringRef v9 = @"INF";
  }
  else {
    CFStringRef v9 = +[NSString stringWithFormat:@"%f", *(void *)&v8];
  }
  v18[4] = v9;
  v17[5] = @"activation";
  [(SRSpeechExpression *)self activation];
  if (fabs(v10) == INFINITY) {
    CFStringRef v11 = @"INF";
  }
  else {
    CFStringRef v11 = +[NSString stringWithFormat:@"%f", *(void *)&v10];
  }
  v18[5] = v11;
  v17[6] = @"dominance";
  [(SRSpeechExpression *)self dominance];
  if (fabs(v12) == INFINITY) {
    CFStringRef v13 = @"INF";
  }
  else {
    CFStringRef v13 = +[NSString stringWithFormat:@"%f", *(void *)&v12];
  }
  v18[6] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];
  CFRelease(v3);
  return v14;
}

@end