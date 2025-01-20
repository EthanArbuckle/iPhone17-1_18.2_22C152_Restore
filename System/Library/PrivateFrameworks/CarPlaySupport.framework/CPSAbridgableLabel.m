@interface CPSAbridgableLabel
+ (id)sanitizedTextForText:(id)a3;
- (BOOL)useAttributedTextVariants;
- (CPSAbridgableLabel)init;
- (NSArray)attributedTextVariants;
- (NSArray)textVariants;
- (id)_variantsList;
- (id)sanitizedAttributedStringForString:(id)a3;
- (int64_t)_compareBoundsSizeToLayoutSizeForString:(id)a3;
- (unint64_t)_numberOfVariants;
- (unint64_t)variantsIndex;
- (void)_updateVariant;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTextVariants:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setText:(id)a3;
- (void)setTextVariants:(id)a3;
- (void)setUseAttributedTextVariants:(BOOL)a3;
- (void)setVariantsIndex:(unint64_t)a3;
@end

@implementation CPSAbridgableLabel

- (CPSAbridgableLabel)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSAbridgableLabel;
  v7 = [(CPSAbridgableLabel *)&v5 init];
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    id obj = (id)MEMORY[0x263EFFA68];
    objc_storeStrong((id *)&v7->_textVariants, MEMORY[0x263EFFA68]);
    objc_storeStrong((id *)&v7->_attributedTextVariants, obj);
    v7->_variantsIndex = 0;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

+ (id)sanitizedTextForText:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (dispatch_once_t *)&sanitizedTextForText__onceToken;
  id v10 = 0;
  objc_storeStrong(&v10, &__block_literal_global_3);
  if (*v11 != -1) {
    dispatch_once(v11, v10);
  }
  objc_storeStrong(&v10, 0);
  id v4 = location[0];
  id v5 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = (id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:");

  id v6 = (id)[v8 componentsSeparatedByCharactersInSet:sanitizedTextForText____disallowedCharacterSet];
  id v7 = (id)[v6 componentsJoinedByString:&stru_26DEE39C0];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v7;
}

void __43__CPSAbridgableLabel_sanitizedTextForText___block_invoke(void *a1)
{
  v7[2] = a1;
  v7[1] = a1;
  v7[0] = (id)objc_opt_new();
  id v3 = v7[0];
  id v4 = (id)[MEMORY[0x263F08708] illegalCharacterSet];
  objc_msgSend(v3, "formUnionWithCharacterSet:");

  id v5 = v7[0];
  id v6 = (id)[MEMORY[0x263F08708] newlineCharacterSet];
  objc_msgSend(v5, "formUnionWithCharacterSet:");

  uint64_t v1 = [v7[0] copy];
  v2 = (void *)sanitizedTextForText____disallowedCharacterSet;
  sanitizedTextForText____disallowedCharacterSet = v1;

  objc_storeStrong(v7, 0);
}

- (id)sanitizedAttributedStringForString:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(MEMORY[0x263F089B8]);
  id v13 = (id)[v3 initWithAttributedString:location[0]];
  id v7 = v13;
  uint64_t v4 = [v13 length];
  uint64_t v17 = 0;
  uint64_t v16 = v4;
  uint64_t v18 = 0;
  uint64_t v19 = v4;
  uint64_t v11 = 0;
  uint64_t v12 = v4;
  id v9 = v13;
  id v10 = v15;
  [v7 enumerateAttributesInRange:v11 options:v12 usingBlock:0];
  id v5 = objc_alloc(MEMORY[0x263F086A0]);
  id v8 = (id)[v5 initWithAttributedString:v13];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v8;
}

void __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&long long v19 = a3;
  *((void *)&v19 + 1) = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v17 = a5;
  uint64_t v16 = a1;
  id v7 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke_2;
  uint64_t v12 = &unk_2648A40A0;
  id v13 = a1[4];
  long long v15 = v19;
  id v14 = a1[5];
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:");
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v17 = 0;
  objc_storeStrong(&v17, a3);
  v16[2] = a4;
  v16[1] = (id)a1;
  if (([location[0] isEqualToString:*MEMORY[0x263F1C208]] & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16[0] = v17;
    id v4 = (id)[v16[0] image];
    BOOL v11 = v4 != 0;

    if (v11)
    {
      id v9 = (id)[v16[0] image];
      CGSizeMake_2();
      id v15 = (id)CPImageByScalingImageToSize();

      [v16[0] setImage:v15];
      id v10 = (id)[*(id *)(a1 + 40) font];
      [v10 capHeight];
      [v15 size];
      [v15 size];
      [v15 size];
      CGRectMake_0();
      objc_msgSend(v16[0], "setBounds:", v5, v6, v7, v8);

      objc_storeStrong(&v15, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", location[0], *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    objc_storeStrong(v16, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", location[0], *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setTextVariants:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15->_useAttributedTextVariants = 0;
  id v5 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  BOOL v11 = __38__CPSAbridgableLabel_setTextVariants___block_invoke;
  uint64_t v12 = &unk_2648A40F0;
  id v13 = v15;
  id v3 = (NSArray *)(id)objc_msgSend(v5, "cps_map:");
  textVariants = v15->_textVariants;
  v15->_textVariants = v3;

  double v6 = v15;
  id v7 = [(NSArray *)v15->_textVariants firstObject];
  -[CPSAbridgableLabel setText:](v6, "setText:");

  [(CPSAbridgableLabel *)v15 _updateVariant];
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

id __38__CPSAbridgableLabel_setTextVariants___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[(id)objc_opt_class() sanitizedTextForText:location[0]];
  objc_storeStrong(location, 0);

  return v3;
}

- (void)setAttributedTextVariants:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15->_useAttributedTextVariants = 1;
  id v5 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  BOOL v11 = __48__CPSAbridgableLabel_setAttributedTextVariants___block_invoke;
  uint64_t v12 = &unk_2648A4118;
  id v13 = v15;
  id v3 = (NSArray *)(id)objc_msgSend(v5, "cps_map:");
  attributedTextVariants = v15->_attributedTextVariants;
  v15->_attributedTextVariants = v3;

  double v6 = v15;
  id v7 = [(NSArray *)v15->_attributedTextVariants firstObject];
  -[CPSAbridgableLabel setAttributedText:](v6, "setAttributedText:");

  [(CPSAbridgableLabel *)v15 _updateVariant];
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

id __48__CPSAbridgableLabel_setAttributedTextVariants___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] sanitizedAttributedStringForString:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (void)setAttributedText:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSAbridgableLabel *)v6 sanitizedAttributedStringForString:location[0]];
  v3.receiver = v6;
  v3.super_class = (Class)CPSAbridgableLabel;
  [(CPSAbridgableLabel *)&v3 setAttributedText:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setText:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(id)objc_opt_class() sanitizedTextForText:location[0]];
  v3.receiver = v6;
  v3.super_class = (Class)CPSAbridgableLabel;
  [(CPSAbridgableLabel *)&v3 setText:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setFrame:(CGRect)a3
{
  CGRect v6 = a3;
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CPSAbridgableLabel *)v5 _updateVariant];
}

- (void)setBounds:(CGRect)a3
{
  CGRect v6 = a3;
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CPSAbridgableLabel *)v5 _updateVariant];
}

- (id)_variantsList
{
  if ([(CPSAbridgableLabel *)self useAttributedTextVariants]) {
    SEL v4 = self->_attributedTextVariants;
  }
  else {
    SEL v4 = self->_textVariants;
  }

  return v4;
}

- (unint64_t)_numberOfVariants
{
  id v3 = [(CPSAbridgableLabel *)self _variantsList];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)_updateVariant
{
  v27 = self;
  SEL v26 = a2;
  [(CPSAbridgableLabel *)self bounds];
  v25.origin.x = v2;
  v25.origin.y = v3;
  v25.size.width = v4;
  v25.size.height = v5;
  if (!CGRectEqualToRect(*MEMORY[0x263F001A8], v25))
  {
    char v22 = 0;
    char v20 = 0;
    if ([(CPSAbridgableLabel *)v27 useAttributedTextVariants])
    {
      id v23 = (id)[(CPSAbridgableLabel *)v27 attributedText];
      char v22 = 1;
      id v6 = v23;
    }
    else
    {
      id v21 = (id)[(CPSAbridgableLabel *)v27 text];
      char v20 = 1;
      id v6 = v21;
    }
    id location = v6;
    if (v20) {

    }
    if (v22) {
    id v19 = [(CPSAbridgableLabel *)v27 _variantsList];
    }
    if (v19)
    {
      unint64_t v17 = [v19 indexOfObject:location];
      if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v17 = 0;
      }
      unint64_t v16 = [(CPSAbridgableLabel *)v27 _numberOfVariants];
      if (v16 >= 2 && v17 < v16)
      {
        uint64_t v15 = [(CPSAbridgableLabel *)v27 _compareBoundsSizeToLayoutSizeForString:location];
        if (v15 == 1)
        {
          for (uint64_t i = 1; ; ++i)
          {
            unint64_t v9 = i;
            if (v9 > [(CPSAbridgableLabel *)v27 variantsIndex]) {
              break;
            }
            id v8 = v19;
            uint64_t v7 = [(CPSAbridgableLabel *)v27 variantsIndex];
            id obj = (id)[v8 objectAtIndex:v7 - i];
            uint64_t v12 = [(CPSAbridgableLabel *)v27 _compareBoundsSizeToLayoutSizeForString:obj];
            if (v12 == 1)
            {
              objc_storeStrong(&location, obj);
              v17 -= i;
              int v18 = 0;
            }
            else
            {
              int v18 = 2;
            }
            objc_storeStrong(&obj, 0);
            if (v18) {
              break;
            }
          }
        }
        else if (v15 == -1 && v17 + 1 < v16)
        {
          for (unint64_t j = v17 + 1; j < v16; ++j)
          {
            id v10 = (id)[v19 objectAtIndex:j];
            if ([(CPSAbridgableLabel *)v27 _compareBoundsSizeToLayoutSizeForString:v10] == 1)
            {
              objc_storeStrong(&location, v10);
              unint64_t v17 = j;
              int v18 = 5;
            }
            else
            {
              int v18 = 0;
            }
            objc_storeStrong(&v10, 0);
            if (v18) {
              break;
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CPSAbridgableLabel *)v27 setAttributedText:location];
        }
        else {
          [(CPSAbridgableLabel *)v27 setText:location];
        }
        [(CPSAbridgableLabel *)v27 setVariantsIndex:v17];
        int v18 = 0;
      }
      else
      {
        int v18 = 1;
      }
    }
    else
    {
      int v18 = 1;
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&location, 0);
  }
}

- (int64_t)_compareBoundsSizeToLayoutSizeForString:(id)a3
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSAbridgableLabel *)v31 bounds];
  v27[1] = v3;
  v27[2] = v4;
  *(void *)&long long v28 = v5;
  *((void *)&v28 + 1) = v6;
  long long v29 = v28;
  v27[0] = (id)[(CPSAbridgableLabel *)v31 font];
  uint64_t v7 = [(CPSAbridgableLabel *)v31 numberOfLines];
  BOOL v26 = v7 != 1;
  *(void *)&double v24 = v28;
  uint64_t v25 = 0x7FEFFFFFFFFFFFFFLL;
  if (v7 == 1) {
    double v24 = 1.79769313e308;
  }
  id v23 = objc_alloc_init(MEMORY[0x263F1C368]);
  [v23 setWrapsForTruncationMode:v26];
  if (v26) {
    uint64_t v16 = [(CPSAbridgableLabel *)v31 numberOfLines];
  }
  else {
    uint64_t v16 = 1;
  }
  [v23 setMaximumNumberOfLines:v16];
  objc_opt_class();
  char v19 = 0;
  char v17 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v15 = location[0];
    id v20 = (id)[(CPSAbridgableLabel *)v31 traitCollection];
    char v19 = 1;
    [v20 displayScale];
    double v21 = CPSSizeForAttributedText(v15, v23, v24, v8);
  }
  else
  {
    id v14 = location[0];
    id v18 = (id)[(CPSAbridgableLabel *)v31 traitCollection];
    char v17 = 1;
    [v18 displayScale];
    double v21 = CPSSizeForText(v14, v27[0], v23, v24, v10);
  }
  double v22 = v9;
  if (v17) {

  }
  if (v19) {
  if (v26)
  }
    double v13 = *((double *)&v29 + 1);
  else {
    double v13 = *(double *)&v29;
  }
  if (v26) {
    double v12 = v22;
  }
  else {
    double v12 = v21;
  }
  if (v13 >= v12) {
    int64_t v32 = v13 > v12;
  }
  else {
    int64_t v32 = -1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong(location, 0);
  return v32;
}

- (NSArray)textVariants
{
  return self->_textVariants;
}

- (NSArray)attributedTextVariants
{
  return self->_attributedTextVariants;
}

- (unint64_t)variantsIndex
{
  return self->_variantsIndex;
}

- (void)setVariantsIndex:(unint64_t)a3
{
  self->_variantsIndex = a3;
}

- (BOOL)useAttributedTextVariants
{
  return self->_useAttributedTextVariants;
}

- (void)setUseAttributedTextVariants:(BOOL)a3
{
  self->_useAttributedTextVariants = a3;
}

- (void).cxx_destruct
{
}

@end