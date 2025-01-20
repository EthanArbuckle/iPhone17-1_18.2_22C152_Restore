@interface BuddyMultilingualLanguageData
+ (id)languageShortFormat:(id)a3;
+ (id)withLanguage:(id)a3 defaults:(id)a4 editingOption:(unint64_t)a5;
+ (id)withLanguage:(id)a3 isDefault:(BOOL)a4 editingOption:(unint64_t)a5;
+ (id)withLanguageMainDisplayText:(id)a3 secondaryDisplayText:(id)a4 identifier:(id)a5 isDefault:(BOOL)a6 editingOption:(unint64_t)a7;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)showDetailText;
- (NSString)_identifier;
- (NSString)description;
- (NSString)displayText;
- (NSString)identifier;
- (NSString)secondaryDisplayText;
- (id)detailText;
- (id)title;
- (unint64_t)editingOptions;
- (unint64_t)hash;
- (void)setDisplayText:(id)a3;
- (void)setEditingOptions:(unint64_t)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setSecondaryDisplayText:(id)a3;
- (void)setShowDetailText:(BOOL)a3;
- (void)set_identifier:(id)a3;
@end

@implementation BuddyMultilingualLanguageData

+ (id)withLanguageMainDisplayText:(id)a3 secondaryDisplayText:(id)a4 identifier:(id)a5 isDefault:(BOOL)a6 editingOption:(unint64_t)a7
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  BOOL v17 = a6;
  unint64_t v16 = a7;
  id v15 = (id)objc_opt_new();
  id v11 = [location[0] copy];
  [v15 setDisplayText:v11];

  id v12 = [v19 copy];
  [v15 setSecondaryDisplayText:v12];

  [v15 setIsDefault:a6];
  [v15 setEditingOptions:v16];
  [v15 set_identifier:v18];
  [v15 setShowDetailText:1];
  id v13 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)withLanguage:(id)a3 isDefault:(BOOL)a4 editingOption:(unint64_t)a5
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  v9[1] = (id)a5;
  v9[0] = [v12 withLanguage:location[0] defaults:&__NSArray0__struct editingOption:a5];
  [v9[0] setIsDefault:a4];
  id v7 = v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)withLanguage:(id)a3 defaults:(id)a4 editingOption:(unint64_t)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  unint64_t v18 = a5;
  char v17 = [v19 containsObject:location[0]] & 1;
  id v16 = (id)objc_opt_new();
  id v7 = +[IPLanguage languageWithIdentifier:location[0]];
  id v15 = [(IPLanguage *)v7 localizedStringForName];

  id v8 = [v15 copy];
  [v16 setDisplayText:v8];

  id v9 = [location[0] copy];
  [v16 set_identifier:v9];

  [v16 setIsDefault:v17 & 1];
  [v16 setSecondaryDisplayText:0];
  id v10 = +[BuddyMultilingualDataModelProvider selectedLanguage];
  LOBYTE(a4) = [v10 isEqualToString:location[0]] ^ 1;

  if (a4)
  {
    id v11 = +[IPLanguage languageWithIdentifier:location[0]];
    id v12 = [(IPLanguage *)v11 name];
    [v16 setSecondaryDisplayText:v12];
  }
  [v16 setEditingOptions:v18, v15];
  [v16 setShowDetailText:1];
  id v13 = v16;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)languageShortFormat:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = +[NSLocale baseLanguageFromLanguage:location[0]];
  v3 = +[NSLocale currentLocale];
  id v4 = [(NSLocale *)v3 localizedStringForLanguage:v6 context:3];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = objc_retainBlock(&stru_1002B2CB8);
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyMultilingualDisplayableViewModel])
  {
    id v27 = location[0];
    v3 = [(BuddyMultilingualLanguageData *)v30 identifier];
    id v4 = (id)(*((uint64_t (**)(id, NSString *))v28 + 2))(v28, v3);
    id v5 = [v27 identifier];
    id v6 = (id)(*((uint64_t (**)(id, id))v28 + 2))(v28, v5);
    unsigned __int8 v7 = [v4 isEqual:v6];
    char v25 = 0;
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    char v17 = 0;
    char v15 = 0;
    char v13 = 0;
    char v11 = 0;
    unsigned __int8 v8 = 0;
    if (v7)
    {
      id v26 = [(BuddyMultilingualLanguageData *)v30 title];
      char v25 = 1;
      id v24 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
      char v23 = 1;
      id v22 = [v27 title];
      char v21 = 1;
      id v20 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
      char v19 = 1;
      unsigned __int8 v9 = [v24 isEqual:];
      unsigned __int8 v8 = 0;
      if (v9)
      {
        id v18 = [(BuddyMultilingualLanguageData *)v30 detailText];
        char v17 = 1;
        id v16 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
        char v15 = 1;
        id v14 = [v27 detailText];
        char v13 = 1;
        id v12 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
        char v11 = 1;
        unsigned __int8 v8 = [v16 isEqual:];
      }
    }
    char v31 = v8 & 1;
    if (v11) {

    }
    if (v13) {
    if (v15)
    }

    if (v17) {
    if (v19)
    }

    if (v21) {
    if (v23)
    }

    if (v25) {
    objc_storeStrong(&v27, 0);
    }
  }
  else
  {
    char v31 = 0;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

- (unint64_t)hash
{
  v2 = [(BuddyMultilingualLanguageData *)self identifier];
  NSUInteger v3 = [(NSString *)v2 hash];
  id v4 = [(BuddyMultilingualLanguageData *)self title];
  unint64_t v5 = v3 ^ (unint64_t)[v4 hash];
  id v6 = [(BuddyMultilingualLanguageData *)self detailText];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (id)title
{
  return [(BuddyMultilingualLanguageData *)self displayText];
}

- (id)detailText
{
  char v4 = 0;
  if ([(BuddyMultilingualLanguageData *)self showDetailText])
  {
    v2 = [(BuddyMultilingualLanguageData *)self secondaryDisplayText];
    unint64_t v5 = v2;
    char v4 = 1;
  }
  else
  {
    v2 = 0;
  }
  unint64_t v7 = v2;
  if (v4) {

  }
  return v7;
}

- (NSString)identifier
{
  return [(BuddyMultilingualLanguageData *)self _identifier];
}

- (unint64_t)editingOptions
{
  return self->_editingOptions;
}

- (NSString)description
{
  return [(BuddyMultilingualLanguageData *)self identifier];
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)secondaryDisplayText
{
  return self->_secondaryDisplayText;
}

- (void)setSecondaryDisplayText:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)showDetailText
{
  return self->_showDetailText;
}

- (void)setShowDetailText:(BOOL)a3
{
  self->_showDetailText = a3;
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (void)set_identifier:(id)a3
{
}

- (void)setEditingOptions:(unint64_t)a3
{
  self->_editingOptions = a3;
}

- (void).cxx_destruct
{
}

@end