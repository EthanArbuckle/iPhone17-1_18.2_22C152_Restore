@interface WFURLDetector
+ (BOOL)stringContainsURLs:(id)a3;
+ (BOOL)stringMatchesExactly:(id)a3;
+ (id)URLsInString:(id)a3 error:(id *)a4;
@end

@implementation WFURLDetector

+ (BOOL)stringMatchesExactly:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263F08770] dataDetectorWithTypes:32 error:0];
    v5 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    BOOL v7 = ![v5 range] && v6 == objc_msgSend(v3, "length");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)stringContainsURLs:(id)a3
{
  return +[WFDataDetector hasResultForString:a3 ofTypes:32];
}

+ (id)URLsInString:(id)a3 error:(id *)a4
{
  v4 = +[WFDataDetector resultsForString:a3 ofTypes:32 error:a4];
  v5 = [v4 URLs];

  return v5;
}

@end