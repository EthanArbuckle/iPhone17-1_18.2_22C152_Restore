@interface NSPersonNameComponentsStyleFormatter
@end

@implementation NSPersonNameComponentsStyleFormatter

uint64_t __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForKeyPath:a2];
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2), "length") != 0;
  }
  return result;
}

uint64_t __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke(uint64_t a1, void *a2, char *a3)
{
  v4 = a2;
  id v6 = (id)[*(id *)(a1 + 32) valueForKeyPath:a2];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic")
    && [v4 hasPrefix:@"phoneticRepresentation."])
  {
    v4 = (void *)[v4 substringFromIndex:objc_msgSend(@"phoneticRepresentation.", "length")];
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "abbreviatedKeys"), "containsObject:", v4)) {
    id v6 = +[NSPersonNameComponentsFormatter __initialsForString:v6];
  }
  if (a3)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 - 1));
    if ([v7 length]) {
      a3 = (char *)objc_msgSend(*(id *)(a1 + 40), "_delimiterBetweenString:andString:isPhonetic:", v7, v6, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic"));
    }
    else {
      a3 = 0;
    }
  }
  uint64_t result = [v6 length];
  if (result)
  {
    v9 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length], objc_msgSend(a3, "length"));
    v10 = (void *)[*(id *)(a1 + 56) objectForKey:v9];
    if (!v10)
    {
      v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 56) setObject:v10 forKey:v9];
    }
    [v10 setObject:@"delimiter" forKey:@"NSPersonNameComponentKey"];
    if (a3) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) appendString:a3];
    }
    if (*(void *)(a1 + 56))
    {
      v11 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length], objc_msgSend(v6, "length"));
      v12 = (void *)[*(id *)(a1 + 56) objectForKey:v11];
      if (!v12)
      {
        v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v11];
      }
      [v12 setObject:v4 forKeyedSubscript:@"NSPersonNameComponentKey"];
    }
    v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    return [v13 appendString:v6];
  }
  return result;
}

uint64_t __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)[*(id *)(a1 + 32) keysOfInterest];

  return [v3 containsObject:a2];
}

id __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "orderedTemplate"), "objectAtIndexedSubscript:", a2), "mutableCopy");
  if (result)
  {
    id v4 = result;
    if (*(unsigned char *)(a1 + 48)) {
      [result insertString:@"phoneticRepresentation." atIndex:0];
    }
    v5 = *(void **)(a1 + 40);
    return (id)[v5 addObject:v4];
  }
  return result;
}

uint64_t __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [a2 rangeValue];
  v7 = *(void **)(a1 + 32);

  return objc_msgSend(v7, "addAttributes:range:", a3, v6, v5);
}

@end