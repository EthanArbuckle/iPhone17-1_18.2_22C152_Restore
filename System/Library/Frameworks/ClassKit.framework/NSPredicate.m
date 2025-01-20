@interface NSPredicate
- (BOOL)pd_containsKeyPath:(id)a3;
- (NSMapTable)pd_keypathValueMap;
- (id)pd_andCompoundWith:(id)a3;
- (id)pd_scopeToKeyPath:(id)a3 value:(id)a4;
@end

@implementation NSPredicate

- (id)pd_andCompoundWith:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)NSCompoundPredicate);
    v9[0] = self;
    v9[1] = v4;
    v6 = +[NSArray arrayWithObjects:v9 count:2];

    v7 = (NSPredicate *)[v5 initWithType:1 subpredicates:v6];
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)pd_scopeToKeyPath:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 stringByAppendingString:@" = %@"];
  v9 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v8, v6);

  v10 = [(NSPredicate *)self pd_filterSubpredicatesForKeyPath:v7];

  if (v10)
  {
    objc_msgSend(v10, "pd_andCompoundWith:", v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v9;
  }
  v12 = v11;

  return v12;
}

- (BOOL)pd_containsKeyPath:(id)a3
{
  return 0;
}

- (NSMapTable)pd_keypathValueMap
{
  v3 = +[NSMapTable strongToStrongObjectsMapTable];
  [(NSPredicate *)self _populateKeypathValueMap:v3];

  return (NSMapTable *)v3;
}

@end