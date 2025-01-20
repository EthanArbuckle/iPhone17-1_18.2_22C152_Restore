@interface SRElectrocardiogramData
- (id)sr_dictionaryRepresentation;
@end

@implementation SRElectrocardiogramData

- (id)sr_dictionaryRepresentation
{
  v4[0] = @"flags";
  v4[1] = @"value";
  v5[0] = +[NSNumber numberWithUnsignedInteger:[(SRElectrocardiogramData *)self flags]];
  objc_msgSend(-[SRElectrocardiogramData value](self, "value"), "doubleValue");
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
}

@end