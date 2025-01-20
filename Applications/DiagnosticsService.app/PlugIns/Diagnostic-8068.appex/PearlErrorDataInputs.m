@interface PearlErrorDataInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)frameCount;
- (NSNumber)testType;
- (NSNumber)timeout;
- (void)setFrameCount:(id)a3;
- (void)setTestType:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation PearlErrorDataInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"testType" lowerBound:&off_1000043C8 upperBound:&off_1000043E0 failed:&v9];
  [(PearlErrorDataInputs *)self setTestType:v5];

  v6 = [v4 dk_numberFromKey:@"frameCount" lowerBound:&off_1000043F8 upperBound:&off_100004410 defaultValue:&off_100004428 failed:&v9];
  [(PearlErrorDataInputs *)self setFrameCount:v6];

  v7 = [v4 dk_numberFromKey:@"timeout" lowerBound:&off_1000044D0 upperBound:&off_1000044E0 defaultValue:&off_1000044F0 failed:&v9];

  [(PearlErrorDataInputs *)self setTimeout:v7];
  return v9 == 0;
}

- (NSNumber)testType
{
  return self->_testType;
}

- (void)setTestType:(id)a3
{
}

- (NSNumber)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_frameCount, 0);

  objc_storeStrong((id *)&self->_testType, 0);
}

@end