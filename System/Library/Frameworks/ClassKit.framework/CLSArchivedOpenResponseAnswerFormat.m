@interface CLSArchivedOpenResponseAnswerFormat
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (id)entityName;
+ (int64_t)migrationOrder;
- (id)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation CLSArchivedOpenResponseAnswerFormat

+ (id)entityName
{
  return @"CLSArchivedOpenResponseAnswerFormat";
}

- (id)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  id v5 = [(CLSArchivedOpenResponseAnswerFormat *)self _init];
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
  return v6;
}

- (void)bindTo:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CLSArchivedOpenResponseAnswerFormat;
  id v4 = a3;
  [(CLSArchivedOpenResponseAnswerFormat *)&v13 bindTo:v4];
  CFStringRef v14 = @"appIdentifier";
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v13.receiver, v13.super_class);
  sub_10008C5D0((uint64_t)v4, v5);

  v6 = [(CLSArchivedOpenResponseAnswerFormat *)self parentObjectID];
  sub_10008C524((uint64_t)v4, v6, @"parentObjectID");

  v7 = +[NSNumber numberWithInteger:[(CLSArchivedOpenResponseAnswerFormat *)self answerFormatType]];
  sub_10008C524((uint64_t)v4, v7, @"answerFormatType");

  v8 = +[NSNumber numberWithInteger:[(CLSArchivedOpenResponseAnswerFormat *)self maximumTextLength]];
  sub_10008C524((uint64_t)v4, v8, @"maximumTextLength");

  v9 = +[NSNumber numberWithInteger:[(CLSArchivedOpenResponseAnswerFormat *)self minimumTextLength]];
  sub_10008C524((uint64_t)v4, v9, @"minimumTextLength");

  v10 = [(CLSArchivedOpenResponseAnswerFormat *)self teacherProvidedText];
  sub_10008C524((uint64_t)v4, v10, @"teacherProvidedText");

  v11 = +[NSNumber numberWithInteger:[(CLSArchivedOpenResponseAnswerFormat *)self type]];
  sub_10008C524((uint64_t)v4, v11, @"type");

  v12 = +[NSNumber numberWithBool:[(CLSArchivedOpenResponseAnswerFormat *)self allowsMultimedia]];
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
  if (sub_100007540(v7, @"create table CLSArchivedOpenResponseAnswerFormat (\n    objectID          text not null,\n    parentObjectID    text not null,\n    dateCreated       real not null,\n    dateLastModified  real not null,\n    type                  integer,\n    answerFormatType      integer,\n    maximumTextLength     integer,\n    minimumTextLength     integer,\n    teacherProvidedText   text,\nforeign key (parentObjectID) references CLSArchivedQuestionStep(objectID) on delete cascade on update cascade\n)", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index if not exists CLSArchivedOpenResponseAnswerFormat_objectID on CLSArchivedOpenResponseAnswerFormat (objectID)", 0, 0, 0))
    {
      LOBYTE(a3) = 0;
      if (sub_100007540(v8, @"create index if not exists CLSArchivedOpenResponseAnswerFormat_parentObjectID on CLSArchivedOpenResponseAnswerFormat (parentObjectID)", 0, 0, 0))
      {
LABEL_6:
        LOBYTE(a3) = 0;
        if (sub_100007540(v8, @"alter table CLSArchivedOpenResponseAnswerFormat add column allowsMultimedia integer", 0, 0, 0))
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

@end