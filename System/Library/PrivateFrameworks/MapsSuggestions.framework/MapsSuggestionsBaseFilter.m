@interface MapsSuggestionsBaseFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsBaseFilter

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)shouldKeepEntry:(id)a3
{
  id v5 = a3;
  BOOL result = [(MapsSuggestionsBaseFilter *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

+ (BOOL)isEnabled
{
  BOOL result = [a1 doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

@end