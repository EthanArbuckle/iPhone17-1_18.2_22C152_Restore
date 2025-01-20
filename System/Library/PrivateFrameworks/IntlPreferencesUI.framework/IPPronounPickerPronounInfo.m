@interface IPPronounPickerPronounInfo
- (BOOL)hasErrorMessage;
- (BOOL)hasValidValue;
- (BOOL)hasValue;
- (BOOL)textWasEnteredByUser;
- (IPPronounPickerPronounInfo)initWithExampleText:(id)a3 examplePlaceholder:(id)a4 morphology:(id)a5 language:(id)a6;
- (NSMorphology)morphology;
- (NSString)examplePlaceholder;
- (NSString)exampleText;
- (NSString)language;
- (NSString)validationErrorMessage;
- (NSString)value;
- (UILabel)exampleLabel;
- (UITextField)entryField;
- (id)generateExampleLabelText;
- (void)autofillValue:(id)a3;
- (void)entryFieldContentDidChange:(id)a3 validator:(id)a4 userEntered:(BOOL)a5;
- (void)setEntryField:(id)a3;
- (void)setExampleLabel:(id)a3;
- (void)setExamplePlaceholder:(id)a3;
- (void)setExampleText:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMorphology:(id)a3;
- (void)setTextWasEnteredByUser:(BOOL)a3;
- (void)setValidationErrorMessage:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation IPPronounPickerPronounInfo

- (IPPronounPickerPronounInfo)initWithExampleText:(id)a3 examplePlaceholder:(id)a4 morphology:(id)a5 language:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IPPronounPickerPronounInfo;
  v14 = [(IPPronounPickerPronounInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(IPPronounPickerPronounInfo *)v14 setExampleText:v10];
    [(IPPronounPickerPronounInfo *)v15 setExamplePlaceholder:v11];
    [(IPPronounPickerPronounInfo *)v15 setMorphology:v12];
    [(IPPronounPickerPronounInfo *)v15 setLanguage:v13];
  }

  return v15;
}

- (UITextField)entryField
{
  v21[1] = *MEMORY[0x263EF8340];
  entryField = self->_entryField;
  if (!entryField)
  {
    v4 = [IPLanguageSelectingEntryField alloc];
    v5 = -[IPLanguageSelectingEntryField initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_entryField;
    self->_entryField = v5;

    v7 = [(IPPronounPickerPronounInfo *)self language];
    [(UITextField *)self->_entryField setLanguage:v7];

    v8 = (void *)MEMORY[0x263F086E0];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizations];
    id v11 = [(IPPronounPickerPronounInfo *)self language];
    v21[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    id v13 = [v8 preferredLocalizationsFromArray:v10 forPreferences:v12];
    v14 = [v13 firstObject];

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"Pronoun" value:0 table:@"PronounPicker" localization:v14];
    [(UITextField *)self->_entryField setPlaceholder:v16];

    objc_super v17 = (void *)MEMORY[0x263EFF960];
    v18 = [(IPPronounPickerPronounInfo *)self language];
    -[UITextField setTextAlignment:](self->_entryField, "setTextAlignment:", 2 * ([v17 characterDirectionForLanguage:v18] == 2));

    [(UITextField *)self->_entryField setClearButtonMode:0];
    [(UITextField *)self->_entryField setAutocapitalizationType:0];
    [(UITextField *)self->_entryField setAutocorrectionType:1];
    [(UITextField *)self->_entryField setSpellCheckingType:1];
    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UITextField *)self->_entryField setFont:v19];

    [(UITextField *)self->_entryField setAdjustsFontForContentSizeCategory:1];
    entryField = self->_entryField;
  }

  return entryField;
}

- (UILabel)exampleLabel
{
  exampleLabel = self->_exampleLabel;
  if (!exampleLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_exampleLabel;
    self->_exampleLabel = v4;

    [(UILabel *)self->_exampleLabel setNumberOfLines:0];
    v6 = (void *)MEMORY[0x263EFF960];
    v7 = [(IPPronounPickerPronounInfo *)self language];
    -[UILabel setTextAlignment:](self->_exampleLabel, "setTextAlignment:", 2 * ([v6 characterDirectionForLanguage:v7] == 2));

    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    [(UILabel *)self->_exampleLabel setFont:v8];

    [(UILabel *)self->_exampleLabel setAdjustsFontForContentSizeCategory:1];
    v9 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)self->_exampleLabel setTextColor:v9];

    [(UILabel *)self->_exampleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    exampleLabel = self->_exampleLabel;
  }

  return exampleLabel;
}

- (BOOL)hasValue
{
  v3 = [(IPPronounPickerPronounInfo *)self value];
  if (v3)
  {
    v4 = [(IPPronounPickerPronounInfo *)self value];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasErrorMessage
{
  v3 = [(IPPronounPickerPronounInfo *)self validationErrorMessage];
  if (v3)
  {
    v4 = [(IPPronounPickerPronounInfo *)self validationErrorMessage];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasValidValue
{
  BOOL v3 = [(IPPronounPickerPronounInfo *)self hasValue];
  if (v3) {
    LOBYTE(v3) = ![(IPPronounPickerPronounInfo *)self hasErrorMessage];
  }
  return v3;
}

- (void)entryFieldContentDidChange:(id)a3 validator:(id)a4 userEntered:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  id v8 = a4;
  [(IPPronounPickerPronounInfo *)self setValue:0];
  [(IPPronounPickerPronounInfo *)self setValidationErrorMessage:0];
  [(IPPronounPickerPronounInfo *)self setTextWasEnteredByUser:v5];
  if (v17 && [v17 length])
  {
    if ([v8 pronounIsValidLength:v17])
    {
      if ([v8 pronounHasValidChars:v17])
      {
        [(IPPronounPickerPronounInfo *)self setValue:v17];
      }
      else
      {
        id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v14 = [v13 localizedStringForKey:@"Pronouns cannot include special characters." value:&stru_26F10C080 table:@"PronounPicker"];
        [(IPPronounPickerPronounInfo *)self setValidationErrorMessage:v14];
      }
    }
    else
    {
      v9 = NSString;
      id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v11 = [v10 localizedStringForKey:@"Pronouns cannot exceed %ld characters." value:&stru_26F10C080 table:@"PronounPicker"];
      id v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v8, "maxPronounLength"));
      [(IPPronounPickerPronounInfo *)self setValidationErrorMessage:v12];
    }
  }
  v15 = [(IPPronounPickerPronounInfo *)self generateExampleLabelText];
  v16 = [(IPPronounPickerPronounInfo *)self exampleLabel];
  [v16 setAttributedText:v15];
}

- (void)autofillValue:(id)a3
{
  id v4 = a3;
  [(IPPronounPickerPronounInfo *)self setTextWasEnteredByUser:0];
  [(IPPronounPickerPronounInfo *)self setValue:v4];
  [(IPPronounPickerPronounInfo *)self setValidationErrorMessage:0];
  BOOL v5 = [(IPPronounPickerPronounInfo *)self entryField];
  [v5 setText:v4];

  id v7 = [(IPPronounPickerPronounInfo *)self generateExampleLabelText];
  v6 = [(IPPronounPickerPronounInfo *)self exampleLabel];
  [v6 setAttributedText:v7];
}

- (id)generateExampleLabelText
{
  v24[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(IPPronounPickerPronounInfo *)self validationErrorMessage];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F086A0]);
    BOOL v5 = [(IPPronounPickerPronounInfo *)self validationErrorMessage];
    uint64_t v23 = *MEMORY[0x263F81500];
    v6 = [MEMORY[0x263F1C550] systemRedColor];
    v24[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v8 = (void *)[v4 initWithString:v5 attributes:v7];
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    id v10 = [(IPPronounPickerPronounInfo *)self exampleText];
    v6 = (void *)[v9 initWithString:v10];

    uint64_t v11 = *MEMORY[0x263F815F8];
    v22[0] = &unk_26F10D510;
    uint64_t v12 = *MEMORY[0x263F814F0];
    v21[0] = v11;
    v21[1] = v12;
    id v13 = (void *)MEMORY[0x263F81708];
    [v5 pointSize];
    v14 = objc_msgSend(v13, "systemFontOfSize:weight:");
    v22[1] = v14;
    id v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    if ([(IPPronounPickerPronounInfo *)self hasValue]) {
      [(IPPronounPickerPronounInfo *)self value];
    }
    else {
    v15 = [(IPPronounPickerPronounInfo *)self examplePlaceholder];
    }
    v16 = [(IPPronounPickerPronounInfo *)self exampleText];
    int v17 = [v16 hasPrefix:@"%@"];

    if (v17)
    {
      uint64_t v18 = [v15 localizedCapitalizedString];

      v15 = (void *)v18;
    }
    v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v15 attributes:v7];
    id v8 = objc_msgSend(MEMORY[0x263F086A0], "localizedAttributedStringWithFormat:", v6, v19);
  }

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)validationErrorMessage
{
  return self->_validationErrorMessage;
}

- (void)setValidationErrorMessage:(id)a3
{
}

- (void)setEntryField:(id)a3
{
}

- (void)setExampleLabel:(id)a3
{
}

- (NSString)exampleText
{
  return self->_exampleText;
}

- (void)setExampleText:(id)a3
{
}

- (NSString)examplePlaceholder
{
  return self->_examplePlaceholder;
}

- (void)setExamplePlaceholder:(id)a3
{
}

- (NSMorphology)morphology
{
  return self->_morphology;
}

- (void)setMorphology:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)textWasEnteredByUser
{
  return self->_textWasEnteredByUser;
}

- (void)setTextWasEnteredByUser:(BOOL)a3
{
  self->_textWasEnteredByUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_examplePlaceholder, 0);
  objc_storeStrong((id *)&self->_exampleText, 0);
  objc_storeStrong((id *)&self->_exampleLabel, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_validationErrorMessage, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end