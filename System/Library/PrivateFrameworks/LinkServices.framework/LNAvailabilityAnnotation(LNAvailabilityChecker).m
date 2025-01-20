@interface LNAvailabilityAnnotation(LNAvailabilityChecker)
- (__CFString)_availabilityResultWithSystemVersion:()LNAvailabilityChecker;
- (__CFString)_availabilityResultWithoutSystemVersion;
@end

@implementation LNAvailabilityAnnotation(LNAvailabilityChecker)

- (__CFString)_availabilityResultWithSystemVersion:()LNAvailabilityChecker
{
  id v4 = a3;
  uint64_t v5 = [a1 obsoletedVersion];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [a1 obsoletedVersion];
    if ([v7 isEqualToString:*MEMORY[0x1E4F72550]])
    {

LABEL_5:
      v11 = @"LNAvailabilityResultUnavailable";
      goto LABEL_16;
    }
    v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v9 = [a1 obsoletedVersion];
    char v10 = [v8 isVersion:v4 greaterThanOrEqualToVersion:v9];

    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = [a1 deprecatedVersion];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [a1 deprecatedVersion];
    if ([v14 isEqualToString:*MEMORY[0x1E4F72550]])
    {

LABEL_10:
      v11 = @"LNAvailabilityResultDeprecated";
      goto LABEL_16;
    }
    v15 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v16 = [a1 deprecatedVersion];
    char v17 = [v15 isVersion:v4 greaterThanOrEqualToVersion:v16];

    if (v17) {
      goto LABEL_10;
    }
  }
  v18 = [a1 introducedVersion];

  v11 = @"LNAvailabilityResultAvailable";
  if (v18)
  {
    v19 = [a1 introducedVersion];
    if ([v19 isEqualToString:*MEMORY[0x1E4F72550]])
    {
    }
    else
    {
      v20 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v21 = [a1 introducedVersion];
      int v22 = [v20 isVersion:v4 greaterThanOrEqualToVersion:v21];

      if (!v22) {
        v11 = @"LNAvailabilityResultUnavailable";
      }
    }
  }
LABEL_16:

  return v11;
}

- (__CFString)_availabilityResultWithoutSystemVersion
{
  id v4 = [a1 obsoletedVersion];

  if (v4) {
    return @"LNAvailabilityResultUnavailable";
  }
  v6 = [a1 deprecatedVersion];

  if (v6) {
    return @"LNAvailabilityResultDeprecated";
  }
  v7 = [a1 introducedVersion];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"LNAvailabilityChecker.m", 71, @"invalid availability annotation: %@", a1 object file lineNumber description];
  }
  return @"LNAvailabilityResultAvailable";
}

@end