@interface NSArray(EMMessageListItem)
- (uint64_t)em_messageListItemTotalCount;
@end

@implementation NSArray(EMMessageListItem)

- (uint64_t)em_messageListItemTotalCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1F1A653E0, (void)v11) & 1) == 0)
        {
          v9 = [MEMORY[0x1E4F28B00] currentHandler];
          [v9 handleFailureInMethod:a2 object:v3 file:@"EMMessageListItem.m" lineNumber:709 description:@"Objects in the array must conform to protocol EMMessageListItem"];
        }
        v4 += [v8 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v4;
}

@end