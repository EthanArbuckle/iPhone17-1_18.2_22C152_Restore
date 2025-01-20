@interface CLSMultipleChoiceAnswerFormat
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSMultipleChoiceAnswerFormat)initWithCKRecord:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithDatabaseRow:(id)a3;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
- (void)willBeDeletedFromDatabase:(id)a3;
@end

@implementation CLSMultipleChoiceAnswerFormat

+ (id)recordType
{
  return @"CLSMultipleChoiceAnswerFormat";
}

- (CLSMultipleChoiceAnswerFormat)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"type"];
  if (v5)
  {
    v6 = [(CLSMultipleChoiceAnswerFormat *)self initWithType:CLSMultipleChoiceTypeFromString()];
    v7 = v6;
    if (v6) {
      [(CLSMultipleChoiceAnswerFormat *)v6 _initCommonPropsWithRecord:v4];
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)populate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  id v4 = a3;
  [(CLSMultipleChoiceAnswerFormat *)&v6 populate:v4];
  [(CLSMultipleChoiceAnswerFormat *)self type];
  v5 = NSStringFromCLSMultipleChoiceType();
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  [(CLSMultipleChoiceAnswerFormat *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  v5 = [(CLSMultipleChoiceAnswerFormat *)self parentObjectID];
  if (v5)
  {
    objc_super v6 = [v4 select:objc_opt_class() identity:v5];
    v7 = v6;
    if (v6) {
      int64_t v8 = (int64_t)[v6 syncBackend:v4];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)syncOrder
{
  return 4;
}

- (int64_t)syncableItemType
{
  return 0;
}

- (NSString)parentReferenceName
{
  return (NSString *)@"questionStep";
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [(CLSMultipleChoiceAnswerFormat *)self parentObjectID];
  v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)entityName
{
  return @"CLSMultipleChoiceAnswerFormat";
}

- (id)initWithDatabaseRow:(id)a3
{
  id v4 = (uint64_t *)a3;
  id v5 = [(CLSMultipleChoiceAnswerFormat *)self _init];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    int64_t v8 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", (int)objc_msgSend(v8, "intValue"));

    v9 = sub_100003BF0(v4, @"answerFormatType");
    objc_msgSend(v6, "setAnswerFormatType:", (int)objc_msgSend(v9, "intValue"));
  }
  return v6;
}

- (void)bindTo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  id v4 = a3;
  [(CLSMultipleChoiceAnswerFormat *)&v9 bindTo:v4];
  CFStringRef v10 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9.receiver, v9.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  objc_super v6 = [(CLSMultipleChoiceAnswerFormat *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = +[NSNumber numberWithInteger:[(CLSMultipleChoiceAnswerFormat *)self type]];
  sub_10008C524((uint64_t)v4, v7, @"type");

  int64_t v8 = +[NSNumber numberWithInteger:[(CLSMultipleChoiceAnswerFormat *)self answerFormatType]];
  sub_10008C524((uint64_t)v4, v8, @"answerFormatType");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  int64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table CLSMultipleChoiceAnswerFormat (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    type              integer,\n    answerFormatType  integer,\nforeign key (parentObjectID) references CLSQuestionStep(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSMultipleChoiceAnswerFormat_objectID on CLSMultipleChoiceAnswerFormat (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSMultipleChoiceAnswerFormat_parentObjectID on CLSMultipleChoiceAnswerFormat (parentObjectID)", 0, 0, 0))
      {
        a3 = 1;
LABEL_2:
        *a4 = a3;
        LOBYTE(a3) = 1;
      }
    }
  }

  return a3;
}

- (void)willBeDeletedFromDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSMultipleChoiceAnswerFormat *)self objectID];
  id v7 = v5;
  objc_super v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 deleteAll:objc_opt_class() where:@"parentObjectID = ?" bindings:v6];
}

+ (int64_t)migrationOrder
{
  return 4;
}

@end