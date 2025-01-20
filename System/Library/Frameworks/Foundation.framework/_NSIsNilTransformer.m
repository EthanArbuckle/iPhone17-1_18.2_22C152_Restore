@interface _NSIsNilTransformer
+ (BOOL)supportsReverseTransformation;
- (id)description;
- (id)transformedValue:(id)a3;
@end

@implementation _NSIsNilTransformer

+ (BOOL)supportsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  return +[NSNumber numberWithBool:a3 == 0];
}

- (id)description
{
  return @"<shared NSIsNil transformer>";
}

@end