@interface CRKTableKeyValuePair
+ (id)pairWithKey:(id)a3 value:(id)a4;
@end

@implementation CRKTableKeyValuePair

+ (id)pairWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(CRKKeyValuePair *)[CRKTableKeyValuePair alloc] initWithKey:v6 value:v5];

  return v7;
}

@end