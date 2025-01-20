@interface CFICULoggingEnabled
@end

@implementation CFICULoggingEnabled

const char *_____CFICULoggingEnabled_block_invoke()
{
  result = (const char *)__CFProcessIsRestricted();
  if (!result)
  {
    result = getenv("CFICULogging");
    if (result)
    {
      v1 = result;
      if (!strncasecmp(result, "-", 1uLL)) {
        v2 = *(FILE **)off_1ECE0A5C0;
      }
      else {
        v2 = fopen(v1, "w");
      }
      ___CFICULoggingFD = (uint64_t)v2;
      v3 = *(FILE **)off_1ECE0A5B8;
      if (v2)
      {
        if (v2 == *(FILE **)off_1ECE0A5C0) {
          v4 = "stdout";
        }
        else {
          v4 = v1;
        }
        fprintf(v3, "CFICULogging: Logging to %s.\n", v4);
        ___CFICULoggingEnabled_loggingEnabled = 1;
        v5 = getenv("CFICULogging");
        ___CFICULogWithArguments(0, @"// cc %s -o test_program -licucore", v5);
        ___CFICULogWithArguments(0, &stru_1ECE10768);
        ___CFICULogWithArguments(0, @"#include <stdio.h>");
        ___CFICULogWithArguments(0, @"#include <math.h>");
        ___CFICULogWithArguments(0, @"#include <float.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ustring.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ucal.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/udatpg.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/udat.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/unum.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ucurr.h>");
        ___CFICULogWithArguments(0, @"#include <unicode/ustdio.h>");
        ___CFICULogWithArguments(0, &stru_1ECE10768);
        ___CFICULogWithArguments(0, &stru_1ECE10768);
        ___CFICULogWithArguments(0, @"int main(int argc, char *argv[]) {");
        ___CFICULogWithArguments(1, @"int TEMP_BUFFER_SIZE = 500;");
        ___CFICULogWithArguments(1, &stru_1ECE10768);
        return (const char *)atexit(___CFICUEmitPostamble);
      }
      else
      {
        return (const char *)fprintf(v3, "CFICULogging: error: Failed to open %s.\n", v1);
      }
    }
  }
  return result;
}

@end