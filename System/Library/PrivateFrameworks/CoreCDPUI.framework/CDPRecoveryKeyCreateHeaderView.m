@interface CDPRecoveryKeyCreateHeaderView
- (CDPRecoveryKeyCreateHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
@end

@implementation CDPRecoveryKeyCreateHeaderView

- (CDPRecoveryKeyCreateHeaderView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CDPRecoveryKeyCreateHeaderView;
  v5 = [(PSKeychainSyncHeaderView *)&v26 initWithSpecifier:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (int)*MEMORY[0x263F5FD78];
    v8 = *(Class *)((char *)&v5->super.super.super.super.isa + v7);
    v9 = [MEMORY[0x263F825C8] _labelColor];
    [v8 setTextColor:v9];

    uint64_t v10 = (int)*MEMORY[0x263F5FD70];
    v11 = *(Class *)((char *)&v6->super.super.super.super.isa + v10);
    v12 = [MEMORY[0x263F825C8] _labelColor];
    [v11 setTextColor:v12];

    v13 = *(Class *)((char *)&v6->super.super.super.super.isa + v7);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v14 = (void *)getBFFStyleClass_softClass_0;
    uint64_t v31 = getBFFStyleClass_softClass_0;
    if (!getBFFStyleClass_softClass_0)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __getBFFStyleClass_block_invoke_0;
      v27[3] = &unk_26433D708;
      v27[4] = &v28;
      __getBFFStyleClass_block_invoke_0((uint64_t)v27);
      v14 = (void *)v29[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v28, 8);
    v16 = [v15 sharedStyle];
    v17 = [v16 headerTitleFont];
    [v13 setFont:v17];

    v18 = *(Class *)((char *)&v6->super.super.super.super.isa + v10);
    v19 = (void *)MEMORY[0x263F81708];
    uint64_t v20 = *MEMORY[0x263F83570];
    v21 = [MEMORY[0x263F82B60] mainScreen];
    v22 = [v21 traitCollection];
    v23 = [v19 preferredFontForTextStyle:v20 compatibleWithTraitCollection:v22];
    [v18 setFont:v23];

    [*(id *)((char *)&v6->super.super.super.super.isa + v7) setTextAlignment:1];
    v24 = [MEMORY[0x263F825C8] _systemBackgroundColor];
    [(CDPRecoveryKeyCreateHeaderView *)v6 setBackgroundColor:v24];
  }
  return v6;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CDPRecoveryKeyCreateHeaderView;
  [(PSKeychainSyncHeaderView *)&v5 preferredHeightForWidth:a4 inTableView:a3];
  if (result < 150.0) {
    return 150.0;
  }
  return result;
}

@end