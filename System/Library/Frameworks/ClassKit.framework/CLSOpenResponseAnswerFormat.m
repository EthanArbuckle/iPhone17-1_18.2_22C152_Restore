@interface CLSOpenResponseAnswerFormat
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (id)recordType;
+ (int64_t)migrationOrder;
- (BOOL)canCopyToDatabase:(id)a3;
- (CLSOpenResponseAnswerFormat)initWithDatabaseRow:(id)a3;
- (NSString)parentReferenceName;
- (id)initWithCKRecord:(id)a3;
- (int64_t)syncBackend:(id)a3;
- (int64_t)syncOrder;
- (int64_t)syncableItemType;
- (void)bindTo:(id)a3;
- (void)populate:(id)a3;
@end

@implementation CLSOpenResponseAnswerFormat

+ (id)entityName
{
  return @"CLSOpenResponseAnswerFormat";
}

- (CLSOpenResponseAnswerFormat)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSOpenResponseAnswerFormat *)self _init];
  v6 = v5;
  if (v5)
  {
    [v5 _initCommonPropsWithDatabaseRow:v4];
    v7 = sub_100003BF0(v4, @"parentObjectID");
    [v6 setParentObjectID:v7];

    v8 = sub_100003BF0(v4, @"answerFormatType");
    objc_msgSend(v6, "setAnswerFormatType:", (int)objc_msgSend(v8, "intValue"));

    v9 = sub_100003BF0(v4, @"teacherProvidedText");
    [v6 setTeacherProvidedText:v9];

    v10 = sub_100003BF0(v4, @"maximumTextLength");
    objc_msgSend(v6, "setMaximumTextLength:", objc_msgSend(v10, "integerValue"));

    v11 = sub_100003BF0(v4, @"minimumTextLength");
    objc_msgSend(v6, "setMinimumTextLength:", objc_msgSend(v11, "integerValue"));

    v12 = sub_100003BF0(v4, @"type");
    objc_msgSend(v6, "setType:", (int)objc_msgSend(v12, "intValue"));

    v13 = sub_100003BF0(v4, @"allowsMultimedia");
    objc_msgSend(v6, "setAllowsMultimedia:", objc_msgSend(v13, "BOOLValue"));
  }
  return (CLSOpenResponseAnswerFormat *)v6;
}

- (void)bindTo:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CLSOpenResponseAnswerFormat;
  id v4 = a3;
  [(CLSOpenResponseAnswerFormat *)&v13 bindTo:v4];
  CFStringRef v14 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v13.receiver, v13.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSOpenResponseAnswerFormat *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self answerFormatType]];
  sub_10008C524((uint64_t)v4, v7, @"answerFormatType");

  v8 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self maximumTextLength]];
  sub_10008C524((uint64_t)v4, v8, @"maximumTextLength");

  v9 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self minimumTextLength]];
  sub_10008C524((uint64_t)v4, v9, @"minimumTextLength");

  v10 = [(CLSOpenResponseAnswerFormat *)self teacherProvidedText];
  sub_10008C524((uint64_t)v4, v10, @"teacherProvidedText");

  v11 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self type]];
  sub_10008C524((uint64_t)v4, v11, @"type");

  v12 = +[NSNumber numberWithBool:[(CLSOpenResponseAnswerFormat *)self allowsMultimedia]];
  sub_10008C524((uint64_t)v4, v12, @"allowsMultimedia");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  if (a3 == 1) {
    goto LABEL_6;
  }
  if (a3)
  {
LABEL_8:
    *a4 = a3;
    LOBYTE(a3) = 1;
    goto LABEL_9;
  }
  if (sub_100007540(v7, @"create table CLSOpenResponseAnswerFormat (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    type                  integer,\n    answerFormatType      integer,\n    maximumTextLength     integer,\n    minimumTextLength     integer,\n    teacherProvidedText   text,\nforeign key (parentObjectID) references CLSQuestionStep(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSOpenResponseAnswerFormat_objectID on CLSOpenResponseAnswerFormat (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSOpenResponseAnswerFormat_parentObjectID on CLSOpenResponseAnswerFormat (parentObjectID)", 0, 0, 0))
      {
LABEL_6:
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"alter table CLSOpenResponseAnswerFormat add column allowsMultimedia integer", 0, 0, 0))
        {
          a3 = 2;
          goto LABEL_8;
        }
      }
    }
  }
LABEL_9:

  return a3;
}

+ (int64_t)migrationOrder
{
  return 4;
}

- (BOOL)canCopyToDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CLSOpenResponseAnswerFormat *)self parentObjectID];
  id v7 = [v4 select:v5 identity:v6];

  LOBYTE(v6) = [v7 canCopyToDatabase:v4];
  return (char)v6;
}

+ (id)recordType
{
  return @"CLSOpenResponseAnswerFormat";
}

- (id)initWithCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"type"];
  if (v5)
  {
    uint64_t v6 = CLSOpenResponseTypeFromString();
    id v7 = [v4 objectForKeyedSubscript:@"teacherProvidedText"];
    v8 = [v4 objectForKeyedSubscript:@"minimumTextLength"];
    id v9 = [v8 integerValue];

    v10 = [v4 objectForKeyedSubscript:@"maximumTextLength"];
    id v11 = [v10 integerValue];

    v12 = [(CLSOpenResponseAnswerFormat *)self initWithType:v6 starterText:v7 minimumLength:v9 maximumLength:v11];
    objc_super v13 = v12;
    if (v12)
    {
      [(CLSOpenResponseAnswerFormat *)v12 _initCommonPropsWithRecord:v4];
      CFStringRef v14 = [v4 objectForKeyedSubscript:@"allowsMultimedia"];
      -[CLSOpenResponseAnswerFormat setAllowsMultimedia:](v13, "setAllowsMultimedia:", [v14 BOOLValue]);
    }
    self = v13;

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)populate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSOpenResponseAnswerFormat;
  id v4 = a3;
  [(CLSOpenResponseAnswerFormat *)&v10 populate:v4];
  [(CLSOpenResponseAnswerFormat *)self type];
  uint64_t v5 = NSStringFromOpenResponseType();
  [v4 setObject:v5 forKeyedSubscript:@"type"];

  uint64_t v6 = [(CLSOpenResponseAnswerFormat *)self teacherProvidedText];
  [v4 setObject:v6 forKeyedSubscript:@"teacherProvidedText"];

  id v7 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self minimumTextLength]];
  [v4 setObject:v7 forKeyedSubscript:@"minimumTextLength"];

  v8 = +[NSNumber numberWithInteger:[(CLSOpenResponseAnswerFormat *)self maximumTextLength]];
  [v4 setObject:v8 forKeyedSubscript:@"maximumTextLength"];

  id v9 = +[NSNumber numberWithBool:[(CLSOpenResponseAnswerFormat *)self allowsMultimedia]];
  [v4 setObject:v9 forKeyedSubscript:@"allowsMultimedia"];

  [(CLSOpenResponseAnswerFormat *)self updateParentReferencesForRecord:v4];
}

- (int64_t)syncBackend:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSOpenResponseAnswerFormat *)self parentObjectID];
  if (v5)
  {
    uint64_t v6 = [v4 select:objc_opt_class() identity:v5];
    id v7 = v6;
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

@end