@interface ATXAppDirectoryCategory
+ (BOOL)_instanceSpecificLocalizedStringExistsForCategory:(unint64_t)a3;
+ (BOOL)isCategory:(unint64_t)a3 descendantOfCategory:(unint64_t)a4;
+ (BOOL)isCategoryScreenTime:(unint64_t)a3;
+ (BOOL)isCategorySpecial:(unint64_t)a3;
+ (BOOL)isCategoryiTunesGamesSubgenre:(unint64_t)a3;
+ (BOOL)isCategoryiTunesGenre:(unint64_t)a3;
+ (BOOL)shouldCategoryAlwaysMergeWithParent:(unint64_t)a3;
+ (BOOL)shouldCategoryNeverMergeWithParent:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)categoryIdentifierForScreenTimeCategoryID:(unint64_t)a3;
+ (id)localizedStringForCategoryID:(unint64_t)a3;
+ (id)localizedStringForNonScreenTimeCategoryID:(unint64_t)a3;
+ (unint64_t)_parentCategoryForiTunesGenreID:(unint64_t)a3;
+ (unint64_t)appDirectoryCategoryStringToAppDirectoryCategoryID:(id)a3;
+ (unint64_t)parentCategoryForCategory:(unint64_t)a3;
+ (unint64_t)screenTimeCategoryIDForCategoryIdentifier:(id)a3;
- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4;
- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4 localizedName:(id)a5;
- (ATXAppDirectoryCategory)initWithCoder:(id)a3;
- (NSArray)appBundleIDs;
- (NSString)localizedName;
- (id)description;
- (id)localizedStringForCategoryID:(unint64_t)a3;
- (unint64_t)categoryID;
- (void)encodeWithCoder:(id)a3;
- (void)updateAppBundleIDs:(id)a3;
- (void)updateCategoryLocalizedNameWithName:(id)a3;
@end

@implementation ATXAppDirectoryCategory

- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4 localizedName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXAppDirectoryCategory;
  v10 = [(ATXAppDirectoryCategory *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_categoryID = a3;
    uint64_t v12 = [v8 copy];
    appBundleIDs = v11->_appBundleIDs;
    v11->_appBundleIDs = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v14;
  }
  return v11;
}

- (ATXAppDirectoryCategory)initWithCategoryID:(unint64_t)a3 appBundleIDs:(id)a4
{
  return [(ATXAppDirectoryCategory *)self initWithCategoryID:a3 appBundleIDs:a4 localizedName:0];
}

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_appBundleIDs, 0);
}

- (id)description
{
  localizedName = (__CFString *)self->_localizedName;
  if (!localizedName) {
    localizedName = &stru_1EFD9B408;
  }
  return (id)[NSString stringWithFormat:@"%lu %@: %@", self->_categoryID, localizedName, self->_appBundleIDs];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXAppDirectoryCategory)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"categoryID"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appBundleIDs"];
  if (!v9)
  {
    uint64_t v12 = [v4 error];

    if (v12)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"ATXAppDirectoryCategory archive contains a nil or missing list of apps";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v15 = v13;
    uint64_t v16 = 1;
LABEL_7:
    v18 = (void *)[v15 initWithDomain:@"com.apple.duet.appDirectory" code:v16 userInfo:v14];

    [v4 failWithError:v18];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = @"ATXAppDirectoryCategory archive contains unexpected class contents";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v15 = v17;
    uint64_t v16 = 2;
    goto LABEL_7;
  }
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
  self = [(ATXAppDirectoryCategory *)self initWithCategoryID:v5 appBundleIDs:v9 localizedName:v10];

  v11 = self;
LABEL_9:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t categoryID = self->_categoryID;
  id v5 = a3;
  [v5 encodeInteger:categoryID forKey:@"categoryID"];
  [v5 encodeObject:self->_appBundleIDs forKey:@"appBundleIDs"];
  [v5 encodeObject:self->_localizedName forKey:@"localizedName"];
}

+ (BOOL)isCategoryiTunesGenre:(unint64_t)a3
{
  return a3 - 6000 < 0x1C;
}

+ (BOOL)isCategoryScreenTime:(unint64_t)a3
{
  return a3 - 1000 < 0xD;
}

+ (BOOL)isCategorySpecial:(unint64_t)a3
{
  return a3 < 8;
}

+ (BOOL)isCategoryiTunesGamesSubgenre:(unint64_t)a3
{
  return a3 - 7001 < 0x10;
}

+ (id)categoryIdentifierForScreenTimeCategoryID:(unint64_t)a3
{
  if (a3 - 1000 >= 0xD)
  {
    id v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[ATXAppDirectoryCategory categoryIdentifierForScreenTimeCategoryID:](a3, v5);
    }

    v3 = (void **)MEMORY[0x1E4F58028];
  }
  else
  {
    v3 = (void **)qword_1E5D05090[a3 - 1000];
  }
  v6 = *v3;

  return v6;
}

+ (unint64_t)screenTimeCategoryIDForCategoryIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F58018]])
  {
    unint64_t v4 = 1000;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58048]])
  {
    unint64_t v4 = 1001;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58010]])
  {
    unint64_t v4 = 1002;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58000]])
  {
    unint64_t v4 = 1003;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58030]])
  {
    unint64_t v4 = 1004;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58008]])
  {
    unint64_t v4 = 1005;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58038]])
  {
    unint64_t v4 = 1006;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F58020]])
  {
    unint64_t v4 = 1007;
  }
  else
  {
    if (([v3 isEqualToString:*MEMORY[0x1E4F58028]] & 1) == 0
      && ([v3 isEqualToString:*MEMORY[0x1E4F58050]] & 1) == 0
      && ([v3 isEqualToString:*MEMORY[0x1E4F58068]] & 1) == 0
      && ([v3 isEqualToString:*MEMORY[0x1E4F58078]] & 1) == 0)
    {
      if ([v3 isEqualToString:*MEMORY[0x1E4F58088]])
      {
        unint64_t v4 = 1010;
        goto LABEL_22;
      }
      if ([v3 isEqualToString:*MEMORY[0x1E4F58040]])
      {
        unint64_t v4 = 1011;
        goto LABEL_22;
      }
      if ([v3 isEqualToString:*MEMORY[0x1E4F58080]])
      {
        unint64_t v4 = 1012;
        goto LABEL_22;
      }
      v6 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        +[ATXAppDirectoryCategory screenTimeCategoryIDForCategoryIdentifier:]((uint64_t)v3, v6);
      }
    }
    unint64_t v4 = 1008;
  }
LABEL_22:

  return v4;
}

+ (unint64_t)appDirectoryCategoryStringToAppDirectoryCategoryID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesBusiness"])
  {
    unint64_t v4 = 6000;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesWeather"])
  {
    unint64_t v4 = 6001;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesUtilities"])
  {
    unint64_t v4 = 6002;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesTravel"])
  {
    unint64_t v4 = 6003;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesSports"])
  {
    unint64_t v4 = 6004;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesSocialNetworking"])
  {
    unint64_t v4 = 6005;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesReference"])
  {
    unint64_t v4 = 6006;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesProductivity"])
  {
    unint64_t v4 = 6007;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesPhotoVideo"])
  {
    unint64_t v4 = 6008;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesNews"])
  {
    unint64_t v4 = 6009;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesNavigation"])
  {
    unint64_t v4 = 6010;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesMusic"])
  {
    unint64_t v4 = 6011;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesLifestyle"])
  {
    unint64_t v4 = 6012;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesHealthFitness"])
  {
    unint64_t v4 = 6013;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesGames"])
  {
    unint64_t v4 = 6014;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesFinance"])
  {
    unint64_t v4 = 6015;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesEntertainment"])
  {
    unint64_t v4 = 6016;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesEducation"])
  {
    unint64_t v4 = 6017;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesBooks"])
  {
    unint64_t v4 = 6018;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesMedical"])
  {
    unint64_t v4 = 6020;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesNewsstand"])
  {
    unint64_t v4 = 6021;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesCatalogs"])
  {
    unint64_t v4 = 6022;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesFoodDrinks"])
  {
    unint64_t v4 = 6023;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesShopping"])
  {
    unint64_t v4 = 6024;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesStickers"])
  {
    unint64_t v4 = 6025;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesDeveloperTools"])
  {
    unint64_t v4 = 6026;
  }
  else if ([v3 isEqualToString:@"ATXAppDirectoryCategoryIDiTunesGraphicsDesign"])
  {
    unint64_t v4 = 6027;
  }
  else
  {
    unint64_t v4 = 6028;
  }

  return v4;
}

+ (BOOL)_instanceSpecificLocalizedStringExistsForCategory:(unint64_t)a3
{
  return a3 == 1 || a3 == 6;
}

- (id)localizedStringForCategoryID:(unint64_t)a3
{
  if (self->_categoryID != a3)
  {
    id v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXAppDirectoryCategory: localizedStringForCategoryID: CategoryID provided does not match categoryID of object", v9, 2u);
    }
  }
  if ([(id)objc_opt_class() _instanceSpecificLocalizedStringExistsForCategory:a3]
    && (localizedName = self->_localizedName) != 0)
  {
    uint64_t v7 = localizedName;
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() localizedStringForCategoryID:a3];
  }

  return v7;
}

+ (id)localizedStringForCategoryID:(unint64_t)a3
{
  if (objc_msgSend(a1, "isCategoryScreenTime:"))
  {
    id v5 = (void *)MEMORY[0x1E4F580B0];
    v6 = [a1 categoryIdentifierForScreenTimeCategoryID:a3];
    uint64_t v7 = [v5 localizedNameForIdentifier:v6];
  }
  else
  {
    uint64_t v7 = [a1 localizedStringForNonScreenTimeCategoryID:a3];
  }

  return v7;
}

+ (id)localizedStringForNonScreenTimeCategoryID:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = v5;
  switch(a3)
  {
    case 0x1770uLL:
      uint64_t v7 = @"Business";
      goto LABEL_41;
    case 0x1771uLL:
      uint64_t v7 = @"Weather";
      goto LABEL_41;
    case 0x1772uLL:
      uint64_t v7 = @"Utilities";
      goto LABEL_41;
    case 0x1773uLL:
      uint64_t v7 = @"Travel";
      goto LABEL_41;
    case 0x1774uLL:
      uint64_t v7 = @"Sports";
      goto LABEL_41;
    case 0x1775uLL:
      uint64_t v10 = [a1 localizedStringForCategoryID:1001];
      goto LABEL_42;
    case 0x1776uLL:
      uint64_t v7 = @"Reference";
      goto LABEL_41;
    case 0x1777uLL:
      uint64_t v7 = @"Productivity";
      goto LABEL_41;
    case 0x1778uLL:
      uint64_t v7 = @"Photo & Video";
      goto LABEL_41;
    case 0x1779uLL:
      uint64_t v7 = @"News";
      goto LABEL_41;
    case 0x177AuLL:
      uint64_t v7 = @"Navigation";
      goto LABEL_41;
    case 0x177BuLL:
      uint64_t v7 = @"Music";
      goto LABEL_41;
    case 0x177CuLL:
      uint64_t v7 = @"Lifestyle";
      goto LABEL_41;
    case 0x177DuLL:
      uint64_t v7 = @"Health & Fitness";
      goto LABEL_41;
    case 0x177EuLL:
      uint64_t v7 = @"Games";
      goto LABEL_41;
    case 0x177FuLL:
      uint64_t v7 = @"Finance";
      goto LABEL_41;
    case 0x1780uLL:
      uint64_t v7 = @"Entertainment";
      goto LABEL_41;
    case 0x1781uLL:
      uint64_t v7 = @"Education";
      goto LABEL_41;
    case 0x1782uLL:
      uint64_t v7 = @"Books";
      goto LABEL_41;
    case 0x1783uLL:
LABEL_5:
      id v8 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[ATXAppDirectoryCategory localizedStringForNonScreenTimeCategoryID:](v8);
      }

      id v9 = 0;
      goto LABEL_43;
    case 0x1784uLL:
      uint64_t v7 = @"Medical";
      goto LABEL_41;
    case 0x1785uLL:
      uint64_t v7 = @"Newsstand";
      goto LABEL_41;
    case 0x1786uLL:
      uint64_t v7 = @"Catalogs";
      goto LABEL_41;
    case 0x1787uLL:
      uint64_t v7 = @"Food & Drinks";
      goto LABEL_41;
    case 0x1788uLL:
      uint64_t v7 = @"Shopping";
      goto LABEL_41;
    case 0x1789uLL:
      uint64_t v7 = @"Stickers";
      goto LABEL_41;
    case 0x178AuLL:
      uint64_t v7 = @"Developer Tools";
      goto LABEL_41;
    case 0x178BuLL:
      uint64_t v7 = @"Graphics & Design";
LABEL_41:
      uint64_t v10 = [v5 localizedStringForKey:v7 value:&stru_1EFD9B408 table:0];
LABEL_42:
      id v9 = (void *)v10;
LABEL_43:

      return v9;
    default:
      switch(a3)
      {
        case 0uLL:
          uint64_t v7 = @" System";
          goto LABEL_41;
        case 1uLL:
          uint64_t v7 = @"Enterprise Apps";
          goto LABEL_41;
        case 2uLL:
          uint64_t v7 = @"Arcade";
          goto LABEL_41;
        case 3uLL:
          uint64_t v7 = @"Suggestions";
          goto LABEL_41;
        case 4uLL:
          uint64_t v7 = @"Recently Added";
          goto LABEL_41;
        case 5uLL:
          uint64_t v7 = @"Bookmarks";
          goto LABEL_41;
        case 6uLL:
          uint64_t v7 = @"Managed Apps";
          goto LABEL_41;
        case 7uLL:
          uint64_t v7 = @"Hidden";
          goto LABEL_41;
        default:
          goto LABEL_5;
      }
  }
}

- (unint64_t)categoryID
{
  return self->_categoryID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)updateCategoryLocalizedNameWithName:(id)a3
{
  unint64_t v4 = (NSString *)[a3 copy];
  localizedName = self->_localizedName;
  self->_localizedName = v4;

  MEMORY[0x1F41817F8](v4, localizedName);
}

- (void)updateAppBundleIDs:(id)a3
{
  unint64_t v4 = (NSArray *)[a3 copy];
  appBundleIDs = self->_appBundleIDs;
  self->_appBundleIDs = v4;

  MEMORY[0x1F41817F8](v4, appBundleIDs);
}

+ (unint64_t)_parentCategoryForiTunesGenreID:(unint64_t)a3
{
  unint64_t v6 = a3 - 6000;
  if (a3 - 6000 < 0x1C && ((0xFF7FFFFu >> v6) & 1) != 0) {
    return qword_1A7A9D7A0[v6];
  }
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ATXAppDirectoryCategory+Dynamic.m", 74, @"%s: categoryID %lu is not an iTunes genreID", "+[ATXAppDirectoryCategory(Dynamic) _parentCategoryForiTunesGenreID:]", a3);

  return 1008;
}

+ (BOOL)shouldCategoryAlwaysMergeWithParent:(unint64_t)a3
{
  return (a3 - 6002 < 0x10) & (0xD82Bu >> (a3 - 114));
}

+ (BOOL)shouldCategoryNeverMergeWithParent:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 - 1000 <= 0xA)
  {
    if (((1 << (a3 + 24)) & 0x41A) != 0) {
      return result;
    }
    if (a3 == 1000) {
      return (objc_msgSend(MEMORY[0x1E4F93B08], "isiPad", v3, v4) & 1) != 0;
    }
  }
  if (a3 > 6 || ((1 << a3) & 0x46) == 0) {
    return 0;
  }
  return result;
}

+ (unint64_t)parentCategoryForCategory:(unint64_t)a3
{
  if (objc_msgSend(a1, "isCategoryiTunesGamesSubgenre:")) {
    return 6014;
  }
  if (![a1 isCategoryiTunesGenre:a3]) {
    return 1008;
  }

  return [a1 _parentCategoryForiTunesGenreID:a3];
}

+ (BOOL)isCategory:(unint64_t)a3 descendantOfCategory:(unint64_t)a4
{
  BOOL result = a3 != 1008;
  if (a3 != a4 && a3 != 1008)
  {
    do
    {
      uint64_t v7 = objc_msgSend(a1, "parentCategoryForCategory:");
      BOOL result = v7 != 1008;
    }
    while (v7 != a4 && v7 != 1008);
  }
  return result;
}

+ (void)categoryIdentifierForScreenTimeCategoryID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "+[ATXAppDirectoryCategory categoryIdentifierForScreenTimeCategoryID:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: categoryID %lu is not a screentime categoryID", (uint8_t *)&v2, 0x16u);
}

+ (void)screenTimeCategoryIDForCategoryIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "+[ATXAppDirectoryCategory screenTimeCategoryIDForCategoryIdentifier:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%s: category identifier %@ is not a category identifier corresponding to a screentime categoryID", (uint8_t *)&v2, 0x16u);
}

+ (void)localizedStringForNonScreenTimeCategoryID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "localizedStringForCategoryID: no localizedString exists for specified categoryID", v1, 2u);
}

@end