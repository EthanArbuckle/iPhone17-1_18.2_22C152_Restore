@interface _HKCDADocumentSampleComparisonFilter(HealthDaemon)
- (__CFString)propertyForKeyPath;
@end

@implementation _HKCDADocumentSampleComparisonFilter(HealthDaemon)

- (__CFString)propertyForKeyPath
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A330]];

  if (v5)
  {
    v6 = _HDCDASamplePropertyAuthorName;
LABEL_9:
    v13 = *v6;
    goto LABEL_10;
  }
  v7 = [a1 keyPath];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F2A338]];

  if (v8)
  {
    v6 = _HDCDASamplePropertyCustodianName;
    goto LABEL_9;
  }
  v9 = [a1 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A340]];

  if (v10)
  {
    v6 = _HDCDASamplePropertyPatientName;
    goto LABEL_9;
  }
  v11 = [a1 keyPath];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A348]];

  if (v12)
  {
    v6 = _HDCDASamplePropertyTitle;
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2 object:a1 file:@"_HKCDADocumentSampleComparisonFilter+HealthDaemon.m" lineNumber:37 description:@"Unreachable code has been executed"];

  v13 = &stru_1F1728D60;
LABEL_10:

  return v13;
}

@end