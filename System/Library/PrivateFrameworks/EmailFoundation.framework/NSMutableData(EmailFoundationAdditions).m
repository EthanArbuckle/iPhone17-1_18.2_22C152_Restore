@interface NSMutableData(EmailFoundationAdditions)
- (uint64_t)ef_deleteBytesInRange:()EmailFoundationAdditions;
- (void)ef_deleteBytesInData:()EmailFoundationAdditions beforeOccurrencesOfData:;
- (void)ef_replaceContiguousSequencesOfBytesInData:()EmailFoundationAdditions withData:;
@end

@implementation NSMutableData(EmailFoundationAdditions)

- (uint64_t)ef_deleteBytesInRange:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", a3, a4, 0, 0);
}

- (void)ef_deleteBytesInData:()EmailFoundationAdditions beforeOccurrencesOfData:
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 length];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7 - 1;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = objc_msgSend(a1, "subdataWithRange:", v9, 1);
        if (objc_msgSend(v13, "ef_containsData:", v11))
        {
          ++v8;
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(a1, "ef_deleteBytesInRange:", v9 + 1, v8);

        uint64_t v8 = 0;
      }
      uint64_t v12 = [v6 length];
      if (v9 + v12 <= (unint64_t)[a1 length])
      {
        v11 = objc_msgSend(a1, "subdataWithRange:", v9, objc_msgSend(v6, "length"));
        if ([v11 isEqualToData:v6]) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        goto LABEL_12;
      }
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
      --v9;
    }
    while (v9 != -1);
  }
}

- (void)ef_replaceContiguousSequencesOfBytesInData:()EmailFoundationAdditions withData:
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 length];
  if (v7)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v7 - 1;
      uint64_t v10 = objc_msgSend(a1, "subdataWithRange:", v7 - 1, 1);
      if (objc_msgSend(v13, "ef_containsData:", v10))
      {
        ++v8;
        if (v7 == 1)
        {
          id v12 = v6;
          objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", 0, v8, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));

          break;
        }
      }
      else if (v8)
      {
        id v11 = v6;
        objc_msgSend(a1, "replaceBytesInRange:withBytes:length:", v7, v8, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
        uint64_t v8 = 0;
      }

      --v7;
    }
    while (v9);
  }
}

@end