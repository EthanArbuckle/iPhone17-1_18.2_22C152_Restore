@interface CN(CNObjectValidation)
@end

@implementation CN(CNObjectValidation)

+ (void)areValidKeyPaths:()CNObjectValidation forObject:expectedClasses:allowNil:error:.cold.1()
{
  __assert_rtn("+[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:]", "CNObjectValidation.m", 21, "[keyPaths count] == [allowNilArray count]");
}

+ (void)areValidKeyPaths:()CNObjectValidation forObject:expectedClasses:allowNil:error:.cold.2()
{
  __assert_rtn("+[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:]", "CNObjectValidation.m", 20, "[keyPaths count] == [expectedClasses count]");
}

@end