@interface CNPropertyPhoneNumberEditingCell
- ($2F1B37ED1B693547D8B5125E586513E6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4;
- (CNPropertyPhoneNumberEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)previousValue;
- (void)setPreviousValue:(id)a3;
@end

@implementation CNPropertyPhoneNumberEditingCell

- (void).cxx_destruct
{
}

- (void)setPreviousValue:(id)a3
{
}

- (NSArray)previousValue
{
  return self->_previousValue;
}

- ($2F1B37ED1B693547D8B5125E586513E6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 hasPrefix:@"tel:"])
  {
    v6 = [v5 substringFromIndex:objc_msgSend(@"tel:", "length")];

    id v5 = [v6 stringByRemovingPercentEncoding];
  }
  v7 = [MEMORY[0x1E4F5A498] defaultCountryCode];
  v8 = [(NSArray *)self->_previousValue firstObject];
  v9 = (void *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();

  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  v11 = (void *)v10;
  if (v10)
  {
    v16[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(CNPropertyPhoneNumberEditingCell *)self setPreviousValue:v12];

    id v13 = [(CNPropertyPhoneNumberEditingCell *)self previousValue];
  }
  else
  {
    id v13 = 0;
  }

  v14 = v13;
  unint64_t v15 = 0;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (CNPropertyPhoneNumberEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPhoneNumberEditingCell;
  v4 = [(CNPropertyEditingCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = [(CNPropertySimpleEditingCell *)v4 textField];
  v6 = [v5 textInputTraits];
  [v6 setContentsIsSingleValue:1];

  v7 = [(CNPropertySimpleEditingCell *)v4 textField];
  [v7 setTextSuggestionDelegate:v4];

  return v4;
}

@end