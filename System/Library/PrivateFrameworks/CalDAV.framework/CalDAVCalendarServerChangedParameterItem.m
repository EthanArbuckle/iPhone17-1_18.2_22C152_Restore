@interface CalDAVCalendarServerChangedParameterItem
- (NSString)nameAttribute;
- (NSString)typeAttribute;
- (void)parserFoundAttributes:(id)a3;
- (void)setNameAttribute:(id)a3;
- (void)setTypeAttribute:(id)a3;
@end

@implementation CalDAVCalendarServerChangedParameterItem

- (void)parserFoundAttributes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x263F34EC0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 name];
        int v12 = [v11 isEqualToString:v8];

        if (v12)
        {
          v13 = [v10 value];
          [(CalDAVCalendarServerChangedParameterItem *)self setNameAttribute:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (NSString)nameAttribute
{
  return self->_nameAttribute;
}

- (void)setNameAttribute:(id)a3
{
}

- (NSString)typeAttribute
{
  return self->_typeAttribute;
}

- (void)setTypeAttribute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeAttribute, 0);
  objc_storeStrong((id *)&self->_nameAttribute, 0);
}

@end