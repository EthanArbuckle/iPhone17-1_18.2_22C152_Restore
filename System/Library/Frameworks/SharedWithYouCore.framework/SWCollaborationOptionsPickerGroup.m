@interface SWCollaborationOptionsPickerGroup
+ (BOOL)supportsSecureCoding;
+ (SWCollaborationOptionsPickerGroup)allocWithZone:(_NSZone *)a3;
- (NSString)selectedOptionIdentifier;
- (SWCollaborationOptionsPickerGroup)initWithCoder:(id)a3;
- (SWCollaborationOptionsPickerGroup)initWithIdentifier:(id)a3 options:(id)a4;
- (id)_defaultSelectedOptionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSelectedOptionIdentifier:(NSString *)selectedOptionIdentifier;
@end

@implementation SWCollaborationOptionsPickerGroup

- (SWCollaborationOptionsPickerGroup)initWithIdentifier:(id)a3 options:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationOptionsPickerGroup;
  v4 = [(SWCollaborationOptionsGroup *)&v8 initWithIdentifier:a3 options:a4];
  v5 = v4;
  if (v4)
  {
    [(SWCollaborationOptionsGroup *)v4 setTitle:&stru_1ED99C438];
    [(SWCollaborationOptionsGroup *)v5 setFooter:&stru_1ED99C438];
    v6 = [(SWCollaborationOptionsPickerGroup *)v5 _defaultSelectedOptionIdentifier];
    [(SWCollaborationOptionsPickerGroup *)v5 setSelectedOptionIdentifier:v6];
  }
  return v5;
}

+ (SWCollaborationOptionsPickerGroup)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWCollaborationOptionsPickerGroup *)+[SWCollaborationOptionsGroup allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationOptionsPickerGroup;
    return (SWCollaborationOptionsPickerGroup *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)_defaultSelectedOptionIdentifier
{
  v2 = [(SWCollaborationOptionsGroup *)self options];
  v3 = [v2 firstObject];
  v4 = [v3 identifier];
  v5 = v4;
  if (!v4) {
    v4 = &stru_1ED99C438;
  }
  objc_super v6 = v4;

  return v6;
}

- (void)setOptions:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SWCollaborationOptionsPickerGroup;
  [(SWCollaborationOptionsGroup *)&v5 setOptions:a3];
  v4 = [(SWCollaborationOptionsPickerGroup *)self _defaultSelectedOptionIdentifier];
  [(SWCollaborationOptionsPickerGroup *)self setSelectedOptionIdentifier:v4];
}

- (void)setSelectedOptionIdentifier:(NSString *)selectedOptionIdentifier
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_super v5 = selectedOptionIdentifier;
  objc_super v6 = [(SWCollaborationOptionsPickerGroup *)self selectedOptionIdentifier];

  if (v6 != v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v7 = [(SWCollaborationOptionsGroup *)self options];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];

          if (v12 == v5)
          {

            objc_storeStrong((id *)&self->_selectedOptionIdentifier, selectedOptionIdentifier);
            self->_isUpdatingSelectionState = 1;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            v13 = [(SWCollaborationOptionsGroup *)self options];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v22;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v22 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  v18 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                  v19 = [v18 identifier];
                  BOOL v20 = v19 == v5;

                  [v18 setSelected:v20];
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              }
              while (v15);
            }

            self->_isUpdatingSelectionState = 0;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
LABEL_19:
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(SWCollaborationOptionsGroup *)self title];
  if (v3)
  {
    v4 = [(SWCollaborationOptionsGroup *)self title];
    objc_super v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    objc_super v5 = objc_opt_new();
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v6 = [(SWCollaborationOptionsGroup *)self options];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v5 length]) {
          [v5 appendString:@"\n"];
        }
        [v5 appendFormat:@"- %@", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = [(SWCollaborationOptionsGroup *)self footer];

  if (v12)
  {
    v13 = [(SWCollaborationOptionsGroup *)self footer];
    [v5 appendString:v13];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SWCollaborationOptionsPickerGroup;
  id v4 = [(SWCollaborationOptionsGroup *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    [v4 setSelectedOptionIdentifier:self->_selectedOptionIdentifier];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationOptionsPickerGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SWCollaborationOptionsPickerGroup;
  objc_super v5 = [(SWCollaborationOptionsGroup *)&v17 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedOption"];
    unint64_t v7 = [v6 unsignedIntegerValue];
    uint64_t v8 = [(SWCollaborationOptionsGroup *)v5 options];
    unint64_t v9 = [v8 count];

    if (v7 >= v9)
    {
      long long v15 = [(SWCollaborationOptionsPickerGroup *)v5 _defaultSelectedOptionIdentifier];
    }
    else
    {
      uint64_t v10 = [(SWCollaborationOptionsGroup *)v5 options];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v7];
      uint64_t v12 = [v11 identifier];
      v13 = (void *)v12;
      uint64_t v14 = &stru_1ED99C438;
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      long long v15 = v14;
    }
    [(SWCollaborationOptionsPickerGroup *)v5 setSelectedOptionIdentifier:v15];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SWCollaborationOptionsPickerGroup;
  [(SWCollaborationOptionsGroup *)&v18 encodeWithCoder:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v5 = [(SWCollaborationOptionsGroup *)self options];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v5);
      }
      unint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      uint64_t v10 = [v9 identifier];
      selectedOptionIdentifier = self->_selectedOptionIdentifier;

      if (v10 == selectedOptionIdentifier) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v6 = v9;

    if (v6)
    {
      uint64_t v12 = [(SWCollaborationOptionsGroup *)self options];
      uint64_t v13 = [v12 indexOfObject:v6];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_super v5 = [NSNumber numberWithUnsignedInteger:v13];
        [v4 encodeObject:v5 forKey:@"selectedOption"];
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
  }
}

- (NSString)selectedOptionIdentifier
{
  return self->_selectedOptionIdentifier;
}

- (void).cxx_destruct
{
}

@end