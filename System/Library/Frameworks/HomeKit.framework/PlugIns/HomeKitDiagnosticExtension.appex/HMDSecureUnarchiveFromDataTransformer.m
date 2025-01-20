@interface HMDSecureUnarchiveFromDataTransformer
+ (BOOL)isEncodedNilValue:(id)a3;
+ (id)allowedTopLevelClasses;
- (id)transformedValue:(id)a3;
@end

@implementation HMDSecureUnarchiveFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (+[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:v4])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDSecureUnarchiveFromDataTransformer;
    v5 = [(HMDSecureUnarchiveFromDataTransformer *)&v7 transformedValue:v4];
  }

  return v5;
}

+ (BOOL)isEncodedNilValue:(id)a3
{
  id v3 = a3;
  if (qword_100036CB0 != -1) {
    dispatch_once(&qword_100036CB0, &stru_10002C9E8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v4 = [v3 length], v4 == (id)qword_100036CA0))
  {
    v5 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id v6 = [v5 count], v6 == objc_msgSend((id)qword_100036CA8, "count")))
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 1;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100014DB4;
      v9[3] = &unk_10002CA10;
      v9[4] = &v10;
      [v5 enumerateKeysAndObjectsUsingBlock:v9];
      BOOL v7 = *((unsigned char *)v11 + 24) != 0;
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)allowedTopLevelClasses
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_100036C90 != -1) {
      dispatch_once(&qword_100036C90, &stru_10002C9C8);
    }
    id v3 = (id)qword_100036C98;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___HMDSecureUnarchiveFromDataTransformer;
    objc_msgSendSuper2(&v5, "allowedTopLevelClasses");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end