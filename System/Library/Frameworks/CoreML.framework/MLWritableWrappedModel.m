@interface MLWritableWrappedModel
+ (id)wrapperAroundWritableModel:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
@end

@implementation MLWritableWrappedModel

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLWrappedModel *)self innerModel];

  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    v14 = [(MLWrappedModel *)self reason];
    id v15 = [v13 exceptionWithName:@"IllegalOperation" reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  v8 = [(MLWrappedModel *)self innerModel];
  char v9 = [v8 conformsToProtocol:&unk_1EF1246F0];

  if ((v9 & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"InternalError" reason:@"MLModel does not conform to MLWritable" userInfo:0];
    objc_exception_throw(v16);
  }
  v10 = [(MLWrappedModel *)self innerModel];
  char v11 = [v10 writeToURL:v6 error:a4];

  return v11;
}

+ (id)wrapperAroundWritableModel:(id)a3
{
  id v3 = a3;
  v4 = [(MLWrappedModel *)[MLWritableWrappedModel alloc] initWithInnerModel:v3];

  return v4;
}

@end