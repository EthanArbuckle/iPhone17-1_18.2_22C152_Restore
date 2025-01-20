@interface DMCPayloadDetailsCell
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (NSString)copyableText;
- (UIEditMenuInteraction)editMenuInteraction;
- (UILongPressGestureRecognizer)longPress;
- (void)_addCopyEditMenuAction;
- (void)_didLongPress:(id)a3;
- (void)copy:(id)a3;
- (void)setCopyableText:(id)a3;
- (void)setDetail:(id)a3 value:(id)a4;
- (void)setEditMenuInteraction:(id)a3;
- (void)setLongPress:(id)a3;
@end

@implementation DMCPayloadDetailsCell

- (void)setDetail:(id)a3 value:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(DMCPayloadDetailsCell *)self setSelectionStyle:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [MEMORY[0x263F1C780] valueCellConfiguration];
    id v9 = v7;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [MEMORY[0x263F1C780] valueCellConfiguration];
      v10 = objc_opt_new();
      [v10 setDateStyle:1];
      [v10 setTimeStyle:2];
      v11 = [MEMORY[0x263EFF960] currentLocale];
      [v10 setLocale:v11];

      v12 = [v10 stringFromDate:v7];

      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [MEMORY[0x263F1C780] cellConfiguration];
      id v9 = [v7 componentsJoinedByString:@"\n"];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v14 = [MEMORY[0x263F1C780] cellConfiguration];
      v8 = v14;
      if ((isKindOfClass & 1) == 0)
      {
        [v14 setSecondaryText:0];
        [v8 setText:v6];
        v12 = 0;
        goto LABEL_13;
      }
      id v9 = [v7 DMCProfileHexString];
    }
  }
  v12 = v9;
LABEL_10:
  [v8 setText:v6];
  if (!v12)
  {
LABEL_13:
    id v19 = v6;
    goto LABEL_14;
  }
  id v15 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v20 = *MEMORY[0x263F81500];
  v16 = [MEMORY[0x263F1C550] DMCProfileSecondaryLabelColor];
  v21[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v18 = (void *)[v15 initWithString:v12 attributes:v17];
  [v8 setSecondaryAttributedText:v18];

  id v19 = v12;
LABEL_14:
  [(DMCPayloadDetailsCell *)self setCopyableText:v19];
  [(DMCPayloadDetailsCell *)self _addCopyEditMenuAction];
  [(DMCPayloadDetailsCell *)self setContentConfiguration:v8];
}

- (void)_addCopyEditMenuAction
{
  if (!self->_editMenuInteraction)
  {
    v3 = (UIEditMenuInteraction *)[objc_alloc(MEMORY[0x263F1C620]) initWithDelegate:self];
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = v3;
    v5 = v3;

    [(DMCPayloadDetailsCell *)self addInteraction:v5];
  }
  if (!self->_longPress)
  {
    id v6 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__didLongPress_];
    longPress = self->_longPress;
    self->_longPress = v6;
  }
  v8 = [(DMCPayloadDetailsCell *)self gestureRecognizers];
  char v9 = [v8 containsObject:self->_longPress];

  if ((v9 & 1) == 0)
  {
    v10 = self->_longPress;
    [(DMCPayloadDetailsCell *)self addGestureRecognizer:v10];
  }
}

- (void)_didLongPress:(id)a3
{
  [(DMCPayloadDetailsCell *)self center];
  objc_msgSend(MEMORY[0x263F1C618], "configurationWithIdentifier:sourcePoint:", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v4];
}

- (void)copy:(id)a3
{
  id v4 = [(DMCPayloadDetailsCell *)self copyableText];
  v3 = [MEMORY[0x263F1C840] generalPasteboard];
  [v3 setString:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ != a3) {
    return 0;
  }
  v5 = [(DMCPayloadDetailsCell *)self copyableText];
  BOOL v4 = v5 != 0;

  return v4;
}

- (NSString)copyableText
{
  return self->_copyableText;
}

- (void)setCopyableText:(id)a3
{
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (void)setLongPress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_copyableText, 0);
}

@end