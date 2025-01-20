@interface PDDeletedObjectSurveyID
+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5;
+ (NSString)entityName;
+ (NSString)identityColumnName;
- (PDDatabaseValue)identityValue;
- (PDDeletedObjectSurveyID)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDeletedObjectSurveyID

+ (NSString)entityName
{
  return (NSString *)@"PDDeletedObjectSurveyID";
}

- (PDDeletedObjectSurveyID)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v11.receiver = self;
  v11.super_class = (Class)PDDeletedObjectSurveyID;
  v5 = [(PDDeletedObjectSurveyID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"objectID");
    objectID = v5->_objectID;
    v5->_objectID = (NSString *)v6;

    uint64_t v8 = sub_100003BF0(v4, @"surveyID");
    surveyID = v5->_surveyID;
    v5->_surveyID = (NSString *)v8;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  objectID = self->_objectID;
  id v5 = a3;
  sub_10008C524((uint64_t)v5, objectID, @"objectID");
  sub_10008C524((uint64_t)v5, self->_surveyID, @"surveyID");
}

+ (BOOL)migrateFromVersion:(unint64_t)a3 finalVersion:(unint64_t *)a4 inDatabase:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3) {
    goto LABEL_2;
  }
  if (sub_100007540(v7, @"create table PDDeletedObjectSurveyID (\n    objectID text not null,\n    surveyID text not null\n)\n", 0, 0, 0))
  {
    LOBYTE(a3) = 0;
    if (sub_100007540(v8, @"create unique index PDDeletedObjectSurveyID_objectID on PDDeletedObjectSurveyID (objectID)", 0, 0, 0))
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
  objc_storeStrong((id *)&self->_surveyID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end