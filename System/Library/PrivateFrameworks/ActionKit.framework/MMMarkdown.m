@interface MMMarkdown
+ (id)HTMLStringWithMarkdown:(id)a3 error:(id *)a4;
+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 error:(id *)a5;
+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 fromSelector:(SEL)a5 error:(id *)a6;
@end

@implementation MMMarkdown

+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 fromSelector:(SEL)a5 error:(id *)a6
{
  id v9 = a3;
  if (!v9)
  {
    v16 = NSString;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = NSStringFromSelector(a5);
    uint64_t v20 = [v16 stringWithFormat:@"[%@ %@]: nil argument for markdown", v18, v19];

    id v21 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  v10 = v9;
  if ([v9 length])
  {
    v11 = [[MMParser alloc] initWithExtensions:a4];
    v12 = objc_opt_new();
    v13 = [(MMParser *)v11 parseMarkdown:v10 error:a6];
    v14 = [v12 generateHTML:v13];
  }
  else
  {
    v14 = &stru_26F008428;
  }

  return v14;
}

+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 error:(id *)a5
{
  return (id)[a1 HTMLStringWithMarkdown:a3 extensions:a4 fromSelector:a2 error:a5];
}

+ (id)HTMLStringWithMarkdown:(id)a3 error:(id *)a4
{
  return (id)[a1 HTMLStringWithMarkdown:a3 extensions:0 fromSelector:a2 error:a4];
}

@end