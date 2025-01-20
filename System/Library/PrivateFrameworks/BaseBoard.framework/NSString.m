@interface NSString
+ (id)bsobjc_typeQualifiers;
- (id)bsobjc_structName;
@end

@implementation NSString

+ (id)bsobjc_typeQualifiers
{
  self;
  if (qword_1EB21B110 != -1) {
    dispatch_once(&qword_1EB21B110, &__block_literal_global_11);
  }
  v0 = (void *)_MergedGlobals_13;
  return v0;
}

void __50__NSString_BSObjCInterface__bsobjc_typeQualifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"rnNoORV"];
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;
}

- (id)bsobjc_structName
{
  id v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28FE8] scannerWithString:a1];
    if (([v1 hasPrefix:@"{"] & 1) == 0
      && ![v2 scanUpToString:@"{" intoString:0])
    {
      id v1 = 0;
      goto LABEL_10;
    }
    [v2 scanString:@"{" intoString:0];
    id v10 = 0;
    int v3 = [v2 scanUpToString:@"=" intoString:&v10];
    id v4 = v10;
    v5 = v4;
    if (v3)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      id v9 = v4;
      int v7 = [v2 scanUpToString:@"}" intoString:&v9];
      id v1 = v9;

      if (!v7)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v6 = [v1 copy];
      v5 = v1;
    }
    id v1 = (id)v6;

    goto LABEL_10;
  }
LABEL_11:
  return v1;
}

@end