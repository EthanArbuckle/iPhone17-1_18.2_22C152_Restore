@interface IKAppKeyboardHint
- (IKAppKeyboardHint)initWithBadge:(id)a3 text:(id)a4 searchTerm:(id)a5;
- (NSString)badge;
- (NSString)searchTerm;
- (NSString)text;
@end

@implementation IKAppKeyboardHint

- (IKAppKeyboardHint)initWithBadge:(id)a3 text:(id)a4 searchTerm:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppKeyboardHint;
  v11 = [(IKAppKeyboardHint *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    badge = v11->_badge;
    v11->_badge = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    text = v11->_text;
    v11->_text = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    searchTerm = v11->_searchTerm;
    v11->_searchTerm = (NSString *)v16;
  }
  return v11;
}

- (NSString)badge
{
  return self->_badge;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end