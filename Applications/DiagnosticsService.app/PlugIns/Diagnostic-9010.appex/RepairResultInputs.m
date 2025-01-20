@interface RepairResultInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSNumber)testIdentifer;
- (NSNumber)testStatusCode;
@end

@implementation RepairResultInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v14 = 0;
  id v4 = a3;
  v5 = [v4 NSNumberFromKey:@"testStatusCode" lowerBound:&off_1000086E0 upperBound:&off_1000086F8 defaultValue:0 failed:&v14];
  testStatusCode = self->testStatusCode;
  self->testStatusCode = v5;

  v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->testStatusCode;
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "testStatusCode : %@", buf, 0xCu);
  }

  v9 = [v4 NSNumberFromKey:@"testIdentifer" lowerBound:&off_1000086E0 upperBound:&off_1000086F8 defaultValue:0 failed:&v14];

  testIdentifer = self->testIdentifer;
  self->testIdentifer = v9;

  v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->testIdentifer;
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "testIdentifer: %@", buf, 0xCu);
  }

  return v14 == 0;
}

- (NSNumber)testStatusCode
{
  return self->testStatusCode;
}

- (NSNumber)testIdentifer
{
  return self->testIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->testIdentifer, 0);

  objc_storeStrong((id *)&self->testStatusCode, 0);
}

@end