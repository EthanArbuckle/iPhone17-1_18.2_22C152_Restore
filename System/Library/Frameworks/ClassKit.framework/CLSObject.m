@interface CLSObject
+ (id)hashableColumnNames;
+ (id)identityColumnName;
+ (void)resolveConflictForLocalRecord:(id)a3 serverRecord:(id)a4 commonAncestorRecord:(id)a5;
- (BOOL)canCopyToDatabase:(id)a3;
- (BOOL)isDeleteTracked;
- (BOOL)writeInDatabase:(id)a3;
- (int64_t)syncBackend:(id)a3;
- (unint64_t)changeHash;
- (void)_initCommonPropsWithDatabaseRow:(id)a3;
- (void)_initCommonPropsWithRecord:(id)a3;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)setExpiration:(double)a3;
- (void)updateParentReferencesForRecord:(id)a3;
@end

@implementation CLSObject

+ (id)identityColumnName
{
  return @"objectID";
}

+ (id)hashableColumnNames
{
  v4[0] = @"rowid";
  v4[1] = @"dateLastModified";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (unint64_t)changeHash
{
  v3 = [(CLSObject *)self objectID];
  unint64_t v4 = (unint64_t)objc_msgSend(v3, "_cls_stableHash");

  v5 = [(CLSObject *)self dateLastModified];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isDeleteTracked
{
  return 1;
}

- (void)_initCommonPropsWithDatabaseRow:(id)a3
{
  v10 = (uint64_t *)a3;
  unint64_t v4 = sub_100003BF0(v10, @"objectID");
  [(CLSObject *)self setObjectID:v4];

  [(CLSObject *)self setTemporary:0];
  v5 = sub_100003BF0(v10, @"appIdentifier");

  if (v5)
  {
    unint64_t v6 = sub_100003BF0(v10, @"appIdentifier");
    [(CLSObject *)self setAppIdentifier:v6];
  }
  v7 = sub_1001630C8(v10, @"dateCreated");
  [(CLSObject *)self setDateCreated:v7];

  v8 = sub_1001630C8(v10, @"dateLastModified");
  [(CLSObject *)self setDateLastModified:v8];

  if ([(CLSObject *)self conformsToProtocol:&OBJC_PROTOCOL___PDExpirableDatabaseEntity])
  {
    v9 = sub_1001630C8(v10, @"dateExpires");
    [(CLSObject *)self setDateExpires:v9];
  }
}

- (void)bindTo:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(CLSObject *)self objectID];
  sub_10008C524((uint64_t)v10, v4, @"objectID");

  v5 = [(CLSObject *)self appIdentifier];

  if (v5)
  {
    unint64_t v6 = [(CLSObject *)self appIdentifier];
    sub_10008C524((uint64_t)v10, v6, @"appIdentifier");
  }
  v7 = [(CLSObject *)self dateCreated];
  sub_10008C524((uint64_t)v10, v7, @"dateCreated");

  v8 = [(CLSObject *)self dateLastModified];
  sub_10008C524((uint64_t)v10, v8, @"dateLastModified");

  if ([(CLSObject *)self conformsToProtocol:&OBJC_PROTOCOL___PDExpirableDatabaseEntity])
  {
    v9 = [(CLSObject *)self dateExpires];
    sub_10008C524((uint64_t)v10, v9, @"dateExpires");
  }
}

- (void)setExpiration:(double)a3
{
  if (a3 == 0.0)
  {
    [(CLSObject *)self setDateExpires:0];
  }
  else
  {
    +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CLSObject *)self setDateExpires:v4];
  }
}

- (void)_initCommonPropsWithRecord:(id)a3
{
  id v18 = a3;
  id v4 = [v18 recordID];
  v5 = [v4 recordName];

  [(CLSObject *)self setObjectID:v5];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(CLSObject *)self parentReferenceName], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = [v18 objectForKeyedSubscript:v6];
    v9 = [v8 recordID];
    id v10 = [v9 recordName];

    if (v10) {
      [(CLSObject *)self setParentObjectID:v10];
    }
  }
  else
  {
    id v10 = v5;
  }
  v11 = [v18 objectForKeyedSubscript:@"appIdentifier"];
  [(CLSObject *)self setAppIdentifier:v11];

  v12 = [v18 objectForKeyedSubscript:@"dateCreated"];
  [(CLSObject *)self setDateCreated:v12];

  v13 = [(CLSObject *)self dateCreated];

  if (!v13)
  {
    v14 = +[NSDate date];
    [(CLSObject *)self setDateCreated:v14];
  }
  v15 = [v18 objectForKeyedSubscript:@"dateLastModified"];
  [(CLSObject *)self setDateLastModified:v15];

  v16 = [(CLSObject *)self dateLastModified];

  if (!v16)
  {
    v17 = [(CLSObject *)self dateCreated];
    [(CLSObject *)self setDateLastModified:v17];
  }
}

- (void)populate:(id)a3
{
  id v9 = a3;
  id v4 = [(CLSObject *)self appIdentifier];
  [v9 setObject:v4 forKeyedSubscript:@"appIdentifier"];

  v5 = [(CLSObject *)self dateCreated];

  if (v5) {
    [(CLSObject *)self dateCreated];
  }
  else {
  uint64_t v6 = +[NSDate date];
  }
  [v9 setObject:v6 forKeyedSubscript:@"dateCreated"];

  v7 = [(CLSObject *)self dateLastModified];

  if (v7) {
    [(CLSObject *)self dateLastModified];
  }
  else {
  v8 = [v9 objectForKeyedSubscript:@"dateCreated"];
  }
  [v9 setObject:v8 forKeyedSubscript:@"dateLastModified"];
}

- (void)updateParentReferencesForRecord:(id)a3
{
  id v13 = a3;
  id v4 = [(CLSObject *)self parentObjectID];
  if (v4)
  {
    id v5 = objc_alloc((Class)CKRecordID);
    uint64_t v6 = [v13 recordID];
    v7 = [v6 zoneID];
    id v8 = [v5 initWithRecordName:v4 zoneID:v7];

    id v9 = [objc_alloc((Class)CKReference) initWithRecordID:v8 action:0];
    [v13 setParent:v9];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(CLSObject *)self parentReferenceName];
      if (v10)
      {
        v11 = (void *)v10;
        id v12 = [objc_alloc((Class)CKReference) initWithRecordID:v8 action:1];

        [v13 setObject:v12 forKeyedSubscript:v11];
        id v9 = v12;
      }
    }
  }
}

- (int64_t)syncBackend:(id)a3
{
  return 1;
}

+ (void)resolveConflictForLocalRecord:(id)a3 serverRecord:(id)a4 commonAncestorRecord:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  uint64_t v10 = [v38 values];
  uint64_t v11 = sub_100096BDC((uint64_t)a1, v8, v10);
  v37 = v10;
  uint64_t v12 = sub_100096BDC((uint64_t)a1, v9, v10);
  v39 = v8;
  id v13 = [v8 objectForKeyedSubscript:@"dateLastModified"];
  v41 = v9;
  v35 = [v9 objectForKeyedSubscript:@"dateLastModified"];
  v36 = v13;
  id v14 = [v13 compare:v35];
  if (v14 == (id)-1) {
    v15 = (void *)v12;
  }
  else {
    v15 = (void *)v11;
  }
  if (v14 == (id)-1) {
    v16 = (void *)v11;
  }
  else {
    v16 = (void *)v12;
  }
  v17 = +[NSHashTable hashTableWithOptions:5];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v15 keyEnumerator];
  id v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * (void)v21);
        [v17 addObject:v22];
        uint64_t v24 = [v16 objectForKeyedSubscript:v22];
        uint64_t v25 = [v15 objectForKeyedSubscript:v22];
        if (v24 | v25 && (!v24 || ([(id)v24 isEqual:v25] & 1) == 0)) {
          [v41 setObject:v25 forKeyedSubscript:v22];
        }

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v19);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v26 = [v16 keyEnumerator];
  id v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      v30 = 0;
      do
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v30);
        if (([v17 containsObject:v31] & 1) == 0)
        {
          v33 = [v15 objectForKeyedSubscript:v31];

          if (!v33)
          {
            v34 = [v16 objectForKeyedSubscript:v31];
            [v41 setObject:v34 forKeyedSubscript:v31];
          }
        }
        v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v28);
  }
}

- (BOOL)canCopyToDatabase:(id)a3
{
  return 0;
}

- (BOOL)writeInDatabase:(id)a3
{
  id v4 = self;
  id v5 = a3;
  if ([(CLSObject *)v4 isDeleted]) {
    unsigned __int8 v6 = [v5 deleteObject:v4];
  }
  else {
    unsigned __int8 v6 = [v5 insertOrUpdateObject:v4];
  }
  BOOL v7 = v6;

  return v7;
}

@end