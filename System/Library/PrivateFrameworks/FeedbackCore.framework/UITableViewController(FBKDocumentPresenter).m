@interface UITableViewController(FBKDocumentPresenter)
- (double)documentInteractionControllerRectForPreview:()FBKDocumentPresenter;
- (id)documentInteractionControllerViewForPreview:()FBKDocumentPresenter;
- (uint64_t)presentAttachment:()FBKDocumentPresenter fromIndexPath:;
- (void)documentInteractionControllerDidEndPreview:()FBKDocumentPresenter;
- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:;
- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:;
- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:;
@end

@implementation UITableViewController(FBKDocumentPresenter)

- (uint64_t)presentAttachment:()FBKDocumentPresenter fromIndexPath:
{
  return [a1 presentAttachment:a3 fromIndexPath:a4 useRedesign:0 deleteHandler:0];
}

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:
{
  id v10 = a4;
  v11 = +[FBKAttachmentViewingControllerSelector controllerForAttachment:a3 useRedesign:a5 deleteHandler:a6];
  if (!v11)
  {
    v14 = +[FBKLog appHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[UITableViewController(FBKDocumentPresenter) presentAttachment:fromIndexPath:useRedesign:deleteHandler:](v14);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [a1 navigationController];
    [v14 pushViewController:v11 animated:1];
LABEL_9:

    goto LABEL_10;
  }
  v12 = +[FBKLog appHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[UITableViewController(FBKDocumentPresenter) presentAttachment:fromIndexPath:useRedesign:deleteHandler:](v12);
  }

  id v13 = v11;
  [v13 setDelegate:a1];
  [v13 setAnnotation:v10];
  [v13 presentPreviewAnimated:1];

LABEL_10:
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[FBKAttachmentViewingControllerSelector imageControllerForAttachment:v10];
  if (v13)
  {
    v14 = +[FBKLog appHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[UITableViewController(FBKDocumentPresenter) presentAttachmentWithImagePush:fromIndexPath:useRedesign:deleteHandler:](v14);
    }

    v15 = [a1 navigationController];
    [v15 pushViewController:v13 animated:1];
  }
  else
  {
    [a1 presentAttachment:v10 fromIndexPath:v11 useRedesign:a5 deleteHandler:v12];
  }
}

- (void)documentInteractionControllerDidEndPreview:()FBKDocumentPresenter
{
  id v4 = a3;
  id v6 = [a1 tableView];
  v5 = [v4 annotation];

  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (double)documentInteractionControllerRectForPreview:()FBKDocumentPresenter
{
  id v4 = a3;
  v5 = [a1 tableView];
  id v6 = [v4 annotation];

  v7 = [v5 cellForRowAtIndexPath:v6];

  [v7 frame];
  double v9 = v8;

  return v9;
}

- (id)documentInteractionControllerViewForPreview:()FBKDocumentPresenter
{
  id v4 = a3;
  v5 = [a1 tableView];
  id v6 = [v4 annotation];

  v7 = [v5 cellForRowAtIndexPath:v6];

  return v7;
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:
{
  v0 = +[FBKLog appHandle];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    -[UITableViewController(FBKDocumentPresenter) presentAttachmentWithImagePush:fromIndexPath:](v0);
  }
}

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "unknown file type given, cannot display it", v1, 2u);
}

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "will display document", v1, 2u);
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:useRedesign:deleteHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "will display image", v1, 2u);
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  v2 = "-[UITableViewController(FBKDocumentPresenter) presentAttachmentWithImagePush:fromIndexPath:]";
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "[%{public}s Not supported", (uint8_t *)&v1, 0xCu);
}

@end