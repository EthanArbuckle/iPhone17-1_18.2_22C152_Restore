@interface NSError(DictionaryRepresentation)
- (id)dictionaryRepresentation;
@end

@implementation NSError(DictionaryRepresentation)

- (id)dictionaryRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 localizedDescription];
  [v2 setObject:v3 forKeyedSubscript:@"message"];

  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  [v2 setObject:v4 forKeyedSubscript:@"code"];

  v5 = [a1 domain];
  [v2 setObject:v5 forKeyedSubscript:@"domain"];

  v6 = [a1 userInfo];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v7)
  {
    v8 = [v7 dictionaryRepresentation];
    [v2 setObject:v8 forKeyedSubscript:@"underlying-error"];
  }
  v9 = (void *)[v2 copy];

  return v9;
}

@end