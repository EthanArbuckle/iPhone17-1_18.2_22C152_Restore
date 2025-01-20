@interface JFXEffectCategory
- (BOOL)containsNewEffects;
- (BOOL)isNewCategory;
- (JFXEffectCategory)initWithCategoryID:(id)a3 forEffectType:(int)a4 displayName:(id)a5 effectIDs:(id)a6 isNewCategory:(BOOL)a7 containsNewEffects:(BOOL)a8;
- (NSArray)effectIDs;
- (NSString)categoryID;
- (NSString)displayName;
- (int)effectType;
- (void)setCategoryID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEffectIDs:(id)a3;
- (void)setEffectType:(int)a3;
@end

@implementation JFXEffectCategory

- (JFXEffectCategory)initWithCategoryID:(id)a3 forEffectType:(int)a4 displayName:(id)a5 effectIDs:(id)a6 isNewCategory:(BOOL)a7 containsNewEffects:(BOOL)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)JFXEffectCategory;
  v18 = [(JFXEffectCategory *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_categoryID, a3);
    v19->_effectType = a4;
    objc_storeStrong((id *)&v19->_displayName, a5);
    objc_storeStrong((id *)&v19->_effectIDs, a6);
    v19->_isNewCategory = a7;
    v19->_containsNewEffects = a8;
  }

  return v19;
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)effectIDs
{
  return self->_effectIDs;
}

- (void)setEffectIDs:(id)a3
{
}

- (int)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int)a3
{
  self->_effectType = a3;
}

- (BOOL)isNewCategory
{
  return self->_isNewCategory;
}

- (BOOL)containsNewEffects
{
  return self->_containsNewEffects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectIDs, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
}

@end