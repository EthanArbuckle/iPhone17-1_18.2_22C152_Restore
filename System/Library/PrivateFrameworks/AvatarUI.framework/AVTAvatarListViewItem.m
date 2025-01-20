@interface AVTAvatarListViewItem
- (AVTAvatarListViewItem)initWithView:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UIView)view;
- (unint64_t)hash;
- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5;
- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4;
@end

@implementation AVTAvatarListViewItem

- (AVTAvatarListViewItem)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarListViewItem;
  v6 = [(AVTAvatarListViewItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, AVTAvatarListViewItem *))a5 + 2))(a5, self);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
    }
    id v5 = [v4 view];
    v6 = [(AVTAvatarListViewItem *)self view];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AVTAvatarListViewItem *)self view];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
}

@end