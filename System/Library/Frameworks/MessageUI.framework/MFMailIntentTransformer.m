@interface MFMailIntentTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation MFMailIntentTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F73E88]);
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D70]];
  [v4 _setLaunchId:*MEMORY[0x1E4F77E48]];
  if (v5) {
    [v4 setSender:v5];
  }
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D80]];
  [v4 setTo:v6];

  v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D60]];
  [v4 setCc:v7];

  v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D58]];
  [v4 setBcc:v8];

  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D78]];
  [v4 setSubject:v9];

  v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D68]];
  [v4 setBody:v10];

  v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F73D88]];
  [v4 setUserTypedContent:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F73E90]);
  v13 = [v12 stringForObjectValue:v4];
  [v4 setSuggestedInvocationPhrase:v13];

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [v3 sender];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F73D70]];

  v6 = [v3 to];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F73D80]];

  v7 = [v3 cc];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F73D60]];

  v8 = [v3 bcc];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F73D58]];

  v9 = [v3 subject];
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F73D78]];

  v10 = [v3 body];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F73D68]];

  return v4;
}

@end