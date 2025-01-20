@interface _CNContactMatchingFetchRequestInfos
+ (id)fetchRequestInfoForPredicate:(id)a3 properties:(id)a4;
- (NSArray)properties;
- (NSPredicate)predicate;
- (void)setPredicate:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation _CNContactMatchingFetchRequestInfos

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)fetchRequestInfoForPredicate:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setPredicate:v7];

  [v8 setProperties:v6];

  return v8;
}

- (void)setProperties:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)properties
{
  return self->_properties;
}

@end