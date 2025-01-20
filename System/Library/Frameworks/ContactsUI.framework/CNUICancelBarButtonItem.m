@interface CNUICancelBarButtonItem
- (CNUICancelBarButtonItem)initWithDidTapHandler:(id)a3;
- (id)didTapHandler;
- (void)didTap:(id)a3;
@end

@implementation CNUICancelBarButtonItem

- (void).cxx_destruct
{
}

- (id)didTapHandler
{
  return self->_didTapHandler;
}

- (void)didTap:(id)a3
{
  v4 = [(CNUICancelBarButtonItem *)self didTapHandler];

  if (v4)
  {
    v5 = [(CNUICancelBarButtonItem *)self didTapHandler];
    v5[2]();
  }
}

- (CNUICancelBarButtonItem)initWithDidTapHandler:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNUICancelBarButtonItem;
  v5 = [(UIBarItem *)&v12 init];
  if (v5)
  {
    v6 = CNContactsUIBundle();
    v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNUICancelBarButtonItem *)v5 setTitle:v7];

    [(CNUICancelBarButtonItem *)v5 setStyle:2];
    [(CNUICancelBarButtonItem *)v5 setTarget:v5];
    [(CNUICancelBarButtonItem *)v5 setAction:sel_didTap_];
    v8 = _Block_copy(v4);
    id didTapHandler = v5->_didTapHandler;
    v5->_id didTapHandler = v8;

    v10 = v5;
  }

  return v5;
}

@end