@interface AAUIAccountContactsSpecifierCreator
- (id)createAddTableCellWithTitle:(id)a3 loadAction:(SEL)a4 target:(id)a5;
- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8;
- (id)createSubtitleTableCellWithName:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6;
- (id)createTableCellForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5;
- (id)createTableCellWithName:(id)a3 title:(id)a4 longSubtitle:(id)a5 image:(id)a6;
@end

@implementation AAUIAccountContactsSpecifierCreator

- (id)createSubtitleTableCellWithName:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v10 = a6;
  v11 = (void *)MEMORY[0x263F5FC40];
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v14 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v14 setProperty:v13 forKey:*MEMORY[0x263F602D0]];

  [v14 setProperty:v12 forKey:*MEMORY[0x263F602C8]];
  if (v10) {
    [v14 setProperty:v10 forKey:*MEMORY[0x263F60140]];
  }

  return v14;
}

- (id)createTableCellWithName:(id)a3 title:(id)a4 longSubtitle:(id)a5 image:(id)a6
{
  id v10 = a6;
  v11 = (void *)MEMORY[0x263F5FC40];
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v14 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v14 setProperty:v13 forKey:*MEMORY[0x263F602D0]];

  [v14 setProperty:v12 forKey:*MEMORY[0x263F602C8]];
  if (v10) {
    [v14 setProperty:v10 forKey:*MEMORY[0x263F60140]];
  }

  return v14;
}

- (id)createTableCellForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 displayName];
  v11 = [v7 preferenceSpecifierNamed:v10 target:v8 set:0 get:0 detail:0 cell:2 edit:0];

  id v12 = [v9 displayName];
  [v11 setProperty:v12 forKey:*MEMORY[0x263F602D0]];

  id v13 = [v9 detailsText];
  [v11 setProperty:v13 forKey:*MEMORY[0x263F602C8]];

  v14 = +[AAUITrustedContactsImageProvider imageForLocalContact:v9];
  [v11 setProperty:v14 forKey:*MEMORY[0x263F60140]];

  [v11 setControllerLoadAction:a4];
  [v11 setUserInfo:v9];

  return v11;
}

- (id)createAddTableCellWithTitle:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:a5 set:0 get:0 detail:0 cell:13 edit:0];
  v7 = +[AAUITrustedContactsImageProvider addContactImage];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60140]];

  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  [v6 setIdentifier:@"AddTableCell"];
  [v6 setButtonAction:a4];
  return v6;
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  id v13 = NSString;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  v19 = [v13 stringWithFormat:@"%@ %@", a5, v16];
  v20 = [MEMORY[0x263F5FC40] groupSpecifierWithID:v18 name:v17];

  [v20 setProperty:v19 forKey:*MEMORY[0x263F600F8]];
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v20 setProperty:v22 forKey:*MEMORY[0x263F600C0]];

  [v20 setProperty:v19 forKey:*MEMORY[0x263F600E8]];
  NSUInteger v23 = [v19 rangeOfString:v16];
  NSUInteger v25 = v24;

  v30.location = v23;
  v30.length = v25;
  v26 = NSStringFromRange(v30);
  [v20 setProperty:v26 forKey:*MEMORY[0x263F600D0]];

  v27 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v14];

  [v20 setProperty:v27 forKey:*MEMORY[0x263F600E0]];
  [v20 setProperty:v15 forKey:*MEMORY[0x263F600C8]];

  return v20;
}

@end