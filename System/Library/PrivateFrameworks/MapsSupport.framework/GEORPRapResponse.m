@interface GEORPRapResponse
+ (id)RapStateIconAsString:(int)a3;
@end

@implementation GEORPRapResponse

+ (id)RapStateIconAsString:(int)a3
{
  if (a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100038D40[a3];
  }

  return v3;
}

@end