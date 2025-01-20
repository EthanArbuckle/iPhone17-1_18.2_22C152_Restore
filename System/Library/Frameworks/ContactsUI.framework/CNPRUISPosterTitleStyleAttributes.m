@interface CNPRUISPosterTitleStyleAttributes
+ (id)attributesForCNConfiguration:(id)a3;
+ (id)attributesFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CNPRUISPosterTitleStyleAttributes)initWithPosterTitleStyleAttributes:(id)a3;
- (PRUISPosterTitleStyleAttributes)wrappedPosterTitleStyleAttributes;
- (id)titleColor;
- (id)titleFont;
- (unint64_t)preferredTitleAlignment;
- (unint64_t)preferredTitleLayout;
@end

@implementation CNPRUISPosterTitleStyleAttributes

- (void).cxx_destruct
{
}

- (PRUISPosterTitleStyleAttributes)wrappedPosterTitleStyleAttributes
{
  return self->_wrappedPosterTitleStyleAttributes;
}

- (unint64_t)preferredTitleAlignment
{
  return [(PRUISPosterTitleStyleAttributes *)self->_wrappedPosterTitleStyleAttributes preferredTitleAlignment];
}

- (unint64_t)preferredTitleLayout
{
  return [(PRUISPosterTitleStyleAttributes *)self->_wrappedPosterTitleStyleAttributes preferredTitleLayout];
}

- (id)titleFont
{
  v2 = [(PRUISPosterTitleStyleAttributes *)self->_wrappedPosterTitleStyleAttributes titleFont];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  v5 = v4;

  return v5;
}

- (id)titleColor
{
  v2 = [(PRUISPosterTitleStyleAttributes *)self->_wrappedPosterTitleStyleAttributes titleColor];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v5 = v4;

  return v5;
}

- (CNPRUISPosterTitleStyleAttributes)initWithPosterTitleStyleAttributes:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPRUISPosterTitleStyleAttributes;
  v6 = [(CNPRUISPosterTitleStyleAttributes *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wrappedPosterTitleStyleAttributes, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    v8 = (void *)MEMORY[0x1E4F5A3E0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke;
    v27[3] = &unk_1E549BCB0;
    v27[4] = self;
    id v28 = v7;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_2;
    aBlock[3] = &unk_1E549BCB0;
    aBlock[4] = self;
    id v9 = v28;
    id v26 = v9;
    objc_super v10 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_3;
    v23[3] = &unk_1E549BCB0;
    v23[4] = self;
    id v11 = v9;
    id v24 = v11;
    v12 = _Block_copy(v23);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_4;
    v20 = &unk_1E549BCB0;
    v21 = self;
    id v22 = v11;
    id v13 = v11;
    v14 = _Block_copy(&v17);
    char v15 = objc_msgSend(v8, "isObject:equalToOther:withBlocks:", self, v13, v27, v10, v12, v14, 0, v17, v18, v19, v20, v21);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

uint64_t __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) titleColor];
  v3 = [*(id *)(a1 + 40) titleColor];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) titleFont];
  v3 = [*(id *)(a1 + 40) titleFont];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

BOOL __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preferredTitleLayout];
  return v2 == [*(id *)(a1 + 40) preferredTitleLayout];
}

BOOL __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preferredTitleAlignment];
  return v2 == [*(id *)(a1 + 40) preferredTitleAlignment];
}

+ (id)attributesForCNConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = +[CNPRUISPosterConfigurationUtilities titleStyleAttributesForCNConfiguration:a3 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    id v5 = CNUILogPosters();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      objc_super v10 = v7;
      _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch attributes for configuration: %@", buf, 0xCu);
    }
  }

  return v3;
}

+ (id)attributesFromData:(id)a3 error:(id *)a4
{
  id v5 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", a3);
  if (v5)
  {
    v6 = +[CNPRUISPosterConfigurationUtilities titleStyleAttributesForCNConfiguration:v5 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end