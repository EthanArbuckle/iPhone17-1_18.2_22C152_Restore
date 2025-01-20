@interface CPLPlatformObject
- (CPLAbstractObject)abstractObject;
- (CPLPlatformObject)init;
- (CPLPlatformObject)initWithAbstractObject:(id)a3;
- (id)description;
@end

@implementation CPLPlatformObject

- (void).cxx_destruct
{
}

- (CPLAbstractObject)abstractObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_abstractObject);
  return (CPLAbstractObject *)WeakRetained;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (CPLPlatformObject)initWithAbstractObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPlatformObject;
  v5 = [(CPLPlatformObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_abstractObject, v4);
  }

  return v6;
}

- (CPLPlatformObject)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:22 description:@"Should not use -init method but -initWithAbstractObject:"];

  abort();
}

@end