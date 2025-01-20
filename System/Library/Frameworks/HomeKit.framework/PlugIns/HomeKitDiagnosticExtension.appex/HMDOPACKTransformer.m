@interface HMDOPACKTransformer
+ (BOOL)isStructuredDataCompatible;
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
- (id)OPACKFromValue:(id)a3 error:(id *)a4;
- (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDOPACKTransformer

- (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_13;
  }
  if (qword_100036C68 != -1) {
    dispatch_once(&qword_100036C68, &stru_10002C968);
  }
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 == qword_100036C28
    || v6 == qword_100036C30
    || v6 == qword_100036C38
    || v6 == qword_100036C40
    || v6 == qword_100036C48
    || v6 == qword_100036C50
    || v6 == qword_100036C58
    || v6 == qword_100036C60)
  {

    goto LABEL_16;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_16:
    v8 = [(id)objc_opt_class() valueFromOPACK:v5 error:a4];
    goto LABEL_18;
  }
LABEL_13:
  if (a4)
  {
    +[NSError hmfErrorWithCode:3 reason:@"Expected OPACK-compatible value"];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = objc_opt_class();
  id v7 = [v6 valueClass];
  if (objc_opt_isKindOfClass())
  {
    a4 = [v6 OPACKFromValue:v5 error:a4];
  }
  else if (a4)
  {
    v8 = +[NSString stringWithFormat:@"Expected %@", v7];
    *a4 = +[NSError hmfErrorWithCode:3 reason:v8];

    a4 = 0;
  }

  return a4;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeID v6 = NSStringFromSelector(a2);
  id v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = (void *)OPACKDecodeData();
  if (a4)
  {
    id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6705 userInfo:0];
    *a4 = v6;

    a4 = 0;
  }

  return a4;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "OPACKFromValue:error:", a3);
  if (v5)
  {
    Data = (void *)OPACKEncoderCreateData();
    if (a4)
    {
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain);
      id v7 = objc_claimAutoreleasedReturnValue();
      *a4 = v7;
    }
  }

  return 0;
}

+ (BOOL)isStructuredDataCompatible
{
  return 1;
}

+ (Class)valueClass
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[HMDOPACKTransformer allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___HMDOPACKTransformer;
    return objc_msgSendSuper2(&v6, "allocWithZone:", a3);
  }
}

@end