@interface AFUIInputTraits
+ (id)_traitsWithObject:(id)a3;
+ (id)_traitsWithRTITraits:(id)a3;
+ (id)_traitsWithTITraits:(id)a3;
+ (id)_traitsWithUITraits:(id)a3;
+ (id)traitsByAdoptingTraits:(id)a3;
- (BOOL)displaySecureTextUsingPlainText;
- (BOOL)isSecureTextEntry;
- (NSString)textContentType;
- (TITextInputTraits)traits;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)autocorrectionType;
- (unint64_t)keyboardType;
- (unint64_t)returnKeyType;
- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3;
@end

@implementation AFUIInputTraits

- (unint64_t)autocorrectionType
{
  return [(TITextInputTraits *)self->_traits autocorrectionType];
}

- (unint64_t)keyboardType
{
  return [(TITextInputTraits *)self->_traits keyboardType];
}

- (unint64_t)returnKeyType
{
  return [(TITextInputTraits *)self->_traits returnKeyType];
}

- (BOOL)isSecureTextEntry
{
  return [(TITextInputTraits *)self->_traits secureTextEntry];
}

- (NSString)textContentType
{
  return (NSString *)[(TITextInputTraits *)self->_traits textContentType];
}

+ (id)_traitsWithTITraits:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

+ (id)_traitsWithRTITraits:(id)a3
{
  id v4 = [a3 textInputTraits];
  v5 = [a1 _traitsWithTITraits:v4];

  return v5;
}

+ (id)_traitsWithUITraits:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    v5 = [MEMORY[0x263F7E6D8] traitsForUITextInputTraits:v4];
    v6 = [a1 _traitsWithTITraits:v5];
    objc_msgSend(v6, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "displaySecureTextUsingPlainText"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_traitsWithObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7E6D8]);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setAutocorrectionType:", objc_msgSend(v4, "autocorrectionType"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v4, "keyboardType"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setReturnKeyType:", objc_msgSend(v4, "returnKeyType"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));
  }
  _AFUISecureTextFieldClass();
  if (objc_opt_isKindOfClass()) {
    [v5 setSecureTextEntry:1];
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [v4 textContentType];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setTextContentType:v6];
    }
  }
  v7 = [a1 _traitsWithTITraits:v5];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "displaySecureTextUsingPlainText"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", objc_msgSend(v4, "_bulletCharacter") == 1);
  }

  return v7;
}

+ (id)traitsByAdoptingTraits:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = (id *)[v4 copy];
  }
  else {
    id v5 = 0;
  }
  if (!_AFUITraitsClass()) {
    goto LABEL_16;
  }
  if ([v4 conformsToProtocol:&unk_26FCE1438])
  {
    uint64_t v6 = [v4 extendedTextInputTraits];
LABEL_13:
    v7 = (void *)v6;

    id v4 = v7;
    goto LABEL_14;
  }
  if ([v4 conformsToProtocol:&unk_26FCE1CD8])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v4 extendedTraitsDelegate];
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v6 = [v4 textInputTraits];
    goto LABEL_13;
  }
  if [v4 conformsToProtocol:&unk_26FCE2320] && (objc_opt_respondsToSelector()) {
    goto LABEL_12;
  }
LABEL_14:
  _AFUITraitsClass();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [a1 _traitsWithUITraits:v4];

    id v5 = (id *)v8;
  }
LABEL_16:
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [a1 _traitsWithRTITraits:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [a1 _traitsWithTITraits:v4];
      }
      else {
      uint64_t v9 = [a1 _traitsWithObject:v4];
      }
    }
    id v5 = (id *)v9;
  }
  if ([v5 isSecureTextEntry]
    && ([v5 displaySecureTextUsingPlainText] & 1) == 0)
  {
    [v5[2] setAutocorrectionType:1];
  }
  if ([v5 keyboardType] == 10) {
    [v5[2] setReturnKeyType:1];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(TITextInputTraits *)self->_traits copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 8) = self->_displaySecureTextUsingPlainText;
  return (id)v4;
}

- (TITextInputTraits)traits
{
  return self->_traits;
}

- (BOOL)displaySecureTextUsingPlainText
{
  return self->_displaySecureTextUsingPlainText;
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  self->_displaySecureTextUsingPlainText = a3;
}

- (void).cxx_destruct
{
}

@end