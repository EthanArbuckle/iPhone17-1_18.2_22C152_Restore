@interface BSStackFrameInfo
- (NSString)className;
- (NSString)executableName;
- (NSString)executablePath;
- (NSString)functionName;
- (id)description;
- (unint64_t)address;
@end

@implementation BSStackFrameInfo

- (NSString)executableName
{
  return [(NSString *)self->_executablePath lastPathComponent];
}

- (NSString)className
{
  return self->_className;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  v4 = [(BSStackFrameInfo *)self executableName];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  id v6 = (id)[v3 appendObject:self->_className withName:@"class"];
  id v7 = (id)[v3 appendObject:self->_functionName withName:@"function"];
  v8 = [v3 build];

  return v8;
}

- (unint64_t)address
{
  return self->_address;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_realFunctionName, 0);
}

@end