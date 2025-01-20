@interface CSLPRFBackgroundAppRefreshCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CSLPRFBackgroundAppRefreshCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFBackgroundAppRefreshCell;
  id v4 = a3;
  [(CSLPRFBackgroundAppRefreshCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"GlobalBARStateKey", v7.receiver, v7.super_class);

  LODWORD(v4) = [v5 BOOLValue];
  if (v4)
  {
    v6 = [(CSLPRFBackgroundAppRefreshCell *)self control];
    [v6 setHidden:1];
  }
}

@end