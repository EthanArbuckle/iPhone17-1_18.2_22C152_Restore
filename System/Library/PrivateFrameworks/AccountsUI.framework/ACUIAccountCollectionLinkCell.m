@interface ACUIAccountCollectionLinkCell
+ (id)specifierWithTitle:(id)a3 accounts:(id)a4;
- (ACUIAccountCollectionLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_detailTextForAccountSpecifiers:(id)a3;
- (void)layoutSubviews;
@end

@implementation ACUIAccountCollectionLinkCell

+ (id)specifierWithTitle:(id)a3 accounts:(id)a4
{
  id obj = a4;
  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  id v14 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = &v17;
  id v17 = 0;
  objc_storeStrong(&v17, obj);
  uint64_t v9 = MEMORY[0x1E4F92E70];
  id v8 = location[0];
  id v4 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:location[0] target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  v11 = &v16;
  id v16 = v4;
  id v10 = v4;
  [v4 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  [v16 setProperty:v17 forKey:@"ACUIAccountCollectionSpecifiers"];
  [v16 setProperty:location[0] forKey:@"ACUIAccountCollectionTitle"];
  id v15 = v16;
  objc_storeStrong(v11, v14);
  objc_storeStrong(v12, v14);
  objc_storeStrong(v13, v14);
  v5 = v15;
  return v5;
}

- (ACUIAccountCollectionLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v18 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  v5 = v18;
  v18 = 0;
  v15.receiver = v5;
  v15.super_class = (Class)ACUIAccountCollectionLinkCell;
  v13 = [(PSTableCell *)&v15 initWithStyle:3 reuseIdentifier:location[0] specifier:v16];
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);
  if (v13)
  {
    id v11 = [(PSTableCell *)v18 valueLabel];
    id v10 = (id)[MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    objc_msgSend(v11, "setFont:");
  }
  id v14 = (id)[v16 propertyForKey:@"ACUIAccountCollectionSpecifiers"];
  v7 = v18;
  id v8 = [(ACUIAccountCollectionLinkCell *)v18 _detailTextForAccountSpecifiers:v14];
  -[PSTableCell setValue:](v7, "setValue:");

  uint64_t v9 = v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v9;
}

- (id)_detailTextForAccountSpecifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v18 = (id)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v14)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v14;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v10);
      id v15 = (id)[v17 name];
      if (v15) {
        [v18 addObject:v15];
      }
      objc_storeStrong(&v15, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v4 = v18;
  id v7 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)[v7 localizedStringForKey:@"MIDDLE_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v6 = (id)objc_msgSend(v4, "componentsJoinedByString:");

  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)layoutSubviews
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)ACUIAccountCollectionLinkCell;
  [(PSTableCell *)&v17 layoutSubviews];
  id v16 = [(PSTableCell *)v19 titleLabel];
  [v16 frame];
  *(void *)&long long v14 = v2;
  *((void *)&v14 + 1) = v3;
  *(void *)&long long v15 = v4;
  *((void *)&v15 + 1) = v5;
  id v13 = [(PSTableCell *)v19 valueLabel];
  [v13 frame];
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  [(ACUIAccountCollectionLinkCell *)v19 bounds];
  *((void *)&v14 + 1) = CGRound_0((v9 - (*((double *)&v15 + 1) + v12 + 2.0)) / 2.0);
  objc_msgSend(v16, "setFrame:", v14, v15);
  objc_msgSend(v13, "setFrame:", v10, *((double *)&v14 + 1) + *((double *)&v15 + 1) + 2.0, v11, v12);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
}

@end