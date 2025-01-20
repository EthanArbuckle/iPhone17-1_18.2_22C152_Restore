@interface NSRunLoop(CATBlocks)
+ (void)cat_performBlock:()CATBlocks;
+ (void)cat_performBlockOnMainRunLoop:()CATBlocks;
- (void)cat_performBlock:()CATBlocks;
- (void)cat_performInModes:()CATBlocks block:;
@end

@implementation NSRunLoop(CATBlocks)

+ (void)cat_performBlock:()CATBlocks
{
  v3 = (void *)MEMORY[0x263EFF9F0];
  id v4 = a3;
  id v5 = [v3 currentRunLoop];
  objc_msgSend(v5, "cat_performBlock:", v4);
}

+ (void)cat_performBlockOnMainRunLoop:()CATBlocks
{
  v3 = (void *)MEMORY[0x263EFF9F0];
  id v4 = a3;
  id v5 = [v3 mainRunLoop];
  objc_msgSend(v5, "cat_performBlock:", v4);
}

- (void)cat_performBlock:()CATBlocks
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF980];
  v9[0] = *MEMORY[0x263EFF588];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = [v5 arrayWithArray:v6];

  v8 = [a1 currentMode];
  if (v8) {
    [v7 addObject:v8];
  }
  objc_msgSend(a1, "cat_performInModes:block:", v7, v4);
}

- (void)cat_performInModes:()CATBlocks block:
{
  id v6 = a4;
  id v7 = a3;
  v8 = (__CFRunLoop *)[a1 getCFRunLoop];
  CFRunLoopPerformBlock(v8, v7, v6);

  CFRunLoopWakeUp(v8);
}

@end