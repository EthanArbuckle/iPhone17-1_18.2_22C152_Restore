@interface _NSNegateBooleanTransformer
+ (Class)transformedValueClass;
- (BOOL)_isBooleanTransformer;
- (id)description;
- (id)transformedValue:(id)a3;
@end

@implementation _NSNegateBooleanTransformer

+ (Class)transformedValueClass
{
  return (Class)self;
}

- (id)transformedValue:(id)a3
{
  uint64_t v3 = [a3 BOOLValue] ^ 1;

  return +[NSNumber numberWithBool:v3];
}

- (id)description
{
  return @"<shared NSNegateBoolean transformer>";
}

- (BOOL)_isBooleanTransformer
{
  return 1;
}

@end