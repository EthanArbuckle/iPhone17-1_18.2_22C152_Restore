@interface _MPUHTMLDefaultDelegate
- (NSDictionary)defaultAttributes;
- (id)defaultAttributesForParser:(id)a3;
- (id)parser:(id)a3 attributesForTagName:(id)a4 tagAttributes:(id)a5 currentState:(id)a6;
- (id)parser:(id)a3 prependStringForTagName:(id)a4;
- (void)setDefaultAttributes:(id)a3;
@end

@implementation _MPUHTMLDefaultDelegate

- (id)parser:(id)a3 attributesForTagName:(id)a4 tagAttributes:(id)a5 currentState:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a6 attributes];
  uint64_t v11 = *MEMORY[0x263F1C238];
  v12 = [v10 objectForKey:*MEMORY[0x263F1C238]];

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14 = [v12 fontDescriptor];
  if (([v8 isEqualToString:@"b"] & 1) != 0
    || [v8 isEqualToString:@"strong"])
  {
    [v12 pointSize];
    v16 = v14;
    int v17 = 2;
LABEL_7:
    v18 = _MPUHTMLDefaultDelegateFontByAddingTraits(v16, v17, v15);
    [v13 setObject:v18 forKey:v11];

    goto LABEL_8;
  }
  if (([v8 isEqualToString:@"i"] & 1) != 0
    || [v8 isEqualToString:@"em"])
  {
    [v12 pointSize];
    v16 = v14;
    int v17 = 1;
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"u"])
  {
    [v13 setObject:&unk_26DAC2930 forKey:*MEMORY[0x263F1C2D8]];
  }
  else if ([v8 isEqualToString:@"a"])
  {
    v21 = [v9 objectForKey:@"href"];
    v22 = [NSURL URLWithString:v21];
    if (v22) {
      [v13 setObject:v22 forKey:*MEMORY[0x263F1C258]];
    }
  }
LABEL_8:
  if ([v13 count]) {
    id v19 = v13;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (id)defaultAttributesForParser:(id)a3
{
  return self->_defaultAttributes;
}

- (id)parser:(id)a3 prependStringForTagName:(id)a4
{
  if ([a4 isEqualToString:@"br"]) {
    return @"\n";
  }
  else {
    return 0;
  }
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end