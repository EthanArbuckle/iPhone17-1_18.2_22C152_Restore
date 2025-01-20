@interface CPLContainerRelationChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (BOOL)shouldAppearInCKUploadContext;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLContainerRelationChange

- (BOOL)shouldAppearInCKUploadContext
{
  return 0;
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"itemId";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = [a3 recordID];
  v4 = [v3 recordName];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  v4 = self;
  id v5 = a3;
  v6 = [v5 objectForKey:@"itemId"];
  [(CPLContainerRelationChange *)v4 setItemIdentifier:v6];

  id v11 = objc_alloc_init((Class)CPLContainerRelation);
  objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"position", objc_opt_class());
  v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7) {
    v7 = &off_100291E78;
  }
  objc_msgSend(v11, "setPosition:", objc_msgSend(v7, "integerValue"));

  v9 = [v5 objectForKeyedSubscript:@"containerId"];
  [v11 setContainerIdentifier:v9];

  v10 = objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"isKeyAsset", objc_opt_class());

  objc_msgSend(v11, "setKeyAsset:", objc_msgSend(v10, "BOOLValue"));
  [(CPLContainerRelationChange *)v4 setRelation:v11];
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v15 = a3;
  v6 = self;
  v7 = [a4 fingerprintContext];
  if ([(CPLContainerRelationChange *)v6 hasChangeType:2])
  {
    if ([(CPLContainerRelationChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"itemIdentifier")])
    {
      v8 = [(CPLContainerRelationChange *)v6 itemIdentifier];
      [v15 setObject:v8 forKey:@"itemId"];
    }
    if ([(CPLContainerRelationChange *)v6 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"relation")])
    {
      v9 = [(CPLContainerRelationChange *)v6 relation];
      v10 = [v9 containerIdentifier];
      [v15 setObject:v10 forKey:@"containerId"];

      id v11 = [(CPLContainerRelationChange *)v6 relation];
      v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 position]);
      [v15 setObject:v12 forKey:@"position"];

      v13 = [(CPLContainerRelationChange *)v6 relation];
      v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isKeyAsset]);
      [v15 setObject:v14 forKey:@"isKeyAsset"];
    }
  }
}

@end