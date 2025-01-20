@interface CLMPlaylistEntryViewCell
- (CLMPlaylistEntryViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation CLMPlaylistEntryViewCell

- (CLMPlaylistEntryViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CLMPlaylistEntryViewCell;
  v9 = [(CLMPlaylistEntryViewCell *)&v27 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = +[CLMUtilities playlistEntryForSpecifier:v8];
    v11 = +[CLMInterfaceHelper makePlaylistRowCellContentForPlaylistEntry:v10];
    v12 = [v11 contentConfiguration];

    [(CLMPlaylistEntryViewCell *)v9 setContentConfiguration:v12];
    v13 = [(CLMPlaylistEntryViewCell *)v9 _tableView];
    [v13 contentInset];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(CLMPlaylistEntryViewCell *)v9 traitCollection];
    +[CLMInterfaceHelper separatorInsetsWith:traitCollection:](_TtC22ClarityUIMusicSettings18CLMInterfaceHelper, "separatorInsetsWith:traitCollection:", v22, v15, v17, v19, v21);
    -[CLMPlaylistEntryViewCell setSeparatorInset:](v9, "setSeparatorInset:");

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_4314;
    v25[3] = &unk_10B30;
    id v26 = v10;
    id v23 = v10;
    [(CLMPlaylistEntryViewCell *)v9 setAccessibilityLabelBlock:v25];
  }
  return v9;
}

@end