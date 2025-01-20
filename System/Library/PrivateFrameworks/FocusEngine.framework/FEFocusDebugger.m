@interface FEFocusDebugger
@end

@implementation FEFocusDebugger

void __24___FEFocusDebugger_help__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v9 = *(void **)(a1 + 32);
  id v12 = a5;
  id v10 = a4;
  id v11 = a3;
  [v9 appendFormat:@"\n\n%@:", a2];
  [*(id *)(a1 + 32) appendFormat:@"\n\tSwift: %@", v11];

  [*(id *)(a1 + 32) appendFormat:@"\n\tObjC:  %@", v10];
  [*(id *)(a1 + 32) appendFormat:@"\n\n\tOverview:\n\t%@", v12];
}

void __44___FEFocusDebugger__ancestryForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v10 = v3;
  if (v3)
  {
    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v10];
  }
  else
  {
    v8 = @"(nil)";
  }
  [v4 addMessage:v8];

  v9 = v10;
  if (*(id *)(a1 + 40) == v10)
  {
    [*(id *)(a1 + 32) incrementIndentLevel];
    v9 = v10;
  }
}

uint64_t __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3
    || ([v5 parentGroup], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    v7 = [v6 description];
    v8 = +[_FEDebugLogMessage messageWithString:v7];

    [*(id *)(a1 + 32) pushNode:v8];
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id *__46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke_2(id *result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    return (id *)(id)[result[4] popNode];
  }
  return result;
}

void __61___FEFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  if ([v13 isPreferredByItself])
  {
    *a3 = 1;
  }
  else
  {
    id v5 = [v13 environment];
    unsigned int v6 = [*(id *)(a1 + 32) containsObject:v5];
    v7 = _FEFocusItemSafeCast(v5);
    v8 = v7;
    if (v6)
    {
      uint64_t v9 = @"Environment seen previously. Skipping.";
      id v10 = @"!";
    }
    else
    {
      id v10 = &stru_2700CBC00;
      if (v7)
      {
        if (_FEFocusItemIsFocusedOrFocusableInFocusSystem(v7, *(void **)(a1 + 40)))
        {
          id v10 = @"*";
          uint64_t v9 = @"Environment is focusable.";
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    if ([(__CFString *)v9 length])
    {
      id v11 = +[_FEDebugLogMessage messageWithPrefix:v10 string:v9];
      id v12 = [v13 debugStack];
      [v12 addMessage:v11];
    }
    [*(id *)(a1 + 32) addObject:v5];
    *a3 = v6;
  }
}

@end