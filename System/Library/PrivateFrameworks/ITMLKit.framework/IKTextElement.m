@interface IKTextElement
+ (BOOL)shouldParseChildDOMElements;
- (IKTextElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (IKTextElement)initWithOriginalElement:(id)a3;
- (IKTextElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5;
- (NSArray)badges;
- (NSAttributedString)text;
- (UIColor)color;
- (id)accessibilityText;
- (id)attributedStringWithFont:(id)a3;
- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5;
- (id)attributedStringWithFontHandler:(id)a3;
- (id)attributedStringWithFontHandler:(id)a3 defaultAttributes:(id *)a4;
- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5;
- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 defaultAttributes:(id *)a6;
- (id)debugDescription;
- (int64_t)maxLines;
- (unint64_t)_styleForTagName:(id)a3;
- (unint64_t)alignment;
- (unint64_t)textStyle;
- (void)appDocumentDidMarkStylesDirty;
@end

@implementation IKTextElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (IKTextElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IKTextElement;
  v11 = [(IKViewElement *)&v28 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4E655C0]();
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textBadges = v11->_textBadges;
    v11->_textBadges = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textBadgeElements = v11->_textBadgeElements;
    v11->_textBadgeElements = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    textSpanElements = v11->_textSpanElements;
    v11->_textSpanElements = v17;

    v19 = [v8 nodeName];
    v11->_textStyle = [(IKTextElement *)v11 _styleForTagName:v19];

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__IKTextElement_initWithDOMElement_parent_elementFactory___block_invoke;
    v23[3] = &unk_1E6DE5980;
    objc_copyWeak(&v26, &location);
    id v24 = v8;
    id v25 = v10;
    uint64_t v20 = +[IKTextParser textWithDOMElement:v24 usingParseBlock:v23];
    textParser = v11->_textParser;
    v11->_textParser = (IKTextParser *)v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __58__IKTextElement_initWithDOMElement_parent_elementFactory___block_invoke(id *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (a1[4] == v6 || WeakRetained == 0) {
    goto LABEL_6;
  }
  v11 = [v6 nodeName];
  int v12 = [v11 isEqualToString:@"badge"];

  if (!v12)
  {
    v16 = [v6 nodeName];
    int v17 = [v16 isEqualToString:@"span"];

    if (v17)
    {
      v13 = [a1[5] elementForDOMElement:v6 parent:v8];
      [v8[31] addObject:v13];
      v15 = [[IKTextStyleableElementAttachment alloc] initWithTextElement:v13];
      v18 = [v13 text];
      v19 = (void *)[v18 mutableCopy];

      if (![v19 length])
      {
        __int16 v24 = -4;
        id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
        v21 = [NSString stringWithCharacters:&v24 length:1];
        uint64_t v22 = [v20 initWithString:v21];

        v19 = (void *)v22;
      }
      objc_msgSend(v19, "addAttribute:value:range:", @"styleableElement", v15, 0, objc_msgSend(v19, "length"));
      [v8[29] addObjectsFromArray:v13[29]];
      *a4 = 0;
      id v10 = (void *)[v19 copy];

      goto LABEL_14;
    }
LABEL_6:
    id v10 = 0;
    goto LABEL_15;
  }
  v13 = [a1[5] elementForDOMElement:v6 parent:v8];
  v14 = [[IKTextBadgeAttachment alloc] initWithBadgeElement:v13];
  if (!v14)
  {

    goto LABEL_6;
  }
  v15 = (IKTextStyleableElementAttachment *)v14;
  id v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  [v8[29] addObject:v15];
  [v8[30] addObject:v13];
  *a4 = 1;
LABEL_14:

LABEL_15:
  return v10;
}

- (IKTextElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  id v8 = (id *)a3;
  id v9 = a5;
  v41.receiver = self;
  v41.super_class = (Class)IKTextElement;
  id v10 = [(IKViewElement *)&v41 initWithPrototypeElement:v8 parent:a4 appDataItem:v9];
  v11 = v10;
  if (v10)
  {
    int v12 = [(IKViewElement *)v10 binding];
    v13 = [v12 keyValues];
    v14 = [v13 objectForKeyedSubscript:@"textContent"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [v9 valueForPropertyPath:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v16 = [v15 description];
      }
      else
      {
        v16 = &stru_1F3E09950;
      }
      v29 = (IKTextElement *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
      uint64_t v30 = +[IKTextParser textWithAttributedString:v29];
      textParser = v11->_textParser;
      v11->_textParser = (IKTextParser *)v30;
    }
    else
    {
      int v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      textBadges = v11->_textBadges;
      v11->_textBadges = v17;

      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      textBadgeElements = v11->_textBadgeElements;
      v11->_textBadgeElements = v19;

      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      textSpanElements = v11->_textSpanElements;
      v11->_textSpanElements = v21;

      v23 = [v8[28] attributedString];
      __int16 v24 = (void *)[v23 mutableCopy];
      uint64_t v25 = [v23 length];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke;
      v36 = &unk_1E6DE59D0;
      id v26 = v11;
      v37 = v26;
      id v38 = v9;
      id v39 = v24;
      id v40 = v23;
      id v15 = v23;
      v16 = v24;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", @"styleableElement", 0, v25, 2, &v33);
      uint64_t v27 = +[IKTextParser textWithAttributedString:](IKTextParser, "textWithAttributedString:", v16, v33, v34, v35, v36);
      objc_super v28 = v26->_textParser;
      v26->_textParser = (IKTextParser *)v27;

      v29 = v37;
    }

    v11->_textStyle = [v8 textStyle];
  }

  return v11;
}

void __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = [a2 textElement];
  if (v7)
  {
    id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPrototypeElement:v7 parent:a1[4] appDataItem:a1[5]];
    [*((id *)a1[4] + 31) addObject:v8];
    id v9 = [[IKTextStyleableElementAttachment alloc] initWithTextElement:v8];
    id v10 = [v8 text];
    v11 = (void *)[v10 mutableCopy];

    if (![v11 length])
    {
      __int16 v23 = -4;
      id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
      v13 = [NSString stringWithCharacters:&v23 length:1];
      uint64_t v14 = [v12 initWithString:v13];

      v11 = (void *)v14;
    }
    objc_msgSend(v11, "addAttribute:value:range:", @"styleableElement", v9, 0, objc_msgSend(v11, "length"));
    [*((id *)a1[4] + 29) addObjectsFromArray:v8[29]];
    objc_msgSend(a1[6], "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
  }
  else
  {
    id v8 = objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    uint64_t v15 = *MEMORY[0x1E4F424C0];
    uint64_t v16 = [v8 length];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke_2;
    v17[3] = &unk_1E6DE59A8;
    v18 = (IKTextStyleableElementAttachment *)a1[4];
    id v19 = a1[5];
    id v20 = a1[6];
    uint64_t v21 = a3;
    uint64_t v22 = a4;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v17);

    id v9 = v18;
  }
}

uint64_t __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v14;
  if (isKindOfClass)
  {
    id v9 = [v14 badge];
    id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPrototypeElement:v9 parent:*(void *)(a1 + 32) appDataItem:*(void *)(a1 + 40)];
    v11 = [[IKTextBadgeAttachment alloc] initWithBadgeElement:v10];
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
      [*(id *)(*(void *)(a1 + 32) + 232) addObject:v11];
      [*(id *)(*(void *)(a1 + 32) + 240) addObject:v10];
      objc_msgSend(*(id *)(a1 + 48), "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 56) + a3, a4, v12);
    }
    id v8 = v14;
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

- (IKTextElement)initWithOriginalElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextElement;
  v5 = [(IKViewElement *)&v8 initWithOriginalElement:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_textBadges, *((id *)v4 + 29));
    objc_storeStrong((id *)&v6->_textBadgeElements, *((id *)v4 + 30));
    objc_storeStrong((id *)&v6->_textSpanElements, *((id *)v4 + 31));
    objc_storeStrong((id *)&v6->_textParser, *((id *)v4 + 28));
    v6->_textStyle = *((void *)v4 + 32);
  }

  return v6;
}

- (id)debugDescription
{
  v15.receiver = self;
  v15.super_class = (Class)IKTextElement;
  v3 = [(IKViewElement *)&v15 debugDescription];
  id v4 = NSString;
  v5 = [(IKViewElement *)self elementName];
  id v6 = [v4 stringWithFormat:@"</%@>", v5];

  uint64_t v7 = [v3 length];
  uint64_t v8 = v7 - [v6 length];
  uint64_t v9 = [v6 length];
  id v10 = NSString;
  v11 = [(IKTextParser *)self->_textParser string];
  id v12 = [v10 stringWithFormat:@"%@%@", v11, v6];
  v13 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v8, v9, v12);

  return v13;
}

- (UIColor)color
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 ikColor];
  id v4 = [v3 color];

  return (UIColor *)v4;
}

- (int64_t)maxLines
{
  v3 = [(IKViewElement *)self style];
  if (v3)
  {
    id v4 = [(IKViewElement *)self style];
    int64_t v5 = [v4 maxTextLines];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (unint64_t)alignment
{
  v2 = [(IKViewElement *)self style];
  unint64_t v3 = [v2 textAlignment];

  return v3;
}

- (NSArray)badges
{
  v2 = (void *)[(NSMutableArray *)self->_textBadges copy];
  return (NSArray *)v2;
}

- (NSAttributedString)text
{
  return [(IKTextParser *)self->_textParser attributedString];
}

- (id)accessibilityText
{
  v5.receiver = self;
  v5.super_class = (Class)IKTextElement;
  unint64_t v3 = [(IKViewElement *)&v5 accessibilityText];
  if (!v3)
  {
    unint64_t v3 = [(IKTextParser *)self->_textParser string];
  }
  return v3;
}

- (void)appDocumentDidMarkStylesDirty
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)IKTextElement;
  [(IKViewElement *)&v24 appDocumentDidMarkStylesDirty];
  unint64_t v3 = (void *)[(NSMutableArray *)self->_textBadges mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_textSpanElements;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v9 appDocumentDidMarkStylesDirty];
        [v3 removeObjectsInArray:v9[29]];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "badge", (void)v16);
        [v15 appDocumentDidMarkStylesDirty];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v12);
  }
}

- (id)attributedStringWithFont:(id)a3
{
  textParser = self->_textParser;
  id v5 = a3;
  uint64_t v6 = [(IKViewElement *)self style];
  uint64_t v7 = [(IKTextParser *)textParser attributedStringWithFont:v5 style:v6];

  return v7;
}

- (id)attributedStringWithFontHandler:(id)a3
{
  textParser = self->_textParser;
  id v5 = a3;
  uint64_t v6 = [(IKViewElement *)self style];
  uint64_t v7 = [(IKTextParser *)textParser attributedStringWithFontHandler:v5 style:v6];

  return v7;
}

- (id)attributedStringWithFontHandler:(id)a3 defaultAttributes:(id *)a4
{
  textParser = self->_textParser;
  id v7 = a3;
  uint64_t v8 = [(IKViewElement *)self style];
  uint64_t v9 = [(IKTextParser *)textParser attributedStringWithFontHandler:v7 style:v8 defaultAttributes:a4];

  return v9;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  textParser = self->_textParser;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(IKViewElement *)self style];
  uint64_t v12 = [(IKTextParser *)textParser attributedStringWithFont:v10 foregroundColor:v9 textAlignment:a5 style:v11];

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  textParser = self->_textParser;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(IKViewElement *)self style];
  uint64_t v12 = [(IKTextParser *)textParser attributedStringWithFontHandler:v10 style:v11 foregroundColor:v9 textAlignment:a5];

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 defaultAttributes:(id *)a6
{
  textParser = self->_textParser;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(IKViewElement *)self style];
  id v14 = [(IKTextParser *)textParser attributedStringWithFontHandler:v12 style:v13 foregroundColor:v11 textAlignment:a5 defaultAttributes:a6];

  return v14;
}

- (unint64_t)_styleForTagName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"title"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"subtitle"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"description"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"decorationLabel"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"copyright"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"textBox"])
  {
    unint64_t v4 = 6;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSpanElements, 0);
  objc_storeStrong((id *)&self->_textBadgeElements, 0);
  objc_storeStrong((id *)&self->_textBadges, 0);
  objc_storeStrong((id *)&self->_textParser, 0);
}

@end