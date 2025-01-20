@interface UITableView(CKUtilities)
- (double)__ck_contentSize;
- (id)__ck_indexPathForLastRow;
@end

@implementation UITableView(CKUtilities)

- (id)__ck_indexPathForLastRow
{
  uint64_t v2 = [a1 numberOfSections];
  uint64_t v3 = [a1 numberOfRowsInSection:v2 - 1];
  v4 = 0;
  if (v2 >= 1 && v3 >= 1)
  {
    v4 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 - 1 inSection:v2 - 1];
  }

  return v4;
}

- (double)__ck_contentSize
{
  uint64_t v2 = objc_msgSend(a1, "__ck_indexPathForLastRow");
  if (v2)
  {
    uint64_t v3 = objc_msgSend(a1, "__ck_indexPathForLastRow");
    [a1 rectForRowAtIndexPath:v3];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;

    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    CGRectGetMaxY(v13);
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
  }

  return v9;
}

@end