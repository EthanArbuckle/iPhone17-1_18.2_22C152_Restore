@interface NSAttributedString(NSAttributedString_EmailCore)
+ (id)ec_emailAttributedStringWithString:()NSAttributedString_EmailCore andEmailAddress:;
@end

@implementation NSAttributedString(NSAttributedString_EmailCore)

+ (id)ec_emailAttributedStringWithString:()NSAttributedString_EmailCore andEmailAddress:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v14 = @"ECEmailAddressAttributedStringKey";
    v15[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    if (v5) {
      v9 = v5;
    }
    else {
      v9 = &stru_1F1A635E8;
    }
    v10 = (void *)[v7 initWithString:v9 attributes:v8];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v5) {
      v12 = v5;
    }
    else {
      v12 = &stru_1F1A635E8;
    }
    v10 = (void *)[v11 initWithString:v12];
  }

  return v10;
}

@end