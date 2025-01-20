@interface CameraSyncInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)duration;
- (NSNumber)type;
- (void)setDuration:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CameraSyncInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"testType" lowerBound:&off_100004428 upperBound:&off_100004440 failed:&v8];
  [(CameraSyncInputs *)self setType:v5];

  v6 = [v4 dk_numberFromRequiredKey:@"duration" lowerBound:&off_100004458 upperBound:&off_100004470 failed:&v8];

  [(CameraSyncInputs *)self setDuration:v6];
  return v8 == 0;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end