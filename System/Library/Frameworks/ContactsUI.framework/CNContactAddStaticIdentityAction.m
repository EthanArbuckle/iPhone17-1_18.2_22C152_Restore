@interface CNContactAddStaticIdentityAction
+ (BOOL)stringIsValidIdentity:(id)a3;
+ (id)supportedPasteboardTypes;
- (NSString)chosenIdentity;
- (void)performActionWithSender:(id)a3;
- (void)setChosenIdentity:(id)a3;
@end

@implementation CNContactAddStaticIdentityAction

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_1_50755 != -1) {
    dispatch_once(&supportedPasteboardTypes_cn_once_token_1_50755, &__block_literal_global_50756);
  }
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1_50757;

  return v2;
}

void __60__CNContactAddStaticIdentityAction_supportedPasteboardTypes__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F226F0];
  v3[0] = *MEMORY[0x1E4F22688];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1_50757;
  supportedPasteboardTypes_cn_once_object_1_50757 = v1;
}

+ (BOOL)stringIsValidIdentity:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setChosenIdentity:(id)a3
{
}

- (NSString)chosenIdentity
{
  return self->_chosenIdentity;
}

- (void)performActionWithSender:(id)a3
{
  id v15 = [(id)objc_opt_class() supportedPasteboardTypes];
  v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  if ([v4 containsPasteboardTypes:v15])
  {
    uint64_t v5 = [v15 count];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [v15 objectAtIndexedSubscript:v7];
        v9 = [v4 valueForPasteboardType:v8];

        if (v9) {
          break;
        }
        if (v6 == ++v7) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      v9 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [[NSString alloc] initWithData:v9 encoding:4];

      v9 = (void *)v10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(id)objc_opt_class() stringIsValidIdentity:v9] & 1) != 0)
    {
      objc_opt_class();
      id v11 = v9;
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      id v13 = v12;

      if (v13)
      {
        [(CNContactAddStaticIdentityAction *)self setChosenIdentity:v13];

        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  [(CNContactAddStaticIdentityAction *)self setChosenIdentity:@" "];
LABEL_18:
  v14 = [(CNContactAction *)self delegate];
  [v14 actionDidFinish:self];
}

@end