@interface AXElement(AXFocusEngine)
- (double)elementLabelContainerSize;
- (id)applicationForHostFocusSystem;
- (id)elementForRemoteFocusSystem;
- (id)elementName;
- (id)remoteSceneID;
- (id)typeaheadQueryString;
- (uint64_t)applicationIsExtension;
- (uint64_t)currentFocusElement;
- (uint64_t)disableFocus;
- (uint64_t)enableFocus;
- (uint64_t)focusOnApplication;
- (uint64_t)hasNativeFocusElements;
- (uint64_t)hasRemoteFocusSystem;
- (uint64_t)isSpacer;
- (uint64_t)moveFocusWithHeading:()AXFocusEngine byGroup:;
- (uint64_t)moveFocusWithHeading:()AXFocusEngine withQueryString:;
- (void)didFocus;
- (void)focusOnRemoteSceneID;
- (void)setTypeaheadQueryString:()AXFocusEngine;
@end

@implementation AXElement(AXFocusEngine)

- (id)typeaheadQueryString
{
  return objc_getAssociatedObject(a1, &_FKAAXElementCategory_typeaheadQueryString);
}

- (void)setTypeaheadQueryString:()AXFocusEngine
{
}

- (id)elementName
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [a1 typeaheadQueryString];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = objc_msgSend(a1, "userInputLabels", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [v9 lowercaseString];
          v11 = [a1 typeaheadQueryString];
          v12 = [v11 lowercaseString];
          char v13 = [v10 containsString:v12];

          if (v13)
          {
            id v14 = v9;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  v4 = [a1 userInputLabels];
  id v14 = [v4 firstObject];
LABEL_13:
  v15 = v14;

  return v15;
}

- (double)elementLabelContainerSize
{
  return *MEMORY[0x263F001B0];
}

- (uint64_t)isSpacer
{
  return 0;
}

- (uint64_t)hasRemoteFocusSystem
{
  v1 = [a1 uiElement];
  uint64_t v2 = [v1 BOOLWithAXAttribute:12008];

  return v2;
}

- (uint64_t)applicationIsExtension
{
  v1 = [a1 uiElement];
  uint64_t v2 = [v1 BOOLWithAXAttribute:3047];

  return v2;
}

- (id)elementForRemoteFocusSystem
{
  if ([a1 hasRemoteFocusSystem])
  {
    uint64_t v2 = [a1 remoteSceneID];
    uint64_t v3 = [a1 uiElement];
    v4 = [v3 numberWithAXAttribute:12009];
    [v4 intValue];

    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    uint64_t v6 = [MEMORY[0x263F21668] elementWithAXUIElement:AppElementWithPid];
    if (AppElementWithPid) {
      CFRelease(AppElementWithPid);
    }
    uint64_t v7 = [v6 elementForAttribute:95256 parameter:v2];
    v8 = [v6 focusContainersForCurrentSceneIdentifier:0];
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__AXElement_AXFocusEngine__elementForRemoteFocusSystem__block_invoke;
    v15[3] = &unk_264BB2A10;
    id v10 = v9;
    id v16 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v15];
    if ([v10 count] == 1)
    {
      uint64_t v11 = [v10 firstObject];

      uint64_t v7 = (void *)v11;
    }
    if (v7) {
      v12 = v7;
    }
    else {
      v12 = v6;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)applicationForHostFocusSystem
{
  v1 = [a1 uiElement];
  uint64_t v2 = [v1 numberWithAXAttribute:12010];
  int v3 = [v2 intValue];

  if (v3 < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    uint64_t v5 = [MEMORY[0x263F21668] elementWithAXUIElement:AppElementWithPid];
    if (AppElementWithPid) {
      CFRelease(AppElementWithPid);
    }
  }
  return v5;
}

- (uint64_t)currentFocusElement
{
  return [a1 elementForAttribute:3024 shouldFetchAttributes:0];
}

- (id)remoteSceneID
{
  if ([a1 hasRemoteFocusSystem])
  {
    uint64_t v2 = [a1 uiElement];
    int v3 = [v2 objectWithAXAttribute:12014];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (void)focusOnRemoteSceneID
{
  id v4 = [a1 remoteSceneID];
  if (v4)
  {
    uint64_t v2 = [a1 elementForRemoteFocusSystem];
    int v3 = [v2 application];
    [v3 performAction:5310 withValue:v4];
  }
}

- (uint64_t)focusOnApplication
{
  return [a1 performAction:5308 withValue:MEMORY[0x263EFFA88]];
}

- (uint64_t)enableFocus
{
  return [a1 performAction:5305 withValue:MEMORY[0x263EFFA88]];
}

- (uint64_t)disableFocus
{
  return [a1 performAction:5305 withValue:MEMORY[0x263EFFA80]];
}

- (void)didFocus
{
  id v1 = [a1 uiElement];
  [v1 performAXAction:5307];
}

- (uint64_t)moveFocusWithHeading:()AXFocusEngine byGroup:
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v11[0] = v6;
  uint64_t v7 = [NSNumber numberWithBool:a4];
  v11[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  uint64_t v9 = [a1 performAction:5300 withValue:v8];

  return v9;
}

- (uint64_t)moveFocusWithHeading:()AXFocusEngine withQueryString:
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithUnsignedInteger:a3];
  v12[0] = v8;
  v12[1] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  uint64_t v10 = [a1 performAction:5304 withValue:v9];
  return v10;
}

- (uint64_t)hasNativeFocusElements
{
  id v1 = [a1 uiElement];
  uint64_t v2 = [v1 BOOLWithAXAttribute:3048];

  return v2;
}

@end