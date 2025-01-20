@interface SGTextMessageBirthdayCongratsModel
+ (id)newTransformerInstanceForLanguage:(id)a3;
@end

@implementation SGTextMessageBirthdayCongratsModel

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F93840] descriptorForName:@"SGTextMessageBirthdayCongratsModel" version:@"CG=3&NG=1&FV=1.1" locale:a3];
  v4 = (void *)MEMORY[0x1E4F5DFC0];
  v5 = [MEMORY[0x1E4F5DFD8] withMethods:&unk_1F2536B60];
  LOBYTE(v12) = 0;
  LOBYTE(v11) = 0;
  v6 = objc_msgSend(MEMORY[0x1E4F93808], "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:", 10000, 1, 3, 1, 1, 1, v11, 0, v12, v5);
  v13[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v8 = [v4 withTransformers:v7];

  v9 = [[SGTransformerInstance alloc] initWithTransformer:v8 sessionDescriptor:v3 modelClass:objc_opt_class()];
  return v9;
}

@end