@interface FBSDisplayLayoutElement(INCDisplayLayoutMonitorObserver)
- (BOOL)_intents_isExpectedElement;
- (id)_intents_SpringBoardElement;
- (uint64_t)_intents_isSiri;
@end

@implementation FBSDisplayLayoutElement(INCDisplayLayoutMonitorObserver)

- (BOOL)_intents_isExpectedElement
{
  v2 = objc_msgSend(a1, "_intents_SpringBoardElement");
  v3 = v2;
  BOOL v6 = 1;
  if (v2)
  {
    if ([v2 layoutRole] == 3)
    {
      v4 = [a1 identifier];
      int v5 = [v4 isEqualToString:*MEMORY[0x1E4F625B0]];

      if (!v5) {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (id)_intents_SpringBoardElement
{
  if ([a1 conformsToProtocol:&unk_1F1637F30])
  {
    id v2 = a1;
    if ([v2 isSpringBoardElement]) {
      goto LABEL_5;
    }
  }
  id v2 = 0;
LABEL_5:
  return v2;
}

- (uint64_t)_intents_isSiri
{
  id v2 = objc_msgSend(a1, "_intents_SpringBoardElement");
  if (v2)
  {
    v3 = [a1 identifier];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F625C0]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end