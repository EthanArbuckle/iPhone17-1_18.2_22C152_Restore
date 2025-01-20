@interface IKColumnItemLockupElement
- (BOOL)hasSeparator;
- (BOOL)isWatchlisted;
- (BOOL)onlyVisibleOnColumnHighlight;
- (IKButtonElement)button;
- (IKImageElement)image;
- (IKOrdinalElement)ordinal;
- (IKTextBadgeAttachment)subtitleBadge;
- (IKTextBadgeAttachment)titleBadge;
- (IKTextElement)descriptionText;
- (IKTextElement)secondarySubtitle;
- (IKTextElement)subtitle;
- (IKTextElement)title;
- (IKVideoElement)video;
- (NSArray)images;
- (NSArray)textElements;
- (NSString)columnItemType;
- (void)_computeTitle:(id *)a3 subtitle:(id *)a4 secondarySubtitle:(id *)a5 unstyledTextElements:(id *)a6;
@end

@implementation IKColumnItemLockupElement

- (NSString)columnItemType
{
  v3 = [(IKViewElement *)self attributes];
  v4 = [v3 objectForKey:@"type"];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[v4 copy];
  }
  else
  {
    v7 = [(IKViewElement *)self style];
    v8 = [v7 columnItemType];
    v6 = (void *)[v8 copy];
  }
  return (NSString *)v6;
}

- (IKTextElement)title
{
  id v4 = 0;
  [(IKColumnItemLockupElement *)self _computeTitle:&v4 subtitle:0 secondarySubtitle:0 unstyledTextElements:0];
  id v2 = v4;
  return (IKTextElement *)v2;
}

- (IKTextElement)subtitle
{
  id v4 = 0;
  [(IKColumnItemLockupElement *)self _computeTitle:0 subtitle:&v4 secondarySubtitle:0 unstyledTextElements:0];
  id v2 = v4;
  return (IKTextElement *)v2;
}

- (IKTextElement)secondarySubtitle
{
  id v4 = 0;
  [(IKColumnItemLockupElement *)self _computeTitle:0 subtitle:0 secondarySubtitle:&v4 unstyledTextElements:0];
  id v2 = v4;
  return (IKTextElement *)v2;
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:3];
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)[(IKViewElement *)self childElementWithType:80];
}

- (IKImageElement)image
{
  id v2 = [(IKColumnItemLockupElement *)self images];
  v3 = [v2 firstObject];

  return (IKImageElement *)v3;
}

- (NSArray)images
{
  id v2 = [(IKViewElement *)self childElementsWithType:49];
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_20];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

BOOL __35__IKColumnItemLockupElement_images__block_invoke(uint64_t a1, void *a2)
{
  return [a2 imageType] == 0;
}

- (IKTextBadgeAttachment)titleBadge
{
  id v2 = [(IKColumnItemLockupElement *)self title];
  v3 = [v2 badges];
  id v4 = [v3 firstObject];

  return (IKTextBadgeAttachment *)v4;
}

- (IKTextBadgeAttachment)subtitleBadge
{
  id v2 = [(IKColumnItemLockupElement *)self subtitle];
  v3 = [v2 badges];
  id v4 = [v3 firstObject];

  return (IKTextBadgeAttachment *)v4;
}

- (IKButtonElement)button
{
  return (IKButtonElement *)[(IKViewElement *)self childElementWithType:12];
}

- (IKVideoElement)video
{
  return (IKVideoElement *)[(IKViewElement *)self childElementWithType:152];
}

- (NSArray)textElements
{
  id v4 = 0;
  [(IKColumnItemLockupElement *)self _computeTitle:0 subtitle:0 secondarySubtitle:0 unstyledTextElements:&v4];
  id v2 = v4;
  return (NSArray *)v2;
}

- (BOOL)hasSeparator
{
  id v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"separator"];
  char v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (BOOL)isWatchlisted
{
  id v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"watchlisted"];
  char v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (BOOL)onlyVisibleOnColumnHighlight
{
  id v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"onlyVisibleOnColumnHighlight"];
  char v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (void)_computeTitle:(id *)a3 subtitle:(id *)a4 secondarySubtitle:(id *)a5 unstyledTextElements:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v8 = [(IKViewElement *)self childElementsWithType:138];
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v17 textStyle] == 1)
        {
          id v18 = v17;

          uint64_t v14 = (uint64_t)v18;
        }
        else if ([v17 textStyle] == 2)
        {
          id v19 = v17;

          uint64_t v13 = (uint64_t)v19;
        }
        else if (![v17 textStyle])
        {
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }

  if (v14 | v13)
  {
    v20 = 0;
    v22 = a3;
    v21 = a4;
    if (!a3) {
      goto LABEL_28;
    }
LABEL_27:
    id *v22 = (id) v14;
    goto LABEL_28;
  }
  v22 = a3;
  v21 = a4;
  if ([v9 count])
  {
    uint64_t v14 = [v9 objectAtIndexedSubscript:0];
    if ((unint64_t)[v9 count] < 2)
    {
      v20 = 0;
      uint64_t v13 = 0;
      if (!a3) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    uint64_t v13 = [v9 objectAtIndexedSubscript:1];
    if ((unint64_t)[v9 count] < 3)
    {
      v20 = 0;
      if (a3) {
        goto LABEL_27;
      }
    }
    else
    {
      v20 = [v9 objectAtIndexedSubscript:2];
      if (a3) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    v20 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (a3) {
      goto LABEL_27;
    }
  }
LABEL_28:
  if (v21) {
    id *v21 = (id) v13;
  }
  if (a5) {
    *a5 = v20;
  }
  if (a6) {
    *a6 = (id)[v9 copy];
  }
}

@end