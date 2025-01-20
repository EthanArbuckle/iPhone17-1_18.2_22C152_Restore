@interface PDDeletedObjectQuestionIDs
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDDeletedObjectQuestionIDs)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDeletedObjectQuestionIDs

+ (NSString)entityName
{
  return (NSString *)@"PDDeletedObjectQuestionIDs";
}

- (PDDeletedObjectQuestionIDs)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PDDeletedObjectQuestionIDs;
  v5 = [(PDDeletedObjectQuestionIDs *)&v14 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v6;

    v8 = sub_100003BF0(v4, @"questionIDs");
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
      uint64_t v11 = +[NSKeyedUnarchiver cls_secureUnarchiveObjectOfClasses:v10 withData:v8];
      questionIDs = v5->_questionIDs;
      v5->_questionIDs = (NSArray *)v11;
    }
  }

  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  sub_10008C524((uint64_t)v4, self->_objectID, @"objectID");
  questionIDs = self->_questionIDs;
  if (questionIDs)
  {
    id v9 = 0;
    uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:questionIDs requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    v8 = v7;
    if (v7) {
      objc_msgSend(v7, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_10008C524((uint64_t)v4, v6, @"questionIDs");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDDeletedObjectQuestionIDs (\n    objectID text not null,\n    questionIDs blob not null\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDDeletedObjectQuestionIDs_objectID on PDDeletedObjectQuestionIDs (objectID)", 0, 0, 0))
    {
      a3 = 1;
LABEL_2:
      *a4 = a3;
      LOBYTE(a3) = 1;
    }
  }

  return a3;
}

+ (NSString)identityColumnName
{
  return (NSString *)@"objectID";
}

- (PDDatabaseValue)identityValue
{
  return (PDDatabaseValue *)self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionIDs, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end