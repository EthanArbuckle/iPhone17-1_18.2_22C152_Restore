@interface CNPhotoPickerActionButtonBlockHandler
- (CNPhotoPickerActionButtonBlockHandler)initWithActionBlock:(id)a3;
- (id)actionBlock;
- (void)performAction;
@end

@implementation CNPhotoPickerActionButtonBlockHandler

- (void).cxx_destruct
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)performAction
{
  v3 = [(CNPhotoPickerActionButtonBlockHandler *)self actionBlock];

  if (v3)
  {
    v4 = [(CNPhotoPickerActionButtonBlockHandler *)self actionBlock];
    v4[2]();
  }
}

- (CNPhotoPickerActionButtonBlockHandler)initWithActionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerActionButtonBlockHandler;
  v5 = [(CNPhotoPickerActionButtonBlockHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id actionBlock = v5->_actionBlock;
    v5->_id actionBlock = (id)v6;
  }
  return v5;
}

@end