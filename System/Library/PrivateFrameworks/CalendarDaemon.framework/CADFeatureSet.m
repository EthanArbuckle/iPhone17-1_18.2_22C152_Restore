@interface CADFeatureSet
+ (BOOL)isSuggestionsEnabled;
@end

@implementation CADFeatureSet

+ (BOOL)isSuggestionsEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

@end