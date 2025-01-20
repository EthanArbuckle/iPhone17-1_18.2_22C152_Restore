@interface _DPJSONOutputHelper
+ (id)submissionContentForSegments:(id)a3;
+ (unint64_t)currentVersion;
@end

@implementation _DPJSONOutputHelper

+ (id)submissionContentForSegments:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E019F810]();
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"{\n\"version\": %lu,\n\"segments\": [\n", 21);
  v6 = (void *)[&stru_1F3681BE0 mutableCopy];
  if ([v3 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x1E019F810]();
      v9 = [v3 objectAtIndexedSubscript:v7];
      v10 = [v9 jsonSegmentString];
      [v6 appendString:v10];

      if (v7 >= [v3 count] - 1) {
        v11 = @"\n";
      }
      else {
        v11 = @",\n";
      }
      [v6 appendString:v11];

      ++v7;
    }
    while (v7 < [v3 count]);
  }
  v12 = [NSString stringWithFormat:@"%@%@%@", v5, v6, @"]\n}\n"];

  return v12;
}

+ (unint64_t)currentVersion
{
  return 21;
}

@end