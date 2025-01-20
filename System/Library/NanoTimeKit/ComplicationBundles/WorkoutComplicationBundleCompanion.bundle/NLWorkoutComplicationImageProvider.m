@interface NLWorkoutComplicationImageProvider
+ (id)noWorkoutImageForComplicationFamily:(int64_t)a3;
- (BOOL)isPaused;
- (NLWorkoutComplicationImageProvider)initWithPaused:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation NLWorkoutComplicationImageProvider

- (NLWorkoutComplicationImageProvider)initWithPaused:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NLWorkoutComplicationImageProvider;
  result = (NLWorkoutComplicationImageProvider *)[(NLWorkoutComplicationImageProvider *)&v5 initPrivate];
  if (result) {
    result->_paused = a3;
  }
  return result;
}

+ (id)noWorkoutImageForComplicationFamily:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)a3 <= 0xC) {
    double v3 = dbl_BB98[a3];
  }
  if (CLKComplicationFamilyCircularMedium == a3) {
    double v3 = 22.0;
  }
  v4 = +[UIFont systemFontOfSize:v3];
  objc_super v5 = +[UIImageSymbolConfiguration configurationWithFont:v4];
  v6 = +[UIImage _systemImageNamed:@"figure.run" withConfiguration:v5];
  v7 = [v6 imageWithRenderingMode:0];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NLWorkoutComplicationImageProvider;
  id v4 = [(NLWorkoutComplicationImageProvider *)&v6 copyWithZone:a3];
  [v4 setPaused:self->_paused];
  return v4;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

@end