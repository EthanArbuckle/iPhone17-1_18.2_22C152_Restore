@interface NSObject(Intents)
- (SEL)_intents_setterForPropertyWithName:()Intents;
- (id)_intents_indexingRepresentation;
- (id)descriptionAtIndent:()Intents;
@end

@implementation NSObject(Intents)

- (SEL)_intents_setterForPropertyWithName:()Intents
{
  v3 = (const char *)[a3 cStringUsingEncoding:1];
  v4 = (objc_class *)objc_opt_class();
  Property = class_getProperty(v4, v3);
  v6 = property_copyAttributeValue(Property, "S");
  if (v6)
  {
    v7 = v6;
    v8 = [NSString stringWithCString:v6 encoding:1];
    free(v7);
  }
  else
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (char)__toupper(*v3));
    v10 = [NSString stringWithCString:v3 + 1 encoding:1];
    v8 = [NSString stringWithFormat:@"set%@%@:", v9, v10];
  }
  SEL v11 = NSSelectorFromString(v8);
  if (objc_opt_respondsToSelector()) {
    SEL v12 = v11;
  }
  else {
    SEL v12 = 0;
  }

  return v12;
}

- (id)_intents_indexingRepresentation
{
  SEL v2 = NSSelectorFromString((NSString *)@"_dictionaryRepresentation");
  if (objc_opt_respondsToSelector())
  {
    v3 = ((void (*)(void *, SEL))[a1 methodForSelector:v2])(a1, v2);
    objc_msgSend(v3, "_intents_indexingRepresentation");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

- (id)descriptionAtIndent:()Intents
{
  for (i = [MEMORY[0x1E4F28E78] stringWithString:@"\n"];
    [i appendString:@"    "];
  v6 = [a1 description];
  v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:i];

  return v7;
}

@end