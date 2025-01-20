@interface LSDisplayNameConstructor
@end

@implementation LSDisplayNameConstructor

void __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke(uint64_t a1, CFStringInlineBuffer *buffer, uint64_t a3)
{
  if (a3)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 64;
    uint64_t v9 = MEMORY[0x1E4F14390];
    while (1)
    {
      uint64_t v10 = (unint64_t)v7 >= 4 ? 4 : v7;
      if ((v7 & 0x8000000000000000) == 0)
      {
        CFIndex length = buffer->rangeToBuffer.length;
        if (length > v7) {
          break;
        }
      }
      if ((*(unsigned char *)(v9 + 62) & 4) == 0)
      {
        UniChar v13 = 0;
LABEL_29:
        _LSDNCGetForbiddenCharacters(0);
        v22 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
        if (_LSDNCCharacterSetContainsCharacterFromInlineBuffer(v22, v13, buffer, v7)) {
          *(unsigned char *)(*(void *)(a1 + 32) + 32) |= 0x40u;
        }
      }
LABEL_32:
      ++v7;
      --v6;
      ++v8;
      if (a3 == v7) {
        return;
      }
    }
    directUniCharBuffer = buffer->directUniCharBuffer;
    if (directUniCharBuffer)
    {
      UniChar v13 = directUniCharBuffer[v7 + buffer->rangeToBuffer.location];
    }
    else
    {
      directCStringBuffer = buffer->directCStringBuffer;
      if (directCStringBuffer)
      {
        UniChar v13 = directCStringBuffer[buffer->rangeToBuffer.location + v7];
      }
      else
      {
        if (buffer->bufferedRangeEnd <= v7
          || (CFIndex bufferedRangeStart = buffer->bufferedRangeStart, bufferedRangeStart > v7))
        {
          uint64_t v16 = -v10;
          uint64_t v17 = v10 + v6;
          uint64_t v18 = v8 - v10;
          CFIndex v19 = v7 + v16;
          CFIndex v20 = v19 + 64;
          if (v19 + 64 >= length) {
            CFIndex v20 = buffer->rangeToBuffer.length;
          }
          buffer->CFIndex bufferedRangeStart = v19;
          buffer->bufferedRangeEnd = v20;
          if (length >= v18) {
            CFIndex length = v18;
          }
          v23.CFIndex length = length + v17;
          v23.location = v19 + buffer->rangeToBuffer.location;
          CFStringGetCharacters(buffer->theString, v23, buffer->buffer);
          CFIndex bufferedRangeStart = buffer->bufferedRangeStart;
        }
        UniChar v13 = buffer->buffer[v7 - bufferedRangeStart];
      }
    }
    if (v13 <= 0x7Fu)
    {
      if ((*(_DWORD *)(v9 + 4 * v13 + 60) & 0x40000) != 0)
      {
        if (v13 == 58 && *(unsigned char *)(a1 + 40)) {
          *(unsigned char *)(*(void *)(a1 + 32) + 32) |= 0x10u;
        }
        goto LABEL_32;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 32) |= 8u;
      if (_LSDNCGetBiDiControlCharacters(void)::once != -1) {
        dispatch_once(&_LSDNCGetBiDiControlCharacters(void)::once, &__block_literal_global_170);
      }
      v21 = (NSCharacterSet *)(id)_LSDNCGetBiDiControlCharacters(void)::result;
      if (_LSDNCCharacterSetContainsCharacterFromInlineBuffer(v21, v13, buffer, v7)) {
        *(unsigned char *)(*(void *)(a1 + 32) + 32) |= 0x20u;
      }
    }
    goto LABEL_29;
  }
}

void __123___LSDisplayNameConstructor_ConstructForAnyFile__displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = [v9 isEqual:@"LSDefaultLocalizedValue"];
    if (*(void *)(a1 + 32) && *(unsigned char *)(a1 + 80))
    {
      uint64_t v7 = [(id)objc_opt_class() concatenateBaseName:v5 andExtension:*(void *)(a1 + 32)];

      id v5 = (id)v7;
    }
    uint64_t v8 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithContextIfNeeded:*(void *)(a1 + 64) node:*(void *)(a1 + 48) isDirectory:*(unsigned __int8 *)(a1 + 81) bundleClass:*(void *)(a1 + 72) desiredDisplayName:v5 treatAsFSName:v6];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

uint64_t __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke(uint64_t a1)
{
  uint64_t result = ubidi_getBaseDirection();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 1;
  return result;
}

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  objc_msgSend(v1, "addCharactersInRange:", 0, 1);
  unint64_t v2 = 0x1E4F28000uLL;
  v3 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v1 formUnionWithCharacterSet:v3];

  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v1 formUnionWithCharacterSet:v4];

  id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [v1 formUnionWithCharacterSet:v5];

  id v6 = v1;
  if (uset_openPattern())
  {
    Mutable = CFCharacterSetCreateMutable(0);
    if (Mutable)
    {
      int ItemCount = uset_getItemCount();
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
      if (ItemCount >= 1)
      {
        int v10 = 0;
        CFAllocatorRef contentsDeallocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
        do
        {
          int Item = uset_getItem();
          if (Item <= 0)
          {
            v21.location = 0;
            v21.CFIndex length = 1;
            CFCharacterSetAddCharactersInRange(Mutable, v21);
          }
          else
          {
            CFStringRef v12 = CFStringCreateWithCharactersNoCopy(v9, v19, Item, contentsDeallocator);
            CFCharacterSetAddCharactersInString(Mutable, v12);
            CFRelease(v12);
          }
          ++v10;
        }
        while (ItemCount != v10);
      }
      CFCharacterSetRef Copy = CFCharacterSetCreateCopy(v9, Mutable);
      unint64_t v2 = 0x1E4F28000;
      CFCharacterSetRef v14 = Copy;
      CFRelease(Mutable);
    }
    else
    {
      CFCharacterSetRef v14 = 0;
    }
    [v6 formUnionWithCharacterSet:v14];
    uset_close();
  }
  v15 = [*(id *)(v2 + 2952) illegalCharacterSet];
  [v6 formUnionWithCharacterSet:v15];

  uint64_t v16 = [v6 copy];
  uint64_t v17 = (void *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters;
  -[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters = v16;
}

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2(uint64_t a1, CFStringInlineBuffer *a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (a3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 64;
    do
    {
      if ((unint64_t)v10 >= 4) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v10;
      }
      UniChar v23 = 0;
      if (v10 < 0 || (CFIndex v13 = a2->rangeToBuffer.length, v13 <= v10))
      {
        UniChar v15 = 0;
      }
      else
      {
        directUniCharBuffer = a2->directUniCharBuffer;
        if (directUniCharBuffer)
        {
          UniChar v15 = directUniCharBuffer[v10 + a2->rangeToBuffer.location];
        }
        else
        {
          directCStringBuffer = a2->directCStringBuffer;
          if (directCStringBuffer)
          {
            UniChar v15 = directCStringBuffer[a2->rangeToBuffer.location + v10];
          }
          else
          {
            if (a2->bufferedRangeEnd <= v10 || (CFIndex bufferedRangeStart = a2->bufferedRangeStart, bufferedRangeStart > v10))
            {
              uint64_t v18 = -v12;
              uint64_t v19 = v12 + v9;
              uint64_t v20 = v11 - v12;
              CFIndex v21 = v10 + v18;
              CFIndex length = v21 + 64;
              if (v21 + 64 >= v13) {
                CFIndex length = a2->rangeToBuffer.length;
              }
              a2->CFIndex bufferedRangeStart = v21;
              a2->bufferedRangeEnd = length;
              if (v13 >= v20) {
                CFIndex v13 = v20;
              }
              v24.CFIndex length = v13 + v19;
              v24.location = v21 + a2->rangeToBuffer.location;
              CFStringGetCharacters(a2->theString, v24, a2->buffer);
              CFIndex bufferedRangeStart = a2->bufferedRangeStart;
            }
            UniChar v15 = a2->buffer[v10 - bufferedRangeStart];
          }
        }
      }
      UniChar v23 = v15;
      if ((_LSDNCCharacterSetContainsCharacterFromInlineBuffer((NSCharacterSet *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters, v15, a2, v10) & 1) == 0)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendCharacters:&v23 length:1]; {
      ++v10;
      }
      --v9;
      ++v11;
    }
    while (a3 != v10);
  }
}

@end