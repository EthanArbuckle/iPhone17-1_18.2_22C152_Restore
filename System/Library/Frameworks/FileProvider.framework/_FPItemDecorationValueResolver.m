@interface _FPItemDecorationValueResolver
+ (id)resolverForItem:(id)a3 style:(unint64_t)a4;
- (_FPItemDecorationValueResolver)initWithItem:(id)a3 style:(unint64_t)a4;
- (id)_formatNameComponents:(id)a3;
- (id)fp_valueForKey:(id)a3;
- (id)fp_valueForKeyPath:(id)a3;
@end

@implementation _FPItemDecorationValueResolver

+ (id)resolverForItem:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithItem:v6 style:a4];

  return v7;
}

- (_FPItemDecorationValueResolver)initWithItem:(id)a3 style:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FPItemDecorationValueResolver;
  v8 = [(_FPItemDecorationValueResolver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_item, a3);
    v9->_style = a4;
  }

  return v9;
}

- (id)_formatNameComponents:(id)a3
{
  unint64_t v3 = self->_style - 1;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1A34E4770[v3];
  }
  return (id)[MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:a3 style:v4 options:0];
}

- (id)fp_valueForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"ownerNameComponents"] & 1) != 0
    || [v4 isEqualToString:@"mostRecentEditorNameComponents"])
  {
    if (self->_style) {
      goto LABEL_4;
    }
    id v7 = NSString;
    v8 = [v4 substringToIndex:1];
    v9 = [v8 capitalizedString];
    v10 = [v4 substringFromIndex:1];
    objc_super v11 = [v7 stringWithFormat:@"preformatted%@%@", v9, v10];

    v12 = [v11 substringToIndex:objc_msgSend(v11, "length") - objc_msgSend(@"Components", "length")];

    id v6 = [(FPItem *)self->_item valueForKey:v12];

    if (!v6)
    {
LABEL_4:
      v5 = [(FPItem *)self->_item valueForKey:v4];
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v6 = [(_FPItemDecorationValueResolver *)self _formatNameComponents:v5];
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    v13 = FPExtensionMatchingDictionaryForItem(self->_item, 0);
    id v6 = [v13 objectForKeyedSubscript:v4];
  }

  return v6;
}

- (id)fp_valueForKeyPath:(id)a3
{
  id v11 = 0;
  id v12 = 0;
  int v4 = objc_msgSend(a3, "fp_splitKeyPathInProperty:remainder:", &v12, &v11);
  id v5 = v12;
  id v6 = v11;
  id v7 = 0;
  if (v4)
  {
    v8 = [(_FPItemDecorationValueResolver *)self fp_valueForKey:v5];
    if (v8)
    {
      if (!v6) {
        goto LABEL_6;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = objc_msgSend(v8, "fp_valueForKeyPath:", v6);

        v8 = (void *)v9;
LABEL_6:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = [(_FPItemDecorationValueResolver *)self _formatNameComponents:v8];
        }
        else
        {
          id v7 = v8;
          v8 = v7;
        }
        goto LABEL_10;
      }
    }
    id v7 = 0;
LABEL_10:
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end