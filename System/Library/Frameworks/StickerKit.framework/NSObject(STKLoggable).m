@interface NSObject(STKLoggable)
+ (id)stk_loggingDescriptionFromLoggable:()STKLoggable isPretty:;
- (id)stk_loggingDescription;
- (id)stk_prettyLoggingDescription;
- (uint64_t)stk_loggingIdentifier;
@end

@implementation NSObject(STKLoggable)

- (id)stk_loggingDescription
{
  if ([a1 conformsToProtocol:&unk_26FA63BF8]) {
    objc_msgSend((id)objc_opt_class(), "stk_loggingDescriptionFromLoggable:isPretty:", a1, 0);
  }
  else {
  v2 = [a1 description];
  }

  return v2;
}

- (id)stk_prettyLoggingDescription
{
  if ([a1 conformsToProtocol:&unk_26FA63BF8]) {
    objc_msgSend((id)objc_opt_class(), "stk_loggingDescriptionFromLoggable:isPretty:", a1, 1);
  }
  else {
  v2 = [a1 description];
  }

  return v2;
}

- (uint64_t)stk_loggingIdentifier
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
}

+ (id)stk_loggingDescriptionFromLoggable:()STKLoggable isPretty:
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F089D8];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@ ", v8];

  v10 = objc_msgSend(v5, "stk_loggingIdentifier");
  if (!v10)
  {
    objc_msgSend(v9, "appendFormat:", @"%p", v5);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v11 = @" %@=%@";
    goto LABEL_6;
  }
  [v9 appendString:v10];
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  [v9 appendString:@"\n"];
  v11 = @"\t%@ = %@\n";
LABEL_6:
  v12 = objc_msgSend(v5, "stk_loggingValues");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__NSObject_STKLoggable__stk_loggingDescriptionFromLoggable_isPretty___block_invoke;
  v17[3] = &unk_2651CC990;
  char v20 = a4;
  id v13 = v9;
  id v18 = v13;
  v19 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];
  [v13 appendString:@">"];
  v14 = v19;
  id v15 = v13;

  return v15;
}

@end