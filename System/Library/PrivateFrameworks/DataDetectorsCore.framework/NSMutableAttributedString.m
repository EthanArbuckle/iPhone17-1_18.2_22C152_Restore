@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

unint64_t __65__NSMutableAttributedString_DataDetectorsSupport__dd_chopResults__block_invoke(unint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v6 = result;
    uint64_t v7 = [a2 range];
    unint64_t v9 = v7 + v8;
    result = [*(id *)(v6 + 32) length];
    if (v9 > result)
    {
      v10 = *(void **)(v6 + 32);
      return objc_msgSend(v10, "removeAttribute:range:", @"DDResultAttributeName", a3, a4);
    }
  }
  return result;
}

uint64_t __70__NSMutableAttributedString_DataDetectorsSupport__dd_offsetResultsBy___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v7 = result;
    if ([*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) objectForKey:a2])
    {
      uint64_t v8 = *(void **)(v7 + 32);
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(v7 + 40) + 8) + 40) objectForKey:a2];
      return objc_msgSend(v8, "addAttribute:value:range:", @"DDResultAttributeName", v9, a3, a4);
    }
    else if ([a2 range] + *(void *)(v7 + 48) < 0)
    {
      v13 = *(void **)(v7 + 32);
      return objc_msgSend(v13, "removeAttribute:range:", @"DDResultAttributeName", a3, a4);
    }
    else
    {
      Copy = (const void *)DDResultCreateCopy([a2 coreResult]);
      id v11 = +[DDScannerResult resultFromCoreResult:Copy];
      CFRelease(Copy);
      [v11 offsetRangeBy:*(void *)(v7 + 48)];
      objc_msgSend(*(id *)(v7 + 32), "addAttribute:value:range:", @"DDResultAttributeName", v11, a3, a4);
      v12 = *(void **)(*(void *)(*(void *)(v7 + 40) + 8) + 40);
      return [v12 setObject:v11 forKey:a2];
    }
  }
  return result;
}

@end