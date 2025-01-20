@interface CNTestQuickActionView
- (BOOL)enabled;
- (CNTestQuickActionView)init;
- (NSMutableArray)statesAssigned;
- (NSMutableArray)titlesAssigned;
- (NSString)title;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNTestQuickActionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statesAssigned, 0);
  objc_storeStrong((id *)&self->_titlesAssigned, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSMutableArray)statesAssigned
{
  return self->_statesAssigned;
}

- (NSMutableArray)titlesAssigned
{
  return self->_titlesAssigned;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)title
{
  return self->_title;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionControllerTestUtilities.m" lineNumber:39 description:@"-[CNTestQuickActionView setEnabled:] should only be called on the main thread"];
  }
  self->_enabled = v3;
  id v8 = [(CNTestQuickActionView *)self statesAssigned];
  v6 = [NSNumber numberWithBool:v3];
  [v8 addObject:v6];
}

- (void)setTitle:(id)a3
{
  v5 = (NSString *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CNContactQuickActionControllerTestUtilities.m" lineNumber:31 description:@"-[CNTestQuickActionView setTitle:] should only be called on the main thread"];
  }
  title = self->_title;
  self->_title = v5;
  v7 = v5;

  id v9 = [(CNTestQuickActionView *)self titlesAssigned];
  [v9 addObject:v7];
}

- (CNTestQuickActionView)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNTestQuickActionView;
  v2 = [(CNTestQuickActionView *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    titlesAssigned = v2->_titlesAssigned;
    v2->_titlesAssigned = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    statesAssigned = v2->_statesAssigned;
    v2->_statesAssigned = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

@end