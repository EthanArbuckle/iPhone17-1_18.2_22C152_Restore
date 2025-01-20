@interface FBKBugFormLabel
- (FBKBugFormLabel)initWithCoder:(id)a3;
- (FBKBugFormLabel)initWithFrame:(CGRect)a3;
- (NSLayoutManager)layoutManager;
- (NSTextContainer)container;
- (NSTextStorage)textStorage;
- (void)_initLabel;
- (void)layoutSubviews;
- (void)setContainer:(id)a3;
- (void)setLayoutManager:(id)a3;
- (void)setTextStorage:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation FBKBugFormLabel

- (FBKBugFormLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormLabel;
  v3 = -[FBKBugFormLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FBKBugFormLabel *)v3 _initLabel];
  }
  return v4;
}

- (FBKBugFormLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormLabel;
  v3 = [(FBKBugFormLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FBKBugFormLabel *)v3 _initLabel];
  }
  return v4;
}

- (void)_initLabel
{
  v3 = (NSTextStorage *)objc_alloc_init(MEMORY[0x263F816E8]);
  textStorage = self->_textStorage;
  self->_textStorage = v3;

  v5 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x263F81648]);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v5;

  [(NSTextStorage *)self->_textStorage addLayoutManager:self->_layoutManager];
  id v7 = objc_alloc(MEMORY[0x263F81680]);
  [(FBKBugFormLabel *)self bounds];
  v10 = (NSTextContainer *)objc_msgSend(v7, "initWithSize:", v8, v9);
  container = self->_container;
  self->_container = v10;

  [(NSTextContainer *)self->_container setMaximumNumberOfLines:[(FBKBugFormLabel *)self numberOfLines]];
  [(NSTextContainer *)self->_container setLineBreakMode:[(FBKBugFormLabel *)self lineBreakMode]];
  [(NSTextContainer *)self->_container setLineFragmentPadding:0.0];
  v12 = self->_layoutManager;
  v13 = self->_container;

  [(NSLayoutManager *)v12 addTextContainer:v13];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FBKBugFormLabel;
  [(FBKBugFormLabel *)&v12 layoutSubviews];
  [(FBKBugFormLabel *)self bounds];
  double Width = CGRectGetWidth(v13);
  if (Width > 0.0)
  {
    double v4 = Width;
    [(FBKBugFormLabel *)self preferredMaxLayoutWidth];
    if (v4 != v5)
    {
      [(FBKBugFormLabel *)self bounds];
      [(FBKBugFormLabel *)self setPreferredMaxLayoutWidth:CGRectGetWidth(v14)];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)FBKBugFormLabel;
  [(FBKBugFormLabel *)&v11 layoutSubviews];
  [(FBKBugFormLabel *)self bounds];
  double v7 = v6;
  double v9 = v8;
  v10 = [(FBKBugFormLabel *)self container];
  objc_msgSend(v10, "setSize:", v7, v9);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [(FBKBugFormLabel *)self textStorage];
  double v7 = [(FBKBugFormLabel *)self attributedText];
  [v6 setAttributedString:v7];

  double v8 = [(FBKBugFormLabel *)self attributedText];
  double v9 = (void *)[v8 mutableCopy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    uint64_t v13 = *MEMORY[0x263F81520];
    uint64_t v14 = *MEMORY[0x263F814A8];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * v15) locationInView:self];
        double v17 = v16;
        double v19 = v18;
        v20 = [(FBKBugFormLabel *)self layoutManager];
        v21 = [(FBKBugFormLabel *)self container];
        uint64_t v22 = objc_msgSend(v20, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v21, 0, v17, v19);

        uint64_t v29 = 0;
        uint64_t v30 = 0;
        v23 = [(FBKBugFormLabel *)self attributedText];
        v24 = [v23 attributesAtIndex:v22 effectiveRange:&v29];

        v25 = [v24 objectForKey:v13];
        if (v25)
        {
          v26 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.100000001];
          objc_msgSend(v9, "addAttribute:value:range:", v14, v26, v29, v30);
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  v27 = (void *)[v9 copy];
  [(FBKBugFormLabel *)self setAttributedText:v27];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [(FBKBugFormLabel *)self attributedText];
  double v7 = (void *)[v6 mutableCopy];

  id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v13) locationInView:self];
        double v15 = v14;
        double v17 = v16;
        double v18 = [(FBKBugFormLabel *)self layoutManager];
        double v19 = [(FBKBugFormLabel *)self container];
        uint64_t v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        [v8 addIndex:v20];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  v21 = [(FBKBugFormLabel *)self attributedText];
  uint64_t v22 = *MEMORY[0x263F814A8];
  v23 = [(FBKBugFormLabel *)self attributedText];
  uint64_t v24 = [v23 length];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __42__FBKBugFormLabel_touchesMoved_withEvent___block_invoke;
  long long v31 = &unk_2648760D0;
  id v32 = v8;
  id v33 = v7;
  id v25 = v7;
  id v26 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v24, 0, &v28);

  v27 = objc_msgSend(v25, "copy", v28, v29, v30, v31);
  [(FBKBugFormLabel *)self setAttributedText:v27];
}

uint64_t __42__FBKBugFormLabel_touchesMoved_withEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:");
  if ((result & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *MEMORY[0x263F814A8];
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [(FBKBugFormLabel *)self attributedText];
  double v7 = (void *)[v6 mutableCopy];

  id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v13) locationInView:self];
        double v15 = v14;
        double v17 = v16;
        double v18 = [(FBKBugFormLabel *)self layoutManager];
        double v19 = [(FBKBugFormLabel *)self container];
        uint64_t v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        [v8 addIndex:v20];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  v21 = [(FBKBugFormLabel *)self attributedText];
  uint64_t v22 = *MEMORY[0x263F814A8];
  v23 = [(FBKBugFormLabel *)self attributedText];
  uint64_t v24 = [v23 length];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __46__FBKBugFormLabel_touchesCancelled_withEvent___block_invoke;
  long long v31 = &unk_2648760D0;
  id v32 = v8;
  id v33 = v7;
  id v25 = v7;
  id v26 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v24, 0, &v28);

  v27 = objc_msgSend(v25, "copy", v28, v29, v30, v31);
  [(FBKBugFormLabel *)self setAttributedText:v27];
}

uint64_t __46__FBKBugFormLabel_touchesCancelled_withEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:");
  if (result)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *MEMORY[0x263F814A8];
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = [(FBKBugFormLabel *)self attributedText];
  uint64_t v29 = (void *)[v6 mutableCopy];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    uint64_t v10 = *MEMORY[0x263F814A8];
    uint64_t v11 = *MEMORY[0x263F81520];
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * v12) locationInView:self];
        double v14 = v13;
        double v16 = v15;
        double v17 = [(FBKBugFormLabel *)self layoutManager];
        double v18 = [(FBKBugFormLabel *)self container];
        uint64_t v19 = objc_msgSend(v17, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v18, 0, v14, v16);

        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v20 = [(FBKBugFormLabel *)self attributedText];
        v21 = [v20 attributesAtIndex:v19 effectiveRange:&v30];

        uint64_t v22 = [v21 objectForKey:v10];

        if (v22) {
          objc_msgSend(v29, "removeAttribute:range:", v10, v30, v31);
        }
        v23 = [v21 objectForKey:v11];
        if (v23)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = v23;
LABEL_16:
            id v25 = v24;

            goto LABEL_17;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = [NSURL URLWithString:v23];
            if (v24) {
              goto LABEL_16;
            }
          }
        }

        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v25 = 0;
LABEL_17:

  id v26 = (void *)[v29 copy];
  [(FBKBugFormLabel *)self setAttributedText:v26];

  if (v25)
  {
    v27 = [MEMORY[0x263F82438] sharedApplication];
    [v27 openURL:v25 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 800, 1);
}

- (void)setTextStorage:(id)a3
{
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_getProperty(self, a2, 808, 1);
}

- (void)setLayoutManager:(id)a3
{
}

- (NSTextContainer)container
{
  return (NSTextContainer *)objc_getProperty(self, a2, 816, 1);
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end