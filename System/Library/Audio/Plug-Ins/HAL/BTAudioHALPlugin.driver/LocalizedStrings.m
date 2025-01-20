@interface LocalizedStrings
- (LocalizedStrings)init;
- (NSString)spatialFormat;
- (void)dealloc;
@end

@implementation LocalizedStrings

- (LocalizedStrings)init
{
  v4.receiver = self;
  v4.super_class = (Class)LocalizedStrings;
  v2 = [(LocalizedStrings *)&v4 init];
  if (v2) {
    v2->_spatialFormat = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"SPATIAL_AUDIO" value:&stru_90900 table:@"SpatialAudio"];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)LocalizedStrings;
  [(LocalizedStrings *)&v2 dealloc];
}

- (NSString)spatialFormat
{
  return self->_spatialFormat;
}

@end