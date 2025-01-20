@interface CRRecentsMigrator
+ (BOOL)executeSQL:(id)a3 database:(id)a4;
+ (int)versionOfDatabase:(id)a3;
+ (void)migrateLibraryFilesFrom:(id)a3 to:(id)a4;
+ (void)setVersion:(int)a3 ofDatabase:(id)a4;
- (BOOL)migrateWithSQLiteConnection:(id)a3;
- (BOOL)migrateWithSQLiteConnection:(id)a3 toVersion:(int)a4;
- (BOOL)needsRebuild;
- (CRRecentsMigrator)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)migrateMailEmbeddedLibraryToPath:(id)a3;
- (void)noteNeedsRebuild;
@end

@implementation CRRecentsMigrator

- (CRRecentsMigrator)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRRecentsMigrator;
  result = [(CRRecentsMigrator *)&v5 init];
  if (result) {
    result->_delegate = (CRRecentsMigratorDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CRRecentsMigrator;
  [(CRRecentsMigrator *)&v2 dealloc];
}

- (BOOL)needsRebuild
{
  int v2 = 1;
  atomic_compare_exchange_strong_explicit(&self->_needsRebuild, (unsigned int *)&v2, 0, memory_order_relaxed, memory_order_relaxed);
  return v2 == 1;
}

- (void)noteNeedsRebuild
{
  int v2 = 0;
  atomic_compare_exchange_strong_explicit(&self->_needsRebuild, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
}

- (BOOL)migrateWithSQLiteConnection:(id)a3
{
  return [(CRRecentsMigrator *)self migrateWithSQLiteConnection:a3 toVersion:16];
}

- (BOOL)migrateWithSQLiteConnection:(id)a3 toVersion:(int)a4
{
  if (a3 && [a3 isOpen])
  {
    v7 = (sqlite3 *)[a3 db];
    BOOL v8 = 1;
    [a3 beginTransactionWithType:1];
    uint64_t v9 = sub_100012708(v7);
    sub_1000127A0(v7, @"getting library version");
    switch((int)v9)
    {
      case 0:
        if (!a4 || !sub_100012808(v7)) {
          goto LABEL_61;
        }
        [(CRRecentsMigrator *)self noteNeedsRebuild];
        sub_1000137F8(v7, a4);
        goto LABEL_62;
      case 1:
        if (a4 == 1) {
          goto LABEL_61;
        }
        int v10 = sub_1000128E4(v7);
        int v11 = 0;
        if (a4 == 2 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_13:
        int v10 = sub_100012964(v7);
        int v11 = 0;
        if (a4 == 3 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_17:
        int v10 = sub_100012A20(v7);
        int v11 = 0;
        if (a4 == 4 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_21:
        int v10 = sub_100012A74(v7);
        int v11 = 0;
        if (a4 == 5 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_25:
        int v10 = sub_100012B04(v7, self->_delegate);
        int v11 = 0;
        if (a4 == 6 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_29:
        int v10 = sub_100013178(v7);
        int v11 = 0;
        if (a4 == 7 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_33:
        int v10 = sub_100013208(v7);
        int v11 = 0;
        if (a4 == 8 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_37:
        int v10 = sub_10001325C(v7);
        int v11 = 0;
        if (a4 == 9 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_41:
        int v10 = sub_1000132B0(v7);
        int v11 = 0;
        if (a4 == 10 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_45:
        int v10 = sub_100013304(v7, self->_delegate);
        int v11 = 0;
        if (a4 == 11 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_49:
        int v10 = sub_100013634(v7);
        int v11 = 0;
        if (a4 == 12 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_53:
        int v10 = sub_100013688(v7);
        int v11 = 0;
        if (a4 == 13 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_57:
        int v10 = sub_1000136DC(v7);
        int v11 = 0;
        if (a4 == 14 || (v10 & 1) == 0) {
          goto LABEL_69;
        }
LABEL_65:
        int v10 = sub_100013744(v7);
        int v11 = v10;
        if (a4 == 15 || (v10 & 1) == 0)
        {
LABEL_69:
          if (v10)
          {
LABEL_70:
            sub_1000137F8(v7, a4);
            [a3 commitTransaction];
            if ((v11 & 1) == 0) {
              return 1;
            }
            goto LABEL_73;
          }
        }
        else
        {
LABEL_67:
          if (sub_1000137B0(v7))
          {
            [(CRRecentsMigrator *)self noteNeedsRebuild];
            LOBYTE(v11) = v11 != 0;
            goto LABEL_70;
          }
        }
        [a3 commitTransaction];
        if (!v11) {
          return 0;
        }
LABEL_73:
        BOOL result = sub_100013888(v7, @"VACUUM");
        break;
      case 2:
        if (a4 != 2) {
          goto LABEL_13;
        }
        goto LABEL_61;
      case 3:
        if (a4 != 3) {
          goto LABEL_17;
        }
        goto LABEL_61;
      case 4:
        if (a4 != 4) {
          goto LABEL_21;
        }
        goto LABEL_61;
      case 5:
        if (a4 != 5) {
          goto LABEL_25;
        }
        goto LABEL_61;
      case 6:
        if (a4 != 6) {
          goto LABEL_29;
        }
        goto LABEL_61;
      case 7:
        if (a4 != 7) {
          goto LABEL_33;
        }
        goto LABEL_61;
      case 8:
        if (a4 != 8) {
          goto LABEL_37;
        }
        goto LABEL_61;
      case 9:
        if (a4 != 9) {
          goto LABEL_41;
        }
        goto LABEL_61;
      case 10:
        if (a4 != 10) {
          goto LABEL_45;
        }
        goto LABEL_61;
      case 11:
        if (a4 != 11) {
          goto LABEL_49;
        }
        goto LABEL_61;
      case 12:
        if (a4 != 12) {
          goto LABEL_53;
        }
        goto LABEL_61;
      case 13:
        if (a4 != 13) {
          goto LABEL_57;
        }
        goto LABEL_61;
      case 14:
        if (a4 == 14) {
          goto LABEL_61;
        }
        goto LABEL_65;
      case 15:
        int v11 = 0;
        BOOL v8 = 0;
        if (a4 != 15) {
          goto LABEL_67;
        }
        goto LABEL_62;
      case 16:
        goto LABEL_62;
      default:
        NSLog(@"Error: migration is not supported for version %d", v9);
LABEL_61:
        BOOL v8 = 0;
LABEL_62:
        [a3 commitTransaction];
        return v8;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)migrateMailEmbeddedLibraryToPath:(id)a3
{
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@/Library/Mail", CPSharedResourcesDirectory()];
  [(id)objc_opt_class() migrateLibraryFilesFrom:v4 to:a3];
}

+ (void)migrateLibraryFilesFrom:(id)a3 to:(id)a4
{
  if ([a4 containsString:@"/tmp/"])
  {
    NSLog(@"New path looks like a temporary directory, skipping migration: %@", a4);
    return;
  }
  v6 = +[NSFileManager defaultManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [&off_10002F538 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(&off_10002F538);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [a3 stringByAppendingPathComponent:v11];
        id v13 = [a4 stringByAppendingPathComponent:v11];
        id v16 = 0;
        if (![(NSFileManager *)v6 moveItemAtPath:v12 toPath:v13 error:&v16]
          && ([v16 code] != (id)516
           || (objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSCocoaErrorDomain) & 1) == 0))
        {
          id v14 = [v16 code];
          id v15 = v16;
          if (v14 == (id)4)
          {
            if (objc_msgSend(objc_msgSend(v16, "domain"), "isEqualToString:", NSCocoaErrorDomain)) {
              continue;
            }
            id v15 = v16;
          }
          if (v15) {
            NSLog(@"Failed to migrate %@ to %@. Error: %@", v12, v13, v15);
          }
        }
      }
      id v8 = [&off_10002F538 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

+ (int)versionOfDatabase:(id)a3
{
  v3 = (sqlite3 *)[a3 db];
  return sub_100012708(v3);
}

+ (void)setVersion:(int)a3 ofDatabase:(id)a4
{
  objc_super v5 = (sqlite3 *)[a4 db];
  sub_1000137F8(v5, a3);
}

+ (BOOL)executeSQL:(id)a3 database:(id)a4
{
  objc_super v5 = (sqlite3 *)[a4 db];
  return sub_100013888(v5, a3);
}

@end