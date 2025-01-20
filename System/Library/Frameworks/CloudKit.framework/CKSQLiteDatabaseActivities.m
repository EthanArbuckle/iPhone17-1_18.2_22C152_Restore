@interface CKSQLiteDatabaseActivities
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)hasPendingActivities:(id *)a3;
- (id)activitiesStartingBeforeDate:(id)a3;
- (id)deleteCompletedActivities;
- (id)deleteEntriesForDatabase:(id)a3;
- (id)earliestActivityDate;
- (id)fetchActivityForTarget:(id)a3;
- (id)insertOrUpdateActivityDate:(id)a3;
- (id)wakeFromDatabase;
@end

@implementation CKSQLiteDatabaseActivities

+ (id)dbProperties
{
  return &unk_1ED846A98;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)wakeFromDatabase
{
  v16.receiver = self;
  v16.super_class = (Class)CKSQLiteDatabaseActivities;
  v3 = [(CKSQLiteTable *)&v16 wakeFromDatabase];
  v7 = objc_msgSend_tableGroup(self, v4, v5, v6);
  int isFirstInstance = objc_msgSend_isFirstInstance(v7, v8, v9, v10);

  if (isFirstInstance && !v3)
  {
    v3 = objc_msgSend_deleteCompletedActivities(self, v12, v13, v14);
  }

  return v3;
}

- (id)fetchActivityForTarget:(id)a3
{
  return (id)objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, a2, 0, (uint64_t)a3, &unk_1ED845FD0, off_1E5464F40);
}

- (id)activitiesStartingBeforeDate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_18AF14038;
  v19 = sub_18AF13970;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B12563C;
  v11[3] = &unk_1E5460ED0;
  id v5 = v4;
  id v12 = v5;
  uint64_t v13 = self;
  uint64_t v14 = &v15;
  id v8 = (id)objc_msgSend_performInTransaction_(self, v6, (uint64_t)v11, v7);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)earliestActivityDate
{
  return (id)objc_msgSend_minimumValueOfProperty_label_error_(self, a2, @"activityLatestDate", (uint64_t)off_1E5464F70, 0);
}

- (id)insertOrUpdateActivityDate:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_insertObject_orUpdateProperties_label_, a3, &unk_1ED845FE8);
}

- (id)deleteCompletedActivities
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"NOW";
  id v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2, v3);
  v13[0] = v5;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v13, (uint64_t)&v12, 1);

  id v11 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, (uint64_t)off_1E5464FA0, &v11, &unk_1ED7EC1C8);
  id v9 = v11;

  return v9;
}

- (id)deleteEntriesForDatabase:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"DATABASEID";
  v13[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v13, (uint64_t)&v12, 1);
  id v11 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, (uint64_t)off_1E5464FB8, &v11, &unk_1ED7EC1E8);
  id v9 = v11;

  return v9;
}

- (BOOL)hasPendingActivities:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B125A88;
  v9[3] = &unk_1E5460CF8;
  v9[4] = self;
  v9[5] = &v10;
  id v5 = objc_msgSend_performInTransaction_(self, a2, (uint64_t)v9, v3);
  uint64_t v6 = v5;
  if (a3 && v5) {
    *a3 = v5;
  }
  char v7 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

@end