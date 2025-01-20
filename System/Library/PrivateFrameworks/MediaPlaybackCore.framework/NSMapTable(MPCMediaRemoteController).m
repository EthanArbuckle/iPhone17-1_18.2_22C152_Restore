@interface NSMapTable(MPCMediaRemoteController)
- (id)allCommandInfos;
- (void)commandInfoForCommand:()MPCMediaRemoteController;
@end

@implementation NSMapTable(MPCMediaRemoteController)

- (void)commandInfoForCommand:()MPCMediaRemoteController
{
  return NSMapGet(a1, (const void *)(a3 | 0x80000000));
}

- (id)allCommandInfos
{
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMapTable count](a1, "count"));
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  for (key = 0;
        NSNextMapEnumeratorPair(&enumerator, &key, &value);
  NSEndMapTableEnumeration(&enumerator);

  return v2;
}

@end