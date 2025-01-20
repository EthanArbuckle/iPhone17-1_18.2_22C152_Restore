@interface CNMeCardSharingNameFormatter
+ (id)formattedNameFromComponents:(id)a3 forProvider:(id)a4 withFormat:(unint64_t)a5;
+ (id)formattedNameFromProvider:(id)a3 withFormat:(unint64_t)a4;
+ (id)nameComponentsFromProvider:(id)a3;
- (CNMeCardSharingNameFormatter)initWithNameProvider:(id)a3;
- (CNMeCardSharingNameProvider)nameProvider;
- (NSMutableDictionary)cachedFormattedNames;
- (NSPersonNameComponents)nameComponents;
- (id)formattedNameWithFormat:(unint64_t)a3;
- (void)setCachedFormattedNames:(id)a3;
@end

@implementation CNMeCardSharingNameFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFormattedNames, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_nameProvider, 0);
}

- (void)setCachedFormattedNames:(id)a3
{
}

- (NSMutableDictionary)cachedFormattedNames
{
  return self->_cachedFormattedNames;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (id)formattedNameWithFormat:(unint64_t)a3
{
  cachedFormattedNames = self->_cachedFormattedNames;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [(NSMutableDictionary *)cachedFormattedNames objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = [(id)objc_opt_class() formattedNameFromComponents:self->_nameComponents forProvider:self->_nameProvider withFormat:a3];
    v8 = self->_cachedFormattedNames;
    v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (CNMeCardSharingNameFormatter)initWithNameProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingNameFormatter;
  v6 = [(CNMeCardSharingNameFormatter *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nameProvider, a3);
    uint64_t v8 = [(id)objc_opt_class() nameComponentsFromProvider:v5];
    nameComponents = v7->_nameComponents;
    v7->_nameComponents = (NSPersonNameComponents *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    cachedFormattedNames = v7->_cachedFormattedNames;
    v7->_cachedFormattedNames = (NSMutableDictionary *)v10;

    v12 = v7;
  }

  return v7;
}

+ (id)formattedNameFromComponents:(id)a3 forProvider:(id)a4 withFormat:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a5 == 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28F38] _localizedShortNameForComponents:v7 withStyle:1 options:0];
  }
  else
  {
    if (a5) {
      [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v7 style:0 options:0];
    }
    else {
    uint64_t v10 = [v8 givenName];
    }
  }
  v11 = (void *)v10;

  return v11;
}

+ (id)formattedNameFromProvider:(id)a3 withFormat:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 nameComponentsFromProvider:v6];
  id v8 = [a1 formattedNameFromComponents:v7 forProvider:v6 withFormat:a4];

  return v8;
}

+ (id)nameComponentsFromProvider:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28F30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 givenName];
  [v5 setGivenName:v6];

  id v7 = [v4 middleName];
  [v5 setMiddleName:v7];

  id v8 = [v4 familyName];

  [v5 setFamilyName:v8];

  return v5;
}

@end