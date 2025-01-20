@interface SFTranscriptionSegment
- (id)sr_dictionaryRepresentation;
@end

@implementation SFTranscriptionSegment

- (id)sr_dictionaryRepresentation
{
  v16[0] = @"timestamp";
  [(SFTranscriptionSegment *)self timestamp];
  double v4 = v3;
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (fabs(v4) == INFINITY) {
    CFStringRef v6 = @"inf";
  }
  else {
    CFStringRef v6 = (const __CFString *)v5;
  }
  v17[0] = v6;
  v16[1] = @"duration";
  [(SFTranscriptionSegment *)self duration];
  double v8 = v7;
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if (fabs(v8) == INFINITY) {
    CFStringRef v10 = @"inf";
  }
  else {
    CFStringRef v10 = (const __CFString *)v9;
  }
  v17[1] = v10;
  v16[2] = @"confidence";
  [(SFTranscriptionSegment *)self confidence];
  double v12 = v11;
  v13 = +[NSNumber numberWithDouble:v11];
  if (fabs(v12) == INFINITY) {
    CFStringRef v14 = @"inf";
  }
  else {
    CFStringRef v14 = (const __CFString *)v13;
  }
  v17[2] = v14;
  return +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
}

@end