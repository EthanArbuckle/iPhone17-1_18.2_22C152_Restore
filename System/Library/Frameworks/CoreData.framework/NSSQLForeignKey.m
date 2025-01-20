@interface NSSQLForeignKey
- (NSSQLForeignKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (NSSQLForeignKey)initWithEntity:(id)a3 toOneRelationship:(id)a4;
- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4;
- (id)name;
- (id)toOneRelationship;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLForeignKey

- (id)toOneRelationship
{
  return self->_toOne;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_toOne = (NSSQLToOne *)[a3 toOneRelationship];
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

- (id)name
{
  return self->_name;
}

- (NSSQLForeignKey)initWithEntity:(id)a3 toOneRelationship:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NSSQLForeignKey;
  v6 = [(NSSQLColumn *)&v16 initWithEntity:a3 propertyDescription:0];
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 3;
    v6->_toOne = (NSSQLToOne *)a4;
    v8 = (void *)[[NSString alloc] initWithFormat:@"%@%@", @"Z", objc_msgSend((id)objc_msgSend(a4, "name"), "uppercaseString")];
    if (a3) {
      uint64_t v9 = *((void *)a3 + 22);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v9, v8);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v10)
    {
      v12 = (void *)v10;

      v7->super._columnName = (NSString *)[v12 copy];
    }

    v13 = (NSString *)[[NSString alloc] initWithFormat:@"_%@", v7->super._columnName];
    name = v7->_name;
    if (name != v13)
    {

      v7->_name = (NSString *)[(NSString *)v13 copy];
    }

    v7->super.super._sqlType = 2;
  }
  return v7;
}

- (void)dealloc
{
  self->_toOne = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLForeignKey;
  [(NSSQLColumn *)&v3 dealloc];
}

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NSSQLForeignKey;
  objc_super v5 = [(NSSQLColumn *)&v10 initWithEntity:a3 propertyDescription:0];
  v6 = v5;
  if (v5)
  {
    v5->super.super._propertyType = 3;
    v5->_toOne = (NSSQLToOne *)a4;
    columnName = (__CFString *)v5->super._columnName;
    if (columnName != @"Z_PK")
    {

      v6->super._columnName = (NSString *)[@"Z_PK" copy];
    }
    name = (__CFString *)v6->_name;
    if (name != @"_pk")
    {

      v6->_name = (NSString *)[@"_pk" copy];
    }
    v6->super.super._sqlType = 2;
  }
  return v6;
}

- (NSSQLForeignKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6 = [a4 name];
  if (a3) {
    uint64_t v7 = [*((id *)a3 + 5) objectForKey:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return [(NSSQLForeignKey *)self initWithEntity:a3 toOneRelationship:v7];
}

@end