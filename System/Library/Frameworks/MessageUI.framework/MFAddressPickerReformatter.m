@interface MFAddressPickerReformatter
- (BOOL)_attemptUniquingDisplayedStringsUsingBlock:(id)a3;
- (BOOL)_reformattedAddressesByDisplayedStringsAreUnique:(id)a3;
- (id)_reformattedAddressesByDisplayedStrings;
- (id)_saveMiddleTruncationRanges;
- (id)reformattedAddressAtIndex:(unint64_t)a3;
- (id)reformattedAddressStringAtIndex:(unint64_t)a3;
- (unint64_t)_defaultOptions;
- (unint64_t)numberOfReformattedAddresses;
- (void)_attemptUniquingDisplayedStrings;
- (void)_determineFontSize:(BOOL *)a3;
- (void)_expandAllLocalParts;
- (void)_invalidateReformattedAddresses;
- (void)_restoreMiddleTruncationRanges:(id)a3;
- (void)_truncateIdenticalLocalPartsWithDifferentDomainParts;
- (void)_truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:(unint64_t)a3 options:(unint64_t)a4;
- (void)_updateReformattedAddressesIfNecessary;
- (void)setAddresses:(id)a3;
- (void)setAttributesDisabled:(BOOL)a3;
- (void)setFontSize:(double)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMinimumFontSize:(double)a3 maximumFontSize:(double)a4;
@end

@implementation MFAddressPickerReformatter

- (void)setAddresses:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_addresses] & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    addresses = self->_addresses;
    self->_addresses = v4;

    [(MFAddressPickerReformatter *)self _invalidateReformattedAddresses];
  }
}

- (void)setMaximumWidth:(double)a3
{
  if (self->_maximumWidth != a3)
  {
    self->_maximumWidth = a3;
    [(MFAddressPickerReformatter *)self _invalidateReformattedAddresses];
  }
}

- (void)setAttributesDisabled:(BOOL)a3
{
  if (self->_attributesDisabled != a3)
  {
    self->_attributesDisabled = a3;
    [(MFAddressPickerReformatter *)self _invalidateReformattedAddresses];
  }
}

- (void)setFontSize:(double)a3
{
}

- (void)setMinimumFontSize:(double)a3 maximumFontSize:(double)a4
{
  if (self->_minimumFontSize != a3 || self->_maximumFontSize != a4)
  {
    self->_minimumFontSize = a3;
    self->_maximumFontSize = a4;
    [(MFAddressPickerReformatter *)self _invalidateReformattedAddresses];
  }
}

- (unint64_t)numberOfReformattedAddresses
{
  return [(NSArray *)self->_addresses count];
}

- (id)reformattedAddressAtIndex:(unint64_t)a3
{
  [(MFAddressPickerReformatter *)self _updateReformattedAddressesIfNecessary];
  v5 = [(NSArray *)self->_reformattedAddresses objectAtIndex:a3];
  id v6 = objc_msgSend(v5, "attributedStringWithFontSize:maximumWidth:options:", -[MFAddressPickerReformatter _defaultOptions](self, "_defaultOptions"), self->_fontSize, self->_maximumWidth);

  return v6;
}

- (id)reformattedAddressStringAtIndex:(unint64_t)a3
{
  v3 = [(MFAddressPickerReformatter *)self reformattedAddressAtIndex:a3];
  v4 = [v3 string];

  return v4;
}

- (unint64_t)_defaultOptions
{
  return self->_attributesDisabled;
}

- (void)_invalidateReformattedAddresses
{
  reformattedAddresses = self->_reformattedAddresses;
  self->_reformattedAddresses = 0;
}

- (void)_updateReformattedAddressesIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_reformattedAddresses = &self->_reformattedAddresses;
  if (!self->_reformattedAddresses)
  {
    if (self->_attributesDisabled && self->_minimumFontSize != self->_maximumFontSize)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"MFAddressPickerReformatter.m" lineNumber:115 description:@"Single font size required with attributes disabled"];
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_addresses, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_addresses;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [[MFReformattedAddress alloc] initWithAddress:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          [v4 addObject:v9];
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    objc_storeStrong((id *)p_reformattedAddresses, v4);
    char v12 = 0;
    [(MFAddressPickerReformatter *)self _determineFontSize:&v12];
    if (v12) {
      [(MFAddressPickerReformatter *)self _truncateIdenticalLocalPartsWithDifferentDomainParts];
    }
    [(MFAddressPickerReformatter *)self _attemptUniquingDisplayedStrings];
  }
}

- (void)_determineFontSize:(BOOL *)a3
{
  double minimumFontSize = self->_minimumFontSize;
  double maximumFontSize = self->_maximumFontSize;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MFAddressPickerReformatter__determineFontSize___block_invoke;
  v9[3] = &unk_1E5F790D8;
  v9[4] = self;
  uint64_t v7 = MFLastIndexInRangePassingTest((unint64_t)(minimumFontSize + -1.0), (unint64_t)maximumFontSize, v9);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || minimumFontSize > (double)(unint64_t)v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    double minimumFontSize = (double)(unint64_t)v7;
  }
  self->_fontSize = minimumFontSize;
  if (a3) {
    *a3 = v8;
  }
}

uint64_t __49__MFAddressPickerReformatter__determineFontSize___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 32), "_defaultOptions", (void)v11) | 2, (double)a2, *(double *)(*(void *)(a1 + 32) + 24));
        if (v8 > *(double *)(*(void *)(a1 + 32) + 24))
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

- (void)_truncateIdenticalLocalPartsWithDifferentDomainParts
{
  unint64_t v3 = [(MFAddressPickerReformatter *)self _defaultOptions] | 1;

  [(MFAddressPickerReformatter *)self _truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:0 options:v3];
}

- (void)_truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_reformattedAddresses;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = [v10 localPart];
        long long v12 = [v5 objectForKey:v11];
        if (!v12)
        {
          long long v12 = [MEMORY[0x1E4F1CA80] set];
          [v5 setObject:v12 forKey:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke;
  v15[3] = &unk_1E5F79150;
  v15[4] = self;
  v15[5] = a4;
  v15[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
}

void __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if ((unint64_t)[v8 count] >= 2)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_2;
    v30[3] = &unk_1E5F79100;
    uint64_t v9 = a1[5];
    v30[4] = a1[4];
    v30[5] = v9;
    v10 = objc_msgSend(v8, "mf_objectWithHighest:", v30);
    uint64_t v11 = [v7 length];
    if (v11 - a1[6] <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = v11 - a1[6];
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_3;
    v26[3] = &unk_1E5F79128;
    id v13 = v10;
    uint64_t v14 = a1[4];
    id v27 = v13;
    uint64_t v28 = v14;
    unint64_t v29 = v12;
    uint64_t v15 = MFLastIndexInRangePassingTest(2uLL, v12, v26);
    uint64_t v16 = v15;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v17 = v12 - v15) == 0)
    {
      objc_msgSend(v13, "setMiddleTruncationRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v18 = v8;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "setMiddleTruncationRange:", v16, v17, (void)v22);
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v19);
      }
    }
  }
}

uint64_t __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 widthWithFontSize:*(void *)(a1 + 40) | 2 maximumWidth:*(double *)(*(void *)(a1 + 32) + 48) options:1.79769313e308];
}

BOOL __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setMiddleTruncationRange:", a2, *(void *)(a1 + 48) - a2);
  objc_msgSend(*(id *)(a1 + 32), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 40), "_defaultOptions") | 3, *(double *)(*(void *)(a1 + 40) + 48), *(double *)(*(void *)(a1 + 40) + 24));
  return v3 <= *(double *)(*(void *)(a1 + 40) + 24);
}

- (void)_attemptUniquingDisplayedStrings
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 1;
  do
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke;
    v6[3] = &unk_1E5F79178;
    v6[4] = self;
    v6[5] = v4++;
  }
  while ([(MFAddressPickerReformatter *)self _attemptUniquingDisplayedStringsUsingBlock:v6]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke_2;
  v5[3] = &unk_1E5F79088;
  v5[4] = self;
  [(MFAddressPickerReformatter *)self _attemptUniquingDisplayedStringsUsingBlock:v5];
}

uint64_t __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [v1 _defaultOptions];

  return [v1 _truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:v2 options:v3];
}

uint64_t __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _expandAllLocalParts];
}

- (BOOL)_attemptUniquingDisplayedStringsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = [(MFAddressPickerReformatter *)self _reformattedAddressesByDisplayedStrings];
  if ([(MFAddressPickerReformatter *)self _reformattedAddressesByDisplayedStringsAreUnique:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [(MFAddressPickerReformatter *)self _saveMiddleTruncationRanges];
    v4[2](v4);
    id v8 = [(MFAddressPickerReformatter *)self _reformattedAddressesByDisplayedStrings];
    unint64_t v9 = [v8 count];
    BOOL v6 = v9 > [v5 count];
    if (!v6) {
      [(MFAddressPickerReformatter *)self _restoreMiddleTruncationRanges:v7];
    }
  }
  return v6;
}

- (id)_reformattedAddressesByDisplayedStrings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_reformattedAddresses = &self->_reformattedAddresses;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *p_reformattedAddresses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "attributedStringWithFontSize:maximumWidth:options:", -[MFAddressPickerReformatter _defaultOptions](self, "_defaultOptions", (void)v14), self->_fontSize, self->_maximumWidth);
        uint64_t v11 = [v10 string];

        unint64_t v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          unint64_t v12 = [MEMORY[0x1E4F1CA80] set];
          [v4 setObject:v12 forKey:v11];
        }
        [v12 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_expandAllLocalParts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_reformattedAddresses;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v8 = [v7 middleTruncationRange];
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          uint64_t v11 = v8 + v9;
          v13[1] = 3221225472;
          v13[2] = __50__MFAddressPickerReformatter__expandAllLocalParts__block_invoke;
          v13[3] = &unk_1E5F791A0;
          v13[6] = v8;
          v13[7] = v9;
          v13[4] = v7;
          v13[5] = self;
          uint64_t v12 = MFLastIndexInRangePassingTest(v8, v8 + v9, v13);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend(v7, "setMiddleTruncationRange:", v12, v11 - v12);
          }
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

BOOL __50__MFAddressPickerReformatter__expandAllLocalParts__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setMiddleTruncationRange:", a2, *(void *)(a1 + 48) - a2 + *(void *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 40), "_defaultOptions") | 2, *(double *)(*(void *)(a1 + 40) + 48), *(double *)(*(void *)(a1 + 40) + 24));
  return v3 <= *(double *)(*(void *)(a1 + 40) + 24);
}

- (BOOL)_reformattedAddressesByDisplayedStringsAreUnique:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__MFAddressPickerReformatter__reformattedAddressesByDisplayedStringsAreUnique___block_invoke;
  v5[3] = &unk_1E5F791C8;
  v5[4] = &v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __79__MFAddressPickerReformatter__reformattedAddressesByDisplayedStringsAreUnique___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  unint64_t result = [a3 count];
  if (result >= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)_saveMiddleTruncationRanges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_reformattedAddresses = &self->_reformattedAddresses;
  char v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = *p_reformattedAddresses;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v17.location = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "middleTruncationRange", (void)v10);
        uint64_t v8 = NSStringFromRange(v17);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)_restoreMiddleTruncationRanges:(id)a3
{
  id v4 = a3;
  reformattedAddresses = self->_reformattedAddresses;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MFAddressPickerReformatter__restoreMiddleTruncationRanges___block_invoke;
  v7[3] = &unk_1E5F791F0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)reformattedAddresses enumerateObjectsUsingBlock:v7];
}

void __61__MFAddressPickerReformatter__restoreMiddleTruncationRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  NSRange v6 = NSRangeFromString(v5);
  objc_msgSend(v7, "setMiddleTruncationRange:", v6.location, v6.length);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reformattedAddresses, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

@end