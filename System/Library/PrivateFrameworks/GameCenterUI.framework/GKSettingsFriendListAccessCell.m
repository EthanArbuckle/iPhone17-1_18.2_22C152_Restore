@interface GKSettingsFriendListAccessCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (GKGame)currentGame;
- (GKGameSettingsInternal)currentGameSettings;
- (void)controlChanged:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setCurrentGame:(id)a3;
- (void)setCurrentGameSettings:(id)a3;
@end

@implementation GKSettingsFriendListAccessCell

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)GKSettingsFriendListAccessCell;
  [(PSSwitchTableCell *)&v29 layoutSubviews];
  v3 = [(GKSettingsFriendListAccessCell *)self contentView];
  [v3 frame];
  double v5 = (v4 + -29.0) * 0.5;
  v6 = [(GKSettingsFriendListAccessCell *)self imageView];
  objc_msgSend(v6, "setFrame:", 16.0, v5, 29.0, 29.0);

  v7 = [(GKSettingsFriendListAccessCell *)self getSwitch];
  [v7 frame];
  double v9 = v8;

  v10 = [(GKSettingsFriendListAccessCell *)self imageView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  v15 = [(GKSettingsFriendListAccessCell *)self textLabel];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  double v20 = v12 + v14 + 16.0;
  double v21 = v9 - v20 + -16.0;
  v22 = [(GKSettingsFriendListAccessCell *)self textLabel];
  objc_msgSend(v22, "setFrame:", v20, v17, v21, v19);

  v23 = [(GKSettingsFriendListAccessCell *)self detailTextLabel];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  v28 = [(GKSettingsFriendListAccessCell *)self detailTextLabel];
  objc_msgSend(v28, "setFrame:", v20, v25, v21, v27);

  -[GKSettingsFriendListAccessCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 60.0, 0.0, 0.0);
}

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  [(GKSettingsFriendListAccessCell *)self setTag:6];
  double v5 = [v4 propertyForKey:@"specifier.GKGame"];
  [(GKSettingsFriendListAccessCell *)self setCurrentGame:v5];
  v6 = [v4 propertyForKey:@"specifier.GKGameSettings"];
  [(GKSettingsFriendListAccessCell *)self setCurrentGameSettings:v6];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  double v26 = __67__GKSettingsFriendListAccessCell_refreshCellContentsWithSpecifier___block_invoke;
  double v27 = &unk_1E5F66960;
  id v7 = v4;
  id v28 = v7;
  objc_super v29 = self;
  id v8 = (id)[v5 loadIconForStyle:10 withCompletionHandler:&v24];
  double v9 = [(GKSettingsFriendListAccessCell *)self detailTextLabel];
  v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v9 setTextColor:v10];

  double v11 = [(GKSettingsFriendListAccessCell *)self textLabel];
  double v12 = [v5 name];
  [v11 setText:v12];

  double v13 = [v5 internal];
  double v14 = [v13 compatiblePlatforms];

  v15 = [MEMORY[0x1E4F636F8] currentPlatformServerString];
  char v16 = [v14 containsObject:v15];

  if ((v16 & 1) == 0)
  {
    double v17 = [(GKSettingsFriendListAccessCell *)self detailTextLabel];
    double v18 = (void *)MEMORY[0x1E4F636F0];
    double v19 = [v14 allObjects];
    double v20 = [v19 firstObject];
    double v21 = [v18 platformDisplayString:v20];
    [v17 setText:v21];
  }
  v22 = [(GKSettingsFriendListAccessCell *)self getSwitch];
  v23 = [(GKSettingsFriendListAccessCell *)self currentGameSettings];
  objc_msgSend(v22, "setOn:", objc_msgSend(v23, "allowFriendListAccess") == 2);
}

id *__67__GKSettingsFriendListAccessCell_refreshCellContentsWithSpecifier___block_invoke(id *result, uint64_t a2)
{
  if (a2)
  {
    v2 = result;
    [result[4] setProperty:a2 forKey:*MEMORY[0x1E4F93190]];
    id v3 = v2[4];
    v4.receiver = v2[5];
    v4.super_class = (Class)GKSettingsFriendListAccessCell;
    return (id *)objc_msgSendSuper2(&v4, sel_refreshCellContentsWithSpecifier_, v3);
  }
  return result;
}

- (void)controlChanged:(id)a3
{
  int v4 = [a3 isOn];
  double v5 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v6 = *MEMORY[0x1E4F633C0];
  id v7 = [(GKSettingsFriendListAccessCell *)self currentGameSettings];
  id v8 = [v7 bundleID];
  [v5 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:v6 bundleID:v8];

  double v9 = @"denied";
  if (v4) {
    double v9 = @"allowed";
  }
  v10 = v9;
  double v11 = [(GKSettingsFriendListAccessCell *)self getSwitch];
  double v12 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  double v13 = [v12 gameServicePrivate];
  double v14 = [(GKSettingsFriendListAccessCell *)self currentGameSettings];
  v15 = [v14 bundleID];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__GKSettingsFriendListAccessCell_controlChanged___block_invoke;
  v17[3] = &unk_1E5F65930;
  id v18 = v11;
  char v19 = v4;
  id v16 = v11;
  [v13 submitFriendListAccess:v15 value:v10 handler:v17];
}

uint64_t __49__GKSettingsFriendListAccessCell_controlChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v2 = *(unsigned char *)(a1 + 40) == 0;
  }
  else {
    BOOL v2 = *(unsigned char *)(a1 + 40) != 0;
  }
  return [*(id *)(a1 + 32) setOn:v2];
}

- (BOOL)canReload
{
  return 1;
}

- (GKGame)currentGame
{
  return self->_currentGame;
}

- (void)setCurrentGame:(id)a3
{
}

- (GKGameSettingsInternal)currentGameSettings
{
  return self->_currentGameSettings;
}

- (void)setCurrentGameSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGameSettings, 0);

  objc_storeStrong((id *)&self->_currentGame, 0);
}

@end