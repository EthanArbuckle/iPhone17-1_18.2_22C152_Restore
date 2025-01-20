@interface ENTTransportException
+ (id)exceptionWithReason:(id)a3;
+ (id)exceptionWithReason:(id)a3 error:(id)a4;
@end

@implementation ENTTransportException

+ (id)exceptionWithReason:(id)a3
{
  return (id)[a1 exceptionWithReason:a3 error:0];
}

+ (id)exceptionWithReason:(id)a3 error:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v13 = @"error";
    v14[0] = v7;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ENTTransportException;
  v10 = objc_msgSendSuper2(&v12, sel_exceptionWithName_reason_userInfo_, @"TTransportException", v6, v9);

  return v10;
}

@end