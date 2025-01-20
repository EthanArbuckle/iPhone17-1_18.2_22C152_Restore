@interface CalSubscribedCalendarAccountUtils
+ (id)hostStringFromURL:(id)a3;
+ (id)hostStringFromURLString:(id)a3;
@end

@implementation CalSubscribedCalendarAccountUtils

+ (id)hostStringFromURL:(id)a3
{
  if (a3)
  {
    v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    uint64_t v4 = [v3 rangeOfHost];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      uint64_t v6 = v4;
      v7 = [v3 string];
      v5 = [v7 substringFromIndex:v6];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)hostStringFromURLString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    if (v5)
    {
      id v6 = [a1 hostStringFromURL:v5];
    }
    else
    {
      id v6 = v4;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end