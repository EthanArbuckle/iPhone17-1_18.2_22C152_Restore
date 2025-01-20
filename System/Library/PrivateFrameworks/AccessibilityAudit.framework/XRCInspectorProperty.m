@interface XRCInspectorProperty
+ (void)_continueFetchingProperties:(id)a3 fetchedProperties:(id)a4 fetchedValues:(id)a5 completionBlock:(id)a6;
+ (void)fetchValuesForProperties:(id)a3 completionBlock:(id)a4;
- (AXAuditElement)element;
- (AXAuditElementAttribute)elementAttribute;
- (BOOL)isEqual:(id)a3;
- (BOOL)showElementClassName;
- (BOOL)showIgnoredElements;
- (BOOL)valueKnown;
- (NSString)title;
- (XRCInspectorPropertyDelegate)delegate;
- (id)_OSXConstantsToSelectorsDict;
- (id)_OSXSelectorForAction:(id)a3;
- (id)_OSXSelectorForAttribute:(id)a3;
- (id)_spacedStringFromCamelCase:(id)a3;
- (id)description;
- (id)value;
- (id)valueForDisplayOverride;
- (void)fetchValueWithCompletionBlock:(id)a3;
- (void)focusOnElement:(id)a3;
- (void)performAction;
- (void)previewElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElement:(id)a3;
- (void)setElementAttribute:(id)a3;
- (void)setNewValue:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueForDisplayOverride:(id)a3;
- (void)setValueKnown:(BOOL)a3;
@end

@implementation XRCInspectorProperty

+ (void)_continueFetchingProperties:(id)a3 fetchedProperties:(id)a4 fetchedValues:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = (id)objc_opt_new();
    if (v12) {
      goto LABEL_3;
    }
  }
  id v12 = (id)objc_opt_new();
LABEL_3:
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __100__XRCInspectorProperty__continueFetchingProperties_fetchedProperties_fetchedValues_completionBlock___block_invoke;
  v20[3] = &unk_26520D4F0;
  id v14 = v11;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  id v25 = a1;
  id v16 = v10;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  v18 = (void *)MEMORY[0x24C54EE20](v20);
  v19 = [v16 firstObject];
  if (v19)
  {
    [v16 removeObject:v19];
    [v19 fetchValueWithCompletionBlock:v18];
  }
  else
  {
    (*((void (**)(id, id, id))v17 + 2))(v17, v14, v15);
  }
}

uint64_t __100__XRCInspectorProperty__continueFetchingProperties_fetchedProperties_fetchedValues_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = a3;
    [v5 addObject:a2];
    [*(id *)(a1 + 40) addObject:v6];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);

  return [v7 _continueFetchingProperties:v11 fetchedProperties:v9 fetchedValues:v10 completionBlock:v8];
}

+ (void)fetchValuesForProperties:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 mutableCopy];
  [a1 _continueFetchingProperties:v7 fetchedProperties:0 fetchedValues:0 completionBlock:v6];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)XRCInspectorProperty;
  v3 = [(XRCInspectorProperty *)&v8 description];
  v4 = [(XRCInspectorProperty *)self elementAttribute];
  v5 = [(XRCInspectorProperty *)self title];
  id v6 = [v3 stringByAppendingFormat:@"Attribute:%@ Title:%@", v4, v5];

  return v6;
}

- (id)_spacedStringFromCamelCase:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v5 = objc_opt_new();
  id v6 = (void *)v5;
  if (v4 >= 1)
  {
    v26 = (void *)v5;
    uint64_t v7 = 0;
    int v8 = 1;
    uint64_t v9 = -1;
    do
    {
      unsigned int v10 = [v3 characterAtIndex:v7];
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v10);
      id v12 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
      uint64_t v13 = [v11 rangeOfCharacterFromSet:v12];

      int v14 = (v13 == 0x7FFFFFFFFFFFFFFFLL) | v8;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL && (v8 & 1) != 0)
      {
        if (v9 != -1)
        {
          id v15 = objc_msgSend(v3, "substringWithRange:", v9, v7 - v9);
          [v26 addObject:v15];
        }
        int v14 = 0;
        uint64_t v9 = v7;
      }

      ++v7;
      int v8 = v14;
    }
    while (v4 != v7);
    id v6 = v26;
    if (v9 != -1)
    {
      id v16 = objc_msgSend(v3, "substringWithRange:", v9, objc_msgSend(v3, "length") - v9);
      [v26 addObject:v16];
    }
  }
  id v17 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v17 length])
        {
          [v17 appendString:@" "];
          id v24 = [v23 lowercaseString];
          [v17 appendString:v24];
        }
        else
        {
          [v17 appendString:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  return v17;
}

- (id)_OSXConstantsToSelectorsDict
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"OSX-ConstantsToSelectors" ofType:@"plist"];
  uint64_t v4 = [NSDictionary dictionaryWithContentsOfFile:v3];

  return v4;
}

- (id)_OSXSelectorForAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XRCInspectorProperty *)self _OSXConstantsToSelectorsDict];
  id v6 = [v5 objectForKey:@"actions"];
  uint64_t v7 = [v6 objectForKey:v4];

  int v8 = [v7 objectForKey:@"cocoa_protocol_selector"];

  return v8;
}

- (id)_OSXSelectorForAttribute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XRCInspectorProperty *)self _OSXConstantsToSelectorsDict];
  id v6 = [v5 objectForKey:@"attributes"];
  uint64_t v7 = [v6 objectForKey:v4];

  int v8 = [v7 objectForKey:@"cocoa_protocol_selector"];

  return v8;
}

- (NSString)title
{
  v2 = [(XRCInspectorProperty *)self elementAttribute];
  id v3 = [v2 humanReadableName];

  return (NSString *)v3;
}

- (void)fetchValueWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(XRCInspectorProperty *)self delegate];
  [v5 fetchValueForProperty:self completionBlock:v4];
}

- (void)setNewValue:(id)a3
{
  id v5 = a3;
  id v4 = [(XRCInspectorProperty *)self delegate];
  [v4 updateProperty:self withNewValue:v5];

  [(XRCInspectorProperty *)self setValue:v5];
}

- (void)performAction
{
  id v3 = [(XRCInspectorProperty *)self delegate];
  [v3 performAction:self];
}

- (void)previewElement:(id)a3
{
  id v4 = a3;
  id v5 = [(XRCInspectorProperty *)self delegate];
  [v5 previewOnElement:v4];
}

- (void)focusOnElement:(id)a3
{
  id v4 = a3;
  id v5 = [(XRCInspectorProperty *)self delegate];
  [v5 focusOnElement:v4];
}

- (BOOL)showElementClassName
{
  v2 = [(XRCInspectorProperty *)self delegate];
  char v3 = [v2 showElementClassName];

  return v3;
}

- (BOOL)showIgnoredElements
{
  v2 = [(XRCInspectorProperty *)self delegate];
  char v3 = [v2 showIgnoredElements];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XRCInspectorProperty *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(XRCInspectorProperty *)v5 elementAttribute];
      uint64_t v7 = [(XRCInspectorProperty *)self elementAttribute];
      if ([v6 isEqual:v7])
      {
        int v8 = [(XRCInspectorProperty *)v5 element];
        uint64_t v9 = [(XRCInspectorProperty *)self element];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (AXAuditElementAttribute)elementAttribute
{
  return self->_elementAttribute;
}

- (void)setElementAttribute:(id)a3
{
}

- (AXAuditElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (XRCInspectorPropertyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XRCInspectorPropertyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)valueKnown
{
  return self->_valueKnown;
}

- (void)setValueKnown:(BOOL)a3
{
  self->_valueKnown = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (id)valueForDisplayOverride
{
  return self->_valueForDisplayOverride;
}

- (void)setValueForDisplayOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueForDisplayOverride, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_element, 0);

  objc_storeStrong((id *)&self->_elementAttribute, 0);
}

@end