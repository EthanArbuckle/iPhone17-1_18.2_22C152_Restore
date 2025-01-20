@interface RMDeviceIDCell
+ (id)specifierWithTitle:(id)a3 value:(id)a4;
- (RMDeviceIDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation RMDeviceIDCell

+ (id)specifierWithTitle:(id)a3 value:(id)a4
{
  v5 = (void *)MEMORY[0x263F5FC40];
  id v6 = a4;
  v7 = [v5 preferenceSpecifierNamed:a3 target:0 set:0 get:0 detail:0 cell:4 edit:0];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v7 setProperty:&unk_26D44B118 forKey:*MEMORY[0x263F602A8]];
  [v7 setProperty:v6 forKey:@"RMDeviceIDValueKey"];

  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
  return v7;
}

- (RMDeviceIDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RMDeviceIDCell;
  v8 = [(PSTableCell *)&v18 initWithStyle:3 reuseIdentifier:a4 specifier:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(PSTableCell *)v8 titleLabel];
    v11 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v10 setFont:v11];

    v12 = [(PSTableCell *)v9 valueLabel];
    v13 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    [v12 setFont:v13];

    v14 = [(PSTableCell *)v9 valueLabel];
    v15 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [v14 setColor:v15];
  }
  v16 = [v7 propertyForKey:@"RMDeviceIDValueKey"];
  [(PSTableCell *)v9 setValue:v16];

  return v9;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)RMDeviceIDCell;
  [(PSTableCell *)&v19 layoutSubviews];
  v3 = [(PSTableCell *)self titleLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [(PSTableCell *)self valueLabel];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(RMDeviceIDCell *)self bounds];
  double v18 = round((v17 - (v9 + v16 + 2.0)) * 0.5);
  objc_msgSend(v3, "setFrame:", v5, v18, v7, v9);
  objc_msgSend(v10, "setFrame:", v12, v9 + v18 + 2.0, v14, v16);
}

@end