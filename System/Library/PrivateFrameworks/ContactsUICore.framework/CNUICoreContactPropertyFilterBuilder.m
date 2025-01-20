@interface CNUICoreContactPropertyFilterBuilder
+ (CNUICoreContactPropertyFilterBuilder)managedContactsFilterBuilder;
+ (CNUICoreContactPropertyFilterBuilder)whitelistedContactsFilterBuilder;
- (BOOL)excludeNickname;
- (BOOL)excludeNote;
- (BOOL)excludePhoto;
- (BOOL)excludeRelationships;
- (id)build;
- (void)setExcludeNickname:(BOOL)a3;
- (void)setExcludeNote:(BOOL)a3;
- (void)setExcludePhoto:(BOOL)a3;
- (void)setExcludeRelationships:(BOOL)a3;
@end

@implementation CNUICoreContactPropertyFilterBuilder

+ (CNUICoreContactPropertyFilterBuilder)managedContactsFilterBuilder
{
  v2 = objc_alloc_init(CNUICoreContactPropertyFilterBuilder);
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeNickname:1];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludePhoto:1];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeNote:1];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeRelationships:1];
  return v2;
}

+ (CNUICoreContactPropertyFilterBuilder)whitelistedContactsFilterBuilder
{
  v2 = objc_alloc_init(CNUICoreContactPropertyFilterBuilder);
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeNickname:1];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludePhoto:0];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeNote:1];
  [(CNUICoreContactPropertyFilterBuilder *)v2 setExcludeRelationships:1];
  return v2;
}

- (id)build
{
  v3 = [MEMORY[0x263EFF980] array];
  if ([(CNUICoreContactPropertyFilterBuilder *)self excludeNickname])
  {
    v4 = +[CNUICoreContactPropertyValueFilterFactory nicknameFilter];
    [v3 addObject:v4];
  }
  if ([(CNUICoreContactPropertyFilterBuilder *)self excludePhoto])
  {
    v5 = +[CNUICoreContactPropertyValueFilterFactory photoFilter];
    [v3 addObject:v5];
  }
  if ([(CNUICoreContactPropertyFilterBuilder *)self excludeNote])
  {
    v6 = +[CNUICoreContactPropertyValueFilterFactory noteFilter];
    [v3 addObject:v6];
  }
  if ([(CNUICoreContactPropertyFilterBuilder *)self excludeRelationships])
  {
    v7 = +[CNUICoreContactPropertyValueFilterFactory relationshipsFilter];
    [v3 addObject:v7];
  }
  v8 = +[CNUICoreContactPropertyValueFilterFactory aggregatePropertyValueFilterWithValueFilters:v3];

  return v8;
}

- (BOOL)excludeNickname
{
  return self->_excludeNickname;
}

- (void)setExcludeNickname:(BOOL)a3
{
  self->_excludeNickname = a3;
}

- (BOOL)excludePhoto
{
  return self->_excludePhoto;
}

- (void)setExcludePhoto:(BOOL)a3
{
  self->_excludePhoto = a3;
}

- (BOOL)excludeNote
{
  return self->_excludeNote;
}

- (void)setExcludeNote:(BOOL)a3
{
  self->_excludeNote = a3;
}

- (BOOL)excludeRelationships
{
  return self->_excludeRelationships;
}

- (void)setExcludeRelationships:(BOOL)a3
{
  self->_excludeRelationships = a3;
}

@end