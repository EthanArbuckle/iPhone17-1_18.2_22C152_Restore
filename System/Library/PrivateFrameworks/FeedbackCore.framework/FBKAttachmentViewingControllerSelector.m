@interface FBKAttachmentViewingControllerSelector
+ (BOOL)fallbackToOpaqueViewer;
+ (id)_opaqueVCWithItem:(id)a3;
+ (id)controllerForAttachment:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5;
+ (id)controllerForItem:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5;
+ (id)controllerForUrl:(id)a3 useFallback:(BOOL)a4 useRedesign:(BOOL)a5 deleteHandler:(id)a6;
+ (id)controllerForUrl:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5;
+ (id)displayNameForAttachment:(id)a3;
+ (id)imageControllerForAttachment:(id)a3;
+ (void)_setControllerTitle:(id)a3 attachment:(id)a4;
+ (void)_setControllerTitle:(id)a3 dedItem:(id)a4;
+ (void)_setControllerTitle:(id)a3 url:(id)a4;
@end

@implementation FBKAttachmentViewingControllerSelector

+ (BOOL)fallbackToOpaqueViewer
{
  return 1;
}

+ (id)controllerForAttachment:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 hasGroup])
  {
    v10 = [v8 group];
    if (v6) {
      v11 = [[FBKAnnotatedFileBrowserTableViewController alloc] initWithGroupAttachment:v8];
    }
    else {
      v11 = [[FBKBugFormFileBrowserTableViewController alloc] initWithGroup:v10];
    }
  }
  else
  {
    v10 = [v8 item];
    v11 = [a1 controllerForItem:v10 useRedesign:v6 deleteHandler:v9];
  }
  v12 = v11;

  if (v12)
  {
LABEL_9:
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([a1 fallbackToOpaqueViewer])
  {
    v13 = [v8 item];
    v12 = [a1 _opaqueVCWithItem:v13];

    goto LABEL_9;
  }
  v12 = 0;
  if (v6) {
LABEL_10:
  }
    [a1 _setControllerTitle:v12 attachment:v8];
LABEL_11:

  return v12;
}

+ (id)controllerForItem:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (+[FBKOpaqueFileViewController shouldDisplayItem:v8])
    {
      v10 = [a1 _opaqueVCWithItem:v8];
      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
      v12 = [v8 attachedPath];
      v10 = [a1 controllerForUrl:v12 useFallback:0 useRedesign:v6 deleteHandler:v9];

      if (v10) {
        goto LABEL_11;
      }
    }
    if ([a1 fallbackToOpaqueViewer])
    {
      v10 = [a1 _opaqueVCWithItem:v8];
LABEL_11:
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    v10 = 0;
    if (v6) {
LABEL_12:
    }
      [a1 _setControllerTitle:v10 dedItem:v8];
  }
  else
  {
    v11 = +[FBKLog appHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[FBKAttachmentViewingControllerSelector controllerForItem:useRedesign:deleteHandler:](v11);
    }

    v10 = 0;
  }
LABEL_13:

  return v10;
}

+ (id)controllerForUrl:(id)a3 useRedesign:(BOOL)a4 deleteHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [a1 controllerForUrl:v8 useFallback:1 useRedesign:v6 deleteHandler:a5];
  if (v6) {
    [a1 _setControllerTitle:v9 url:v8];
  }

  return v9;
}

+ (id)imageControllerForAttachment:(id)a3
{
  id v3 = a3;
  if (([v3 hasGroup] & 1) == 0)
  {
    v4 = [v3 item];
    if (v4)
    {
      v5 = v4;
      BOOL v6 = [v4 attachedPath];
      BOOL v7 = +[FBKImageAttachmentViewController canDisplayURL:v6];

      if (v7)
      {
        id v8 = [MEMORY[0x263F82C28] mainStoryboard];
        id v9 = [v8 instantiateViewControllerWithIdentifier:@"FBKImageAttachmentViewController"];
        v10 = [v5 attachedPath];
        [v9 setImageUrl:v10];
      }
      else
      {
        id v9 = 0;
      }

      goto LABEL_11;
    }
    v11 = +[FBKLog appHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[FBKAttachmentViewingControllerSelector controllerForItem:useRedesign:deleteHandler:](v11);
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

+ (id)controllerForUrl:(id)a3 useFallback:(BOOL)a4 useRedesign:(BOOL)a5 deleteHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = [MEMORY[0x263F82C28] mainStoryboard];
  if (+[FBKOSLogViewController canDisplayURL:v10])
  {
    id v13 = [v12 instantiateViewControllerWithIdentifier:@"FBKOSLogViewController"];
    [v13 setOSLogURL:v10];
    if (v13) {
      goto LABEL_32;
    }
  }
  else if (+[FBKSqliteIndexViewController canDisplayURL:v10])
  {
    v14 = [v12 instantiateViewControllerWithIdentifier:@"FBKSqliteIndexViewController"];
    v15 = +[FBKSqliteIndexViewController dbUrlForMetadataUrl:v10];
    if (v15)
    {
      [v14 setDbUrl:v15];
      id v13 = v14;
    }
    else
    {
      id v13 = 0;
    }

    if (v13) {
      goto LABEL_32;
    }
  }
  else if (+[FBKPowerLogIndexViewController canDisplayURL:v10])
  {
    id v13 = [v12 instantiateViewControllerWithIdentifier:@"FBKPowerLogViewController"];
    [v13 setPowerLogURL:v10];
    if (v13) {
      goto LABEL_32;
    }
  }
  else if (+[FBKBugFormAttachmentPreview canPreviewItem:v10])
  {
    if (+[FBKBugFormAttachmentPreview urlPointsToTextFile:v10])
    {
      uint64_t v16 = +[FBKBugFormAttachmentPreview textFileForURL:v10];

      id v10 = (id)v16;
    }
    if (v7)
    {
      v17 = [[FBKAttachmentViewerViewController alloc] initWithURL:v10 deleteHandler:v11];
    }
    else
    {
      v17 = [MEMORY[0x263F6BCB0] interactionControllerWithURL:v10];
    }
    id v13 = v17;
    if (v17) {
      goto LABEL_32;
    }
  }
  id v25 = 0;
  int v18 = [v10 getResourceValue:&v25 forKey:*MEMORY[0x263EFF6A8] error:0];
  id v19 = v25;
  v20 = v19;
  if (!v18 || ![v19 BOOLValue])
  {

LABEL_27:
    v22 = +[FBKLog appHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v10;
      __int16 v28 = 1024;
      BOOL v29 = v8;
      _os_log_impl(&dword_22A36D000, v22, OS_LOG_TYPE_INFO, "Cannot display file [%{public}@], will fallback to opaque controller %d", buf, 0x12u);
    }

    if (v8)
    {
      v23 = [MEMORY[0x263F3A120] itemWithURL:v10];
      id v13 = [a1 _opaqueVCWithItem:v23];
    }
    else
    {
      id v13 = 0;
    }
    goto LABEL_32;
  }
  v21 = off_264873438;
  if (!v7) {
    v21 = off_2648734B8;
  }
  id v13 = (id)[objc_alloc(*v21) initWithUrl:v10];

  if (!v13) {
    goto LABEL_27;
  }
LABEL_32:

  return v13;
}

+ (id)_opaqueVCWithItem:(id)a3
{
  id v3 = (void *)MEMORY[0x263F82C28];
  id v4 = a3;
  v5 = [v3 mainStoryboard];
  BOOL v6 = [v5 instantiateViewControllerWithIdentifier:@"FBKOpaqueFileViewController"];
  [v6 setItem:v4];

  return v6;
}

+ (void)_setControllerTitle:(id)a3 dedItem:(id)a4
{
  id v6 = a3;
  FBKAttachmentFromItem(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setControllerTitle:v6 attachment:v7];
}

+ (void)_setControllerTitle:(id)a3 url:(id)a4
{
  id v6 = a3;
  FBKAttachmentFromURL((uint64_t)a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setControllerTitle:v6 attachment:v7];
}

+ (void)_setControllerTitle:(id)a3 attachment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v9;
    BOOL v8 = [a1 displayNameForAttachment:v6];
    [v7 setTitle:v8];
  }
}

+ (id)displayNameForAttachment:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_annotation);
  if (v4)
  {
    id v5 = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    id v5 = objc_msgSend(v3, sel_displayName);
    sub_22A4B3458();
  }

  id v6 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return v6;
}

+ (void)controllerForItem:(os_log_t)log useRedesign:deleteHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "item is nil in _controllerForItem", v1, 2u);
}

@end