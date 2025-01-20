@interface NSDictionary
@end

@implementation NSDictionary

void __56__NSDictionary_Intents___intents_indexingRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(a3, "_intents_indexingRepresentation");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v5];
}

void __45__NSDictionary_Intents__descriptionAtIndent___block_invoke(void *a1, void *a2, void *a3)
{
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6] + 1;
  id v7 = a2;
  id v8 = [a3 descriptionAtIndent:v6];
  [v4 appendFormat:@"%@    %@ = %@;", v5, v7, v8];
}

@end