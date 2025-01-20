@interface CNPropertyGroupContactRelationItem
+ (id)emptyValueForLabel:(id)a3;
- (CNContactRelation)contactRelation;
- (id)displayStringForValue:(id)a3;
- (id)normalizedValue;
- (id)valueForDisplayString:(id)a3;
@end

@implementation CNPropertyGroupContactRelationItem

+ (id)emptyValueForLabel:(id)a3
{
  return (id)[MEMORY[0x1E4F1B978] contactRelationWithName:&stru_1ED8AC728];
}

- (id)valueForDisplayString:(id)a3
{
  return (id)[MEMORY[0x1E4F1B978] contactRelationWithName:a3];
}

- (id)displayStringForValue:(id)a3
{
  return (id)[a3 name];
}

- (id)normalizedValue
{
  v2 = [(CNPropertyGroupContactRelationItem *)self contactRelation];
  v3 = [v2 name];

  return v3;
}

- (CNContactRelation)contactRelation
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  v3 = [v2 value];

  return (CNContactRelation *)v3;
}

@end