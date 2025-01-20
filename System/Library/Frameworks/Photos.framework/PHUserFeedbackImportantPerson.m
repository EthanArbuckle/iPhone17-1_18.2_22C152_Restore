@interface PHUserFeedbackImportantPerson
- (NSString)personUUID;
- (PHUserFeedbackImportantPerson)initWithPersonUUID:(id)a3 type:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation PHUserFeedbackImportantPerson

- (void).cxx_destruct
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)personUUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PHUserFeedbackImportantPerson)initWithPersonUUID:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHUserFeedbackImportantPerson;
  v8 = [(PHUserFeedbackImportantPerson *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_personUUID, a3);
    v9->_type = a4;
  }

  return v9;
}

@end