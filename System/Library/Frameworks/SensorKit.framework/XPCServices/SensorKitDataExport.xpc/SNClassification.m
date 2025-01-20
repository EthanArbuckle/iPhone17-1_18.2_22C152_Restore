@interface SNClassification
- (id)sr_dictionaryRepresentation;
@end

@implementation SNClassification

- (id)sr_dictionaryRepresentation
{
  v6[0] = @"identifier";
  v6[1] = @"confidence";
  v7[0] = [(SNClassification *)self identifier];
  [(SNClassification *)self confidence];
  if (fabs(v3) == INFINITY) {
    CFStringRef v4 = @"INF";
  }
  else {
    CFStringRef v4 = +[NSString stringWithFormat:@"%f", *(void *)&v3];
  }
  v7[1] = v4;
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
}

@end