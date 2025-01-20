@interface GKSettingsGlobalFriendListAccessCell
- (BOOL)canReload;
- (BOOL)globalFriendListAccess;
- (PSSpecifier)specfier;
- (void)controlChanged:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setSpecfier:(id)a3;
@end

@implementation GKSettingsGlobalFriendListAccessCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  [(GKSettingsGlobalFriendListAccessCell *)self setTag:6];
  v5 = [(GKSettingsGlobalFriendListAccessCell *)self textLabel];
  v6 = GKGameCenterUIFrameworkBundle();
  v7 = GKGetLocalizedStringFromTableInBundle();
  [v5 setText:v7];

  [(PSTableCell *)self setSpecifier:v4];
  id v9 = [(GKSettingsGlobalFriendListAccessCell *)self getSwitch];
  objc_msgSend(v9, "setOn:", -[GKSettingsGlobalFriendListAccessCell globalFriendListAccess](self, "globalFriendListAccess"));
  v8 = [MEMORY[0x1E4F637E8] shared];
  objc_msgSend(v9, "setEnabled:", objc_msgSend(v8, "isFriendsSharingRestricted") ^ 1);
}

- (void)controlChanged:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isOn];
  v6 = [MEMORY[0x1E4F637F8] reporter];
  [v6 reportEvent:@"com.apple.GameKit.PlayerProfileDashboard" type:*MEMORY[0x1E4F633B8]];

  [(PSSwitchTableCell *)self setLoading:1];
  v7 = [(GKSettingsGlobalFriendListAccessCell *)self getSwitch];
  objc_initWeak(&location, self);
  int v8 = [v7 isOn];
  id v9 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v10 = [v9 profileServicePrivate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__GKSettingsGlobalFriendListAccessCell_controlChanged___block_invoke;
  v12[3] = &unk_1E5F66988;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  char v16 = v5;
  int v15 = v8 ^ 1;
  [v10 setGlobalFriendListAccess:v8 ^ 1u handler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__GKSettingsGlobalFriendListAccessCell_controlChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLoading:0];

  if (a2) {
    BOOL v6 = *(unsigned char *)(a1 + 52) == 0;
  }
  else {
    BOOL v6 = *(unsigned char *)(a1 + 52) != 0;
  }
  [*(id *)(a1 + 32) setOn:v6];
  uint64_t v7 = *(unsigned int *)(a1 + 48);
  int v8 = [MEMORY[0x1E4F63760] local];
  id v9 = [v8 internal];
  [v9 setGlobalFriendListAccess:v7];

  id v12 = objc_loadWeakRetained(v4);
  v10 = [v12 specifier];
  id v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
  [v10 performSetterWithValue:v11];
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)globalFriendListAccess
{
  v2 = [MEMORY[0x1E4F637E8] shared];
  char v3 = [v2 isFriendsSharingRestricted];

  if (v3) {
    return 0;
  }
  char v5 = [MEMORY[0x1E4F63760] local];
  BOOL v6 = [v5 internal];
  BOOL v4 = [v6 globalFriendListAccess] == 0;

  return v4;
}

- (PSSpecifier)specfier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specfier);

  return (PSSpecifier *)WeakRetained;
}

- (void)setSpecfier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end