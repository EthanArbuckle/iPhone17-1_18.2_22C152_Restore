@interface CalDAVCalendarColorItem
- (CalDAVCalendarColorItem)init;
- (NSString)symbolicColorName;
- (void)parserFoundAttributes:(id)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)write:(id)a3;
@end

@implementation CalDAVCalendarColorItem

- (CalDAVCalendarColorItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34F68] andName:*MEMORY[0x263F34CF0]];
}

- (void)parserFoundAttributes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v14);
        int v11 = [v10 isEqualToString:@"symbolic-color"];

        if (v11)
        {
          v12 = [v9 value];
          v13 = [v12 lowercaseString];
          [(CalDAVCalendarColorItem *)self setSymbolicColorName:v13];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSString)symbolicColorName
{
  symbolicColorName = self->_symbolicColorName;
  if (symbolicColorName) {
    goto LABEL_2;
  }
  id v4 = (void *)MEMORY[0x263F886B8];
  uint64_t v5 = [(CalDAVCalendarColorItem *)self colorString];
  v3 = [v4 symbolicColorForLegacyRGB:v5];

  if (!v3)
  {
    symbolicColorName = (NSString *)*MEMORY[0x263F887A8];
LABEL_2:
    v3 = symbolicColorName;
  }
  return v3;
}

- (void)write:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalDAVCalendarColorItem *)self symbolicColorName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [(CoreDAVItem *)self name];
    v8 = [(CoreDAVItem *)self nameSpace];
    v9 = [(CoreDAVItem *)self payloadAsString];
    v10 = [(CalDAVCalendarColorItem *)self symbolicColorName];
    objc_msgSend(v4, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v7, v8, v9, @"symbolic-color", v10, 0);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CalDAVCalendarColorItem;
    [(CoreDAVItem *)&v11 write:v4];
  }
}

- (void)setSymbolicColorName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end