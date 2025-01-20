@interface _HKDiagnosticTestResultComparisonFilter(HealthDaemon)
- (__CFString)propertyForKeyPath;
@end

@implementation _HKDiagnosticTestResultComparisonFilter(HealthDaemon)

- (__CFString)propertyForKeyPath
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F29A38]];

  if (v5)
  {
    v6 = HDDiagnosticTestResultEntityPropertyCategory;
LABEL_5:
    v9 = *v6;
    goto LABEL_7;
  }
  v7 = [a1 keyPath];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F29A68]];

  if (v8)
  {
    v6 = HDDiagnosticTestResultEntityPropertyReferenceRangeStatus;
    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:a1 file:@"_HKDiagnosticTestResultComparisonFilter+HealthDaemon.m" lineNumber:32 description:@"Unreachable code has been executed"];

  v9 = &stru_1F1728D60;
LABEL_7:

  return v9;
}

@end