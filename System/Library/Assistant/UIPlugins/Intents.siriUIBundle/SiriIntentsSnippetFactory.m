@interface SiriIntentsSnippetFactory
- (id)viewControllerForSnippet:(id)a3 error:(id *)a4;
@end

@implementation SiriIntentsSnippetFactory

- (id)viewControllerForSnippet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = objc_alloc_init(SiriIntentsSnippetViewController);
  }
  else if (a4)
  {
    id v8 = +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:100 userInfo:0];
    v7 = 0;
    *a4 = v8;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end