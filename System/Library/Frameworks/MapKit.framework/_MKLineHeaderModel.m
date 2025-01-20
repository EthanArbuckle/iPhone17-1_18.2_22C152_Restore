@interface _MKLineHeaderModel
- (BOOL)shouldUseEmptyPlaceholder;
- (NSDictionary)fontAttribute;
- (UIView)ownerView;
- (_MKLineHeaderModel)init;
- (id)_placeCardHeaderSeparatorString;
- (id)colorProvider;
- (id)contentAttributedString;
- (id)description;
- (void)addToken:(id)a3;
- (void)insertToken:(id)a3 atIndex:(unint64_t)a4;
- (void)removeToken:(id)a3;
- (void)setColorProvider:(id)a3;
- (void)setFontAttribute:(id)a3;
- (void)setOwnerView:(id)a3;
- (void)setShouldUseEmptyPlaceholder:(BOOL)a3;
@end

@implementation _MKLineHeaderModel

- (_MKLineHeaderModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MKLineHeaderModel;
  v2 = [(_MKLineHeaderModel *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    tokens = v2->_tokens;
    v2->_tokens = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)colorProvider
{
  if (self->_colorProvider) {
    id colorProvider = self->_colorProvider;
  }
  else {
    id colorProvider = &__block_literal_global_62;
  }
  uint64_t v3 = (void *)MEMORY[0x18C139AE0](colorProvider, a2);

  return v3;
}

- (void)addToken:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_tokens, "addObject:");
  }
}

- (void)insertToken:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    unint64_t v7 = [(NSMutableArray *)self->_tokens count];
    id v6 = v8;
    if (v7 > a4)
    {
      [(NSMutableArray *)self->_tokens insertObject:v8 atIndex:a4];
      id v6 = v8;
    }
  }
}

- (void)removeToken:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](self->_tokens, "removeObject:");
  }
}

- (id)contentAttributedString
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v29 = (void *)[(NSDictionary *)self->_fontAttribute mutableCopy];
  id colorProvider = (void (**)(id, void *))self->_colorProvider;
  if (colorProvider)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerView);
    id v6 = objc_msgSend(WeakRetained, "mk_theme");
    unint64_t v7 = colorProvider[2](colorProvider, v6);
    [v29 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F42510]];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = self;
  obj = self->_tokens;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    uint64_t v11 = *MEMORY[0x1E4F42508];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v3 length] && (objc_msgSend(v13, "isEmpty") & 1) == 0)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
          v15 = [(_MKLineHeaderModel *)v8 _placeCardHeaderSeparatorString];
          v16 = (void *)[v14 initWithString:v15 attributes:v29];
          [v3 appendAttributedString:v16];
        }
        v17 = [v13 attributedString];
        v18 = (void *)[v17 mutableCopy];

        if (v18)
        {
          uint64_t v31 = 0;
          v32 = &v31;
          uint64_t v33 = 0x2020000000;
          char v34 = 1;
          uint64_t v19 = [v18 length];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __45___MKLineHeaderModel_contentAttributedString__block_invoke;
          v30[3] = &unk_1E54BBB90;
          v30[4] = &v31;
          objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v19, 0, v30);
          if (*((unsigned char *)v32 + 24))
          {
            fontAttribute = v8->_fontAttribute;
            if (fontAttribute) {
              objc_msgSend(v18, "addAttributes:range:", fontAttribute, 0, objc_msgSend(v18, "length"));
            }
          }
          _Block_object_dispose(&v31, 8);
        }
        else
        {
          v21 = [v13 string];
          BOOL v22 = [v21 length] == 0;

          if (v22)
          {
            v18 = 0;
          }
          else
          {
            id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
            v24 = [v13 string];
            v18 = (void *)[v23 initWithString:v24 attributes:v29];
          }
        }
        if ([v18 length]) {
          [v3 appendAttributedString:v18];
        }
      }
      uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  if (v8->_shouldUseEmptyPlaceholder && ![v3 length])
  {
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" " attributes:v29];

    id v3 = (id)v25;
  }
  v26 = (void *)[v3 copy];

  return v26;
}

- (id)_placeCardHeaderSeparatorString
{
  v2 = (__CFString *)_placeCardHeaderSeparatorString_separatorString;
  if (!_placeCardHeaderSeparatorString_separatorString)
  {
    v2 = @" · ";
    _placeCardHeaderSeparatorString_separatorString = @" · ";
  }

  return v2;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[&stru_1ED919588 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_tokens;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        [v3 appendFormat:@"%@\n", v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v10 = NSString;
  uint64_t v11 = [(_MKLineHeaderModel *)self contentAttributedString];
  v12 = [v10 stringWithFormat:@"%@\n%@", v11, v3, (void)v14];

  return v12;
}

- (UIView)ownerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerView);

  return (UIView *)WeakRetained;
}

- (void)setOwnerView:(id)a3
{
}

- (NSDictionary)fontAttribute
{
  return self->_fontAttribute;
}

- (void)setFontAttribute:(id)a3
{
}

- (void)setColorProvider:(id)a3
{
}

- (BOOL)shouldUseEmptyPlaceholder
{
  return self->_shouldUseEmptyPlaceholder;
}

- (void)setShouldUseEmptyPlaceholder:(BOOL)a3
{
  self->_shouldUseEmptyPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorProvider, 0);
  objc_storeStrong((id *)&self->_fontAttribute, 0);
  objc_destroyWeak((id *)&self->_ownerView);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end