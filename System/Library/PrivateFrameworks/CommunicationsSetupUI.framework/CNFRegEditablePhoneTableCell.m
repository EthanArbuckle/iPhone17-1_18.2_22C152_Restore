@interface CNFRegEditablePhoneTableCell
- ($DD3A1F8A2207B362078E6A88C433B5B6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4;
- (CNFRegEditablePhoneTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)countryCode;
- (void)dealloc;
- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5;
@end

@implementation CNFRegEditablePhoneTableCell

- (CNFRegEditablePhoneTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNFRegEditablePhoneTableCell;
  v4 = [(CNFRegEditablePhoneTableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(-[PSEditableTableCell textField](v4, "textField"), "setTextSuggestionDelegate:", v4);
    objc_msgSend((id)objc_msgSend(-[PSEditableTableCell textField](v5, "textField"), "textInputTraits"), "setContentsIsSingleValue:", 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend(-[PSEditableTableCell textField](self, "textField"), "setTextSuggestionDelegate:", 0);

  self->_previousValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEditablePhoneTableCell;
  [(CNFRegEditableTableCell *)&v3 dealloc];
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CNFRegEditablePhoneTableCell;
  -[CNFRegEditableTableCell setValueChangedTarget:action:specifier:](&v10, sel_setValueChangedTarget_action_specifier_, a3, a4);
  objc_super v7 = (NSString *)[a5 propertyForKey:@"cnf-phoneFieldCountryCodeSelector"];
  if (v7)
  {
    SEL v8 = NSSelectorFromString(v7);
    if (v8)
    {
      v9 = v8;
      if (objc_opt_respondsToSelector()) {
        self->_countryCodeSelector = v9;
      }
    }
  }
}

- (id)countryCode
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD60]);
  if (!v3
    || (SEL countryCodeSelector = self->_countryCodeSelector) == 0
    || (v5 = (void *)[v3 performSelector:countryCodeSelector]) == 0)
  {
    v6 = (void *)[MEMORY[0x263EFF960] currentLocale];
    v5 = (void *)[v6 objectForKey:*MEMORY[0x263EFF4D0]];
  }
  return (id)[v5 lowercaseString];
}

- ($DD3A1F8A2207B362078E6A88C433B5B6)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  [(CNFRegEditablePhoneTableCell *)self countryCode];
  v5 = (void *)_PNCopyFormattedNumberSuggestionForDigitsWithCountry();
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];
    previousValue = self->_previousValue;
    self->_previousValue = (NSString *)[v5 copy];
  }
  else
  {
    uint64_t v6 = 0;
  }

  SEL v8 = (void *)v6;
  unint64_t v9 = 0;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

@end