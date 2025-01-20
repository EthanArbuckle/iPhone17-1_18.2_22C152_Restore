@interface DDRemotePersonViewControllerProvider
- (void)createViewControllerWithCompletionHandler:(id)a3;
@end

@implementation DDRemotePersonViewControllerProvider

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(DDRemotePersonViewControllerProvider *)self actionContext];
  id v6 = [v5 result];
  v7 = [(DDRemotePersonViewControllerProvider *)self actionContext];
  v8 = [v7 URL];
  v9 = [(DDRemotePersonViewControllerProvider *)self actionContext];
  v10 = [v9 associatedVisualResults];
  v11 = sub_100007EF8((uint64_t)v6, v8, v10, 0);

  v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];
  v13 = +[CNAvatarCardController previewHeaderViewControllerForContacts:v12];

  v4[2](v4, v13);
}

- (void).cxx_destruct
{
}

@end